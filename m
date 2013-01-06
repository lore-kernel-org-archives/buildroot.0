From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 6 Jan 2013 22:56:15 +0100
Subject: [Buildroot] [git commit] libcofi: new package
Message-ID: <20130106221238.A1A379A550@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8bc34206c2ed03f24db1ed196a2fb7c5015acfb8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

replacement for memcpy and memset functionality
This package was originally found at : https://github.com/huceke/buildroot-rbp
By gimli <ebsi4711@gmail.com>

[Peter: wrap help text]
Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in          |    1 +
 package/libcofi/Config.in  |    8 ++++++++
 package/libcofi/libcofi.mk |   20 ++++++++++++++++++++
 3 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index c25ade2..3681dd3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -512,6 +512,7 @@ endmenu
 menu "Other"
 source "package/apr/Config.in"
 source "package/apr-util/Config.in"
+source "package/libcofi/Config.in"
 source "package/classpath/Config.in"
 source "package/fftw/Config.in"
 source "package/libargtable2/Config.in"
diff --git a/package/libcofi/Config.in b/package/libcofi/Config.in
new file mode 100644
index 0000000..e9914d6
--- /dev/null
+++ b/package/libcofi/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBCOFI
+	bool "libcofi"
+	depends on BR2_arm
+	help
+	  A replacement for memcpy and memset functionality for the
+	  Raspberry Pi with the intention of gaining greater performance.
+
+	  https://github.com/simonjhall/copies-and-fills
diff --git a/package/libcofi/libcofi.mk b/package/libcofi/libcofi.mk
new file mode 100644
index 0000000..e2ce702
--- /dev/null
+++ b/package/libcofi/libcofi.mk
@@ -0,0 +1,20 @@
+#############################################################
+#
+# libcofi
+#
+#############################################################
+
+LIBCOFI_VERSION = 7313fbe12b0593034d0a1b606bf33c7cf4ababce
+LIBCOFI_SITE = http://github.com/simonjhall/copies-and-fills/tarball/master
+LIBCOFI_LICENSE = LGPLv2.1
+LIBCOFI_LICENSE_FILES = README.md
+
+define LIBCOFI_BUILD_CMDS
+    $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define LIBCOFI_INSTALL_TARGET_CMDS
+    $(INSTALL) -D -m 0755 $(@D)/libcofi_rpi.so $(TARGET_DIR)/usr/lib/libcofi_rpi.so
+endef
+
+$(eval $(generic-package))
