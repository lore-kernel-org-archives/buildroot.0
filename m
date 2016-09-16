From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Sep 2016 16:03:14 +0200
Subject: [Buildroot] [PATCH] linux: Allow kernel strip modules itself
In-Reply-To: <1474023024-9105-1-git-send-email-abrodkin@synopsys.com>
References: <1474023024-9105-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20160916160314.2d4b0513@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for proposing a patch for this!

On Fri, 16 Sep 2016 13:50:24 +0300, Alexey Brodkin wrote:

>  Makefile            | 3 ---
>  linux/linux.mk      | 6 +++++-
>  package/Makefile.in | 2 --
>  3 files changed, 5 insertions(+), 6 deletions(-)

We also need to change package/pkg-kernel-module.mk, which is used by
packages containing external kernel modules.

> diff --git a/linux/linux.mk b/linux/linux.mk
> index 6e41a92..82c6d38 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -384,12 +384,16 @@ define LINUX_INSTALL_IMAGES_CMDS
>  	$(call LINUX_INSTALL_DTB,$(BINARIES_DIR))
>  endef
>  
> +ifeq ($(BR2_STRIP_strip),y)
> +LINUX_MOD_STRIP_FLAGS := INSTALL_MOD_STRIP=1

Replace := by =.

Also, since INSTALL_MOD_PATH is part of LINUX_MAKE_FLAGS, I would
suggest to do the same for INSTALL_MOD_STRIP, i.e:

ifeq ($(BR2_STRIP_strip),y)
LINUX_MAKE_FLAGS += INSTALL_MOD_STRIP=1
endif

This also automagically solves the pkg-kernel-module.mk case, which
uses $(LINUX_MAKE_FLAGS).

> diff --git a/package/Makefile.in b/package/Makefile.in
> index afd5d3a..1eb5ef7 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -207,12 +207,10 @@ STRIP_STRIP_UNNEEDED := --strip-unneeded
>  STRIP_STRIP_ALL := --strip-all
>  TARGET_STRIP = $(TARGET_CROSS)strip
>  STRIPCMD = $(TARGET_CROSS)strip --remove-section=.comment --remove-section=.note
> -KSTRIPCMD = $(STRIPCMD) $(STRIP_STRIP_UNNEEDED)

Following this removal, the STRIP_STRIP_UNNEEDED variable is no longer
used, so its definition a few lines above can be removed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
