From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 25 Oct 2018 22:54:02 +0200
Subject: [Buildroot] [PATCH 1/1] xerces: fix static linking with mbedtls
Message-ID: <20181025205402.10649-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

curl can be statically linked with mbedtls, in this case build will
fail on:
kex.c:(.text+0x1be0): undefined reference to `mbedtls_mpi_read_binary'

This is due to the fact that CURL_LIBRARIES does not contain mbedtls
library:
CURL_LIBRARIES:INTERNAL=curl;cares;ssh2;ssh2;z;ssl;crypto;z;z;crypto;z;z;ssl;z;z;crypto;z

even if libcurl.pc is correct:
Libs.private: -lcares -lssh2 -L/home/fabrice/buildroot/output/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -lssh2 /home/fabrice/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libmbedcrypto.a /home/fabrice/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libmbedcrypto.a -L/home/fabrice/buildroot/output/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -L/home/fabrice/buildroot/output/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -lz -lssl -lcrypto -lssl -lz -lz -lcrypto -lz -lz

So to fix this replace CURL_LIBRARIES by CURL_LDFLAGS

Fixes:
 - http://autobuild.buildroot.org/results/dc7810d5d5c62658837cdd2faae6fe3390f968a2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...0003-fix-static-linking-with-mbedtls.patch | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/xerces/0003-fix-static-linking-with-mbedtls.patch

diff --git a/package/xerces/0003-fix-static-linking-with-mbedtls.patch b/package/xerces/0003-fix-static-linking-with-mbedtls.patch
new file mode 100644
index 0000000000..3523219555
--- /dev/null
+++ b/package/xerces/0003-fix-static-linking-with-mbedtls.patch
@@ -0,0 +1,42 @@
+From f769f2c5979176ada5ea99d1b7914adc96e2e3d9 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 25 Oct 2018 22:38:43 +0200
+Subject: [PATCH] fix static linking with mbedtls
+
+curl can be statically linked with mbedtls, in this case build will
+fail on:
+kex.c:(.text+0x1be0): undefined reference to `mbedtls_mpi_read_binary'
+
+This is due to the fact that CURL_LIBRARIES does not contain mbedtls
+library:
+CURL_LIBRARIES:INTERNAL=curl;cares;ssh2;ssh2;z;ssl;crypto;z;z;crypto;z;z;ssl;z;z;crypto;z
+
+even if libcurl.pc is correct:
+Libs.private: -lcares -lssh2 -L/home/fabrice/buildroot/output/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -lssh2 /home/fabrice/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libmbedcrypto.a /home/fabrice/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libmbedcrypto.a -L/home/fabrice/buildroot/output/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -L/home/fabrice/buildroot/output/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -lz -lssl -lcrypto -lssl -lz -lz -lcrypto -lz -lz
+
+So to fix this replace CURL_LIBRARIES by CURL_LDFLAGS
+
+Fixes:
+ - http://autobuild.buildroot.org/results/dc7810d5d5c62658837cdd2faae6fe3390f968a2
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index c29aa257b..72e8648f4 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -1085,7 +1085,7 @@ endif()
+ if(XERCES_USE_NETACCESSOR_CURL)
+   list(APPEND libxerces_c_SOURCES ${curl_sources})
+   list(APPEND libxerces_c_HEADERS ${curl_headers})
+-  list(APPEND libxerces_c_DEPS ${CURL_LIBRARIES})
++  list(APPEND libxerces_c_DEPS ${CURL_LDFLAGS})
+ endif()
+ 
+ if(XERCES_USE_NETACCESSOR_SOCKET)
+-- 
+2.17.1
+
-- 
2.17.1
