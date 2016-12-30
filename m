From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Dec 2016 11:29:34 +0100
Subject: [Buildroot] [PATCH 33/52] package/libqb: new package
In-Reply-To: <cover.1483093662.git.yann.morin.1998@free.fr>
References: <cover.1483093662.git.yann.morin.1998@free.fr>
Message-ID: <9f94a3403b91cd972f4e58102888fa31cdb300e7.1483093662.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/Config.in                                  |  1 +
 ...fix-CLOCK_MONOTONIC-check-for-cross-compi.patch | 33 ++++++++++++++++++++++
 package/libqb/Config.in                            | 12 ++++++++
 package/libqb/libqb.hash                           |  2 ++
 package/libqb/libqb.mk                             | 32 +++++++++++++++++++++
 5 files changed, 80 insertions(+)
 create mode 100644 package/libqb/0001-bconfigure-fix-CLOCK_MONOTONIC-check-for-cross-compi.patch
 create mode 100644 package/libqb/Config.in
 create mode 100644 package/libqb/libqb.hash
 create mode 100644 package/libqb/libqb.mk

diff --git a/package/Config.in b/package/Config.in
index dd9f3de..1a754d4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1337,6 +1337,7 @@ menu "Other"
 	source "package/libplist/Config.in"
 	source "package/libpthread-stubs/Config.in"
 	source "package/libpthsem/Config.in"
+	source "package/libqb/Config.in"
 	source "package/libseccomp/Config.in"
 	source "package/libsigc/Config.in"
 	source "package/libsigsegv/Config.in"
diff --git a/package/libqb/0001-bconfigure-fix-CLOCK_MONOTONIC-check-for-cross-compi.patch b/package/libqb/0001-bconfigure-fix-CLOCK_MONOTONIC-check-for-cross-compi.patch
new file mode 100644
index 0000000..6d22649
--- /dev/null
+++ b/package/libqb/0001-bconfigure-fix-CLOCK_MONOTONIC-check-for-cross-compi.patch
@@ -0,0 +1,33 @@
+From f9857721bfe5c47253bc2cf487d9dcc94cbce3c2 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Mon, 26 Dec 2016 19:38:45 +0100
+Subject: [PATCH] bconfigure: fix CLOCK_MONOTONIC check for cross-compilation
+
+In cross-compilation, we can't run test programs, so configure just
+bails out. Since there is no cache variable (e.g. ac_cv_blabla, we can't
+even provide the correct result.
+
+But in thise case, we don't really need to run to start with; we just
+need to check if the toolchain headers know about CLOCK_MONOTONIC.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 560b330..6972213 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -179,7 +179,7 @@ AC_COMPILE_IFELSE([AC_LANG_PROGRAM(
+                  )
+ 
+ AC_MSG_CHECKING(for a working clock_getres(CLOCK_MONOTONIC, &ts))
+-AC_RUN_IFELSE([AC_LANG_PROGRAM(
++AC_COMPILE_IFELSE([AC_LANG_PROGRAM(
+ [[#include <time.h>]],
+ [[struct timespec ts; if(clock_getres(CLOCK_MONOTONIC, &ts)) return -1;]])],
+                     [
+-- 
+2.7.4
+
diff --git a/package/libqb/Config.in b/package/libqb/Config.in
new file mode 100644
index 0000000..1bfea8b
--- /dev/null
+++ b/package/libqb/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LIBQB
+	bool "libqb"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  libqb is a library with the primary purpose of providing high
+	  performance client server reusable features. It provides high
+	  performance logging, tracing, ipc, and poll.
+
+	  https://github.com/clusterlabs/libqb/wiki
+
+comment "libqb needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libqb/libqb.hash b/package/libqb/libqb.hash
new file mode 100644
index 0000000..b1a9320
--- /dev/null
+++ b/package/libqb/libqb.hash
@@ -0,0 +1,2 @@
+# sha256 locally computed
+sha256  98a6f8d7b83013747788ff7f1aace387ec532a8e7fbecc354ad9260f426dd518  libqb-v1.0.1.tar.gz
diff --git a/package/libqb/libqb.mk b/package/libqb/libqb.mk
new file mode 100644
index 0000000..5ca2480
--- /dev/null
+++ b/package/libqb/libqb.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# libqb
+#
+################################################################################
+
+LIBQB_VERSION = v1.0.1
+LIBQB_SITE = $(call github,ClusterLabs,libqb,$(LIBQB_VERSION))
+
+LIBQB_LICENSE = LGPLv2.1+
+LIBQB_LICENSE_FILES = COPYING
+
+LIBQB_DEPENDENCIES = host-pkgconf
+
+# Straight out of the repository, no configure present. Also, we do patch
+# configure.ac.
+LIBQB_AUTORECONF = YES
+
+LIBQB_INSTALL_STAGING = YES
+
+define LIBQB_M4
+	$(INSTALL) -d -m 0755 $(@D)/m4
+endef
+LIBQB_POST_EXTRACT_HOOKS += LIBQB_M4
+
+# Don't build docs
+LIBQB_CONF_ENV = ac_cv_prog_DOXYGEN=
+
+# Don't use -Werror
+LIBQB_CONF_OPTS = --disable-fatal-warnings
+
+$(eval $(autotools-package))
-- 
2.7.4
