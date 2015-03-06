From: Philippe Proulx <eeppeliteloop@gmail.com>
Date: Fri,  6 Mar 2015 12:35:56 -0500
Subject: [Buildroot] [PATCH 6/7] lttng-libust: rename package to lttng-ust
In-Reply-To: <1425663357-22541-1-git-send-email-eeppeliteloop@gmail.com>
References: <1425663357-22541-1-git-send-email-eeppeliteloop@gmail.com>
Message-ID: <1425663357-22541-7-git-send-email-eeppeliteloop@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

LTTng-UST is the official project name, although it
contains various shared libraries.

Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
---
 package/Config.in                                        |  2 +-
 package/lttng-libust/lttng-libust.mk                     | 16 ----------------
 package/lttng-tools/Config.in                            |  2 +-
 package/lttng-tools/lttng-tools.mk                       |  4 ++--
 package/{lttng-libust => lttng-ust}/Config.in            |  8 ++++----
 .../lttng-libust.hash => lttng-ust/lttng-ust.hash}       |  0
 package/lttng-ust/lttng-ust.mk                           | 16 ++++++++++++++++
 7 files changed, 24 insertions(+), 24 deletions(-)
 delete mode 100644 package/lttng-libust/lttng-libust.mk
 rename package/{lttng-libust => lttng-ust}/Config.in (82%)
 rename package/{lttng-libust/lttng-libust.hash => lttng-ust/lttng-ust.hash} (100%)
 create mode 100644 package/lttng-ust/lttng-ust.mk

diff --git a/package/Config.in b/package/Config.in
index 584887b..ffc8260 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -977,7 +977,7 @@ menu "Other"
 	source "package/libuv/Config.in"
 	source "package/lightning/Config.in"
 	source "package/linux-pam/Config.in"
-	source "package/lttng-libust/Config.in"
+	source "package/lttng-ust/Config.in"
 	source "package/mpc/Config.in"
 	source "package/mpdecimal/Config.in"
 	source "package/mpfr/Config.in"
diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
deleted file mode 100644
index 0a4f6bf..0000000
--- a/package/lttng-libust/lttng-libust.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-################################################################################
-#
-# lttng-libust
-#
-################################################################################
-
-LTTNG_LIBUST_SITE = http://lttng.org/files/lttng-ust
-LTTNG_LIBUST_VERSION = 2.6.0
-LTTNG_LIBUST_SOURCE = lttng-ust-$(LTTNG_LIBUST_VERSION).tar.bz2
-LTTNG_LIBUST_LICENSE = LGPLv2.1; MIT for system headers; GPLv2 for liblttng-ust-ctl/ustctl.c (used by lttng-sessiond)
-LTTNG_LIBUST_LICENSE_FILES = gpl-2.0.txt lgpl-2.1.txt mit-license.txt COPYING LICENSE
-
-LTTNG_LIBUST_INSTALL_STAGING = YES
-LTTNG_LIBUST_DEPENDENCIES = liburcu util-linux
-
-$(eval $(autotools-package))
diff --git a/package/lttng-tools/Config.in b/package/lttng-tools/Config.in
index a960b21..2d3bbf1 100644
--- a/package/lttng-tools/Config.in
+++ b/package/lttng-tools/Config.in
@@ -26,7 +26,7 @@ config BR2_PACKAGE_LTTNG_TOOLS
 	  interesting.
 
 	  If userspace tracing is desired, you need to enable
-	  lttng-libust.
+	  lttng-ust.
 
 	  http://lttng.org
 
diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index e218a95..675e8eb 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -19,9 +19,9 @@ LTTNG_TOOLS_DEPENDENCIES = liburcu libxml2 popt host-lttng-babeltrace util-linux
 
 LTTNG_AUTORECONF = YES
 
-ifeq ($(BR2_PACKAGE_LTTNG_LIBUST),y)
+ifeq ($(BR2_PACKAGE_LTTNG_UST),y)
 LTTNG_TOOLS_CONF_OPTS += --enable-lttng-ust
-LTTNG_TOOLS_DEPENDENCIES += lttng-libust
+LTTNG_TOOLS_DEPENDENCIES += lttng-ust
 else
 LTTNG_TOOLS_CONF_OPTS += --disable-lttng-ust
 endif
diff --git a/package/lttng-libust/Config.in b/package/lttng-ust/Config.in
similarity index 82%
rename from package/lttng-libust/Config.in
rename to package/lttng-ust/Config.in
index 0a6abb6..7526433 100644
--- a/package/lttng-libust/Config.in
+++ b/package/lttng-ust/Config.in
@@ -1,5 +1,5 @@
-config BR2_PACKAGE_LTTNG_LIBUST
-	bool "lttng-libust"
+config BR2_PACKAGE_LTTNG_UST
+	bool "lttng-ust"
 	select BR2_PACKAGE_LIBURCU
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
@@ -18,10 +18,10 @@ config BR2_PACKAGE_LTTNG_LIBUST
 
 	  http://lttng.org
 
-comment "lttng-libust needs a toolchain w/ wchar, largefile, threads"
+comment "lttng-ust needs a toolchain w/ wchar, largefile, threads"
 	depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_powerpc || BR2_x86_64
 	depends on !BR2_USE_WCHAR || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_58854 # liburcu/gcc-4.8.x bug
 
-comment "lttng-libust needs a toolchain not affected by GCC bug 58854"
+comment "lttng-ust needs a toolchain not affected by GCC bug 58854"
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_58854
diff --git a/package/lttng-libust/lttng-libust.hash b/package/lttng-ust/lttng-ust.hash
similarity index 100%
rename from package/lttng-libust/lttng-libust.hash
rename to package/lttng-ust/lttng-ust.hash
diff --git a/package/lttng-ust/lttng-ust.mk b/package/lttng-ust/lttng-ust.mk
new file mode 100644
index 0000000..78fb050
--- /dev/null
+++ b/package/lttng-ust/lttng-ust.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# lttng-ust
+#
+################################################################################
+
+LTTNG_UST_SITE = http://lttng.org/files/lttng-ust
+LTTNG_UST_VERSION = 2.6.0
+LTTNG_UST_SOURCE = lttng-ust-$(LTTNG_UST_VERSION).tar.bz2
+LTTNG_UST_LICENSE = LGPLv2.1; MIT for system headers; GPLv2 for liblttng-ust-ctl/ustctl.c (used by lttng-sessiond)
+LTTNG_UST_LICENSE_FILES = gpl-2.0.txt lgpl-2.1.txt mit-license.txt COPYING LICENSE
+
+LTTNG_UST_INSTALL_STAGING = YES
+LTTNG_UST_DEPENDENCIES = liburcu util-linux
+
+$(eval $(autotools-package))
-- 
2.2.1
