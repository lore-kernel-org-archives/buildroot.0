From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Mar 2020 16:27:58 +0100
Subject: [Buildroot] [git commit] package/bctoolbox: bump to version 4.3.1
Message-ID: <20200309140910.BEEA88EB58@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=784fee1246d1d162d7541a57cf1bc388957a376b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Refresh patch
- libiconv is needed without locale since version 4.3.0 and
  https://github.com/BelledonneCommunications/bctoolbox/commit/d5713996c2ae100594ebf319c54d95297b02a2e1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Fix-Libs.private-flags-for-mbedtls.patch  | 44 ++++++++--------------
 package/bctoolbox/Config.in                        |  5 +++
 package/bctoolbox/bctoolbox.hash                   |  2 +-
 package/bctoolbox/bctoolbox.mk                     |  7 +++-
 package/mediastreamer/Config.in                    |  4 ++
 package/ortp/Config.in                             |  4 ++
 6 files changed, 36 insertions(+), 30 deletions(-)

diff --git a/package/bctoolbox/0001-Fix-Libs.private-flags-for-mbedtls.patch b/package/bctoolbox/0001-Fix-Libs.private-flags-for-mbedtls.patch
index a70c7c633a..342042d59c 100644
--- a/package/bctoolbox/0001-Fix-Libs.private-flags-for-mbedtls.patch
+++ b/package/bctoolbox/0001-Fix-Libs.private-flags-for-mbedtls.patch
@@ -1,49 +1,37 @@
-From c0b3dbb43aa3a38c47311556c85eadc6072e2d68 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Tue, 14 Feb 2017 22:02:26 +0100
-Subject: [PATCH] Fix Libs.private flags for mbedtls
+From b7f14a800bbdad193f45695bc5b8c5173f3882ba Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 10 Feb 2019 17:51:05 +0100
+Subject: [PATCH] CMakeLists.txt: fix mbedtls libraries in bctoolbox.pc
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
 
-Static linking with bctoolbox fails when using pkg-config as the
-generated bctoolbox.pc file only consists of an '-L' string without any
-search path or libraries flags.
-
-That's because of an typo in `mbedtls_library_path`. However,
-`mbedtls_library_path` contains a string of the mbedtls libraries
-concatenated by an ';' which cannot be parsed by pkg-config.
-
-Therefore, use `MBEDTLS_LIBRARY` instead of `MBEDTLS_LIBRARIES` to get
-the library path.
-
-Furthermore, add the three mbedtls libraries *mbedtls*, *mbedcrypto*, and
-*mbedx509* to `LIBS_PRIVATE` so these libraries are added to the
-`Libs.private` field of bctoolbox.pc.
-
-Upstream status: Pending
+bctoolbox.pc should not contain the full libraries path, path should be
+given by -L and library names by -l
+So sent back the fix already suggested by J??rg Krause in
 https://github.com/BelledonneCommunications/bctoolbox/pull/4
 
 Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://github.com/BelledonneCommunications/bctoolbox/pull/7]
 ---
- CMakeLists.txt | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ CMakeLists.txt | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index ed7aa00..4127f0e 100644
+index 29f3eb6..b2f26c2 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -103,8 +103,8 @@ else()
+@@ -101,9 +101,8 @@ else()
  endif()
  
  if(MBEDTLS_FOUND)
 -	get_filename_component(mbedtls_library_path "${MBEDTLS_LIBRARIES}" PATH)
--	set(LIBS_PRIVATE "${LIBS_PRIVATE} -L${mbedlts_library_path}")
+-	string(REPLACE ";" " " MBEDTLS_LIBRARIES_STR "${MBEDTLS_LIBRARIES}")
+-	set(LIBS_PRIVATE "${LIBS_PRIVATE} ${MBEDTLS_LIBRARIES_STR}")
 +	get_filename_component(mbedtls_library_path "${MBEDTLS_LIBRARY}" PATH)
 +	set(LIBS_PRIVATE "${LIBS_PRIVATE} -L${mbedtls_library_path} -lmbedtls -lmbedcrypto -lmbedx509")
  endif()
  if(POLARSSL_FOUND)
  	get_filename_component(polarssl_library_path "${POLARSSL_LIBRARIES}" PATH)
--- 
-2.11.1
-
diff --git a/package/bctoolbox/Config.in b/package/bctoolbox/Config.in
index 048d01282c..1cf2b7e236 100644
--- a/package/bctoolbox/Config.in
+++ b/package/bctoolbox/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_BCTOOLBOX
 	bool "bctoolbox"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  Utilities library used by Belledonne Communications
 	  softwares like belle-sip, mediastreamer2 and linphone.
@@ -12,3 +14,6 @@ config BR2_PACKAGE_BCTOOLBOX
 
 comment "bctoolbox needs a toolchain w/ C++, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+
+comment "bctoolbox needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/bctoolbox/bctoolbox.hash b/package/bctoolbox/bctoolbox.hash
index 6242355ee2..7d64c32013 100644
--- a/package/bctoolbox/bctoolbox.hash
+++ b/package/bctoolbox/bctoolbox.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  da7df7ff359a9829e9e6ef98dfe9fead0cf735b8a4a5da1b1047f467dee1b2a9  bctoolbox-0.4.0.tar.gz
+sha256  d8501e3793c10abbf913759d7a0e5f6eb3140af6bacf5e2bdcd532049bde69c0  bctoolbox-4.3.1.tar.gz
 sha256  849dd903d98f12a964466ccfbaf3a1de1f94ad0ebd49a59d12f8ce4506f9f647  COPYING
diff --git a/package/bctoolbox/bctoolbox.mk b/package/bctoolbox/bctoolbox.mk
index 281a0bf2a1..f9d740820d 100644
--- a/package/bctoolbox/bctoolbox.mk
+++ b/package/bctoolbox/bctoolbox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BCTOOLBOX_VERSION = 0.4.0
+BCTOOLBOX_VERSION = 4.3.1
 BCTOOLBOX_SITE = $(call github,BelledonneCommunications,bctoolbox,$(BCTOOLBOX_VERSION))
 BCTOOLBOX_LICENSE = GPL-2.0+
 BCTOOLBOX_LICENSE_FILES = COPYING
@@ -20,6 +20,11 @@ BCTOOLBOX_CONF_OPTS = \
 	-DGIT_EXECUTABLE=OFF \
 	-DCMAKE_SKIP_RPATH=ON
 
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+BCTOOLBOX_DEPENDENCIES += libiconv
+BCTOOLBOX_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -liconv"
+endif
+
 ifeq ($(BR2_PACKAGE_MBEDTLS),y)
 BCTOOLBOX_DEPENDENCIES += mbedtls
 BCTOOLBOX_CONF_OPTS += -DENABLE_MBEDTLS=ON
diff --git a/package/mediastreamer/Config.in b/package/mediastreamer/Config.in
index b18c83c5e5..91861c16c1 100644
--- a/package/mediastreamer/Config.in
+++ b/package/mediastreamer/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_MEDIASTREAMER
 	bool "mediastreamer"
 	depends on BR2_INSTALL_LIBSTDCPP # ortp
 	depends on BR2_TOOLCHAIN_HAS_THREADS # ortp
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # ortp
 	select BR2_PACKAGE_ORTP
 	help
 	  Mediastreamer is a powerful and lightweighted streaming
@@ -15,3 +16,6 @@ config BR2_PACKAGE_MEDIASTREAMER
 
 comment "mediastreamer needs a toolchain w/ threads, C++"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+
+comment "mediastreamer needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/ortp/Config.in b/package/ortp/Config.in
index 052ff1d397..e296e82f7a 100644
--- a/package/ortp/Config.in
+++ b/package/ortp/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_ORTP
 	bool "oRTP"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # bctoolbox
 	select BR2_PACKAGE_BCTOOLBOX
 	help
 	  oRTP, a Real-time Transport Protocol (RTP,RFC3550) library
@@ -10,3 +11,6 @@ config BR2_PACKAGE_ORTP
 
 comment "ortp needs a toolchain w/ C++, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+
+comment "ortp needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
