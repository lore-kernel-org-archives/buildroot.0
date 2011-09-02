From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  2 Sep 2011 11:04:57 -0300
Subject: [Buildroot] [PATCH 09/13] musepack: bump to r475
In-Reply-To: <1314972301-5067-1-git-send-email-gustavo@zacarias.com.ar>
References: <1314972301-5067-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1314972301-5067-11-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/multimedia/musepack/musepack-shared.patch |   24 +++++++++++++++++++++
 package/multimedia/musepack/musepack.mk           |    5 +--
 2 files changed, 26 insertions(+), 3 deletions(-)
 create mode 100644 package/multimedia/musepack/musepack-shared.patch

diff --git a/package/multimedia/musepack/musepack-shared.patch b/package/multimedia/musepack/musepack-shared.patch
new file mode 100644
index 0000000..d8c788d
--- /dev/null
+++ b/package/multimedia/musepack/musepack-shared.patch
@@ -0,0 +1,24 @@
+Fixup installation of shared mpcdec library.
+Based on gentoo patch.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+
+diff -Nura musepack_src_r475.orig/libmpcdec/CMakeLists.txt musepack_src_r475/libmpcdec/CMakeLists.txt
+--- musepack_src_r475.orig/libmpcdec/CMakeLists.txt	2010-08-21 12:55:01.000000000 -0300
++++ musepack_src_r475/libmpcdec/CMakeLists.txt	2011-08-17 15:53:06.126873408 -0300
+@@ -1,7 +1,12 @@
+ include_directories(${libmpc_SOURCE_DIR}/include)
+ if(SHARED)
+-  add_library(mpcdec SHARED huffman mpc_decoder mpc_reader streaminfo mpc_bits_reader mpc_demux requant synth_filter ${libmpc_SOURCE_DIR}/common/crc32)
++  add_library(mpcdec_shared SHARED huffman mpc_decoder mpc_reader streaminfo mpc_bits_reader mpc_demux requant synth_filter ${libmpc_SOURCE_DIR}/common/crc32)
++  set_target_properties(mpcdec_shared PROPERTIES OUTPUT_NAME mpcdec CLEAN_DIRECT_OUTPUT 1 VERSION 7.0.1 SOVERSION 7)
++  target_link_libraries(mpcdec_shared m)
++  install(TARGETS mpcdec_shared LIBRARY DESTINATION "lib${LIB_SUFFIX}" ARCHIVE DESTINATION "lib${LIB_SUFFIX}")
+ else(SHARED)
+   add_library(mpcdec_static STATIC huffman mpc_decoder mpc_reader streaminfo mpc_bits_reader mpc_demux requant synth_filter ${libmpc_SOURCE_DIR}/common/crc32)
++  set_target_properties(mpcdec_static PROPERTIES OUTPUT_NAME mpcdec CLEAN_DIRECT_OUTPUT 1)
++  target_link_libraries(mpcdec_static m)
++  install(TARGETS mpcdec_static LIBRARY DESTINATION "lib${LIB_SUFFIX}" ARCHIVE DESTINATION "lib${LIB_SUFFIX}")
+ endif(SHARED)
+-
diff --git a/package/multimedia/musepack/musepack.mk b/package/multimedia/musepack/musepack.mk
index 34581b6..21601eb 100644
--- a/package/multimedia/musepack/musepack.mk
+++ b/package/multimedia/musepack/musepack.mk
@@ -4,11 +4,10 @@
 #
 ################################################################################
 
-MUSEPACK_VERSION =  r435
+MUSEPACK_VERSION =  r475
 MUSEPACK_SITE = http://files.musepack.net/source
 MUSEPACK_SOURCE = musepack_src_$(MUSEPACK_VERSION).tar.gz
 MUSEPACK_DEPENDENCIES = libcuefile libreplaygain
-MUSEPACK_AUTORECONF = YES
 MUSEPACK_INSTALL_STAGING = YES
 
-$(eval $(call AUTOTARGETS,package/multimedia,musepack))
+$(eval $(call CMAKETARGETS,package/multimedia,musepack))
-- 
1.7.3.4
