From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Jan 2017 21:22:35 +1300
Subject: [Buildroot] [git commit] libgpiod: new package
Message-ID: <20170123082355.142C881E01@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f3940282c03ad4356e018223f7c4c20076dd61ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a package containing a C library and a set of command-line tools
for controlling GPIOs from user space using the new character device
interface on linux.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
[Thomas:
 - add comment about autoreconf=yes (suggested by Romain Naour)
 - add more conventional syntax for the --{enable,disable}-tools usage
   (suggested by Romain Naour)
 - add patch to fix musl build.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |  1 +
 ...de-gpiod.h-include-missing-time.h-include.patch | 36 ++++++++++++++++++++++
 package/libgpiod/Config.in                         | 20 ++++++++++++
 package/libgpiod/libgpiod.hash                     |  2 ++
 package/libgpiod/libgpiod.mk                       | 20 ++++++++++++
 5 files changed, 79 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 1766089..560a52c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1046,6 +1046,7 @@ menu "Hardware handling"
 	source "package/libfreefare/Config.in"
 	source "package/libftdi/Config.in"
 	source "package/libftdi1/Config.in"
+	source "package/libgpiod/Config.in"
 	source "package/libgudev/Config.in"
 	source "package/libhid/Config.in"
 	source "package/libiio/Config.in"
diff --git a/package/libgpiod/0001-include-gpiod.h-include-missing-time.h-include.patch b/package/libgpiod/0001-include-gpiod.h-include-missing-time.h-include.patch
new file mode 100644
index 0000000..f3744fd
--- /dev/null
+++ b/package/libgpiod/0001-include-gpiod.h-include-missing-time.h-include.patch
@@ -0,0 +1,36 @@
+From 93fd4a02233d29f78b261d99d9ce6b14869b19c7 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Mon, 23 Jan 2017 21:17:15 +1300
+Subject: [PATCH] include/gpiod.h: include missing <time.h> include
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+gpiod.h uses "struct timespec", but forgets to include the <time.h>
+header which defines "struct timespec". This causes a build error with
+the musl C library:
+
+In file included from core.c:11:0:
+../../include/gpiod.h:232:49: warning: ???struct timespec??? declared inside parameter list
+ typedef int (*gpiod_event_cb)(int, const struct timespec *, void *);
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ include/gpiod.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/gpiod.h b/include/gpiod.h
+index 8c5858e..c1f252d 100644
+--- a/include/gpiod.h
++++ b/include/gpiod.h
+@@ -22,6 +22,7 @@
+ 
+ #include <stdlib.h>
+ #include <stdbool.h>
++#include <time.h>
+ 
+ #ifdef __cplusplus
+ extern "C" {
+-- 
+2.7.4
+
diff --git a/package/libgpiod/Config.in b/package/libgpiod/Config.in
new file mode 100644
index 0000000..63a7cb6
--- /dev/null
+++ b/package/libgpiod/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_LIBGPIOD
+	bool "libgpiod"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
+	help
+	  This is a C library that abstracts the GPIO character
+	  device operations on linux.
+
+	  https://github.com/brgl/libgpiod
+
+if BR2_PACKAGE_LIBGPIOD
+
+config BR2_PACKAGE_LIBGPIOD_TOOLS
+	bool "install tools"
+	help
+	  Include a set of command-line tools for managing GPIOs.
+
+endif
+
+comment "libgpiod needs kernel headers >= 4.8"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
diff --git a/package/libgpiod/libgpiod.hash b/package/libgpiod/libgpiod.hash
new file mode 100644
index 0000000..7de17bb
--- /dev/null
+++ b/package/libgpiod/libgpiod.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 0f9f5215d0100a8066f4e6b064892747720e556cbb83f6c05d6151d68ec2025b libgpiod-v0.1.tar.gz
diff --git a/package/libgpiod/libgpiod.mk b/package/libgpiod/libgpiod.mk
new file mode 100644
index 0000000..b9bd311
--- /dev/null
+++ b/package/libgpiod/libgpiod.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# libgpiod
+#
+################################################################################
+
+LIBGPIOD_VERSION = v0.1
+LIBGPIOD_SITE = $(call github,brgl,libgpiod,$(LIBGPIOD_VERSION))
+LIBGPIOD_LICENSE = GPLv3+
+LIBGPIOD_LICENSE_FILES = COPYING
+# fetched from github, no configure script provided
+LIBGPIOD_AUTORECONF = YES
+
+ifeq ($(BR2_PACKAGE_LIBGPIOD_TOOLS),y)
+LIBGPIOD_CONF_OPTS += --enable-tools
+else
+LIBGPIOD_CONF_OPTS += --disable-tools
+endif
+
+$(eval $(autotools-package))
