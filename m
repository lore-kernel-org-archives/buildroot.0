Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E9C6C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 20:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18D7C41FEA;
	Mon,  6 Nov 2023 20:47:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18D7C41FEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kRCDZ8dE5vDZ; Mon,  6 Nov 2023 20:47:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5265D41FAA;
	Mon,  6 Nov 2023 20:47:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5265D41FAA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1069C1BF3A4
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 20:47:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DAF1340103
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 20:47:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAF1340103
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id myGDxWUDEDfk for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 20:47:23 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6368D41599
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 20:47:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6368D41599
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40891d38e3fso34670185e9.1
 for <buildroot@buildroot.org>; Mon, 06 Nov 2023 12:47:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699303640; x=1699908440;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oFSsMZ4Oi9F/Go0NUw5/kYtc6tjeiP5C2u6RMA8edFk=;
 b=HAcsC63N5qaMVrsgLxBLt/u/yRKRZwV6GjhztClzEezKxTEi846jQ9x0mZ4pIt04Pn
 l0zwttRMW2P0swX53cWfq/sQnDOCGD7LmICzEvZFB5ev2w+s54xZryGaicos01WOYE2k
 QRUBe4WP3DnDzvaoerlp/2+wyyoFT87gAz8HQmI5kzLZSN8YKth64mzlLQUjPKb/ma/n
 JCg3qluZhJwvyAaOYUZa4oEPhzf8PWT41z0oeV59eTxL+ddYEouRHE+NjXZxbVHilOJX
 H7XBYLo9R52hm3u/Tr1xBw5fyAur+Ze9FqfYBX56ucXTkCdiZjYKrMffV/vpn0yVtdkc
 75Tg==
X-Gm-Message-State: AOJu0YzX6U8gYspzp8WcdFPGG89m7bvBtiHsdxMShKuAyvZBOoioKQwU
 REJkTzXCvHtlT+N750gWH6F8+WeBW40=
X-Google-Smtp-Source: AGHT+IHB4H2DfAFPArmjyhMPXv9NWURVnFjCySG0Ldb6Iu7pSvpbXGLTX5vuBytEKPS7uo/SuwnAnA==
X-Received: by 2002:a05:600c:4754:b0:401:daf2:2735 with SMTP id
 w20-20020a05600c475400b00401daf22735mr692610wmo.31.1699303640260; 
 Mon, 06 Nov 2023 12:47:20 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 12-20020a05600c020c00b004063ea92492sm13366673wmi.22.2023.11.06.12.47.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 12:47:19 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Nov 2023 21:47:15 +0100
Message-ID: <20231106204715.53979-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699303640; x=1699908440; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oFSsMZ4Oi9F/Go0NUw5/kYtc6tjeiP5C2u6RMA8edFk=;
 b=MD0xEUUsEM86+iG9ArLGD4tWwkUWzuipsNflm0L2B/YknPchAzYX7TKIi229l1d1lZ
 pWk/N9qYVjaIp1+bl70QZQlzTDiSG4pTMb+5m4c0mKYTEOj/IfXHE20a0APcum5kzZgo
 s9R455PgmPtkvF919pTz3LAepO3j2F9nOz+lNCaqTInQHdrOalXyxlTSDCodai+s9EhV
 xk3qc+GgyXZqYBjOobC1i7uMjej6BsyBDbKsdhP2omPBUsNchaj0fQA+J2wm0DWlfJHx
 Fv48xjTatAmzsrm3qZycxS0WEaDkeHv0812oGEsLbQUKVwc6sr5tw59ZGEq0x01+KFt+
 RT7g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=MD0xEUUs
Subject: [Buildroot] [PATCH 1/1] package/civetweb: fix build with Lua 5.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with Lua 5.1 raised since bump to
version 1.16 in commit fcc4ea595a07f47c86f4d52084dc1317473d2f40 and
https://github.com/civetweb/civetweb/commit/82ba5a04c9a1ca980d8dfe00c18e086017e8ab25:

/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sh4-buildroot-linux-gnu/13.2.0/../../../../sh4-buildroot-linux-gnu/bin/ld: out/src/third_party/lua_struct.o: in function `luaopen_struct':
lua_struct.c:(.text+0xce4): undefined reference to `luaL_newlib'

Fixes:
 - http://autobuild.buildroot.org/results/7459b504e52f473c5830c0f3c7bffd037f6e1770

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...kefile.in-lua-fix-build-with-Lua-5.1.patch | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 package/civetweb/0001-resources-Makefile.in-lua-fix-build-with-Lua-5.1.patch

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
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
