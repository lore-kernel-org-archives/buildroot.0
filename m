From: Richard Genoud <richard.genoud@gmail.com>
Date: Tue, 20 Jan 2015 12:24:37 +0100
Subject: [Buildroot] [PATCH 1/3] dmalloc: Force arm mode instead of Thumb1
	mode
Message-ID: <1421753079-27665-1-git-send-email-richard.genoud@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

dmalloc has some assembly that doesn't exist in thumb1 mode.
So, force arm mode for dmalloc.

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 package/dmalloc/dmalloc.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/dmalloc/dmalloc.mk b/package/dmalloc/dmalloc.mk
index 581ec4075681..f87ae1709aec 100644
--- a/package/dmalloc/dmalloc.mk
+++ b/package/dmalloc/dmalloc.mk
@@ -14,6 +14,7 @@ DMALLOC_LICENSE_FILES = dmalloc.h.1
 
 DMALLOC_INSTALL_STAGING = YES
 DMALLOC_CONF_OPTS = --enable-shlib
+DMALLOC_CFLAGS = $(TARGET_CFLAGS)
 
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 DMALLOC_CONF_OPTS += --enable-cxx
@@ -27,6 +28,15 @@ else
 DMALLOC_CONF_OPTS += --disable-threads
 endif
 
+# dmalloc has some assembly function that are not present in thumb1 mode:
+# Error: lo register required -- `str lr,[sp,#4]'
+# so, we desactivate thumb mode
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+DMALLOC_CFLAGS += -marm
+endif
+
+DMALLOC_CONF_ENV = CFLAGS="$(DMALLOC_CFLAGS)"
+
 define DMALLOC_POST_PATCH
 	$(SED) 's/^ac_cv_page_size=0$$/ac_cv_page_size=12/' $(@D)/configure
 	$(SED) 's/(ld -/($${LD-ld} -/' $(@D)/configure
-- 
2.0.0
