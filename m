From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Apr 2015 00:05:38 +0200
Subject: [Buildroot] [git commit] package/powertop: depends on c++
Message-ID: <20150401220606.C13C5800C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a5a96576fae05bd5b0076112f79aefc9d401efb2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes configure error due to missing c++

checking for library containing pthread_create... no
configure: error: libpthread is required but was not found

Quote from config.log:

configure:21552: checking for library containing pthread_create
configure:21583: false -o conftest    -Os    conftest.cpp -lintl  >&5
[...]
ac_cv_env_CXX_set=set
ac_cv_env_CXX_value=false

using this defconfig

BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_PACKAGE_POWERTOP=y

Please note the number of .cpp files belonging to powertop

output/build/powertop-2.7$ find -iname *.cpp | wc -l
59

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/powertop/Config.in |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/powertop/Config.in b/package/powertop/Config.in
index 5ba83b3..a532302 100644
--- a/package/powertop/Config.in
+++ b/package/powertop/Config.in
@@ -1,9 +1,8 @@
 config BR2_PACKAGE_POWERTOP
 	bool "powertop"
-	# pciutils dependency
-	depends on !BR2_bfin
-	# libnl dependency
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_bfin # pciutils
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_PCIUTILS
@@ -14,6 +13,7 @@ config BR2_PACKAGE_POWERTOP
 
 	  https://01.org/powertop/
 
-comment "powertop needs a toolchain w/ threads, wchar"
+comment "powertop needs a toolchain w/ C++, threads, wchar"
 	depends on !BR2_bfin
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_USE_WCHAR
