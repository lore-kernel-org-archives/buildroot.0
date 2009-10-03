From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 3 Oct 2009 23:05:58 +0200
Subject: [Buildroot] [git commit master] zlib: remove dedicated
	target-headers option
Message-ID: <20091003210638.A601A776F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1e32e0700a0f7f2ffa42a943871d1b4428711bb2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead, simply only copy headers/static lib if BR2_HAVE_DEVFILES
is enabled.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/zlib/Config.in |    6 ------
 package/zlib/zlib.mk   |    7 +------
 2 files changed, 1 insertions(+), 12 deletions(-)

diff --git a/package/zlib/Config.in b/package/zlib/Config.in
index eeda15e..8954214 100644
--- a/package/zlib/Config.in
+++ b/package/zlib/Config.in
@@ -5,9 +5,3 @@ config BR2_PACKAGE_ZLIB
 	  gzip and libpng.
 
 	  http://www.gzip.org/zlib/
-
-config BR2_PACKAGE_ZLIB_TARGET_HEADERS
-	bool "zlib headers in target"
-	depends on BR2_PACKAGE_ZLIB
-	help
-	  Put headers files in the target.
diff --git a/package/zlib/zlib.mk b/package/zlib/zlib.mk
index a67a5e8..9131832 100644
--- a/package/zlib/zlib.mk
+++ b/package/zlib/zlib.mk
@@ -68,9 +68,7 @@ $(TARGET_DIR)/usr/lib/libz.a: $(STAGING_DIR)/usr/lib/libz.a
 	$(INSTALL) -D $(STAGING_DIR)/usr/lib/libz.a $(TARGET_DIR)/usr/lib/libz.a
 	touch -c $@
 
-zlib-headers: $(TARGET_DIR)/usr/lib/libz.a
-
-zlib: $(ZLIB_TARGET)
+zlib: $(ZLIB_TARGET) $(if $(BR2_HAVE_DEVFILES,$(TARGET_DIR)/usr/lib/libz.a)
 
 zlib-source: $(DL_DIR)/$(ZLIB_SOURCE)
 
@@ -94,6 +92,3 @@ zlib-dirclean:
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 TARGETS+=zlib
 endif
-ifeq ($(BR2_PACKAGE_ZLIB_TARGET_HEADERS),y)
-TARGETS+=zlib-headers
-endif
-- 
1.6.3.3
