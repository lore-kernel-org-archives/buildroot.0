From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 7 Mar 2019 10:07:54 +0100
Subject: [Buildroot] [PATCH] linux-headers,
 kernel: Support downloads of v5.0+
In-Reply-To: <7cef8d21f7e682ab4ff242883112050bcae6c47b.1551863158.git.jan.kundrat@cesnet.cz>
References: <7cef8d21f7e682ab4ff242883112050bcae6c47b.1551863158.git.jan.kundrat@cesnet.cz>
Message-ID: <84392138-9d0f-4d0c-0ee3-c24e94ac1597@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Jan,

On 05/03/2019 12:05, Jan Kundr?t wrote:
> Signed-off-by: Jan Kundr?t <jan.kundrat@cesnet.cz>
> ---
>  linux/linux.mk                         | 4 +++-
>  package/linux-headers/linux-headers.mk | 4 +++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 2b5d096e14..0d326c60e2 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -38,7 +38,7 @@ LINUX_SITE = https://git.kernel.org/torvalds/t
>  else
>  LINUX_SOURCE = linux-$(LINUX_VERSION).tar.xz
>  # In X.Y.Z, get X and Y. We replace dots and dashes by spaces in order
> -# to use the $(word) function. We support versions such as 4.0, 3.1,
> +# to use the $(word) function. We support versions such as 5.0, 4.20, 3.1,
>  # 2.6.32, 2.6.32-rc1, 3.0-rc6, etc.
>  ifeq ($(findstring x2.6.,x$(LINUX_VERSION)),x2.6.)
>  LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v2.6
> @@ -46,6 +46,8 @@ else ifeq ($(findstring x3.,x$(LINUX_VERSION)),x3.)
>  LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v3.x
>  else ifeq ($(findstring x4.,x$(LINUX_VERSION)),x4.)
>  LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v4.x
> +else ifeq ($(findstring x5.,x$(LINUX_VERSION)),x5.)
> +LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v5.x

 This story of adding the same pattern all the time is getting old, so I've
submitted a patch that fixes things once and for all [1].

 Regards,
 Arnout

[1] http://patchwork.ozlabs.org/patch/1052531/

>  endif
>  endif
>  
> diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
> index 45e17688c5..3a863b02be 100644
> --- a/package/linux-headers/linux-headers.mk
> +++ b/package/linux-headers/linux-headers.mk
> @@ -50,7 +50,7 @@ LINUX_HEADERS_SITE = $(LINUX_HEADERS_REPO_URL)
>  LINUX_HEADERS_SITE_METHOD = svn
>  else
>  # In X.Y.Z, get X and Y. We replace dots and dashes by spaces in order
> -# to use the $(word) function. We support versions such as 4.0, 3.1,
> +# to use the $(word) function. We support versions such as 5.0, 4.20, 3.1,
>  # 2.6.32, 2.6.32-rc1, 3.0-rc6, etc.
>  ifeq ($(findstring x2.6.,x$(LINUX_HEADERS_VERSION)),x2.6.)
>  LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v2.6
> @@ -58,6 +58,8 @@ else ifeq ($(findstring x3.,x$(LINUX_HEADERS_VERSION)),x3.)
>  LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v3.x
>  else ifeq ($(findstring x4.,x$(LINUX_HEADERS_VERSION)),x4.)
>  LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v4.x
> +else ifeq ($(findstring x5.,x$(LINUX_HEADERS_VERSION)),x5.)
> +LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v5.x
>  endif # x2.6
>  # release candidates are in testing/ subdir
>  ifneq ($(findstring -rc,$(LINUX_HEADERS_VERSION)),)
> 
