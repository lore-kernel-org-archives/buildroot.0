From: Stephan Hoffmann <sho@relinux.de>
Date: Mon, 04 Mar 2013 11:32:38 +0100
Subject: [Buildroot] [PATCH] Linux: enable local Linux tarball in config
In-Reply-To: <1359648013-13494-1-git-send-email-sho@relinux.de>
References: <1359648013-13494-1-git-send-email-sho@relinux.de>
Message-ID: <51347846.4040304@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ping
Am 31.01.2013 17:00, schrieb Stephan Hoffmann:
> When a local file is given as BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION
> buildroot ties to load it from the net and fails.
>
> This patch adds a check and sets LINUX_SITE_METHOD to "file" in case
> the named tarball is a local file.
>
> Signed-off-by: Stephan Hoffmann <sho@relinux.de>
> ---
>  linux/linux.mk |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
>
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 91a9f50..fe89357 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -10,6 +10,10 @@ LINUX_LICENSE_FILES = COPYING
>  # Compute LINUX_SOURCE and LINUX_SITE from the configuration
>  ifeq ($(LINUX_VERSION),custom)
>  LINUX_TARBALL = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION))
> +# If the tarball happens to be a local file SITE_METHOD is set accordingly
> +ifneq ($(wildcard $(LINUX_TARBALL)),)
> +LINUX_SITE_METHOD = "file"
> +endif
>  LINUX_SITE = $(patsubst %/,%,$(dir $(LINUX_TARBALL)))
>  LINUX_SOURCE = $(notdir $(LINUX_TARBALL))
>  else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_GIT),y)
