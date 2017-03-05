From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Mar 2017 17:27:04 +0100
Subject: [Buildroot] [PATCH v2 4/5] support/testing: add package tests
In-Reply-To: <1488726201-6507-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1488726201-6507-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1488726201-6507-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20170305162704.GJ3671@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-03-05 16:03 +0100, Thomas Petazzoni spake thusly:
> This commit adds some basic tests for two Buildroot packages: python and
> dropbear. These tests are by no mean meant to be exhaustive, but mainly
> to serve as initial examples for other tests.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  support/testing/tests/package/__init__.py      |  0
>  support/testing/tests/package/test_dropbear.py | 28 +++++++++++++++++++++
>  support/testing/tests/package/test_python.py   | 35 ++++++++++++++++++++++++++
>  3 files changed, 63 insertions(+)
>  create mode 100644 support/testing/tests/package/__init__.py
>  create mode 100644 support/testing/tests/package/test_dropbear.py
>  create mode 100644 support/testing/tests/package/test_python.py
[--SNIP--]
> +        # Would be useful to try to login through SSH here, through
> +        # localhost:2222, though it is not easy to pass the ssh
> +        # password on the command line.
> diff --git a/support/testing/tests/package/test_python.py b/support/testing/tests/package/test_python.py
> new file mode 100644
> index 0000000..5532fb5
> --- /dev/null
> +++ b/support/testing/tests/package/test_python.py
> @@ -0,0 +1,35 @@
> +import os
> +
> +import infra.basetest
> +
> +class TestPythonBase(infra.basetest.BRTest):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +"""
> +BR2_PACKAGE_PYTHON=y
> +BR2_TARGET_ROOTFS_CPIO=y
> +# BR2_TARGET_ROOTFS_TAR is not set
> +"""
> +
> +    def test_run(self):
> +        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
> +        self.emulator.boot(arch="armv5",
> +                           kernel="builtin",
> +                           options=["-initrd", cpio_file])
> +        self.emulator.login()

I was wondering if the login phase could not be implicit. But then you
may need to pass a pasword (like for the dropbear case).

Yet, I still think that it should be implicit by default, unless you
have to log in with a specific user/passwd...

> +        cmd = "python --version 2>&1 | grep '^Python 2'"
> +        _, exit_code = self.emulator.run(cmd)
> +        self.assertEqual(exit_code, 0)
> +
> +        cmd = "python -c 'import math; math.floor(12.3)'"
> +        _, exit_code = self.emulator.run(cmd)
> +        self.assertEqual(exit_code, 0)
> +
> +        cmd = "python -c 'import ctypes;"
> +        cmd += "libc = ctypes.cdll.LoadLibrary(\"libc.so.1\");"
> +        cmd += "print libc.time(None)'"
> +        _, exit_code = self.emulator.run(cmd)
> +        self.assertEqual(exit_code, 0)
> +
> +        cmd = "python -c 'import zlib'"
> +        _, exit_code = self.emulator.run(cmd)
> +        self.assertEqual(exit_code, 1)

As I see it, there are a lot of similar constructs:

    cmd = "do-something"
    _, exit_code = self.emulator.run(cmd)
    self.assertEqual(exit_code, 0)

Could we not aggregate the last two in a single command, like:

    cmd = "do-something"
    self.emulator.run.assert_exit(cmd, 0)

Or something like that (use your imagination to come up with a
meaningful function name...)

We could then expand it with something like:

    self.emulator.run.assert_stdout(cmd, regexp)

So that you could write:

    cmd = "python --version 2>&1"
    self.emulator.run.assert_stdout(cmd, "^Python 2")

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
