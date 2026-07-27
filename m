Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8113C53219
	for <buildroot@archiver.kernel.org>; Mon, 27 Jul 2026 11:50:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 732EE606E7;
	Mon, 27 Jul 2026 11:50:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HE1KkVKGdFf2; Mon, 27 Jul 2026 11:50:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45005606C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785153054;
	bh=AJk31hyFujhbUVBcCXcwZxxBM6j2jebmB61LRXE8pzY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=p4duGC8wJgR73nL0AvCJSjwhSwjcxEePkbnG+12C9wX6zZhSv0TLCJgaKoIf3qpUk
	 BYHBhQrernfUBJjbr3imXLubhX+zrKFMR6XSsqTbKQLimOYErDBC8Z3ZqbnZN4QTYI
	 EryGp2KGNomOYUjblX9j8Kp0Xg9nJo2FxkvErUN7lx2YjhQYui/6O3h8r5cN2umt36
	 Y+q9cmUU0qQoL39AnovSdJbOLuUeFPVcxUpyKpmkGzC48WxKzc4EDNVbawR/8CO4EM
	 6sa7A+CtQSyzCyzyLrtn8mdcDQNBxDkd/1/zZtn8GHNCW3b0J0Z5yQCuRRok6rvIee
	 HUEaNZEtzzC3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45005606C7;
	Mon, 27 Jul 2026 11:50:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B14426C
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 11:50:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 208B380D47
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 11:50:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8OMlNACprG19 for <buildroot@buildroot.org>;
 Mon, 27 Jul 2026 11:50:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 186A380D5C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 186A380D5C
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 186A380D5C
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 11:50:49 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-49553515a8bso30800105e9.1
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 04:50:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785153048; x=1785757848;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=TRJiVAF8pxfQxJno4TblnUOTbVP9nfjs3t8X519vGBY=;
 b=arBPAsGyXhtpNDdkxWV/p8CE3Kpzk3/3BCorQ3sljh597Tg3omWdLWjOf8YhTKQj6i
 C54IrOKIlBFtFhoW9yxFFZ8A/n1Aao8X1noROSKb0bq5/vRpXGJJBQgb4XoPnELRx3O5
 oc7pk57MhZjNbHlP53VUI6ByC3pMOD7G6mRY2nzmsroDyOjLyhRhRjKcrExOcRLeUxKr
 nVEBBRmZYQvdcSt7+rUv+rNZ35JHfyHcPwOz/VbSn6fN7+PIrlfjL90jBjZZugK+GRt7
 ad3mbjxzxmIeto9wsd3D74nKZwgIRqGmKAMAXiPP6FNAUjYkbP8OcM4BH9dsDII7Ndni
 YbSg==
X-Gm-Message-State: AOJu0YygBBA3ScfIinv2gFqrTQpjm6T6GbtxOY5hGa01oCfrdvadenIP
 hXgvpEVWgjN/jaXSmIVMJxd/CtVQyj7xOIPNZLC34Q/IsrDU/PeRjKX+cDFE1BumjueSOolCcUB
 nK3+0
X-Gm-Gg: AR+sD13c/YG0HDCFIavRLNSlK05rKEqJWRMZ/zgFfdIcUOVEimsmzCNe9cLBtJL3Wc9
 C+maLpO7WEJhQxz26dsEVf6vxsdS9R1exqQkunNV3Ue6Ne1x6Ds3Rw5GE5gXTEJQO6/LFegYjOV
 IjZyWOh4haTk5Fu/vg7oVl/gAFuuYeDikxS2j5O5egZJUMMk/8pnldxuQ+9H8cZswz5h0aqJNE3
 kwjOsur0SeUWpK01kVC1hHOTipXeYQomq8jwBAlwzyrP8KpkdzF5DogmY4ndekEpaghf985h4m3
 gyzrNtnSj/MNU2TmhbhxyJAum8BHnJGKilVsWEUWRNSqM4opKdDo2iJk1zZ1dwQbnt7C9vKIN+u
 UuuwBKteeSyGbNuaH08z5fKAxI/H0d6CLU0+zy7I6nXcdfACcJZ3OQF5XQaThPUcZcGjC8jjyQe
 hV4xgfZ1aMnnqvclk8XXsgJ+bA+NSqS8eaApQdRMR9YzBOYS5G7MpaBD0=
X-Received: by 2002:a05:600c:4f89:b0:493:bb29:af40 with SMTP id
 5b1f17b1804b1-496b790695dmr95475465e9.14.1785153047880; 
 Mon, 27 Jul 2026 04:50:47 -0700 (PDT)
Received: from dragon (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4957bffc501sm194132155e9.4.2026.07.27.04.50.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2026 04:50:47 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Daniel Price <daniel.price@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>
Date: Mon, 27 Jul 2026 13:50:34 +0200
Message-ID: <20260727115034.35048-3-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260727115034.35048-1-titouan.christophe@mind.be>
References: <20260727115034.35048-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1785153048; x=1785757848; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=TRJiVAF8pxfQxJno4TblnUOTbVP9nfjs3t8X519vGBY=;
 b=EkbUvNAmmZm9iPptg0uX+ToFKEL6T3cMaiD5YYavZLdMnSLKOxR5Xla29qMVn02iis
 buFGBYi+zUiELGMFqBUsiojheIdhIZTyFJg//2xpf5Yt/HOgiBiZq4k+0gBMF30pymNr
 xSQm0gC7U7Atq3chSOmaoCSdGRAFAqJT4rXm5lrOr3R5xOKGs7ET8it7Qxgi8RCJzOOf
 LycQLf/dnPooU73XRl5uZQyVtcl2cBEpPT4YVVD7XJtVP8o6CZ4gvHaZ/CLitFgeBhdl
 9yRMXsSU3pTkJLPQHVM/LOcPFFqmPA34P4dAxv3fIwbuxkgFIAMrYssvOKJMS3ePyqmh
 ipUQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=EkbUvNAm
Subject: [Buildroot] [PATCH] package/redis: security bump to v8.8.1
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See the release notes:
https://github.com/redis/redis/blob/8.8.1/00-RELEASENOTES

This fixes the following vulnerability:

- Crafted RESTORE payloads in RedisBloom and TDigest may trigger
  out-of-bounds writes, potentially leading to remote code execution

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 00aa3e4497..e6ba97290b 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  88422181efb0c9c0abba332e3e391d409e1e13714b838931669235e5796f704b  redis-8.8.0.tar.gz
+sha256  1d1e423c9c808de3cb01dd3300d2b8d305b7691382e31a847ec17b66d3157477  redis-8.8.1.tar.gz
 
 # Locally calculated
 sha256  4a0e416b9537688f30dfe69ddaceb2ca64d96b7df02a0a6760d376890ddc4e40  LICENSE.txt
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index a876c56f08..7829aa6143 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 8.8.0
+REDIS_VERSION = 8.8.1
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = \
 	AGPL-3.0 or SSPL-1.0 or RSAL-2.0 (core); \
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
