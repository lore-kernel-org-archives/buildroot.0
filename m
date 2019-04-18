From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Apr 2019 11:25:28 +0200
Subject: [Buildroot] [git commit] package/wireshark: fix static build with
 pcap
Message-ID: <20190418092108.28B958E8B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fab2decb1c38426dcdd7fa50d7aba58be3cc1480
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use pkg-config to find pcap dependencies

Fixes:
 - http://autobuild.buildroot.org/results/277a24ad543a8f54cc8afde4f359f5d77b42eb7f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0003-FindPCAP.cmake-fix-static-build.patch     | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/package/wireshark/0003-FindPCAP.cmake-fix-static-build.patch b/package/wireshark/0003-FindPCAP.cmake-fix-static-build.patch
new file mode 100644
index 0000000000..425fa35ffc
--- /dev/null
+++ b/package/wireshark/0003-FindPCAP.cmake-fix-static-build.patch
@@ -0,0 +1,46 @@
+From 1ffe04d0f2ef3c7737f1f9667cfcdd6c4239bbbe Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 17 Apr 2019 23:58:55 +0200
+Subject: [PATCH] FindPCAP.cmake: fix static build
+
+When statically built, pcap can depends on other libraries such as
+-lnl-3. Add a call to pkg-config to find them and don't overwrite
+PCAP_LIBRARIES with PCAP_LIBRARY (use APPEND instead)
+
+Fixes:
+ - http://autobuild.buildroot.org/results/277a24ad543a8f54cc8afde4f359f5d77b42eb7f
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: not sent yet (waiting feedback on first patch)]
+---
+ cmake/modules/FindPCAP.cmake | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/cmake/modules/FindPCAP.cmake b/cmake/modules/FindPCAP.cmake
+index dfd80415f6..826ccfbdcc 100644
+--- a/cmake/modules/FindPCAP.cmake
++++ b/cmake/modules/FindPCAP.cmake
+@@ -9,6 +9,11 @@
+ include( FindWSWinLibs )
+ FindWSWinLibs( "WpdPack" "PCAP_HINTS" )
+ 
++if (NOT WIN32)
++  find_package(PkgConfig)
++  pkg_search_module( PCAP libpcap )
++endif()
++
+ # The 64-bit wpcap.lib is under /x64
+ set ( _PLATFORM_SUBDIR "" )
+ if( WIN32 AND "${WIRESHARK_TARGET_PLATFORM}" STREQUAL "win64" )
+@@ -37,7 +42,7 @@ find_package_handle_standard_args( PCAP DEFAULT_MSG PCAP_LIBRARY PCAP_INCLUDE_DI
+ 
+ if( PCAP_FOUND )
+   set( PCAP_INCLUDE_DIRS ${PCAP_INCLUDE_DIR} )
+-  set( PCAP_LIBRARIES ${PCAP_LIBRARY} )
++  list( APPEND PCAP_LIBRARIES ${PCAP_LIBRARY} )
+ else()
+   set( PCAP_INCLUDE_DIRS )
+   set( PCAP_LIBRARIES )
+-- 
+2.20.1
+
