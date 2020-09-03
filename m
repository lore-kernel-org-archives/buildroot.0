From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 Sep 2020 20:54:48 +0200
Subject: [Buildroot] [git commit] package/hiredis: bump to version 1.0.0
Message-ID: <20200903184814.02366842C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dfb0567f6e6a38512309d33daf93566541001d49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Use cmake which is available since version 1.0.0 and
  https://github.com/redis/hiredis/commit/ead586a2cb7de8a17073a96704a4200d63a380e5
- Disable tests
- Add openssl optional dependency

https://github.com/redis/hiredis/blob/v1.0.0/CHANGELOG.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-CMakeLists.txt-do-not-force-SHARED.patch  | 47 ++++++++++++++++
 package/hiredis/hiredis.hash                       |  2 +-
 package/hiredis/hiredis.mk                         | 65 +++-------------------
 3 files changed, 57 insertions(+), 57 deletions(-)

diff --git a/package/hiredis/0001-CMakeLists.txt-do-not-force-SHARED.patch b/package/hiredis/0001-CMakeLists.txt-do-not-force-SHARED.patch
new file mode 100644
index 0000000000..b7fdb87910
--- /dev/null
+++ b/package/hiredis/0001-CMakeLists.txt-do-not-force-SHARED.patch
@@ -0,0 +1,47 @@
+From 0ce382c275b087e866517c003e565f8cc4855bdd Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 29 Aug 2020 23:19:26 +0200
+Subject: [PATCH] CMakeLists.txt: do not force SHARED
+
+Allow the user to build static libraries by removing SHARED from
+ADD_LIBRARY calls.
+
+Here is an extract of
+https://cmake.org/cmake/help/latest/command/add_library.html:
+
+"If no type is given explicitly the type is STATIC or SHARED based on
+whether the current value of the variable BUILD_SHARED_LIBS is ON."
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: probably not upstreamable as is because it will
+conflict with https://github.com/redis/hiredis/pull/851. So, this patch
+will probably have to be reworked for 1.0.x]
+---
+ CMakeLists.txt | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 1beccc6..fed79fd 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -40,7 +40,7 @@ IF(WIN32)
+     ADD_COMPILE_DEFINITIONS(_CRT_SECURE_NO_WARNINGS WIN32_LEAN_AND_MEAN)
+ ENDIF()
+ 
+-ADD_LIBRARY(hiredis SHARED ${hiredis_sources})
++ADD_LIBRARY(hiredis ${hiredis_sources})
+ 
+ SET_TARGET_PROPERTIES(hiredis
+     PROPERTIES WINDOWS_EXPORT_ALL_SYMBOLS TRUE
+@@ -97,7 +97,7 @@ IF(ENABLE_SSL)
+     FIND_PACKAGE(OpenSSL REQUIRED)
+     SET(hiredis_ssl_sources
+         ssl.c)
+-    ADD_LIBRARY(hiredis_ssl SHARED
++    ADD_LIBRARY(hiredis_ssl
+             ${hiredis_ssl_sources})
+ 
+     IF (APPLE)
+-- 
+2.28.0
+
diff --git a/package/hiredis/hiredis.hash b/package/hiredis/hiredis.hash
index 2d50ce0f54..fc01d1f60d 100644
--- a/package/hiredis/hiredis.hash
+++ b/package/hiredis/hiredis.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  2663b2aed9fd430507e30fc5e63274ee40cdd1a296026e22eafd7d99b01c8913  hiredis-0.14.1.tar.gz
+sha256  2a0b5fe5119ec973a0c1966bfc4bd7ed39dbce1cb6d749064af9121fe971936f  hiredis-1.0.0.tar.gz
 sha256  dca05ce8fc87a8261783b4aed0deef8becc9350b6aa770bc714d0c1833b896eb  COPYING
diff --git a/package/hiredis/hiredis.mk b/package/hiredis/hiredis.mk
index 230fb2d187..f1f4c49dab 100644
--- a/package/hiredis/hiredis.mk
+++ b/package/hiredis/hiredis.mk
@@ -4,66 +4,19 @@
 #
 ################################################################################
 
-HIREDIS_VERSION_MAJOR = 0.14
-HIREDIS_VERSION = $(HIREDIS_VERSION_MAJOR).1
+HIREDIS_VERSION_MAJOR = 1.0
+HIREDIS_VERSION = $(HIREDIS_VERSION_MAJOR).0
 HIREDIS_SITE = $(call github,redis,hiredis,v$(HIREDIS_VERSION))
 HIREDIS_LICENSE = BSD-3-Clause
 HIREDIS_LICENSE_FILES = COPYING
 HIREDIS_INSTALL_STAGING = YES
+HIREDIS_CONF_OPTS = -DDISABLE_TESTS=ON
 
-HIREDIS_MAKE_OPTS = \
-	$(TARGET_CONFIGURE_OPTS) \
-	PREFIX=/usr
-
-HIREDIS_TARGETS = hiredis.pc
-ifeq ($(BR2_STATIC_LIBS),y)
-HIREDIS_TARGETS += static
-else ifeq ($(BR2_SHARED_LIBS),y)
-HIREDIS_TARGETS += dynamic
-else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
-HIREDIS_TARGETS += dynamic static
-endif
-
-define HIREDIS_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(HIREDIS_MAKE_OPTS) -C $(@D) \
-		$(HIREDIS_TARGETS)
-endef
-
-HIREDIS_INCLUDE_DIR = $(STAGING_DIR)/usr/include/hiredis
-
-ifeq ($(BR2_SHARED_LIBS),)
-define HIREDIS_INSTALL_STAGING_STATIC_LIB
-	$(INSTALL) -D -m 0755 $(@D)/libhiredis.a \
-		$(STAGING_DIR)/usr/lib/libhiredis.a
-endef
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+HIREDIS_CONF_OPTS += -DENABLE_SSL=ON
+HIREDIS_DEPENDENCIES += openssl
+else
+HIREDIS_CONF_OPTS += -DENABLE_SSL=OFF
 endif
 
-ifeq ($(BR2_STATIC_LIBS),)
-define HIREDIS_INSTALL_STAGING_SHARED_LIB
-	$(INSTALL) -D -m 0755 $(@D)/libhiredis.so \
-		$(STAGING_DIR)/usr/lib/libhiredis.so.$(HIREDIS_VERSION_MAJOR)
-	ln -sf libhiredis.so.$(HIREDIS_VERSION_MAJOR) $(STAGING_DIR)/usr/lib/libhiredis.so
-endef
-define HIREDIS_INSTALL_TARGET_SHARED_LIB
-	$(INSTALL) -D -m 0755 $(@D)/libhiredis.so \
-		$(TARGET_DIR)/usr/lib/libhiredis.so.$(HIREDIS_VERSION_MAJOR)
-	ln -sf libhiredis.so.$(HIREDIS_VERSION_MAJOR) $(TARGET_DIR)/usr/lib/libhiredis.so
-endef
-endif
-
-# Do not call make install as this target will build shared and static libraries
-define HIREDIS_INSTALL_STAGING_CMDS
-	mkdir -p $(HIREDIS_INCLUDE_DIR)
-	cp -dpfr $(@D)/hiredis.h $(@D)/async.h $(@D)/read.h $(@D)/sds.h \
-		$(@D)/alloc.h $(@D)/adapters $(HIREDIS_INCLUDE_DIR)
-	$(INSTALL) -D -m 0644 $(@D)/hiredis.pc \
-		$(STAGING_DIR)/usr/lib/pkgconfig/hiredis.pc
-	$(HIREDIS_INSTALL_STAGING_STATIC_LIB)
-	$(HIREDIS_INSTALL_STAGING_SHARED_LIB)
-endef
-
-define HIREDIS_INSTALL_TARGET_CMDS
-	$(HIREDIS_INSTALL_TARGET_SHARED_LIB)
-endef
-
-$(eval $(generic-package))
+$(eval $(cmake-package))
