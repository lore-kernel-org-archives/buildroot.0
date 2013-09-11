From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Wed, 11 Sep 2013 16:59:21 -0500
Subject: [Buildroot] [PATCH v2 01/17] libsepol: new package
In-Reply-To: <1378936777-28308-1-git-send-email-clshotwe@rockwellcollins.com>
References: <1378936777-28308-1-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <1378936777-28308-2-git-send-email-clshotwe@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
---
Changes v1 -> v2:
  - Move Config.in entry into the libraries section since this is a
    library.
  - General cleanup to the mk file to conform to the standard format.
  - Fixed the license version to be LGPLv2.1+ to match the headers in
    the source files (suggested by Thomas)

 package/Config.in            |    4 +++
 package/libsepol/Config.in   |    7 ++++++
 package/libsepol/libsepol.mk |   48 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 59 insertions(+), 0 deletions(-)
 create mode 100644 package/libsepol/Config.in
 create mode 100644 package/libsepol/libsepol.mk

diff --git a/package/Config.in b/package/Config.in
index 2351839..aa0b1df 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -689,6 +689,10 @@ source "package/liblog4c-localtime/Config.in"
 source "package/tzdata/Config.in"
 endmenu
 
+menu "Security"
+source "package/libsepol/Config.in"
+endmenu
+
 menu "Text and terminal handling"
 source "package/enchant/Config.in"
 source "package/libfribidi/Config.in"
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
index 0000000..2731c57
--- /dev/null
+++ b/package/libsepol/libsepol.mk
@@ -0,0 +1,48 @@
+################################################################################
+#
+# libsepol
+#
+################################################################################
+
+LIBSEPOL_VERSION = 2.1.9
+LIBSEPOL_SITE = http://userspace.selinuxproject.org/releases/20130423/
+LIBSEPOL_LICENSE = LGPLv2.1+
+LIBSEPOL_LICENSE_FILES = COPYING
+
+LIBSEPOL_INSTALL_STAGING = YES
+
+define LIBSEPOL_BUILD_CMDS
+	# DESTDIR is needed during the compile to compute library and 
+	# header paths.
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) DESTDIR=$(STAGING_DIR)
+endef
+
+define LIBSEPOL_INSTALL_STAGING_CMDS
+	$(MAKE) -C $(@D) install $(TARGET_CONFIGURE_OPTS) DESTDIR=$(STAGING_DIR)
+endef
+
+define LIBSEPOL_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) install $(TARGET_CONFIGURE_OPTS) DESTDIR=$(TARGET_DIR)
+endef
+
+define LIBSEPOL_CLEAN_CMDS
+	$(MAKE) -C $(@D) clean
+endef
+
+define HOST_LIBSEPOL_BUILD_CMDS
+	$(MAKE) -C $(@D) $(HOST_CONFIGURE_OPTS) DESTDIR=$(HOST_DIR)
+endef
+
+define HOST_LIBSEPOL_INSTALL_CMDS
+	$(MAKE) -C $(@D) install $(HOST_CONFIGURE_OPTS) DESTDIR=$(HOST_DIR)
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
