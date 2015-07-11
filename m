From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jul 2015 17:54:45 +0200
Subject: [Buildroot] [git commit] racehound: new package
Message-ID: <20150711155545.363DF81778@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6c395a22e762a9a6195a7bbc21685a53acdee0e0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
  - indicate in the Config.in help text that CONFIG_KPROBES
  - add missing final double quote in one of the Config.in comment
  - normalize the Config.in comment dependencies
  - bump to the latest Git version.]

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in              |    1 +
 package/racehound/Config.in    |   31 +++++++++++++++++++++++++++++++
 package/racehound/racehound.mk |   21 +++++++++++++++++++++
 3 files changed, 53 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 3fce415..714e2bd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -90,6 +90,7 @@ endif
 	source "package/pax-utils/Config.in"
 	source "package/perf/Config.in"
 	source "package/pv/Config.in"
+	source "package/racehound/Config.in"
 	source "package/ramsmp/Config.in"
 	source "package/ramspeed/Config.in"
 	source "package/rt-tests/Config.in"
diff --git a/package/racehound/Config.in b/package/racehound/Config.in
new file mode 100644
index 0000000..f0a8565
--- /dev/null
+++ b/package/racehound/Config.in
@@ -0,0 +1,31 @@
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
+	  - CONFIG_KPROBES
+
+	  https://github.com/winnukem/racehound
+
+comment "racehound needs an Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+	depends on BR2_i386 || BR2_x86_64
+
+comment "racehound needs a toolchain w/ C++, wchar, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || BR2_STATIC_LIBS
+	depends on BR2_i386 || BR2_x86_64
diff --git a/package/racehound/racehound.mk b/package/racehound/racehound.mk
new file mode 100644
index 0000000..f77e5f3
--- /dev/null
+++ b/package/racehound/racehound.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# racehound
+#
+################################################################################
+
+RACEHOUND_VERSION = f3375911019607a0cb6a15bf68fa62dadd6b790b
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
