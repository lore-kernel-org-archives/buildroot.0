From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 23 May 2015 00:18:41 +0200
Subject: [Buildroot] [RFC v1] racehound: new package
Message-ID: <1432333121-26888-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
ToDo:
 - add dependency/check for linux-kenel >= 3.14
 - only compile tested, not yet runtime tested
---
 package/Config.in              |  1 +
 package/racehound/Config.in    | 30 ++++++++++++++++++++++++++++++
 package/racehound/racehound.mk | 21 +++++++++++++++++++++
 3 files changed, 52 insertions(+)
 create mode 100644 package/racehound/Config.in
 create mode 100644 package/racehound/racehound.mk

diff --git a/package/Config.in b/package/Config.in
index e0c2e2a..5263374 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -89,6 +89,7 @@ endif
 	source "package/pax-utils/Config.in"
 	source "package/perf/Config.in"
 	source "package/pv/Config.in"
+	source "package/racehound/Config.in"
 	source "package/ramsmp/Config.in"
 	source "package/ramspeed/Config.in"
 	source "package/rt-tests/Config.in"
diff --git a/package/racehound/Config.in b/package/racehound/Config.in
new file mode 100644
index 0000000..ff3be27
--- /dev/null
+++ b/package/racehound/Config.in
@@ -0,0 +1,30 @@
+config BR2_PACKAGE_RACEHOUND
+	bool "racehound"
+	select BR2_PACKAGE_ELFUTILS
+	depends on BR2_LINUX_KERNEL
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR # elfutils
+	depends on !BR2_STATIC_LIBS # elfutils
+	# only x86/x86_64 supported
+	depends on BR2_i386 || BR2_x86_64
+	help
+	  RaceHound can be used to detect data races in the Linux
+	  kernel on x86.
+
+	  RaceHound needs the following kernel configurations enabled:
+	  - CONFIG_X86_32 or CONFIG_X86_64
+	  - CONFIG_MODULES
+	  - CONFIG_MODULE_UNLOAD
+	  - CONFIG_SYSFS
+	  - CONFIG_DEBUG_FS
+	  - CONFIG_KALLSYMS
+
+	  https://github.com/winnukem/racehound
+
+comment "racehound needs an Linux kernel to be built
+	depends on !BR2_LINUX_KERNEL
+	depends on BR2_i386 || BR2_x86_64
+
+comment "racehound needs a toolchain w/ C++, wchar, dynamic library"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR) || BR2_STATIC_LIBS
+	depends on BR2_i386 || BR2_x86_64
diff --git a/package/racehound/racehound.mk b/package/racehound/racehound.mk
new file mode 100644
index 0000000..2d94b21
--- /dev/null
+++ b/package/racehound/racehound.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# racehound
+#
+################################################################################
+
+RACEHOUND_VERSION = adbf840a40adda77318b376da913ba3288ef9c7a
+RACEHOUND_SITE = $(call github,winnukem,racehound,$(RACEHOUND_VERSION))
+RACEHOUND_LICENSE = GPLv2
+RACEHOUND_LICENSE_FILES = LICENSE
+RACEHOUND_SUPPORTS_IN_SOURCE_BUILD = NO
+
+RACEHOUND_DEPENDENCIES = elfutils linux
+
+RACEHOUND_CONF_OPTS += \
+	-DKERNEL_VERSION_OK=YES \
+	-DMODULE_BUILD_SUPPORTED=YES \
+	-DKERNEL_CONFIG_OK=YES \
+	-DKBUILD_BUILD_DIR=$(LINUX_DIR)
+
+$(eval $(cmake-package))
-- 
2.1.4
