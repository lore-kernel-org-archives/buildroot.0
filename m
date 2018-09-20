From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 20 Sep 2018 19:28:09 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] brltty: use gcc instead of ld to link shared objects
Message-ID: <20180920172809.19993-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to version 5.6 has reintroduced the issue fixed by patch 854093 on
version 5.5.

Indeed, third patch was merged upstream but it was then reverted:
https://github.com/brltty/brltty/commit/9e7d62c869d3c1cbe12dda8b0291a4692c193416

Moreover, since commit 3a2e3f6fa5ef0a210ffeba5ed05c79965d0cc3c7, MKOBJ
was renamed into MKREL. So, instead of patching again brltty, overwrite
MKREL to use "gcc -shared -o" instead of "ld -r -o".

Fixes:
 - http://autobuild.buildroot.org/results/31f682838b3d3b2c7103b5c51f2aba0b89d4f630

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Fix patch (missing -o)

 package/brltty/brltty.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/brltty/brltty.mk b/package/brltty/brltty.mk
index 21f6877bb8..615950800d 100644
--- a/package/brltty/brltty.mk
+++ b/package/brltty/brltty.mk
@@ -15,6 +15,9 @@ BRLTTY_LICENSE_FILES = LICENSE-LGPL README
 BRLTTY_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) host-autoconf host-pkgconf \
 	$(if $(BR2_PACKAGE_AT_SPI2_CORE),at-spi2-core)
 
+BRLTTY_CONF_ENV = \
+	brltty_cv_prog_make_object_relocatable="$(TARGET_CC) -shared -o"
+
 BRLTTY_CONF_OPTS = \
 	--disable-java-bindings \
 	--disable-lisp-bindings \
-- 
2.17.1
