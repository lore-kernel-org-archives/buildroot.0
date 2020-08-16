From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Aug 2020 23:45:49 +0200
Subject: [Buildroot] [PATCH v3 2/5]
 support/testing/tests/toolchain/test_external: support non-ELF toolchains
In-Reply-To: <20200814195235.986905-3-thomas.petazzoni@bootlin.com>
References: <20200814195235.986905-1-thomas.petazzoni@bootlin.com>
 <20200814195235.986905-3-thomas.petazzoni@bootlin.com>
Message-ID: <20200816214549.GK24264@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-08-14 21:52 +0200, Thomas Petazzoni spake thusly:
> The TestExternalToolchain() base class implement a test checking if
> the ELF interpreter that is advertised by Busybox really exists in the
> rootfs. Of course, this only makes sense with ELF toolchains. Until
> now, only ELF toolchains were tested, but we are going to use
> TestExternalToolchain() with non-ELF toolchains as well, so let's make
> this conditional.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Since Titopuan reviewed the other patches, I looked at that one
k it to me to handle that one.

Applied to next, after fixing as per my previous review:
    http://lists.busybox.net/pipermail/buildroot/2020-August/289221.html

Thanks.

I'll see the rest of the series later...

Regards,
Yann E. MORIN.

> ---
>  support/testing/tests/toolchain/test_external.py | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/support/testing/tests/toolchain/test_external.py b/support/testing/tests/toolchain/test_external.py
> index 881d2b00db..1818ae0498 100644
> --- a/support/testing/tests/toolchain/test_external.py
> +++ b/support/testing/tests/toolchain/test_external.py
> @@ -26,11 +26,15 @@ class TestExternalToolchain(infra.basetest.BRTest):
>              path = os.path.join(self.builddir, "target", d)
>              self.assertFalse(has_broken_links(path))
>  
> -        interp = infra.get_elf_prog_interpreter(self.builddir,
> -                                                self.toolchain_prefix,
> -                                                "bin/busybox")
> -        interp_path = os.path.join(self.builddir, "target", interp[1:])
> -        self.assertTrue(os.path.exists(interp_path))
> +        with open(os.path.join(self.builddir, ".config")) as configf:
> +            configlines = configf.readlines()
> +
> +        if "BR2_BINFMT_ELF=y\n" in configlines:
> +            interp = infra.get_elf_prog_interpreter(self.builddir,
> +                                                    self.toolchain_prefix,
> +                                                    "bin/busybox")
> +            interp_path = os.path.join(self.builddir, "target", interp[1:])
> +            self.assertTrue(os.path.exists(interp_path))
>  
>  
>  class TestExternalToolchainSourceryArmv4(TestExternalToolchain):
> -- 
> 2.26.2
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
