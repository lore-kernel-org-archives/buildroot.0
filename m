From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 30 Nov 2020 07:37:55 +0100
Subject: [Buildroot] [PATCH 1/1] package/libcap: new fix to libcap.pc
Message-ID: <20201130063755.8543-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As spotted by Peter Seiderer, prefix must be passed to LIBCAP_BUILD_CMDS
so libdir in libcap.pc is set to /usr/lib instead of /lib

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libcap/libcap.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index a4a9170193..d0e0ab8b74 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -19,6 +19,7 @@ LIBCAP_MAKE_FLAGS = \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
 	BUILD_CC="$(HOSTCC)" \
 	BUILD_CFLAGS="$(HOST_CFLAGS)" \
+	prefix=/usr \
 	lib=lib \
 	SHARED=$(if $(BR2_STATIC_LIBS),,yes) \
 	PTHREADS=$(if $(BR2_TOOLCHAIN_HAS_THREADS),yes,)
@@ -39,14 +40,14 @@ endef
 define LIBCAP_INSTALL_STAGING_CMDS
 	$(foreach d,$(LIBCAP_MAKE_DIRS), \
 		$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/$(d) $(LIBCAP_MAKE_FLAGS) \
-			DESTDIR=$(STAGING_DIR) prefix=/usr install
+			DESTDIR=$(STAGING_DIR) install
 	)
 endef
 
 define LIBCAP_INSTALL_TARGET_CMDS
 	$(foreach d,$(LIBCAP_MAKE_DIRS), \
 		$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/$(d) $(LIBCAP_MAKE_FLAGS) \
-			DESTDIR=$(TARGET_DIR) prefix=/usr install
+			DESTDIR=$(TARGET_DIR) install
 	)
 endef
 
-- 
2.29.2
