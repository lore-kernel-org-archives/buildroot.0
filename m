From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Apr 2020 21:37:50 +0200
Subject: [Buildroot] [git commit] package/mbuffer: fix build with c89 or c99
Message-ID: <20200421193603.C66A48FB1D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c60148d846af81fba9d46754a02e179d23ce8ee1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/5f4e9079b3377a869ec7002a8138b80eb6194bbb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...configure.in-set-AC_USE_SYSTEM_EXTENSIONS.patch | 38 ++++++++++++++++++++++
 package/mbuffer/mbuffer.mk                         |  2 ++
 2 files changed, 40 insertions(+)

diff --git a/package/mbuffer/0002-configure.in-set-AC_USE_SYSTEM_EXTENSIONS.patch b/package/mbuffer/0002-configure.in-set-AC_USE_SYSTEM_EXTENSIONS.patch
new file mode 100644
index 0000000000..661586ce02
--- /dev/null
+++ b/package/mbuffer/0002-configure.in-set-AC_USE_SYSTEM_EXTENSIONS.patch
@@ -0,0 +1,38 @@
+From 03db384ff0413d003de271355f59aba8c3f815a1 Mon Sep 17 00:00:00 2001
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
+index 02921c2..aba4af0 100644
+--- a/configure.in
++++ b/configure.in
+@@ -3,6 +3,7 @@ AC_CONFIG_HEADER(config.h)
+ 
+ AC_CANONICAL_SYSTEM
+ AC_EXEEXT
++AC_USE_SYSTEM_EXTENSIONS
+ 
+ PACKAGE=mbuffer
+ VERSION=20140310
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
