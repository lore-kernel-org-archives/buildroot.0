From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 15 May 2021 17:17:30 +0200
Subject: [Buildroot] [PATCH v2,1/1] package/dmalloc: fix static build
Message-ID: <20210515151730.3167044-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build of dmalloc is broken since commit
19ec872f169a851b48ba04d22432b7c0939847d4 because --enable-shlib is
unconditionally set

Fixes:
 - http://autobuild.buildroot.org/results/62c9c6aebca60649bd6f635125507bf10d63fc05

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Yann E. Morin):
 - Don't unconditionally set --enable-shlib

 package/dmalloc/dmalloc.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/dmalloc/dmalloc.mk b/package/dmalloc/dmalloc.mk
index 638fe0fcda..749c35359c 100644
--- a/package/dmalloc/dmalloc.mk
+++ b/package/dmalloc/dmalloc.mk
@@ -13,10 +13,12 @@ DMALLOC_LICENSE = MIT-like
 DMALLOC_LICENSE_FILES = dmalloc.h.1
 
 DMALLOC_INSTALL_STAGING = YES
-DMALLOC_CONF_OPTS = --enable-shlib
 DMALLOC_CFLAGS = $(TARGET_CFLAGS)
 
-ifeq ($(BR2_STATIC_LIBS),)
+ifeq ($(BR2_STATIC_LIBS),y)
+DMALLOC_CONF_OPTS += --disable-shlib
+else
+DMALLOC_CONF_OPTS += --enable-shlib
 DMALLOC_CFLAGS += -fPIC
 endif
 
-- 
2.30.2
