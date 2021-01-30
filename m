From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 30 Jan 2021 12:26:47 +0100
Subject: [Buildroot] [PATCH 2/2] package/mpd: fix build of GenParseName
In-Reply-To: <20210130112647.1835553-1-fontaine.fabrice@gmail.com>
References: <20210130112647.1835553-1-fontaine.fabrice@gmail.com>
Message-ID: <20210130112647.1835553-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix build of GenParseName which has been added in version 0.22:
https://github.com/MusicPlayerDaemon/MPD/commit/fa45a8adfa44f6bc815ae7428770112c15c76d73

Fixes:
 - http://autobuild.buildroot.org/results/871e1362c44e5b68a149e6a5dd3caf99ea0d904a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-src-tag-meson.build-link-with-lstdc.patch | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/mpd/0002-src-tag-meson.build-link-with-lstdc.patch

diff --git a/package/mpd/0002-src-tag-meson.build-link-with-lstdc.patch b/package/mpd/0002-src-tag-meson.build-link-with-lstdc.patch
new file mode 100644
index 0000000000..1a8bf42be9
--- /dev/null
+++ b/package/mpd/0002-src-tag-meson.build-link-with-lstdc.patch
@@ -0,0 +1,37 @@
+From cbe479fa76809af16efff7b699952403f306e3c8 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 30 Jan 2021 12:12:46 +0100
+Subject: [PATCH] src/tag/meson.build: link with -lstdc++
+
+Link with -lstdc++ when building GenParseName to avoid the following
+build failure:
+
+FAILED: src/tag/GenParseName
+/usr/bin/gcc  -o src/tag/GenParseName src/tag/GenParseName.p/GenParseName.cxx.o src/tag/GenParseName.p/Names.c.o -Wl,--as-needed -Wl,--no-undefined -Wl,-O1
+/usr/bin/ld: src/tag/GenParseName.p/GenParseName.cxx.o: in function `std::_Rb_tree<std::basic_string_view<char, std::char_traits<char> >, std::pair<std::basic_string_view<char, std::char_traits<char> > const, TagType>, std::_Select1st<std::pair<std::basic_string_view<char, std::char_traits<char> > const, TagType> >, std::less<std::basic_string_view<char, std::char_traits<char> > >, std::allocator<std::pair<std::basic_string_view<char, std::char_traits<char> > const, TagType> > >::_M_erase(std::_Rb_tree_node<std::pair<std::basic_string_view<char, std::char_traits<char> > const, TagType> >*)':
+GenParseName.cxx:
+(.text._ZNSt8_Rb_treeISt17basic_string_viewIcSt11char_traitsIcEESt4pairIKS3_7TagTypeESt10_Select1stIS7_ESt4lessIS3_ESaIS7_EE8_M_eraseEPSt13_Rb_tree_nodeIS7_E[_ZNSt8_Rb_treeISt17basic_string_viewIcSt11char_traitsIcEESt4pairIKS3_7TagTypeESt10_Select1stIS7_ESt4lessIS3_ESaIS7_EE8_M_eraseEPSt13_Rb_tree_nodeIS7_E]+0x23): undefined reference to `operator delete(void*)'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/871e1362c44e5b68a149e6a5dd3caf99ea0d904a
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/tag/meson.build | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/tag/meson.build b/src/tag/meson.build
+index 064eada18..a98c8983c 100644
+--- a/src/tag/meson.build
++++ b/src/tag/meson.build
+@@ -3,6 +3,7 @@ generate_parse_name = executable(
+   'GenParseName.cxx',
+   'Names.c',
+   native: true,
++  link_args: '-lstdc++'
+ )
+ 
+ parse_name_cxx = custom_target(
+-- 
+2.29.2
+
-- 
2.29.2
