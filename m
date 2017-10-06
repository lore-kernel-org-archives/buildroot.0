From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 6 Oct 2017 23:30:57 +0200
Subject: [Buildroot] [next v2 4/7] testing/tests/download: add infra for
	git tests
In-Reply-To: <20170826222056.6119-4-ricardo.martincoski@gmail.com>
References: <20161101193354.8716-2-ricardo.martincoski@datacom.ind.br>
 <20170826222056.6119-4-ricardo.martincoski@gmail.com>
Message-ID: <76b115b4-dd02-0443-ba92-0d331cc1f0d1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 I would personally have split the patches differently: include a very minimal
GitTestBase in the patch that adds the hash tests, then extend it with features
needed for the later tests.

On 27-08-17 00:20, Ricardo Martincoski wrote:
> From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
> 
> Add GitRemote class, that can start a git server in the host machine to
> emulate a remote git server under the control of the test.
> 
> Add a new base class, called GitTestBase, that inherits from BRTest and
> must be subclassed by all git test cases.
> Its setUp() method takes care of configuring the build with a
> br2-external, avoiding to hit http://sources.buildroot.net by using an
> empty BR2_BACKUP_SITE. It also avoids downloading not pre-installed
> dependencies (i.e. lzip) every time by calling 'make dependencies' using
> the common dl directory, and it instantiates the GitRemote object.
> Its tearDown() method cleans things up similarly to the one from BRTest.
> 
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
> ---
> Changes v1 -> v2:
>   - use git daemon + git:// instead of ssh (Arnout);
>   - remove __main__ handling since the test infra already does that;
>   - use the logging support from test infra;
>   - this patch is part of series 1/3 of a new version of
>     http://patchwork.ozlabs.org/patch/690097/
> ---
>  support/testing/tests/download/__init__.py  |  0

 These empty __init__.py files were removed at some point.

>  support/testing/tests/download/gitbase.py   | 41 +++++++++++++++++++++++
>  support/testing/tests/download/gitremote.py | 50 +++++++++++++++++++++++++++++
>  3 files changed, 91 insertions(+)
>  create mode 100644 support/testing/tests/download/__init__.py
>  create mode 100644 support/testing/tests/download/gitbase.py
>  create mode 100644 support/testing/tests/download/gitremote.py
> 
> diff --git a/support/testing/tests/download/__init__.py b/support/testing/tests/download/__init__.py
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/support/testing/tests/download/gitbase.py b/support/testing/tests/download/gitbase.py
> new file mode 100644
> index 0000000000..b259914c77
> --- /dev/null
> +++ b/support/testing/tests/download/gitbase.py
> @@ -0,0 +1,41 @@
> +import infra.basetest
> +from infra.builder import Builder
> +from gitremote import GitRemote
> +
> +
> +class GitTestBase(infra.basetest.BRTest):
> +    config = \
> +        """
> +        BR2_BACKUP_SITE=""
> +        """
> +    br2_external = None
> +    serveddir = None
> +    gitremote = None
> +    logfile = None
> +
> +    def setUp(self):
> +        self.show_msg("Starting")
> +        self.b = Builder(self.config, self.builddir, self.logtofile)
> +
> +        if not self.keepbuilds:
> +            self.b.delete()
> +
> +        if not self.b.is_finished():
> +            self.show_msg("Configuring")> +            self.b.configure(["BR2_EXTERNAL={}".format(self.br2_external)])

 I'm not at all happy with this, too much copying of the logic of BRTest. How
about this:

- configure extra options are a member (like self.config is) and gets picked up
by the base class.

- Base class stops after configure.

- The rest of BRTest goes into a new class RuntimeTestBase, which does the build
step in setUp and starts the emulator.

- RuntimeTestBase and GitTestBase call super().setUp(self) to extend the setUp
method. (Or however you do super() in Python2, it's different IIRC.)


 Note BTW that specifically BR2_EXTERNAL is typically passed in the environment,
not as an option. But it doesn't matter much.


 Perhaps we could even put the support for BR2_EXTERNAL directly in BRTest. It
would then of course have to depend on self.br2_external is not None.

> +            # do not download not pre-installed dependencies (i.e. lzip) every
> +            # time a test runs
> +            self.b.build(["dependencies"])

 Since we have only one test per class, this is anyway run every time, so
there's not much point I think.

> +
> +        self.gitremote = GitRemote(self.builddir, self.serveddir,
> +                                   self.logtofile)
> +        # send output from the test to the logfile created by GitRemote
> +        self.logfile = self.gitremote.logfile
> +        self.gitremote.start()

 Emulator starts directly from its __init__, perhaps the same should be done here?

> +
> +    def tearDown(self):
> +        self.show_msg("Cleaning up")
> +        if self.gitremote:
> +            self.gitremote.stop()
> +        if self.b and not self.keepbuilds:
> +            self.b.delete()

 Same here with super().tearDown(self) at the end.

> diff --git a/support/testing/tests/download/gitremote.py b/support/testing/tests/download/gitremote.py
> new file mode 100644
> index 0000000000..84d1036889
> --- /dev/null
> +++ b/support/testing/tests/download/gitremote.py
> @@ -0,0 +1,50 @@
> +# subprocess does not kill the child daemon when a test case fails by raising
> +# an exception. So use pexpect instead.
> +import pexpect
> +
> +import infra
> +
> +GIT_REMOTE_PORT_INITIAL = 9418
> +GIT_REMOTE_PORT_LAST = GIT_REMOTE_PORT_INITIAL + 99
> +
> +
> +class GitRemote(object):
> +
> +    def __init__(self, builddir, serveddir, logtofile):
> +        self.daemon = None
> +        self.port = None
> +        self.serveddir = serveddir
> +        self.logfile = infra.open_log_file(builddir, "run", logtofile)
> +
> +    # Start a local git server
> +    #
> +    # In order to support test cases in parallel, select the port the server
> +    # will listen to in runtime. Since there is no reliable way to allocate the
> +    # port prior to starting the server (another process in the host machine
> +    # can use the port between it is selected from a list and it is really
> +    # allocated to the server) try to start the server in a port and in the
> +    # case it is already in use, try the next one in the allowed range.
> +    #
> +    def start(self):
> +        daemon_cmd = ["git", "daemon", "--reuseaddr", "--verbose",
> +                      "--listen=localhost", "--export-all",
> +                      "--base-path={}".format(self.serveddir)]
> +        for port in range(GIT_REMOTE_PORT_INITIAL, GIT_REMOTE_PORT_LAST):
> +            port_arg = ["--port={}".format(port)]
> +            cmd = daemon_cmd + port_arg
> +            self.logfile.write("> starting git remote with '{}'\n"
> +                               .format(" ".join(cmd)))
> +            self.daemon = pexpect.spawn(cmd[0], cmd[1:], logfile=self.logfile)
> +            ret = self.daemon.expect(["Ready to rumble",
> +                                      "Address already in use"])
> +            if ret == 0:
> +                self.port = port
> +                break
> +            self.daemon.read()

 Maybe add a comment that explains why this is needed?

 Regards,
 Arnout

> +        if not self.port:
> +            raise SystemError("Could not find a free port to run git remote")
> +
> +    def stop(self):
> +        if self.daemon is None:
> +            return
> +        self.daemon.terminate(force=True)
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
