From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 23 Oct 2018 21:39:12 +0200
Subject: [Buildroot] [PATCH 1/1] bdwgc: add optional cplusplus support
Message-ID: <20181023193912.10656-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bdwgc/bdwgc.mk | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/bdwgc/bdwgc.mk b/package/bdwgc/bdwgc.mk
index 5603df8d9d..a0d7689d31 100644
--- a/package/bdwgc/bdwgc.mk
+++ b/package/bdwgc/bdwgc.mk
@@ -22,14 +22,26 @@ BDWGC_AUTORECONF = YES
 BDWGC_CFLAGS = $(TARGET_CFLAGS)
 ifeq ($(BR2_sparc),y)
 BDWGC_CFLAGS += -DAO_NO_SPARC_V9
+BDWGC_CPPFLAGS += -DAO_NO_SPARC_V9
 endif
 ifeq ($(BR2_STATIC_LIBS),y)
 BDWGC_CFLAGS += -DGC_NO_DLOPEN
+BDWGC_CPPFLAGS += -DGC_NO_DLOPEN
 endif
 
+BDWGC_CONF_OPTS = \
+	CFLAGS="$(BDWGC_CFLAGS)" \
+	CPPFLAGS="$(BDWGC_CPPFLAGS)"
+
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
