From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 05 Mar 2017 18:30:01 -0300
Subject: [Buildroot] [PATCH v2 5/5] support/testing: add toolchain tests
References: <1488726201-6507-6-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <58bc8359882ea_6832a0cfd06544b@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni,

On Sun, Mar 05, 2017 at 12:03 PM, Thomas Petazzoni wrote:

[snip]
> +class TestExternalToolchain(infra.basetest.BRTest):

nose2 recognizes this as a test:
$ support/testing/run-tests --list 2>&1 | grep Toolchain | head -n1
test_run (tests.toolchain.test_external.TestExternalToolchain) ... ok

and it tries to run it when --all is used:
======================================================================
ERROR: test_run (tests.toolchain.test_external.TestExternalToolchain)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/testing-v2/support/testing/infra/basetest.py", line 56, in setUp
    self.b.build()
  File "/tmp/testing-v2/support/testing/infra/builder.py", line 23, in build
    cf.write(self.config)
TypeError: expected a string or other character buffer object

> +    def test_run(self):

I think you could avoid this by renaming this method ...

https://nose2.readthedocs.io/en/latest/usage.html#naming-tests
'Within test modules, nose2 will load tests from unittest.TestCase subclasses,
and from test functions (functions whose names begin with "test").'

... to something like this:
    def common_check(self):
...

> +        # Check for broken symlinks
> +        for d in ["lib", "usr/lib"]:
> +            path = os.path.join(self.builddir, "staging", d)
> +            self.assertFalse(check_broken_links(path))
> +            path = os.path.join(self.builddir, "target", d)
> +            self.assertFalse(check_broken_links(path))
> +
> +        interp = infra.get_elf_prog_interpreter(self.builddir,
> +                                                self.toolchain_prefix,
> +                                                "bin/busybox")
> +        interp_path = os.path.join(self.builddir, "target", interp[1:])
> +        self.assertTrue(os.path.exists(interp_path))
> +
> +class TestExternalToolchainSourceryArmv4(TestExternalToolchain):
> +    config = BASIC_CONFIG + \
> +"""
> +BR2_arm=y
> +BR2_arm920t=y
> +BR2_TOOLCHAIN_EXTERNAL=y
> +BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM=y
> +"""
> +    toolchain_prefix = "arm-none-linux-gnueabi"
> +
> +    def test_run(self):
> +        TestExternalToolchain.test_run(self)

... and changing all calls to something like this:
        self.common_check()

> +
> +        # Check the architecture variant
[snip]

Regards,
Ricardo
