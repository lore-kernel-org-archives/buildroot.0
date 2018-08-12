From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Aug 2018 14:31:27 +0200
Subject: [Buildroot] [git commit] ncmpc: fix build with some old toolchains
Message-ID: <20180812122445.342ED8B911@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=21f0507cc193469b8ba7fccc3fc07a2bbd12784b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With some "old" toolchains (glibc, uclibc in version 4.9.4, 5.3, 5.4,
5.5 ...), the following error is raised by the compiler:

../src/screen.cxx:60:29:   required from here
/usr/lfs/v0/rc-buildroot-test/scripts/instance-1/output/host/opt/ext-toolchain/mips-linux-gnu/include/c++/5.3.0/ext/new_allocator.h:120:4:
error: no matching function for call to 'std::pair<const screen_functions* const, std::unique_ptr<Page> >::pair(const screen_functions*, Page*)'

[...]

/usr/lfs/v0/rc-buildroot-test/scripts/instance-1/output/host/opt/ext-toolchain/mips-linux-gnu/include/c++/5.3.0/bits/stl_pair.h:112:26:
note: candidate: constexpr std::pair<_T1, _T2>::pair(const _T1&, const _T2&) [with _T1 = const screen_functions* const; _T2 = std::unique_ptr<Page>]
       _GLIBCXX_CONSTEXPR pair(const _T1& __a, const _T2& __b)
                          ^
/usr/lfs/v0/rc-buildroot-test/scripts/instance-1/output/host/opt/ext-toolchain/mips-linux-gnu/include/c++/5.3.0/bits/stl_pair.h:112:26:
note:   no known conversion for argument 2 from 'Page*' to 'const std::unique_ptr<Page>&'

This is due to the fact that init function of screen_functions
structure returns Page* but PageMap wants a std::unique_ptr<Page>

To fix this, cast raw pointer into a unique_ptr with an explicit cast

Fixes:
 - http://autobuild.buildroot.net/results/d8a7339d8bdd5cdc6bd1716585d4bcf15a2e8015

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...unique_ptr-error-with-some-old-toolchains.patch | 54 ++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/package/ncmpc/0001-Fix-unique_ptr-error-with-some-old-toolchains.patch b/package/ncmpc/0001-Fix-unique_ptr-error-with-some-old-toolchains.patch
new file mode 100644
index 0000000000..47905d71d7
--- /dev/null
+++ b/package/ncmpc/0001-Fix-unique_ptr-error-with-some-old-toolchains.patch
@@ -0,0 +1,54 @@
+From 63c0c47106007f7b2a791e3e4b062a5424d3dfe8 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 12 Aug 2018 09:02:50 +0200
+Subject: [PATCH] Fix unique_ptr error with some old toolchains
+
+With some "old" toolchains (glibc, uclibc in version 4.9.4, 5.3, 5.4,
+5.5 ...), the following error is raised by the compiler:
+
+../src/screen.cxx:60:29:   required from here
+/usr/lfs/v0/rc-buildroot-test/scripts/instance-1/output/host/opt/ext-toolchain/mips-linux-gnu/include/c++/5.3.0/ext/new_allocator.h:120:4:
+error: no matching function for call to 'std::pair<const screen_functions* const, std::unique_ptr<Page> >::pair(const screen_functions*, Page*)'
+
+[...]
+
+/usr/lfs/v0/rc-buildroot-test/scripts/instance-1/output/host/opt/ext-toolchain/mips-linux-gnu/include/c++/5.3.0/bits/stl_pair.h:112:26:
+note: candidate: constexpr std::pair<_T1, _T2>::pair(const _T1&, const _T2&) [with _T1 = const screen_functions* const; _T2 = std::unique_ptr<Page>]
+       _GLIBCXX_CONSTEXPR pair(const _T1& __a, const _T2& __b)
+                          ^
+/usr/lfs/v0/rc-buildroot-test/scripts/instance-1/output/host/opt/ext-toolchain/mips-linux-gnu/include/c++/5.3.0/bits/stl_pair.h:112:26:
+note:   no known conversion for argument 2 from 'Page*' to 'const
+std::unique_ptr<Page>&'
+
+This is due to the fact that init function of screen_functions
+structure returns Page* but PageMap wants a std::unique_ptr<Page>
+
+To fix this, cast raw pointer into a unique_ptr with an explicit cast
+
+Fixes:
+ - http://autobuild.buildroot.net/results/d8a7339d8bdd5cdc6bd1716585d4bcf15a2e8015
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/screen.cxx | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/src/screen.cxx b/src/screen.cxx
+index dd42b25..56afd11 100644
+--- a/src/screen.cxx
++++ b/src/screen.cxx
+@@ -56,8 +56,9 @@ ScreenManager::MakePage(const struct screen_functions &sf)
+ 		return i;
+ 
+ 	auto j = pages.emplace(&sf,
+-			       sf.init(*this, main_window.w,
+-				       main_window.size));
++			       std::unique_ptr<Page>(sf.init(*this,
++							     main_window.w,
++							     main_window.size)));
+ 	assert(j.second);
+ 	return j.first;
+ }
+-- 
+2.14.1
+
