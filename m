From: Alexander Dahl <post@lespocky.de>
Date: Fri,  1 Apr 2016 08:39:46 +0200
Subject: [Buildroot] [PATCH 2/2] fastd: bump to v18
In-Reply-To: <1459492786-14594-1-git-send-email-post@lespocky.de>
References: <1459492786-14594-1-git-send-email-post@lespocky.de>
Message-ID: <1459492786-14594-3-git-send-email-post@lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes at http://fastd.readthedocs.org/en/v18/releases/v18.html

First patch rebased, second patch removed (gone upstream).

Signed-off-by: Alexander Dahl <post@lespocky.de>
---
I did not try to remove the first patch. Upstream removed
CMakeFindBinUtils.cmake which caused build problems IIRC. However I'd
like to stick for the CMake way on activating LTO instead of setting
those flags manually assuming we have a gcc understanding those
options, so I adapted the patch instead of removing it. However this
is open for discussion. I would also be okay with dropping the patch
in disabling LTO for this package in general.
---
 ...NTERPROCEDURAL_OPTIMIZATION-target-proper.patch |  33 +--
 .../0002-Don-t-depend-on-net-if_ether.h.patch      | 261 ---------------------
 package/fastd/fastd.mk                             |   2 +-
 3 files changed, 10 insertions(+), 286 deletions(-)
 delete mode 100644 package/fastd/0002-Don-t-depend-on-net-if_ether.h.patch

diff --git a/package/fastd/0001-cmake-use-INTERPROCEDURAL_OPTIMIZATION-target-proper.patch b/package/fastd/0001-cmake-use-INTERPROCEDURAL_OPTIMIZATION-target-proper.patch
index 99d20c6..489c726 100644
--- a/package/fastd/0001-cmake-use-INTERPROCEDURAL_OPTIMIZATION-target-proper.patch
+++ b/package/fastd/0001-cmake-use-INTERPROCEDURAL_OPTIMIZATION-target-proper.patch
@@ -15,27 +15,12 @@ have very few space left on devices with only 4 MB flash memory.
 
 Signed-off-by: Alexander Dahl <post@lespocky.de>
 ---
- cmake/CMakeFindBinUtils.cmake |  7 -------
- cmake/checks.cmake            | 14 --------------
- src/CMakeLists.txt            |  9 +++++++++
- 3 files changed, 9 insertions(+), 21 deletions(-)
- delete mode 100644 cmake/CMakeFindBinUtils.cmake
+ cmake/checks.cmake | 14 --------------
+ src/CMakeLists.txt |  9 +++++++++
+ 2 files changed, 9 insertions(+), 14 deletions(-)
 
-diff --git a/cmake/CMakeFindBinUtils.cmake b/cmake/CMakeFindBinUtils.cmake
-deleted file mode 100644
-index 753577a..0000000
---- a/cmake/CMakeFindBinUtils.cmake
-+++ /dev/null
-@@ -1,7 +0,0 @@
--if(CMAKE_COMPILER_IS_GNUCC)
--  find_program(CMAKE_AR NAMES ${_CMAKE_TOOLCHAIN_PREFIX}gcc-ar HINTS ${_CMAKE_TOOLCHAIN_LOCATION})
--  find_program(CMAKE_NM NAMES ${_CMAKE_TOOLCHAIN_PREFIX}gcc-nm HINTS ${_CMAKE_TOOLCHAIN_LOCATION})
--  find_program(CMAKE_RANLIB NAMES ${_CMAKE_TOOLCHAIN_PREFIX}gcc-ranlib HINTS ${_CMAKE_TOOLCHAIN_LOCATION})
--endif(CMAKE_COMPILER_IS_GNUCC)
--
--include(${CMAKE_ROOT}/Modules/CMakeFindBinUtils.cmake)
 diff --git a/cmake/checks.cmake b/cmake/checks.cmake
-index f9f0399..3c1f38b 100644
+index 27c073f..8a671a1 100644
 --- a/cmake/checks.cmake
 +++ b/cmake/checks.cmake
 @@ -10,20 +10,6 @@ if(ARCH_X86 OR ARCH_X86_64)
@@ -60,13 +45,13 @@ index f9f0399..3c1f38b 100644
  #include <sys/types.h>
  #include <sys/socket.h>
 diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index e7dd5d1..4991656 100644
+index 829b3ab..7612b40 100644
 --- a/src/CMakeLists.txt
 +++ b/src/CMakeLists.txt
-@@ -47,6 +47,15 @@ add_executable(fastd
+@@ -48,6 +48,15 @@ add_executable(fastd
  set_property(TARGET fastd PROPERTY COMPILE_FLAGS "${FASTD_CFLAGS}")
- set_property(TARGET fastd PROPERTY LINK_FLAGS "${PTHREAD_LDFLAGS} ${UECC_LDFLAGS_OTHER} ${NACL_LDFLAGS_OTHER} ${OPENSSL_CRYPTO_LDFLAGS_OTHER} ${JSONC_LDFLAGS_OTHER} ${LDFLAGS_LTO}")
- set_property(TARGET fastd APPEND PROPERTY INCLUDE_DIRECTORIES ${CAP_INCLUDE_DIR} ${NACL_INCLUDE_DIRS} ${JSONC_INCLUDE_DIRS})
+ set_property(TARGET fastd PROPERTY LINK_FLAGS "${PTHREAD_LDFLAGS} ${LIBUECC_LDFLAGS_OTHER} ${NACL_LDFLAGS_OTHER} ${JSON_C_LDFLAGS_OTHER} ${LDFLAGS_LTO}")
+ set_property(TARGET fastd APPEND PROPERTY INCLUDE_DIRECTORIES ${LIBCAP_INCLUDE_DIR} ${NACL_INCLUDE_DIRS} ${JSON_C_INCLUDE_DIR})
 +if(ENABLE_LTO)
 +	set_target_properties(fastd PROPERTIES
 +		INTERPROCEDURAL_OPTIMIZATION ON
@@ -76,7 +61,7 @@ index e7dd5d1..4991656 100644
 +		INTERPROCEDURAL_OPTIMIZATION OFF
 +	)
 +endif(ENABLE_LTO)
- target_link_libraries(fastd protocols methods ciphers macs ${RT_LIBRARY} ${CAP_LIBRARY} ${UECC_LIBRARIES} ${NACL_LIBRARIES} ${OPENSSL_CRYPTO_LIBRARIES} ${JSONC_LIBRARIES})
+ target_link_libraries(fastd protocols methods ciphers macs ${RT_LIBRARY} ${LIBCAP_LIBRARY} ${LIBUECC_LIBRARIES} ${NACL_LIBRARIES} ${OPENSSL_CRYPTO_LIBRARY} ${JSON_C_LIBRARIES})
  
  add_dependencies(fastd version)
 -- 
diff --git a/package/fastd/0002-Don-t-depend-on-net-if_ether.h.patch b/package/fastd/0002-Don-t-depend-on-net-if_ether.h.patch
deleted file mode 100644
index 9036ae5..0000000
--- a/package/fastd/0002-Don-t-depend-on-net-if_ether.h.patch
+++ /dev/null
@@ -1,261 +0,0 @@
-From 8ed750311482824e427db3b8b2cec6842ea8bc96 Mon Sep 17 00:00:00 2001
-From: Matthias Schiffer <mschiffer@universe-factory.net>
-Date: Thu, 25 Jun 2015 01:03:23 +0200
-Subject: [PATCH] Don't depend on net/if_ether.h
-
-Instead of adding compatiblity code to make this work with musl, just
-duplicate the needed definitions in fastd.
-
-[Backport from upstream commit 9ac7f3588dda7d175e04878e7b871a88306d13bf.
-Fixes missing 'sys/queue.h' issue when building with musl.]
-
-Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
----
- cmake/checks.cmake    |  5 -----
- src/compat.h          | 22 ----------------------
- src/config.y          |  1 +
- src/fastd.h           | 15 +++++++++++----
- src/fastd_config.h.in |  3 ---
- src/log.c             |  2 +-
- src/peer.c            |  7 ++++---
- src/receive.c         |  2 +-
- src/send.c            |  2 +-
- src/socket.c          |  2 ++
- src/status.c          |  1 +
- src/types.h           |  1 +
- 12 files changed, 23 insertions(+), 40 deletions(-)
-
-diff --git a/cmake/checks.cmake b/cmake/checks.cmake
-index f9f0399..62d52ff 100644
---- a/cmake/checks.cmake
-+++ b/cmake/checks.cmake
-@@ -54,11 +54,6 @@ if(NOT DARWIN)
- endif(NOT DARWIN)
- 
- 
--set(CMAKE_EXTRA_INCLUDE_FILES "netinet/if_ether.h")
--check_type_size("struct ethhdr" SIZEOF_ETHHDR)
--string(COMPARE NOTEQUAL "${SIZEOF_ETHHDR}" "" HAVE_ETHHDR)
--
--
- set(CMAKE_REQUIRED_INCLUDES "sys/types.h")
- 
- if(NOT DARWIN)
-diff --git a/src/compat.h b/src/compat.h
-index 991c268..29c9253 100644
---- a/src/compat.h
-+++ b/src/compat.h
-@@ -39,32 +39,10 @@
- #include <unistd.h>
- 
- #include <sys/types.h>
--#include <sys/queue.h>
- #include <sys/socket.h>
- 
--#include <net/if.h>
--#include <net/if_arp.h>
- #include <netinet/in.h>
--#include <netinet/if_ether.h>
- 
--#ifndef ETH_ALEN
--/** The length of a MAC address */
--#define ETH_ALEN 6
--#endif
--
--#ifndef ETH_HLEN
--/** The length of the standard ethernet header */
--#define ETH_HLEN 14
--#endif
--
--#ifndef HAVE_ETHHDR
--/** An ethernet header */
--struct ethhdr {
--	uint8_t h_dest[ETH_ALEN];			/**< The destination MAC address field */
--	uint8_t h_source[ETH_ALEN];			/**< The source MAC address field */
--	uint16_t h_proto;				/**< The EtherType/length field */
--} __attribute__((packed));
--#endif
- 
- #if defined(USE_FREEBIND) && !defined(IP_FREEBIND)
- /** Compatiblity define for systems supporting, but not defining IP_FREEBIND */
-diff --git a/src/config.y b/src/config.y
-index f2f597f..5b00d7c 100644
---- a/src/config.y
-+++ b/src/config.y
-@@ -33,6 +33,7 @@
- %code requires {
- 	#include <src/fastd.h>
- 	#include <arpa/inet.h>
-+	#include <net/if.h>
- }
- 
- %union {
-diff --git a/src/fastd.h b/src/fastd.h
-index f1b2f93..ec2316b 100644
---- a/src/fastd.h
-+++ b/src/fastd.h
-@@ -58,7 +58,14 @@
- 
- /** An ethernet address */
- struct __attribute__((__packed__)) fastd_eth_addr {
--	uint8_t data[ETH_ALEN];		/**< The bytes of the address */
-+	uint8_t data[6];		/**< The bytes of the address */
-+};
-+
-+/** An ethernet header */
-+struct  __attribute__((packed)) fastd_eth_header {
-+	fastd_eth_addr_t dest;		/**< The destination MAC address field */
-+	fastd_eth_addr_t source;	/**< The source MAC address field */
-+	uint16_t proto;			/**< The EtherType/length field */
- };
- 
- 
-@@ -408,7 +415,7 @@ static inline void fastd_setnonblock(int fd) {
- static inline size_t fastd_max_payload(void) {
- 	switch (conf.mode) {
- 	case MODE_TAP:
--		return conf.mtu+ETH_HLEN;
-+		return conf.mtu + sizeof(fastd_eth_header_t);
- 	case MODE_TUN:
- 		return conf.mtu;
- 	default:
-@@ -420,14 +427,14 @@ static inline size_t fastd_max_payload(void) {
- /** Returns the source address of an ethernet packet */
- static inline fastd_eth_addr_t fastd_buffer_source_address(const fastd_buffer_t buffer) {
- 	fastd_eth_addr_t ret;
--	memcpy(&ret, buffer.data+offsetof(struct ethhdr, h_source), ETH_ALEN);
-+	memcpy(&ret, buffer.data + offsetof(fastd_eth_header_t, source), sizeof(fastd_eth_addr_t));
- 	return ret;
- }
- 
- /** Returns the destination address of an ethernet packet */
- static inline fastd_eth_addr_t fastd_buffer_dest_address(const fastd_buffer_t buffer) {
- 	fastd_eth_addr_t ret;
--	memcpy(&ret, buffer.data+offsetof(struct ethhdr, h_dest), ETH_ALEN);
-+	memcpy(&ret, buffer.data + offsetof(fastd_eth_header_t, dest), sizeof(fastd_eth_addr_t));
- 	return ret;
- }
- 
-diff --git a/src/fastd_config.h.in b/src/fastd_config.h.in
-index 6a55930..5f9c868 100644
---- a/src/fastd_config.h.in
-+++ b/src/fastd_config.h.in
-@@ -35,9 +35,6 @@
- /** Defined if the platform supports the AI_ADDRCONFIG flag to getaddrinfo() */
- #cmakedefine HAVE_AI_ADDRCONFIG
- 
--/** Defined if the platform defines the \e ethhdr struct */
--#cmakedefine HAVE_ETHHDR
--
- /** Defined if the platform defines get_current_dir_name() */
- #cmakedefine HAVE_GET_CURRENT_DIR_NAME
- 
-diff --git a/src/log.c b/src/log.c
-index 7d1538a..0727bbb 100644
---- a/src/log.c
-+++ b/src/log.c
-@@ -74,7 +74,7 @@ size_t fastd_snprint_peer_address(char *buffer, size_t size, const fastd_peer_ad
- 		if (!bind_address && hide)
- 			return snprintf_safe(buffer, size, "[hidden]:%u", ntohs(address->in6.sin6_port));
- 		if (inet_ntop(AF_INET6, &address->in6.sin6_addr, addr_buf, sizeof(addr_buf))) {
--			char ifname_buf[IF_NAMESIZE];
-+			char ifname_buf[IFNAMSIZ];
- 			if (!iface && IN6_IS_ADDR_LINKLOCAL(&address->in6.sin6_addr))
- 				iface = if_indextoname(address->in6.sin6_scope_id, ifname_buf);
- 
-diff --git a/src/peer.c b/src/peer.c
-index 9ce5ca2..3313112 100644
---- a/src/peer.c
-+++ b/src/peer.c
-@@ -34,13 +34,14 @@
- #include "poll.h"
- 
- #include <arpa/inet.h>
-+#include <net/if.h>
- #include <sys/wait.h>
- 
- 
- /** Adds peer-specific fields to \e env */
- void fastd_peer_set_shell_env(fastd_shell_env_t *env, const fastd_peer_t *peer, const fastd_peer_address_t *local_addr, const fastd_peer_address_t *peer_addr) {
--	/* both INET6_ADDRSTRLEN and IFNAMESIZE already include space for the zero termination, so there is no need to add space for the '%' here. */
--	char buf[INET6_ADDRSTRLEN+IF_NAMESIZE];
-+	/* both INET6_ADDRSTRLEN and IFNAMSIZ already include space for the zero termination, so there is no need to add space for the '%' here. */
-+	char buf[INET6_ADDRSTRLEN+IFNAMSIZ];
- 
- 	fastd_shell_env_set(env, "PEER_NAME", peer ? peer->name : NULL);
- 
-@@ -850,7 +851,7 @@ void fastd_peer_set_established(fastd_peer_t *peer) {
- 
- /** Compares two MAC addresses */
- static inline int eth_addr_cmp(const fastd_eth_addr_t *addr1, const fastd_eth_addr_t *addr2) {
--	return memcmp(addr1->data, addr2->data, ETH_ALEN);
-+	return memcmp(addr1->data, addr2->data, sizeof(fastd_eth_addr_t));
- }
- 
- /** Compares two fastd_peer_eth_addr_t entries by their MAC addresses */
-diff --git a/src/receive.c b/src/receive.c
-index 2ee402a..6db5cfd 100644
---- a/src/receive.c
-+++ b/src/receive.c
-@@ -289,7 +289,7 @@ void fastd_receive(fastd_socket_t *sock) {
- /** Handles a received and decrypted payload packet */
- void fastd_handle_receive(fastd_peer_t *peer, fastd_buffer_t buffer, bool reordered) {
- 	if (conf.mode == MODE_TAP) {
--		if (buffer.len < ETH_HLEN) {
-+		if (buffer.len < sizeof(fastd_eth_header_t)) {
- 			pr_debug("received truncated packet");
- 			fastd_buffer_free(buffer);
- 			return;
-diff --git a/src/send.c b/src/send.c
-index caa7312..6d9f66f 100644
---- a/src/send.c
-+++ b/src/send.c
-@@ -209,7 +209,7 @@ static inline bool send_data_tap_single(fastd_buffer_t buffer, fastd_peer_t *sou
- 	if (conf.mode != MODE_TAP)
- 		return false;
- 
--	if (buffer.len < ETH_HLEN) {
-+	if (buffer.len < sizeof(fastd_eth_header_t)) {
- 		pr_debug("truncated ethernet packet");
- 		fastd_buffer_free(buffer);
- 		return true;
-diff --git a/src/socket.c b/src/socket.c
-index e932148..03a11a6 100644
---- a/src/socket.c
-+++ b/src/socket.c
-@@ -32,6 +32,8 @@
- #include "fastd.h"
- #include "poll.h"
- 
-+#include <net/if.h>
-+
- 
- /**
-    Creates a new socket bound to a specific address
-diff --git a/src/status.c b/src/status.c
-index d0b8511..27d6b38 100644
---- a/src/status.c
-+++ b/src/status.c
-@@ -39,6 +39,7 @@
- #include "peer.h"
- 
- #include <json.h>
-+#include <net/if.h>
- #include <sys/un.h>
- 
- 
-diff --git a/src/types.h b/src/types.h
-index f380541..b684621 100644
---- a/src/types.h
-+++ b/src/types.h
-@@ -87,6 +87,7 @@ typedef struct fastd_bind_address fastd_bind_address_t;
- typedef struct fastd_socket fastd_socket_t;
- typedef struct fastd_peer_group fastd_peer_group_t;
- typedef struct fastd_eth_addr fastd_eth_addr_t;
-+typedef struct fastd_eth_header fastd_eth_header_t;
- typedef struct fastd_peer fastd_peer_t;
- typedef struct fastd_peer_eth_addr fastd_peer_eth_addr_t;
- typedef struct fastd_remote fastd_remote_t;
--- 
-2.1.4
-
diff --git a/package/fastd/fastd.mk b/package/fastd/fastd.mk
index 4c2626f..72f4e0d 100644
--- a/package/fastd/fastd.mk
+++ b/package/fastd/fastd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FASTD_VERSION = v17
+FASTD_VERSION = v18
 FASTD_SITE = git://git.universe-factory.net/fastd
 FASTD_LICENSE = BSD-2c
 FASTD_LICENSE_FILES = COPYRIGHT
-- 
2.1.4
