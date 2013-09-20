From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 20 Sep 2013 15:34:41 +0200
Subject: [Buildroot] [git commit] libsepol: new package
Message-ID: <20130920133433.BB4119B80D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=885d0007b07513338b141f5205d07e0a9f4a3cdb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: white space fixes]
Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in            |    4 +++
 package/libsepol/Config.in   |    7 ++++++
 package/libsepol/libsepol.mk |   48 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 59 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index e187aa3..c3725f2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -694,6 +694,10 @@ source "package/liblog4c-localtime/Config.in"
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
index 0000000..f92af52
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
index 0000000..4140ed3
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
