From: Giacomo Longo <gabibbo97@gmail.com>
Date: Thu,  5 Nov 2020 13:19:59 +0100
Subject: [Buildroot] [PATCH v3 1/1] package/uftrace: new package
In-Reply-To: <20201103213904.0264a6c1@windsurf.home>
References: <20201103213904.0264a6c1@windsurf.home>
Message-ID: <20201105121959.656982-1-gabibbo97@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Giacomo Longo <gabibbo97@gmail.com>

---
Hopefully this message will end into the email (formatted as per BR docs
21.5.5).

Following the helpful feedback from Thomas Petazzoni,
 I have improved upon my v2 patchset and included the changelogs
 below for reference.

I have checked the patch as following:

$ ./utils/check-package ./package/uftrace/*                         
85 lines processed
0 warnings generated

$ ./utils/test-pkg -d ../test-pkg -c ../uftrace.config -p uftrace -a
... (omitted for brevity)
45 builds, 36 skipped, 0 build failed, 0 legal-info failed

The package has also been tested with a virtualized ARMv7 rootfs.

Changes v2 -> v3:
	- added explainatation on why glibc is required
	- splitted long lines in Config.in
	- hashes are now calculated with sha256 instead of sha512
	- package now leverages generic-package instead of autotools
		- the prefix is now /usr instead of /usr/local to be more in line
			with other packages
		- definitions of the build commands are placed near the bottom of
			the makefile
		- added comments above the configuration options to explain why a
			check is needed

Changes v1 -> v2:
	- added myself to DEVELOPERS
	- removed configuration options that now are used in the makefile
	- removed dependency on UTIL_LINUX that was not needed
	- BR2_INSTALL_LIBSTDCPP is now "depends on" instead of "selects"
	- comment in Config.in is now at the end of the file
	- comment now will be shown only in the correct architecture
	- makefile has been sorted:
		- common configuration is at the top
		- architecture configuration is in the middle
		- feature flags are at the bottom

Changes v1:
	- initial proposal

---
 DEVELOPERS                   |  3 ++
 package/Config.in            |  1 +
 package/uftrace/Config.in    | 28 +++++++++++++++++++
 package/uftrace/uftrace.hash |  3 ++
 package/uftrace/uftrace.mk   | 54 ++++++++++++++++++++++++++++++++++++
 5 files changed, 89 insertions(+)
 create mode 100644 package/uftrace/Config.in
 create mode 100644 package/uftrace/uftrace.hash
 create mode 100644 package/uftrace/uftrace.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 43cc1b55ae..021be57a75 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -980,6 +980,9 @@ N:	Gerome Burlats <gerome.burlats@smile.fr>
 F:	board/qemu/
 F:	configs/qemu_*
 
+N: Giacomo Longo <gabibbo97@gmail.com>
+F: package/uftrace/
+
 N:	Gilles Talis <gilles.talis@gmail.com>
 F:	board/freescale/imx8mmevk/
 F:	configs/freescale_imx8mmevk_defconfig
diff --git a/package/Config.in b/package/Config.in
index 016a99ed1a..cbe6a30fd0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -140,6 +140,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/trace-cmd/Config.in"
 	source "package/trinity/Config.in"
 	source "package/uclibc-ng-test/Config.in"
+	source "package/uftrace/Config.in"
 	source "package/valgrind/Config.in"
 	source "package/vmtouch/Config.in"
 	source "package/whetstone/Config.in"
diff --git a/package/uftrace/Config.in b/package/uftrace/Config.in
new file mode 100644
index 0000000000..1a9a974d6e
--- /dev/null
+++ b/package/uftrace/Config.in
@@ -0,0 +1,28 @@
+config BR2_PACKAGE_UFTRACE_ARCH_SUPPORTS
+	bool
+	default y if BR2_aarch64
+	default y if BR2_arm
+	default y if BR2_i386
+	default y if BR2_x86_64
+
+config BR2_PACKAGE_UFTRACE
+	bool "uftrace"
+	# elfutils is not available on musl
+	# uClibc-ng does not support the ADDR_NO_RANDOMIZE personality
+	# so only glibc is supported
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_PACKAGE_UFTRACE_ARCH_SUPPORTS
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_USE_WCHAR # elfutils
+	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils
+	select BR2_PACKAGE_ELFUTILS
+	help
+	  Tool to trace and analyze execution of a program.
+
+	  https://uftrace.github.io/slide
+
+comment "uftrace needs a glibc toolchain w/ C++, dynamic library, threads, wchar"
+	depends on BR2_PACKAGE_UFTRACE_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP || \
+	           BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
diff --git a/package/uftrace/uftrace.hash b/package/uftrace/uftrace.hash
new file mode 100644
index 0000000000..ccf79ddeb7
--- /dev/null
+++ b/package/uftrace/uftrace.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256 418d30c959d3b6d0dcafd55e588a5d414a9984b30f2522a5af004a268824a5a2 uftrace-0.9.4.tar.gz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING
diff --git a/package/uftrace/uftrace.mk b/package/uftrace/uftrace.mk
new file mode 100644
index 0000000000..266be2e65b
--- /dev/null
+++ b/package/uftrace/uftrace.mk
@@ -0,0 +1,54 @@
+################################################################################
+#
+# uftrace
+#
+################################################################################
+
+UFTRACE_VERSION = 0.9.4
+UFTRACE_SITE = $(call github,namhyung,uftrace,v$(UFTRACE_VERSION))
+UFTRACE_LICENSE = GPL-2.0+
+UFTRACE_LICENSE_FILES = COPYING
+UFTRACE_DEPENDENCIES = elfutils
+
+UFTRACE_CONF_OPTS = \
+	--without-capstone \
+	--without-libpython
+
+ifeq ($(BR2_aarch64),y)
+UFTRACE_CONF_OPTS += --arch=aarch64
+else ifeq ($(BR2_arm),y)
+UFTRACE_CONF_OPTS += --arch=arm
+else ifeq ($(BR2_i386),y)
+UFTRACE_CONF_OPTS += --arch=i386
+else ifeq ($(BR2_x86_64),y)
+UFTRACE_CONF_OPTS += --arch=x86_64
+endif
+
+# No --with-luajit option available
+ifeq ($(BR2_PACKAGE_LUAJIT),y)
+UFTRACE_DEPENDENCIES += luajit
+else
+UFTRACE_CONF_OPTS += --without-libluajit
+endif
+
+# No --with-ncurses option available
+ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
+UFTRACE_DEPENDENCIES += ncurses
+else
+UFTRACE_CONF_OPTS += --without-libncurses
+endif
+
+define UFTRACE_CONFIGURE_CMDS
+	(cd $(@D) && ./configure --cross-compile=$(TARGET_CROSS) \
+		--prefix=$(TARGET_DIR)/usr $(UFTRACE_CONF_OPTS))
+endef
+
+define UFTRACE_BUILD_CMDS
+	$(MAKE) -C $(@D)
+endef
+
+define UFTRACE_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) install
+endef
+
+$(eval $(generic-package))
-- 
2.28.0
