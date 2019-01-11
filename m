From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 12 Jan 2019 00:01:58 +0100
Subject: [Buildroot] [PATCH v1] libinput: drop C++ dependency
Message-ID: <20190111230158.5283-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The meson C++ dependency is only used for a build-time header
include test, so drop both.

Fixes [1]:

  The Meson build system
  Version: 0.49.0
  Source dir: .../build/libinput-1.12.5
  Build dir: .../build/libinput-1.12.5/build
  Build type: cross build
  Project name: libinput
  Project version: 1.12.5
  Native C compiler: cc (gcc 4.8.4 "cc (Ubuntu 4.8.4-2ubuntu1~14.04.4) 4.8.4")
  Cross C compiler: .../host/bin/riscv64-buildroot-linux-gnu-gcc (gcc 7.4.0)

  meson.build:1:0: ERROR:  Unknown compiler(s): [['.../host/bin/riscv64-buildroot-linux-gnu-g++']]
  The follow exceptions were encountered:
  Running ".../host/bin/riscv64-buildroot-linux-gnu-g++ --version" gave "[Errno 2] No such file or directory: '.../host/bin/riscv64-buildroot-linux-gnu-g++': '.../host/bin/riscv64-buildroot-linux-gnu-g++'"

[1] http://autobuild.buildroot.net/results/bf4d3d360f635c3524a52b84a72d558770596ed0

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Note:
  - alternative solution would be to add a c++ dependency for libinput
  - patch could be improved to optional C++ dependency/compile (but did
    not know how to express this in meson)
---
 ...0001-meson.build-drop-CPP-dependency.patch | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/libinput/0001-meson.build-drop-CPP-dependency.patch

diff --git a/package/libinput/0001-meson.build-drop-CPP-dependency.patch b/package/libinput/0001-meson.build-drop-CPP-dependency.patch
new file mode 100644
index 0000000000..0a737f55ea
--- /dev/null
+++ b/package/libinput/0001-meson.build-drop-CPP-dependency.patch
@@ -0,0 +1,39 @@
+From bdc1c4a707cfa47933d06d74b9b581c15dad98f8 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Fri, 11 Jan 2019 23:34:37 +0100
+Subject: [PATCH] meson.build: drop CPP dependency
+
+Drop meson C++/CPP dependency, only needed for the build-time
+header inclusion test, so drop both.
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ meson.build | 8 +-------
+ 1 file changed, 1 insertion(+), 7 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index a9c7c185..9456a98e 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1,4 +1,4 @@
+-project('libinput', 'c', 'cpp',
++project('libinput', 'c',
+ 	version : '1.12.5',
+ 	license : 'MIT/Expat',
+ 	default_options : [ 'c_std=gnu99', 'warning_level=2' ],
+@@ -641,12 +641,6 @@ executable('test-build-linker',
+ 	   include_directories : [includes_src, includes_include],
+ 	   dependencies : [ dep_libinput, dep_libinput_util ],
+ 	   install : false)
+-# test including from C++
+-executable('test-build-cxx',
+-	   'test/build-cxx.cc',
+-	   dependencies : [dep_udev],
+-	   include_directories : [includes_src, includes_include],
+-	   install : false)
+ 
+ # This is the test suite runner, we allow disabling that one because of
+ # dependencies
+-- 
+2.20.1
+
-- 
2.20.1
