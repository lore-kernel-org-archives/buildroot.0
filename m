From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 12:59:59 +0200
Subject: [Buildroot] [PATCH 2/3] testing/tests/package/test_python:
 refactor to support better code reuse
In-Reply-To: <20170704185807.27189-2-andrew.smirnov@gmail.com>
References: <20170704185807.27189-1-andrew.smirnov@gmail.com>
 <20170704185807.27189-2-andrew.smirnov@gmail.com>
Message-ID: <20170705125959.09d059bc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The commit title should mention that a test for Python 3 is added. Or
perhaps you could split this into two commits: one that does the
refactor but keeps only the Python 2 test. And one that only adds the
Python 3 test case on top of that.

On Tue,  4 Jul 2017 11:58:06 -0700, Andrey Smirnov wrote:
> Refactor TestPythonBase class in the following ways:
> 
> 	 - Split single test_run() function into multiple smaller once
>            to allow derivative classes to mix and match what they want
>            to test. Also avoid naming any of the functions starting
>            with "test_" to prevent nose2 from picking up
>            TestPythonBase class as a class that defines any unit
>            tests.
> 
> 	 - Allow derivative classes to specify QEMU/pexpect timeout in
>            login() method
> 
> 	 - Do not hardcode 'python' as a interpreter to use and
>            specify that via class variable 'interpreter'. This way
>            classes that inherit from TestPythonBase can override this
>            particualr aspect of the test code
> 
> 	 - Change code of libc related test to be both Python2 and
>            Python3 compliant so as to be usable for testing both
> 
> 	 - Create two derivative classes TestPython2 and TestPython3
>            that perform all of the tests specified in TestPythonBase
>            using Python2 and Python3 correspondingly

Why use such a huge indentation for the bullet list?


> -    def test_run(self):
> +    def login(self, timeout=5):
>          cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
>          self.emulator.boot(arch="armv5",
>                             kernel="builtin",
> -                           options=["-initrd", cpio_file])
> +                           options=["-initrd", cpio_file],
> +                           timeout)
>          self.emulator.login()
> -        cmd = "python --version 2>&1 | grep '^Python 2'"
> -        _, exit_code = self.emulator.run(cmd)
> -        self.assertEqual(exit_code, 0)

I'm not a big fan of having a method called .login() also start the
interpreter, it feels a bit weird.

> +class TestPython2(TestPythonBase):
> +    config = TestPythonBase.config + \
> +"""
> +BR2_PACKAGE_PYTHON=y
> +"""
> +    def test_run(self):
> +        self.login()
> +        self.version_test("Python 2")
> +        self.math_floor_test()
> +        self.libc_time_test()
> +        self.zlib_test()
> +
> +class TestPython3(TestPythonBase):
> +    config = TestPythonBase.config + \
> +"""
> +BR2_PACKAGE_PYTHON3=y
> +"""
> +    def test_run(self):
> +        self.login()
> +        self.version_test("Python 3")
> +        self.math_floor_test()
> +        self.libc_time_test()
> +        self.zlib_test()

This indeed looks really nice!

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
