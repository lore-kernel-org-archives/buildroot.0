Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A43EACD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 16:21:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AC9C41A6B;
	Fri, 15 May 2026 16:21:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pFvdDpD6fMfx; Fri, 15 May 2026 16:21:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77AFF41A6C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778862072;
	bh=liq2UIcY0r33QbbLQjEgMBirJyl4gXXqgr5xw/ydykM=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Wxm6U7VAEOUSnZVLiOhotnAh+aoIw3XmDn4UkZgi30app48HZYk3KRBQCAkUKIGCt
	 EP928OyIWFVGSkVCo2dhL9K6QdD+sucuXWBofruH/eIaxyu1t2kobxGIAAP/yFHMfm
	 qGd1DnaF4ckPW9G0CKBOGNKF3MYGdqQJfkZPRIPgUEt35oqJTskfZV65X1wPAeJHDc
	 cGdAHP7EYWT7MHS4mG5onHPfZYi3HR8AyOjNB0r6BqRYdhhBeXCECtwrrJxSF5kSoT
	 In8i/YDoo53SPu/Kp+glOdW5IwOBez/W2yHIrtHVQylr3cLFsD8CPKAVtWPRu+u/Oc
	 X64DUiTU+/uSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77AFF41A6C;
	Fri, 15 May 2026 16:21:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EC2F6282
 for <buildroot@buildroot.org>; Fri, 15 May 2026 16:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D208561633
 for <buildroot@buildroot.org>; Fri, 15 May 2026 16:21:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l4zBlCjOO3Ej for <buildroot@buildroot.org>;
 Fri, 15 May 2026 16:21:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D9EA661632
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9EA661632
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D9EA661632
 for <buildroot@buildroot.org>; Fri, 15 May 2026 16:21:10 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-43d7645adbdso5183728f8f.1
 for <buildroot@buildroot.org>; Fri, 15 May 2026 09:21:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778862068; x=1779466868;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t0MGlirtC5rmWj4/S5uGdds8G8z/trNzIqZwA9MMmk8=;
 b=p29NZo0cW6fX8/NudZDfqakofSZVVGLgIbnrnp8Iqvv30S/IVBc6R8U1ritGK2xjKn
 r23n9Dk/pqYqvX4YKf9DvP+QOpsLlPpvjceB+uoaS6MLvHjxlSrFr9AZ3YhD/z9zCtFy
 IxAYCYZ+vXJ4WuVmTPVgNCddS13kqlfxi1VXlRk/+hNznsQ9LW4FQL+dlUCN3we0KJi8
 lYh4wrPA2xHw6dGff0em3IEIoFuEKNZdo/3MZA4HF1FnME3zJOIOu7wo9ez18kOPrGTC
 XJ5HCadpb4ieEdBGqxGRWKyuDOGcmcUqSca/IRada1beytUhuU4guE4xCdGRQNutARfG
 UVZA==
X-Gm-Message-State: AOJu0YyESCTUxivUNV1+4BPBwFPcBz1V4o+nMFRVwFW1SObvks4lWolz
 ZZ/tiDckuXLtYhkOw/CeqoC8B6Rsm5f7NrlLscXLeXjRUHWYJsfs+hyuLJLC7IBmGPZ7F+SEV8p
 5MPfQ0p8=
X-Gm-Gg: Acq92OFJj+X7+zKioamtEzkrsqpIpUxdTQM1DSw/5JZHt5TsEXTgKbm6xKP74nLHYd1
 yO45bQssiSI2fKIvzoHytu/+7IyVv7mc/+w6A41eo3QzCjnfV/yKiAP5PM9GRGuzO8iIR/PfS9A
 bUsD1nVbRZ8v3O3gHij0z7t2VQq+0D0KBuQGmhosKHgkctVLH7RHKnbpEE0NdTQeJ76KwRMfI/R
 H6SQxmmFXue+1ZmlUf1kV5oMsPDHWTx8cPD9i00yFpWy5Zx47wVCHcHo/41j3VPo4CENI+YAa7G
 cQuqqoFJPFPI3YFgQlOWLoL3TA/X9TePk2xwkQwhChmPlHSVpOmUKWBGm6kuj9Wtebtp3AOL71n
 Ri9SKZNexUfvlPq/vc813PoYuNnIUoiewc7ER6pbmA4eqhqZHLp5Sm9T/1f/RuV8Z8qaRmVgEZ0
 Q5q2P4V9NGTeapP+wbD/FCmLzpfR3UBpgPZbx6iJQG1/XqAopfZ5ZOef1Uzq4q6IuDCGatNJvtP
 SPD5z/Jbl7UQBb/YzHvZFBMDK6TxrpDuY/+
X-Received: by 2002:a05:6000:2388:b0:43d:2be:e54 with SMTP id
 ffacd0b85a97d-45e5c5a5825mr6541640f8f.39.1778862068636; 
 Fri, 15 May 2026 09:21:08 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0a19b1dsm15342788f8f.17.2026.05.15.09.21.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 09:21:08 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>,
	Julien Olivain <ju.o@free.fr>
Date: Fri, 15 May 2026 18:21:05 +0200
Message-ID: <20260515162105.2267034-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1778862068; x=1779466868; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=t0MGlirtC5rmWj4/S5uGdds8G8z/trNzIqZwA9MMmk8=;
 b=2gj+/zqrqgJvnf+SHST3obdzUfOlDEYB8JNAC1QecIclp0uQkIhNOkGBhxQRxY20Nv
 Jxww6akuAVN0xunQ8v3uGM2p/VPj40r6W3zhffQHsCf5Ss2j2CnWA+XtP6rCPHqvPRNG
 ZmpcqiDGrsSs0uHz47RXqCdov8VwDhs5sgZC4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=2gj+/zqr
Subject: [Buildroot] [for-next] Config.in.legacy: fix release where
 BR2_PACKAGE_QEMU_TARGET_MICROBLAZEEL was removed
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 9a5369effd22011b52b82c91f702bacde690c41a which removed the
BR2_PACKAGE_QEMU_TARGET_MICROBLAZEEL symbol but forgot to introduce the
new "Legacy options removed in 2026.08" comment.

So the legacy symbol was incorrectly placed under
"Legacy options removed in 2026.05" comment.

Fix that.

Reported-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 Config.in.legacy | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 90606ebd4b..8095991b25 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,7 +144,7 @@ endif
 
 ###############################################################################
 
-comment "Legacy options removed in 2026.05"
+comment "Legacy options removed in 2026.08"
 
 config BR2_PACKAGE_QEMU_TARGET_MICROBLAZEEL
 	bool "qemu target microblazeel removed"
@@ -154,6 +154,8 @@ config BR2_PACKAGE_QEMU_TARGET_MICROBLAZEEL
 	  Version 11.0.0 of qemu folded microblazeel support into
 	  the microblaze target.
 
+comment "Legacy options removed in 2026.05"
+
 config BR2_KERNEL_HEADERS_6_19
 	bool "kernel headers version 6.19.x are no longer supported"
 	select BR2_LEGACY
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
