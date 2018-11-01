From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Nov 2018 22:36:39 +0100
Subject: [Buildroot] [git commit] bdwgc: add optional cplusplus support
Message-ID: <20181101213438.AB0B483954@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3f38fbedc1c242589cd788413f42884693f18ccb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use CFLAGS_EXTRA to pass C and C++ flags in a single variable

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
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
