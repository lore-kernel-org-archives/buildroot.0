Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B5A7C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 21:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA5744188E;
	Mon,  6 Nov 2023 21:06:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA5744188E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZT8LWJ4O3173; Mon,  6 Nov 2023 21:06:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0362341836;
	Mon,  6 Nov 2023 21:06:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0362341836
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E828E1BF336
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:06:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF72D6129E
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:06:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF72D6129E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oM-ZKH4Wdfek for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 21:05:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D161C612A8
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 21:05:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D161C612A8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BFC35869DA; Mon,  6 Nov 2023 21:05:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Nov 2023 22:05:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4ec5e32762757110c26f67c84661841880f94d03
X-Git-Newrev: 55fd656cb29eec570f2f59764454e0e9a29d432a
X-Patchwork-Hint: ignore
Message-Id: <20231106210558.BFC35869DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/civetweb: fix build with Lua 5.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=55fd656cb29eec570f2f59764454e0e9a29d432a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with Lua 5.1 raised since bump to
version 1.16 in commit fcc4ea595a07f47c86f4d52084dc1317473d2f40 and
https://github.com/civetweb/civetweb/commit/82ba5a04c9a1ca980d8dfe00c18e086017e8ab25:

/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sh4-buildroot-linux-gnu/13.2.0/../../../../sh4-buildroot-linux-gnu/bin/ld: out/src/third_party/lua_struct.o: in function `luaopen_struct':
lua_struct.c:(.text+0xce4): undefined reference to `luaL_newlib'

Fixes:
 - http://autobuild.buildroot.org/results/7459b504e52f473c5830c0f3c7bffd037f6e1770

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...es-Makefile.in-lua-fix-build-with-Lua-5.1.patch | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/package/civetweb/0001-resources-Makefile.in-lua-fix-build-with-Lua-5.1.patch b/package/civetweb/0001-resources-Makefile.in-lua-fix-build-with-Lua-5.1.patch
new file mode 100644
index 0000000000..ac9655caf5
--- /dev/null
+++ b/package/civetweb/0001-resources-Makefile.in-lua-fix-build-with-Lua-5.1.patch
@@ -0,0 +1,44 @@
+From 3afcd237e509a6700c449056dcc5b9092af31e6a Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 6 Nov 2023 21:38:02 +0100
+Subject: [PATCH] resources/Makefile.in-lua: fix build with Lua 5.1
+
+Fix the following build failure with Lua 5.1 raised since version 1.16
+and
+https://github.com/civetweb/civetweb/commit/82ba5a04c9a1ca980d8dfe00c18e086017e8ab25:
+
+/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sh4-buildroot-linux-gnu/13.2.0/../../../../sh4-buildroot-linux-gnu/bin/ld: out/src/third_party/lua_struct.o: in function `luaopen_struct':
+lua_struct.c:(.text+0xce4): undefined reference to `luaL_newlib'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/7459b504e52f473c5830c0f3c7bffd037f6e1770
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/civetweb/civetweb/pull/1211
+---
+ resources/Makefile.in-lua | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/resources/Makefile.in-lua b/resources/Makefile.in-lua
+index d3038f66..45f80181 100644
+--- a/resources/Makefile.in-lua
++++ b/resources/Makefile.in-lua
+@@ -150,6 +150,7 @@ CFLAGS += -DUSE_LUA_FILE_SYSTEM
+ #SOURCE_DIRS = $(LFS_DIR)
+ 
+ 
++ifneq ($(WITH_LUA_VERSION), 501)
+ LXX_DIR = src/third_party
+ LXX_SOURCE_FILES = lua_struct.c
+ LXX_SOURCES = $(addprefix $(LXX_DIR)/, $(LXX_SOURCE_FILES))
+@@ -159,6 +160,7 @@ OBJECTS += $(LXX_OBJECTS)
+ CFLAGS += $(LXX_CFLAGS)
+ CFLAGS += -DUSE_LUA_STRUCT
+ #SOURCE_DIRS = $(LXX_DIR)
++endif
+ 
+ 
+ ifneq ($(WITH_LUA_VERSION), 501)
+-- 
+2.42.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
