From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 12 Jan 2019 10:41:53 +0100
Subject: [Buildroot] [PATCH v2] libinput: drop C++ dependency
Message-ID: <20190112094153.9168-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The meson C++ dependency is only used for a build-time header
inclusion test, add patch dropping hard meson C++ dependency
and build the header inclusion test only in case C++ compiler
is available.

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
Changes v1 -> v2:
  - change patch to disable c++ header inclusion teste only in case
    no c++ compiler is available (suggested by Yann E. MORIN)
---
 ...le-CPP-include-check-only-in-case-CP.patch | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 package/libinput/0001-meson.build-enable-CPP-include-check-only-in-case-CP.patch

diff --git a/package/libinput/0001-meson.build-enable-CPP-include-check-only-in-case-CP.patch b/package/libinput/0001-meson.build-enable-CPP-include-check-only-in-case-CP.patch
new file mode 100644
index 0000000000..c9a0652e40
--- /dev/null
+++ b/package/libinput/0001-meson.build-enable-CPP-include-check-only-in-case-CP.patch
@@ -0,0 +1,49 @@
+From 57383dc900e76e65ce5e5dc95f776e086100344d Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Sat, 12 Jan 2019 10:22:38 +0100
+Subject: [PATCH] meson.build: enable CPP include check only in case CPP
+ compiler is available
+
+Drop hard meson C++/CPP dependency, only needed for the build-time
+header inclusion test, build the test only in case C++/CPP compiler
+is available.
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ meson.build | 16 +++++++++-------
+ 1 file changed, 9 insertions(+), 7 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index a9c7c185..8183822e 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1,4 +1,4 @@
+-project('libinput', 'c', 'cpp',
++project('libinput', 'c',
+ 	version : '1.12.5',
+ 	license : 'MIT/Expat',
+ 	default_options : [ 'c_std=gnu99', 'warning_level=2' ],
+@@ -641,12 +641,14 @@ executable('test-build-linker',
+ 	   include_directories : [includes_src, includes_include],
+ 	   dependencies : [ dep_libinput, dep_libinput_util ],
+ 	   install : false)
+-# test including from C++
+-executable('test-build-cxx',
+-	   'test/build-cxx.cc',
+-	   dependencies : [dep_udev],
+-	   include_directories : [includes_src, includes_include],
+-	   install : false)
++# test including from C++ (in case CPP compiler is available)
++if add_languages('cpp', required: false)
++	executable('test-build-cxx',
++		   'test/build-cxx.cc',
++		   dependencies : [dep_udev],
++		   include_directories : [includes_src, includes_include],
++		   install : false)
++endif
+ 
+ # This is the test suite runner, we allow disabling that one because of
+ # dependencies
+-- 
+2.20.1
+
-- 
2.20.1
