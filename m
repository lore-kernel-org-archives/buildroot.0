From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 20 Apr 2014 21:30:13 +0200
Subject: [Buildroot] [PATCH 1/1] libcap: add menu entry to install tools.
Message-ID: <1398022213-9728-1-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libcap provides a set of tools to manipulate capabilities, among which
`setcap(8)` and `getcap(8)`. A new menu entry has been added to install them.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/libcap/Config.in | 14 ++++++++++++++
 package/libcap/libcap.mk | 13 +++++++++++--
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/package/libcap/Config.in b/package/libcap/Config.in
index 7bf6c58..596da26 100644
--- a/package/libcap/Config.in
+++ b/package/libcap/Config.in
@@ -7,3 +7,17 @@ config BR2_PACKAGE_LIBCAP
 	  privilege into a set of distinct privileges.
 
 	  http://sites.google.com/site/fullycapable/
+
+if BR2_PACKAGE_LIBCAP
+
+config BR2_PACKAGE_LIBCAP_TOOLS
+	bool "install tools"
+	help
+	  Install setcap, getcap, getpcaps and capsh tools.
+
+	  For these tools to run properly, you should enable, in your
+	  kernel configuration, extended file attributes/security labels
+	  support for the file system type used on target system (e.g.
+	  CONFIG_EXT2_FS_XATTR and CONFIG_EXT2_FS_SECURITY for ext2).
+
+endif
diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index 17e2eb5..4570a62 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -14,6 +14,7 @@ LIBCAP_LICENSE_FILES = License
 
 LIBCAP_DEPENDENCIES = host-libcap
 LIBCAP_INSTALL_STAGING = YES
+LIBCAP_BINARIES = setcap getcap getpcaps capsh
 
 ifeq ($(BR2_PACKAGE_ATTR),y)
 	LIBCAP_DEPENDENCIES += attr
@@ -34,7 +35,7 @@ LIBCAP_MAKE_INSTALL_TARGET = install
 endif
 
 define LIBCAP_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/libcap \
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
 		LIBATTR=$(LIBCAP_HAVE_LIBATTR) BUILD_CC="$(HOSTCC)" \
 		BUILD_CFLAGS="$(HOST_CFLAGS)" $(LIBCAP_MAKE_TARGET)
 endef
@@ -45,10 +46,18 @@ define LIBCAP_INSTALL_STAGING_CMDS
 endef
 
 define LIBCAP_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libcap LIBATTR=$(LIBCAP_HAVE_LIBATTR) \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) LIBATTR=$(LIBCAP_HAVE_LIBATTR) \
+		RAISE_SETFCAP=no \
 		DESTDIR=$(TARGET_DIR) prefix=/usr lib=lib $(LIBCAP_MAKE_INSTALL_TARGET)
 endef
 
+ifeq ($(BR2_PACKAGE_LIBCAP_TOOLS),)
+define LIBCAP_REMOVE_TOOLS
+	rm -f $(addprefix $(TARGET_DIR)/usr/sbin/, $(LIBCAP_BINARIES))
+endef
+LIBCAP_POST_INSTALL_TARGET_HOOKS += LIBCAP_REMOVE_TOOLS
+endif
+
 define HOST_LIBCAP_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) LIBATTR=no
 endef
-- 
1.9.0
