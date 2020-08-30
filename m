From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 30 Aug 2020 12:00:57 +0200
Subject: [Buildroot] [PATCH/next 1/2] package/libcap: drop host-gperf
 dependency
Message-ID: <20200830100058.4180798-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

host-gperf dependency was added in commit
5d8926add5da1b0bdfb90a41f4d7f857864c5524 without any explanation in the
commit message but gperf can be disabled through BUILD_GPERF since
https://git.kernel.org/pub/scm/linux/kernel/git/morgan/libcap.git/commit/?id=3c22870c762f7925b5ff143d76f9affbade275ba

So use this variable and drop this unneeded dependency

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libcap/libcap.mk | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index 08c1bc9deb..208f8eade1 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -10,11 +10,9 @@ LIBCAP_SOURCE = libcap-$(LIBCAP_VERSION).tar.xz
 LIBCAP_LICENSE = GPL-2.0 or BSD-3-Clause
 LIBCAP_LICENSE_FILES = License
 
-LIBCAP_DEPENDENCIES = host-libcap host-gperf
+LIBCAP_DEPENDENCIES = host-libcap
 LIBCAP_INSTALL_STAGING = YES
 
-HOST_LIBCAP_DEPENDENCIES = host-gperf
-
 ifeq ($(BR2_STATIC_LIBS),y)
 LIBCAP_MAKE_TARGET = libcap.a libcap.pc
 LIBCAP_MAKE_INSTALL_TARGET = install-static
@@ -28,7 +26,8 @@ endif
 
 LIBCAP_MAKE_FLAGS = \
 	BUILD_CC="$(HOSTCC)" \
-	BUILD_CFLAGS="$(HOST_CFLAGS)"
+	BUILD_CFLAGS="$(HOST_CFLAGS)" \
+	BUILD_GPERF=no
 
 ifeq ($(BR2_PACKAGE_LIBCAP_TOOLS),y)
 define LIBCAP_BUILD_TOOLS_CMDS
@@ -62,12 +61,12 @@ endef
 
 define HOST_LIBCAP_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)\
-		RAISE_SETFCAP=no
+		BUILD_GPERF=no RAISE_SETFCAP=no
 endef
 
 define HOST_LIBCAP_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) prefix=$(HOST_DIR) \
-		RAISE_SETFCAP=no lib=lib install
+		BUILD_GPERF=no RAISE_SETFCAP=no lib=lib install
 endef
 
 $(eval $(generic-package))
-- 
2.28.0
