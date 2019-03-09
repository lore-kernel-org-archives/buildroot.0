From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 Mar 2019 21:46:02 +0100
Subject: [Buildroot] [git commit] Revert "package/ncmpc: fix build with gcc
 5"
Message-ID: <20190309204346.9E1F18E218@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4ca3f20347ad98eef9cf862538df058f8f03df88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 56c476db99b764c6a1f64a64e0295e96f8a4612f.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-src-TagListPage.cxx-fix-build-with-gcc-5.patch | 39 ----------------------
 1 file changed, 39 deletions(-)

diff --git a/package/ncmpc/0002-src-TagListPage.cxx-fix-build-with-gcc-5.patch b/package/ncmpc/0002-src-TagListPage.cxx-fix-build-with-gcc-5.patch
deleted file mode 100644
index fc166a67f4..0000000000
--- a/package/ncmpc/0002-src-TagListPage.cxx-fix-build-with-gcc-5.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From fc6120f20e3482525ffa70230b8c3d72d979178f Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 9 Mar 2019 12:26:12 +0100
-Subject: [PATCH] src/TagListPage.cxx: fix build with gcc 5
-
-Build with gcc 5 fails on:
-
-FAILED: ncmpc at exe/src_TagListPage.cxx.o
-/accts/mlweber1/rclinux/rc-buildroot-test/scripts/instance-0/output/host/bin/mips-linux-gnu-g++ -Incmpc at exe -I. -I.. -I../src -I../ -I/accts/mlweber1/rclinux/rc-buildroot-test/scripts/instance-0/output/host/usr/bin/../mips64el-buildroot-linux-gnu/sysroot/usr/include -fdiagnostics-color=always -pipe -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wnon-virtual-dtor -std=c++14 -O3 -DBOOST_NO_IOSTREAM -DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_SYSTEM_NO_DEPRECATED -Wall -Wextra -Wno-deprecated-declarations -Wshadow -Wpointer-arith -Wcast-qual -Wcast-align -Wwrite-strings -Wmissing-declarations -Wmissing-noreturn -Wmissing-format-attribute -Wredundant-decls -Wundef -Wno-non-virtual-dtor -fvisibility=hidden -ffunction-sections -fdata-sections -D_GNU_SOURCE -D_DEFAULT_SOURCE -pthread -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -MD -MQ 'ncmpc at exe/src_TagListPage.cxx.o' -MF 'ncmpc at exe/src_TagListPage.cxx.o.d' -o 'ncmpc at exe/src_TagListPage.cxx.o' -c ../src/TagListPage
 .cxx
-../src/TagListPage.cxx: In member function 'TagFilter TagListPage::MakeCursorFilter() const':
-../src/TagListPage.cxx:41:12: error: converting to 'TagFilter {aka std::forward_list<std::pair<mpd_tag_type, std::__cxx11::basic_string<char> > >}' from initializer list would use explicit constructor 'std::forward_list<_Tp, _Alloc>::forward_list(const _Alloc&) [with _Tp = std::pair<mpd_tag_type, std::__cxx11::basic_string<char> >; _Alloc = std::allocator<std::pair<mpd_tag_type, std::__cxx11::basic_string<char> > >]'
-    return {};
-
-Fix this error by returning {{}} (a list with one empty element) instead
-of {}, see:
-https://stackoverflow.com/questions/26947704/implicit-conversion-failure-from-initializer-list
-
-Fixes:
- - http://autobuild.buildroot.org/results/655eb4905c6e308d34293658acee4fc4e1fe0bbc
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/MusicPlayerDaemon/ncmpc/pull/47]
----
- src/TagListPage.cxx | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/TagListPage.cxx b/src/TagListPage.cxx
-index e197bae..c7379b4 100644
---- a/src/TagListPage.cxx
-+++ b/src/TagListPage.cxx
-@@ -38,7 +38,7 @@ TagListPage::MakeCursorFilter() const noexcept
- 	unsigned i = lw.selected;
- 	if (parent != nullptr) {
- 		if (i == 0)
--			return {};
-+			return {{}};
- 
- 		--i;
- 	}
