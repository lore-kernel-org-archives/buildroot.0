From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 8 Oct 2010 09:20:57 +0200
Subject: [Buildroot] [git commit master 1/1] package: Add rrdtool package
Message-ID: <20101008072312.99B1B8BE9A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5d73b07ee731a890e13b00b529f74b093d5ca8d4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: use hook to remove examples]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    2 +-
 package/Config.in          |    3 +++
 package/rrdtool/Config.in  |   15 +++++++++++++++
 package/rrdtool/rrdtool.mk |   28 ++++++++++++++++++++++++++++
 4 files changed, 47 insertions(+), 1 deletions(-)
 create mode 100644 package/rrdtool/Config.in
 create mode 100644 package/rrdtool/rrdtool.mk

diff --git a/CHANGES b/CHANGES
index 41406b8..3cf4a0f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -21,7 +21,7 @@
 
 	Alpha, Cris, IA64 and Sparc64 architecture support removed.
 
-	New packages: gst-ffmpeg, libmpeg2, librsvg, xz
+	New packages: gst-ffmpeg, libmpeg2, librsvg, rrdtool, xz
 
 	Updated/fixed packages: acpid, alsa-lib, argus, at, autoconf,
 	automake, avahi, axel, beecrypt, berkeleydb, bind, bmon, boa,
diff --git a/package/Config.in b/package/Config.in
index 5e08d59..3b6cd19 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -85,6 +85,9 @@ endmenu
 
 menu "Graphic libraries and applications (graphic/text)"
 
+comment "Graphic applications"
+source "package/rrdtool/Config.in"
+
 comment "graphic libraries"
 source "package/directfb/Config.in"
 source "package/directfb-examples/Config.in"
diff --git a/package/rrdtool/Config.in b/package/rrdtool/Config.in
new file mode 100644
index 0000000..d315b57
--- /dev/null
+++ b/package/rrdtool/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_RRDTOOL
+	bool "rrdtool"
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_LIBART
+	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_ZLIB
+	help
+	  RRDtool is the OpenSource industry standard, high performance
+	  data logging and graphing system for time series data.
+
+	  http://oss.oetiker.ch/rrdtool/
+
+comment "rrdtool requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
diff --git a/package/rrdtool/rrdtool.mk b/package/rrdtool/rrdtool.mk
new file mode 100644
index 0000000..80789c6
--- /dev/null
+++ b/package/rrdtool/rrdtool.mk
@@ -0,0 +1,28 @@
+#############################################################
+#
+# rrdtool
+#
+#############################################################
+
+RRDTOOL_VERSION = 1.2.30
+RRDTOOL_SITE = http://oss.oetiker.ch/rrdtool/pub
+RRDTOOL_DEPENDENCIES = host-pkg-config freetype libart libpng zlib
+RRDTOOL_INSTALL_STAGING = YES
+RRDTOOL_CONF_ENV = rd_cv_ieee_works=yes rd_cv_null_realloc=nope \
+			ac_cv_func_mmap_fixed_mapped=yes
+RRDTOOL_CONF_OPT = --disable-perl --disable-python --disable-ruby \
+			--disable-tcl --program-transform-name=''
+
+define RRDTOOL_REMOVE_EXAMPLES
+	rm -rf $(TARGET_DIR)/usr/share/rrdtool/examples
+endef
+
+RRDTOOL_POST_INSTALL_TARGET_HOOKS += RRDTOOL_REMOVE_EXAMPLES
+
+define RRDTOOL_UNINSTALL_TARGET_CMDS
+	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) uninstall
+	rm -rf $(TARGET_DIR)/usr/share/rrdtool
+	rm -f $(TARGET_DIR)/usr/lib/librrd*
+endef
+
+$(eval $(call AUTOTARGETS,package,rrdtool))
-- 
1.7.1
