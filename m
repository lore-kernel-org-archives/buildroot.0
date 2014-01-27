From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 27 Jan 2014 18:45:59 +0100
Subject: [Buildroot] [PATCH] uboot-tools: Allow users to use uboot's
	sources
In-Reply-To: <1390696553-4163-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1390696553-4163-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <52E69B57.9090103@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26/01/14 01:35, Maxime Hadjinlian wrote:
> If the user has specified a custom U-Boot repository, he may also want
> to use it for U-Boot tools.
>
> This could be usefull in two identified use case:
>    - User want the same version for U-Boot tools and U-Boot
>    - User has modified U-Boot tools in his U-Boot repository
>
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>   package/uboot-tools/Config.in      | 10 ++++++++++
>   package/uboot-tools/uboot-tools.mk |  9 +++++++++
>   2 files changed, 19 insertions(+)
>
> diff --git a/package/uboot-tools/Config.in b/package/uboot-tools/Config.in
> index 7c8f17c..3742b0e 100644
> --- a/package/uboot-tools/Config.in
> +++ b/package/uboot-tools/Config.in
> @@ -7,6 +7,16 @@ config BR2_PACKAGE_UBOOT_TOOLS
>
>   if BR2_PACKAGE_UBOOT_TOOLS
>
> +if BR2_TARGET_UBOOT
> +
> +config BR2_PACKAGE_UBOOT_TOOLS_UBOOT_SOURCE
> +	bool "Use the same repository as U-Boot ?"
> +	help
> +	  Select this to use the same repository specified for U-Boot. Otherwise,
> +	  the upstream sources will be used.

  As I explain in a separate mail, I think this option is unnecessary.

> +
> +endif
> +
>   config BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE
>   	bool "mkimage"
>   	help
> diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
> index 398ce8b..367d067 100644
> --- a/package/uboot-tools/uboot-tools.mk
> +++ b/package/uboot-tools/uboot-tools.mk
> @@ -10,6 +10,15 @@ UBOOT_TOOLS_SITE    = ftp://ftp.denx.de/pub/u-boot
>   UBOOT_TOOLS_LICENSE = GPLv2+
>   UBOOT_TOOLS_LICENSE_FILES = Licenses/gpl-2.0.txt
>
> +ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_UBOOT_SOURCE),y)
> +	UBOOT_TOOLS_VERSION = $(call qstrip,$(BR2_TARGET_UBOOT_VERSION))
> +	UBOOT_TOOLS_SOURCE  = $(UBOOT_SOURCE)
> +	UBOOT_TOOLS_SITE    = $(UBOOT_SITE)
> +ifeq ($(UBOOT_SITE_METHOD),)
> +	UBOOT_TOOL_SITE_METHOD = $(UBOOT_SITE_METHOD)
> +endif

  I think UBOOT_LICENSE and UBOOT_LICENSE_FILES should also be taken 
over. Especially the LICENSE_FILES (i.e. empty), otherwise legal-info 
will break.


  Does this actually work if it doesn't come from an official tarball? I 
think the UBOOT_TOOLS_SOURCE variable will evaluate to empty at the time 
it is ifndef'd in pkg-generic.mk, so it will be set to the default 
<pkg>-<version>.tar.gz. So anything that doesn't happen to be in this 
format (e.g. a custom tarball) will not work AFAICS. This is probably 
also the reason why you use BR2_TARGET_UBOOT_VERSION instead of simply 
UBOOT_VERSION.

  In other words, something like this isn't reliable, because it depends 
on the order of inclusion of the .mk files. I think this is actually a 
problem with the buildroot infrastructure: ideally, it should _not_ 
depend on the order of inclusion.


  Regards,
  Arnout

> +endif
> +
>   define UBOOT_TOOLS_BUILD_CMDS
>   	$(MAKE) -C $(@D) 			\
>   		HOSTCC="$(TARGET_CC)"		\
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
