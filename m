From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Jul 2020 13:59:27 +0200
Subject: [Buildroot] [PATCH 10/11] support/testing/tests: add test for
 check_bin_arch
In-Reply-To: <20200430095249.782597-11-thomas.petazzoni@bootlin.com>
References: <20200430095249.782597-1-thomas.petazzoni@bootlin.com>
 <20200430095249.782597-11-thomas.petazzoni@bootlin.com>
Message-ID: <20200725115927.GA19818@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2020-04-30 11:52 +0200, Thomas Petazzoni spake thusly:
> This tests build a bogus package that installs a binary built for the
> host architecture into $(TARGET_DIR), which should cause a build
> failure, at least as long as the host architecture isn't ARM.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
[--SNIP--]
> diff --git a/support/testing/tests/core/test_bad_arch.py b/support/testing/tests/core/test_bad_arch.py
> new file mode 100644
> index 0000000000..8f4bd57b0e
> --- /dev/null
> +++ b/support/testing/tests/core/test_bad_arch.py
> @@ -0,0 +1,19 @@
> +import infra
> +import infra.basetest
> +import subprocess
> +
> +
> +class DetectBadArchTest(infra.basetest.BRConfigTest):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + infra.basetest.MINIMAL_CONFIG
> +    br2_external = [infra.filepath("tests/core/br2-external/detect-bad-arch")]
> +
> +    def test_run(self):
> +        with self.assertRaises(SystemError):
> +            self.b.build()
> +        logf_path = infra.log_file_path(self.b.builddir, "build",
> +                                        infra.basetest.BRConfigTest.logtofile)
> +        if logf_path:
> +            s = 'ERROR: architecture for "/usr/bin/foo" is "Advanced Micro Devices X86-64", should be "ARM"'
> +            logf = open(logf_path, "r")
> +            ret = subprocess.call(["grep", "-q", s], stdin=logf)
> +            self.assertEqual(ret, 0)

No need for a sub-process, we can do it quite efficiently in python:

        if logf_path:
            s = 'blabla'
            with open(logf_path, "r") as f:
                lines = [l for l in f.readlines() if l.startswith(s)]
            self.assertEqual(len(lines), 0)

Regards,
Yann E. MORIN.

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
