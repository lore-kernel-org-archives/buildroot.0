From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Apr 2020 20:38:46 +0200
Subject: [Buildroot] [PATCHv2 1/2] support/testing: update the ARM
 toolchain used for the systemd init tests
In-Reply-To: <20200404220842.362610-1-romain.naour@gmail.com>
References: <20200404220842.362610-1-romain.naour@gmail.com>
Message-ID: <20200405183846.GN22325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2020-04-05 00:08 +0200, Romain Naour spake thusly:
> As reported on the mailing list, there is a build issue with systemd 245
> when using gcc < 5.0:
> 
> http://lists.busybox.net/pipermail/buildroot/2020-April/278931.html
> 
> Update to the Bootling toolchain 2017.05 that meet the minimum requered
> version of toolchain componant:
> GCC           5.4.0
> linux-headers 3.10.105

As discussed n the review of your v1, I've changed that to use a
Cortex-A9 with VFP, so an armv7, which allows using the ARM toolchain,
which we have as a known pre-built toolchain, rather than switch to
using a custom external toolchain from Bootlin.

(FTR, the discussion was in that thread:
    http://lists.busybox.net/pipermail/buildroot/2020-April/278977.html
)

Both patches applied to master, thanks.

Regards,
Yann E. MORIN.

> See:
> https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/readmes/armv5-eabi--glibc--stable-2017.05-toolchains-1-1.txt
> 
> Tested:
> https://gitlab.com/kubu93/buildroot/pipelines/132890602
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/498144403
> https://gitlab.com/buildroot.org/buildroot/-/jobs/498144405
> https://gitlab.com/buildroot.org/buildroot/-/jobs/498144406
> https://gitlab.com/buildroot.org/buildroot/-/jobs/498144408
> https://gitlab.com/buildroot.org/buildroot/-/jobs/498144410
> https://gitlab.com/buildroot.org/buildroot/-/jobs/498144412
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  support/testing/tests/init/test_systemd.py | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/support/testing/tests/init/test_systemd.py b/support/testing/tests/init/test_systemd.py
> index 0ac18cb623..10634cbb1f 100644
> --- a/support/testing/tests/init/test_systemd.py
> +++ b/support/testing/tests/init/test_systemd.py
> @@ -2,11 +2,24 @@ import infra.basetest
>  from tests.init.base import InitSystemBase as InitSystemBase
>  
>  
> +# External Toolchain fragment imported from:
> +# https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/fragments/armv5-eabi--glibc--stable-2017.05-toolchains-1-1.frag
>  class InitSystemSystemdBase(InitSystemBase):
>      config = \
>          """
>          BR2_arm=y
> +        BR2_arm926t=y
> +        BR2_ARM_CPU_ARMV5=y
> +        BR2_ARM_EABI=y
> +        BR2_ARM_SOFT_FLOAT=y
>          BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> +        BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> +        BR2_TOOLCHAIN_EXTERNAL_URL="http://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi--glibc--stable-2017.05-toolchains-1-1.tar.bz2"
> +        BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
> +        BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
> +        BR2_TOOLCHAIN_EXTERNAL_HAS_SSP=y
> +        BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
>          BR2_INIT_SYSTEMD=y
>          BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
>          BR2_LINUX_KERNEL=y
> -- 
> 2.25.1
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
