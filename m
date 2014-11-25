From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Nov 2014 11:34:12 +0100
Subject: [Buildroot] [git commit] libshairplay: needs avahi with libdnssd
	compat option at runtime
Message-ID: <20141125103602.6D9087FEF3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ec3730cbf86a1a737413f45beb6e0a8523e3196d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libshairplay uses dlopen to open libdnssd at runtime (unless dlopen() isn't
available, then static linking is used - But avahi depends on
!BR2_PREFER_STATIC_LIB so that isn't possible), so ensure avahi is available.

Fixes http://autobuild.buildroot.net/results/54d/54de48b23439cef4cbea3b8a65b20e2a8b049f67/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libshairplay/Config.in |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/libshairplay/Config.in b/package/libshairplay/Config.in
index bcdad3f..92955ee 100644
--- a/package/libshairplay/Config.in
+++ b/package/libshairplay/Config.in
@@ -2,11 +2,17 @@ config BR2_PACKAGE_LIBSHAIRPLAY
 	bool "libshairplay"
 	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # avahi
+	depends on !BR2_PREFER_STATIC_LIB # avahi
+	select BR2_PACKAGE_AVAHI
+	select BR2_PACKAGE_AVAHI_DAEMON
+	select BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY # runtime
 	help
 	  libshairplay is a client library that emulates an airplay
 	  server.
 
 	  https://github.com/juhovh/shairplay
 
-comment "libshairplay needs a toolchain w/ IPv6, threads"
-	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
+comment "libshairplay needs a toolchain w/ IPv6, threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
