From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 27 Jun 2013 19:04:56 +0200
Subject: [Buildroot] [git commit] libbsd: needs threads
Message-ID: <20130627174330.1E4F49AF55@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4788dddc39a12b6064ee6e1dfd0a999e5c981f83
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/397/39728c5eeb6c4e213cd96cb6639bc28f337bf214/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libbsd/Config.in  |    5 +++++
 package/libedit/Config.in |    5 +++++
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/package/libbsd/Config.in b/package/libbsd/Config.in
index 915a4bd..1fa9497 100644
--- a/package/libbsd/Config.in
+++ b/package/libbsd/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_LIBBSD
 	# libbsd requires a.out.h, which is only available for those
 	# architectures: arm, m68k, x86 (and alpha, but we don't care.)
 	depends on ( BR2_arm || BR2_armeb || BR2_m68k || BR2_i386 || BR2_x86_64 )
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  This library provides useful functions commonly found on BSD
 	  systems, and lacking on others like GNU systems, thus making
@@ -11,3 +12,7 @@ config BR2_PACKAGE_LIBBSD
 	  project.
 
 	  http://libbsd.freedesktop.org/
+
+comment "libbsd requires a toolchain with thread support"
+	depends on ( BR2_arm || BR2_armeb || BR2_m68k || BR2_i386 || BR2_x86_64 )
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libedit/Config.in b/package/libedit/Config.in
index 34160f4..7a515db 100644
--- a/package/libedit/Config.in
+++ b/package/libedit/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBEDIT
 	bool "libedit"
 	depends on ( BR2_arm || BR2_armeb || BR2_m68k || BR2_i386 || BR2_x86_64 )  # libbsd
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libbsd
 	select BR2_PACKAGE_LIBBSD
 	select BR2_PACKAGE_NCURSES
 	help
@@ -8,3 +9,7 @@ config BR2_PACKAGE_LIBEDIT
 	  and history functions. It slightly resembles GNU readline.
 
 	  http://ftp.netbsd.org/pub/NetBSD/NetBSD-release-5-0/src/lib/libedit/
+
+comment "libedit requires a toolchain with thread support"
+	depends on ( BR2_arm || BR2_armeb || BR2_m68k || BR2_i386 || BR2_x86_64 ) # libbsd
+	depends on !BR2_TOOLCHAIN_HAS_THREADS # libbsd
