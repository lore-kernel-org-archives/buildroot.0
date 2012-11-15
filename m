From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 15 Nov 2012 22:02:39 +0100
Subject: [Buildroot] [git commit] grantlee: fix -lpthread build error
Message-ID: <20121115210309.94B4E9A012@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f92a2371957caf4e72951d7c9e33438a6e105250
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixing linking time error with certain toolchains. The issue caused by a missing explicit linking to
libpthread. The failed buildlog:
Linking CXX executable testgenerictypes_exec
/home/buildroot12git/output/host/usr/lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.6.3/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libQtCore.so: undefined reference to symbol 'pthread_cancel'
/home/buildroot12git/output/host/usr/lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.6.3/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: note: 'pthread_cancel' is defined in DSO /home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/lib/libpthread.so.0 so try adding it to the linker command line
/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/lib/libpthread.so.0: could not read symbols: Invalid operation
collect2: ld returned 1 exit status
make[3]: *** [templates/tests/testgenerictypes_exec] Error 1
make[3]: Leaving directory `/home/buildroot12git/output/build/grantlee-0.2.0'
make[2]: *** [templates/tests/CMakeFiles/testgenerictypes_exec.dir/all] Error 2
make[2]: Leaving directory `/home/buildroot12git/output/build/grantlee-0.2.0'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/home/buildroot12git/output/build/grantlee-0.2.0'
make: *** [/home/buildroot12git/output/build/grantlee-0.2.0/.stamp_built] Error

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../grantlee-0.2.0-fix-lphread-link-error.patch    |   42 ++++++++++++++++++++
 1 files changed, 42 insertions(+), 0 deletions(-)

diff --git a/package/grantlee/grantlee-0.2.0-fix-lphread-link-error.patch b/package/grantlee/grantlee-0.2.0-fix-lphread-link-error.patch
new file mode 100644
index 0000000..7964fd0
--- /dev/null
+++ b/package/grantlee/grantlee-0.2.0-fix-lphread-link-error.patch
@@ -0,0 +1,42 @@
+From d46475b6bb9d99a4c5c95489be6c14d0d219d5f8 Mon Sep 17 00:00:00 2001
+From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
+Date: Thu, 15 Nov 2012 17:00:39 +0100
+Subject: [PATCH] fix -lpthread build error
+
+Fixing linking time error with certain toolchains. The issue caused by a missing explicit linking to
+libpthread. The failed buildlog:
+Linking CXX executable testgenerictypes_exec
+/home/buildroot12git/output/host/usr/lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.6.3/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libQtCore.so: undefined reference to symbol 'pthread_cancel'
+/home/buildroot12git/output/host/usr/lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.6.3/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: note: 'pthread_cancel' is defined in DSO /home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/lib/libpthread.so.0 so try adding it to the linker command line
+/home/buildroot12git/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/lib/libpthread.so.0: could not read symbols: Invalid operation
+collect2: ld returned 1 exit status
+make[3]: *** [templates/tests/testgenerictypes_exec] Error 1
+make[3]: Leaving directory `/home/buildroot12git/output/build/grantlee-0.2.0'
+make[2]: *** [templates/tests/CMakeFiles/testgenerictypes_exec.dir/all] Error 2
+make[2]: Leaving directory `/home/buildroot12git/output/build/grantlee-0.2.0'
+make[1]: *** [all] Error 2
+make[1]: Leaving directory `/home/buildroot12git/output/build/grantlee-0.2.0'
+make: *** [/home/buildroot12git/output/build/grantlee-0.2.0/.stamp_built] Error
+
+Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
+---
+ templates/tests/CMakeLists.txt |    3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/templates/tests/CMakeLists.txt b/templates/tests/CMakeLists.txt
+index caab003..f400622 100644
+--- a/templates/tests/CMakeLists.txt
++++ b/templates/tests/CMakeLists.txt
+@@ -68,7 +68,8 @@ macro(GRANTLEE_TEMPLATES_UNIT_TESTS)
+                   ${_testresource_rcc_src}
+     )
+     add_test(${_testname} ${_testname}_exec )
+-    target_link_libraries(${_testname}_exec ${QT_QTTEST_LIBRARY} grantlee_core )
++    find_package (Threads)
++    target_link_libraries(${_testname}_exec ${QT_QTTEST_LIBRARY} ${CMAKE_THREAD_LIBS_INIT}  grantlee_core )
+ 
+     set_property(GLOBAL APPEND PROPERTY TEST_COVERAGE "${CMAKE_CURRENT_BINARY_DIR}/${_testname}_exec" )
+   endforeach(_testname)
+-- 
+1.7.9.5
+
