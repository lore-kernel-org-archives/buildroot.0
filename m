From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Oct 2014 18:50:43 +0100
Subject: [Buildroot] [git commit] bluez5_utils: not for static builds
Message-ID: <20141028175051.1FFD1B1C51@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ac7903ee467a89e5cb9982f696bc9d6fd7c80620
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable for static builds, it uses dlfcn. Fixes:
http://autobuild.buildroot.net/results/7cd/7cd87c9e9b8b41ee01413050e554b5422d207e70/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bluez5_utils/Config.in |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
index ec1352f..a374f92 100644
--- a/package/bluez5_utils/Config.in
+++ b/package/bluez5_utils/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_BLUEZ5_UTILS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
 	depends on BR2_USE_MMU # dbus
 	depends on BR2_INET_IPV6
+	depends on !BR2_PREFER_STATIC_LIB # uses dlfcn
 	depends on !BR2_PACKAGE_BLUEZ_UTILS # conflicts with 4.x version
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
 	select BR2_PACKAGE_DBUS
@@ -62,9 +63,10 @@ config BR2_PACKAGE_BLUEZ5_UTILS_TEST
 
 endif
 
-comment "bluez5-utils needs a toolchain w/ wchar, threads, IPv6, headers >= 3.4"
+comment "bluez5-utils needs a toolchain w/ wchar, threads, IPv6, headers >= 3.4, dynamic library"
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_INET_IPV6 || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
+		!BR2_INET_IPV6 || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 || \
+		BR2_PREFER_STATIC_LIB
 	depends on BR2_USE_MMU
 
 comment "bluez5-utils conflicts with older bluez-utils version"
