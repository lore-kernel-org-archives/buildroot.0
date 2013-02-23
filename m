From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 23 Feb 2013 19:01:45 +0100
Subject: [Buildroot] [PATCH v2] Added local directory as soure of kernel
 code
In-Reply-To: <1360833253-26809-1-git-send-email-rafal.fabich@gmail.com>
References: <1360833253-26809-1-git-send-email-rafal.fabich@gmail.com>
Message-ID: <51290409.4080004@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/02/13 10:14, Rafal Fabich wrote:
> Add the option to use a local directory as the source for
> building the Linux kernel, which can be useful during
> kernel development.
>
> Signed-off-by: Rafal Fabich <rafal.fabich@gmail.com>

  Since we get this kind of patch very regularly, I think it's time we 
commit it :-)

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Note: the patch needs to be refreshed against master; sending an update 
in reply.


  Regards,
  Arnout

>
> ---
> Changes v1 -> v2 after comments from Arnout Vandecappelle
>    - default setting of BR2_LINUX_KERNEL_VERSION changed to "custom"
>    - removed ifeq ($(LINUX_VERSION),custom) condition from linux.mk for better consistency
>
> ---
>   linux/Config.in |   13 +++++++++++++
>   linux/linux.mk  |    5 ++++-
>   2 files changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/linux/Config.in b/linux/Config.in
> index 3c50acc..53e81ba 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -52,6 +52,12 @@ config BR2_LINUX_KERNEL_CUSTOM_GIT
>   	  This option allows Buildroot to get the Linux kernel source
>   	  code from a Git repository.
>
> +config BR2_LINUX_KERNEL_CUSTOM_LOCAL
> +	bool "Local directory"
> +	help
> +	  This option allows Buildroot to get the Linux kernel source
> +	  code from a local directory.
> +
>   endchoice
>
>   config BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE
> @@ -74,6 +80,12 @@ config BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION
>   	  Git revision to use in the format used by git rev-parse,
>   	  E.G. a sha id, a tag, branch, ..
>
> +config BR2_LINUX_KERNEL_CUSTOM_LOCAL_PATH
> +	string "Path to the local directory"
> +	depends on BR2_LINUX_KERNEL_CUSTOM_LOCAL
> +	help
> +	  Path to the local directory with the Linux kernel source code.
> +
>   config BR2_LINUX_KERNEL_VERSION
>   	string
>   	default "3.7.6" if BR2_LINUX_KERNEL_3_7
> @@ -81,6 +93,7 @@ config BR2_LINUX_KERNEL_VERSION
>   	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE if BR2_LINUX_KERNEL_CUSTOM_VERSION
>   	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
>   	default $BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION if BR2_LINUX_KERNEL_CUSTOM_GIT
> +	default "custom" if BR2_LINUX_KERNEL_CUSTOM_LOCAL
>
>   #
>   # Patch selection
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 91a9f50..494911b 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -8,10 +8,13 @@ LINUX_LICENSE = GPLv2
>   LINUX_LICENSE_FILES = COPYING
>
>   # Compute LINUX_SOURCE and LINUX_SITE from the configuration
> -ifeq ($(LINUX_VERSION),custom)
> +ifeq ($(BR2_LINUX_KERNEL_CUSTOM_TARBALL),y)
>   LINUX_TARBALL = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION))
>   LINUX_SITE = $(patsubst %/,%,$(dir $(LINUX_TARBALL)))
>   LINUX_SOURCE = $(notdir $(LINUX_TARBALL))
> +else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_LOCAL),y)
> +LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_LOCAL_PATH))
> +LINUX_SITE_METHOD = local
>   else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_GIT),y)
>   LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL))
>   LINUX_SITE_METHOD = git
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
