From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  1 Dec 2020 20:27:03 +0100
Subject: [Buildroot] [PATCH v3,1/1] package/libcap: fix libcap.pc
Message-ID: <20201201192703.402854-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libcap builds an incorrect libcap.pc because libdir is pulled from the
host os:

ifndef lib
lib=$(shell ldd /usr/bin/ld|egrep "ld-linux|ld.so"|cut -d/ -f2)
endif

Fix this error by passing lib=lib and prefix in
{HOST_LIBCAP,LIBCAP}_BUILD_CMDS

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=13276

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v2 -> v3 (after review of Peter Seiderer):
 - Merge with initial patch that was not committed yet

Changes v1 -> v2:
 - Also fix host libcap

 package/libcap/libcap.mk | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index 2b80a3cb7d..7bb8f57671 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -19,6 +19,8 @@ LIBCAP_MAKE_FLAGS = \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
 	BUILD_CC="$(HOSTCC)" \
 	BUILD_CFLAGS="$(HOST_CFLAGS)" \
+	lib=lib \
+	prefix=/usr \
 	SHARED=$(if $(BR2_STATIC_LIBS),,yes) \
 	PTHREADS=$(if $(BR2_TOOLCHAIN_HAS_THREADS),yes,)
 
@@ -38,27 +40,31 @@ endef
 define LIBCAP_INSTALL_STAGING_CMDS
 	$(foreach d,$(LIBCAP_MAKE_DIRS), \
 		$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/$(d) $(LIBCAP_MAKE_FLAGS) \
-			DESTDIR=$(STAGING_DIR) prefix=/usr lib=lib install
+			DESTDIR=$(STAGING_DIR) install
 	)
 endef
 
 define LIBCAP_INSTALL_TARGET_CMDS
 	$(foreach d,$(LIBCAP_MAKE_DIRS), \
 		$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/$(d) $(LIBCAP_MAKE_FLAGS) \
-			DESTDIR=$(TARGET_DIR) prefix=/usr lib=lib install
+			DESTDIR=$(TARGET_DIR) install
 	)
 endef
 
+HOST_LIBCAP_MAKE_FLAGS = \
+	DYNAMIC=yes \
+	GOLANG=no \
+	lib=lib \
+	prefix=$(HOST_DIR) \
+	RAISE_SETFCAP=no
+
 define HOST_LIBCAP_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)\
-		DYNAMIC=yes \
-		RAISE_SETFCAP=no GOLANG=no
+	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		$(HOST_LIBCAP_MAKE_FLAGS)
 endef
 
 define HOST_LIBCAP_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) prefix=$(HOST_DIR) \
-		DYNAMIC=yes \
-		RAISE_SETFCAP=no GOLANG=no lib=lib install
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_LIBCAP_MAKE_FLAGS) install
 endef
 
 $(eval $(generic-package))
-- 
2.29.2
