From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 22 Dec 2014 19:50:38 +0200
Subject: [Buildroot] [PATCH] liblinear: fix shared library build when -fPIC
	is required
Message-ID: <5fd89bc9217a91d4387f32dce95e557b4044ca17.1419270638.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some architectures require building with -fPIC for shared libraries. -fPIC is
present in upstream Makefile but we override CFLAGS when running make. Add
-fPIC back when building shared libraries.

Fixes:
http://autobuild.buildroot.net/results/5d6/5d63bf2f1af7977ff81116e767b399d4d0a30a99/
http://autobuild.buildroot.net/results/47d/47d62d66c65cc77da9d48981ca6612257e616a90/
http://autobuild.buildroot.net/results/c81/c816a0982733595438ed7ad90ae1231001c285cc/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/liblinear/liblinear.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/liblinear/liblinear.mk b/package/liblinear/liblinear.mk
index 296aa019ad4c..38aaefca442d 100644
--- a/package/liblinear/liblinear.mk
+++ b/package/liblinear/liblinear.mk
@@ -9,6 +9,7 @@ LIBLINEAR_SITE = http://www.csie.ntu.edu.tw/~cjlin/liblinear/$(LIBLINEAR_VERSION
 LIBLINEAR_LICENSE = BSD-3c
 LIBLINEAR_LICENSE_FILES = COPYING
 LIBLINEAR_INSTALL_STAGING = YES
+LIBLINEAR_CFLAGS = $(TARGET_CFLAGS)
 
 ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
 # $1: destination directory
@@ -16,6 +17,7 @@ define LIBLINEAR_INSTALL_SHARED
 	$(INSTALL) -m 0644 -D $(@D)/liblinear.so.2 $(1)/usr/lib/liblinear.so.2
 	ln -sf liblinear.so.2 $(1)/usr/lib/liblinear.so
 endef
+LIBLINEAR_CFLAGS += -fPIC
 endif
 
 ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
@@ -26,7 +28,7 @@ endef
 endif
 
 define LIBLINEAR_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(LIBLINEAR_CFLAGS)" -C $(@D) \
 		$(if $(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),lib) \
 		$(if $(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),static-lib)
 endef
-- 
2.1.3
