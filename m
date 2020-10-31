From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 31 Oct 2020 22:07:07 +0100
Subject: [Buildroot] [PATCH 2/2] package/fastd: bump to version 21
In-Reply-To: <20201031210707.960795-1-fontaine.fabrice@gmail.com>
References: <20201031210707.960795-1-fontaine.fabrice@gmail.com>
Message-ID: <20201031210707.960795-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Switch to meson-package
- Drop first patch (not needed with meson)
- Drop second patch (already in version)

https://fastd.readthedocs.io/en/stable/releases/v20.html
https://fastd.readthedocs.io/en/stable/releases/v21.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ROCEDURAL_OPTIMIZATION-target-proper.patch | 69 -------------------
 ...-leak-when-receiving-invalid-packets.patch | 45 ------------
 package/fastd/fastd.hash                      |  2 +-
 package/fastd/fastd.mk                        | 28 ++++----
 4 files changed, 13 insertions(+), 131 deletions(-)
 delete mode 100644 package/fastd/0001-cmake-use-INTERPROCEDURAL_OPTIMIZATION-target-proper.patch
 delete mode 100644 package/fastd/0002-receive-fix-buffer-leak-when-receiving-invalid-packets.patch

diff --git a/package/fastd/0001-cmake-use-INTERPROCEDURAL_OPTIMIZATION-target-proper.patch b/package/fastd/0001-cmake-use-INTERPROCEDURAL_OPTIMIZATION-target-proper.patch
deleted file mode 100644
index 489c7269f8..0000000000
--- a/package/fastd/0001-cmake-use-INTERPROCEDURAL_OPTIMIZATION-target-proper.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From: Alexander Dahl <alex@netz39.de>
-Date: Wed, 28 Oct 2015 16:04:13 +0100
-Subject: [PATCH] cmake: use INTERPROCEDURAL_OPTIMIZATION target property
-
-Instead of hacking on compiler flags use the cmake way for handling
-interprocedural optimization. Tests showed cmake currently ignores this
-for gcc and clang, at least on Debian Wheezy and Jessie. This actually
-results in no interprocedural optimization for the moment. However it
-allows to compile fastd against a toolchain without LTO support, which
-was broken because of a hack included here for finding binutils.
-
-According to the upstream author of fastd the main reason for enabling
-LTO was binary size on an OpenWRT target for Freifunk Gluon, where they
-have very few space left on devices with only 4 MB flash memory.
-
-Signed-off-by: Alexander Dahl <post@lespocky.de>
----
- cmake/checks.cmake | 14 --------------
- src/CMakeLists.txt |  9 +++++++++
- 2 files changed, 9 insertions(+), 14 deletions(-)
-
-diff --git a/cmake/checks.cmake b/cmake/checks.cmake
-index 27c073f..8a671a1 100644
---- a/cmake/checks.cmake
-+++ b/cmake/checks.cmake
-@@ -10,20 +10,6 @@ if(ARCH_X86 OR ARCH_X86_64)
- endif(ARCH_X86 OR ARCH_X86_64)
- 
- 
--
--if(ENABLE_LTO)
--  set(CFLAGS_LTO "-flto")
--  set(CFLAGS_NO_LTO "-fno-lto")
--
--  check_c_compiler_flag("-fwhole-program" HAVE_FLAG_WHOLE_PROGRAM)
--  if(HAVE_FLAG_WHOLE_PROGRAM)
--    set(LDFLAGS_LTO "-flto -fwhole-program")
--  else(HAVE_FLAG_WHOLE_PROGRAM)
--    set(LDFLAGS_LTO "-flto")
--  endif(HAVE_FLAG_WHOLE_PROGRAM)
--endif(ENABLE_LTO)
--
--
- check_c_source_compiles("
- #include <sys/types.h>
- #include <sys/socket.h>
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index 829b3ab..7612b40 100644
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -48,6 +48,15 @@ add_executable(fastd
- set_property(TARGET fastd PROPERTY COMPILE_FLAGS "${FASTD_CFLAGS}")
- set_property(TARGET fastd PROPERTY LINK_FLAGS "${PTHREAD_LDFLAGS} ${LIBUECC_LDFLAGS_OTHER} ${NACL_LDFLAGS_OTHER} ${JSON_C_LDFLAGS_OTHER} ${LDFLAGS_LTO}")
- set_property(TARGET fastd APPEND PROPERTY INCLUDE_DIRECTORIES ${LIBCAP_INCLUDE_DIR} ${NACL_INCLUDE_DIRS} ${JSON_C_INCLUDE_DIR})
-+if(ENABLE_LTO)
-+	set_target_properties(fastd PROPERTIES
-+		INTERPROCEDURAL_OPTIMIZATION ON
-+	)
-+else(ENABLE_LTO)
-+	set_target_properties(fastd PROPERTIES
-+		INTERPROCEDURAL_OPTIMIZATION OFF
-+	)
-+endif(ENABLE_LTO)
- target_link_libraries(fastd protocols methods ciphers macs ${RT_LIBRARY} ${LIBCAP_LIBRARY} ${LIBUECC_LIBRARIES} ${NACL_LIBRARIES} ${OPENSSL_CRYPTO_LIBRARY} ${JSON_C_LIBRARIES})
- 
- add_dependencies(fastd version)
--- 
-2.1.4
-
diff --git a/package/fastd/0002-receive-fix-buffer-leak-when-receiving-invalid-packets.patch b/package/fastd/0002-receive-fix-buffer-leak-when-receiving-invalid-packets.patch
deleted file mode 100644
index f4a44fea6d..0000000000
--- a/package/fastd/0002-receive-fix-buffer-leak-when-receiving-invalid-packets.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 737925113363b6130879729cdff9ccc46c33eaea Mon Sep 17 00:00:00 2001
-From: Matthias Schiffer <mschiffer@universe-factory.net>
-Date: Mon, 19 Oct 2020 21:08:16 +0200
-Subject: [PATCH] receive: fix buffer leak when receiving invalid packets
-
-For fastd versions before v20, this was just a memory leak (which could
-still be used for DoS, as it's remotely triggerable). With the new
-buffer management of fastd v20, this will trigger an assertion failure
-instead as soon as the buffer pool is empty.
-
-[Retrieved from:
-https://github.com/NeoRaider/fastd/commit/737925113363b6130879729cdff9ccc46c33eaea]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/receive.c | 10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/src/receive.c b/src/receive.c
-index 043c9f2..6bca9f4 100644
---- a/src/receive.c
-+++ b/src/receive.c
-@@ -169,6 +169,11 @@ static inline void handle_socket_receive_known(
- 
- 	case PACKET_HANDSHAKE:
- 		fastd_handshake_handle(sock, local_addr, remote_addr, peer, buffer);
-+		break;
-+
-+	default:
-+		fastd_buffer_free(buffer);
-+		pr_debug("received packet with invalid type from %P[%I]", peer, remote_addr);
- 	}
- }
- 
-@@ -195,6 +200,11 @@ static inline void handle_socket_receive_unknown(
- 
- 	case PACKET_HANDSHAKE:
- 		fastd_handshake_handle(sock, local_addr, remote_addr, NULL, buffer);
-+		break;
-+
-+	default:
-+		fastd_buffer_free(buffer);
-+		pr_debug("received packet with invalid type from unknown address %I", remote_addr);
- 	}
- }
- 
diff --git a/package/fastd/fastd.hash b/package/fastd/fastd.hash
index 2c75ea09e9..b59085e0ee 100644
--- a/package/fastd/fastd.hash
+++ b/package/fastd/fastd.hash
@@ -1,3 +1,3 @@
 # computed locally
-sha256  6054608e2103b634c9d19ecd1ae058d4ec694747047130719db180578729783a  fastd-19.tar.xz
+sha256  942f33bcd794bcb8e19da4c30c875bdfd4d0f1c24ec4dcdf51237791bbfb0d4c  fastd-21.tar.xz
 sha256  1f5acece57466eac89108f934a196be09b7676fa2d637e78d6657ee1a7d644ac  COPYRIGHT
diff --git a/package/fastd/fastd.mk b/package/fastd/fastd.mk
index 43d3c242f3..bbec63d963 100644
--- a/package/fastd/fastd.mk
+++ b/package/fastd/fastd.mk
@@ -4,48 +4,44 @@
 #
 ################################################################################
 
-FASTD_VERSION = 19
+FASTD_VERSION = 21
 FASTD_SITE = https://github.com/NeoRaider/fastd/releases/download/v$(FASTD_VERSION)
 FASTD_SOURCE = fastd-$(FASTD_VERSION).tar.xz
 FASTD_LICENSE = BSD-2-Clause
 FASTD_LICENSE_FILES = COPYRIGHT
-FASTD_CONF_OPTS = -DENABLE_LIBSODIUM=ON
 FASTD_DEPENDENCIES = host-bison host-pkgconf libuecc libsodium
 
-# 0002-receive-fix-buffer-leak-when-receiving-invalid-packets.patch
-FASTD_IGNORE_CVES += CVE-2020-27638
-
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
-FASTD_CONF_OPTS += -DWITH_CAPABILITIES=ON
+FASTD_CONF_OPTS += -Dcapabilities=enabled
 FASTD_DEPENDENCIES += libcap
 else
-FASTD_CONF_OPTS += -DWITH_CAPABILITIES=OFF
+FASTD_CONF_OPTS += -Dcapabilities=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-FASTD_CONF_OPTS += -DENABLE_OPENSSL=ON
+FASTD_CONF_OPTS += -Dcipher_aes128-ctr=enabled
 FASTD_DEPENDENCIES += openssl
 else
-FASTD_CONF_OPTS += -DENABLE_OPENSSL=OFF
+FASTD_CONF_OPTS += -Dcipher_aes128-ctr=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_FASTD_STATUS_SOCKET),y)
-FASTD_CONF_OPTS += -DWITH_STATUS_SOCKET=ON
+FASTD_CONF_OPTS += -Dstatus_socket=enabled
 FASTD_DEPENDENCIES += json-c
 else
-FASTD_CONF_OPTS += -DWITH_STATUS_SOCKET=OFF
+FASTD_CONF_OPTS += -Dstatus_socket=disabled
 endif
 
 ifeq ($(BR2_INIT_SYSTEMD),y)
-FASTD_CONF_OPTS += -DENABLE_SYSTEMD=ON
+FASTD_CONF_OPTS += -Dsystemd=enabled
 else
-FASTD_CONF_OPTS += -DENABLE_SYSTEMD=OFF
+FASTD_CONF_OPTS += -Dsystemd=disabled
 endif
 
 ifeq ($(BR2_GCC_ENABLE_LTO),y)
-FASTD_CONF_OPTS += -DENABLE_LTO=ON
+FASTD_CONF_OPTS += -Db_lto=true
 else
-FASTD_CONF_OPTS += -DENABLE_LTO=OFF
+FASTD_CONF_OPTS += -Db_lto=false
 endif
 
-$(eval $(cmake-package))
+$(eval $(meson-package))
-- 
2.28.0
