Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4191DC3ABC3
	for <buildroot@archiver.kernel.org>; Wed, 14 May 2025 02:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3DBE81209;
	Wed, 14 May 2025 02:23:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S2cgd3cKM-Le; Wed, 14 May 2025 02:23:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2598F8112B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2598F8112B;
	Wed, 14 May 2025 02:23:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C61DD12A
 for <buildroot@buildroot.org>; Wed, 14 May 2025 02:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B509840DC4
 for <buildroot@buildroot.org>; Wed, 14 May 2025 02:23:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BgpF5hdsLBAd for <buildroot@buildroot.org>;
 Wed, 14 May 2025 02:23:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::129; helo=mail-il1-x129.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 11C5340DDD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11C5340DDD
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 11C5340DDD
 for <buildroot@buildroot.org>; Wed, 14 May 2025 02:23:31 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-3da8e1259dfso21205035ab.3
 for <buildroot@buildroot.org>; Tue, 13 May 2025 19:23:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747189411; x=1747794211;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Nzn7weSQIekRtL1U3faGR88Euf61a0FeguGIJznuoC8=;
 b=FK9LnflCG/FeTzw5OwMXkW0DUUiH4z2qI36jd5uaHl+mqFWmqDolbagBmmvjX2jjDI
 uKo5sIWp8m5xj3ncTej4DE+n3IJu75CPB2D55RA02TArcH0puP2g6O+wVmTnzw1FDCc0
 8A0dWZ7uOKgcgcokaasPj2Awp7khOt5N44oTOhnuVch3pGtthWqI8xQGLxvM+JoDEjQO
 P2L7FoIIokj4FVAl+xV4lkx3vh65Rbqib1S9uu4K+LLA7hhPh+aYxWYQPyQtj7ucwo9m
 BA33ToR1MJ6CK01Q2CRUzdO7KByGL/0THO34hiyZzwaVwDScjq/FPmwaoJgPTM5Jlu9U
 H7fA==
X-Gm-Message-State: AOJu0YyISJYhhT792kTpFIKarD3gd9GrtuDC4NjPyzTlA8OO+0imHo+L
 UD4NgtCCIbnzdsEcGjNpSeejy2V96RqGbJugTyeT+RO5ocupxL8R9S2G1hTr
X-Gm-Gg: ASbGncsy9kTOLAlJTgOcWgAeFpYMyQhJKtfGXJWVhMQC/q4ZueR/Y5pgTWxekyCIbJa
 2PQOFv1PNTMWev+YBMn4Y6+P5XGJ6pou9DQY6tsaJaRTmMgT0k386EUyKhQawtDQYaepExsrO+H
 gpmKUFu3vHh/aqAx52nd1MSjEDquKxEjV9iYiq8wNvNoOz/EkI81wJ28m2ylIhxaHTSBF4OfB10
 MgKUr7sPcRDz0Rk5+bKAPSfTyvfLuL0iDLe531MuxD+g/5enkpWWgSRud9jXMxjM9GWgolc9keh
 OHjluJ5N52ixP7RrDEp3MYJyrGEhoJAAOX4exmPtH1KZfT2rGR4n0kPNJsSthTFb+CkutZU4GNA
 YTh2ZG9Uw6PCsXgvsfysIu5JckCi9BQ==
X-Google-Smtp-Source: AGHT+IE6I13OnsqCjmIPx4BIBFpYenweA0/w7ac3S1BSp9dgNMYZMGp8XzpzN4mbJCeR5+7ipLeSGQ==
X-Received: by 2002:a05:6e02:3f12:b0:3d8:1f87:9431 with SMTP id
 e9e14a558f8ab-3db6f7bcfe5mr27207365ab.12.1747189410775; 
 Tue, 13 May 2025 19:23:30 -0700 (PDT)
Received: from james-x399.localdomain (71-218-120-130.hlrn.qwest.net.
 [71.218.120.130]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3da7e0f90b1sm31619655ab.12.2025.05.13.19.23.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 May 2025 19:23:30 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 13 May 2025 20:23:27 -0600
Message-Id: <20250514022327.583983-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747189411; x=1747794211; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Nzn7weSQIekRtL1U3faGR88Euf61a0FeguGIJznuoC8=;
 b=iXsO67/T8BiPtAkHi7UrFv4wc7VJxhtayiIeLZ/fIY5CURkvKsh15E186MoRom3sCP
 POZ5RXVuqpB9TuDyQo4Tcw+9mn5W+3sI420l1XQcfAEUGaBqgDEQI9MGdylqPdjZbaqh
 lW9j9qu+xKTOqsvRHAuBEZ3RGgwOK4FolTR7Csd+4Rbx1BAmejyeIU6QOntyCEeQ2PMF
 Xn1lRuLn5/kdGIZ1vuf3Noa/9vY1HtgZM4L5gYK27aO6ECcxv0ozHjwTecTDpDCdAlVN
 uY0yZfpCI8JKsBB7VUzXJLCKd4HqbHm/1xz9R7raHcJARhb06GAgZ6BNaIx783KN5YtI
 YSZQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=iXsO67/T
Subject: [Buildroot] [PATCH 1/1] package/shadowsocks-libev: bump to version
 v3.3.5-53-g9afa3cacf947f910be46b69fc5a7a1fdd02fd5e6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package has received quite a few updates but doesn't seem to be
making releases anymore.

Quite a few of these updates will be needed for compatibility with
newer mbedtls versions for example.

Lets switch to a git describe based version for now.

Drop patches which are now upstream as well.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .checkpackageignore                           |  4 +-
 ...-pkg-config-to-find-netfilter_conntr.patch | 62 -------------
 ...efile.am-remove-static-from-LDFLAGS.patch} |  0
 .../0002-fix-maybe-uninitialized-errors.patch | 93 -------------------
 .../shadowsocks-libev/shadowsocks-libev.hash  |  2 +-
 .../shadowsocks-libev/shadowsocks-libev.mk    |  8 +-
 6 files changed, 8 insertions(+), 161 deletions(-)
 delete mode 100644 package/shadowsocks-libev/0001-configure.ac-use-pkg-config-to-find-netfilter_conntr.patch
 rename package/shadowsocks-libev/{0003-lib-Makefile.am-remove-static-from-LDFLAGS.patch => 0001-lib-Makefile.am-remove-static-from-LDFLAGS.patch} (100%)
 delete mode 100644 package/shadowsocks-libev/0002-fix-maybe-uninitialized-errors.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index cc6e1c2fd5..67b30bea9d 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1082,9 +1082,7 @@ package/ser2net/S50ser2net Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/setools/0001-Do-not-export-use-setools.InfoFlowAnalysis-and-setoo.patch lib_patch.Upstream
 package/setserial/0001-build-system-fix.patch lib_patch.Upstream
 package/setserial/0002-tiocghayesesp-build-fix.patch lib_patch.Upstream
-package/shadowsocks-libev/0001-configure.ac-use-pkg-config-to-find-netfilter_conntr.patch lib_patch.Upstream
-package/shadowsocks-libev/0002-fix-maybe-uninitialized-errors.patch lib_patch.Upstream
-package/shadowsocks-libev/0003-lib-Makefile.am-remove-static-from-LDFLAGS.patch lib_patch.Upstream
+package/shadowsocks-libev/0001-lib-Makefile.am-remove-static-from-LDFLAGS.patch lib_patch.Upstream
 package/shairport-sync/S99shairport-sync Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/shared-mime-info/0001-Remove-incorrect-dependency-from-install-data-hook.patch lib_patch.Upstream
 package/shellinabox/0001-Makefile-disable-always-building-statically.patch lib_patch.Upstream
diff --git a/package/shadowsocks-libev/0001-configure.ac-use-pkg-config-to-find-netfilter_conntr.patch b/package/shadowsocks-libev/0001-configure.ac-use-pkg-config-to-find-netfilter_conntr.patch
deleted file mode 100644
index 781d3c0e64..0000000000
--- a/package/shadowsocks-libev/0001-configure.ac-use-pkg-config-to-find-netfilter_conntr.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From b3c61360a93b7f08fc9c33526056211408301ea9 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 23 Nov 2020 21:16:38 +0100
-Subject: [PATCH] configure.ac: use pkg-config to find netfilter_conntrack
-
-Use pkg-config to retrieve the dependencies of netfilter_conntrack
-and avoid the following build failure when building statically:
-
-configure:13096: /data/buildroot-test/instance-1/output-1/host/bin/x86_64-linux-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -static -I/data/buildroot-test/instance-1/output-1/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include -DPCRE_STATIC -pthread -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -static -L/data/buildroot-test/instance-1/output-1/host/x86_64-buildroot-linux-uclibc/sysroot/usr/lib conftest.c -lnetfilter_conntrack -lnfnetlink -lev  -lcares -lsodium -lmbedcrypto -lpcre  >&5
-/data/buildroot-test/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/8.3.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: /data/buildroot-test/instance-1/output-1/host/x86_64-buildroot-linux-uclibc/sysroot/usr/lib/libnetfilter_conntrack.a(api.o): in function `nfct_fill_hdr.constprop.4':
-api.c:(.text+0x3f): undefined reference to `mnl_nlmsg_put_header'
-
-Fixes:
- - http://autobuild.buildroot.org/results/6cad497a7ab941a0ee3fd7007defc81e30cdcbe0
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://github.com/shadowsocks/shadowsocks-libev/pull/2773]
----
- configure.ac    | 5 +++--
- src/Makefile.am | 2 +-
- 2 files changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 9787bc2..207c041 100755
---- a/configure.ac
-+++ b/configure.ac
-@@ -252,7 +252,8 @@ AC_ARG_ENABLE(connmarktos,
- if test x"$enable_connmarktos" = "xyes" ; then
- 	AC_MSG_NOTICE([Linux Netfilter Conntrack support requested by --enable-connmarktos: ${enable_connmarktos}])
- 	if test "x$enable_connmarktos" != "xno"; then
--	    AC_SEARCH_LIBS([nfct_query], [netfilter_conntrack],,[
-+	    PKG_CHECK_MODULES([NETFILTER_CONNTRACK], [libnetfilter_conntrack],,
-+	    [AC_SEARCH_LIBS([nfct_query], [netfilter_conntrack],,[
- 	        if test x"$enable_connmarktos" = "xyes"; then
- 	            AC_MSG_ERROR([--enable-connmarktos specified but libnetfilter-conntrack library not found])
- 	        fi
-@@ -262,7 +263,7 @@ if test x"$enable_connmarktos" = "xyes" ; then
- 	        if test x"$enable_connmarktos" = "xyes"; then
- 	            AC_MSG_ERROR([--enable-connmarktos specified but libnetfilter-conntrack headers not found])
- 	        fi
--	        with_netfilter_conntrack=no])
-+	        with_netfilter_conntrack=no])])
- 	  # If nothing is broken; enable the libraries usage.
- 	  if test "x$with_netfilter_conntrack" != "xno"; then
- 		with_netfilter_conntrack=yes
-diff --git a/src/Makefile.am b/src/Makefile.am
-index c261ed0..b81ced7 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -9,7 +9,7 @@ AM_CFLAGS += -I$(top_srcdir)/libcork/include
- endif
- AM_CFLAGS += $(LIBPCRE_CFLAGS)
- 
--SS_COMMON_LIBS = $(INET_NTOP_LIB) $(LIBPCRE_LIBS)
-+SS_COMMON_LIBS = $(INET_NTOP_LIB) $(LIBPCRE_LIBS) $(NETFILTER_CONNTRACK_LIBS)
- if !USE_SYSTEM_SHARED_LIB
- SS_COMMON_LIBS += $(top_builddir)/libbloom/libbloom.la \
-                   $(top_builddir)/libipset/libipset.la \
--- 
-2.29.2
-
diff --git a/package/shadowsocks-libev/0003-lib-Makefile.am-remove-static-from-LDFLAGS.patch b/package/shadowsocks-libev/0001-lib-Makefile.am-remove-static-from-LDFLAGS.patch
similarity index 100%
rename from package/shadowsocks-libev/0003-lib-Makefile.am-remove-static-from-LDFLAGS.patch
rename to package/shadowsocks-libev/0001-lib-Makefile.am-remove-static-from-LDFLAGS.patch
diff --git a/package/shadowsocks-libev/0002-fix-maybe-uninitialized-errors.patch b/package/shadowsocks-libev/0002-fix-maybe-uninitialized-errors.patch
deleted file mode 100644
index 5275323e65..0000000000
--- a/package/shadowsocks-libev/0002-fix-maybe-uninitialized-errors.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-From 0c23224e926463b1097414979367655a27fa6d60 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 7 Apr 2022 18:27:58 +0200
-Subject: [PATCH] fix maybe-uninitialized errors
-
-Set {listen,server}_sock to -1 when needed as already done in
-src/manager.c by commit ecf1fcc84594b09ed2d61e3677cd8e62bd897ccb to
-avoid the following build failure:
-
-local.c: In function 'create_and_bind':
-local.c:218:12: error: 'listen_sock' may be used uninitialized in this function [-Werror=maybe-uninitialized]
-  218 |     return listen_sock;
-      |            ^~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/27471a878ff52a972ac087d534e44fb0c50808f6
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/shadowsocks/shadowsocks-libev/commit/0c23224e926463b1097414979367655a27fa6d60]
----
- src/local.c    | 2 +-
- src/redir.c    | 2 +-
- src/server.c   | 2 +-
- src/tunnel.c   | 2 +-
- src/udprelay.c | 2 +-
- 5 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/src/local.c b/src/local.c
-index b1ab040bb..47d634ce5 100644
---- a/src/local.c
-+++ b/src/local.c
-@@ -168,7 +168,7 @@ create_and_bind(const char *addr, const char *port)
- {
-     struct addrinfo hints;
-     struct addrinfo *result, *rp;
--    int s, listen_sock;
-+    int s, listen_sock = -1;
- 
-     memset(&hints, 0, sizeof(struct addrinfo));
-     hints.ai_family   = AF_UNSPEC;   /* Return IPv4 and IPv6 choices */
-diff --git a/src/redir.c b/src/redir.c
-index 4a5a489f0..e60bd4870 100644
---- a/src/redir.c
-+++ b/src/redir.c
-@@ -147,7 +147,7 @@ create_and_bind(const char *addr, const char *port)
- {
-     struct addrinfo hints;
-     struct addrinfo *result, *rp;
--    int s, listen_sock;
-+    int s, listen_sock = -1;
- 
-     memset(&hints, 0, sizeof(struct addrinfo));
-     hints.ai_family   = AF_UNSPEC;   /* Return IPv4 and IPv6 choices */
-diff --git a/src/server.c b/src/server.c
-index e9cdc2619..073e38b22 100644
---- a/src/server.c
-+++ b/src/server.c
-@@ -550,7 +550,7 @@ create_and_bind(const char *host, const char *port, int mptcp)
- {
-     struct addrinfo hints;
-     struct addrinfo *result, *rp, *ipv4v6bindall;
--    int s, listen_sock;
-+    int s, listen_sock = -1;
- 
-     memset(&hints, 0, sizeof(struct addrinfo));
-     hints.ai_family   = AF_UNSPEC;               /* Return IPv4 and IPv6 choices */
-diff --git a/src/tunnel.c b/src/tunnel.c
-index e0886bdb9..6641fe62a 100644
---- a/src/tunnel.c
-+++ b/src/tunnel.c
-@@ -129,7 +129,7 @@ create_and_bind(const char *addr, const char *port)
- {
-     struct addrinfo hints;
-     struct addrinfo *result, *rp;
--    int s, listen_sock;
-+    int s, listen_sock = -1;
- 
-     memset(&hints, 0, sizeof(struct addrinfo));
-     hints.ai_family   = AF_UNSPEC;   /* Return IPv4 and IPv6 choices */
-diff --git a/src/udprelay.c b/src/udprelay.c
-index 23a042497..580ad4bd8 100644
---- a/src/udprelay.c
-+++ b/src/udprelay.c
-@@ -446,7 +446,7 @@ create_server_socket(const char *host, const char *port)
- {
-     struct addrinfo hints;
-     struct addrinfo *result, *rp, *ipv4v6bindall;
--    int s, server_sock;
-+    int s, server_sock = -1;
- 
-     memset(&hints, 0, sizeof(struct addrinfo));
-     hints.ai_family   = AF_UNSPEC;               /* Return IPv4 and IPv6 choices */
diff --git a/package/shadowsocks-libev/shadowsocks-libev.hash b/package/shadowsocks-libev/shadowsocks-libev.hash
index 4f1d6d2fa5..8834c0e7ac 100644
--- a/package/shadowsocks-libev/shadowsocks-libev.hash
+++ b/package/shadowsocks-libev/shadowsocks-libev.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  cfc8eded35360f4b67e18dc447b0c00cddb29cc57a3cec48b135e5fb87433488  shadowsocks-libev-3.3.5.tar.gz
+sha256  804a4711f5e41cea91eee676817a87c0da1b145c5c6b72925d723f1ac1598812  shadowsocks-libev-v3.3.5-53-g9afa3cacf947f910be46b69fc5a7a1fdd02fd5e6-git4.tar.gz
 
 # License files, locally calculated
 sha256  736883f97d44dbec288bb82819f18f4f86d02ae3192f6a9abefa00db76bace41  COPYING
diff --git a/package/shadowsocks-libev/shadowsocks-libev.mk b/package/shadowsocks-libev/shadowsocks-libev.mk
index c76983ce5e..f03087ccd0 100644
--- a/package/shadowsocks-libev/shadowsocks-libev.mk
+++ b/package/shadowsocks-libev/shadowsocks-libev.mk
@@ -4,8 +4,12 @@
 #
 ################################################################################
 
-SHADOWSOCKS_LIBEV_VERSION = 3.3.5
-SHADOWSOCKS_LIBEV_SITE = https://github.com/shadowsocks/shadowsocks-libev/releases/download/v$(SHADOWSOCKS_LIBEV_VERSION)
+# Generate version string using:
+#   git describe --tags --match 'v3.3.5' --abbrev=40 origin/master
+SHADOWSOCKS_LIBEV_VERSION = v3.3.5-53-g9afa3cacf947f910be46b69fc5a7a1fdd02fd5e6
+SHADOWSOCKS_LIBEV_SITE = https://github.com/shadowsocks/shadowsocks-libev
+SHADOWSOCKS_LIBEV_SITE_METHOD = git
+SHADOWSOCKS_LIBEV_GIT_SUBMODULES = YES
 SHADOWSOCKS_LIBEV_LICENSE = GPL-3.0+, BSD-2-Clause (libbloom), BSD-3-Clause (libcork, libipset)
 SHADOWSOCKS_LIBEV_LICENSE_FILES = COPYING libbloom/LICENSE libcork/COPYING
 SHADOWSOCKS_LIBEV_CPE_ID_VENDOR = shadowsocks
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
