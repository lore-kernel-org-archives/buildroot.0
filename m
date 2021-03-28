From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Mar 2021 22:56:30 +0200
Subject: [Buildroot] [git commit] Revert "package/mpd: fix build of
 GenParseName"
Message-ID: <20210328203147.371118A4EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7205247aaee3bb4593f125bd3bce0dfa2bb0e3fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 9783c04aaf5e4fc94099772f1dc699a974ee6538.

This commit is actually a workaround to get Meson passing `-libstdc++`
to the C linker. The correct fix is to pass the host C++ compiler to
Meson instead of the host C compiler using the `CXX_FOR_BUILD` variable.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-tag-meson.build-fix-GenParseName-linking.patch | 38 ----------------------
 1 file changed, 38 deletions(-)

diff --git a/package/mpd/0002-src-tag-meson.build-fix-GenParseName-linking.patch b/package/mpd/0002-src-tag-meson.build-fix-GenParseName-linking.patch
deleted file mode 100644
index e120b3e4ea..0000000000
--- a/package/mpd/0002-src-tag-meson.build-fix-GenParseName-linking.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 4c37d0b316a15213381bd7e07c5dee7526471fc8 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 1 Feb 2021 08:10:45 +0100
-Subject: [PATCH] src/tag/meson.build: fix GenParseName linking
-
-Set link_language to cpp for GenParseName to avoid the following build
-failure due to gcc being used to link a C and C++ source file:
-
-FAILED: src/tag/GenParseName
-/usr/bin/gcc  -o src/tag/GenParseName src/tag/GenParseName.p/GenParseName.cxx.o src/tag/GenParseName.p/Names.c.o -Wl,--as-needed -Wl,--no-undefined -Wl,-O1
-/usr/bin/ld: src/tag/GenParseName.p/GenParseName.cxx.o: in function `std::_Rb_tree<std::basic_string_view<char, std::char_traits<char> >, std::pair<std::basic_string_view<char, std::char_traits<char> > const, TagType>, std::_Select1st<std::pair<std::basic_string_view<char, std::char_traits<char> > const, TagType> >, std::less<std::basic_string_view<char, std::char_traits<char> > >, std::allocator<std::pair<std::basic_string_view<char, std::char_traits<char> > const, TagType> > >::_M_erase(std::_Rb_tree_node<std::pair<std::basic_string_view<char, std::char_traits<char> > const, TagType> >*)':
-GenParseName.cxx:
-(.text._ZNSt8_Rb_treeISt17basic_string_viewIcSt11char_traitsIcEESt4pairIKS3_7TagTypeESt10_Select1stIS7_ESt4lessIS3_ESaIS7_EE8_M_eraseEPSt13_Rb_tree_nodeIS7_E[_ZNSt8_Rb_treeISt17basic_string_viewIcSt11char_traitsIcEESt4pairIKS3_7TagTypeESt10_Select1stIS7_ESt4lessIS3_ESaIS7_EE8_M_eraseEPSt13_Rb_tree_nodeIS7_E]+0x23): undefined reference to `operator delete(void*)'
-
-Fixes:
- - http://autobuild.buildroot.org/results/871e1362c44e5b68a149e6a5dd3caf99ea0d904a
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/MusicPlayerDaemon/MPD/pull/1068]
----
- src/tag/meson.build | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/tag/meson.build b/src/tag/meson.build
-index 064eada18..4fda35e52 100644
---- a/src/tag/meson.build
-+++ b/src/tag/meson.build
-@@ -2,6 +2,7 @@ generate_parse_name = executable(
-   'GenParseName',
-   'GenParseName.cxx',
-   'Names.c',
-+  link_language: 'cpp',
-   native: true,
- )
- 
--- 
-2.29.2
-
