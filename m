From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Mar 2021 22:05:49 +0100
Subject: [Buildroot] [PATCH 1/1] package/rustc: add musl as an available
 Rust libc
In-Reply-To: <BN1P111MB0914D910EDE814D643995A08F5699@BN1P111MB0914.NAMP111.PROD.OUTLOOK.COM>
References: <BN1P111MB0914433AA54196ABAEB91D63F5699@BN1P111MB0914.NAMP111.PROD.OUTLOOK.COM>
 <BN1P111MB0914D910EDE814D643995A08F5699@BN1P111MB0914.NAMP111.PROD.OUTLOOK.COM>
Message-ID: <20210320220549.65c51497@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Nathaniel,

On Thu, 18 Mar 2021 18:55:30 +0000
"Husted, Nathaniel CIV USN NSWC CD CRANE IN (USA)" <nathaniel.husted@navy.mil> wrote:

> The current rustc package only supports gnu libc and hardcodes this requirement. This patch adds musl to the available libc options for Rust packages.
> 
> Musl is now a Tier 2 supported environment for Rust. Tier 2 means the platforms are "guaranteed to build" and official binary releases are available. The changes in rustc.mk will also support adding uclibc when that environment reaches Tier 2 support but does not allow for uclibc as it is still a Tier 3 supported libc.
> 
> Signed-off-by: Nathaniel Husted <nathaniel.husted@navy.mil>

Thanks a lot for your patch! I do have a few comments below on the code
itself. But first, could you resent your patch with "git send-email",
so that it isn't mangled by your e-mail client? Also, wrapping your
commit message to ~72 columns would be good.

> ---
>  package/rustc/Config.in.host | 2 +-
>  package/rustc/rustc.mk       | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host index 1df25ae326..4ab9086446 100644
> --- a/package/rustc/Config.in.host
> +++ b/package/rustc/Config.in.host
> @@ -17,7 +17,7 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
>         default y if (BR2_mips || BR2_mipsel) && !BR2_MIPS_CPU_MIPS32R6
>         default y if (BR2_mips64 || BR2_mips64el) && !BR2_MIPS_CPU_MIPS64R6 \
>                 && BR2_MIPS_NABI64
> -       depends on BR2_TOOLCHAIN_USES_GLIBC
> +       depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
>         depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
> 
>  config BR2_PACKAGE_HOST_RUSTC_ARCH
> diff --git a/package/rustc/rustc.mk b/package/rustc/rustc.mk index 35ffc36106..181e19ac9d 100644
> --- a/package/rustc/rustc.mk
> +++ b/package/rustc/rustc.mk
> @@ -6,9 +6,10 @@
> 
>  RUSTC_ARCH = $(call qstrip,$(BR2_PACKAGE_HOST_RUSTC_ARCH))
>  RUSTC_ABI = $(call qstrip,$(BR2_PACKAGE_HOST_RUSTC_ABI))
> +RUSTC_TARGET_LIBC = $(call qstrip,$(BR2_TOOLCHAIN_BUILDROOT_LIBC))
> 
>  ifeq ($(BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS),y)
> -RUSTC_TARGET_NAME = $(RUSTC_ARCH)-unknown-linux-gnu$(RUSTC_ABI)
> +RUSTC_TARGET_NAME =
> +$(RUSTC_ARCH)-unknown-linux-$(RUSTC_TARGET_LIBC)$(RUSTC_ABI)

Unfortunately, this doesn't work, for two reasons:

 (1) $(BR2_TOOLCHAIN_BUILDROOT_LIBC) is only defined when you use the
     "internal toolchain backend" i.e Buildroot builds the toolchain for
     you. For a Buildroot configuration that uses an external
     toolchain, this wouldn't work.

 (2) The current value being used is "gnu"... but the value of
     $(BR2_TOOLCHAIN_BUILDROOT_LIBC) for a glibc toolchain is "glibc". So
     with your patch, the value of RUSTC_TARGET_NAME would be incorrect for
     glibc toolchains.

I think instead you could simply use $(LIBC). Indeed, it is defined in
all cases (internal/external) toolchains and has the value "gnu" for
glibc toolchains. It is defined in package/Makefile.in as follows:

ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
LIBC = uclibc
else ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
LIBC = musl
else
LIBC = gnu
endif

What do you think ?

If you agree with this, could you send an updated patch?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
