From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Feb 2016 11:16:00 +0100
Subject: [Buildroot] [git commit] apache, apr: fix atomic handling
Message-ID: <20160206101651.C8EF3805BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=22e63d952edc2831b1844983481ecdca6ee02db8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the apache package was introduced,
--enable-nonportable-atomics=yes was passed when
BR2_ARCH_HAS_ATOMICS. However, Apache doesn't take this option: it
only passes it down when building the APR library. But since we're
building APR separately, this statement had no effect.

So this commit removes the useless code from the Apache package, and
instead adds the appropriate logic to the apr package, using the new
BR2_TOOLCHAIN_HAS_SYNC_x symbols rather than BR2_ARCH_HAS_ATOMICS.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/apache/apache.mk |  4 ----
 package/apr/apr.mk       | 15 +++++++++++++++
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 8e7b6be..e752fcc 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -35,10 +35,6 @@ APACHE_CONF_OPTS = \
 	--disable-lua \
 	--disable-luajit
 
-ifeq ($(BR2_ARCH_HAS_ATOMICS),y)
-APACHE_CONF_OPTS += --enable-nonportable-atomics=yes
-endif
-
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
 APACHE_DEPENDENCIES += libxml2
 # Apache wants the path to the header file, where it can find
diff --git a/package/apr/apr.mk b/package/apr/apr.mk
index 0fed19c..361a79f 100644
--- a/package/apr/apr.mk
+++ b/package/apr/apr.mk
@@ -35,6 +35,21 @@ endif
 # Fix lfs detection when cross compiling
 APR_CONF_ENV += apr_cv_use_lfs64=yes
 
+# Use non-portable atomics when available: 8 bytes atomics are used on
+# 64-bits architectures, 4 bytes atomics on 32-bits architectures. We
+# have to override ap_cv_atomic_builtins because the test used to
+# check for atomic builtins uses AC_TRY_RUN, which doesn't work when
+# cross-compiling.
+ifeq ($(BR2_ARCH_IS_64):$(BR2_TOOLCHAIN_HAS_SYNC_8),y:y)
+APR_CONF_OPTS += --enable-nonportable-atomics
+APR_CONF_ENV += ap_cv_atomic_builtins=yes
+else ifeq ($(BR2_ARCH_IS_64):$(BR2_TOOLCHAIN_HAS_SYNC_4),:y)
+APR_CONF_OPTS += --enable-nonportable-atomics
+APR_CONF_ENV += ap_cv_atomic_builtins=yes
+else
+APR_CONF_OPTS += --disable-nonportable-atomics
+endif
+
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
 APR_DEPENDENCIES += util-linux
 endif
