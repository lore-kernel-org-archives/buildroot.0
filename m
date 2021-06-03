From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  3 Jun 2021 07:36:43 +0200
Subject: [Buildroot] [PATCH 1/2] Revert "package/libcamera: fix build on
 sparc v8"
Message-ID: <20210603053644.3432-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit dc34fa5c6cd99ae748a18e2ce0467ac6e117f8eb following
upsteam review:
https://lists.libcamera.org/pipermail/libcamera-devel/2021-June/021065.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ra-add-dependencies-to-libcamera_dep.patch | 37 -------------------
 1 file changed, 37 deletions(-)
 delete mode 100644 package/libcamera/0001-libcamera-add-dependencies-to-libcamera_dep.patch

diff --git a/package/libcamera/0001-libcamera-add-dependencies-to-libcamera_dep.patch b/package/libcamera/0001-libcamera-add-dependencies-to-libcamera_dep.patch
deleted file mode 100644
index aa8d659cf3..0000000000
--- a/package/libcamera/0001-libcamera-add-dependencies-to-libcamera_dep.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 1a2fd4526e0858827f47a7e9359df34f0d0e3108 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 27 May 2021 21:00:21 +0200
-Subject: [PATCH] libcamera: add dependencies to libcamera_dep
-
-Add dependencies to libcamera_dep to avoid the following build failure
-with qcam on sparc v8 which is raised since commit
-a8310248fc26cc1e1b791af5e9394c1d20bee269:
-
-FAILED: src/qcam/qcam
-/srv/storage/autobuild/run/instance-0/output-1/host/bin/sparc-linux-g++  -o src/qcam/qcam src/qcam/qcam.p/meson-generated_.._qt5-feathericons_qrc.cpp.o src/qcam/qcam.p/meson-generated_moc_main_window.cpp.o src/qcam/qcam.p/meson-generated_moc_viewfinder_qt.cpp.o src/qcam/qcam.p/.._cam_options.cpp.o src/qcam/qcam.p/.._cam_stream_options.cpp.o src/qcam/qcam.p/format_converter.cpp.o src/qcam/qcam.p/main.cpp.o src/qcam/qcam.p/main_window.cpp.o src/qcam/qcam.p/message_handler.cpp.o src/qcam/qcam.p/viewfinder_qt.cpp.o src/qcam/qcam.p/dng_writer.cpp.o -Wl,--as-needed -Wl,--no-undefined -Wl,-O1 -Wshadow -include config.h '-Wl,-rpath,$ORIGIN/../libcamera' -Wl,-rpath-link,/srv/storage/autobuild/run/instance-0/output-1/build/libcamera-3a1f67a8031ac5ad96a11d5dc8b2e8976290497b/build/src/libcamera -Wl,--start-group src/libcamera/libcamera.so /srv/storage/autobuild/run/instance-0/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libQt5Core.so /srv/storage/autobuild/run/instance-0/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libQt5Gui.so /srv/storage/autobuild/run/instance-0/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libQt5Widgets.so /srv/storage/autobuild/run/instance-0/output-1/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libtiff.so -Wl,--end-group
-/srv/storage/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/9.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: src/qcam/qcam.p/main_window.cpp.o: undefined reference to symbol '__atomic_fetch_add_4@@LIBATOMIC_1.0'
-/srv/storage/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/9.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /srv/storage/autobuild/run/instance-0/output-1/host/sparc-buildroot-linux-uclibc/sysroot/lib/libatomic.so.1: error adding symbols: DSO missing from command line
-
-Fixes:
- - http://autobuild.buildroot.org/results/d0726b2253f1f3d006e057f3b32c646c4b9b5f7a
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://bugs.libcamera.org/show_bug.cgi?id=39]
----
- src/libcamera/meson.build | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/libcamera/meson.build b/src/libcamera/meson.build
-index cc2b8669..af3533ad 100644
---- a/src/libcamera/meson.build
-+++ b/src/libcamera/meson.build
-@@ -160,6 +160,7 @@ libcamera_dep = declare_dependency(sources : [
-                                        libcamera_public_headers,
-                                    ],
-                                    include_directories : libcamera_includes,
-+                                   dependencies : libcamera_deps,
-                                    link_with : libcamera)
- 
- subdir('proxy/worker')
--- 
-2.30.2
-- 
2.30.2
