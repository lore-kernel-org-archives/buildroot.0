From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Jan 2015 20:30:18 +0100
Subject: [Buildroot] [git commit] dmalloc: Force arm mode instead of Thumb1
	mode
Message-ID: <20150125193024.6D74080446@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=88f3034651364d2cd6066f2df339a32e8eef8fc6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

dmalloc has some assembly that doesn't exist in thumb1 mode.
So, force arm mode for dmalloc.

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dmalloc/dmalloc.mk |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/package/dmalloc/dmalloc.mk b/package/dmalloc/dmalloc.mk
index 581ec40..f87ae17 100644
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
