From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Apr 2014 11:21:52 +0200
Subject: [Buildroot] [git commit] libcap: add menu entry to install tools.
Message-ID: <20140421092236.531969C8DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=57155c6b6a7a40523075626353375109fe159c04
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libcap provides a set of tools to manipulate capabilities, among which
`setcap(8)` and `getcap(8)`. A new menu entry has been added to install them.

[Thomas: mark the new option as requiring MMU support, because the
programs use fork(), and completely rework the new .mk logic as it
wasn't taking into account the BR2_PREFER_STATIC_LIB case.]

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libcap/Config.in |   15 +++++++++++++++
 package/libcap/libcap.mk |   27 +++++++++++++++++++++++----
 2 files changed, 38 insertions(+), 4 deletions(-)

diff --git a/package/libcap/Config.in b/package/libcap/Config.in
index 7bf6c58..5b0c827 100644
--- a/package/libcap/Config.in
+++ b/package/libcap/Config.in
@@ -7,3 +7,18 @@ config BR2_PACKAGE_LIBCAP
 	  privilege into a set of distinct privileges.
 
 	  http://sites.google.com/site/fullycapable/
+
+if BR2_PACKAGE_LIBCAP
+
+config BR2_PACKAGE_LIBCAP_TOOLS
+	bool "install tools"
+	depends on BR2_USE_MMU
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
index 17e2eb5..a3b7d4e 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -33,20 +33,39 @@ LIBCAP_MAKE_TARGET = all
 LIBCAP_MAKE_INSTALL_TARGET = install
 endif
 
+LIBCAP_MAKE_FLAGS = \
+	LIBATTR=$(LIBCAP_HAVE_LIBATTR) \
+	BUILD_CC="$(HOSTCC)" \
+	BUILD_CFLAGS="$(HOST_CFLAGS)"
+
+ifeq ($(BR2_PACKAGE_LIBCAP_TOOLS),y)
+define LIBCAP_BUILD_TOOLS_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/progs \
+		 $(LIBCAP_MAKE_FLAGS)
+endef
+
+define LIBCAP_INSTALL_TOOLS_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/progs \
+		RAISE_SETFCAP=no prefix=/usr \
+		DESTDIR=$(TARGET_DIR) $(LIBCAP_MAKE_FLAGS) install
+endef
+endif
+
 define LIBCAP_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/libcap \
-		LIBATTR=$(LIBCAP_HAVE_LIBATTR) BUILD_CC="$(HOSTCC)" \
-		BUILD_CFLAGS="$(HOST_CFLAGS)" $(LIBCAP_MAKE_TARGET)
+		$(LIBCAP_MAKE_FLAGS) $(LIBCAP_MAKE_TARGET)
+	$(LIBCAP_BUILD_TOOLS_CMDS)
 endef
 
 define LIBCAP_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libcap LIBATTR=$(LIBCAP_HAVE_LIBATTR) \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libcap $(LIBCAP_MAKE_FLAGS) \
 		DESTDIR=$(STAGING_DIR) prefix=/usr lib=lib $(LIBCAP_MAKE_INSTALL_TARGET)
 endef
 
 define LIBCAP_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libcap LIBATTR=$(LIBCAP_HAVE_LIBATTR) \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libcap $(LIBCAP_MAKE_FLAGS) \
 		DESTDIR=$(TARGET_DIR) prefix=/usr lib=lib $(LIBCAP_MAKE_INSTALL_TARGET)
+	$(LIBCAP_INSTALL_TOOLS_CMDS)
 endef
 
 define HOST_LIBCAP_BUILD_CMDS
