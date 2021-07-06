From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 6 Jul 2021 22:20:01 +0200
Subject: [Buildroot] [PATCH v2 17/18] support/testing/tests: add test
 for check_bin_arch
In-Reply-To: <20210706142501.951345-18-herve.codina@bootlin.com>
References: <20210706142501.951345-1-herve.codina@bootlin.com>
 <20210706142501.951345-18-herve.codina@bootlin.com>
Message-ID: <20210706202001.GP2521@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Herv?, All,

On 2021-07-06 16:25 +0200, Herve Codina spake thusly:
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> This tests build a bogus package that installs a binary built for the
> host architecture into $(TARGET_DIR), which should cause a build
> failure, at least as long as the host architecture isn't ARM.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
> New patch in this v2 series
> 
> This patch is retrieved from Thomas's work.
> The first version was discussed
> https://patchwork.ozlabs.org/project/buildroot/patch/20200430095249.782597-10-thomas.petazzoni at bootlin.com/

Correct URL is:
    https://patchwork.ozlabs.org/project/buildroot/patch/20200430095249.782597-11-thomas.petazzoni at bootlin.com/

> Compared to the first version, as proposed by Yann in the previous
> review, this patch does not launch a subprocess (grep) to search the
> string.
> 
> Note also that the .gitlab-ci.yml modification present in the previous
> version is not present in this patch.

Yes, because the file is generated now. \o/

[--SNIP--]
> diff --git a/support/testing/tests/core/test_bad_arch.py b/support/testing/tests/core/test_bad_arch.py
> new file mode 100644
> index 0000000000..0be7fdc9b7
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
> +            s = 'ERROR: architecture for "/usr/bin/foo" is'
> +            with open(logf_path, "r") as f:
> +                lines = [l for l in f.readlines() if l.startswith(s)]
> +            self.assertEqual(len(lines), 0)

So, this tests explicitly installs a host executable in target/, yet the
assert is written to ensure there is no error: it compares against zero.

So this test-case will fail, by design.

But test should not fail; they should succeed. In this case, the assert
should check that there indeed is an error:

    self.assertEqual(len(lines), 1)

Or did I miss something?

Regards,
Yann E. MORIN.

> -- 
> 2.31.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
