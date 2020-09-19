From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 23:14:09 +0200
Subject: [Buildroot] [git commit] package/sentry-native: new package
Message-ID: <20200919210456.F3CA285EEF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ffd603ae7ec8c3d108f7da7dc456c07828253a89
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
Tested-by: Titouan Christophe <titouan.christophe@railnova.eu>
Reviewed-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 .../0001-sentry.h-include-ucontext.h.patch         | 27 +++++++++++++++++++++
 package/sentry-native/Config.in                    | 28 ++++++++++++++++++++++
 package/sentry-native/sentry-native.hash           |  3 +++
 package/sentry-native/sentry-native.mk             | 18 ++++++++++++++
 6 files changed, 78 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index fd839c8f63..42bbdc7e78 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1424,6 +1424,7 @@ F:	package/python-sentry-sdk/
 F:	package/python-websockets/
 F:	package/python-xlib/
 F:	package/sentry-cli/
+F:	package/sentry-native/
 F:	package/unclutter-xfixes/
 
 N:	Joshua Henderson <joshua.henderson@microchip.com>
diff --git a/package/Config.in b/package/Config.in
index 2f30252891..0282a2069f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -129,6 +129,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/ramsmp/Config.in"
 	source "package/ramspeed/Config.in"
 	source "package/rt-tests/Config.in"
+	source "package/sentry-native/Config.in"
 	source "package/spidev_test/Config.in"
 	source "package/strace/Config.in"
 	source "package/stress/Config.in"
diff --git a/package/sentry-native/0001-sentry.h-include-ucontext.h.patch b/package/sentry-native/0001-sentry.h-include-ucontext.h.patch
new file mode 100644
index 0000000000..108f38928e
--- /dev/null
+++ b/package/sentry-native/0001-sentry.h-include-ucontext.h.patch
@@ -0,0 +1,27 @@
+From 6a3b7b28f34c91c72d8b849903d93de2997b82f1 Mon Sep 17 00:00:00 2001
+From: Joseph Kogut <joseph.kogut@gmail.com>
+Date: Tue, 8 Sep 2020 11:40:01 -0700
+Subject: [PATCH] sentry.h: include ucontext.h
+
+This is included by signal.h in newer versions of glibc, but results
+in an unknown type name error in older versions.
+
+Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
+---
+ include/sentry.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/sentry.h b/include/sentry.h
+index 25754d9..a55cc00 100644
+--- a/include/sentry.h
++++ b/include/sentry.h
+@@ -78,6 +78,7 @@ extern "C" {
+ #    include <wtypes.h>
+ #else
+ #    include <signal.h>
++#    include <ucontext.h>
+ #endif
+
+ /**
+--
+2.28.0
diff --git a/package/sentry-native/Config.in b/package/sentry-native/Config.in
new file mode 100644
index 0000000000..7a3cbd36ad
--- /dev/null
+++ b/package/sentry-native/Config.in
@@ -0,0 +1,28 @@
+config BR2_PACKAGE_SENTRY_NATIVE
+	bool "sentry-native"
+	depends on BR2_INSTALL_LIBSTDCPP # google-breakpad
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # google-breakpad
+	depends on BR2_USE_WCHAR # google-breakpad
+	depends on BR2_TOOLCHAIN_HAS_THREADS # google-breakpad
+	# google-breakpad is restricted to glibc or uClibc, but
+	# sentry-native needs <execinfo.h>, so it restricts further to
+	# just glibc.
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS # google-breakpad
+	depends on BR2_PACKAGE_HOST_GOOGLE_BREAKPAD_ARCH_SUPPORTS # google-breakpad
+	select BR2_PACKAGE_GOOGLE_BREAKPAD
+	select BR2_PACKAGE_LIBCURL
+	help
+	  The Sentry Native SDK is an error and crash
+	  reporting client for native applications,
+	  optimized for C and C++.
+
+	  https://github.com/getsentry/sentry-native
+
+comment "sentry-native needs a glibc toolchain with w/ wchar, thread, C++, gcc >= 4.8"
+	depends on BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GOOGLE_BREAKPAD_ARCH_SUPPORTS
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_USES_GLIBC || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/sentry-native/sentry-native.hash b/package/sentry-native/sentry-native.hash
new file mode 100644
index 0000000000..dffc7aeca3
--- /dev/null
+++ b/package/sentry-native/sentry-native.hash
@@ -0,0 +1,3 @@
+# locally calculated
+sha256  a7d04fe9b9175c30a58ce20ae23b510595045a66884a447dd21ff2d0c749751b  sentry-native-0.4.1.tar.gz
+sha256  5ef07a3d95f1f779c1597c0fbaecbb7ba242128ff0587ed1e3214c7ac6154523  LICENSE
diff --git a/package/sentry-native/sentry-native.mk b/package/sentry-native/sentry-native.mk
new file mode 100644
index 0000000000..b2b86d4586
--- /dev/null
+++ b/package/sentry-native/sentry-native.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# sentry-native
+#
+################################################################################
+
+SENTRY_NATIVE_VERSION = 0.4.1
+SENTRY_NATIVE_SITE = $(call github,getsentry,sentry-native,$(SENTRY_NATIVE_VERSION))
+SENTRY_NATIVE_INSTALL_STAGING = YES
+SENTRY_NATIVE_LICENSE = MIT
+SENTRY_NATIVE_LICENSE_FILES = LICENSE
+SENTRY_NATIVE_DEPENDENCIES = libcurl google-breakpad
+SENTRY_NATIVE_INSTALL_STAGING = YES
+
+# Use the built system breakpad client instead of bundling
+SENTRY_NATIVE_CONF_OPTS += -DSENTRY_BREAKPAD_SYSTEM=ON
+
+$(eval $(cmake-package))
