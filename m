Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6745C53219
	for <buildroot@archiver.kernel.org>; Mon, 27 Jul 2026 11:50:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8033F80D77;
	Mon, 27 Jul 2026 11:50:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vzVplNusB2R6; Mon, 27 Jul 2026 11:50:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A99B580D4F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785153051;
	bh=L44B0JKhON4g6/yUskBEJffZWq+bNdAxy1HytX69BLU=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=i3LtuR8G29ok3JpzHOT9BMS8w7OTJQsLKfWM14qKTe7TzW0uihuW4UIkh54As0sHY
	 b0FBxFoqf29DDmR5Afi5htDBOMKfOPseHmn8bXYX3gTe5bsrA/5aVKZkchUcogMeCO
	 a44OlOHNQfnca+bfvaqUW2mQddjtJOdqD7o4AocQNdEl5lTf5MdIGa20AYQpQxFv9/
	 ymAZwCvIny4xsNdcVjLqTPTK5c7ZqDmV3hDI2NdhuWlx+mM3ye9tVyxTBs++pZWkKD
	 MyYXJzqli1GYUqPNCoOqwzv8xiwEEizEVDYECM9DnjHCdK1dO5WRH9p3igL3LVt2Uk
	 f794TZ+W/Ezrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A99B580D4F;
	Mon, 27 Jul 2026 11:50:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3230E42A
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 11:50:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17D0A80D4F
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 11:50:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TNo2Sl9GDGhH for <buildroot@buildroot.org>;
 Mon, 27 Jul 2026 11:50:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E858880D47
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E858880D47
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E858880D47
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 11:50:48 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4954a32cf1eso13203805e9.3
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 04:50:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785153046; x=1785757846;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4331sJ7qYD5B2++3czJ5qBUHDna6y2pX3dDwhpsxJWw=;
 b=R8o6Wiu4E3+Ila067jKGK2JHGSA/UZbP+yaaQR8HCrZsm4iyYg6RDzu89AYwJT8mWh
 XxSnNjplK53IU+dInAUJS3cgx+qqE/GjNKdnwCDTFJo3LZbqyGKbq91AGXrTuK9vb3JY
 +l9eO7eL9jM9jDn80vJPp/aBi1kbc9FM12Jy5EQDcdEnZFF/0dqgy1LX6csGiOJgCeeE
 FQji5vx5OwpofvFr2V/I9R2kWOkZ41Lb0xhAoCaye21+Z5/4vc3ONoZGw7u9dIvZVSOU
 oBuOa8moX3dpnWlVBROPfk3iUk7hAh4OCsfX5GEC2cr7YpS/74XjLm4QF1rN03JD3YVD
 RFgg==
X-Gm-Message-State: AOJu0YxBLI3XfDRo2+xSt764ioXngUTwwdRaZWm4/f0c5qH/MT8f5gAi
 GNr+ZhuozxT6jAA0vfI1vuks2g3Kt/F/DzEZylgDfoZY5octmUh+aKpLPuJHy90sx8bOXhu7fOU
 OjBeF
X-Gm-Gg: AR+sD12Z3pNgAllh1/SaLZhzk6DiooICnVZd+pWOfyKQCqgAAQ0UNDimes8zbIwc2WV
 oO3dludWa4FBKhphIQXAcx2J714AXsg0g8moEA9TVNqq1tDtcklrECdpUCQLZn3KOUsJY1cC2iN
 io4iQXUIrzShgkveorIjLWFyjyd3AFps2bavSR5GoCPHIa541FNRqVk6WLQlthkPoKdFIROJHJh
 XrUyJlh+cbVNqtng3N5+h0VDg2IRD0LOAL7CUpSlUVpAZKdBHx3bYBJxslHXqNFiabUa3Xdz/Pe
 Ajx/YZfBrpZCYpdoPuK8ILff6rqsMFMwORJ8bcuLSXcNR+29N07XOvP6sZONtfJBo9xVMxo/Wq3
 vr3JLg/hth9llcBNZaja7bDfiyJ4TsCJPe2ilYyYs2r77yhB7RWTVSrkJ6dNqhQsnwXEWa80UXk
 9LxKlP6GP4X+7Ye/MjVQIYXx/zE0wII7nUNOj/6cvkg5wK
X-Received: by 2002:a05:600c:a102:b0:493:c77c:108a with SMTP id
 5b1f17b1804b1-496b575ded2mr80026065e9.36.1785153046533; 
 Mon, 27 Jul 2026 04:50:46 -0700 (PDT)
Received: from dragon (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4957bffc501sm194132155e9.4.2026.07.27.04.50.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2026 04:50:46 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Daniel Price <daniel.price@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>
Date: Mon, 27 Jul 2026 13:50:32 +0200
Message-ID: <20260727115034.35048-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1785153046; x=1785757846; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=4331sJ7qYD5B2++3czJ5qBUHDna6y2pX3dDwhpsxJWw=;
 b=ICkMKuTiyRKjX7t9J/qu+ZSdEM5Z9Q9M670BASvc8GBEtc4h3qDpLc/df9cO4ljIFz
 pGqzbcM0LegjfRQJhW4R2eZme2kJvQDzAUo1bAIDRh904If1HJu9oszHgNraXXNCcwnl
 aCJhfoq99/oTSpp1qVoVb/0m/43bXpEeCAaPZZlQwtKzoZpO8BKj+dd6EIt7v2n7R7rt
 hXMTrcGjtxgOcSn0XN0n9SQLal1YjVkh6IwDvJKMhP1vbcEGyM2MEHmwkW6cHl5n9oGw
 kL/nTAHNke3jR1woWBOEWa1aSxEpnujwcCBdMp/jHr0q+BQ65sdg6XUneenR1N7ZLzq+
 HDZg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ICkMKuTi
Subject: [Buildroot] [PATCH for 2025.02.x] package/redis: security bump to
 v7.2.15
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
https://github.com/redis/redis/blob/7.2.15/00-RELEASENOTES

This fixes the following vulnerability:

- Crafted RESTORE payloads in RedisBloom and TDigest may trigger
  out-of-bounds writes, potentially leading to remote code execution

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 055276a270..cbd4255df9 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  21326da3f66c0aead4c8204c0ac52ff905337a77cadd169f75ac22835ea30025  redis-7.2.14.tar.gz
+sha256  7bf7975331511fdb788e85dae63964b128fccee1df026a10db57444babc9c9c4  redis-7.2.15.tar.gz
 
 # Locally calculated
 sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 62f70b352b..ada95dd2ea 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 7.2.14
+REDIS_VERSION = 7.2.15
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
