From: Romain Naour <romain.naour@gmail.com>
Date: Sun,  5 Apr 2020 00:02:17 +0200
Subject: [Buildroot] [PATCH 2/2] package/systemd: add gcc >= 5.x dependency
In-Reply-To: <20200404220217.362122-1-romain.naour@gmail.com>
References: <20200404220217.362122-1-romain.naour@gmail.com>
Message-ID: <20200404220217.362122-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As reported on the mailing list, there is a build issue with systemd 245
when using gcc < 5.0:

http://lists.busybox.net/pipermail/buildroot/2020-April/278931.html

Build issue:
../src/shared/gpt.c:7:9: error: initializer element is not constant
         { GPT_ROOT_X86,              "root-x86"              },

When testing with a toolchain using gcc 5.4.0 and the build is ok.
http://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi--glibc--stable-2017.05-toolchains-1-1.tar.bz2

While searching for "error: initializer element is not constant" message, we
can notice a note about gcc 5 change about "Initializing statics with compound
literals":

https://gcc.gnu.org/gcc-5/porting_to.html

Add a dependency on gcc 5 to avoid using to old compiler.

There is the same issue with host-systemd with host gcc 4.9
(tested with Debian Jessie). So, add a dependency on host gcc >= 5.x.

Fixes:
http://autobuild.buildroot.org/results/520/520dab2253f4cbe408a8177a6587dcb38c6ba215
http://autobuild.buildroot.org/results/e0e/e0e0512de822864d670b5d176798a24ab09eed2d
http://autobuild.buildroot.org/results/f56/f5660b2711627fcee4086e096e4ec4d9ba190ab6

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Adam Duskett <aduskett@gmail.com>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/systemd/Config.in      | 2 ++
 package/systemd/Config.in.host | 1 +
 system/Config.in               | 6 ++++--
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index bd638477a0..4afe694413 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -19,6 +19,8 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	depends on !BR2_STATIC_LIBS # kmod
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
 	depends on BR2_USE_MMU # dbus
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
+	depends on BR2_HOST_GCC_AT_LEAST_5 # host-systemd
 	select BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_DBUS # runtime dependency only
 	select BR2_PACKAGE_LIBCAP
diff --git a/package/systemd/Config.in.host b/package/systemd/Config.in.host
index 219f24239e..8e00bcf5c1 100644
--- a/package/systemd/Config.in.host
+++ b/package/systemd/Config.in.host
@@ -1,3 +1,4 @@
 # Select this if you need host systemd tools (e.g. systemctl)
 config BR2_PACKAGE_HOST_SYSTEMD
 	bool
+	depends on BR2_HOST_GCC_AT_LEAST_5
diff --git a/system/Config.in b/system/Config.in
index c8c5be40e0..25ead1489e 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -121,15 +121,17 @@ config BR2_INIT_SYSTEMD
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	select BR2_ROOTFS_MERGED_USR
 	select BR2_PACKAGE_SYSTEMD
 
-comment "systemd needs a glibc toolchain w/ SSP, headers >= 3.10"
+comment "systemd needs a glibc toolchain w/ SSP, headers >= 3.10, gcc >= 5"
 	depends on BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
 		!BR2_TOOLCHAIN_HAS_SSP || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
 
 config BR2_INIT_NONE
 	bool "None"
-- 
2.25.1
