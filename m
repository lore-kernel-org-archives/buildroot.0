From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Wed, 4 Sep 2013 18:09:40 -0500
Subject: [Buildroot] [PATCH 01/17] libsepol: new package
In-Reply-To: <1378336196-27403-1-git-send-email-clshotwe@rockwellcollins.com>
References: <1378336196-27403-1-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <1378336196-27403-2-git-send-email-clshotwe@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
---
 package/Config.in            |    4 ++
 package/libsepol/Config.in   |    7 ++++
 package/libsepol/libsepol.mk |   69 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 80 insertions(+), 0 deletions(-)
 create mode 100644 package/libsepol/Config.in
 create mode 100644 package/libsepol/libsepol.mk

diff --git a/package/Config.in b/package/Config.in
index a94cb62..21f7271 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -896,6 +896,10 @@ endif
 source "package/xmlstarlet/Config.in"
 endmenu
 
+menu "Security"
+source "package/libsepol/Config.in"
+endmenu
+
 menu "System tools"
 source "package/acl/Config.in"
 source "package/attr/Config.in"
diff --git a/package/libsepol/Config.in b/package/libsepol/Config.in
new file mode 100644
index 0000000..feb7f39
--- /dev/null
+++ b/package/libsepol/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBSEPOL
+	bool "libsepol"
+	help
+	  Libsepol is the binary policy manipulation library. It doesn't 
+	  depend upon or use any of the other SELinux components.
+	  
+	  http://selinuxproject.org/page/Main_Page
diff --git a/package/libsepol/libsepol.mk b/package/libsepol/libsepol.mk
new file mode 100644
index 0000000..59ca4bb
--- /dev/null
+++ b/package/libsepol/libsepol.mk
@@ -0,0 +1,69 @@
+#############################################################
+#
+# libsepol
+#
+#############################################################
+LIBSEPOL_VERSION = 2.1.9
+LIBSEPOL_SOURCE = libsepol-$(LIBSEPOL_VERSION).tar.gz
+LIBSEPOL_SITE = http://userspace.selinuxproject.org/releases/20130423/
+LIBSEPOL_LICENSE = LGPLv2.1
+LIBSEPOL_LICENSE_FILES = COPYING
+
+##############################
+# Target Section
+##############################
+LIBSEPOL_INSTALL_STAGING = YES
+LIBSEPOL_INSTALL_TARGET = YES
+
+LIBSEPOL_MAKE_CMDS = $(TARGET_CONFIGURE_OPTS)
+
+define LIBSEPOL_BUILD_CMDS
+	$(MAKE) -C $(@D) $(LIBSEPOL_MAKE_CMDS) DESTDIR=$(STAGING_DIR)
+endef
+
+define LIBSEPOL_INSTALL_STAGING_CMDS
+	$(MAKE) -C $(@D) install $(LIBSEPOL_MAKE_CMDS) DESTDIR=$(STAGING_DIR)
+endef
+
+define LIBSEPOL_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) install $(LIBSEPOL_MAKE_CMDS) DESTDIR=$(TARGET_DIR)
+endef
+
+define LIBSEPOL_CLEAN_CMDS
+	$(MAKE) -C $(@D) clean
+endef
+
+define LIBSEPOL_UNINSTALL_STAGING_CMDS
+	rm -rf $(addprefix $(STAGING_DIR),/usr/include/sepol /usr/bin/chkcon \
+		/usr/lib/pkgconfig/libsepol* /lib/libsepol* /usr/lib/libsepol*)
+	rm -f $(addprefix $(STAGING_DIR)/usr/man/man3/,$(notdir $(wildcard $(@D)/man/man3/*.3)))
+	rm -f $(addprefix $(STAGING_DIR)/usr/man/man3/,$(notdir $(wildcard $(@D)/man/man8/*.8)))
+endef
+
+define LIBSEPOL_UNINSTALL_TARGET_CMDS
+	rm -rf $(addprefix $(TARGET_DIR),/usr/bin/chkcon /usr/lib/pkgconfig/libsepol* \
+		/lib/libsepol* /usr/lib/libsepol*)
+endef
+
+##############################
+# Host Section
+##############################
+HOST_LIBSEPOL_MAKE_CMDS = $(HOST_CONFIGURE_OPTS)
+
+define HOST_LIBSEPOL_BUILD_CMDS
+	$(MAKE) -C $(@D) $(HOST_LIBSEPOL_MAKE_CMDS) DESTDIR=$(HOST_DIR)
+endef
+
+define HOST_LIBSEPOL_INSTALL_CMDS
+	$(MAKE) -C $(@D) install $(HOST_LIBSEPOL_MAKE_CMDS) DESTDIR=$(HOST_DIR)
+	mv $(HOST_DIR)/lib/libsepol.so.1 $(HOST_DIR)/usr/lib
+	(cd $(HOST_DIR)/usr/lib; rm -f libsepol.so; ln -s libsepol.so.1 libsepol.so)
+	-rmdir $(HOST_DIR)/lib
+endef
+
+define HOST_LIBSEPOL_CLEAN_CMDS
+	$(MAKE) -C $(@D) clean
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
1.7.1
