Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8546BC433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 22:09:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 37968400E9;
	Sat,  4 Dec 2021 22:09:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bvml153039u2; Sat,  4 Dec 2021 22:09:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1AC27401AF;
	Sat,  4 Dec 2021 22:09:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2FF311BF3F7
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 22:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2829B40260
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 22:09:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id my9e29KStrh3 for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 22:09:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7121400E9
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 22:09:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 8381E935CD; Sat,  4 Dec 2021 22:04:11 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 23:05:24 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 570b6deff906c24e6609c46ce69e00d9e8be04fc
X-Git-Newrev: abd6f2d69b4cc5a7e9bca79638cfc2f7977ec518
X-Patchwork-Hint: ignore
Message-Id: <20211204220411.8381E935CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/easyframes: bump to
 version 0.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=abd6f2d69b4cc5a7e9bca79638cfc2f7977ec518
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Drop patches (already in version)
- Update indentation in hash file (two spaces)

https://github.com/microchip-ung/easyframes/releases/tag/v0.4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...MakesLists.txt-fix-static-build-with-pcap.patch | 57 --------------
 .../0002-Fix-different-compiling-issues.patch      | 91 ----------------------
 package/easyframes/easyframes.hash                 |  4 +-
 package/easyframes/easyframes.mk                   |  2 +-
 4 files changed, 3 insertions(+), 151 deletions(-)

diff --git a/package/easyframes/0001-CMakesLists.txt-fix-static-build-with-pcap.patch b/package/easyframes/0001-CMakesLists.txt-fix-static-build-with-pcap.patch
deleted file mode 100644
index 3f13613e9d..0000000000
--- a/package/easyframes/0001-CMakesLists.txt-fix-static-build-with-pcap.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 89ad9c143825b13d028c2f1713d55e83135d5c0f Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 5 Sep 2020 15:38:33 +0200
-Subject: [PATCH] CMakesLists.txt: fix static build with pcap
-
-Use pkg-config to find the dependencies of pcap such as libnl otherwise
-a static-only build will fail on:
-
-[100%] Linking C executable ef
-/srv/storage/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /srv/storage/autobuild/run/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libpcap.a(pcap-linux.o): in function `nl80211_init':
-pcap-linux.c:(.text+0x460): undefined reference to `nl_socket_alloc'
-/srv/storage/autobuild/run/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: pcap-linux.c:(.text+0x498): undefined reference to `genl_connect'
-
-Fixes:
- - http://autobuild.buildroot.org/results/99062bfc8c21c32bc835acae675aede7c9cf0c90
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/microchip-ung/easyframes/pull/2]
----
- CMakeLists.txt | 20 ++++++++++++++------
- 1 file changed, 14 insertions(+), 6 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index a62a950..5be128c 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -7,13 +7,21 @@ include_directories(src)
- 
- 
- set(_LIBPCAP "")
--FIND_PATH(PCAP_INCLUDE_DIR NAMES pcap/pcap.h)
--FIND_LIBRARY(PCAP_LIBRARY NAMES pcap)
--
--if (PCAP_LIBRARY)
-+find_package(PkgConfig)
-+pkg_check_modules(PCAP libpcap)
-+if (PCAP_FOUND)
-     add_definitions(-DHAS_LIBPCAP)
--    include_directories(${PCAP_INCLUDE_DIR})
--    set(_LIBPCAP ${PCAP_LIBRARY})
-+    include_directories(${PCAP_INCLUDE_DIRS})
-+    set(_LIBPCAP ${PCAP_LIBRARIES})
-+else()
-+    FIND_PATH(PCAP_INCLUDE_DIR NAMES pcap/pcap.h)
-+    FIND_LIBRARY(PCAP_LIBRARY NAMES pcap)
-+
-+    if (PCAP_LIBRARY)
-+        add_definitions(-DHAS_LIBPCAP)
-+        include_directories(${PCAP_INCLUDE_DIR})
-+        set(_LIBPCAP ${PCAP_LIBRARY})
-+    endif()
- endif()
- 
- add_library(libef STATIC
--- 
-2.28.0
-
diff --git a/package/easyframes/0002-Fix-different-compiling-issues.patch b/package/easyframes/0002-Fix-different-compiling-issues.patch
deleted file mode 100644
index e4d16a73a5..0000000000
--- a/package/easyframes/0002-Fix-different-compiling-issues.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From d3d179c3c39ec10ec636b325325ad8e18ae9542f Mon Sep 17 00:00:00 2001
-From: Horatiu Vultur <horatiu.vultur@microchip.com>
-Date: Tue, 1 Sep 2020 13:03:47 +0200
-Subject: [PATCH] Fix different compiling issues
-
-[Retrieved from:
-https://github.com/microchip-ung/easyframes/commit/d3d179c3c39ec10ec636b325325ad8e18ae9542f]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/ef-exec.c        | 4 ++--
- src/ef-parse-bytes.c | 8 ++++++--
- src/ef.h             | 4 ++--
- 3 files changed, 10 insertions(+), 6 deletions(-)
-
-diff --git a/src/ef-exec.c b/src/ef-exec.c
-index 3d184a0..824164e 100644
---- a/src/ef-exec.c
-+++ b/src/ef-exec.c
-@@ -108,7 +108,7 @@ int ring_wait_for_init(tpacket_ring *ring) {
- 
- 
- int raw_socket(cmd_socket_t *cmd_socket) {
--    int s, res, val, ifidx;
-+    int s, res, val, ifidx, i;
-     struct sockaddr_ll sa = {};
-     struct packet_mreq mr = {};
- 
-@@ -194,7 +194,7 @@ int raw_socket(cmd_socket_t *cmd_socket) {
-     //
-     // TODO: This does not seem to be needed, if we uses a RX ring buffer
-     // instead (atleast that seems to work for libpcap)
--    for (int i = 0; i < 10000; ++i) {
-+    for (i = 0; i < 10000; ++i) {
-         struct msghdr msg = { 0 };
-         int res = recvmsg(s, &msg, MSG_DONTWAIT);
-         if (res < 0)
-diff --git a/src/ef-parse-bytes.c b/src/ef-parse-bytes.c
-index 1dd590f..1785f45 100644
---- a/src/ef-parse-bytes.c
-+++ b/src/ef-parse-bytes.c
-@@ -2,6 +2,7 @@
- #include <errno.h>
- #include <stdio.h>
- #include <stdlib.h>
-+#include <endian.h>
- #include <arpa/inet.h>
- 
- struct start_with {
-@@ -212,7 +213,9 @@ buf_t *parse_bytes(const char *s, int bytes) {
-     for (s = data_begin; *s; ++s) {
-         int match_found = 0;
-         for (i = 0; i < sizeof(has_chars)/sizeof(has_chars[0]); ++i) {
--            for (const char *set_i = has_chars[i].char_set; *set_i; ++set_i) {
-+            const char *set_i;
-+
-+            for (set_i = has_chars[i].char_set; *set_i; ++set_i) {
-                 if (*s == *set_i) {
-                     has_mask |= has_chars[i].mask;
-                     match_found = 1;
-@@ -313,6 +316,7 @@ buf_t *parse_bytes(const char *s, int bytes) {
-                ((has_mask & ~(HAS_HEX_COL)) == 0) && (has_mask & HAS_COLON)) {
-         // This will be treated as a mac-address
-         uint8_t m[6] = {};
-+        const char *x;
- 
-         // We want to be able to write something like this (like we RFC2373
-         // specifies for IPv6):
-@@ -334,7 +338,7 @@ buf_t *parse_bytes(const char *s, int bytes) {
- 
-         //po("line: %d data_begin: %s\n", __LINE__, data_begin);
- 
--        for (const char *x = data_begin; *x; ++x) {
-+        for (x = data_begin; *x; ++x) {
-             int colon = 0;
-             int val = 0;
- 
-diff --git a/src/ef.h b/src/ef.h
-index 8926c25..f4c1629 100644
---- a/src/ef.h
-+++ b/src/ef.h
-@@ -59,8 +59,8 @@ void bl_check(buf_list_t *b);
- void bl_reset(buf_list_t *b);
- void bset_value(buf_t *b, uint8_t v);
- 
--inline void bl_init(buf_list_t *b) { bl_reset(b); }
--inline void bl_destroy(buf_list_t *b) { bl_reset(b); }
-+static inline void bl_init(buf_list_t *b) { bl_reset(b); }
-+static inline void bl_destroy(buf_list_t *b) { bl_reset(b); }
- 
- int bl_printf_append(buf_list_t *b, const char *format, ...)
-     __attribute__ ((format (printf, 2, 3)));
diff --git a/package/easyframes/easyframes.hash b/package/easyframes/easyframes.hash
index 0f16e0caa1..d9a804aad0 100644
--- a/package/easyframes/easyframes.hash
+++ b/package/easyframes/easyframes.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256 3c0449b3129c29b5ecf67b689f1a75ffc65fde3c5f62811e2f0439ce4f4af392 easyframes-0.3.tar.gz
-sha256 24f37598e822a1411fb7164ce7eb3ef120aea8279016399abc282c2381ce3f57 COPYING
+sha256  0b8f4af8c41b0b1de2529d500aef6b9be7609f25b28e6a863129578a66806e5d  easyframes-0.4.tar.gz
+sha256  24f37598e822a1411fb7164ce7eb3ef120aea8279016399abc282c2381ce3f57  COPYING
diff --git a/package/easyframes/easyframes.mk b/package/easyframes/easyframes.mk
index 1821ce703c..10e1561232 100644
--- a/package/easyframes/easyframes.mk
+++ b/package/easyframes/easyframes.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EASYFRAMES_VERSION = 0.3
+EASYFRAMES_VERSION = 0.4
 EASYFRAMES_SITE = $(call github,microchip-ung,easyframes,v$(EASYFRAMES_VERSION))
 EASYFRAMES_DEPENDENCIES = host-pkgconf libpcap
 EASYFRAMES_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
