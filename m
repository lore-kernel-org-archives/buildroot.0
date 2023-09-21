Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC13DE7D0A7
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 19:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84A9582EF1;
	Thu, 21 Sep 2023 19:45:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84A9582EF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wv4Gg2iMi8tN; Thu, 21 Sep 2023 19:45:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F92F82BF5;
	Thu, 21 Sep 2023 19:45:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F92F82BF5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 537B21BF990
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 19:44:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A56840235
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 19:44:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A56840235
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C01FQOa40VIV for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 19:44:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A25D74010F
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 19:44:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A25D74010F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A66E87516; Thu, 21 Sep 2023 19:44:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Sep 2023 21:40:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c6e40c2e3e450bc8018638acf937868757ab28a4
X-Git-Newrev: 5724145b1e7c70e44cc1b5befa3f11198bf497c7
X-Patchwork-Hint: ignore
Message-Id: <20230921194453.8A66E87516@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libuv: needs gcc >= 4.9
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5724145b1e7c70e44cc1b5befa3f11198bf497c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libuv unconditionally uses stdatomic since
https://github.com/libuv/libuv/commit/2f33980a9141bd49cb2c34361854355b23b1e6fc
resulting in the following build failure with gcc < 4.9 since bump to
version 1.45.0 in commit 21764235cb7f7fb767ea4b5d825e39c711aee235:

In file included from src/fs-poll.c:23:0:
src/uv-common.h:41:24: fatal error: stdatomic.h: No such file or directory
 # include <stdatomic.h>
                        ^

Fixes:
 - http://autobuild.buildroot.org/results/6b9ce25ba7e5c5602313d533f460f8829f767f81

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/bind/Config.in          | 6 ++++--
 package/cmake/Config.in         | 6 +++---
 package/libuv/Config.in         | 6 ++++--
 package/luv/Config.in           | 6 ++++--
 package/luvi/Config.in          | 6 ++++--
 package/moarvm/Config.in        | 6 ++++--
 package/netdata/Config.in       | 6 ++++--
 package/python-uvloop/Config.in | 6 ++++--
 package/ttyd/Config.in          | 6 ++++--
 package/wampcc/Config.in        | 6 ++++--
 package/xmrig/Config.in         | 6 ++++--
 11 files changed, 43 insertions(+), 23 deletions(-)

diff --git a/package/bind/Config.in b/package/bind/Config.in
index 63ccd57db7..512e948ca2 100644
--- a/package/bind/Config.in
+++ b/package/bind/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_BIND
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
 	depends on !BR2_STATIC_LIBS # libuv
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libuv
 	select BR2_PACKAGE_LIBUV
 	select BR2_PACKAGE_OPENSSL
 	help
@@ -43,7 +44,8 @@ config BR2_PACKAGE_BIND_TOOLS
 
 endif
 
-comment "bind needs a toolchain w/ NPTL, dynamic library"
+comment "bind needs a toolchain w/ NPTL, dynamic library, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/cmake/Config.in b/package/cmake/Config.in
index 4ef5612b57..00692fe78a 100644
--- a/package/cmake/Config.in
+++ b/package/cmake/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_CMAKE
 config BR2_PACKAGE_CMAKE_CTEST
 	bool "ctest"
 	depends on BR2_PACKAGE_CMAKE_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # from jsoncpp
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # jsoncpp, libuv
 	depends on BR2_USE_WCHAR # libarchive
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
@@ -40,10 +40,10 @@ config BR2_PACKAGE_CMAKE_CTEST
 
 	  http://www.cmake.org/
 
-comment "ctest needs a toolchain w/ C++, wchar, dynamic library, gcc >= 4.7, NPTL"
+comment "ctest needs a toolchain w/ C++, wchar, dynamic library, gcc >= 4.9, NPTL"
 	depends on BR2_PACKAGE_CMAKE_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
+		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL
diff --git a/package/libuv/Config.in b/package/libuv/Config.in
index cdd73a672f..e23b2c5fe0 100644
--- a/package/libuv/Config.in
+++ b/package/libuv/Config.in
@@ -4,13 +4,15 @@ config BR2_PACKAGE_LIBUV
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h
 	help
 	  libuv is a multi-platform support library with a focus
 	  on asynchronous I/O.
 
 	  https://github.com/libuv/libuv
 
-comment "libuv needs a toolchain w/ NPTL, dynamic library"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
+comment "libuv needs a toolchain w/ NPTL, dynamic library, gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
diff --git a/package/luv/Config.in b/package/luv/Config.in
index 434cb3b459..d6aff8b6f7 100644
--- a/package/luv/Config.in
+++ b/package/luv/Config.in
@@ -4,13 +4,15 @@ config BR2_PACKAGE_LUV
 	depends on BR2_USE_MMU # libuv
 	depends on !BR2_STATIC_LIBS # libuv
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libuv
 	select BR2_PACKAGE_LIBUV
 	help
 	  libuv bindings for LuaJIT and Lua.
 
 	  https://github.com/luvit/luv
 
-comment "luv needs a toolchain w/ NPTL, dynamic library"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
+comment "luv needs a toolchain w/ NPTL, dynamic library, gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
diff --git a/package/luvi/Config.in b/package/luvi/Config.in
index 6e96f85f32..3a724acebb 100644
--- a/package/luvi/Config.in
+++ b/package/luvi/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_LUVI
 	depends on !BR2_STATIC_LIBS # libuv
 	depends on BR2_PACKAGE_LUAJIT
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libuv
 	select BR2_PACKAGE_LIBUV
 	select BR2_PACKAGE_LUV
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
@@ -25,8 +26,9 @@ config BR2_PACKAGE_LUVI
 
 	  https://github.com/luvit/luvi
 
-comment "luvi needs a toolchain w/ NPTL, dynamic library"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
+comment "luvi needs a toolchain w/ NPTL, dynamic library, gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 
diff --git a/package/moarvm/Config.in b/package/moarvm/Config.in
index 11d8ac7ebc..6972a5f8a6 100644
--- a/package/moarvm/Config.in
+++ b/package/moarvm/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_MOARVM
 	depends on BR2_USE_MMU # libuv
 	depends on BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS # libatomic_ops
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libuv
 	select BR2_PACKAGE_LIBUV
 	select BR2_PACKAGE_LIBTOMMATH
 	select BR2_PACKAGE_LIBATOMIC_OPS
@@ -18,8 +19,9 @@ config BR2_PACKAGE_MOARVM
 
 	  http://moarvm.com
 
-comment "moarvm needs a toolchain w/ NPTL, dynamic library"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
+comment "moarvm needs a toolchain w/ NPTL, dynamic library, gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
diff --git a/package/netdata/Config.in b/package/netdata/Config.in
index 34d139125d..d17b5e89aa 100644
--- a/package/netdata/Config.in
+++ b/package/netdata/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_NETDATA
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS # libuv
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libuv
 	select BR2_PACKAGE_LIBUV
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
@@ -35,7 +36,8 @@ comment "prometheus remote write backend needs a toolchain w/ C++, gcc >= 4.8"
 
 endif
 
-comment "netdata needs a toolchain w/ NPTL, dynamic library"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
+comment "netdata needs a toolchain w/ NPTL, dynamic library, gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
diff --git a/package/python-uvloop/Config.in b/package/python-uvloop/Config.in
index b3fb275091..c9a05111cb 100644
--- a/package/python-uvloop/Config.in
+++ b/package/python-uvloop/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_PYTHON_UVLOOP
 	depends on BR2_USE_MMU # libuv
 	depends on !BR2_STATIC_LIBS # libuv
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libuv
 	select BR2_PACKAGE_LIBUV
 	select BR2_PACKAGE_PYTHON3_SSL
 	help
@@ -11,7 +12,8 @@ config BR2_PACKAGE_PYTHON_UVLOOP
 
 	  http://github.com/MagicStack/uvloop
 
-comment "python-uvloop needs a toolchain w/ NPTL, dynamic library"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
+comment "python-uvloop needs a toolchain w/ NPTL, dynamic library, gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_USE_MMU
diff --git a/package/ttyd/Config.in b/package/ttyd/Config.in
index ecc705b17e..103a4ac4aa 100644
--- a/package/ttyd/Config.in
+++ b/package/ttyd/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_TTYD
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv, json-c
 	depends on BR2_USE_MMU # libuv
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libuv
 	select BR2_PACKAGE_JSON_C
 	select BR2_PACKAGE_LIBUV
 	select BR2_PACKAGE_LIBWEBSOCKETS
@@ -15,7 +16,8 @@ config BR2_PACKAGE_TTYD
 
 	  https://github.com/tsl0922/ttyd
 
-comment "ttyd needs a toolchain w/ NPTL, dynamic library"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
+comment "ttyd needs a toolchain w/ NPTL, dynamic library, gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
diff --git a/package/wampcc/Config.in b/package/wampcc/Config.in
index 92abc9cb25..4191936113 100644
--- a/package/wampcc/Config.in
+++ b/package/wampcc/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_WAMPCC
 	depends on !BR2_STATIC_LIBS # libuv
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libuv
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::shared_future
 	select BR2_PACKAGE_LIBUV
 	select BR2_PACKAGE_JANSSON
@@ -16,12 +17,13 @@ config BR2_PACKAGE_WAMPCC
 
 	  https://github.com/darrenjs/wampcc
 
-comment "wampcc needs a toolchain w/ C++, NPTL, dynamic library"
+comment "wampcc needs a toolchain w/ C++, NPTL, dynamic library, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 comment "wampcc needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_USE_MMU
diff --git a/package/xmrig/Config.in b/package/xmrig/Config.in
index 4dd16fa2b0..0b5f5370e4 100644
--- a/package/xmrig/Config.in
+++ b/package/xmrig/Config.in
@@ -15,6 +15,7 @@ config BR2_PACKAGE_XMRIG
 	# xmrig needs fenv.h which is not provided by uclibc
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC
 	depends on !BR2_STATIC_LIBS # libuv
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libuv
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_LIBUV
 	help
@@ -22,10 +23,11 @@ config BR2_PACKAGE_XMRIG
 
 	  https://xmrig.com
 
-comment "xmrig needs a glibc or musl toolchain w/ NPTL, dynamic library, C++"
+comment "xmrig needs a glibc or musl toolchain w/ NPTL, dynamic library, C++, gcc >= 4.9"
 	depends on BR2_PACKAGE_XMRIG_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		BR2_TOOLCHAIN_USES_UCLIBC || BR2_STATIC_LIBS || \
-		!BR2_INSTALL_LIBSTDCPP
+		!BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
