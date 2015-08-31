From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 31 Aug 2015 11:21:05 +0200
Subject: [Buildroot] [PATCH] exfat: fix build with musl
Message-ID: <1441012865-31350-1-git-send-email-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/e1d/e1db07f0ea1e70c62f3294016c1b3a094de71d12/

The endianness handling functions in platform.h are protected behind ifdef
__GLIBC__ which musl doesn't define even though it does provide the
endianness handling interface.  Work around it by ensuring __GLIBC__ is
defined.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/exfat/exfat.mk | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/package/exfat/exfat.mk b/package/exfat/exfat.mk
index 097c3ac..5508ec3 100644
--- a/package/exfat/exfat.mk
+++ b/package/exfat/exfat.mk
@@ -10,15 +10,24 @@ EXFAT_SOURCE = fuse-exfat-$(EXFAT_VERSION).tar.gz
 EXFAT_DEPENDENCIES = host-scons libfuse
 EXFAT_LICENSE = GPLv3+
 EXFAT_LICENSE_FILES = COPYING
+EXFAT_CFLAGS = $(TARGET_CFLAGS) -std=c99
+
+# The endianness handling functions in platform.h are protected behind
+# ifdef __GLIBC__ which musl doesn't define even though it does
+# provide the endianness handling interface. Work around it by
+# ensuring __GLIBC__ is defined.
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+EXFAT_CFLAGS += -D__GLIBC__
+endif
 
 define EXFAT_BUILD_CMDS
 	(cd $(@D); \
-		$(TARGET_CONFIGURE_OPTS) CCFLAGS="$(TARGET_CFLAGS) -std=c99" $(SCONS))
+		$(TARGET_CONFIGURE_OPTS) CCFLAGS="$(EXFAT_CFLAGS)" $(SCONS))
 endef
 
 define EXFAT_INSTALL_TARGET_CMDS
 	(cd $(@D); \
-		$(TARGET_CONFIGURE_OPTS) CCFLAGS="$(TARGET_CFLAGS) -std=c99" $(SCONS) \
+		$(TARGET_CONFIGURE_OPTS) CCFLAGS="$(EXFAT_CFLAGS)" $(SCONS) \
 		DESTDIR=$(TARGET_DIR)/usr/sbin install)
 endef
 
-- 
2.1.4
