Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE8C10AB830
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 14:53:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B1D161340;
	Fri, 27 Mar 2026 14:53:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IdYK7JG1mBCk; Fri, 27 Mar 2026 14:53:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 903E561324
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774623196;
	bh=9Kae3XkH0Fh5NiHuPCV9d37Btvm+dtg9v4zas8wpa28=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UlsyJOKopZpt6tmdKuduoClpEvJ5kNgoR3NZns+E/DOt5noTXqYf61t0rHuz1MGHf
	 4ePaL4sQjUwEKVsH43MTaQtpVkyTVYyah51ixVCC240W7+hv2VqtvLBEl9/R/EhHTb
	 gDhxN521+4p0E250W323PZuXWiELswP6LVU3DKmV03qtHA5sqxNsL1iuPtfcIOycev
	 Wo/rCSxxI4DaDnJp9N9qyuUh1o1ROLAhU0La+jLc+/l3EwSv3BxJJZJwATCW2x3DGa
	 KJH62tPsK6wrcaDX0fCr5Ur2VH9jFckxuBjsT+mEAX345H2niBjnakR71/iAHbc9wW
	 LUNaUl+x/tykA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 903E561324;
	Fri, 27 Mar 2026 14:53:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DA0D9249
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 14:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB48661323
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 14:53:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q3Xl_biUi1mA for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 14:53:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A196761321
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A196761321
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A196761321
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 14:53:13 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-482f454be5bso30749305e9.0
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 07:53:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774623191; x=1775227991;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vVr6C3Ndtp+LL6h1iBhG/SswWsuXKAT5T/G/l0DHNM4=;
 b=E1qgQdcZbACza8NbX+2fy2AnJ+uMY5nyN3FIbU5iTg3T8cl1K/48T3KccAZosE8+Qx
 SW20mQupiHyZTxTLiFUWQNOdNJf4mKxLHWgQ7GRwx+Z7XdhxPu84wfTu+1uaLvj2rBX0
 lNyGnge7/S+GclBAx62UBhZkDR4/NNJroHzJLjNOW2twEsiDTqtyTe7TK7g7dfLBY6T+
 1nklK6hcWqPHZUFwhKDG7qKPY4vMJ4tdokeNE+r/BhovPNs4Gv6+D/++TyCi1rPB66u8
 zFX2E51WH4Qtq2g72rzukzbcwh5iug1LvxFBp4SH9nPCNMkjFPumm0uyBfTHqkQc9ErQ
 XOgg==
X-Gm-Message-State: AOJu0Yzb0NX8/ryKd7DUdTVZ8jPsvXtopq/h/bykFdbMCD6NWCZhUUVF
 lJgOndDbRQxWaAUOJekLM2gAhjiCoujehMboW7G+dowPu+9VnAm0hwpAHsO5
X-Gm-Gg: ATEYQzzAP6jo5B5Ab2Yh/afaXOd98SScJFQhwy41IxSepg6AcmKc3DktAGJL/LqxdCe
 n0aJj1mhl+AYplrkN82grjIcePl8q9odHTfw/XBjroJZB73Hjf0zhyFjjOnPcv88iz8xYYBM55t
 mHphQ8JpSmT5SuXJK4mu+3Ndjl7db7dBtlXCUZ4vDgdwumuKlgwGSzza4VGg30P4YPxnhHXJnb9
 EupURspV6bhqCk7k7Efx0AQICMUWTosUhnI3Um6NNDJGksJN/Moy4guOCypgnwqkmsCeFkFpRYA
 ckUGoD0pNyjBaRGJXyhoFclwX3xxZ6YKeXul5Ld+CodM7XPmxa0YrR/6wA+8wVfKUMIeDcKOLVZ
 GwJ2Fx7kNQkdrXolnFf8AV2/FyIP7jJx4AB1RUfo7RmwNEdXilP5IOyjQbudWF9Yca0hbaxeJBE
 a6ZGqqaPu9/6mXQgAfB8SgBy4Y8CoNQkJ6fbad5Q==
X-Received: by 2002:a05:600c:46ce:b0:477:9890:9ab8 with SMTP id
 5b1f17b1804b1-487290a929fmr38224435e9.3.1774623190917; 
 Fri, 27 Mar 2026 07:53:10 -0700 (PDT)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48722c6b4d0sm101014395e9.3.2026.03.27.07.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 07:53:10 -0700 (PDT)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Shirokov <shirokovalexs@gmail.com>
Date: Fri, 27 Mar 2026 15:52:24 +0100
Message-ID: <20260327145307.3834669-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774623191; x=1775227991; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vVr6C3Ndtp+LL6h1iBhG/SswWsuXKAT5T/G/l0DHNM4=;
 b=SwB78KeIf0CRlMGF88F72+A0XKdOzM1v16S5KiPuI7XP8szXk5WaPtF83rF1JYo8Sm
 8a7ZjxUKnvcaab7pjvf1BMIpP9j7WG/RXvSrM95ESFqFw7PK4TCODBsym9dWdK5kpoWU
 n1tPF+jQpe9TPaXpmoq8vSVVX2bANTs0DkxgM2FK086Psgzjm/GcD/8OtrKRjq8fK/pS
 meyvwFi0ooAEbB6PdnVovZaH37PsirmIlr5nFiy2fUR7piDVp3sqcZQy2Q+16Dg7pJxk
 Ta1JO/mnCHuNtOump3xgiCJEU/aCiT78DYkQl2obaozJ5eTm5yQlRm/qOCCpDhdGpS5a
 +yRw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=SwB78KeI
Subject: [Buildroot] [PATCH 1/1] package/broot: bump to version 1.56.2
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

Changelog: https://github.com/Canop/broot/blob/v1.56.2/CHANGELOG.md

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
---
 package/broot/broot.hash | 2 +-
 package/broot/broot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/broot/broot.hash b/package/broot/broot.hash
index a86498a169..ec72063928 100644
--- a/package/broot/broot.hash
+++ b/package/broot/broot.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  bd6e52151e28b4f76248156dcef5c0c56260caaffe39599c798792a528786fac  broot-1.56.1-cargo4.tar.gz
+sha256  46fc9c18ac0bb7a23eb752aab853b2484dba5b168052d380b1d8b902bf4a6fbf  broot-1.56.2-cargo4.tar.gz
 sha256  89461664ce2aee7d80ea8fba7118fe7abd490d76ba435cf1d81d3128e060711f  LICENSE
diff --git a/package/broot/broot.mk b/package/broot/broot.mk
index f1174358ec..dfd9629d12 100644
--- a/package/broot/broot.mk
+++ b/package/broot/broot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BROOT_VERSION = 1.56.1
+BROOT_VERSION = 1.56.2
 BROOT_SITE = $(call github,Canop,broot,v$(BROOT_VERSION))
 BROOT_LICENSE = MIT
 BROOT_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
