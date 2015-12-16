From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Dec 2015 22:11:33 +0100
Subject: [Buildroot] [git commit] package/libhdhomerun: new package
Message-ID: <20151216211156.C9AF681E3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4cb010a5f1773d11c0dadcb3ac5ffa6e154fa113
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed for new kodi-pvr-hdhomerun package.

[Thomas: use TARGET_MAKE_ENV, other minor tweaks.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                          |  1 +
 package/libhdhomerun/0001-dont-strip.patch | 18 +++++++++++++++++
 package/libhdhomerun/Config.in             | 12 ++++++++++++
 package/libhdhomerun/libhdhomerun.hash     |  2 ++
 package/libhdhomerun/libhdhomerun.mk       | 31 ++++++++++++++++++++++++++++++
 5 files changed, 64 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 6cae946..2e9554c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -983,6 +983,7 @@ menu "Multimedia"
 	source "package/libfslcodec/Config.in"
 	source "package/libfslparser/Config.in"
 	source "package/libfslvpuwrap/Config.in"
+	source "package/libhdhomerun/Config.in"
 	source "package/libmatroska/Config.in"
 	source "package/libmms/Config.in"
 	source "package/libmpeg2/Config.in"
diff --git a/package/libhdhomerun/0001-dont-strip.patch b/package/libhdhomerun/0001-dont-strip.patch
new file mode 100644
index 0000000..17a9ff4
--- /dev/null
+++ b/package/libhdhomerun/0001-dont-strip.patch
@@ -0,0 +1,18 @@
+Disable strip in Makefile.
+
+Patch downloaded from Gentoo:
+https://gitweb.gentoo.org/repo/gentoo.git/tree/media-libs/libhdhomerun/files/dont-strip.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -Nur libhdhomerun/Makefile libhdhomerun.fix/Makefile
+--- libhdhomerun/Makefile	2012-08-30 15:46:27.000000000 -0500
++++ libhdhomerun.fix/Makefile	2013-03-24 14:47:08.740937164 -0500
+@@ -42,7 +42,6 @@
+ 
+ hdhomerun_config$(BINEXT) : hdhomerun_config.c $(LIBSRCS)
+ 	$(CC) $(CFLAGS) $+ $(LDFLAGS) -o $@
+-	$(STRIP) $@
+ 
+ libhdhomerun$(LIBEXT) : $(LIBSRCS)
+ 	$(CC) $(CFLAGS) -fPIC -DDLL_EXPORT $(SHARED) $+ $(LDFLAGS) -o $@
diff --git a/package/libhdhomerun/Config.in b/package/libhdhomerun/Config.in
new file mode 100644
index 0000000..9425c1b
--- /dev/null
+++ b/package/libhdhomerun/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LIBHDHOMERUN
+	bool "libhdhomerun"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
+	help
+	  HDHomeRun is a network-attached digital television tuner
+	  box, produced by the company SiliconDust USA, Inc.
+
+	  http://www.silicondust.com
+
+comment "libhdhomerun needs a toolchain w/ threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/libhdhomerun/libhdhomerun.hash b/package/libhdhomerun/libhdhomerun.hash
new file mode 100644
index 0000000..7897764
--- /dev/null
+++ b/package/libhdhomerun/libhdhomerun.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	907dfbd1eb82aebd8b09e7c00c21a02433e6baaacf4a4f99aa2511b1d5244baf	libhdhomerun_20150826.tgz
diff --git a/package/libhdhomerun/libhdhomerun.mk b/package/libhdhomerun/libhdhomerun.mk
new file mode 100644
index 0000000..e3e5f06
--- /dev/null
+++ b/package/libhdhomerun/libhdhomerun.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# libhdhomerun
+#
+################################################################################
+
+LIBHDHOMERUN_VERSION = 20150826
+LIBHDHOMERUN_SOURCE = libhdhomerun_$(LIBHDHOMERUN_VERSION).tgz
+LIBHDHOMERUN_SITE = http://download.silicondust.com/hdhomerun
+LIBHDHOMERUN_LICENSE = LGPLv2.1+
+LIBHDHOMERUN_LICENSE_FILES = lgpl.txt
+LIBHDHOMERUN_INSTALL_STAGING = YES
+
+define LIBHDHOMERUN_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
+		CROSS_COMPILE="$(TARGET_CROSS)" -C $(@D)
+endef
+
+define LIBHDHOMERUN_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/libhdhomerun.so \
+		$(STAGING_DIR)/usr/lib/libhdhomerun.so
+	$(INSTALL) -m 0644 $(@D)/*.h \
+		$(STAGING_DIR)/usr/include/
+endef
+
+define LIBHDHOMERUN_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/libhdhomerun.so \
+		$(TARGET_DIR)/usr/lib/libhdhomerun.so
+endef
+
+$(eval $(generic-package))
