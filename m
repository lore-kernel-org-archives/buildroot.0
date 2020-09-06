From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 6 Sep 2020 14:37:34 +0200
Subject: [Buildroot] [git commit] package/easyframes: fix static build with
 pcap
Message-ID: <20200906122923.9D54883774@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c1c9c1877c00de6b53795bad19e0b627ff66a327
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - autobuild.buildroot.org/results/99062bfc8c21c32bc835acae675aede7c9cf0c90

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Horatiu Vultur <horatiu.vultur@microchip.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...MakesLists.txt-fix-static-build-with-pcap.patch | 57 ++++++++++++++++++++++
 package/easyframes/easyframes.mk                   |  2 +-
 2 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/package/easyframes/0001-CMakesLists.txt-fix-static-build-with-pcap.patch b/package/easyframes/0001-CMakesLists.txt-fix-static-build-with-pcap.patch
new file mode 100644
index 0000000000..3f13613e9d
--- /dev/null
+++ b/package/easyframes/0001-CMakesLists.txt-fix-static-build-with-pcap.patch
@@ -0,0 +1,57 @@
+From 89ad9c143825b13d028c2f1713d55e83135d5c0f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 5 Sep 2020 15:38:33 +0200
+Subject: [PATCH] CMakesLists.txt: fix static build with pcap
+
+Use pkg-config to find the dependencies of pcap such as libnl otherwise
+a static-only build will fail on:
+
+[100%] Linking C executable ef
+/srv/storage/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /srv/storage/autobuild/run/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libpcap.a(pcap-linux.o): in function `nl80211_init':
+pcap-linux.c:(.text+0x460): undefined reference to `nl_socket_alloc'
+/srv/storage/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: pcap-linux.c:(.text+0x498): undefined reference to `genl_connect'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/99062bfc8c21c32bc835acae675aede7c9cf0c90
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/microchip-ung/easyframes/pull/2]
+---
+ CMakeLists.txt | 20 ++++++++++++++------
+ 1 file changed, 14 insertions(+), 6 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index a62a950..5be128c 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -7,13 +7,21 @@ include_directories(src)
+ 
+ 
+ set(_LIBPCAP "")
+-FIND_PATH(PCAP_INCLUDE_DIR NAMES pcap/pcap.h)
+-FIND_LIBRARY(PCAP_LIBRARY NAMES pcap)
+-
+-if (PCAP_LIBRARY)
++find_package(PkgConfig)
++pkg_check_modules(PCAP libpcap)
++if (PCAP_FOUND)
+     add_definitions(-DHAS_LIBPCAP)
+-    include_directories(${PCAP_INCLUDE_DIR})
+-    set(_LIBPCAP ${PCAP_LIBRARY})
++    include_directories(${PCAP_INCLUDE_DIRS})
++    set(_LIBPCAP ${PCAP_LIBRARIES})
++else()
++    FIND_PATH(PCAP_INCLUDE_DIR NAMES pcap/pcap.h)
++    FIND_LIBRARY(PCAP_LIBRARY NAMES pcap)
++
++    if (PCAP_LIBRARY)
++        add_definitions(-DHAS_LIBPCAP)
++        include_directories(${PCAP_INCLUDE_DIR})
++        set(_LIBPCAP ${PCAP_LIBRARY})
++    endif()
+ endif()
+ 
+ add_library(libef STATIC
+-- 
+2.28.0
+
diff --git a/package/easyframes/easyframes.mk b/package/easyframes/easyframes.mk
index 2c209433d2..1821ce703c 100644
--- a/package/easyframes/easyframes.mk
+++ b/package/easyframes/easyframes.mk
@@ -6,7 +6,7 @@
 
 EASYFRAMES_VERSION = 0.3
 EASYFRAMES_SITE = $(call github,microchip-ung,easyframes,v$(EASYFRAMES_VERSION))
-EASYFRAMES_DEPENDENCIES = libpcap
+EASYFRAMES_DEPENDENCIES = host-pkgconf libpcap
 EASYFRAMES_LICENSE = MIT
 EASYFRAMES_LICENSE_FILES = COPYING
 
