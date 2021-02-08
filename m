From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  8 Feb 2021 07:46:26 +0100
Subject: [Buildroot] [PATCH 1/1] package/guile: link with libatomic if needed
Message-ID: <20210208064626.3516076-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix build of guile 3.0.4 with Bootlin SPARC uclibc toolchain added with
commit 1348c569d0cb7f67eca30f170b782aa8b51cc259

Fixes:
 - http://autobuild.buildroot.org/results/a72d8e14854f9c6c9632e856019a3eb8ec4818b6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/guile/guile.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/guile/guile.mk b/package/guile/guile.mk
index 0e7328f199..44f4d1c85e 100644
--- a/package/guile/guile.mk
+++ b/package/guile/guile.mk
@@ -29,6 +29,10 @@ GUILE_CFLAGS = \
 	-DHAVE_GC_GET_FREE_SPACE_DIVISOR \
 	-DHAVE_GC_SET_FINALIZE_ON_DEMAND
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+GUILE_CONF_ENV += LIBS=-latomic
+endif
+
 ifeq ($(BR2_STATIC_LIBS),y)
 GUILE_CFLAGS += -DGC_NO_DLOPEN
 endif
-- 
2.29.2
