From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Thu, 21 Feb 2013 15:58:40 +0100
Subject: [Buildroot] [PATCH 10/13] librtmp: new package
In-Reply-To: <cover.1361458625.git.maxime.hadjinlian@gmail.com>
References: <cover.1361458625.git.maxime.hadjinlian@gmail.com>
Message-ID: <b7845a27b24e15e0657906431ba388d10d725f73.1361458625.git.maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

librtmp - RTMPDump Real-Time Messaging Protocol API
This package was originally found at : https://github.com/huceke/buildroot-rbp
By gimli <ebsi4711@gmail.com>

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/Config.in          |    1 +
 package/librtmp/Config.in  |    8 ++++++++
 package/librtmp/librtmp.mk |   27 +++++++++++++++++++++++++++
 3 files changed, 36 insertions(+)
 create mode 100644 package/librtmp/Config.in
 create mode 100644 package/librtmp/librtmp.mk

diff --git a/package/Config.in b/package/Config.in
index 382d859..6e926bf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -434,6 +434,7 @@ source "package/libgtk2/Config.in"
 source "package/libpng/Config.in"
 source "package/libraw/Config.in"
 source "package/librsvg/Config.in"
+source "package/librtmp/Config.in"
 source "package/libsvgtiny/Config.in"
 source "package/libungif/Config.in"
 source "package/opencv/Config.in"
diff --git a/package/librtmp/Config.in b/package/librtmp/Config.in
new file mode 100644
index 0000000..8152f87
--- /dev/null
+++ b/package/librtmp/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBRTMP
+	bool "librtmp"
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_ZLIB
+	help
+	  librtmp - RTMPDump Real-Time Messaging Protocol API
+
+	  http://rtmpdump.mplayerhq.hu
diff --git a/package/librtmp/librtmp.mk b/package/librtmp/librtmp.mk
new file mode 100644
index 0000000..5e60428
--- /dev/null
+++ b/package/librtmp/librtmp.mk
@@ -0,0 +1,27 @@
+#############################################################
+#
+#librtmp
+#
+#############################################################
+
+LIBRTMP_VERSION = e0056c51cc1710c9a44d2a2c4e2f344fa9cabcf4
+LIBRTMP_SITE = git://git.ffmpeg.org/rtmpdump
+LIBRTMP_INSTALL_STAGING = YES
+LIBRTMP_LICENSE = GPLv2
+LIBRTMP_LICENSE_FILES = COPYING
+LIBRTMP_DEPENDENCIES = openssl zlib
+
+define LIBRTMP_BUILD_CMDS
+	sed -ie "s|prefix=/usr/local|prefix=/usr|" $(@D)/librtmp/Makefile
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) CROSS_COMPILE="$(TARGET_CROSS)" -C $(@D)/librtmp
+endef
+
+define LIBRTMP_INSTALL_STAGING_CMDS
+	$(MAKE) -C $(@D)/librtmp install DESTDIR=$(STAGING_DIR)
+endef
+
+define LIBRTMP_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D)/librtmp install DESTDIR=$(STAGING_DIR)
+endef
+
+$(eval $(generic-package))
-- 
1.7.10.4
