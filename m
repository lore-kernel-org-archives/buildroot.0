From: Carlos Santos <casantos@datacom.ind.br>
Date: Sat,  1 Apr 2017 23:36:41 -0300
Subject: [Buildroot] [PATCH v2] e2fsprogs: keep util-linux's fsck if chosen
Message-ID: <1491100601-7867-1-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since e2fsprogs depends on util-linux, it's built after it. So you can't
have e2fsck from e2fsprogs along with the fsck wrapper from util-linux
(which is better maintained and compatible with systemd) because we end
up deleting the fsck from util-linux.

Fix this issue by disabling e2fsprogs' fsck if the one from util-linux
is selected.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
Changes v1->v2
  - Add depenndece on !BR2_PACKAGE_UTIL_LINUX_FSCK to
    BR2_PACKAGE_E2FSPROGS_FSCK
  - Add comment telling that the fsck from util-linux has preference.
  - Pass "--enable-fsck" conditionally to configure
  - Remove the guard around the removal of /usr/sbin/fsck, since the
    fsck from busybox and util-linux are installed at /sbin
  - Improve comments and commit message

In the long run the e2fsprogs recipe deserves an extreme overhauling
like we did for util-linux but right now these changes are enough to
fix the specific problem of fsck.
---
 package/e2fsprogs/Config.in    |  4 ++++
 package/e2fsprogs/e2fsprogs.mk | 12 +++++++++---
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
index d1914a9..418f877 100644
--- a/package/e2fsprogs/Config.in
+++ b/package/e2fsprogs/Config.in
@@ -59,8 +59,12 @@ config BR2_PACKAGE_E2FSPROGS_FILEFRAG
 
 config BR2_PACKAGE_E2FSPROGS_FSCK
 	bool "fsck"
+	depends on !BR2_PACKAGE_UTIL_LINUX_FSCK
 	default y
 
+comment "the fsck from util-linux has preference over this one"
+	depends on BR2_PACKAGE_UTIL_LINUX_FSCK
+
 config BR2_PACKAGE_E2FSPROGS_FUSE2FS
 	bool "fuse2fs"
 	depends on !BR2_STATIC_LIBS # libfuse
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 3f235c5..b4b96c3 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -11,7 +11,7 @@ E2FSPROGS_LICENSE = GPL-2.0, BSD-3-Clause (libuuid), MIT-like with advertising c
 E2FSPROGS_LICENSE_FILES = NOTICE lib/uuid/COPYING lib/ss/mit-sipb-copyright.h lib/et/internal.h
 E2FSPROGS_INSTALL_STAGING = YES
 E2FSPROGS_DEPENDENCIES = host-pkgconf util-linux
-# we don't have a host-util-linux
+# We don't need host-util-linux, since we disable libblkid, libuuid.
 HOST_E2FSPROGS_DEPENDENCIES = host-pkgconf
 
 # e4defrag doesn't build on older systems like RHEL5.x, and we don't
@@ -24,11 +24,11 @@ E2FSPROGS_CONF_OPTS = \
 	$(if $(BR2_PACKAGE_E2FSPROGS_DEBUGFS),,--disable-debugfs) \
 	$(if $(BR2_PACKAGE_E2FSPROGS_E2IMAGE),,--disable-imager) \
 	$(if $(BR2_PACKAGE_E2FSPROGS_E4DEFRAG),,--disable-defrag) \
+	$(if $(BR2_PACKAGE_E2FSPROGS_FSCK),--enable-fsck,) \
 	$(if $(BR2_PACKAGE_E2FSPROGS_RESIZE2FS),,--disable-resizer) \
 	--disable-uuidd \
 	--disable-libblkid \
 	--disable-libuuid \
-	--enable-fsck \
 	--disable-e2initrd-helper \
 	--disable-testio-debug \
 	--disable-rpath
@@ -146,10 +146,16 @@ E2FSPROGS_DEPENDENCIES += busybox
 define E2FSPROGS_REMOVE_BUSYBOX_APPLETS
 	$(RM) -f $(TARGET_DIR)/bin/chattr
 	$(RM) -f $(TARGET_DIR)/bin/lsattr
-	$(RM) -f $(TARGET_DIR)/sbin/fsck
 	$(RM) -f $(TARGET_DIR)/sbin/tune2fs
 	$(RM) -f $(TARGET_DIR)/sbin/e2label
 endef
+
+ifeq ($(BR2_PACKAGE_E2FSPROGS_FSCK),y)
+# We only build fsck if it's not selected in util-linux, so at this
+# point /sbin/fsck must have come from busybox.
+E2FSPROGS_REMOVE_BUSYBOX_APPLETS += $(RM) -f $(TARGET_DIR)/sbin/fsck
+endif
+
 E2FSPROGS_PRE_INSTALL_TARGET_HOOKS += E2FSPROGS_REMOVE_BUSYBOX_APPLETS
 endif
 
-- 
2.7.4
