From: Mike Frysinger <vapier@gentoo.org>
Date: Tue, 14 Dec 2010 15:48:38 -0500
Subject: [Buildroot] [PATCH 03/14] toolchain: add support for external
	toolchain profiles and download
In-Reply-To: <bf29c83b99bbc83aa389f2960819e87b900904ab.1292257643.git.thomas.petazzoni@free-electrons.com>
References: <cover.1292257643.git.thomas.petazzoni@free-electrons.com>
	<bf29c83b99bbc83aa389f2960819e87b900904ab.1292257643.git.thomas.petazzoni@free-electrons.com>
Message-ID: <201012141548.38928.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday, December 13, 2010 11:27:39 Thomas Petazzoni wrote:
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -114,13 +114,13 @@
>  ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
>  TARGET_CROSS=$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-
>  else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
> -TOOLCHAIN_EXTERNAL_PREFIX:=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))
> -TOOLCHAIN_EXTERNAL_PATH:=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PATH))
> -ifneq ($(TOOLCHAIN_EXTERNAL_PATH),)
> -TARGET_CROSS=$(TOOLCHAIN_EXTERNAL_PATH)/bin/$(TOOLCHAIN_EXTERNAL_PREFIX)-
> +TOOLCHAIN_EXTERNAL_PREFIX=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))
> +ifeq ($(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)
> +TOOLCHAIN_EXTERNAL_LOCATION=$(TOOLCHAIN_EXTERNAL_DIR)
>  else
> -TARGET_CROSS=$(TOOLCHAIN_EXTERNAL_PREFIX)-
> +TOOLCHAIN_EXTERNAL_LOCATION=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PATH))
>  endif
> +TARGET_CROSS=$(TOOLCHAIN_EXTERNAL_LOCATION)/bin/$(TOOLCHAIN_EXTERNAL_PREFIX)-
>  else ifeq ($(BR2_TOOLCHAIN_CTNG),y)
>  TARGET_CROSS=$(TOOLCHAIN_DIR)/bin/$(REAL_GNU_TARGET_NAME)-
>  endif

this makes it harder to use an external toolchain because you now force
TARGET_CROSS to always start with /bin/.  before, people could easily set the
full path to nothing and the prefix to the toolchain they want.  since the
toolchain is in $PATH, there's no reason to force a useless full path to it.
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101214/b03a3fcd/attachment.pgp>
