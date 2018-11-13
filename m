From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Nov 2018 15:51:02 +0100
Subject: [Buildroot] [PATCH 1/2] fs: Add common rootfs dependencies to
 PACKAGES
In-Reply-To: <20181108130417.1277-2-anaumann@ultratronik.de>
References: <20181108130417.1277-1-anaumann@ultratronik.de>
 <20181108130417.1277-2-anaumann@ultratronik.de>
Message-ID: <20181113155102.4f977baa@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Andres,

On Thu,  8 Nov 2018 14:04:16 +0100, Andreas Naumann wrote:

> diff --git a/fs/common.mk b/fs/common.mk
> index 2a5a202a89..a4a178c88a 100644
> --- a/fs/common.mk
> +++ b/fs/common.mk
> @@ -65,6 +65,7 @@ ROOTFS_COMMON_DEPENDENCIES = \
>  	host-fakeroot host-makedevs \
>  	$(BR2_TAR_HOST_DEPENDENCY) \
>  	$(if $(PACKAGES_USERS)$(ROOTFS_USERS_TABLES),host-mkpasswd)
> +PACKAGES += $(ROOTFS_COMMON_DEPENDENCIES)

Thanks a lot for testing the PPSH stuff and providing some bug fixes!

I've integrated into my patch series the following change:

@@ -171,7 +172,7 @@ rootfs-$(1): $$(BINARIES_DIR)/rootfs.$(1)
 
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)),y)
 TARGETS_ROOTFS += rootfs-$(1)
-PACKAGES += $$(filter-out rootfs-%,$$(ROOTFS_$(2)_DEPENDENCIES))
+PACKAGES += $$(filter-out rootfs-%,$$(ROOTFS_$(2)_DEPENDENCIES)) $(ROOTFS_COMMON_DEPENDENCIES)
 endif
 
 # Check for legacy POST_TARGETS rules

which addresses this problem, while adding the dependencies only when a
filesystem image is selected. Having duplicates in PACKAGES is not a
problem.

I hope to send a v4 of my series soon.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
