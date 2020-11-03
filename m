From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Nov 2020 17:58:51 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/gnuradio:
 backport patch to fix INTERFACE_INCLUDE_DIRECTORIES
Message-ID: <20201103182239.D934986329@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=de8089fbf4ad6b201e8e4d8fcd88fc123d275f06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

gnuradio-runtimeTargets.cmake and gnuradio-pmtTargets.cmake are filled
using CMAKE_INSTALL_PREFIX for INSTALL_INTERFACE.

Since CMAKE_INSTALL_PREFIX, in buildroot, is set to /usr, these files contains
path to host system.

With BR2_COMPILER_PARANOID_UNSAFE_PATH package using gnuradio fails with:
arm-linux-gnueabihf-g++: ERROR: unsafe header/library path used in cross-compilation: '-isystem' '/usr/include'

By simply providing 'include', produced .cmake contains:
INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
instead of
INTERFACE_INCLUDE_DIRECTORIES "/usr/include"

[Upstream status: https://github.com/gnuradio/gnuradio/pull/3737]

Fix (many) gr-osmosdr build failure:
- http://autobuild.buildroot.net/results/66b76c07f15bb3e6db697c47796ae3dd15ecf4b9/

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5209123494ccfb91ea802cc7675886c2ac800cc7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a81b187c16492724639dd394d805212bd100d5b4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...nt-hardcode-INTERFACE_INCLUDE_DIRECTORIES.patch | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/package/gnuradio/0003-gnuradio-runtime_pmt-dont-hardcode-INTERFACE_INCLUDE_DIRECTORIES.patch b/package/gnuradio/0003-gnuradio-runtime_pmt-dont-hardcode-INTERFACE_INCLUDE_DIRECTORIES.patch
new file mode 100644
index 0000000000..6b8987fa5f
--- /dev/null
+++ b/package/gnuradio/0003-gnuradio-runtime_pmt-dont-hardcode-INTERFACE_INCLUDE_DIRECTORIES.patch
@@ -0,0 +1,57 @@
+From 84dea8284c521f08508bb2dcbc99db3b5d3438fd Mon Sep 17 00:00:00 2001
+From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
+Date: Thu, 27 Aug 2020 17:32:09 +0200
+Subject: [PATCH] gnuradio-runtime_pmt: dont hardcode
+ INTERFACE_INCLUDE_DIRECTORIES
+
+gnuradio-runtimeTargets.cmake and gnuradio-pmtTargets.cmake are filled
+using CMAKE_INSTALL_PREFIX for INSTALL_INTERFACE.
+
+Since CMAKE_INSTALL_PREFIX, in buildroot, is set to /usr, these files contains
+path to host system.
+
+With BR2_COMPILER_PARANOID_UNSAFE_PATH package using gnuradio fails with:
+arm-linux-gnueabihf-g++: ERROR: unsafe header/library path used in cross-compilation: '-isystem' '/usr/include'
+
+By simply providing 'include', produced .cmake contains:
+INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
+instead of
+INTERFACE_INCLUDE_DIRECTORIES "/usr/include"
+
+[Upstream status: https://github.com/gnuradio/gnuradio/pull/3737]
+
+Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
+---
+ gnuradio-runtime/lib/CMakeLists.txt     | 2 +-
+ gnuradio-runtime/lib/pmt/CMakeLists.txt | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gnuradio-runtime/lib/CMakeLists.txt b/gnuradio-runtime/lib/CMakeLists.txt
+index 5aa90a5e1..fc32f473b 100644
+--- a/gnuradio-runtime/lib/CMakeLists.txt
++++ b/gnuradio-runtime/lib/CMakeLists.txt
+@@ -214,7 +214,7 @@ target_link_libraries(gnuradio-runtime PUBLIC
+ 
+ target_include_directories(gnuradio-runtime
+   PUBLIC
+-    $<INSTALL_INTERFACE:${CMAKE_INSTALL_PREFIX}/include>
++    $<INSTALL_INTERFACE:include>
+     $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/../include>
+     $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/../include>
+   PRIVATE
+diff --git a/gnuradio-runtime/lib/pmt/CMakeLists.txt b/gnuradio-runtime/lib/pmt/CMakeLists.txt
+index 9fb98d0fc..6dfcd945c 100644
+--- a/gnuradio-runtime/lib/pmt/CMakeLists.txt
++++ b/gnuradio-runtime/lib/pmt/CMakeLists.txt
+@@ -33,7 +33,7 @@ target_link_libraries(gnuradio-pmt
+ 
+ target_include_directories(gnuradio-pmt
+   PUBLIC
+-  $<INSTALL_INTERFACE:${CMAKE_INSTALL_PREFIX}/include>
++  $<INSTALL_INTERFACE:include>
+   $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/../../include>
+   PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/
+   )
+-- 
+2.26.2
+
