From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Wed, 18 Apr 2018 12:17:36 +0200 (CEST)
Subject: [Buildroot] Rust runtime tests issues
In-Reply-To: <20180417150658.5dd5b4cc@windsurf.numericable.fr>
Message-ID: <779874370.225301500.1524046656503.JavaMail.root@zimbra32-e6.priv.proxad.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

> The Rust tests in support/testing/ are consistently failing:
> 
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/63334941
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/63334942
> 
> Do you think you could have a look, and see what's not working, and fix
> those tests ?

The build 63334942 fails as follow:

======================================================================
ERROR: test_run (tests.package.test_rust.TestRustBin)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/builds/buildroot.org/buildroot/support/testing/tests/package/test_rust.py", line 80, in test_run
    self.build_test_prog()
  File "/builds/buildroot.org/buildroot/support/testing/tests/package/test_rust.py", line 39, in build_test_prog
    raise SystemError("Cargo init failed")
SystemError: Cargo init failed```
```

The exception is raised because the execution of the command to 
create a dummy test program "hello-world", with the previously built
version of host-cargo, fails.

From the file TestRustBin-build.log found in the artifacts.zip of job
63334942, we can see:

```
error: Failed to create project `hello-world` at `/tmp/tmpOEzb1U-br2-testing-rust/hello-world`                                                                                                 
                                                                                                                                                                                               
Caused by:                                                                                                                                                                                     
  could not determine the current user, please set $USER 
```

As the run-time test on CI apparently runs through Docker, should some setup 
related to $USER be added to it?

--
ELB
