From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 27 Nov 2012 16:43:42 -0800
Subject: [Buildroot] [git commit] package: add libmatroska package
Message-ID: <20121203145712.B5A0C99808@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d69172d7d807769f5091a612f7145bd464c7bc82
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                  |    1 +
 package/libmatroska/Config.in      |   12 ++++++++++++
 package/libmatroska/libmatroska.mk |   27 +++++++++++++++++++++++++++
 3 files changed, 40 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index fa04fd7..f3ca496 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -436,6 +436,7 @@ menu "Multimedia"
 source "package/libdvdread/Config.in"
 source "package/libdvdnav/Config.in"
 source "package/libebml/Config.in"
+source "package/libmatroska/Config.in"
 source "package/libmms/Config.in"
 source "package/libmpeg2/Config.in"
 source "package/libogg/Config.in"
diff --git a/package/libmatroska/Config.in b/package/libmatroska/Config.in
new file mode 100644
index 0000000..b1c53ee
--- /dev/null
+++ b/package/libmatroska/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LIBMATROSKA
+	bool "libmatroska"
+	select BR2_PACKAGE_LIBEBML
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  Extensible open standard audio/video container format access
+	  library.
+
+	  http://matroska.org
+
+comment "libmatroska requires a toolchain with C++ support"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/libmatroska/libmatroska.mk b/package/libmatroska/libmatroska.mk
new file mode 100644
index 0000000..605a2fb
--- /dev/null
+++ b/package/libmatroska/libmatroska.mk
@@ -0,0 +1,27 @@
+#############################################################
+#
+# libmatroska
+#
+#############################################################
+
+LIBMATROSKA_VERSION = 1.3.0
+LIBMATROSKA_SOURCE = libmatroska-$(LIBMATROSKA_VERSION).tar.bz2
+LIBMATROSKA_SITE = http://dl.matroska.org/downloads/libmatroska/
+LIBMATROSKA_INSTALL_STAGING = YES
+LIBMATROSKA_LICENSE = LGPLv2.1+
+LIBMATROSKA_LICENSE_FILES = LICENSE.LGPL
+LIBMATROSKA_DEPENDENCIES = libebml
+
+define LIBMATROSKA_BUILD_CMDS
+	$(MAKE) -C $(@D)/make/linux CROSS="$(CCACHE) $(TARGET_CROSS)"
+endef
+
+define LIBMATROSKA_INSTALL_STAGING_CMDS
+	$(MAKE) -C $(@D)/make/linux prefix=$(STAGING_DIR)/usr install
+endef
+
+define LIBMATROSKA_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D)/make/linux prefix=$(TARGET_DIR)/usr install
+endef
+
+$(eval $(generic-package))
