From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 12 Aug 2013 08:12:13 +0200
Subject: [Buildroot] [PATCH 3 of 6 v2] linux: add support for custom
 Mercurial repository
In-Reply-To: <702ce86cc56aec78ac12.1374650580@BEANTN0L019720>
References: <patchbomb.1374650577@BEANTN0L019720>
 <702ce86cc56aec78ac12.1374650580@BEANTN0L019720>
Message-ID: <52087CBD.10501@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24/07/13 09:23, Thomas De Schampheleire wrote:
[snip]
> diff --git a/linux/Config.in b/linux/Config.in
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -52,6 +52,12 @@ config BR2_LINUX_KERNEL_CUSTOM_GIT
>   	  This option allows Buildroot to get the Linux kernel source
>   	  code from a Git repository.
>   
> +config BR2_LINUX_KERNEL_CUSTOM_HG
> +	bool "Custom Mercurial repository"
> +	help
> +	  This option allows Buildroot to get the Linux kernel source
> +	  code from a Mercurial repository.
> +
>   endchoice
>   
>   config BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE
> @@ -62,24 +68,26 @@ config BR2_LINUX_KERNEL_CUSTOM_TARBALL_L
>   	string "URL of custom kernel tarball"
>   	depends on BR2_LINUX_KERNEL_CUSTOM_TARBALL
>   
> -config BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL
> -	string "URL of custom Git repository"
> -	depends on BR2_LINUX_KERNEL_CUSTOM_GIT
> +if BR2_LINUX_KERNEL_CUSTOM_GIT || BR2_LINUX_KERNEL_CUSTOM_HG
>   
> -config BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION
> -	string "Custom Git version"
> -	depends on BR2_LINUX_KERNEL_CUSTOM_GIT
> +config BR2_LINUX_KERNEL_CUSTOM_REPO_URL
> +	string "URL of custom repository"

 Given that string options can't be propagated from their legacy values, 
and since the name of an option isn't really that important, I'd keep 
the _GIT_ names for the mercurial options as well.

 If we do rename the option symbol names, then I would make sure that it 
is propagated:

	default BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL if BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL != ""

+ add a comment to the .legacy file so these hacks can be removed
eventually.

 Also, you have to change the symbol names in the defconfigs as well
(there are already 10 uses of this symbol).


 Regards,
 Arnout

> +
> +config BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION
> +	string "Custom repository version"
>   	help
> -	  Git revision to use in the format used by git rev-parse,
> +	  Revision to use in the typical format used by Git/Mercurial
>   	  E.G. a sha id, a tag, branch, ..
>   
> +endif
> +
>   config BR2_LINUX_KERNEL_VERSION
>   	string
>   	default "3.10.1" if BR2_LINUX_KERNEL_LATEST_VERSION
>   	default BR2_DEFAULT_KERNEL_HEADERS if BR2_LINUX_KERNEL_SAME_AS_HEADERS
>   	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE if BR2_LINUX_KERNEL_CUSTOM_VERSION
>   	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
> -	default $BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION if BR2_LINUX_KERNEL_CUSTOM_GIT
> +	default $BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION if BR2_LINUX_KERNEL_CUSTOM_HG || BR2_LINUX_KERNEL_CUSTOM_GIT
>   
>   #
>   # Patch selection
> diff --git a/linux/linux.mk b/linux/linux.mk
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -14,8 +14,11 @@ LINUX_TARBALL = $(call qstrip,$(BR2_LINU
>   LINUX_SITE = $(patsubst %/,%,$(dir $(LINUX_TARBALL)))
>   LINUX_SOURCE = $(notdir $(LINUX_TARBALL))
>   else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_GIT),y)
> -LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL))
> +LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
>   LINUX_SITE_METHOD = git
> +else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_HG),y)
> +LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
> +LINUX_SITE_METHOD = hg
>   else
>   LINUX_SOURCE = linux-$(LINUX_VERSION).tar.xz
>   # In X.Y.Z, get X and Y. We replace dots and dashes by spaces in order
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
