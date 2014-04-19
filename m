From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 19 Apr 2014 22:58:00 +0200
Subject: [Buildroot] [PATCH 8/8] luacrypto: luarocks conversion
In-Reply-To: <1397941080-24157-1-git-send-email-francois.perrad@gadz.org>
References: <1397941080-24157-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1397941080-24157-9-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luacrypto/luacrypto-01-autotools.patch | 30 --------------------------
 package/luacrypto/luacrypto.mk                 | 12 +++++------
 2 files changed, 6 insertions(+), 36 deletions(-)
 delete mode 100644 package/luacrypto/luacrypto-01-autotools.patch

diff --git a/package/luacrypto/luacrypto-01-autotools.patch b/package/luacrypto/luacrypto-01-autotools.patch
deleted file mode 100644
index e8befb0..0000000
--- a/package/luacrypto/luacrypto-01-autotools.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-autotools: fix install directories
-
-Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
-
-Index: b/Makefile.am
-===================================================================
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -3,7 +3,7 @@
- SUBDIRS = src \
- 	  doc
- 
--pkgconfigdir = $(libdir)/pkgconfig
-+pkgconfigdir = $(prefix)/lib/pkgconfig
- pkgconfig_DATA = luacrypto.pc
- 
- test: all
-Index: b/configure.ac
-===================================================================
---- a/configure.ac
-+++ b/configure.ac
-@@ -31,7 +31,7 @@
- PKG_CHECK_MODULES([LUA], [lua])
- 
- # lua libdir
--LUALIBDIR="`$PKGCONFIG --variable=libdir lua`"
-+LUALIBDIR="`$PKGCONFIG --variable=INSTALL_CMOD lua`"
- 
- # dest of headers
- CRYPTOINC="${includedir}/${PACKAGE_NAME}"
diff --git a/package/luacrypto/luacrypto.mk b/package/luacrypto/luacrypto.mk
index 54ab388..42e20af 100644
--- a/package/luacrypto/luacrypto.mk
+++ b/package/luacrypto/luacrypto.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-LUACRYPTO_VERSION = 0.3.2
-LUACRYPTO_SITE = $(call github,mkottman,luacrypto,$(LUACRYPTO_VERSION))
+LUACRYPTO_VERSION_UPSTREAM = 0.3.2
+LUACRYPTO_VERSION = $(LUACRYPTO_VERSION_UPSTREAM)-1
+LUACRYPTO_SUBDIR = luacrypto-$(LUACRYPTO_VERSION_UPSTREAM)
 LUACRYPTO_LICENSE = MIT
-LUACRYPTO_LICENSE_FILES = COPYING
-LUACRYPTO_DEPENDENCIES = lua openssl host-pkgconf
-LUACRYPTO_AUTORECONF = YES
+LUACRYPTO_LICENSE_FILES = $(LUACRYPTO_SUBDIR)/COPYING
+LUACRYPTO_DEPENDENCIES = luainterpreter openssl
 
-$(eval $(autotools-package))
+$(eval $(luarocks-package))
-- 
1.9.1
