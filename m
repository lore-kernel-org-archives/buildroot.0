From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 10 Nov 2014 14:12:34 +0100
Subject: [Buildroot] [git commit] connman: disable for static builds
Message-ID: <20141110131448.C700FB3F46@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8fc293d8213593996936330ab51ba6b39fd0066e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It needs dlopen(), otherwise it will fail at the configure phase with a
message like this one:

checking for dlopen in -ldl... no
configure: error: dynamic linking loader is required

Fixes:
  http://autobuild.buildroot.net/results/647/64742a1d3a07f86a7c801da5ef30892c1f760031/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/connman/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/connman/Config.in b/package/connman/Config.in
index 8803aeb..63d50b4 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_CONNMAN
 	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
 	depends on BR2_USE_MMU # dbus, libglib2
+	depends on !BR2_PREFER_STATIC_LIB # needs dlopen()
 	help
 	  The Connection Manager (ConnMan) project provides a daemon
 	  for managing internet connections within embedded devices
@@ -65,6 +66,6 @@ config BR2_PACKAGE_CONNMAN_CLIENT
 
 endif # BR2_PACKAGE_CONNMAN
 
-comment "connman needs a toolchain w/ IPv6, wchar, threads, resolver"
+comment "connman needs a toolchain w/ IPv6, wchar, threads, resolver, dynamic library"
 	depends on BR2_USE_MMU && !BR2_avr32
-	depends on !BR2_USE_WCHAR || !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
