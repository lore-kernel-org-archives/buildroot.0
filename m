From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 29 Jun 2019 17:12:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/giflib: security bump version to
 5.2.1
Message-ID: <20190629151237.13413-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Version 5.1.5 fixes CVE-2018-11490
https://sourceforge.net/p/giflib/code/ci/900d783def011e8d9f261db6839113425bf3334f/

Added license hash.

Upstream only provides a .gz tarball, so remove the .bz2 option.

Switched package to generic-package after autoconf removal:
https://sourceforge.net/p/giflib/code/ci/5fdd280d0049b7ee70f2ef1a8100b1473086e3eb/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/giflib/giflib.hash |  8 +++++---
 package/giflib/giflib.mk   | 27 ++++++++++++++++++++++-----
 2 files changed, 27 insertions(+), 8 deletions(-)

diff --git a/package/giflib/giflib.hash b/package/giflib/giflib.hash
index cdd7bbdecd..7d22e0294d 100644
--- a/package/giflib/giflib.hash
+++ b/package/giflib/giflib.hash
@@ -1,3 +1,5 @@
-# From http://sourceforge.net/projects/giflib/files
-md5	2c171ced93c0e83bb09e6ccad8e3ba2b	giflib-5.1.4.tar.bz2
-sha1	5f1157cfc377916280849e247b8e34fa0446513f	giflib-5.1.4.tar.bz2
+# From https://sourceforge.net/projects/giflib/files/
+md5 6f03aee4ebe54ac2cc1ab3e4b0a049e5  giflib-5.2.1.tar.gz
+sha1 c3f774dcbdf26afded7788979c8081d33c6426dc  giflib-5.2.1.tar.gz
+# Locally computed
+sha256 0c9b7990ecdca88b676db232c226548ac408b279f550d424d996f0d83591dd8e  COPYING
diff --git a/package/giflib/giflib.mk b/package/giflib/giflib.mk
index 29666eebea..5ced060043 100644
--- a/package/giflib/giflib.mk
+++ b/package/giflib/giflib.mk
@@ -4,8 +4,7 @@
 #
 ################################################################################
 
-GIFLIB_VERSION = 5.1.4
-GIFLIB_SOURCE = giflib-$(GIFLIB_VERSION).tar.bz2
+GIFLIB_VERSION = 5.2.1
 GIFLIB_SITE = http://downloads.sourceforge.net/project/giflib
 GIFLIB_INSTALL_STAGING = YES
 GIFLIB_LICENSE = MIT
@@ -18,7 +17,21 @@ GIFLIB_BINS = \
 	gifrsize gifspnge giftext giftool gifwedge icon2gif raw2gif rgb2gif \
 	text2gif
 
-GIFLIB_CONF_ENV = ac_cv_prog_have_xmlto=no
+define GIFLIB_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define HOST_GIFLIB_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define GIFLIB_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) PREFIX=/usr install
+endef
+
+define GIFLIB_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) PREFIX=/usr install
+endef
 
 define GIFLIB_BINS_CLEANUP
 	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,$(GIFLIB_BINS))
@@ -26,5 +39,9 @@ endef
 
 GIFLIB_POST_INSTALL_TARGET_HOOKS += GIFLIB_BINS_CLEANUP
 
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
+define HOST_GIFLIB_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(HOST_DIR) PREFIX=/ install
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.20.1
