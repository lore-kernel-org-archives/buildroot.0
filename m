From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 31 Jul 2016 10:27:19 +0200
Subject: [Buildroot] [PATCH] gnupg: disable assembly optimization for
	coldfire
Message-ID: <20160731082718.GA14169@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/d25425cff055a14b9285cefb0775bc138eb2f914/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/gnupg/gnupg.mk |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/gnupg/gnupg.mk b/package/gnupg/gnupg.mk
index 8893a1c..54f4d97 100644
--- a/package/gnupg/gnupg.mk
+++ b/package/gnupg/gnupg.mk
@@ -13,6 +13,11 @@ GNUPG_DEPENDENCIES = zlib ncurses $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 GNUPG_CONF_ENV = ac_cv_sys_symbol_underscore=no
 GNUPG_CONF_OPTS = --disable-rpath --enable-minimal --disable-regex
 
+# gnupg doesn't support assembly for coldfire
+ifeq ($(BR2_m68k_cf),y)
+GNUPG_CONF_OPTS += --disable-asm
+endif
+
 ifeq ($(BR2_PACKAGE_BZIP2),y)
 GNUPG_CONF_OPTS += --enable-bzip2
 GNUPG_DEPENDENCIES += bzip2
-- 
1.7.10.4
