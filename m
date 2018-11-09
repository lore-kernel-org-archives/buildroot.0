From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 10 Nov 2018 00:17:25 +0100
Subject: [Buildroot] [PATCH v3 2/2] iwd: new package
In-Reply-To: <20181109231725.20059-1-ps.report@gmx.net>
References: <20181109231725.20059-1-ps.report@gmx.net>
Message-ID: <20181109231725.20059-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - update patch 0003-Fix-__iwd_backtrace_init-availability-detection.patch
  - fix iwd needs comment (missing depends on BR2_TOOLCHAIN_HAS_SYNC_4)
  - moved GPL-3.0+ (client) to enable client section
  - add DEVELOPERS entry

Changes v2 -> v3:
  - update to 0.11: fixes iwd-client readline/uclibc related
    compile failure (reported by Thomas Petazzoni), remove
    upstream fixed utf8.h patch
 - rebase/reorder remaining patches
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...cap.c-add-missing-sys-stat.h-include.patch | 46 ++++++++++++++
 ...acktrace_init-availability-detection.patch | 62 +++++++++++++++++++
 package/iwd/Config.in                         | 14 +++++
 package/iwd/iwd.hash                          |  5 ++
 package/iwd/iwd.mk                            | 47 ++++++++++++++
 7 files changed, 176 insertions(+)
 create mode 100644 package/iwd/0001-monitor-pcap.c-add-missing-sys-stat.h-include.patch
 create mode 100644 package/iwd/0002-Fix-__iwd_backtrace_init-availability-detection.patch
 create mode 100644 package/iwd/Config.in
 create mode 100644 package/iwd/iwd.hash
 create mode 100644 package/iwd/iwd.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 53467da489..d2c553a2ca 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1660,6 +1660,7 @@ F:	package/ghostscript-fonts/
 F:	package/gstreamer1/gst1-interpipe/
 F:	package/gstreamer1/gst1-validate/
 F:	package/gstreamer1/gstreamer1-editing-services/
+F:	package/iwd/
 F:	package/libevdev/
 F:	package/log4cplus/
 F:	package/postgresql/
diff --git a/package/Config.in b/package/Config.in
index b60e7700ad..2f2c0dc4e3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1866,6 +1866,7 @@ menu "Networking applications"
 	source "package/iputils/Config.in"
 	source "package/irssi/Config.in"
 	source "package/iw/Config.in"
+	source "package/iwd/Config.in"
 	source "package/janus-gateway/Config.in"
 	source "package/keepalived/Config.in"
 	source "package/kismet/Config.in"
diff --git a/package/iwd/0001-monitor-pcap.c-add-missing-sys-stat.h-include.patch b/package/iwd/0001-monitor-pcap.c-add-missing-sys-stat.h-include.patch
new file mode 100644
index 0000000000..83be65dcd1
--- /dev/null
+++ b/package/iwd/0001-monitor-pcap.c-add-missing-sys-stat.h-include.patch
@@ -0,0 +1,46 @@
+From a879fc32d58625bd9361219c1285ab6e5f012467 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Fri, 2 Nov 2018 14:29:53 +0100
+Subject: [PATCH] monitor/pcap.c: add missing sys/stat.h include
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes:
+
+    CC       monitor/pcap.o
+  monitor/pcap.c: In function ?pcap_create?:
+  monitor/pcap.c:121:6: error: ?S_IRUSR? undeclared (first use in this function)
+        S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
+        ^
+  monitor/pcap.c:121:6: note: each undeclared identifier is reported only once for each function it appears in
+  monitor/pcap.c:121:16: error: ?S_IWUSR? undeclared (first use in this function)
+        S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
+                  ^
+  monitor/pcap.c:121:26: error: ?S_IRGRP? undeclared (first use in this function)
+        S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
+                            ^
+  monitor/pcap.c:121:36: error: ?S_IROTH? undeclared (first use in this function)
+        S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
+                                      ^
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ monitor/pcap.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/monitor/pcap.c b/monitor/pcap.c
+index 54ad9f5..785aefa 100644
+--- a/monitor/pcap.c
++++ b/monitor/pcap.c
+@@ -29,6 +29,7 @@
+ #include <fcntl.h>
+ #include <unistd.h>
+ #include <stdlib.h>
++#include <sys/stat.h>
+ #include <sys/uio.h>
+ #include <sys/types.h>
+ #include <ell/ell.h>
+-- 
+2.19.1
+
diff --git a/package/iwd/0002-Fix-__iwd_backtrace_init-availability-detection.patch b/package/iwd/0002-Fix-__iwd_backtrace_init-availability-detection.patch
new file mode 100644
index 0000000000..53eeca0595
--- /dev/null
+++ b/package/iwd/0002-Fix-__iwd_backtrace_init-availability-detection.patch
@@ -0,0 +1,62 @@
+From 124f6437c246b60f4254651d95b65140b8964ccc Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Fri, 2 Nov 2018 14:38:37 +0100
+Subject: [PATCH] Fix __iwd_backtrace_init() availability detection
+
+Check for HAVE_EXECINFO_H for all __iwd_backtrace_init usages (and
+remove unused backtrace.h usage from plugins/ofono.c).
+
+Fixes:
+
+  src/main.o: In function `main':
+  main.c:(.text.startup+0x798): undefined reference to `__iwd_backtrace_init'
+  collect2: error: ld returned 1 exit status
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ plugins/ofono.c | 1 -
+ src/backtrace.h | 2 +-
+ src/main.c      | 2 +-
+ 3 files changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/plugins/ofono.c b/plugins/ofono.c
+index 8c019ce..077045f 100644
+--- a/plugins/ofono.c
++++ b/plugins/ofono.c
+@@ -31,7 +31,6 @@
+ 
+ #include "src/dbus.h"
+ #include "src/simauth.h"
+-#include "src/backtrace.h"
+ 
+ /*
+  * This plugin takes care of all the communication with ofono in order to
+diff --git a/src/backtrace.h b/src/backtrace.h
+index bfdc858..829ba02 100644
+--- a/src/backtrace.h
++++ b/src/backtrace.h
+@@ -19,7 +19,7 @@
+  *  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
+  *
+  */
+-#ifdef __GLIBC__
++#ifdef HAVE_EXECINFO_H
+ void __iwd_backtrace_init();
+ void __iwd_backtrace_print(unsigned int offset);
+ #endif
+diff --git a/src/main.c b/src/main.c
+index c1a2c42..8035fa0 100644
+--- a/src/main.c
++++ b/src/main.c
+@@ -445,7 +445,7 @@ int main(int argc, char *argv[])
+ 	if (debugopt)
+ 		l_debug_enable(debugopt);
+ 
+-#ifdef __GLIBC__
++#ifdef HAVE_EXECINFO_H
+ 	__iwd_backtrace_init();
+ #endif
+ 
+-- 
+2.19.1
+
diff --git a/package/iwd/Config.in b/package/iwd/Config.in
new file mode 100644
index 0000000000..c790f3dba1
--- /dev/null
+++ b/package/iwd/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_IWD
+	bool "iwd"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # ell
+	depends on !BR2_STATIC_LIBS # ell
+	depends on BR2_USE_WCHAR # ell
+	select BR2_PACKAGE_ELL
+	help
+	  iNet Wireless daemon (iwd)
+
+	  https://iwd.wiki.kernel.org/
+
+comment "iwd needs a toolchain w/ dynamic library, wchar"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # ell
+	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
diff --git a/package/iwd/iwd.hash b/package/iwd/iwd.hash
new file mode 100644
index 0000000000..cc3d419560
--- /dev/null
+++ b/package/iwd/iwd.hash
@@ -0,0 +1,5 @@
+# Locally computed
+sha256 a4f9798d6a203396af06813adb52dce9708d2ad5726a86305435b1174e9b4cb2 iwd-0.11.tar.gz
+
+# License files
+sha256 ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5 COPYING
diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
new file mode 100644
index 0000000000..2ff8f88cf8
--- /dev/null
+++ b/package/iwd/iwd.mk
@@ -0,0 +1,47 @@
+################################################################################
+#
+# iwd
+#
+################################################################################
+
+IWD_VERSION = 0.11
+IWD_SITE = https://git.kernel.org/pub/scm/network/wireless/iwd.git
+IWD_SITE_METHOD = git
+IWD_LICENSE = LGPL-2.1+
+IWD_LICENSE_FILES = COPYING
+# sources from git, no configure script provided
+IWD_AUTORECONF = YES
+
+IWD_CONF_OPTS = --enable-external-ell
+IWD_DEPENDENCIES = ell
+
+# autoreconf requires an existing build-aux directory
+define IWD_MKDIR_BUILD_AUX
+	mkdir -p $(@D)/build-aux
+endef
+IWD_POST_PATCH_HOOKS += IWD_MKDIR_BUILD_AUX
+
+ifeq ($(BR2_PACKAGE_DBUS),y)
+IWD_CONF_OPTS += --enable-dbus-policy
+IWD_DEPENDENCIES += dbus
+else
+IWD_CONF_OPTS += --disable-dbus-policy
+endif
+
+ifeq ($(BR2_PACKAGE_READLINE),y)
+# iwd client depends on readline (GPL-3.0+)
+IWD_LICENSE := $(IWD_LICENSE), GPL-3.0+ (client)
+IWD_CONF_OPTS += --enable-client
+IWD_DEPENDENCIES += readline
+else
+IWD_CONF_OPTS += --disable-client
+endif
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+IWD_CONF_OPTS += --enable-systemd-service
+IWD_DEPENDENCIES += systemd
+else
+IWD_CONF_OPTS += --disable-systemd-service
+endif
+
+$(eval $(autotools-package))
-- 
2.19.1
