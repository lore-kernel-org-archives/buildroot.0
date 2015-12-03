From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 3 Dec 2015 21:52:05 +0100
Subject: [Buildroot] [git commit] connman: disable for sparc
Message-ID: <20151203211258.E791E80ADB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=99031f0b82f3627762167923a187e9c5f7489128
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/333/3336df777c758cba9a660a0f6f31646258baec52/
http://autobuild.buildroot.net/results/efe/efeb197654b552ad9a80e102226c3e507640f037/

Connman uses __sync_fetch_and_add, which is not available for sparc.

[Peter: add !sparc dependency to comment, add autobuild reference]
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/connman/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/connman/Config.in b/package/connman/Config.in
index ba238af..5ca38bf 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_CONNMAN
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
 	depends on BR2_USE_MMU # dbus, libglib2
 	depends on !BR2_STATIC_LIBS # needs dlopen()
+	depends on !BR2_sparc # needs atomic operation __sync_fetch_and_add
 	help
 	  The Connection Manager (ConnMan) project provides a daemon
 	  for managing internet connections within embedded devices
@@ -66,4 +67,5 @@ endif # BR2_PACKAGE_CONNMAN
 
 comment "connman needs a toolchain w/ wchar, threads, resolver, dynamic library"
 	depends on BR2_USE_MMU
+	depends on !BR2_sparc
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
