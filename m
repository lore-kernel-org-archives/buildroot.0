From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue, 24 Apr 2018 23:37:49 +0200
Subject: [Buildroot] Rust runtime tests issues
In-Reply-To: <779874370.225301500.1524046656503.JavaMail.root@zimbra32-e6.priv.proxad.net>
References: <20180417150658.5dd5b4cc@windsurf.numericable.fr>
 <779874370.225301500.1524046656503.JavaMail.root@zimbra32-e6.priv.proxad.net>
Message-ID: <20180424213749.GA10466@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2018-04-18 12:17, Eric Le Bihan wrote:
> Hi!
>
> > The Rust tests in support/testing/ are consistently failing:
> >
> >   https://gitlab.com/buildroot.org/buildroot/-/jobs/63334941
> >   https://gitlab.com/buildroot.org/buildroot/-/jobs/63334942
> >
> > Do you think you could have a look, and see what's not working, and fix
> > those tests ?
>
> The build 63334942 fails as follow:
>
> ======================================================================
> ERROR: test_run (tests.package.test_rust.TestRustBin)
> ----------------------------------------------------------------------
> Traceback (most recent call last):
>   File "/builds/buildroot.org/buildroot/support/testing/tests/package/test_rust.py", line 80, in test_run
>     self.build_test_prog()
>   File "/builds/buildroot.org/buildroot/support/testing/tests/package/test_rust.py", line 39, in build_test_prog
>     raise SystemError("Cargo init failed")
> SystemError: Cargo init failed```
> ```
>
> The exception is raised because the execution of the command to
> create a dummy test program "hello-world", with the previously built
> version of host-cargo, fails.
>
> From the file TestRustBin-build.log found in the artifacts.zip of job
> 63334942, we can see:
>
> ```
> error: Failed to create project `hello-world` at `/tmp/tmpOEzb1U-br2-testing-rust/hello-world`
>
> Caused by:
>   could not determine the current user, please set $USER
> ```
>
> As the run-time test on CI apparently runs through Docker, should some setup
> related to $USER be added to it?

I built the Docker image using support/docker/Dockerfile.

Running 'docker run buildroot printenv' shows that only $HOME is
defined. To define $USER to br-user and make cargo happy, should Docker
be invoked with "-e USER=br-user" or should it be best to patch
support/testing/tests/package/test_rust.py to add it to the environment
when calling subprocess.call()?

Regards,

--
ELB
