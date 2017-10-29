From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Oct 2017 08:26:49 +0100
Subject: [Buildroot] [RFC 2/2] linux: Add support for specifying a
 custom directory
In-Reply-To: <1509242782-14524-3-git-send-email-f.fainelli@gmail.com>
References: <1509242782-14524-1-git-send-email-f.fainelli@gmail.com>
 <1509242782-14524-3-git-send-email-f.fainelli@gmail.com>
Message-ID: <20171029072649.GA2899@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Florian, All,

On 2017-10-28 19:06 -0700, Florian Fainelli spake thusly:
> Add the ability to specify a path to a custom directory where kernel sources
> may be contained. This is useful when doing kernel development in an existing
> git tree.

This case is covered by the override-sourcedir mechanism.

Create a file (by default, local.mk) in your config directory (the one
with the Buildroot .config file), and edit this file with:

    LINUX_OVERRIDE_SRCDIR = /path/to/your/linux

and Buildroot will use that as a rsync source, instead of downloading
the kernel sources.

See also e782cd5b1bc (Revert "Added local directory as source of kernel
code") for more in-depth explanations. ;-)

Regards,
Yann E. MORIN.

> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  linux/Config.in                        | 10 ++++++++++
>  linux/linux.mk                         |  3 +++
>  package/linux-headers/linux-headers.mk |  5 +++++
>  3 files changed, 18 insertions(+)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index 33ae944557b6..7d4dcddc7ea7 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -87,6 +87,12 @@ config BR2_LINUX_KERNEL_CUSTOM_SVN
>  	  This option allows Buildroot to get the Linux kernel source
>  	  code from a Subversion repository.
>  
> +config BR2_LINUX_KERNEL_CUSTOM_DIRECTORY
> +	bool "Custom directory"
> +	help
> +	  This option allows Buildroot to use the Linux kernel source
> +	  code from an existing directory.
> +
>  endchoice
>  
>  config BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE
> @@ -97,6 +103,10 @@ config BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION
>  	string "URL of custom kernel tarball"
>  	depends on BR2_LINUX_KERNEL_CUSTOM_TARBALL
>  
> +config BR2_LINUX_KERNEL_CUSTOM_DIRECTORY_LOCATION
> +	string "Path of the custom kernel source"
> +	depends on BR2_LINUX_KERNEL_CUSTOM_DIRECTORY
> +
>  if BR2_LINUX_KERNEL_CUSTOM_GIT || BR2_LINUX_KERNEL_CUSTOM_HG || BR2_LINUX_KERNEL_CUSTOM_SVN
>  
>  config BR2_LINUX_KERNEL_CUSTOM_REPO_URL
> diff --git a/linux/linux.mk b/linux/linux.mk
> index bd5589bae02d..192fd0d3ffb3 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -29,6 +29,9 @@ LINUX_SITE_METHOD = hg
>  else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_SVN),y)
>  LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
>  LINUX_SITE_METHOD = svn
> +else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_DIRECTORY),y)
> +LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DIRECTORY_LOCATION))
> +LINUX_SITE_METHOD = local
>  else ifeq ($(BR2_LINUX_KERNEL_LATEST_CIP_VERSION),y)
>  LINUX_SITE = git://git.kernel.org/pub/scm/linux/kernel/git/bwh/linux-cip.git
>  else ifneq ($(findstring -rc,$(LINUX_VERSION)),)
> diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
> index f1e379060834..e42af8a4d672 100644
> --- a/package/linux-headers/linux-headers.mk
> +++ b/package/linux-headers/linux-headers.mk
> @@ -26,6 +26,9 @@ LINUX_HEADERS_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
>  LINUX_HEADERS_SITE_METHOD = hg
>  # use same hg tarball as linux kernel
>  LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION).tar.gz
> +else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_DIRECTORY),y)
> +LINUX_HEADERS_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DIRECTORY_LOCATION))
> +LINUX_HEADERS_SITE_METHOD = local
>  else
>  LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION).tar.xz
>  # In X.Y.Z, get X and Y. We replace dots and dashes by spaces in order
> @@ -122,6 +125,7 @@ define LINUX_HEADERS_INSTALL_STAGING_CMDS
>  			headers_install)
>  endef
>  
> +ifneq ($(BR2_LINUX_KERNEL_CUSTOM_DIRECTORY),y)
>  ifeq ($(BR2_KERNEL_HEADERS_VERSION)$(BR2_KERNEL_HEADERS_AS_KERNEL),y)
>  define LINUX_HEADERS_CHECK_VERSION
>  	$(call check_kernel_headers_version,\
> @@ -130,5 +134,6 @@ define LINUX_HEADERS_CHECK_VERSION
>  endef
>  LINUX_HEADERS_POST_INSTALL_STAGING_HOOKS += LINUX_HEADERS_CHECK_VERSION
>  endif
> +endif
>  
>  $(eval $(generic-package))
> -- 
> 2.7.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
