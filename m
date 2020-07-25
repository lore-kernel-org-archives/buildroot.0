From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Jul 2020 14:05:23 +0200
Subject: [Buildroot] [PATCH 11/11] support/testing/tests: add test for
 file overwrite detection
In-Reply-To: <20200430095249.782597-12-thomas.petazzoni@bootlin.com>
References: <20200430095249.782597-1-thomas.petazzoni@bootlin.com>
 <20200430095249.782597-12-thomas.petazzoni@bootlin.com>
Message-ID: <20200725120523.GB19818@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-04-30 11:52 +0200, Thomas Petazzoni spake thusly:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
[--SNIP--]
> diff --git a/support/testing/tests/core/test_file_overwrite.py b/support/testing/tests/core/test_file_overwrite.py
> new file mode 100644
> index 0000000000..526ed55e43
> --- /dev/null
> +++ b/support/testing/tests/core/test_file_overwrite.py
> @@ -0,0 +1,47 @@
> +import infra
> +import infra.basetest
> +import subprocess
> +
> +
> +class DetectTargetFileOverwriteTest(infra.basetest.BRConfigTest):
> +    config = \
> +        infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        infra.basetest.MINIMAL_CONFIG + \
> +        """
> +        BR2_PER_PACKAGE_DIRECTORIES=y
> +        BR2_PACKAGE_DETECT_OVERWRITE=y
> +        """
> +    br2_external = [infra.filepath("tests/core/br2-external/detect-overwrite")]
> +
> +    def test_run(self):
> +        with self.assertRaises(SystemError):
> +            self.b.build()
> +        logf_path = infra.log_file_path(self.b.builddir, "build",
> +                                        infra.basetest.BRConfigTest.logtofile)
> +        if logf_path:
> +            s = './etc/passwd: FAILED'
> +            logf = open(logf_path, "r")
> +            ret = subprocess.call(["grep", "-q", s], stdin=logf)
> +            self.assertEqual(ret, 0)

This does not need a subprocess, and can be done efficiently in python,
like suggested in my review of patch 10.

Note thatif the search pattern does not occur at the beginning of the
line, we can do:

    s = 'blabla'
    for open(log_path, "r") as f:
        lines = [l for l in f.readlines() if s in l]

Ditto for the other test, of course. ;-)

Regards,
Yann E. MORIN.

> +
> +class DetectHostFileOverwriteTest(infra.basetest.BRConfigTest):
> +    config = \
> +        infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        infra.basetest.MINIMAL_CONFIG + \
> +        """
> +        BR2_PER_PACKAGE_DIRECTORIES=y
> +        BR2_PACKAGE_HOST_DETECT_OVERWRITE=y
> +        """
> +    br2_external = [infra.filepath("tests/core/br2-external/detect-overwrite")]
> +
> +    def test_run(self):
> +        with self.assertRaises(SystemError):
> +            self.b.build()
> +        logf_path = infra.log_file_path(self.b.builddir, "build",
> +                                        infra.basetest.BRConfigTest.logtofile)
> +        if logf_path:
> +            s = './lib/pkgconfig/libpkgconf.pc: FAILED'
> +            logf = open(logf_path, "r")
> +            ret = subprocess.call(["grep", "-q", s], stdin=logf)
> +            self.assertEqual(ret, 0)


> -- 
> 2.25.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
