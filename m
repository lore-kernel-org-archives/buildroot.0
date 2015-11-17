From: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
Date: Wed, 18 Nov 2015 00:50:10 +0900
Subject: [Buildroot] [PATCH v2] package/gauche: fix 'dlfcn.h: No such file'
	on autobuild
Message-ID: <201511171550.tAHFoAcS030490@ms-omx01.plus.so-net.ne.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ported from bdwgc package.
When build with BR2_STATIC_LIBS environment, prevent to use dlopen().

Fix:
http://autobuild.buildroot.org/results/da5/da5b9605552d4914c5e6f0d890367b92536419c1

Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
---
Changes:
v1 -> v2
- refelect comment from Thomas for refine.
---
diff --git a/package/gauche/gauche.mk b/package/gauche/gauche.mk
index b887c6a..e708068 100644
--- a/package/gauche/gauche.mk
+++ b/package/gauche/gauche.mk
@@ -20,13 +20,21 @@ else
 GAUCHE_CONF_OPTS += --without-zlib
 endif
 
+GAUCHE_CFLAGS = $(TARGET_CFLAGS)
+
 # Detection of c99 support in configure fails without WCHAR. To enable
 # automatic detection of c99 support by configure, we need to enable
 # WCHAR in toolchain. But actually we do not need WCHAR at gauche
 # runtime. So reuesting WCHAR in toolchain just for automatic detection
 # will be overkill. To solve this, explicitly -std=gnu99 is specified
 # here.
-GAUCHE_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
+GAUCHE_CFLAGS += -std=gnu99
+
+ifeq ($(BR2_STATIC_LIBS),y)
+GAUCHE_CFLAGS += -DGC_NO_DLOPEN
+endif
+
+GAUCHE_CONF_ENV = CFLAGS="$(GAUCHE_CFLAGS)"
 
 $(eval $(host-autotools-package))
 $(eval $(autotools-package))
============================================================
    Hiroshi Kawashima
