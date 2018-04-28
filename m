From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Apr 2018 15:12:08 +0200
Subject: [Buildroot] [git commit] abootimg: new package
Message-ID: <20180428131221.179C288F3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=43bafa748fbb5439856b9de1667db93c43ddd21f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This tool might be useful on Android devices modded with Buildroot. Indeed
it allows to modify Android Boot Image partition directly from running
rootfs and so let the user free to keep Android stuff on his device
(mainly bootloader) while testing/using Buildroot kernel/rootfs.

For example, one can modify kernel cmdline on Boot Image partition and
tell Android bootloader to launch kernel with a given rootfs fitted with BR
instead of Android's one.

Build-tested with ./utils/test-pkg -p abootimg -c config.abootimg -a
with config.abootimg containing:
BR2_USE_MMU=y
BR2_PACKAGE_ABOOTIMG=y
BR2_PACKAGE_UTIL_LINUX=y
BR2_PACKAGE_UTIL_LINUX_LIBBLKID=y

                armv5-ctng-linux-gnueabi [ 1/47]: OK
              armv7-ctng-linux-gnueabihf [ 2/47]: OK
                        br-aarch64-glibc [ 3/47]: OK
                           br-arcle-hs38 [ 4/47]: OK
                            br-arm-basic [ 5/47]: OK
                  br-arm-cortex-a9-glibc [ 6/47]: OK
                   br-arm-cortex-a9-musl [ 7/47]: OK
                   br-arm-cortex-m4-full [ 8/47]: SKIPPED
                             br-arm-full [ 9/47]: OK
                    br-arm-full-nothread [10/47]: OK
                      br-arm-full-static [11/47]: OK
                            br-bfin-full [12/47]: SKIPPED
                   br-i386-pentium4-full [13/47]: OK
                br-i386-pentium-mmx-musl [14/47]: OK
                       br-m68k-5208-full [15/47]: SKIPPED
                      br-m68k-68040-full [16/47]: OK
                    br-microblazeel-full [17/47]: OK
                 br-mips32r6-el-hf-glibc [18/47]: OK
                      br-mips64-n64-full [19/47]: OK
                 br-mips64r6-el-hf-glibc [20/47]: OK
                      br-mipsel-o32-full [21/47]: OK
                          br-nios2-glibc [22/47]: OK
                      br-openrisc-uclibc [23/47]: OK
               br-powerpc-603e-basic-cpp [24/47]: OK
             br-powerpc64le-power8-glibc [25/47]: OK
               br-powerpc64-power7-glibc [26/47]: OK
                  br-powerpc-e500mc-full [27/47]: OK
                             br-sh4-full [28/47]: OK
                        br-sparc64-glibc [29/47]: OK
                         br-sparc-uclibc [30/47]: OK
                    br-x86-64-core2-full [31/47]: OK
                          br-x86-64-musl [32/47]: OK
                          br-xtensa-full [33/47]: OK
                     i686-ctng-linux-gnu [34/47]: OK
                          linaro-aarch64 [35/47]: OK
                              linaro-arm [36/47]: OK
             mips64el-ctng_n32-linux-gnu [37/47]: OK
             mips64el-ctng_n64-linux-gnu [38/47]: OK
        powerpc-ctng_e500v2-linux-gnuspe [39/47]: OK
                     sourcery-arm-armv4t [40/47]: OK
                            sourcery-arm [41/47]: OK
                     sourcery-arm-thumb2 [42/47]: OK
                         sourcery-mips64 [43/47]: OK
                           sourcery-mips [44/47]: OK
                          sourcery-nios2 [45/47]: OK
                         sourcery-x86-64 [46/47]: OK
           x86_64-ctng_locales-linux-gnu [47/47]: OK
47 builds, 3 skipped, 0 build failed, 0 legal-info failed

Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
[Thomas: fix license.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in              |  1 +
 package/abootimg/Config.in     | 10 ++++++++++
 package/abootimg/abootimg.hash |  3 +++
 package/abootimg/abootimg.mk   | 23 +++++++++++++++++++++++
 4 files changed, 37 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 66f6d10058..08f96b68d5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -166,6 +166,7 @@ menu "Development tools"
 endmenu
 
 menu "Filesystem and flash utilities"
+	source "package/abootimg/Config.in"
 	source "package/aufs/Config.in"
 	source "package/aufs-util/Config.in"
 	source "package/autofs/Config.in"
diff --git a/package/abootimg/Config.in b/package/abootimg/Config.in
new file mode 100644
index 0000000000..30e5bd1fb0
--- /dev/null
+++ b/package/abootimg/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_ABOOTIMG
+	bool "abootimg"
+	depends on BR2_USE_MMU	# libblkid
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	help
+	  Tool to manipulate Android Boot Images, either on files
+	  or directly on /dev block devices.
+
+	  https://github.com/ggrandou/abootimg
diff --git a/package/abootimg/abootimg.hash b/package/abootimg/abootimg.hash
new file mode 100644
index 0000000000..fa5282c6c3
--- /dev/null
+++ b/package/abootimg/abootimg.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256	eb8d912bc7b5454c2afd3385fd86f4917d3587c48a6f5ae45df7856d88502cab	abootimg-7e127fee6a3981f6b0a50ce9910267cd501e09d4.tar.gz
+sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	LICENSE
diff --git a/package/abootimg/abootimg.mk b/package/abootimg/abootimg.mk
new file mode 100644
index 0000000000..e906546948
--- /dev/null
+++ b/package/abootimg/abootimg.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# abootimg
+#
+################################################################################
+
+ABOOTIMG_VERSION = 7e127fee6a3981f6b0a50ce9910267cd501e09d4
+ABOOTIMG_SITE = $(call github,ggrandou,abootimg,$(ABOOTIMG_VERSION))
+ABOOTIMG_LICENSE = GPL-2.0+
+ABOOTIMG_LICENSE_FILES = LICENSE
+
+# depends on libblkid from util-linux
+ABOOTIMG_DEPENDENCIES = util-linux
+
+define ABOOTIMG_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define ABOOTIMG_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 $(@D)/abootimg $(TARGET_DIR)/usr/bin/abootimg
+endef
+
+$(eval $(generic-package))
