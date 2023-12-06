Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B3FC4167B
	for <buildroot@archiver.kernel.org>; Wed,  6 Dec 2023 09:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83CFC41A1C;
	Wed,  6 Dec 2023 09:40:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83CFC41A1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FXvcYtQYeeMn; Wed,  6 Dec 2023 09:40:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50D19435CC;
	Wed,  6 Dec 2023 09:40:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50D19435CC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0B2AB1BF83E
 for <buildroot@lists.busybox.net>; Wed,  6 Dec 2023 09:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D895D81EDE
 for <buildroot@lists.busybox.net>; Wed,  6 Dec 2023 09:39:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D895D81EDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SV-RVDYe28W8 for <buildroot@lists.busybox.net>;
 Wed,  6 Dec 2023 09:39:54 +0000 (UTC)
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E585981CAD
 for <buildroot@busybox.net>; Wed,  6 Dec 2023 09:39:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E585981CAD
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2c9f57d9952so51609081fa.3
 for <buildroot@busybox.net>; Wed, 06 Dec 2023 01:39:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701855592; x=1702460392;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6GUgk60bpHCp9RMjRI+Thk8RjEIQLEfImnEFnH0uhHc=;
 b=DZhZxB903z0+wh001L/OMMEl+GcnlFWTPn8T62BHrDn8OSY4THz0NkampVA5Q+Gsjf
 OdKQ6ADYAnFwxElucADcSIi/zuTsos4YIBPs9kffx9xTMzNlCXb2tsXho2epFkoXdqZF
 nrdkG4GkXbmMXZcmXZxkkIXhfkr10eYeEWxFwxzwOkr9BJ2H8YosppzVuQ67dmIPBp11
 kAruM0qqP24NtDj0F3PfKoi22W3suBoFyyg0kDIp1B7ioay6JzgpjnInqWT3WU05Hwmc
 Xsy4g3Y7wYI6AbR64/uLnXNqpEMtnxRWf1qfvXnh4DO3NBHV0epm65U0hvt13FlwRiqO
 bg5A==
X-Gm-Message-State: AOJu0YwtwPNEu3F8hJcz1fjQ0/wSqs77b0SS9p7GeL4yRz9nHcBxtera
 gQpV6RbxeNb8zfW0vkya9R+0+TO298Q=
X-Google-Smtp-Source: AGHT+IGUnNDBymvcHNZ5yFeLA4NYT7sC9vC6xIjoeIONFpajD3TxGEjcYTE3gvmotEFd5zi+0NVccA==
X-Received: by 2002:a2e:9a8e:0:b0:2c9:f04a:556c with SMTP id
 p14-20020a2e9a8e000000b002c9f04a556cmr361200lji.71.1701855591665; 
 Wed, 06 Dec 2023 01:39:51 -0800 (PST)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 di16-20020a170906731000b00a1b6d503e7esm4265553ejc.157.2023.12.06.01.39.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Dec 2023 01:39:51 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed,  6 Dec 2023 10:39:40 +0100
Message-Id: <20231206093942.1548412-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701855592; x=1702460392; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6GUgk60bpHCp9RMjRI+Thk8RjEIQLEfImnEFnH0uhHc=;
 b=FnRJSj7jLHySPuqBpEqpellw/JnVqvyyeC+f4R5NG0+8zrwDkHyaQY/M7VWEE5SC4e
 OvkoDvYWFWe+WvtUUx+15l0qb/lpTA5aH70H+T+oYiQ/ac7/Gq/AX2EqzjuIqa/rnSee
 BCA9zgGlzjNkYDRBtA4xqj8exAmTrmsbLt8I7sR2kVLD4LTsNJCG0YawuLC/Td7+Qjr0
 IjFiVARP2bkVyRAsPxo+7zmI1WN2CwiITfEOrhwUc4/u1+Vo/xpWnbdLgrrlILKCuYfq
 JbytzdXG8uJXsXNWfsSRIv2NEOi4VbJw923djBRhDJdHw817gAj+EO8a9juDm1bMJHEH
 h/ZQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FnRJSj7j
Subject: [Buildroot] [PATCH 1/3] package/lua-messagepack: bump to version
 0.5.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-messagepack/lua-messagepack.hash | 6 +++---
 package/lua-messagepack/lua-messagepack.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lua-messagepack/lua-messagepack.hash b/package/lua-messagepack/lua-messagepack.hash
index 6c650ce14b..f61a351383 100644
--- a/package/lua-messagepack/lua-messagepack.hash
+++ b/package/lua-messagepack/lua-messagepack.hash
@@ -1,4 +1,4 @@
 # computed by luarocks/buildroot
-sha256  fe39b8ad92acf13f91d8660a04ab8fc9fb5d6370f99304d46cab8137ee9147b8  lua-messagepack-0.5.3-1.src.rock
-sha256  a7c1842ab7404104c941bc71809cd41c7685b4cd5edd4f1925f9cbe434f3ed4a  lua-messagepack-lua53-0.5.3-1.src.rock
-sha256  1dbe8e7da2d71088d4759da33a42eda89f5be90d1a9c0b823360a270d6628ed8  lua-MessagePack-0.5.3/COPYRIGHT
+sha256  86e5aedc94342f1447b3cac26dfacc69f05b0827221cd5e44d3b623087b16f37  lua-messagepack-0.5.4-1.src.rock
+sha256  3ed7ac22e50b06e63f91a16ad6457381af7317f1bccd778f104a4513c1cc118b  lua-messagepack-lua53-0.5.4-1.src.rock
+sha256  1dbe8e7da2d71088d4759da33a42eda89f5be90d1a9c0b823360a270d6628ed8  lua-MessagePack-0.5.4/COPYRIGHT
diff --git a/package/lua-messagepack/lua-messagepack.mk b/package/lua-messagepack/lua-messagepack.mk
index 390f85c6e3..7e5ab006c9 100644
--- a/package/lua-messagepack/lua-messagepack.mk
+++ b/package/lua-messagepack/lua-messagepack.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_MESSAGEPACK_VERSION_UPSTREAM = 0.5.3
+LUA_MESSAGEPACK_VERSION_UPSTREAM = 0.5.4
 LUA_MESSAGEPACK_VERSION = $(LUA_MESSAGEPACK_VERSION_UPSTREAM)-1
 ifeq ($(BR2_PACKAGE_LUA_5_3)$(BR2_PACKAGE_LUA_5_4),y)
 LUA_MESSAGEPACK_NAME_UPSTREAM = lua-MessagePack-lua53
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
