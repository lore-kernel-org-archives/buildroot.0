Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80CE9C43458
	for <buildroot@archiver.kernel.org>; Mon, 29 Jun 2026 07:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A155D60AEF;
	Mon, 29 Jun 2026 07:24:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id him4bPM9Bgkr; Mon, 29 Jun 2026 07:24:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDE7D60AA9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782717884;
	bh=oYzAZ2Hp+ZUVsQ15UwHZF9LLysJT6FgAiHPQcdEscmw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BiCyz6Y+IKSCr+gJ3/u6v4yjdWXTWzoxTUDFA0I6qsfRavz5rjclJNGqrNQrJlMq/
	 NX66GygzmEIbM1Bkcl1VNDjTjGd0xJV5jxQ8iuZBjxa5mBh9CT2ia6a8pDXD85uXE6
	 oc88Byy/v+FEVhFWaZq815os8ZcVlvF2u2oZTv51WJcJI4CFu2Xqh4cRargU1Vci06
	 q14BnBAkZjGD2rwTOKxf6dnUq8tay5io+G1r63ROJUQq55VulaEKVBCUov6JSn4Pgu
	 1y7dtUX/3D8kDaPRcP16OBu5vAgpnNqdxjw1kabgSzVQXJ1+dJj2QN2OkwuQ0i8lTc
	 kI2D9VWrfuyQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDE7D60AA9;
	Mon, 29 Jun 2026 07:24:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 17772264
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 07:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0946140CB9
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 07:24:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MGLyWJdF6C5z for <buildroot@buildroot.org>;
 Mon, 29 Jun 2026 07:24:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.241.56.171;
 helo=mout-p-201.mailbox.org; envelope-from=daniel@kipshagen.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0774940B87
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0774940B87
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0774940B87
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 07:24:42 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gpd8636ZDz9tv4;
 Mon, 29 Jun 2026 09:24:38 +0200 (CEST)
From: daniel@kipshagen.com
To: buildroot@buildroot.org
Cc: Francois Perrad <francois.perrad@gadz.org>,
 Daniel Kipshagen <daniel@kipshagen.com>
Date: Mon, 29 Jun 2026 09:24:24 +0200
Message-Id: <20260629072424.172-1-daniel@kipshagen.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kipshagen.com; s=MBO0001; t=1782717878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=4bqB8rbkv/bNtoo2VmKZt6NgCLORs0fs4QsIOtuL+GM=;
 b=X5g7SEFi46pzbq5/3kbQeATcKU4wIMxblQpkYbKz6INYk/eujbN73BboNzQ1hkPbEGbzNv
 255vmSLDR6nrbUroY6QRhuEmug5O4djUUgFqv98jtxEDeV0ckQeqcEIjqhbmMqQWHBlQ+f
 t+kiq3KSqZ2fGxu4zrJ7GCxlpZhuVZg/M8x5R2Tv8WXsYOEUhOfn7AJmpf+OFkeS4p7OGH
 914wHEZR+YOP1NSUEB31PIE03ASKm9Pgkwa/y5OypfW3tXpmKBu6CtO1AT+LSRDGcQ1Axx
 AcaxksyYwZ7tijmg/6JCdnIx3M5mp3borhGsIH4CxoyCfMaOBM+ntLT8bClfQg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kipshagen.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kipshagen.com header.i=@kipshagen.com
 header.a=rsa-sha256 header.s=MBO0001 header.b=X5g7SEFi
Subject: [Buildroot] [PATCH] package/lua: fix BR2_PACKAGE_LUA_32BITS for
 Lua5.4
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

From: Daniel Kipshagen <daniel@kipshagen.com>

Lua 5.4 changed the way 32 bit lua is configured to define LUA_32BITS as
0 by default instead of leaving it commented out (see commit
dee6433a89b088a1f8da9531a92a2a2693e5dac7 in lua project),
which broke the sed in lua.mk. This resulted in lua5.4 not being
compiled as 32 bit.

This patch updates the sed to replace both versions of luaconf.h
so that 32 bit is configured. Tested with luaconf.h from lua 5.3
and 5.4.

Signed-off-by: Daniel Kipshagen <daniel@kipshagen.com>
---
 package/lua/lua.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 269eafe4bb..bbff2f2e70 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -67,7 +67,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_LUA_32BITS),y)
 define LUA_32BITS_LUACONF
-	$(SED) 's/\/\* #define LUA_32BITS \*\//#define LUA_32BITS/' $(@D)/src/luaconf.h
+	$(SED)  -e 's@/\* #define LUA_32BITS \*/@#define LUA_32BITS 1@' \
+		-e 's@#define LUA_32BITS[[:space:]]\+0@#define LUA_32BITS 1@' \
+		$(@D)/src/luaconf.h
 endef
 
 LUA_POST_PATCH_HOOKS += LUA_32BITS_LUACONF
-- 
2.33.1.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
