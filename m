From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 21 Mar 2021 21:59:08 +0100
Subject: [Buildroot] [PATCH v1] package/haveged: bump version to 1.9.14
Message-ID: <20210321205908.10167-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- change to set all available configure options:

  * '--enable-daemon=yes': previous default

  * '--enable-diagnostic=no': previous default

  * '-enable-init=no': do not install init files as buildroot ships its
    own sysv/systemd init files

  * '--enable-nistest=no': disable tests, previous default

  * '--enable-enttest=no': new option, disable tests

  * '--enable-olt=no': previous default was yes, disable builtin test

  * '--enable-tune=yes': previous default

- add patch to fix uclibc compile (disable dependency on sys/auxv.h
  introduces with upstream commit [1])

Changelog ([2]):

  - made enttest configurable
  - havegecmd.c - new command added to close the communication socket
    [Werner Fink]

[1] https://github.com/jirka-h/haveged/commit/26d35af198da01220ba4f7a1b987f17012476c00
[2] https://github.com/jirka-h/haveged/releases/tag/v1.9.14

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...Check-for-sys-auxv.h-before-using-it.patch | 59 +++++++++++++++++++
 package/haveged/haveged.hash                  |  2 +-
 package/haveged/haveged.mk                    | 20 ++++++-
 3 files changed, 79 insertions(+), 2 deletions(-)
 create mode 100644 package/haveged/0001-Check-for-sys-auxv.h-before-using-it.patch

diff --git a/package/haveged/0001-Check-for-sys-auxv.h-before-using-it.patch b/package/haveged/0001-Check-for-sys-auxv.h-before-using-it.patch
new file mode 100644
index 0000000000..3a47411297
--- /dev/null
+++ b/package/haveged/0001-Check-for-sys-auxv.h-before-using-it.patch
@@ -0,0 +1,59 @@
+From 676abde95bab10e1d26e91682772514010143343 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Sun, 21 Mar 2021 17:00:08 +0100
+Subject: [PATCH] Check for sys/auxv.h before using it.
+
+- fixes uclibc-ng compile (does not provide sys/auxv.h header file)
+
+Fixes:
+
+  haveged.c:22:10: fatal error: sys/auxv.h: No such file or directory
+     22 | #include <sys/auxv.h>
+        |          ^~~~~~~~~~~~
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ configure.ac  | 1 +
+ src/haveged.c | 4 ++++
+ 2 files changed, 5 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index c172a10..a0263f5 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -125,6 +125,7 @@ AC_CHECK_HEADERS(stdio.h)
+ AC_CHECK_HEADERS(stdlib.h)
+ AC_CHECK_HEADERS(string.h)
+ AC_CHECK_HEADERS(sys/ioctl.h)
++AC_CHECK_HEADERS(sys/auxv.h)
+ AC_CHECK_HEADERS(sys/mman.h)
+ AC_CHECK_HEADERS(sys/types.h)
+ AC_CHECK_HEADERS(sys/socket.h)
+diff --git a/src/haveged.c b/src/haveged.c
+index b9cb77b..dad3072 100644
+--- a/src/haveged.c
++++ b/src/haveged.c
+@@ -19,7 +19,9 @@
+  ** along with this program.  If not, see <http://www.gnu.org/licenses/>.
+  */
+ #include "config.h"
++#if defined(HAVE_SYS_AUXV_H)
+ #include <sys/auxv.h>
++#endif
+ #include <stdlib.h>
+ #include <stdio.h>
+ #include <getopt.h>
+@@ -135,8 +137,10 @@ int main(int argc, char **argv)
+ {
+    volatile char *path = strdup(argv[0]);
+    volatile char *arg0 = argv[0];
++#if defined(HAVE_SYS_AUXV_H)
+    if (path[0] != '/')
+       path = (char*)getauxval(AT_EXECFN);
++#endif
+    static const char* cmds[] = {
+       "b", "buffer",      "1", SETTINGR("Buffer size [KW], default: ",COLLECT_BUFSIZE),
+       "d", "data",        "1", SETTINGR("Data cache size [KB], with fallback to: ", GENERIC_DCACHE ),
+-- 
+2.30.2
+
diff --git a/package/haveged/haveged.hash b/package/haveged/haveged.hash
index df8c48e214..f55e004923 100644
--- a/package/haveged/haveged.hash
+++ b/package/haveged/haveged.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d17bd22fa1745daca5ac72e014ed3b0fe5720da4c115953124b1bf2a0aa2b04b  haveged-1.9.13.tar.gz
+sha256  938cb494bcad7e4f24e61eb50fab4aa0acbc3240c80f3ad5c6cf7e6e922618c3  haveged-1.9.14.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/haveged/haveged.mk b/package/haveged/haveged.mk
index 3980f80132..209974cf13 100644
--- a/package/haveged/haveged.mk
+++ b/package/haveged/haveged.mk
@@ -4,16 +4,34 @@
 #
 ################################################################################
 
-HAVEGED_VERSION = 1.9.13
+HAVEGED_VERSION = 1.9.14
 HAVEGED_SITE = $(call github,jirka-h,haveged,v$(HAVEGED_VERSION))
 HAVEGED_LICENSE = GPL-3.0+
 HAVEGED_LICENSE_FILES = COPYING
 HAVEGED_SELINUX_MODULES = entropyd
+# patch touchign configure.ac
+HAVEGED_AUTORECONF = YES
+
+# '--enable-init=no' as buildroot ships its own sysv/systemd init files
+HAVEGED_CONF_OPTS = \
+	--enable-daemon=yes \
+	--enable-diagnostic=no \
+	--enable-init=no \
+	--enable-nistest=no \
+	--enable-enttest=no \
+	--enable-olt=no \
+	--enable-tune=yes
 
 ifeq ($(BR2_sparc_v8)$(BR2_sparc_leon3),y)
 HAVEGED_CONF_OPTS += --enable-clock_gettime=yes
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+HAVEGED_CONF_OPTS += --enable-threads=yes
+else
+HAVEGED_CONF_OPTS += --enable-threads=no
+endif
+
 define HAVEGED_INSTALL_INIT_SYSV
 	$(INSTALL) -m 755 -D package/haveged/S21haveged \
 		$(TARGET_DIR)/etc/init.d/S21haveged
-- 
2.30.2
