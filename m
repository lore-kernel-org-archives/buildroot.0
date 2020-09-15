From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Tue, 15 Sep 2020 12:37:05 -0700
Subject: [Buildroot] [PATCH v2] package/sentry-native: new package
In-Reply-To: <20200908222431.1047587-1-joseph.kogut@gmail.com>
References: <20200908222431.1047587-1-joseph.kogut@gmail.com>
Message-ID: <20200915193705.3191857-1-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>

---
Changes v1 -> v2:
	- Install libsentry to target

 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 .../0001-sentry.h-include-ucontext.h.patch    | 27 +++++++++++++++++++
 package/sentry-native/Config.in               | 25 +++++++++++++++++
 package/sentry-native/sentry-native.hash      |  3 +++
 package/sentry-native/sentry-native.mk        | 22 +++++++++++++++
 6 files changed, 79 insertions(+)
 create mode 100644 package/sentry-native/0001-sentry.h-include-ucontext.h.patch
 create mode 100644 package/sentry-native/Config.in
 create mode 100644 package/sentry-native/sentry-native.hash
 create mode 100644 package/sentry-native/sentry-native.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d59d538e42..931f3a35f2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1422,6 +1422,7 @@ F:	package/python-schedule/
 F:	package/python-sentry-sdk/
 F:	package/python-websockets/
 F:	package/python-xlib/
+F:	package/sentry-native/
 F:	package/unclutter-xfixes/

 N:	Joshua Henderson <joshua.henderson@microchip.com>
diff --git a/package/Config.in b/package/Config.in
index 1cf36fa28a..3672ad1f06 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -130,6 +130,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/ramspeed/Config.in"
 	source "package/rt-tests/Config.in"
 	source "package/spidev_test/Config.in"
+	source "package/sentry-native/Config.in"
 	source "package/strace/Config.in"
 	source "package/stress/Config.in"
 	source "package/stress-ng/Config.in"
diff --git a/package/sentry-native/0001-sentry.h-include-ucontext.h.patch b/package/sentry-native/0001-sentry.h-include-ucontext.h.patch
new file mode 100644
index 0000000000..9505787245
--- /dev/null
+++ b/package/sentry-native/0001-sentry.h-include-ucontext.h.patch
@@ -0,0 +1,27 @@
+From 6a3b7b28f34c91c72d8b849903d93de2997b82f1 Mon Sep 17 00:00:00 2001
+From: Joseph Kogut <joseph.kogut@gmail.com>
+Date: Tue, 8 Sep 2020 11:40:01 -0700
+Subject: [PATCH] sentry.h: include ucontext.h
+
+This is included by signal.h in newer versions of GCC, but results in an
+unknown type name error in older versions.
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
index 0000000000..a65aca5155
--- /dev/null
+++ b/package/sentry-native/Config.in
@@ -0,0 +1,25 @@
+config BR2_PACKAGE_SENTRY_NATIVE
+	bool "sentry-native"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GOOGLE_BREAKPAD_ARCH_SUPPORTS
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
index 0000000000..dcfdc1cee5
--- /dev/null
+++ b/package/sentry-native/sentry-native.mk
@@ -0,0 +1,22 @@
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
+SENTRY_NATIVE_DEPENDENCIES = libcurl google-breakpad linux-syscall-support
+
+# Use the built system breakpad client instead of bundling
+SENTRY_NATIVE_CONF_OPTS += -DSENTRY_BREAKPAD_SYSTEM=ON
+
+define SENTRY_NATIVE_INSTALL_TARGET_CMDS
+	$(INSTALL) -m755 -t $(TARGET_DIR)/usr/lib/ \
+		$(@D)/libsentry.so
+endef
+
+$(eval $(cmake-package))
--
2.28.0
