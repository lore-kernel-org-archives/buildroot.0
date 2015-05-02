From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 2 May 2015 10:23:05 +0200
Subject: [Buildroot] [git commit] network-manager: needs (e)glibc
Message-ID: <20150502082317.22A878073F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=40df43ac667bf6fff9ec7072ade19cb3a311a1da
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/1cc/1ccd21cf2ae58ecac75a4cba393b7be4d2e43e5d/
http://autobuild.buildroot.net/results/718/718fc0eb28fc056ac83352547fe92313b33c3d59/
http://autobuild.buildroot.net/results/704/704bff70b73e77f552dc6b91732afefd846a1f50/
http://autobuild.buildroot.net/results/1ee/1eef17a793d151eb140d3364fbb8020e53eec10f/

And many more.

With the recent inclusion of systemd-dhcp, network-manager no longer builds
on uClibc/musl as it uses:

- CLOCK_BOOTTIME (not available in uClibc 0.9.33.2)
- IPTOS_CLASS_* (not available in uClibc/musl)
- Uses locale functionality (may not be available in uClibc)

Now, patches could be written to make these things optional, but systemd is
historically not known to be receptive of such kind of patches (and NM wants
to be able to sync with systemd with minimal effort, so is not interested in
diverging from upstream), and NM is big / has lots of dependencies so just
mark it (e)glibc-only like systemd.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/network-manager/Config.in |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index cc8f616..41cd2d4 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_NETWORK_MANAGER
 	depends on BR2_USE_MMU # dbus
 	depends on BR2_PACKAGE_HAS_UDEV
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
+	depends on BR2_TOOLCHAIN_USES_GLIBC # CLOCK_BOOTTIME, IPTOS_CLASS_*
 	select BR2_PACKAGE_DHCPCD if !BR2_PACKAGE_DHCP_CLIENT
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_DBUS_GLIB
@@ -50,7 +51,8 @@ config BR2_PACKAGE_NETWORK_MANAGER_PPPD
 	  This option enables support for PPPD daemon
 endif
 
-comment "NetworkManager needs udev /dev management and a toolchain w/ wchar, threads, headers >= 3.7"
+comment "NetworkManager needs udev /dev management and a (e)glibc toolchain w/ wchar, threads, headers >= 3.7"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
+		!BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7 || \
+		!BR2_TOOLCHAIN_USES_GLIBC
