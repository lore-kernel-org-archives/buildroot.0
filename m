From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  9 Mar 2019 12:31:26 +0100
Subject: [Buildroot] [PATCH 1/2] package/ncmpc: remove first patch
Message-ID: <20190309113127.24045-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch has been rejected by upstream however the issue has been
fixed by a different approach since version 0.31 and
https://github.com/MusicPlayerDaemon/ncmpc/commit/029523c8a2472e45213e50c1e3eb414245dd9d57

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...e_ptr-error-with-some-old-toolchains.patch | 54 -------------------
 ...ild-add-atomic-dependency-for-sparc.patch} |  0
 2 files changed, 54 deletions(-)
 delete mode 100644 package/ncmpc/0001-Fix-unique_ptr-error-with-some-old-toolchains.patch
 rename package/ncmpc/{0002-meson.build-add-atomic-dependency-for-sparc.patch => 0001-meson.build-add-atomic-dependency-for-sparc.patch} (100%)

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
diff --git a/package/ncmpc/0002-meson.build-add-atomic-dependency-for-sparc.patch b/package/ncmpc/0001-meson.build-add-atomic-dependency-for-sparc.patch
similarity index 100%
rename from package/ncmpc/0002-meson.build-add-atomic-dependency-for-sparc.patch
rename to package/ncmpc/0001-meson.build-add-atomic-dependency-for-sparc.patch
-- 
2.20.1
