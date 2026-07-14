Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84130C44501
	for <buildroot@archiver.kernel.org>; Tue, 14 Jul 2026 12:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F5C18078C;
	Tue, 14 Jul 2026 12:44:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8UqvcrKut3RZ; Tue, 14 Jul 2026 12:44:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58852811D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784033082;
	bh=AJ25+W0FkwN4p/Bj3SV9nT6Ydj9qd9Vae9fWYA8gg7c=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=P3Mlqh1LTmbri0m7I1QwPw2xscxqX0g9mscY2Oqp7FWY4ve2UmfiYOV/HAK7J6I+1
	 NXlEsxqyRxWr9xsiQjKW5bQXYqmxli/d8WRD7fs62bRrvnJ4OYBj/oNFN5zPLd3Szy
	 trs3gwLwtUt+8C6JXav+Ja0cfN944RKQYZSqO/Pw5FwFzef9e/TiC18+seWiQ+92tj
	 iYTfNiCWUFQ+if9Q8PHIzlnvHVvwNH0L5jbsbtrFmmEpWQbpqkj5BE3vDnyFNg3xvB
	 EDeaHVtpkWhI6zEEsXPlqYIEmho/XIl1voa3/j0zOdG2hka75P8hP29XNy/kph2Y1X
	 hDswFTvBr9JVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58852811D2;
	Tue, 14 Jul 2026 12:44:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CB73F96C
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 12:44:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B1F6560A42
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 12:44:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bu5T5oSsuII2 for <buildroot@buildroot.org>;
 Tue, 14 Jul 2026 12:44:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8580C608FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8580C608FD
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8580C608FD
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 12:44:38 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5b013084dc2so731984e87.0
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 05:44:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784033076; x=1784637876;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=49hPGQ3SVBG8H5ZXliBHpdnPlF4wilRkb4Bqzjbl0/c=;
 b=PfIS53JhaCHzxrS8ixbeeugRVcjXER6O4EPcrwfCCkNY/DSJMo0cx5JQrod4Cabnqn
 gy5n8HvVOkslEKhoxJgusUDWljjnSgHQyJ2D8AHei6aSicEz0OgMrJ394KEm9HGOffU5
 hiugDTO5NNS42Uhe14dHJB8dol96+lYA+H0IjvacY7/pkZn8iIL2dPUy1sjwlp26UFaR
 CDXFrDkLIemV0Itp2N+o1W5oE1LJeEvS097wKCX/NbbUZOdLX55HftNSWf58LuodYhHW
 yr2AmncL20ObLB9I2S7bWuzypaCAShUqTYxZ1G4w3Xi14VN0YX04eD6OpyvTEWM6pMgr
 XHGg==
X-Gm-Message-State: AOJu0YwKwysYnE6AfmHdSs+yResUUQsAak+lonD8LWieGdNn3pPcz5F5
 r0kRJxSCFrpdT/tD6m3KnNdgoaRXGEHkTcBVWD5dT1Jl9KoVgi6Kn6cLwJLI
X-Gm-Gg: AfdE7cnKJdsYzgRwE5moalFB6yTI9nlm12F/tN6GSdO4juhV8/3sW/KIZ/KI0JXnTYY
 WlGFD9JvOjX7S4P9AyleV8I1g56v2Z2SWPRA1gMs1mNSlKwMqLuphxdmEEfth/kWaOR88/YDnQE
 Tg+ppLH89125nnVWWDxvNUcCNoJ24vuW/ETjCFurNYz3zmCZqLONUWufPBqdism1RWo8vK61Dxh
 Feh3FDbt+45Y7kC1h8wsvROT1QAoijI7l4gPJbEPsbjxmeWIhxvYpj+cWA40A++GOIamo0BAc9R
 gk2QQL64BOKHTj/tqNfAzt5tn6ULR45Q44qsrRBFTRXLpGEKUtFlLmvqYuDaQti0LNxG0Nq8+70
 5ZUgZhE9VX49+SccBH8W49vsu/rX9joCjrBmvNFurcbjr+la3pt8bOJb6v2qs0AQGhA1NOwoBHu
 vdBVGBqw4/K+RtMW6Ix26DYM6+ehO54S06s/WG7Q==
X-Received: by 2002:ac2:4bc8:0:b0:5ae:afec:8afb with SMTP id
 2adb3069b0e04-5b0236b3542mr3786695e87.48.1784033075714; 
 Tue, 14 Jul 2026 05:44:35 -0700 (PDT)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5b01cab0ebbsm3482046e87.78.2026.07.14.05.44.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2026 05:44:34 -0700 (PDT)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Shirokov <shirokovalexs@gmail.com>
Date: Tue, 14 Jul 2026 14:44:17 +0200
Message-ID: <20260714124429.559986-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784033076; x=1784637876; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=49hPGQ3SVBG8H5ZXliBHpdnPlF4wilRkb4Bqzjbl0/c=;
 b=WO+ubhn8fuHKJeN2o9GPTWW4LFe5699rQHKrzj/iLCGf4T+qOSQp62z1zUHpaldlMf
 lHw0A2J9T7kqNSrSsJBbYg7weMjBElaYQ9KMJXtH86aB4Qp0kb7EUxCZHoY9GtraRvWL
 9QCbgC6S0MQay4djqpNpDN+Lvn/mrna++Muv3ZuFLyUMPW6hFH1bwepynq0xAZpUAYnV
 YRcgjk9mMsWCp5gn/vIfC3ab9n36oIx+oKbCTGTvIvk9gwUD/oSWS2ObxoBOPwoE0Os8
 KBRB6KPoh+gU97P5dkoDezc9DPUuOP/0lmt3IRli3ZB7Vh8jhAXAaZGP9t5rdoIhfj8E
 /mjQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=WO+ubhn8
Subject: [Buildroot] [PATCH 1/1] package/broot: bump to version 1.58.0
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

Changelog: https://github.com/Canop/broot/blob/v1.58.0/CHANGELOG.md

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
---
 package/broot/broot.hash | 2 +-
 package/broot/broot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/broot/broot.hash b/package/broot/broot.hash
index d1f3dbbe6a..176c663d62 100644
--- a/package/broot/broot.hash
+++ b/package/broot/broot.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  26afe075d62fd64f608f07b867c568fa9ac9b9bce44b02ad573dfebd13d4cd1e  broot-1.57.0-cargo6.tar.gz
+sha256  cad8fb5e23b422aef80ea14797de7c709c97a5d2bb8019cddaea87811b17a652  broot-1.58.0-cargo6.tar.gz
 sha256  89461664ce2aee7d80ea8fba7118fe7abd490d76ba435cf1d81d3128e060711f  LICENSE
diff --git a/package/broot/broot.mk b/package/broot/broot.mk
index 50ab686e82..91b35abd6b 100644
--- a/package/broot/broot.mk
+++ b/package/broot/broot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BROOT_VERSION = 1.57.0
+BROOT_VERSION = 1.58.0
 BROOT_SITE = $(call github,Canop,broot,v$(BROOT_VERSION))
 BROOT_LICENSE = MIT
 BROOT_LICENSE_FILES = LICENSE
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
