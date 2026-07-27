Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D043C531D0
	for <buildroot@archiver.kernel.org>; Mon, 27 Jul 2026 11:50:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FAAB80DC4;
	Mon, 27 Jul 2026 11:50:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b2Xc0Vo7M0LY; Mon, 27 Jul 2026 11:50:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0352809BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785153052;
	bh=dS4lGuijOna5sbXPGJkwi5yTvazJ923ZM8MMbioIzPM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ThaoJBbRyvQ82xIf6+Y/YIaWL0nHEbuwwRihKXB49JErZ+Qhav4g7rZvt0xYZrlLg
	 gDasIcPZss2U/DJOCjBtKkZvd0wN0j+ICgcB/RjmBVZsML8TwzvGTAzwiicXuRDylI
	 IDpzgRGAdxhyPqIjd6txFu7Y4UqolJIEHKt3qbzd0j+z4TpQ/FD+eLuV+SHkQsMvBJ
	 4deFCcLkGvGWJuaY6RDgd2Z1vIBeP1LxnjWK3bJSCt8gYXPjB8ot6DbKr7FnmPZde5
	 nvxDShQm6CMlqZmuROLMdZUCEWNglrsGCIpeEE8G/K0jMqcPQNS+bNu+h4AMouWHDb
	 ql/DJaZfPzDRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0352809BE;
	Mon, 27 Jul 2026 11:50:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9944526C
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 11:50:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96A8E4069F
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 11:50:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CQUkb6kkABPw for <buildroot@buildroot.org>;
 Mon, 27 Jul 2026 11:50:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 64AFC405A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64AFC405A3
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 64AFC405A3
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 11:50:49 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4954d383e64so16120795e9.1
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 04:50:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785153047; x=1785757847;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=upFqrhJXffpkjmrO/hdugYTUJ9KrjLVStQFCSuXSlzg=;
 b=DzCHDC52Ig8JvvN2Zz8ju0O0tTocKfEdvevXcD/gwXI1edEZS3acop+ZRKlXh8l5Gg
 e0x8m9g5GKgDVP3g2JtbUDM9PsKXg41+1mLTzS7MymqkYsmrPbXTs7ml1n5/w9sxeyB3
 G5IX+CrL2YAT421YOAHEgaZUWUDTmEZKp5eOwN0iuRDOZXgJmKfk7mdphK3oIkD8G6Ha
 yKimMgz6yP1mqLhy0u6/eaN0QYLFPqQeJaI/l1RUgbYD108qqhj9HdoJg2+dbwL66rWX
 RJL/b9hP/u12Z46wko9QqUNUmSHLZ/ce6XCdylRw/OKb7qknaPYaHRXcQl5y7CY3xx7L
 zqWQ==
X-Gm-Message-State: AOJu0Yx2GJwv5V6lSs68uWuJbzq+gEM75/00HO3JCdg388XG2wSZAN5T
 xaFI99nQc7vvOR5S9f8uV2m6Emf/OphdqaOnUXI74uZM85P+5C03BPZGVMpllF2hSFMs2dPtGgQ
 PXDvw
X-Gm-Gg: AR+sD10wzwF7jNHBAgmhO1FQBtTdIXeAfYOwyQV3M2ziM1XsiXGxex276e8Hgchv7Ma
 IajHxekhNM44VdiEfXLGM+zAz20pqWNe1p7iDt5sk5NGxozjwbNAuJQnPIQ7EjeUr3u8wh9amX8
 cZWjBQ47O4Zo8hJm3AMIroFGV3Mn3X5U7yI327i3HCDA2g0QRCl/h8BhSp987IcYabg8A+lDUsr
 1wbT7gHSI5lq21TRaBPTuF8JAzz4g3VUaM7xV1BzD0s0Pu/unLtsGh691Db9PYlWAD4PfCm2DPH
 bVEVlpG4Os2TSimEWUWVg9dIc1CiABvcXP0RTJDCLAL9fcmydBfUNEJQIu/9dkrZRe/2Z8b03Pk
 FprOQimE9yyu5EseummkyzWaBsX+IYY7vvatcz+dJi0hh93+6AQOfB6CbhjtOtm+4XZHQ6fbx1K
 PPfZVYs45E99ewDcRJbICTTMdOd8/tAlQJaWz6nZitQ3G9
X-Received: by 2002:a05:600c:3b22:b0:496:c3b1:2a91 with SMTP id
 5b1f17b1804b1-496c3b12b4dmr3950435e9.27.1785153047159; 
 Mon, 27 Jul 2026 04:50:47 -0700 (PDT)
Received: from dragon (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4957bffc501sm194132155e9.4.2026.07.27.04.50.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2026 04:50:46 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Daniel Price <daniel.price@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>
Date: Mon, 27 Jul 2026 13:50:33 +0200
Message-ID: <20260727115034.35048-2-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260727115034.35048-1-titouan.christophe@mind.be>
References: <20260727115034.35048-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1785153047; x=1785757847; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=upFqrhJXffpkjmrO/hdugYTUJ9KrjLVStQFCSuXSlzg=;
 b=fvE5yCklOsl2k2eH4YvtxV3ZC3jD70nRtboU+/cKnbiMmonkehrGmngoGVbo9K1en7
 16O0tHbkBHUyH4GWGNetlfeTn8zus5hXfnZ4HvmDymMzuBk/ujdwk3ftBg6sOVEsef8q
 Dt7KkqaK4fzJ3y4M/8molVuFJIeN+4XLXyxkyP7CiH8KLrlyw5Re0nXrhZ0GxvSDmMYC
 +9juZXLKmg3IyrnYN0XGjJJJUWtciOu8VKiWkLClbS3PKOh6IELnsACpxI16y5adgbw2
 uE5YT7kH2cT6WMM7mYwMpIGkgtI5jlfZcef9cMNwkx9oSRAy0K6oxDCleB/PwHXZU2Dk
 QUVQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=fvE5yCkl
Subject: [Buildroot] [PATCH for 2026.05.x] package/redis: security bump to
 v8.6.5
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
https://github.com/redis/redis/blob/8.6.5/00-RELEASENOTES

This fixes the following vulnerability:

- Crafted RESTORE payloads in RedisBloom and TDigest may trigger
  out-of-bounds writes, potentially leading to remote code execution

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 2bbbc9e2a7..bfe94b8a76 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  559c2e50c496b2d4afcfb491af27763a1b170037317789ecf309025d0caece24  redis-8.6.4.tar.gz
+sha256  cd04337495fda9be071d4e1e3c6a61134f83995bd23d1794cad18f878b7012ad  redis-8.6.5.tar.gz
 
 # Locally calculated
 sha256  4a0e416b9537688f30dfe69ddaceb2ca64d96b7df02a0a6760d376890ddc4e40  LICENSE.txt
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index ba41b3f922..e5a6e39792 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 8.6.4
+REDIS_VERSION = 8.6.5
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = \
 	AGPL-3.0 or SSPL-1.0 or RSAL-2.0 (core); \
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
