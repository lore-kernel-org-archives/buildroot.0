From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Dec 2019 11:42:58 +0100
Subject: [Buildroot] [git commit] package/network-manager: add missing
 dependency on libglib2
Message-ID: <20191201103505.EEDA082B3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=30bf7e3f223130f3b3ce284149428f38ac4eae8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 7643ab05de860011e749aa720c92d5de150bee0a
("package/network-manager: drop obsolete dependencies") was a bit too
brutal in its dependency removal, as it forgot that removing dbus-glib
as a dependency would make libglib2 no longer part of the dependencies
of network-manager.

However, network-manager does require libglib2. From configure.ac:

PKG_CHECK_MODULES(GLIB, [gio-unix-2.0 >= 2.37.6 gmodule-2.0],
                  [AC_SUBST(LOG_DRIVER, '$(top_srcdir)/build-aux/tap-driver.sh')
                   AC_SUBST(AM_TESTS_FD_REDIRECT, '--tap')],
                  [PKG_CHECK_MODULES(GLIB, gio-unix-2.0 >= 2.40 gmodule-2.0)
                   AC_SUBST(LOG_DRIVER, '$(top_srcdir)/build-aux/test-driver')])

So this commit re-adds libglib2 as a dependency, and propagates the
appropriate "depends on". Nothing selects BR2_PACKAGE_NETWORK_MANAGER,
so we don't have to propagate these additional "depends on" anywhere.

Fixes:

  http://autobuild.buildroot.net/results/2025b1bd721bb5c5fa6638ccf389d2fd8fd10339/
  https://bugs.busybox.net/show_bug.cgi?id=12326

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Lubomir Rintel <lkundrak@v3.sk>
Cc: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/network-manager/Config.in          | 8 ++++++--
 package/network-manager/network-manager.mk | 2 +-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index 1257e08e6f..e6a3f5f04f 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -7,8 +7,11 @@ config BR2_PACKAGE_NETWORK_MANAGER
 	# Tested with 3.2, but may even work with earlier versions
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
 	depends on BR2_TOOLCHAIN_USES_GLIBC # CLOCK_BOOTTIME, IPTOS_CLASS_*
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_WCHAR # libglib2
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_GNUTLS
+	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
@@ -60,8 +63,9 @@ config BR2_PACKAGE_NETWORK_MANAGER_OVS
 
 endif
 
-comment "NetworkManager needs udev /dev management and a glibc toolchain w/ headers >= 3.2, dynamic library"
+comment "NetworkManager needs udev /dev management and a glibc toolchain w/ headers >= 3.2, dynamic library, wchar, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_PACKAGE_HAS_UDEV || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2 || \
-		!BR2_TOOLCHAIN_USES_GLIBC || BR2_STATIC_LIBS
+		!BR2_TOOLCHAIN_USES_GLIBC || BR2_STATIC_LIBS || \
+		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index e913d69927..7de2c220fe 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -9,7 +9,7 @@ NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).4
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
 NETWORK_MANAGER_INSTALL_STAGING = YES
-NETWORK_MANAGER_DEPENDENCIES = host-pkgconf udev gnutls \
+NETWORK_MANAGER_DEPENDENCIES = host-pkgconf udev gnutls libglib2 \
 	libgcrypt wireless_tools util-linux host-intltool readline libndp
 # Even though the COPYING file only contains the GPL-2.0 text, many
 # parts of network-manager are under LGPL-2.0. See the "Legal" section
