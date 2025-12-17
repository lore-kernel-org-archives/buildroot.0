Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 179BDD68BC2
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 22:38:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC8F440B60;
	Wed, 17 Dec 2025 22:38:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jB4UMCFe-zzd; Wed, 17 Dec 2025 22:38:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 684E440A69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766011104;
	bh=Hxj3+5X2aUUgqrfyHJwXhLxLLwqE9eDRWbwdya7H9Ss=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=lZO18OliBUekayUzmgiR6oj6mHTX2XqYPHyWgHY93lRI3r4rNTbNzHsBOk5YKKplo
	 1QEQpBfbJGQLDx4zVW3imtFvoH6Sv4muFtoVFdUEfBOeuZ3kvjWXrhdHF75iJJLUM6
	 2na338JK7Bv9xejVHSFc6/fXepJudMfVtGqbWIKoO0a83vLDCEmj/nxpG92k11y1tu
	 e7nYc7EIi90nQ0QnonoPRVR8PbUju2Tpwcay/JKKMwZII/oO6QfeeOQ9OVVihW7ZKV
	 mPRskivtN8Rrs8iHT7S8ybw0wPAh+j89PDyAlqawf0VhuUnq9pfJ9XeUR+JMBi2DMT
	 6n9bGUG5oCD2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 684E440A69;
	Wed, 17 Dec 2025 22:38:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 36D9535B
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 22:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 299C140A69
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 22:38:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5YO-kDxEvQ_C for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 22:38:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2863D40A0A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2863D40A0A
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2863D40A0A
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 22:38:20 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-64198771a9bso9435537a12.2
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 14:38:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766011099; x=1766615899;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bjJ5kU2pApWMlXCv9kdKnCyDoLThDYnyhgJlH9Ht5n4=;
 b=wOwIZ/PEgmLbC6XrEl9DyEp2xkamPzhNGrob2HNV047NxwvyRM1qDoWI2Y+YfLijGt
 65gMG2o97pEQlBq0Jq/PVrMCCIUPApLEiXn76xR3vGxsTLVY7P+UpMeMq2VAROvXJExC
 EkyoGoPMs8m9IvqP8yf7INfPrRTbYdOd/96tv/DDVrylAhWRT9WutMqp7J18r+yWXWtl
 Yz+chi+/Y5UGJ1mxKF+AS4g7AQKaZlU3CACdRrezK6yzfk3ovtHjN2RyDMN7IyzBi79q
 5TKSuEnJHer8RFee1NWmmTFKgei/XCFpKIaB6g19mWjyTuUMDxhFjFU/LUowv7jNoEg1
 Gyww==
X-Gm-Message-State: AOJu0YyKtBn0rnfMDEkYYLmPw+3o6UMsE83Du0Y+tzaClD+G3TKIMB8+
 NcosEN4j8qicgBYRyictnyuHfVqrSlDd8CgKb2J6Pjto3BMVvRVRDkFTj+jl5bbf0pDzCHCwkrl
 BPFvH
X-Gm-Gg: AY/fxX4F5RfLGnpyhBfa1PRqajwQeJWiiZWWywh+UtR9WzMmfRDdkxwvxHfkxG3IuaV
 5bR19oxlWYWVeB16Ez58e4ml0M1thpWDe1ZesI1v5EcOcijEQD7PkmIMZHtr+AQqd+Rc+dMeS+x
 cn2yarYfc0JWoYJoy4L8TH91g5+jERmcm8ZJi4slBCHRZVS+xY4D8D/a/88GCRWMm+hIh+pLaOy
 Sjw8/XAyj98loA2pz+aB/4BIaYpZ/ufTUOJIO9aIV9UJB8Seh25UeDKtk5HKKw25k7/dr87ddyt
 Olm4BhzAZKzLFMkzKtjGUC1cgS2yeMxouOcsMFcTWnPVMOziZe6UBK5ouUMoU+VAiGItW4A7GR4
 MNJVe7R9MBOgRE4Dw8mI8UaRhOlh3pCRy5i/IxqTGLBlb5+J8Uy3TShusQj0ClbFzUvSjsosBHk
 ybzdQ6KWcpLo0MPEYE/8KCaG91
X-Google-Smtp-Source: AGHT+IF/knmF5loSq4bfx1gLybtTszyObg2NL/ICTEjF1/jtWgIw+IWOJjnxUv6Ze4vzwCRkL7nSLw==
X-Received: by 2002:a05:6402:5191:b0:649:ce93:fdb9 with SMTP id
 4fb4d7f45d1cf-649ce93fe3dmr11827721a12.19.1766011098917; 
 Wed, 17 Dec 2025 14:38:18 -0800 (PST)
Received: from dragon.home ([2a02:a03f:73a7:c001:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64b585b51a0sm791993a12.4.2025.12.17.14.38.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Dec 2025 14:38:18 -0800 (PST)
To: buildroot@buildroot.org
Cc: Daniel Price <daniel.price@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>
Date: Wed, 17 Dec 2025 23:37:50 +0100
Message-ID: <20251217223750.119857-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1766011099; x=1766615899; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bjJ5kU2pApWMlXCv9kdKnCyDoLThDYnyhgJlH9Ht5n4=;
 b=RszGgzLnX1wGyEZUiVgznWPGoiGx44o/x783G9ZLopxHUvmOHLNNNP4L9v+vr33dnP
 Ub6VtleSf7lDFqPxLl/j/pm8+7iyCtIwhfvStC3V28HuPOrQuozbTC5be7DJvwUMEPFU
 S5w10kzhe0Ug+jmj5zSxfSQKvtsKfi8vwDrjq2n+mfpW/J8hd/bQoig/k+fvtYWSvOzo
 yUKGP9DGqi22QYgMZi1nmRivIXwj6sFSKjkwIxyl2kmiXYeDHz/hENauGO47TKM4ETC3
 JdVKXEStCDwxPAnh2woInCCGQihxHNuXpwaJcJhGMaIfw2WWdB7dcwq65I+eBsaHLKby
 jZ4A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=RszGgzLn
Subject: [Buildroot] [PATCH] [PATCH 1/1] package/redis: bump to v8.4.0
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

See the release notes: https://github.com/redis/redis/blob/8.4.0/00-RELEASENOTES

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index f9c70c469f..1ac1b1764d 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  d88f2361fdf3a3a8668fe5753e29915566109dca07b4cb036427ea6dc7783671  redis-8.2.3.tar.gz
+sha256  ca909aa15252f2ecb3a048cd086469827d636bf8334f50bb94d03fba4bfc56e8  redis-8.4.0.tar.gz
 
 # Locally calculated
 sha256  4a0e416b9537688f30dfe69ddaceb2ca64d96b7df02a0a6760d376890ddc4e40  LICENSE.txt
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index c8073407b9..36a13a34ef 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 8.2.3
+REDIS_VERSION = 8.4.0
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = \
 	AGPL-3.0 or SSPL-1.0 or RSAL-2.0 (core); \
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
