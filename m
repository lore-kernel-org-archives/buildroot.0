From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 21 Apr 2020 17:24:37 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/mbuffer: fix build with c89 or c99
Message-ID: <20200421152437.3605594-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/5f4e9079b3377a869ec7002a8138b80eb6194bbb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Define _POSIX_SOURCE instead of including linux/limits.h

 ...gure.in-set-AC_USE_SYSTEM_EXTENSIONS.patch | 38 +++++++++++++++++++
 package/mbuffer/mbuffer.mk                    |  2 +
 2 files changed, 40 insertions(+)
 create mode 100644 package/mbuffer/0002-configure.in-set-AC_USE_SYSTEM_EXTENSIONS.patch

diff --git a/package/mbuffer/0002-configure.in-set-AC_USE_SYSTEM_EXTENSIONS.patch b/package/mbuffer/0002-configure.in-set-AC_USE_SYSTEM_EXTENSIONS.patch
new file mode 100644
index 0000000000..f116bd575a
--- /dev/null
+++ b/package/mbuffer/0002-configure.in-set-AC_USE_SYSTEM_EXTENSIONS.patch
@@ -0,0 +1,38 @@
+From 1f2a7e575b3594ef02aae85eee8d1feac0c08266 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 21 Apr 2020 14:30:20 +0200
+Subject: [PATCH] configure.in: set AC_USE_SYSTEM_EXTENSIONS
+
+Set AC_USE_SYSTEM_EXTENSIONS so _POSIX_SOURCE will be defined and the
+following build failure will be avoided when building in c89 or c99
+mode:
+
+log.c: In function 'infomsg':
+log.c:123:12: error: 'PIPE_BUF' undeclared (first use in this function)
+   if (s <= PIPE_BUF) {
+            ^~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/5f4e9079b3377a869ec7002a8138b80eb6194bbb
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: sent to thomas at maier-komor.de]
+---
+ configure.in | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configure.in b/configure.in
+index 02921c2..078373c 100644
+--- a/configure.in
++++ b/configure.in
+@@ -30,6 +30,7 @@ AC_PROG_CC_C99
+ AC_PROG_CC(cc gcc)
+ AC_C_RESTRICT
+ AC_C_INLINE
++AC_USE_SYSTEM_EXTENSIONS
+ 
+ if test "${USRCFLAGS}" = "" ; then
+ 	if test "${GCC}" = "yes" ; then
+-- 
+2.25.1
+
diff --git a/package/mbuffer/mbuffer.mk b/package/mbuffer/mbuffer.mk
index 6ff6e27a39..324780fe69 100644
--- a/package/mbuffer/mbuffer.mk
+++ b/package/mbuffer/mbuffer.mk
@@ -11,6 +11,8 @@ MBUFFER_LICENSE = GPL-3.0+
 MBUFFER_LICENSE_FILES = LICENSE
 MBUFFER_CONF_OPTS = --disable-debug
 MBUFFER_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=c99"
+# We're patching configure.in
+MBUFFER_AUTORECONF = YES
 
 # we don't need tests & co. so we specify a target
 # so that the others don't get built, e.g idev.so
-- 
2.25.1
