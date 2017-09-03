From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  3 Sep 2017 19:21:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/waylandpp: new package
Message-ID: <20170903172130.31822-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed for Wayland support in the next Kodi release 18-Leia:

https://kodi.tv/article/gsoc-2017-update-wayland-support
https://forum.kodi.tv/showthread.php?tid=309254

Build-tested using latest Kodi master branch:

$ output/host/bin/x86_64-buildroot-linux-uclibc-readelf -a \
  output/target/usr/lib/kodi/kodi.bin | grep NEEDED | sort | \
  grep wayland
 0x0000000000000001 (NEEDED)             Shared library: [libwayland-client++.so.0]
 0x0000000000000001 (NEEDED)             Shared library: [libwayland-cursor++.so.0]
 0x0000000000000001 (NEEDED)             Shared library: [libwayland-egl++.so.0]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
Tested with test-pkg using this defconfig:

BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_WAYLANDPP=y

                armv5-ctng-linux-gnueabi [ 1/47]: SKIPPED
              armv7-ctng-linux-gnueabihf [ 2/47]: SKIPPED
                        br-aarch64-glibc [ 3/47]: OK
                           br-arcle-hs38 [ 4/47]: OK
                            br-arm-basic [ 5/47]: SKIPPED
                  br-arm-cortex-a9-glibc [ 6/47]: OK
                   br-arm-cortex-a9-musl [ 7/47]: OK
                   br-arm-cortex-m4-full [ 8/47]: SKIPPED
                             br-arm-full [ 9/47]: OK
                    br-arm-full-nothread [10/47]: SKIPPED
                      br-arm-full-static [11/47]: SKIPPED
                            br-bfin-full [12/47]: SKIPPED
                   br-i386-pentium4-full [13/47]: OK
                br-i386-pentium-mmx-musl [14/47]: OK
                       br-m68k-5208-full [15/47]: SKIPPED
                      br-m68k-68040-full [16/47]: SKIPPED
                    br-microblazeel-full [17/47]: SKIPPED
                 br-mips32r6-el-hf-glibc [18/47]: OK
                      br-mips64-n64-full [19/47]: OK
                 br-mips64r6-el-hf-glibc [20/47]: OK
                      br-mipsel-o32-full [21/47]: OK
                          br-nios2-glibc [22/47]: OK
                      br-openrisc-uclibc [23/47]: SKIPPED
               br-powerpc-603e-basic-cpp [24/47]: SKIPPED
             br-powerpc64le-power8-glibc [25/47]: OK
               br-powerpc64-power7-glibc [26/47]: OK
                  br-powerpc-e500mc-full [27/47]: OK
                             br-sh4-full [28/47]: OK
                        br-sparc64-glibc [29/47]: OK
                         br-sparc-uclibc [30/47]: SKIPPED
                    br-x86-64-core2-full [31/47]: OK
                          br-x86-64-musl [32/47]: OK
                          br-xtensa-full [33/47]: OK
                     i686-ctng-linux-gnu [34/47]: SKIPPED
                          linaro-aarch64 [35/47]: OK
                              linaro-arm [36/47]: OK
             mips64el-ctng_n32-linux-gnu [37/47]: SKIPPED
             mips64el-ctng_n64-linux-gnu [38/47]: SKIPPED
        powerpc-ctng_e500v2-linux-gnuspe [39/47]: SKIPPED
                     sourcery-arm-armv4t [40/47]: SKIPPED
                            sourcery-arm [41/47]: SKIPPED
                     sourcery-arm-thumb2 [42/47]: SKIPPED
                         sourcery-mips64 [43/47]: OK
                           sourcery-mips [44/47]: OK
                          sourcery-nios2 [45/47]: OK
                         sourcery-x86-64 [46/47]: OK
           x86_64-ctng_locales-linux-gnu [47/47]: SKIPPED
47 builds, 21 skipped, 0 build failed, 0 legal-info failed

 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/waylandpp/Config.in      | 13 ++++++++++
 package/waylandpp/waylandpp.hash |  2 ++
 package/waylandpp/waylandpp.mk   | 56 ++++++++++++++++++++++++++++++++++++++++
 5 files changed, 73 insertions(+)
 create mode 100644 package/waylandpp/Config.in
 create mode 100644 package/waylandpp/waylandpp.hash
 create mode 100644 package/waylandpp/waylandpp.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index cc9c1eeca..279138346 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -311,6 +311,7 @@ F:	package/vdr/
 F:	package/vdr-plugin-vnsiserver/
 F:	package/vlc/
 F:	package/vnstat/
+F:	package/waylandpp/
 F:	package/x11r7/
 F:	package/x264/
 F:	package/x265/
diff --git a/package/Config.in b/package/Config.in
index 1aba24853..4e8d5df85 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1118,6 +1118,7 @@ menu "Graphics"
 	source "package/powervr/Config.in"
 	source "package/tiff/Config.in"
 	source "package/wayland/Config.in"
+	source "package/waylandpp/Config.in"
 	source "package/wayland-protocols/Config.in"
 	source "package/webkitgtk/Config.in"
 	source "package/webp/Config.in"
diff --git a/package/waylandpp/Config.in b/package/waylandpp/Config.in
new file mode 100644
index 000000000..43df81d3f
--- /dev/null
+++ b/package/waylandpp/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_WAYLANDPP
+	bool "waylandpp"
+	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	select BR2_PACKAGE_WAYLAND
+	help
+	  Wayland C++ bindings
+
+	  https://github.com/NilsBrause/waylandpp
+
+comment "waylandpp needs an OpenGL-EGL/wayland backend, gcc >= 4.9"
+	depends on !BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/waylandpp/waylandpp.hash b/package/waylandpp/waylandpp.hash
new file mode 100644
index 000000000..f2edb10a0
--- /dev/null
+++ b/package/waylandpp/waylandpp.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 fabf0b512285abea77678d9e079009569e9eb3fd98c6b851d50bc5b6c781c7d8  waylandpp-0.1.2.tar.gz
diff --git a/package/waylandpp/waylandpp.mk b/package/waylandpp/waylandpp.mk
new file mode 100644
index 000000000..7706ad628
--- /dev/null
+++ b/package/waylandpp/waylandpp.mk
@@ -0,0 +1,56 @@
+################################################################################
+#
+# waylandpp
+#
+################################################################################
+
+WAYLANDPP_VERSION = 0.1.2
+WAYLANDPP_SITE = $(call github,NilsBrause,waylandpp,$(WAYLANDPP_VERSION))
+WAYLANDPP_LICENSE = MIT, GPL-3.0+ (wayland_scanner)
+WAYLANDPP_LICENSE_FILES = LICENSE scanner/gpl-3.0.txt
+WAYLANDPP_INSTALL_STAGING = YES
+WAYLANDPP_DEPENDENCIES = libegl host-pkgconf host-scons wayland
+
+WAYLANDPP_SCONS_OPTS = \
+	-j$(PARALLEL_JOBS)
+
+WAYLANDPP_SCONS_ENV = \
+	CXX="$(HOSTCXX)" \
+	CXXFLAGS="$(HOST_CXXFLAGS)" \
+	CROSSCXX="$(TARGET_CXX)" \
+	CROSSCXXFLAGS="$(TARGET_CXXFLAGS)"
+
+# Waylandpp needs the host binary of wayland-scanner++ during build.
+# Its build is triggered due to the use of the CROSSCXX* variables.
+# Unfortunately this host binary gets installed to the target dirs
+# triggering an error when check-bin-arch is invoked.
+# To avoid having a host-waylandpp package, which needs host-wayland,
+# we move this host binary to HOST_DIR to be used by other packages...
+define WAYLANDPP_INSTALL_STAGING_CMDS
+	(cd $(@D); \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(WAYLANDPP_SCONS_ENV) \
+		ROOT="$(STAGING_DIR)" \
+		PREFIX="/usr" \
+		$(SCONS) install \
+		$(WAYLANDPP_SCONS_OPTS) \
+	)
+	rm -v "$(STAGING_DIR)/usr/lib/pkgconfig/wayland-scanner++.pc"
+	mv "$(STAGING_DIR)/usr/bin/wayland-scanner++" "$(HOST_DIR)/bin/"
+endef
+
+# ... and delete wayland-scanner++ here.
+define WAYLANDPP_INSTALL_TARGET_CMDS
+	(cd $(@D); \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(WAYLANDPP_SCONS_ENV) \
+		ROOT="$(TARGET_DIR)" \
+		PREFIX="/usr" \
+		$(SCONS) install \
+		$(WAYLANDPP_SCONS_OPTS) \
+	)
+	rm -v "$(TARGET_DIR)/usr/lib/pkgconfig/wayland-scanner++.pc" \
+		"$(TARGET_DIR)/usr/bin/wayland-scanner++"
+endef
+
+$(eval $(generic-package))
-- 
2.11.0
