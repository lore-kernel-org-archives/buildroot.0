From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jun 2017 14:52:18 +0200
Subject: [Buildroot] [git commit] package/exiv2: disable on musl
Message-ID: <20170605125223.856DF8295F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d887fde42540bb6079c66f72e1462bfcda402006
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Musl build is broken:

/home/buildroot/build/instance-0/output/build/exiv2-910f3507795e1930ae216c9febee0bf9a88e99c0/src/actions.cpp:2052:32:
 error: 'PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP' was not declared in this scope

According to http://www.openwall.com/lists/musl/2017/02/20/3
the define is not available on musl.

Fixes
http://autobuild.buildroot.net/results/283/28334a8a0b23c7c8260023b9a3aa15e8dd7613d0/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/exiv2/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/exiv2/Config.in b/package/exiv2/Config.in
index 7358283..acce81c 100644
--- a/package/exiv2/Config.in
+++ b/package/exiv2/Config.in
@@ -1,12 +1,14 @@
-comment "exiv2 needs a toolchain w/ C++, wchar, dynamic library, threads"
+comment "exiv2 needs a uClibc or glibc toolchain w/ C++, wchar, dynamic library, threads"
 	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+		|| !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| BR2_TOOLCHAIN_USES_MUSL
 
 config BR2_PACKAGE_EXIV2
 	bool "exiv2"
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_USES_MUSL # PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP
 	depends on BR2_USE_WCHAR
 	help
 	  Exiv2 is a C++ library and a command line utility to manage
