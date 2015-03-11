From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 11 Mar 2015 16:49:28 -0300
Subject: [Buildroot] [PATCH] btrfs-progs: bump to version 3.19
Message-ID: <1426103368-5611-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Convert to autotools with a little help for static.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/btrfs-progs/btrfs-progs.hash |  2 +-
 package/btrfs-progs/btrfs-progs.mk   | 29 ++++++++---------------------
 2 files changed, 9 insertions(+), 22 deletions(-)

diff --git a/package/btrfs-progs/btrfs-progs.hash b/package/btrfs-progs/btrfs-progs.hash
index 655ef5f..7917bb0 100644
--- a/package/btrfs-progs/btrfs-progs.hash
+++ b/package/btrfs-progs/btrfs-progs.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs/sha256sums.asc
-sha256	dd8ddb4d201e5ffd32a15ed0e1f33fbc2c8fb16383f1519a9fae136698c2dfec	btrfs-progs-v3.18.2.tar.xz
+sha256	b23965d7214ebc93937df658f18fefe020fc2fd2be4d591094ef1aae168a36c8	btrfs-progs-v3.19.tar.xz
diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index 768660d..0b61e5f 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -4,35 +4,22 @@
 #
 ################################################################################
 
-BTRFS_PROGS_VERSION = 3.18.2
+BTRFS_PROGS_VERSION = 3.19
 BTRFS_PROGS_SITE = https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs
 BTRFS_PROGS_SOURCE = btrfs-progs-v$(BTRFS_PROGS_VERSION).tar.xz
-BTRFS_PROGS_DEPENDENCIES = acl attr e2fsprogs lzo util-linux zlib
-BTRFS_PROGS_MAKE_FLAGS = DISABLE_DOCUMENTATION=1 DISABLE_BACKTRACE=1
+BTRFS_PROGS_DEPENDENCIES = host-pkgconf acl attr e2fsprogs lzo util-linux zlib
+BTRFS_PROGS_CONF_OPTS = --disable-backtrace
 BTRFS_PROGS_LICENSE = GPLv2
 BTRFS_PROGS_LICENSE_FILES = COPYING
 
-
+# Doesn't autodetect static-only and tries to build both
 ifeq ($(BR2_STATIC_LIBS),y)
-BTRFS_PROGS_MAKE_TARGET = static
-BTRFS_PROGS_MAKE_INSTALL_TARGET = install-static
-ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
-# Add -lintl for libuuid
-BTRFS_PROGS_MAKE_FLAGS += lib_LIBS="-luuid -lblkid -lz -llzo2 -L. -lintl -pthread"
-endif
-else
-BTRFS_PROGS_MAKE_TARGET = all
-BTRFS_PROGS_MAKE_INSTALL_TARGET = install
-endif
-
 define BTRFS_PROGS_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
-		$(BTRFS_PROGS_MAKE_FLAGS) $(BTRFS_PROGS_MAKE_TARGET)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) static
 endef
-
 define BTRFS_PROGS_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) prefix=/usr DESTDIR=$(TARGET_DIR) \
-		$(BTRFS_PROGS_MAKE_FLAGS) $(BTRFS_PROGS_MAKE_INSTALL_TARGET)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install-static
 endef
+endif
 
-$(eval $(generic-package))
+$(eval $(autotools-package))
-- 
2.0.5
