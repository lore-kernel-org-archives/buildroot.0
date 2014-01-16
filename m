From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Thu, 16 Jan 2014 01:15:49 +0100
Subject: [Buildroot] [PATCH v2 06/12] librtmp: new package
In-Reply-To: <1389831355-19983-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1389831355-19983-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1389831355-19983-7-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

rtmpdump - RTMPDump Real-Time Messaging Protocol API
This package was originally found at : https://github.com/huceke/buildroot-rbp
By gimli <ebsi4711@gmail.com>

Note that this package will only install librtmp in this state.
Hence the name librtmp instead of rtmpdump

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: gimli <ebsi4711@gmail.com>
---
 package/Config.in          |  1 +
 package/librtmp/Config.in  |  8 ++++++++
 package/librtmp/librtmp.mk | 51 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 60 insertions(+)
 create mode 100644 package/librtmp/Config.in
 create mode 100644 package/librtmp/librtmp.mk

diff --git a/package/Config.in b/package/Config.in
index 8aa4a2a..a5a7572 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -548,6 +548,7 @@ source "package/libpng/Config.in"
 source "package/libqrencode/Config.in"
 source "package/libraw/Config.in"
 source "package/librsvg/Config.in"
+source "package/librtmp/Config.in"
 source "package/libsvg/Config.in"
 source "package/libsvg-cairo/Config.in"
 source "package/libsvgtiny/Config.in"
diff --git a/package/librtmp/Config.in b/package/librtmp/Config.in
new file mode 100644
index 0000000..b04b9f6
--- /dev/null
+++ b/package/librtmp/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBRTMP
+  bool "librtmp"
+  select BR2_PACKAGE_ZLIB
+  help
+    rtmpdump - RTMPDump Real-Time Messaging Protocol API
+    Only librtmp is installed by this package.
+
+    http://rtmpdump.mplayerhq.hu
diff --git a/package/librtmp/librtmp.mk b/package/librtmp/librtmp.mk
new file mode 100644
index 0000000..3cb1b91
--- /dev/null
+++ b/package/librtmp/librtmp.mk
@@ -0,0 +1,51 @@
+################################################################################
+#
+#librtmp
+#
+################################################################################
+
+LIBRTMP_VERSION = e0056c51cc1710c9a44d2a2c4e2f344fa9cabcf4
+LIBRTMP_SITE = git://git.ffmpeg.org/rtmpdump
+LIBRTMP_INSTALL_STAGING = YES
+# Note that LIBRTMP is GPLv2 but librtmp has its own license and since we only
+# care about the librtmp, it's LGPLv2.1+
+LIBRTMP_LICENSE = LGPLv2.1+
+LIBRTMP_LICENSE_FILES = librtmp/COPYING
+LIBRTMP_DEPENDENCIES = zlib
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+    LIBRTMP_DEPENDENCIES += gnutls
+else
+    ifeq ($(BR2_PACKAGE_POLARSSL),y)
+        LIBRTMP_DEPENDENCIES += polarssl
+    else
+        LIBRTMP_DEPENDENCIES += openssl
+    endif
+endif
+
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+	LIBRTMP_PIC =
+else
+	LIBRTMP_PIC = -fPIC
+endif
+
+define LIBRTMP_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS) $(LIBRTMP_PIC)" CROSS_COMPILE="$(TARGET_CROSS)" -C $(@D)/librtmp
+endef
+
+define LIBRTMP_FIX_PREFIX
+	sed -ie "s|prefix=/usr/local|prefix=/usr|" $(@D)/librtmp/Makefile
+endef
+
+define LIBRTMP_INSTALL_STAGING_CMDS
+	mkdir -p $(STAGING_DIR)/usr/local/lib
+	$(MAKE) -C $(@D)/librtmp install DESTDIR=$(STAGING_DIR)
+endef
+
+define LIBRTMP_INSTALL_TARGET_CMDS
+	mkdir -p $(STAGING_DIR)/usr/local/lib
+	$(MAKE) -C $(@D)/librtmp install DESTDIR=$(TARGET_DIR)
+endef
+
+LIBRTMP_POST_EXTRACT_HOOKS += LIBRTMP_FIX_PREFIX
+
+$(eval $(generic-package))
-- 
1.8.5.2
