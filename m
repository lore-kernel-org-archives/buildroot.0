From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 4 Feb 2019 16:52:33 +0100
Subject: [Buildroot] [PATCH v5 04/10] testing/tests/download: add git
 hash test
In-Reply-To: <20180512025833.22998-5-ricardo.martincoski@gmail.com>
References: <20180512025833.22998-1-ricardo.martincoski@gmail.com>
 <20180512025833.22998-5-ricardo.martincoski@gmail.com>
Message-ID: <3493f835-d2c0-5d07-b33a-9bfd746b57d8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Ricardo,

 I'll apply this today, but I have some comment...

On 12/05/2018 04:58, Ricardo Martincoski wrote:
[snip]
>  support/testing/tests/download/gitremote.py   |  44 ++++++++++++++++++
>  support/testing/tests/download/test_git.py    |  43 +++++++++++++++++

 flake8 says:

support/testing/tests/download/gitremote.py:5:1: I100 Import statements are in
the wrong order. 'import infra' should be before 'import pexpect' and in a
different group.
support/testing/tests/download/test_git.py:4:1: I100 Import statements are in
the wrong order. 'from gitremote import GitRemote' should be before 'import
infra' and in a different group.
support/testing/tests/download/test_git.py:4:1: I201 Missing newline between
import groups. 'from gitremote import GitRemote' is identified as Third Party
and 'import infra' is identified as Third Party.

 I fixed this while applying.

[snip]
> diff --git a/support/testing/tests/download/gitremote.py b/support/testing/tests/download/gitremote.py
> new file mode 100644
> index 0000000000..60bc49fbf8
> --- /dev/null
> +++ b/support/testing/tests/download/gitremote.py
> @@ -0,0 +1,44 @@
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
> +    def __init__(self, builddir, serveddir, logtofile):
> +        """
> +        Start a local git server.
> +
> +        In order to support test cases in parallel, select the port the
> +        server will listen to in runtime. Since there is no reliable way
> +        to allocate the port prior to starting the server (another
> +        process in the host machine can use the port between it is
> +        selected from a list and it is really allocated to the server)
> +        try to start the server in a port and in the case it is already
> +        in use, try the next one in the allowed range.
> +        """
> +        self.daemon = None
> +        self.port = None
> +        self.logfile = infra.open_log_file(builddir, "gitremote", logtofile)
> +
> +        daemon_cmd = ["git", "daemon", "--reuseaddr", "--verbose", "--listen=localhost", "--export-all",

 Line is too long. Fixed as well.

> +                      "--base-path={}".format(serveddir)]
> +        for port in range(GIT_REMOTE_PORT_INITIAL, GIT_REMOTE_PORT_LAST + 1):
> +            cmd = daemon_cmd + ["--port={port}".format(port=port)]
> +            self.logfile.write("> starting git remote with '{}'\n".format(" ".join(cmd)))
> +            self.daemon = pexpect.spawn(cmd[0], cmd[1:], logfile=self.logfile)
> +            ret = self.daemon.expect(["Ready to rumble",
> +                                      "Address already in use"])

 Shouldn't we add a timeout here, just to be safe?

 This can be fixed in a follow-up patch.

> +            if ret == 0:
> +                self.port = port
> +                return
> +        raise SystemError("Could not find a free port to run git remote")
> +
> +    def stop(self):
> +        if self.daemon is None:
> +            return
> +        self.daemon.terminate(force=True)
> diff --git a/support/testing/tests/download/test_git.py b/support/testing/tests/download/test_git.py
> new file mode 100644
> index 0000000000..14fc8e4da3
> --- /dev/null
> +++ b/support/testing/tests/download/test_git.py
> @@ -0,0 +1,43 @@
> +import os
> +
> +import infra
> +from gitremote import GitRemote
> +
> +
> +class GitTestBase(infra.basetest.BRTest):
> +    config = \
> +        """
> +        BR2_BACKUP_SITE=""
> +        """
> +    gitremotedir = infra.filepath("tests/download/git-remote")
> +    gitremote = None
> +
> +    def setUp(self):
> +        super(GitTestBase, self).setUp()
> +        self.gitremote = GitRemote(self.builddir, self.gitremotedir, self.logtofile)
> +
> +    def tearDown(self):
> +        self.show_msg("Cleaning up")
> +        if self.gitremote:
> +            self.gitremote.stop()
> +        if self.b and not self.keepbuilds:

 This is actually a bit useless, since self.b is not initialzed in
BRTest.__init__ you'll actually get either an exception or self.b evaluates to
True. But the same pattern is used in other places, so OK. Can be fixed in a
follow-up patch.

 Regards,
 Arnout

> +            self.b.delete()
> +
> +    def check_hash(self, package):
> +        # store downloaded tarball inside the output dir so the test infra
> +        # cleans it up at the end
> +        env = {"BR2_DL_DIR": os.path.join(self.builddir, "dl"),
> +               "GITREMOTE_PORT_NUMBER": str(self.gitremote.port)}
> +        self.b.build(["{}-dirclean".format(package),
> +                      "{}-source".format(package)],
> +                     env)
> +
> +
> +class TestGitHash(GitTestBase):
> +    br2_external = [infra.filepath("tests/download/br2-external/git-hash")]
> +
> +    def test_run(self):
> +        with self.assertRaises(SystemError):
> +            self.check_hash("bad")
> +        self.check_hash("good")
> +        self.check_hash("nohash")
> 
