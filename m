From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Oct 2015 11:03:39 +0200
Subject: [Buildroot] [git commit] dbus-cpp: not available on musl
Message-ID: <20151006090350.A58587FC37@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=169cbc0c5615beac135e08a3263feb407edb169c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/9b2/9b29ff3aac5cd543dbe2a1a632b61e27ca25085e/
http://autobuild.buildroot.net/results/304/3041ed6d7ff648f805cf2e29762e2b57cd0540e4/

musl doesn't provide the initializer for recursive pthread mutexes.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dbus-cpp/Config.in |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/dbus-cpp/Config.in b/package/dbus-cpp/Config.in
index f631ece..8e9ed66 100644
--- a/package/dbus-cpp/Config.in
+++ b/package/dbus-cpp/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_DBUS_CPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
 	depends on BR2_USE_MMU # dbus
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_TOOLCHAIN_USES_MUSL # no PTHREAD_RECURSIVE_MUTEX_*
 	select BR2_PACKAGE_EXPAT
 	help
 	  dbus-c++ attempts to provide a C++ API for D-BUS.
@@ -12,7 +13,8 @@ config BR2_PACKAGE_DBUS_CPP
 
 	  http://sourceforge.net/projects/dbus-cplusplus/
 
-comment "dbus-c++ needs a toolchain w/ C++, threads"
+comment "dbus-c++ needs a uClibc or (e)glibc toolchain w/ C++, threads"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_DBUS
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| BR2_TOOLCHAIN_USES_MUSL
