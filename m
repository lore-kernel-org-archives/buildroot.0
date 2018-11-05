From: Peter Seiderer <ps.report@gmx.net>
Date: Mon,  5 Nov 2018 23:04:26 +0100
Subject: [Buildroot] [PATCH v1 2/2] iwd: new package
In-Reply-To: <20181105220426.17194-1-ps.report@gmx.net>
References: <20181105220426.17194-1-ps.report@gmx.net>
Message-ID: <20181105220426.17194-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/Config.in                             |  1 +
 ...til.c-add-missing-ell-utf8.h-include.patch | 46 +++++++++++++++++++
 ...cap.c-add-missing-sys-stat.h-include.patch | 46 +++++++++++++++++++
 ..._iwd_backtrace_init-availability-det.patch | 32 +++++++++++++
 package/iwd/Config.in                         | 14 ++++++
 package/iwd/iwd.hash                          |  5 ++
 package/iwd/iwd.mk                            | 46 +++++++++++++++++++
 7 files changed, 190 insertions(+)
 create mode 100644 package/iwd/0001-src-util.c-add-missing-ell-utf8.h-include.patch
 create mode 100644 package/iwd/0002-monitor-pcap.c-add-missing-sys-stat.h-include.patch
 create mode 100644 package/iwd/0003-src-main.c-fix-__iwd_backtrace_init-availability-det.patch
 create mode 100644 package/iwd/Config.in
 create mode 100644 package/iwd/iwd.hash
 create mode 100644 package/iwd/iwd.mk

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
diff --git a/package/iwd/0001-src-util.c-add-missing-ell-utf8.h-include.patch b/package/iwd/0001-src-util.c-add-missing-ell-utf8.h-include.patch
new file mode 100644
index 0000000000..549cd6fdd1
--- /dev/null
+++ b/package/iwd/0001-src-util.c-add-missing-ell-utf8.h-include.patch
@@ -0,0 +1,46 @@
+From 174eb3088e78b75b4e488c023808c6f3bf7aae06 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Fri, 2 Nov 2018 14:19:12 +0100
+Subject: [PATCH] src/util.c: add missing ell/utf8.h include
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes:
+
+  src/util.c: In function ?util_ssid_to_utf8?:
+  src/util.c:57:16: warning: implicit declaration of function ?l_utf8_validate? [-Wimplicit-function-declaration]
+    while (i && (!l_utf8_validate((const char *)start, i,
+                  ^~~~~~~~~~~~~~~
+  src/util.c: In function ?util_string_to_address?:
+  src/util.c:128:8: warning: implicit declaration of function ?l_ascii_isxdigit? [-Wimplicit-function-declaration]
+     if (!l_ascii_isxdigit(str[i]))
+          ^~~~~~~~~~~~~~~~
+[...]
+  src/util.o: In function `util_string_to_address':
+  util.c:(.text+0x21c): undefined reference to `l_ascii_isxdigit'
+  util.c:(.text+0x228): undefined reference to `l_ascii_isxdigit'
+  util.c:(.text+0x24c): undefined reference to `l_ascii_isxdigit'
+  util.c:(.text+0x258): undefined reference to `l_ascii_isxdigit'
+  collect2: error: ld returned 1 exit status
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ src/util.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/util.c b/src/util.c
+index 7a08940..e12b622 100644
+--- a/src/util.c
++++ b/src/util.c
+@@ -29,6 +29,7 @@
+ #include <sys/uio.h>
+ 
+ #include <ell/string.h>
++#include <ell/utf8.h>
+ #include <ell/genl.h>
+ #include <ell/util.h>
+ #include <ell/log.h>
+-- 
+2.19.1
+
diff --git a/package/iwd/0002-monitor-pcap.c-add-missing-sys-stat.h-include.patch b/package/iwd/0002-monitor-pcap.c-add-missing-sys-stat.h-include.patch
new file mode 100644
index 0000000000..10875749c8
--- /dev/null
+++ b/package/iwd/0002-monitor-pcap.c-add-missing-sys-stat.h-include.patch
@@ -0,0 +1,46 @@
+From 6e90d02b38d2fad19d396c27d3e6d89c8f0e703f Mon Sep 17 00:00:00 2001
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
+index aae0956..64382dd 100644
+--- a/monitor/pcap.c
++++ b/monitor/pcap.c
+@@ -28,6 +28,7 @@
+ #include <fcntl.h>
+ #include <unistd.h>
+ #include <stdlib.h>
++#include <sys/stat.h>
+ #include <sys/uio.h>
+ #include <ell/ell.h>
+ 
+-- 
+2.19.1
+
diff --git a/package/iwd/0003-src-main.c-fix-__iwd_backtrace_init-availability-det.patch b/package/iwd/0003-src-main.c-fix-__iwd_backtrace_init-availability-det.patch
new file mode 100644
index 0000000000..e6ac3bee45
--- /dev/null
+++ b/package/iwd/0003-src-main.c-fix-__iwd_backtrace_init-availability-det.patch
@@ -0,0 +1,32 @@
+From 5f0fbde7ecfe76fdd437aaf0af34b3726e2c29fb Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Fri, 2 Nov 2018 14:38:37 +0100
+Subject: [PATCH] src/main.c: fix __iwd_backtrace_init() availability detection
+
+Fixes:
+
+  src/main.o: In function `main':
+  main.c:(.text.startup+0x798): undefined reference to `__iwd_backtrace_init'
+  collect2: error: ld returned 1 exit status
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ src/main.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/main.c b/src/main.c
+index afb895e..649e301 100644
+--- a/src/main.c
++++ b/src/main.c
+@@ -431,7 +431,7 @@ int main(int argc, char *argv[])
+ 	if (debugopt)
+ 		l_debug_enable(debugopt);
+ 
+-#ifdef __GLIBC__
++#if defined(__GLIBC__) && defined(HAVE_EXECINFO_H)
+ 	__iwd_backtrace_init();
+ #endif
+ 
+-- 
+2.19.1
+
diff --git a/package/iwd/Config.in b/package/iwd/Config.in
new file mode 100644
index 0000000000..c65e5e05d2
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
+	depends on BR2_STATIC_LIBS
+	depends on !BR2_USE_WCHAR
diff --git a/package/iwd/iwd.hash b/package/iwd/iwd.hash
new file mode 100644
index 0000000000..32018531b2
--- /dev/null
+++ b/package/iwd/iwd.hash
@@ -0,0 +1,5 @@
+# Locally computed
+sha256 cb071b9e10688e7347bb3f2d6927c27c635614e9a2b1c5eb3ea6203ca2894c05 iwd-0.10.tar.gz
+
+# License files
+sha256 ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5 COPYING
diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
new file mode 100644
index 0000000000..2e9d849d3f
--- /dev/null
+++ b/package/iwd/iwd.mk
@@ -0,0 +1,46 @@
+################################################################################
+#
+# iwd
+#
+################################################################################
+
+IWD_VERSION = 0.10
+IWD_SITE = https://git.kernel.org/pub/scm/network/wireless/iwd.git
+IWD_SITE_METHOD = git
+# iwd client depends on readline (GPL-3.0+)
+IWD_LICENSE = LGPL-2.1+, GPL-3.0+ (client)
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
