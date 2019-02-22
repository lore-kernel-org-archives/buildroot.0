From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Fri, 22 Feb 2019 13:08:12 -0300
Subject: [Buildroot] [PATCH v2] package/snort: bump to version 2.9.12
Message-ID: <1550851692-7009-1-git-send-email-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In this version, OpenAppID [1] is enabled by default.

OpenAppID depends on luajit and openssl. If we leave it enabled by
default, snort would require luajit. Since luajit is not available on
all architectures, that would limit the usage of the snort package.

Since not all users will need/use OpenAppID, let's leave it disabled by
default. To build with OpenAppID support, the user will need to enable
luajit and libssl.

Also, it is necessary to apply a patch to fix a compile error when
building OpenAppID with uclibc and musl. The build fails when
dereferencing the rpcent structure because rpc.h is not been included.

[1] https://www.snort.org/downloads/openappid/9553

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---

Changes v1 -> v2:
  - patch series squashed into a single patch (suggested by Thomas Petazzoni)

---
 ...-error-when-building-against-uclibc-or-mu.patch | 34 ++++++++++++++++++++++
 package/snort/snort.hash                           |  2 +-
 package/snort/snort.mk                             | 11 ++++++-
 3 files changed, 45 insertions(+), 2 deletions(-)
 create mode 100644 package/snort/0006-Fix-compile-error-when-building-against-uclibc-or-mu.patch

diff --git a/package/snort/0006-Fix-compile-error-when-building-against-uclibc-or-mu.patch b/package/snort/0006-Fix-compile-error-when-building-against-uclibc-or-mu.patch
new file mode 100644
index 000000000000..ce9d5526c841
--- /dev/null
+++ b/package/snort/0006-Fix-compile-error-when-building-against-uclibc-or-mu.patch
@@ -0,0 +1,34 @@
+From dc2f54097da3cd493b8f4d06a14ef40be484d24f Mon Sep 17 00:00:00 2001
+From: Sergio Prado <sergio.prado@e-labworks.com>
+Date: Thu, 21 Feb 2019 15:02:08 -0300
+Subject: [PATCH] Fix compile error when building against uclibc or musl
+
+The build fails when dereferencing the rpcent structure with uclibc or musl C libraries.
+
+../../../src/dynamic-preprocessors/appid/service_plugins/service_rpc.c:241:20:
+error: dereferencing pointer to incomplete type ?struct rpcent?
+             if (rpc->r_name)
+
+That's because rpc.h should be included when using these C libraries.
+
+Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
+---
+ src/dynamic-preprocessors/appid/service_plugins/service_rpc.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/dynamic-preprocessors/appid/service_plugins/service_rpc.c b/src/dynamic-preprocessors/appid/service_plugins/service_rpc.c
+index 81bc8a5db8ab..2e45246083a8 100644
+--- a/src/dynamic-preprocessors/appid/service_plugins/service_rpc.c
++++ b/src/dynamic-preprocessors/appid/service_plugins/service_rpc.c
+@@ -32,7 +32,7 @@
+ #include "flow.h"
+ #include "service_api.h"
+ 
+-#if defined(FREEBSD) || defined(OPENBSD)
++#if defined(FREEBSD) || defined(OPENBSD) || (defined(LINUX) && defined(__UCLIBC__) && !defined(__UCLIBC_HAS_RPC__) || !defined(__GLIBC__))
+ #include "rpc/rpc.h"
+ #endif
+ 
+-- 
+2.7.4
+
diff --git a/package/snort/snort.hash b/package/snort/snort.hash
index 211e862b7fc0..abe85920cf1e 100644
--- a/package/snort/snort.hash
+++ b/package/snort/snort.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256 9f6b3aeac5a109f55504bd370564ac431cb1773507929dc461626898f33f46cd  snort-2.9.11.1.tar.gz
+sha256 7b02e11987c6cb4f6d79d72799ca9ad2b4bd59cc1d96bb7d6c91549f990d99d0  snort-2.9.12.tar.gz
 
 # Hash for license files:
 sha256 f98260a6d3e5ef4ede8a2a6b698e5ac91d64c09243f7171e1c5b17b920a835c7  LICENSE
diff --git a/package/snort/snort.mk b/package/snort/snort.mk
index 568393468bb6..c767d7c5458a 100644
--- a/package/snort/snort.mk
+++ b/package/snort/snort.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNORT_VERSION = 2.9.11.1
+SNORT_VERSION = 2.9.12
 SNORT_SITE = https://www.snort.org/downloads/snort
 SNORT_LICENSE = GPL-2.0
 SNORT_LICENSE_FILES = LICENSE COPYING
@@ -26,6 +26,15 @@ SNORT_CFLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`
 SNORT_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs libtirpc`
 endif
 
+# luajit and openssl should be enabled to build with
+# OpenAppID support
+ifeq ($(BR2_PACKAGE_LUAJIT)$(BR2_PACKAGE_OPENSSL),yy)
+SNORT_DEPENDENCIES += luajit openssl
+SNORT_CONF_OPTS += --enable-open-appid
+else
+SNORT_CONF_OPTS += --disable-open-appid
+endif
+
 SNORT_CONF_ENV = \
 	CFLAGS="$(TARGET_CFLAGS) $(SNORT_CFLAGS)" \
 	LIBS="$(SNORT_LIBS)" \
-- 
2.7.4
