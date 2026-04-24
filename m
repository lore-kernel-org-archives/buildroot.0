Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14189FED3CC
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 13:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD1778479D;
	Fri, 24 Apr 2026 13:36:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I9O-Nec8y2QS; Fri, 24 Apr 2026 13:36:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3583384692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777037778;
	bh=2Nrx7DNsUMXxQ/1fjg7TytxEtnNEf3zj9OcAoPng0bk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Zamiu8C9UjLohlshvlHKOis3IOwPs9ssL7OM0ipBifOiODt1Jj9GCqyELqFvj5iS3
	 RahdNq8N16Xa/ZqwNwR7ZkXDAwXmv0xWp9Nmep17Sn8JOTqby+oNe2gezUJ6dfQIg6
	 1vvxPv17Z/E9ITlaFCV2j/ZIFEUvHqsDdRA6ThnPeoKBiJo4zmNFZ6c7M8d2UOEfIh
	 iO+g4oa/hgbpAj0o5IYu4Rb3MupE/2wNGoTP9TJfIvcEJClaAUejb1a+IfpEWmXC/J
	 bqWffqFG5b5T7gkQT+WnWihF1oWmVt/9TkBgaZKEuuBgu6LZMutyFA6xozYnj825h4
	 1/ezWRYCjOhhw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3583384692;
	Fri, 24 Apr 2026 13:36:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8862B206
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 13:36:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 79E2B61AFA
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 13:36:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OTmPHimCcX9h for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 13:36:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=jeanmichel.hautbois@yoseli.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7E73961AFD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E73961AFD
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E73961AFD
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 13:36:05 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 6C51B5834FE
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 13:23:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 08EFE3EC2C;
 Fri, 24 Apr 2026 13:23:38 +0000 (UTC)
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
To: buildroot@buildroot.org
Date: Fri, 24 Apr 2026 15:23:21 +0200
Message-Id: <20260424132326.825570-7-jeanmichel.hautbois@yoseli.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260424132326.825570-1-jeanmichel.hautbois@yoseli.org>
References: <20260424132326.825570-1-jeanmichel.hautbois@yoseli.org>
MIME-Version: 1.0
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: dmFkZTFzyjFUCDCqfqQMANVK54121/dpjJcklBDr2aY0SQnEiDGYI+sdxNosxexLF7zgvGi/0S9J3MFBLa1UMw+3lC8h+5TY+3VZcJ+Z0W0Zc6kwPhHWbSfKSRLJ3YuT0AQ+dkguxsrpXxYxGwZVQWkvhFYMbbk/kq2zmCaSGUnvH3vbroFmTLsW67TWGK/iccCe+cL18Atr0ku2+Chn2Y0HJvPg6NFXBrJuwMpsfLfP48H0ZjfPTmflDMKpBgsXVNYmHf/4w6ZaoQgaVFAwq2AEPN6/L4o9B3/zUqB7wzns9pmv361LiKwts7DgcCHSqbKV8Q6PiARPsxz/T/i4U8W5cDG+X6SVClTQP8WUXQsoooqX7x7rCkpwPemtlmQB8azaSWPly6/BzirwrccOvwjG2DoP8NBoRsupSXfdclc0eObiOhNV5aNAoyXtB0WKotAooXWJS2rUhe7fG/N/ViMT803906nGW1Z6sreuhy3RL/Gs2VF8riuDaF9Wgr3JFlDkkmN+HMym4D6U4ZuRuL9LxAUp6L/XvlpRzw9jZv8MjmZ+HMH3JFTkeZsXb6g/RD4tkM43sOcSPichgcIj9T8BO36H1Vre3UOaldYHVKxLhqhIGgAvyzAtoZPL4zrh2M+McJBrFO6IjjkTKNPJF71bwTPtzdmHY8O3fe2shnU2soGrLw
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yoseli.org; s=gm1; t=1777037020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4CxbMxkRda62KRjeYAe2p2oh1Oh3zqi1ZUXJSf216Tk=;
 b=o8Lzqj1gFb4Ox+ejp9/bYC9+cC5UjSK0UZdimNSpx3Cox7SgXfkCvLkcNn7eoL6n3Lt7Gx
 xPocz0ek4710QbVrFkWo43mZCe5WvZ+YsOlmNwZ8vNRhnmNc87kkC+VBuy+mrEKshokZMh
 jeUQ8kbuxSSoWuMkj+iJXstF2x0SsdSpgTyNEI7blfL1V7wkn7SidtcHmaPO61Cx64uz3o
 RMmooqKRbM/s6+mkz9Rx+Dca7bb/79X/v2B+JWMNNLSNddJWfokStZGjDEz7MNpgDIAFYU
 YllqTrc/7rr6vBtmxMyMhq3MfuvqEdNuv1XdjXLqhgpIUZbd0HXOJ0P4trsllQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=yoseli.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=yoseli.org header.i=@yoseli.org header.a=rsa-sha256
 header.s=gm1 header.b=o8Lzqj1g
Subject: [Buildroot] [PATCH 06/11] package/libopenssl: extend m68k ColdFire
 support
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Ismael Luceno <ismael@iodev.co.uk>, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ColdFire has no hardware atomic instructions. Disable OpenSSL's
atomic operations and inline assembly which assume a different m68k
variant, and add -fno-strict-aliasing to prevent GCC from optimizing
away type-punned pointer accesses used in OpenSSL internals.

Link with libatomic for the 64-bit atomic operations that OpenSSL 3.x
requires, and force the linux-generic32 target to avoid arch-specific
assembly paths.

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
 package/libopenssl/libopenssl.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index bd4b889c88..6009cbb345 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -23,6 +23,9 @@ ifeq ($(BR2_m68k_cf),y)
 LIBOPENSSL_CFLAGS += -mxgot
 # resolves an assembler "out of range error" with blake2 and sha512 algorithms
 LIBOPENSSL_CFLAGS += -DOPENSSL_SMALL_FOOTPRINT
+LIBOPENSSL_CFLAGS += -DOPENSSL_NO_ATOMICS -DOPENSSL_NO_ASM -fno-strict-aliasing
+LIBOPENSSL_CONF_ENV += LDFLAGS="-latomic"
+LIBOPENSSL_TARGET_ARCH = linux-generic32
 endif
 
 ifeq ($(BR2_USE_MMU),)
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
