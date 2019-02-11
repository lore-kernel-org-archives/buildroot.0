From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 11 Feb 2019 22:00:11 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/ncmpc: fix build on sparc
Message-ID: <20190211210011.8789-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/7ac1a07e4f72633d3ec92b79dc5d8c062490abdc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...son.build-add-atomic-dependency-for-sparc.patch | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/ncmpc/0002-meson.build-add-atomic-dependency-for-sparc.patch

diff --git a/package/ncmpc/0002-meson.build-add-atomic-dependency-for-sparc.patch b/package/ncmpc/0002-meson.build-add-atomic-dependency-for-sparc.patch
new file mode 100644
index 0000000000..59a5ee36e4
--- /dev/null
+++ b/package/ncmpc/0002-meson.build-add-atomic-dependency-for-sparc.patch
@@ -0,0 +1,43 @@
+From a0876452aff8462d923b634b13fe657fc6703b80 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 11 Feb 2019 21:42:01 +0100
+Subject: [PATCH] meson.build: add atomic dependency for sparc
+
+Linking with libatomic is needed on sparc otherwise build fails on:
+ncmpc at exe/src_Main.cxx.o: In function `std::__atomic_base<long>::operator++()':
+/home/buildroot/autobuild/instance-1/output/host/opt/ext-toolchain/sparc-buildroot-linux-uclibc/include/c++/6.4.0/bits/atomic_base.h:296: undefined reference to `__atomic_fetch_add_4'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/7ac1a07e4f72633d3ec92b79dc5d8c062490abdc
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Uptream status: https://github.com/MusicPlayerDaemon/ncmpc/pull/45]
+---
+ meson.build | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/meson.build b/meson.build
+index 2e6defc..f6c1614 100644
+--- a/meson.build
++++ b/meson.build
+@@ -174,6 +174,9 @@ else
+   pcre_dep = declare_dependency()
+ endif
+ 
++# Needed on sparc 
++atomic_dep = cc.find_library('atomic')
++
+ inc = include_directories(
+   'src',
+ 
+@@ -352,6 +355,7 @@ ncmpc = executable('ncmpc',
+   sources,
+   include_directories: inc,
+   dependencies: [
++    atomic_dep,
+     thread_dep,
+     boost_dep,
+     pcre_dep,
+-- 
+2.14.1
+
-- 
2.14.1
