From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 27 Mar 2015 17:01:37 +0100
Subject: [Buildroot] [PATCH 2/2] package/powertop: depends on c++
In-Reply-To: <1427472097-30708-1-git-send-email-bernd.kuhls@t-online.de>
References: <1427472097-30708-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1427472097-30708-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 package/powertop/Config.in |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/powertop/Config.in b/package/powertop/Config.in
index cee78e5..398764e 100644
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
 	depends on BR2_USE_WCHAR # ncurses
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_NCURSES_WCHAR
@@ -15,6 +14,7 @@ config BR2_PACKAGE_POWERTOP
 
 	  https://01.org/powertop/
 
-comment "powertop needs a toolchain w/ threads, wchar"
+comment "powertop needs a toolchain w/ C++, threads, wchar"
 	depends on !BR2_bfin
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_USE_WCHAR
-- 
1.7.10.4
