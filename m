From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 15 Sep 2020 19:51:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/efl: needs host gcc >= 4.9
Message-ID: <20200915175139.400535-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit dbe2d2e686281c19739824d4d4faec62187d1779 forgot to add a
host gcc >= 4.9 dependency on efl (because of host-efl)

Fixes:
 - http://autobuild.buildroot.org/results/f627d44919c20e068e377d7fe113833e2d4d0ad3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/efl/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index 738bfcd010..e4e4c72161 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_EFL
 	bool "efl"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # host-efl
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # untested without threads
 	depends on BR2_USE_MMU
@@ -281,8 +282,9 @@ comment "SVG loader needs a toolchain w/ gcc >= 4.8"
 
 endif # BR2_PACKAGE_EFL
 
-comment "efl needs a toolchain w/ C++, dynamic library, gcc >= 4.9, threads, wchar"
+comment "efl needs a toolchain w/ C++, dynamic library, gcc >= 4.9, host gcc >= 4.9, threads, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
-		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+		|| !BR2_HOST_GCC_AT_LEAST_4_9 || BR2_STATIC_LIBS \
+		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
 	depends on BR2_USE_MMU
-- 
2.28.0
