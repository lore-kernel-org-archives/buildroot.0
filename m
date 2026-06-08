Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E583CD6E79
	for <buildroot@archiver.kernel.org>; Mon,  8 Jun 2026 22:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2E6542B57;
	Mon,  8 Jun 2026 22:35:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zu-FygWrp-lU; Mon,  8 Jun 2026 22:35:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5262B42B50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780958111;
	bh=9JXYJ48D25eub0+ZDXZY1a2AEXWwWpAGw2TW+ia3qFw=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=kYLHSKmWVVTD5+xM3VY0ulEUFVlY+RDwXYdFphS9AJgEu6SfZsW7gL9s1vXW+UuvC
	 ifCP2t32bXIoJITZ6xcRXEZZvZL8Ofszc5IRsspD37zTm9QdSHaBrWE4f6MR3VPLIW
	 ac8e4ctNI42rhhyLSHQbo8RboonB2DutcaMyfA0Ecwl+uiPMMVskIKg8bZ/edX8Q8k
	 zRhSRaMoZD+III4izi59jzp23IhOs0jCGeN6X4rMBUYplpcCh2huqE/VAvgubaPq7f
	 ES6SRUGcPuR3Ktm4VmrUY/BzFoDQcR4lC3T62/g3cyykRoQAh489xwZ5JjgMQI53+w
	 r+lG3njBxu1GA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5262B42B50;
	Mon,  8 Jun 2026 22:35:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AA8D5190
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 22:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9024E42490
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 22:35:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O8nOEmeUHRSX for <buildroot@buildroot.org>;
 Mon,  8 Jun 2026 22:35:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A003D42356
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A003D42356
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A003D42356
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 22:35:09 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-45eedc94d37so2426941f8f.3
 for <buildroot@buildroot.org>; Mon, 08 Jun 2026 15:35:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780958107; x=1781562907;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=07WfxAYRqQFzvNzSTAsT8wSSCEYt5HgqtOhguZUPz+Y=;
 b=fNDEVxfiCKSA61beG525Bw0Kf1qYTLHA8+bX5pnrFH+wkkhQ8kgvsnsQEycuo3kfYC
 926isC5LviQyrYvWKZKn1KGFO1mOB0IYgWLdDG5rlxQ1ErAgA/y9+queC5vCylrChVpF
 xuqRbiYh0C57z/83YFxL3u+3xS2NHlzw/W/EgdPH3dPiYyO5M/WnokyHw0dUyEZaLkNT
 DaDEJsYVIeEd9W4M7xrB5TiCqu3k1JX+nAvIORhE8W+vJyhDO9+HLGjKjTYxx379MgEs
 2oQuU53UwKsAkLMRv6qLgddHGEyId2XOB27r1SmSEfELrQW6CLtOLpCvO7WB+hYmRUr0
 t3Ng==
X-Gm-Message-State: AOJu0Yz7oYfQOGLVLtOlowAsM3DYrweb4JCeCIx/YUokaJC0vzMlcBnZ
 HlknFWWL/CMTyvAA1iIWBbJVJTSfSq+yYM/yUGc/7lFSroxJy1eLaGwXnEfo3qOrQIKutAUSGid
 TUfIO
X-Gm-Gg: Acq92OFEYWFO4vSvVFnxqB5iIABFa0Z65siiGe3zpj75B1b/D4GLQXBmZInxzKaPYTF
 rie/fcxJM34Glyx+yP/OnIgG4v6EpJoOWa8w9OQzokRr5bLbl0AEj1ZKFzETil8hdfGDrGKWH1V
 ekB2CFf0DXhBobW65iCQMQUASun31+eHEcCnKY32gtJZeLsY/7vEeHXhpNvmagFMKWxgpMmMyEM
 MJV989N/2ePl+qAlpz0w2Vy7knY8peAl5ZXScXz62AtTxVOb5dYWc3BwYoeM5N4qh6gv+uenTzJ
 PQi8ItBfIat8nl2DUCpfqaEbzbAFdtXb9498OJpRHCGjkk30GxbbsCmZJpr9BRyi71N6P6MJBuI
 t30m9UHsfe0yb6IhUsnWvbg7eot3e72R5a+fTRSGFJxf+UG9j1ra6JWo25sVWyCERuOx8Bxorey
 pGjotfC5ZI4fBIiR7/q8a0+7E3fZZG+LbZv9Q0J/Tpr09y1+c=
X-Received: by 2002:adf:e80b:0:b0:452:6aa0:1d11 with SMTP id
 ffacd0b85a97d-4603063d8acmr20920045f8f.19.1780958107583; 
 Mon, 08 Jun 2026 15:35:07 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2ed944sm57729440f8f.13.2026.06.08.15.35.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2026 15:35:07 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Daniel Price <daniel.price@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>
Date: Tue,  9 Jun 2026 00:34:58 +0200
Message-ID: <20260608223458.950479-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780958107; x=1781562907; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=07WfxAYRqQFzvNzSTAsT8wSSCEYt5HgqtOhguZUPz+Y=;
 b=XhLRGoFupdAQseLyCSB6G8RushCv4tBJnPWOz1nDkbpoIfdhqkYFlmj3mZUJ2U6yx6
 1wUPLtz9PRUSiAsrbseH9EZvtVloh164cBVzLoO8hoDEAsTs7SXLuXPBPqrFdnhRWM2c
 /4aMRHK0p/8FKp4adpHK/FwY6+RFSpqw9ShkbmITEmHztvTcOvsG2VEDN8ZdP7NyFdbO
 3an5VCcQ6tmq8D8vxLRzxFiPDSOCw9yxprZ/JcqTywX8Aq4bRUXLpf0ma3C6D1wYIdFK
 SsUnIjoVfCJTfq4jwYJULxy+BcDA7YqK4a0TbnrwWiVRfCB01iOr09u6DzlqDIVqtiFt
 0jFQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=XhLRGoFu
Subject: [Buildroot] [PATCH] package/redis: bump to v8.8.0
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

This is a new feature release of Redis Open Source. See the release notes:
https://github.com/redis/redis/blob/8.8.0/00-RELEASENOTES

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
NB: This patch is based on the previous security bump to Redis 8.6.4,
    but I had already sent the former before making this one
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 2bbbc9e2a7..00aa3e4497 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  559c2e50c496b2d4afcfb491af27763a1b170037317789ecf309025d0caece24  redis-8.6.4.tar.gz
+sha256  88422181efb0c9c0abba332e3e391d409e1e13714b838931669235e5796f704b  redis-8.8.0.tar.gz
 
 # Locally calculated
 sha256  4a0e416b9537688f30dfe69ddaceb2ca64d96b7df02a0a6760d376890ddc4e40  LICENSE.txt
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index ba41b3f922..a876c56f08 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 8.6.4
+REDIS_VERSION = 8.8.0
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = \
 	AGPL-3.0 or SSPL-1.0 or RSAL-2.0 (core); \
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
