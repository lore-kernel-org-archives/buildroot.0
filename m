From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 23 Sep 2018 15:43:55 +0200
Subject: [Buildroot] [PATCH 1/1] ncmpc: depends on gcc >= 6
Message-ID: <20180923134355.25827-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Following upstream feedback on unique_ptr issue and the suggested fix
(https://github.com/MusicPlayerDaemon/ncmpc/pull/29), add a dependency
on gcc >= 6 and remove patch

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...e_ptr-error-with-some-old-toolchains.patch | 54 -------------------
 package/ncmpc/Config.in                       |  6 +--
 2 files changed, 3 insertions(+), 57 deletions(-)
 delete mode 100644 package/ncmpc/0001-Fix-unique_ptr-error-with-some-old-toolchains.patch

diff --git a/package/ncmpc/0001-Fix-unique_ptr-error-with-some-old-toolchains.patch b/package/ncmpc/0001-Fix-unique_ptr-error-with-some-old-toolchains.patch
deleted file mode 100644
index 47905d71d7..0000000000
--- a/package/ncmpc/0001-Fix-unique_ptr-error-with-some-old-toolchains.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 63c0c47106007f7b2a791e3e4b062a5424d3dfe8 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 12 Aug 2018 09:02:50 +0200
-Subject: [PATCH] Fix unique_ptr error with some old toolchains
-
-With some "old" toolchains (glibc, uclibc in version 4.9.4, 5.3, 5.4,
-5.5 ...), the following error is raised by the compiler:
-
-../src/screen.cxx:60:29:   required from here
-/usr/lfs/v0/rc-buildroot-test/scripts/instance-1/output/host/opt/ext-toolchain/mips-linux-gnu/include/c++/5.3.0/ext/new_allocator.h:120:4:
-error: no matching function for call to 'std::pair<const screen_functions* const, std::unique_ptr<Page> >::pair(const screen_functions*, Page*)'
-
-[...]
-
-/usr/lfs/v0/rc-buildroot-test/scripts/instance-1/output/host/opt/ext-toolchain/mips-linux-gnu/include/c++/5.3.0/bits/stl_pair.h:112:26:
-note: candidate: constexpr std::pair<_T1, _T2>::pair(const _T1&, const _T2&) [with _T1 = const screen_functions* const; _T2 = std::unique_ptr<Page>]
-       _GLIBCXX_CONSTEXPR pair(const _T1& __a, const _T2& __b)
-                          ^
-/usr/lfs/v0/rc-buildroot-test/scripts/instance-1/output/host/opt/ext-toolchain/mips-linux-gnu/include/c++/5.3.0/bits/stl_pair.h:112:26:
-note:   no known conversion for argument 2 from 'Page*' to 'const
-std::unique_ptr<Page>&'
-
-This is due to the fact that init function of screen_functions
-structure returns Page* but PageMap wants a std::unique_ptr<Page>
-
-To fix this, cast raw pointer into a unique_ptr with an explicit cast
-
-Fixes:
- - http://autobuild.buildroot.net/results/d8a7339d8bdd5cdc6bd1716585d4bcf15a2e8015
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/screen.cxx | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/src/screen.cxx b/src/screen.cxx
-index dd42b25..56afd11 100644
---- a/src/screen.cxx
-+++ b/src/screen.cxx
-@@ -56,8 +56,9 @@ ScreenManager::MakePage(const struct screen_functions &sf)
- 		return i;
- 
- 	auto j = pages.emplace(&sf,
--			       sf.init(*this, main_window.w,
--				       main_window.size));
-+			       std::unique_ptr<Page>(sf.init(*this,
-+							     main_window.w,
-+							     main_window.size)));
- 	assert(j.second);
- 	return j.first;
- }
--- 
-2.14.1
-
diff --git a/package/ncmpc/Config.in b/package/ncmpc/Config.in
index d22ea368b4..c98375a2bf 100644
--- a/package/ncmpc/Config.in
+++ b/package/ncmpc/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_NCMPC
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # libglib2 -> gettext
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6 # unique_ptr
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBMPDCLIENT
 	select BR2_PACKAGE_NCURSES
@@ -15,7 +15,7 @@ config BR2_PACKAGE_NCMPC
 
 	  http://www.musicpd.org/clients/ncmpc/
 
-comment "ncmpc needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
+comment "ncmpc needs a toolchain w/ C++, wchar, threads, gcc >= 6"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_6
-- 
2.17.1
