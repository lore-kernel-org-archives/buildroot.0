From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Apr 2020 20:33:36 +0200
Subject: [Buildroot] [git commit] package/systemd: make sure init choice and
 package have same dependencies
Message-ID: <20200405182013.E11BB8B8C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b57632683b20869279bbe957cf69a5d2a7f1052a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, the dependencies for the init system choice, and the
dependencies for the package, are slightly different, and not in the
same order, the latter making it difficult to assess consistency between
the two.

Fix all that, by cross-duplicating dependencies from the init choice and
the package, and order the dependencies according to the manual (arch
first, toolchain, then the others).

Note that some dependencies are redundant, but kept nonetheless for
correctness:

  - BR2_USE_MMU is implied by BR2_TOOLCHAIN_USES_GLIBC, but systemd does
    use fork();

  - !BR2_STATIC_LIBS is also implied by BR2_TOOLCHAIN_USES_GLIBC, but it
    is also inherited from kmod which we select;

  - BR2_TOOLCHAIN_HAS_THREADS is also implied by BR2_TOOLCHAIN_USES_GLIBC,
    but systemd does use pthread_*() functions.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/systemd/Config.in | 7 +++++--
 system/Config.in          | 5 +++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 4afe694413..8a3149ee5e 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -16,9 +16,12 @@ config BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
 menuconfig BR2_PACKAGE_SYSTEMD
 	bool "systemd"
 	depends on BR2_INIT_SYSTEMD
+	depends on BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
+	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS # kmod
-	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
-	depends on BR2_USE_MMU # dbus
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_TOOLCHAIN_HAS_SSP
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	depends on BR2_HOST_GCC_AT_LEAST_5 # host-systemd
 	select BR2_PACKAGE_HAS_UDEV
diff --git a/system/Config.in b/system/Config.in
index cdf9df61a7..5063797976 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -116,10 +116,11 @@ comment "openrc needs a toolchain w/ dynamic library"
 config BR2_INIT_SYSTEMD
 	bool "systemd"
 	depends on BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_USES_GLIBC
-	depends on BR2_TOOLCHAIN_HAS_SSP
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_TOOLCHAIN_HAS_SSP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	depends on BR2_HOST_GCC_AT_LEAST_5
