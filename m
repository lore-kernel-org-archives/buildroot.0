Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D84C5CD5BD0
	for <buildroot@archiver.kernel.org>; Wed, 27 May 2026 20:41:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A02A7844FC;
	Wed, 27 May 2026 20:41:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mN6NGAh86wo7; Wed, 27 May 2026 20:41:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B62D0844F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779914500;
	bh=K7Tp2mYYa4Kahs+FB5k8urEex7B5O9q9b9Q2t62FxdQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=IHwHN6JGNkojJBu1/oLavCPh4bWhmgMGnC3quXNljucoO1qtk+eNgP1cu+BiyJgog
	 uap4t7aM3+CeJQ5d/bBB9oWczTxNO55sN1A5vaYrLQnmXGHDz2zN0xWhV84OcEjNxc
	 cHrSfdrtRvklnC2J7zV0xE//s/CBn7BZFYginpAab2/9v6OWf7UCPz+Wpf5MQJU51A
	 bkVCKo+bWHuETy15/OGFmhvx+ZY96ibKZ4UCwi5PR083tsaApKHGDaKnznC+up9/4V
	 Aiyo/ts7R9st9IqlIeOP1qD/O00SZFLsDI+P5Shrmoct907UPTRrH52oPi49kUqYmr
	 T9K/FyNhyfnZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B62D0844F9;
	Wed, 27 May 2026 20:41:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 62148288
 for <buildroot@buildroot.org>; Wed, 27 May 2026 20:41:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43A3F423B5
 for <buildroot@buildroot.org>; Wed, 27 May 2026 20:41:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kz-X5JdxbM0I for <buildroot@buildroot.org>;
 Wed, 27 May 2026 20:41:37 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com;
 envelope-from=j@j-ernberg.se; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1DA59423B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DA59423B4
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1DA59423B4
 for <buildroot@buildroot.org>; Wed, 27 May 2026 20:41:35 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-393c93a0166so112419441fa.2
 for <buildroot@buildroot.org>; Wed, 27 May 2026 13:41:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779914493; x=1780519293;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qqiHAOZXIk0KASLN+SiCDJsxnEJJv+mtlrMIdqsOs9A=;
 b=SnO9ZQxiBnYhGbnim/riGxaiyzJfnnzdH/j6Q1ep0o55pzHxcsSSOh8gkP3I59mMHm
 MgwjUIrWo2gct+FIe9HgP5OqKpR3TB1ZDDUG8XpfpvHR20JvclyfxRcJY4vQ4tO462OI
 J9HAa3SyYdYQ/9/YvKtWEnXRDnY1X6QhLlOP3odu5l36yWES3op59YZEoTIwAkta9Erl
 QVh60rf77hn5DWi4trJ/0vV5Y5QMATR0yUAoVki+pEnetd7rQ77d8C9VVTBhbXpCpqgT
 l/zEwQZ2bNLwyZySqq96pk3i+4nQPQYnffShoQz6SHpsi6khhppECD03BIheudocg0S2
 DJLg==
X-Gm-Message-State: AOJu0YzQciYTeTwQp2YjSJCgOqJcY4ZSj2jHLiigBg6eY9omrT/HM5JO
 QHUurrnYUT7hNd0Z8yDnKUHa71h1rqZYZBEFTVc4ZIfoPTUV9CSYu/XJTcmZ2f6D4gG2RxYU+6P
 p55A7KUyNkg==
X-Gm-Gg: Acq92OEviR1Iaow29CWLuIsdeutU3ero3Lv95BKnNsaujOyiWkxLU8F5T0tsafajF/5
 Hgew5pGMhDLXKLjdM7Udrc8D/iNTTDFKqyAX8SGEM+Y2wxaUc7tn6b9fYahsifs/RIiakGOCq9L
 gDxvcBZjsnkEU0dEhe4VpC17+sjxJJuMmo5xGHAfpskqVLXbaJHwuijuJOgn9pAe3lBujg4lYjU
 iq54/7h3IDLZ4Z1lH/kUAvnXp0zIfLL1a/I37bMtkGcKr4orgclYWN2Sp1McL9aU9wR9hZSFY6T
 scyap62F9hkq8y/NQbfYPmf6OLgI48a5Y/LNmqI3mHKj51BgrNXVTXwVIDpZo3wBKB3MUOtmKPo
 8NBRFpaWXIV3DOuVbbrqpApNg4ltfTgBxpvndjp2mP2SGUYAeZlMn0Y5zygCbiSi7tGCvnKoqmQ
 WDK4BuYzQBcVcTkmhHLJ+5NnFRrkKMjHGQ5tRRpncv0G0ukfOSi4dWGJSAS5NMsw==
X-Received: by 2002:a2e:87d9:0:b0:393:f205:eb45 with SMTP id
 38308e7fff4ca-395d8d04b14mr56047661fa.24.1779914492585; 
 Wed, 27 May 2026 13:41:32 -0700 (PDT)
Received: from localhost (78-71-152-124-no2360.tbcn.telia.com. [78.71.152.124])
 by smtp.gmail.com with UTF8SMTPSA id
 38308e7fff4ca-395dcc2ecdasm34715171fa.32.2026.05.27.13.41.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 May 2026 13:41:30 -0700 (PDT)
From: John Ernberg <j@j-ernberg.se>
To: buildroot@buildroot.org
Date: Wed, 27 May 2026 22:41:25 +0200
Message-ID: <20260527204125.4054645-1-j@j-ernberg.se>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=j-ernberg-se.20251104.gappssmtp.com; s=20251104; t=1779914493; x=1780519293;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qqiHAOZXIk0KASLN+SiCDJsxnEJJv+mtlrMIdqsOs9A=;
 b=k8EoDmR36J+Qwv13ukvVKcbBFkhWXkQOJy7PZoSkh8K68zyBvXVA6XZ8z//YFofUJ8
 GMMLo7ysaNDNuwBgicj+bdseLDuMc/67n5+Nh6Z8hD6v0anI47WqdqW6E4GTdNfuDLJu
 xACjkj5VR7RCvt7ONFxQJcNfFGGFuYeXw8Fs+VoF0AChvs1sPvjAAI9LOxcp2V4VctFb
 Z3kqoeestSSOu+QDX+VEvc/uQibYaQFYhQOD0ZZjaQkn+i9mBZ58ga3+kIrngAaBXyzt
 FZ5Jz8Jcx5QZuFDCJX5qzaesN2MzsAAvs0LkpnNP95WluPBVuDYECZpr1oWDkFrwQ+U3
 7BSw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=j-ernberg.se
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=k8EoDmR3
Subject: [Buildroot] [PATCH v2] package/pkg-generic: Add /usr/share/info/dir
 to $(2)_DROP_FILES_OR_DIRS
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
Cc: John Ernberg <john.ernberg@actia.se>, John Ernberg <j@j-ernberg.se>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is the file the original commit d8898380984f ("package/pkg-generic.mk:
Remove Info documents dir entry") wanted to deleted.

However, there are enough packages that install to /share rather than
/usr/share, that the path currently listed is still needed.

Signed-off-by: John Ernberg <j@j-ernberg.se>

---

v2:
 - Append to the existing mechanism rather than inventing a new one (Arnout)

v1: https://lore.kernel.org/buildroot/20260510193826.2846038-7-j@j-ernberg.se/

---

Packages installing to /share are broken as that has never been a valid
path since the FHS was first published [1].

Would it make sense to add a specialized check to test-pkg to warn (or
error?) if packages create incorrect paths such as /share?

[1]: http://www.ibiblio.org/pub/Linux/docs/fsstnd/old/fsstnd-1.0/
---
 package/pkg-generic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index dd440e4062..83f3506913 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -863,7 +863,7 @@ endif
 endif
 
 # Globally remove following conflicting and useless files
-$(2)_DROP_FILES_OR_DIRS += /share/info/dir
+$(2)_DROP_FILES_OR_DIRS += /share/info/dir /usr/share/info/dir
 
 ifeq ($$($(2)_TYPE),host)
 $(2)_POST_INSTALL_HOOKS += REMOVE_CONFLICTING_USELESS_FILES_IN_HOST
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
