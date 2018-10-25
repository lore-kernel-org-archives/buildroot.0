From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 25 Oct 2018 21:13:16 +0200
Subject: [Buildroot] [PATCH v4,1/1] bdwgc: add optional cplusplus support
Message-ID: <20181025191316.8187-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use CFLAGS_EXTRA to pass C and C++ flags in a single variable

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v3 -> v4 (after review of Baruch Siach):
 - Move CFLAGS_EXTRA assignment before ifeq statements

Changes v2 -> v3 (after review of Baruch Siach):
 - Replace BDWGC_CFLAGS by BDWGC_CFLAGS_EXTRA

Changes v1 -> v2 (after review of Arnout Vandecappelle and Baruch
Siach):
 - Use CFLAGS_EXTRA to pass C and C++ flags in a single variable instead
   of using CFLAGS and CPPFLAGS

 package/bdwgc/bdwgc.mk | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/package/bdwgc/bdwgc.mk b/package/bdwgc/bdwgc.mk
index 5603df8d9d..0d4c8014f4 100644
--- a/package/bdwgc/bdwgc.mk
+++ b/package/bdwgc/bdwgc.mk
@@ -19,17 +19,23 @@ HOST_BDWGC_DEPENDENCIES = host-libatomic_ops host-pkgconf
 # solution.
 BDWGC_AUTORECONF = YES
 
-BDWGC_CFLAGS = $(TARGET_CFLAGS)
+BDWGC_CONF_OPTS = CFLAGS_EXTRA="$(BDWGC_CFLAGS_EXTRA)"
 ifeq ($(BR2_sparc),y)
-BDWGC_CFLAGS += -DAO_NO_SPARC_V9
+BDWGC_CFLAGS_EXTRA += -DAO_NO_SPARC_V9
 endif
 ifeq ($(BR2_STATIC_LIBS),y)
-BDWGC_CFLAGS += -DGC_NO_DLOPEN
+BDWGC_CFLAGS_EXTRA += -DGC_NO_DLOPEN
 endif
 
 # Ensure we use the system libatomic_ops, and not the internal one.
-BDWGC_CONF_OPTS = --with-libatomic-ops=yes CFLAGS="$(BDWGC_CFLAGS)"
+BDWGC_CONF_OPTS += --with-libatomic-ops=yes
 HOST_BDWGC_CONF_OPTS = --with-libatomic-ops=yes
 
+ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+BDWGC_CONF_OPTS += --enable-cplusplus
+else
+BDWGC_CONF_OPTS += --disable-cplusplus
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.17.1
