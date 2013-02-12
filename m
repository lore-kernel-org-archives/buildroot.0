From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Feb 2013 18:15:38 +0100
Subject: [Buildroot] [PATCH 1/1] Added local directory as soure of
 kernel code
In-Reply-To: <1360310725-6463-2-git-send-email-rafal.fabich@gmail.com>
References: <1360310725-6463-1-git-send-email-rafal.fabich@gmail.com>
 <1360310725-6463-2-git-send-email-rafal.fabich@gmail.com>
Message-ID: <511A78BA.4010200@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/02/13 09:05, Rafal Fabich wrote:
> In 'menuconfig' user can choose the local directory as a source of Linux kernel code.
> Useful during kernel drivers or modules development.
>
> Tested on three different development machines and different kernel sources.
>
> Signed-off-by: Rafal Fabich <rafal.fabich@gmail.com>

  Looks like this is asked for over and over again, so I think it is 
really worth adding this option. I think this was in fact briefly 
discussed at the BR Developer Days but I didn't write it down in the 
report...

  Between this patch and Richard Braun's, I think this one is closer to 
how it should be.

  One comment below, though.

> ---
>   linux/Config.in |   14 ++++++++++++++
>   linux/linux.mk  |    3 +++
>   2 files changed, 17 insertions(+)
>
> diff --git a/linux/Config.in b/linux/Config.in
> index 3c50acc..d88d920 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -52,6 +52,11 @@ config BR2_LINUX_KERNEL_CUSTOM_GIT
>   	  This option allows Buildroot to get the Linux kernel source
>   	  code from a Git repository.
>
> +config BR2_LINUX_KERNEL_CUSTOM_LOCAL
> +	bool "Local directory"
> +	help
> +	  This option allows Buildroot to get the Linux kernel source
> +	  code from a local directory.
>   endchoice
>
>   config BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE
> @@ -74,6 +79,13 @@ config BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION
>   	  Git revision to use in the format used by git rev-parse,
>   	  E.G. a sha id, a tag, branch, ..
>
> +config BR2_LINUX_KERNEL_CUSTOM_LOCAL_PATH
> +	string "Path to the local directory"
> +	depends on BR2_LINUX_KERNEL_CUSTOM_LOCAL
> +	help
> +	  Path to the local directory with the Linux kernel source code.
> +
> +
>   config BR2_LINUX_KERNEL_VERSION
>   	string
>   	default "3.7.6" if BR2_LINUX_KERNEL_3_7
> @@ -81,6 +93,8 @@ config BR2_LINUX_KERNEL_VERSION
>   	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE if BR2_LINUX_KERNEL_CUSTOM_VERSION
>   	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
>   	default $BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION if BR2_LINUX_KERNEL_CUSTOM_GIT
> +	default "local" if BR2_LINUX_KERNEL_CUSTOM_LOCAL
> +

  This is a bit confusing, because the 'local' site method will force 
LINUX_VERSION to "custom". So I would call it custom here as well.

  Regards,
  Arnout

>
>   #
>   # Patch selection
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 91a9f50..3f2d460 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -15,6 +15,9 @@ LINUX_SOURCE = $(notdir $(LINUX_TARBALL))
>   else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_GIT),y)
>   LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL))
>   LINUX_SITE_METHOD = git
> +else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_LOCAL),y)
> +LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_LOCAL_PATH))
> +LINUX_SITE_METHOD = local
>   else
>   LINUX_SOURCE = linux-$(LINUX_VERSION).tar.bz2
>   # In X.Y.Z, get X and Y. We replace dots and dashes by spaces in order
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
