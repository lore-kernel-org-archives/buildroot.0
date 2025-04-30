Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E463AC369D9
	for <buildroot@archiver.kernel.org>; Wed, 30 Apr 2025 09:18:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FB4B4058C;
	Wed, 30 Apr 2025 09:18:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BYE9ijhzcmyS; Wed, 30 Apr 2025 09:18:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE598405CA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE598405CA;
	Wed, 30 Apr 2025 09:18:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B48F943
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 09:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1CD6A60F6C
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 09:18:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lplqsqKLVM-P for <buildroot@buildroot.org>;
 Wed, 30 Apr 2025 09:18:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1940F60F68
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1940F60F68
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1940F60F68
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 09:18:35 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-39c13fa05ebso4627511f8f.0
 for <buildroot@buildroot.org>; Wed, 30 Apr 2025 02:18:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746004714; x=1746609514;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gKUTe5RmaibAykNc3HUa/D0KO6AJ5bLemGYOXZs5R1I=;
 b=Tv8bxpIeZk2aofqA4rJmJV9WfNEXCIEIlnh/bGaKhxg/vqj53kRucIYd28PEpWz9Ps
 XtcAgQivL24YbS3oYf81qV14+mFydY9DXzyy0OAOtY42Aih9ony36/YUgsFHno2Bpumx
 S0NQs84f9w5wOIkZNTqs2RYYwXbyvsrnz30b8AmouphXTLYZUSeJLOnjymjy351GPy1q
 e+PdhgAAmZpvRzp0QtAIGoSASCaG34qULRd4KjIBMKOSDGIf9bVhGeH+auKQINu7n/31
 ly6wcyNycoiLVyxcTLIcQF+B9Xx0y1MaBbt7xsGST0BP2hU/voOhKTBtXj89NlDBGQNy
 uCsQ==
X-Gm-Message-State: AOJu0Yz4/eRU7HIAzTwHk+32R3NdqbOyspzIhEpSNzqi9yPOUHFr9hPE
 0zkfgUPzy/B542hrYJZwueBVPYZMN0lzJN2dkUnkGkMK2thqGaVAyxnL8wFehoa/lFh4XPlJYtF
 UWQg=
X-Gm-Gg: ASbGncuLteMxhsduHhfXctliqHMpP84vVtDOCMj3AKL2J6VltuZ7D8lnrZNsh8wrJD/
 GPfs7m6p45fe/gcJvrWWAWGiGOORMY7yU1J9gyzm4GxmR7w8HNXWCKD52OU8bSLWdgH6nVI0gLH
 dn1rTBMSfpjdaq486b6181OXPCnjKJXZk5cBoQUEw4YM0X3gtWUT79pg5XRVTKmQSjSX3Jt9SmE
 vE1tkw5SNDFU285r9+GLVOGqm3X3GY9WEUZadSwuU/XJLDLo6yQnj211F5A7SsfgB64Qs2/7Osp
 n/AN5RAdeLTNxNI4GYRcN2pN1T/L1kIxzE1rSvuwutpQL4SfTmAXKJ9xGptZGvT+ePZ1ZtqKiyR
 AkC6g/UydtfNhDmA3HdnSPIZUtrOUe1lKcg==
X-Google-Smtp-Source: AGHT+IFWvN5XMbjivyCdNjMPC5juoSCCpKRhqJ/aiLohfzZ392NXC7GwG6//4bS3T4eMqHVzH7fBdQ==
X-Received: by 2002:a05:6000:420e:b0:390:eacd:7009 with SMTP id
 ffacd0b85a97d-3a08ff50afdmr1423883f8f.42.1746004713761; 
 Wed, 30 Apr 2025 02:18:33 -0700 (PDT)
Received: from dragon.local.essensium.com
 (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073ca52e5sm16713092f8f.36.2025.04.30.02.18.33
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 02:18:33 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 30 Apr 2025 11:18:15 +0200
Message-ID: <20250430091815.97571-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1746004714; x=1746609514; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=gKUTe5RmaibAykNc3HUa/D0KO6AJ5bLemGYOXZs5R1I=;
 b=S90Lk8967jZMMWnu7y8WnXeKrPG7P6S4RHVLC0mEgtmrZI22c+xx2E8FFEC2trM6e6
 Hu28XebUtBfmHvf9bB/5THhzUMakL1YQMvpa3X06Hb814JKbF7OUzWOi+4ZPqnjs2olO
 ZxlC2WhNuSvH71Ndb7Uz8XRJYbMsyA7aD8t9BPIzUEzEzNEZ8A6kMFgWjDksKhtOHDYO
 OA1lDlE4IGis2PFggW9qoY+FB/qleJeobqJybpF7uuO8dU1AiZFyhMtqtPcAmQk4Z74s
 UMKGtCkRW3UVlv9lx4//956se+nll/eUuhaLriKnGzn9E96XpJjKuR9fPmcor1nB5mRg
 sNyw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=S90Lk896
Subject: [Buildroot] [PATCH] DEVELOPERS: update email for Titouan Christophe
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

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 15389d530b..8c26ee3f22 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3291,7 +3291,7 @@ F:	toolchain/
 N:	Timo Ketola <timo.ketola@exertus.fi>
 F:	package/fbgrab/
 
-N:	Titouan Christophe <titouanchristophe@gmail.com>
+N:	Titouan Christophe <titouan.christophe@mind.be>
 F:	package/avro-c/
 F:	package/mosquitto/
 F:	package/python-avro/
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
