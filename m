From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 6 Nov 2012 08:20:16 +0100
Subject: [Buildroot] [git commit] busybox: add support to link against
	libtirpc when available
Message-ID: <20121106072424.0371B99BFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7266e7630d4785e6228fdc981e2ce560291d085d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/busybox.mk |   19 +++++++++++++++++--
 1 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 2fa1aa5..549e150 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -15,14 +15,29 @@ BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
 BUSYBOX_LICENSE = GPLv2
 BUSYBOX_LICENSE_FILES = LICENSE
 
+BUSYBOX_CFLAGS = \
+	$(TARGET_CFLAGS) \
+	-I$(LINUX_HEADERS_DIR)/include
+
+BUSYBOX_LDFLAGS = \
+	$(TARGET_LDFLAGS)
+
+# Link against libtirpc if available so that we can leverage its RPC
+# support for NFS mounting with Busybox
+ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
+BUSYBOX_DEPENDENCIES += libtirpc
+BUSYBOX_CFLAGS += -I$(STAGING_DIR)/usr/include/tirpc/
+BUSYBOX_LDFLAGS += -ltirpc
+endif
+
 BUSYBOX_BUILD_CONFIG = $(BUSYBOX_DIR)/.config
 # Allows the build system to tweak CFLAGS
-BUSYBOX_MAKE_ENV = $(TARGET_MAKE_ENV) CFLAGS="$(TARGET_CFLAGS) -I$(LINUX_HEADERS_DIR)/include"
+BUSYBOX_MAKE_ENV = $(TARGET_MAKE_ENV) CFLAGS="$(BUSYBOX_CFLAGS)"
 BUSYBOX_MAKE_OPTS = \
 	CC="$(TARGET_CC)" \
 	ARCH=$(KERNEL_ARCH) \
 	PREFIX="$(TARGET_DIR)" \
-	EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
+	EXTRA_LDFLAGS="$(BUSYBOX_LDFLAGS)" \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
 	CONFIG_PREFIX="$(TARGET_DIR)" \
 	SKIP_STRIP=y
