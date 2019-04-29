From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 29 Apr 2019 23:27:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/uboot-tools: fix build with
 host-openssl
In-Reply-To: <20190428110142.14075-1-fontaine.fabrice@gmail.com>
References: <20190428110142.14075-1-fontaine.fabrice@gmail.com>
Message-ID: <cd1b44f1-34a5-4e31-cfa5-199d5d076742@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28/04/2019 13:01, Fabrice Fontaine wrote:
> If host-openssl is built before uboot-tools, build fails because
> uboot-tools links with openssl headers from host which depends on
> pthread.h
> 
> To fix this issue, don't pass pass HOST_CFLAGS to UBOOT_TOOLS_MAKE_OPTS

 At first sight, this makes no sense, because the error is in HOSTCC so pthread
should be available.

 However, with CROSS_BUILD_TOOLS=y, tools/Makefile sets HOSTCC=$(CC). It forgets
to override HOSTCFLAGS, though, so we're building the tools with target compiler
but host CFLAGS.


> As HOST_CFLAGS was added to remove -std=gnu11 in commit
> 03a808a0999ac031a1e93000d9a3c50ffbcb64a4, add a dependency to gcc >= 4.7
> to uboot-tools and mender (its reverse dependency)

 This is not really acceptable for me. We should make it as easy as possible for
people to upgrade Buildroot while keeping an old toolchain. And uboot-tools is
definitely an essential package.

 The more obvious thing to do would be to set HOSTCFLAGS=$(TARGET_CFLAGS) since
we're really abusing HOSTCC to do target compilation (that's basically what
CROSS_BUILD_TOOLS=y does). However, that comes in the way of fixdep, which
really is a host tool so can't be built with TARGET_CFLAGS (not immediately
obvious, but a toolchain that sets TARGET_ABI will probably trigger a build
failure there).

 So we'd have to build fixdep explicitly in a separate call to make.

 Alternatively (probably better), we patch tools/Makefile to also override
HOSTCFLAGS when CROSS_BUILD_TOOLS=y.  That sounds like something upstreamable.

 For now, it's marked as Changes Requested.

 Regards,
 Arnout

> 
> Fixes:
>  - http://autobuild.buildroot.org/results/915b509e814bda16be54a24276b9c740c51e5770
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/mender/Config.in           | 5 +++--
>  package/uboot-tools/Config.in      | 4 ++++
>  package/uboot-tools/uboot-tools.mk | 1 -
>  3 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/package/mender/Config.in b/package/mender/Config.in
> index 5ab2304e49..f8896692f7 100644
> --- a/package/mender/Config.in
> +++ b/package/mender/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_MENDER
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # uboot-tools
>  	select BR2_PACKAGE_UBOOT_TOOLS # runtime
>  	select BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV # runtime
>  	help
> @@ -13,7 +14,7 @@ config BR2_PACKAGE_MENDER
>  
>  	  https://github.com/mendersoftware/mender
>  
> -comment "mender needs a toolchain w/ threads"
> +comment "mender needs a toolchain w/ threads, gcc >= 4.7"
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
> diff --git a/package/uboot-tools/Config.in b/package/uboot-tools/Config.in
> index 681f87b45f..4e6a5104ea 100644
> --- a/package/uboot-tools/Config.in
> +++ b/package/uboot-tools/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_UBOOT_TOOLS
>  	bool "u-boot tools"
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
>  	help
>  	  Companion tools for Das U-Boot bootloader.
>  
> @@ -94,3 +95,6 @@ config BR2_PACKAGE_UBOOT_TOOLS_DUMPIMAGE
>  	  extraction of data from U-Boot images.
>  
>  endif
> +
> +comment "uboot-tools needs a toolchain w/ gcc >= 4.7"
> +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
> diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
> index 61c70b7e7f..c27b2d364b 100644
> --- a/package/uboot-tools/uboot-tools.mk
> +++ b/package/uboot-tools/uboot-tools.mk
> @@ -19,7 +19,6 @@ endef
>  UBOOT_TOOLS_MAKE_OPTS = CROSS_COMPILE="$(TARGET_CROSS)" \
>  	CFLAGS="$(TARGET_CFLAGS)" \
>  	LDFLAGS="$(TARGET_LDFLAGS)" \
> -	HOSTCFLAGS="$(HOST_CFLAGS)" \
>  	STRIP=$(TARGET_STRIP)
>  
>  ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT),y)
> 
