From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Sep 2018 09:52:05 +0200
Subject: [Buildroot] [PATCH] sedutil: new package
Message-ID: <20180926075205.1691-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Utilities to configure self encrypting drives that comply with the TCG OPAL
2.00 standard.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 .../0001-Common-log.h-time-2-needs-time.h.patch    | 37 ++++++++++++++++++++++
 package/sedutil/Config.in                          | 27 ++++++++++++++++
 package/sedutil/sedutil.hash                       |  3 ++
 package/sedutil/sedutil.mk                         | 20 ++++++++++++
 6 files changed, 89 insertions(+)
 create mode 100644 package/sedutil/0001-Common-log.h-time-2-needs-time.h.patch
 create mode 100644 package/sedutil/Config.in
 create mode 100644 package/sedutil/sedutil.hash
 create mode 100644 package/sedutil/sedutil.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 84129553c5..d75d43d93c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1628,6 +1628,7 @@ F:	package/python-texttable/
 F:	package/python-validators/
 F:	package/python-webob/
 F:	package/python-websocket-client/
+F:	package/sedutil/
 F:	package/triggerhappy/
 
 N:	Peter Seiderer <ps.report@gmx.net>
diff --git a/package/Config.in b/package/Config.in
index c04645a30b..52f11c407a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -503,6 +503,7 @@ endmenu
 	source "package/rtl8821au/Config.in"
 	source "package/sane-backends/Config.in"
 	source "package/sdparm/Config.in"
+	source "package/sedutil/Config.in"
 	source "package/setserial/Config.in"
 	source "package/sg3_utils/Config.in"
 	source "package/sigrok-cli/Config.in"
diff --git a/package/sedutil/0001-Common-log.h-time-2-needs-time.h.patch b/package/sedutil/0001-Common-log.h-time-2-needs-time.h.patch
new file mode 100644
index 0000000000..9cf74b6760
--- /dev/null
+++ b/package/sedutil/0001-Common-log.h-time-2-needs-time.h.patch
@@ -0,0 +1,37 @@
+From a7a48e1cda997afbfcdd985c594c3ec0516b6279 Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <peter@korsgaard.com>
+Date: Tue, 25 Sep 2018 22:49:58 +0200
+Subject: [PATCH] Common/log.h: time(2) needs <time.h>
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Otherwise the build fails with:
+
+In file included from ./linux/os.h:28:0,
+                 from Common/DtaOptions.cpp:20:
+./Common/log.h: In function ?std::__cxx11::string NowTime()?:
+./Common/log.h:349:12: error: ?time? was not declared in this scope
+     time(&t);
+
+Upstream-status: https://github.com/Drive-Trust-Alliance/sedutil/pull/250
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ Common/log.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Common/log.h b/Common/log.h
+index 8c08c40..2b718ad 100644
+--- a/Common/log.h
++++ b/Common/log.h
+@@ -341,6 +341,7 @@ inline std::string NowTime() {
+ 
+ #else
+ 
++#include <time.h>
+ #include <sys/time.h>
+ 
+ inline std::string NowTime() {
+-- 
+2.11.0
+
diff --git a/package/sedutil/Config.in b/package/sedutil/Config.in
new file mode 100644
index 0000000000..fbfcf0dd54
--- /dev/null
+++ b/package/sedutil/Config.in
@@ -0,0 +1,27 @@
+config BR2_PACKAGE_SEDUTIL_ARCH_SUPPORTS
+	bool
+	# no big endian support
+	default y if BR2_arcle || BR2_arm || BR2_aarch64 || BR2_csky \
+	       || BR2_i386 || BR2_microblazeel || BR2_mipsel \
+	       || BR2_mips64el || BR2_nios2 || BR2_powerpc64le \
+	       || BR2_sh4 || BR2_sh4a || BR2_x86_64 \
+	       || BR2_XTENSA_LITTLE_ENDIAN
+
+config BR2_PACKAGE_SEDUTIL
+	bool "sedutil"
+	depends on BR2_PACKAGE_SEDUTIL_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # linux/nvme.h
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  The Drive Trust Alliance Self Encrypting Drive Utility,
+	  allowing configuration the SEDs that comply with the
+	  TCG OPAL 2.00 standard.
+
+          https://github.com/Drive-Trust-Alliance/sedutil
+
+comment "sedutil needs a toolchain w/ C++, gcc >= 4.8, headers >= 3.12"
+	depends on BR2_PACKAGE_SEDUTIL_ARCH_SUPPORTS
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
diff --git a/package/sedutil/sedutil.hash b/package/sedutil/sedutil.hash
new file mode 100644
index 0000000000..9db1011379
--- /dev/null
+++ b/package/sedutil/sedutil.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 9259466b4f73af276153c5245834a56f48f8721ea7263611b5d5e8326bc43d9e  sedutil-1.15.1.tar.gz
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  Common/LICENSE.txt
diff --git a/package/sedutil/sedutil.mk b/package/sedutil/sedutil.mk
new file mode 100644
index 0000000000..c80e43448d
--- /dev/null
+++ b/package/sedutil/sedutil.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# sedutil
+#
+################################################################################
+
+SEDUTIL_VERSION = 1.15.1
+SEDUTIL_SITE = $(call github,Drive-Trust-Alliance,sedutil,$(SEDUTIL_VERSION))
+SEDUTIL_LICENSE = GPL-3.0+
+SEDUTIL_LICENSE_FILES = Common/LICENSE.txt
+# Fetched from Github with no configure script
+SEDUTIL_AUTORECONF = YES
+
+# Calls git to figure out version info
+define SEDUTIL_SET_VERSION
+	echo '#define GIT_VERSION "$(SEDUTIL_VERSION)"' > $(@D)/linux/Version.h
+endef
+SEDUTIL_POST_CONFIGURE_HOOKS += SEDUTIL_SET_VERSION
+
+$(eval $(autotools-package))
-- 
2.11.0
