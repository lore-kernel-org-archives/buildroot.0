From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 26 Jun 2021 17:18:30 +0200
Subject: [Buildroot] [PATCH v3 3/5] support/testing/tests/boot/test_atf:
 update U-Boot in TestATFAllwinner
In-Reply-To: <20210625193318.635449-4-geomatsi@gmail.com>
References: <20210625193318.635449-1-geomatsi@gmail.com>
 <20210625193318.635449-4-geomatsi@gmail.com>
Message-ID: <20210626151830.GK104638@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sergey, All,

On 2021-06-25 22:33 +0300, Sergey Matyukevich spake thusly:
> Bump U-Boot version in TestATFAllwinner. Updating U-Boot version to
> 2021.04 requires the following two changes.
> 
> First, after switching to binman, u-boot.itb is no more generated for
> 64-bit sunxi boards. Combined u-boot-sunxi-with-spl.bin image should
> be used instead. This image contains SPL, U-Boot, and FIT image,
> where FIT image contains other binaries such as BL31 and SCP.
> 
> Second, new U-Boot enables support for System Control Processor (SCP)
> firmware. SCP firmware is included by default into FIT image in the
> combined u-boot-sunxi-with-spl.bin binary. When SCP is not available
> or not needed, it should be explicitly disabled by pointing to an
> empty file. Support for Allwinner SCP firmware is not yet available
> neither in Buildroot nor in mainline kernel. So disable it for now
> using custom U-Boot build options.
> 
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  support/testing/tests/boot/test_atf.py | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/support/testing/tests/boot/test_atf.py b/support/testing/tests/boot/test_atf.py
> index 8c29fbd594..915e0a5093 100644
> --- a/support/testing/tests/boot/test_atf.py
> +++ b/support/testing/tests/boot/test_atf.py
> @@ -42,16 +42,15 @@ class TestATFAllwinner(infra.basetest.BRTest):
>          BR2_TARGET_UBOOT=y
>          BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>          BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -        BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.10"
> +        BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.04"
>          BR2_TARGET_UBOOT_BOARD_DEFCONFIG="bananapi_m64"
>          BR2_TARGET_UBOOT_NEEDS_DTC=y
>          BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
>          BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
>          BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
> -        BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
> -        BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
>          BR2_TARGET_UBOOT_SPL=y
> -        BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"
> +        BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
> +        BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="SCP=/dev/null"
>          """
>  
>      def test_run(self):
> -- 
> 2.32.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
