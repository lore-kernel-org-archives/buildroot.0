From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 27 Nov 2012 16:06:05 -0800
Subject: [Buildroot] [git commit branch/next] package: add libebml package
Message-ID: <20121128011245.126568F461@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d19be01683b6f79427beb4edfa8ae5a711fc81ef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in          |    1 +
 package/libebml/Config.in  |   11 +++++++++++
 package/libebml/libebml.mk |   26 ++++++++++++++++++++++++++
 3 files changed, 38 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index d566a39..fa04fd7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -435,6 +435,7 @@ endmenu
 menu "Multimedia"
 source "package/libdvdread/Config.in"
 source "package/libdvdnav/Config.in"
+source "package/libebml/Config.in"
 source "package/libmms/Config.in"
 source "package/libmpeg2/Config.in"
 source "package/libogg/Config.in"
diff --git a/package/libebml/Config.in b/package/libebml/Config.in
new file mode 100644
index 0000000..ce855b2
--- /dev/null
+++ b/package/libebml/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBEBML
+	bool "libebml"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  Access library for the EBML (Extensible Binary Meta
+	  Language, a binary derivative of XML) format.
+
+	  http://matroska.org
+
+comment "libebml requires a toolchain with C++ support"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/libebml/libebml.mk b/package/libebml/libebml.mk
new file mode 100644
index 0000000..0a04635
--- /dev/null
+++ b/package/libebml/libebml.mk
@@ -0,0 +1,26 @@
+#############################################################
+#
+# libebml
+#
+#############################################################
+
+LIBEBML_VERSION = 1.2.2
+LIBEBML_SOURCE = libebml-$(LIBEBML_VERSION).tar.bz2
+LIBEBML_SITE = http://dl.matroska.org/downloads/libebml/
+LIBEBML_INSTALL_STAGING = YES
+LIBEBML_LICENSE = LGPLv2.1+
+LIBEBML_LICENSE_FILES = LICENSE.LGPL
+
+define LIBEBML_BUILD_CMDS
+	$(MAKE) -C $(@D)/make/linux CROSS="$(CCACHE) $(TARGET_CROSS)"
+endef
+
+define LIBEBML_INSTALL_STAGING_CMDS
+	$(MAKE) -C $(@D)/make/linux prefix=$(STAGING_DIR)/usr install
+endef
+
+define LIBEBML_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D)/make/linux prefix=$(TARGET_DIR)/usr install
+endef
+
+$(eval $(generic-package))
