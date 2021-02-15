From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 15 Feb 2021 18:26:36 +0100
Subject: [Buildroot] [PATCH 1/1] package/libgpg-error: fix build without
 threads
Message-ID: <20210215172636.1084469-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix build without threads of libgpg-error in version >= 1.40

Fixes:
 - http://autobuild.buildroot.org/results/3344c96e5627a9327b0eabe0b27f34490bbabc0d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...nfigure.ac-fix-build-without-threads.patch | 54 +++++++++++++++++++
 package/libgpg-error/libgpg-error.mk          |  8 +++
 2 files changed, 62 insertions(+)
 create mode 100644 package/libgpg-error/0001-configure.ac-fix-build-without-threads.patch

diff --git a/package/libgpg-error/0001-configure.ac-fix-build-without-threads.patch b/package/libgpg-error/0001-configure.ac-fix-build-without-threads.patch
new file mode 100644
index 0000000000..5f5147e0df
--- /dev/null
+++ b/package/libgpg-error/0001-configure.ac-fix-build-without-threads.patch
@@ -0,0 +1,54 @@
+From 77c89f62f106d88ef2b5963f4a13755c337c793d Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 15 Feb 2021 07:56:29 +0100
+Subject: [PATCH] configure.ac: fix build without threads
+
+Cross-compilation of libgpg-error fails on toolchain without threads
+since commit 988211d3d4c1f3d5cfa6b460210f65ab636763b5,
+9ee011259f819a3cf50fe7019fa4366dbc437e0e and
+50e62b36ea01ed25d12c443088b85d4f41a2b3e1
+
+Indeed, since that time, libgpg-error assumes that pthread.h is always
+available resulting in the following error at configure time:
+
+checking for arm-unknown-linux-gnueabi-objdump... (cached) /tmp/instance-1/output-1/host/bin/arm-linux-objdump
+conftest.c:1:10: fatal error: pthread.h: No such file or directory
+    1 | #include <pthread.h>
+      |          ^~~~~~~~~~~
+compilation terminated.
+configure: generated src/lock-obj-pub.native.h using arm-unknown-linux-gnueabi-objdump and gawk
+checking whether to enable log_clock... no
+
+This error will in turn results in a build failure because
+"Can't determine mutex size" is echoed by gen-lock-obj.sh:
+
+In file included from strsource-sym.c:27:
+./gpg-error.h:1115:4: warning: missing terminating ' character
+ 1115 | Can't determine mutex size
+      |    ^
+
+Full build log:
+http://autobuild.buildroot.org/results/334/3344c96e5627a9327b0eabe0b27f34490bbabc0d/build-end.log
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://dev.gnupg.org/T5296]
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index b9a2a3e..15d9fdc 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -599,7 +599,7 @@ if test x$cross_compiling = xyes; then
+   case $host in
+     *-*-linux*)
+     AC_CHECK_TOOL(OBJDUMP, [objdump])
+-    if test -n "$OBJDUMP"; then
++    if test -n "$OBJDUMP" -a x"$gl_use_threads" != xno; then
+       lock_obj_h_generated=yes
+       if test ! -d src; then mkdir src; fi
+       LOCK_ABI_VERSION=1 host=$host host_alias=$host_alias \
+-- 
+2.30.0
+
diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 78ed3e5464..1b35e5c8f0 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -15,5 +15,13 @@ LIBGPG_ERROR_CONFIG_SCRIPTS = gpg-error-config
 LIBGPG_ERROR_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 LIBGPG_ERROR_CONF_OPTS = --disable-tests \
 		--host=$(BR2_PACKAGE_LIBGPG_ERROR_SYSCFG)
+# We're patching configure.ac
+LIBGPG_ERROR_AUTORECONF= YES
+
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+LIBGPG_ERROR_CONF_OPTS += --enable-threads
+else
+LIBGPG_ERROR_CONF_OPTS += --disable-threads
+endif
 
 $(eval $(autotools-package))
-- 
2.30.0
