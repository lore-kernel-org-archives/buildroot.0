From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 13 Dec 2016 22:37:45 +0100
Subject: [Buildroot] [PATCH 1/3] core: allow packages to declare a
	permission file
In-Reply-To: <cover.1481665059.git.yann.morin.1998@free.fr>
References: <cover.1481665059.git.yann.morin.1998@free.fr>
Message-ID: <548994759a3a6202962c0479c6602363d8814c2b.1481665059.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, packages can define a variable that holds all the permissions
to set on the files it installs. This can be used to set various
permissions, like ownership, mode, suid/sgid/sticky bits to individual
files.

However, this variable has to contain entries that are known the moment
we scan the .mk file; it is not possible to conditionally add permisions
for files which presence depend on post-parse conditions.

This is the case for example for Busybox, for which we don't know whether
a specific applet will be enabled or not until after the configure
command has run.

Introduce a new variable that packages can set to point to a file that
contains a permission table. That filewill only be used when a filesystem
image is asembled, so the file can be generated, either at configure or
build time, with no problem.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Note: this will be usefull for Busybox, to properly handle the SELinux
contexts of the individual applets.
---
 fs/common.mk           | 1 +
 package/pkg-generic.mk | 1 +
 2 files changed, 2 insertions(+)

diff --git a/fs/common.mk b/fs/common.mk
index 7515fdc..843f7ca 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -90,6 +90,7 @@ ifeq ($$(BR2_ROOTFS_DEVICE_CREATION_STATIC),y)
 	$$(call PRINTF,$$(PACKAGES_DEVICES_TABLE)) >> $$(FULL_DEVICE_TABLE)
 endif
 	$$(call PRINTF,$$(PACKAGES_PERMISSIONS_TABLE)) >> $$(FULL_DEVICE_TABLE)
+	cat $$(PACKAGES_PERMISSIONS_TABLE_FILES) >> $$(FULL_DEVICE_TABLE)
 	echo "$$(HOST_DIR)/usr/bin/makedevs -d $$(FULL_DEVICE_TABLE) $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
 endif
 	$$(foreach s,$$(call qstrip,$$(BR2_ROOTFS_POST_FAKEROOT_SCRIPT)),\
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 827de62..0f88786 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -904,6 +904,7 @@ PACKAGES += $(1)
 ifneq ($$($(2)_PERMISSIONS),)
 PACKAGES_PERMISSIONS_TABLE += $$($(2)_PERMISSIONS)$$(sep)
 endif
+PACKAGES_PERMISSIONS_FILES += $$($(2)_PERMISSIONS_FILE)
 ifneq ($$($(2)_DEVICES),)
 PACKAGES_DEVICES_TABLE += $$($(2)_DEVICES)$$(sep)
 endif
-- 
2.7.4
