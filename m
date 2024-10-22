Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C812CCDD0EA
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 20:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95489401C1;
	Tue, 22 Oct 2024 20:51:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aV-VdLNUd3qR; Tue, 22 Oct 2024 20:51:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 538E9401E8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 538E9401E8;
	Tue, 22 Oct 2024 20:51:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E09759F5
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3DCB80E38
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 20:51:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S3SpTaE-t3SN for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 20:51:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C3D4D80E28
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3D4D80E28
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C3D4D80E28
 for <buildroot@busybox.net>; Tue, 22 Oct 2024 20:51:31 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43159c9f617so58300255e9.2
 for <buildroot@busybox.net>; Tue, 22 Oct 2024 13:51:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729630290; x=1730235090;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CJAxGwPoA7fgMtAuDVcFLZwR3h7xHBk3+ygaWV825Vk=;
 b=S2gZ1ZdAAbt/w6Wnip0wCQDQAd9y/EBDhbhARYoacAX3+VAIjiFsCwDbqXAAv04mDM
 ZO8DU4ZeLuMZDfTGqM46ZG8cSBigEHZ8pzn6HUJwNzl4aOn+R4XLY1lUWuvAz71ls3Bs
 ux3jSGWuPirGqcYmZu1shVZoohSK3UtcccDHEqzQpVGY4zZF7DbnTwRkkpWTxTtmNCmN
 dibBTpFILKjLEMjU4n1wZQ4eZ7pwgf4iSP23Y+RMfNR3/l8kG1wugyaDH6UCJYVGML9z
 NLWEyojVs76u3xzTvs7wf9JLNwP+Hbl6dE6G1meOa85eTKViR09M5zkM1HZUjckKzWWF
 JGiQ==
X-Gm-Message-State: AOJu0YwNtzZg3kJkVoI8KathhAgZ54fmqKu29AjETDFxDcXllwNJc0eC
 lai7LW7jjB/HXytepyo5a7peY68YXyqs2fTGHCIQdl8tpzTIxG12dfFscg899fg+t8c1m+vqXCk
 6Rg==
X-Google-Smtp-Source: AGHT+IFjcorx5xhaoUV9euEosFJx27Yw6TK5HPx4fawA1hXUAnhGXI6071fwyHBnAOnuJY9bFRQDWg==
X-Received: by 2002:a5d:61d2:0:b0:37c:d183:a8f8 with SMTP id
 ffacd0b85a97d-37efcf0610dmr168126f8f.19.1729630289666; 
 Tue, 22 Oct 2024 13:51:29 -0700 (PDT)
Received: from vm-2404.. (206.34.66.37.rev.sfr.net. [37.66.34.206])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37ee0a37958sm7369462f8f.15.2024.10.22.13.51.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2024 13:51:29 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 22 Oct 2024 22:51:24 +0200
Message-ID: <20241022205124.532183-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1729630290; x=1730235090; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CJAxGwPoA7fgMtAuDVcFLZwR3h7xHBk3+ygaWV825Vk=;
 b=k0345gAo3xz4m73cA4E7QTf+rbwA+onPOYd//l0kmCIZjnQzQxNA5emxS+w3iuiqWq
 jvjYx3bHYSuaejmU3BUjYpgrm8zoXiePggJGuyUDV+gOOzYkJw5FAxRsfNu+ri1q4qVc
 9bKGXcJHEcLMr6rEwQ+VghAup6YRpIOvcivPpUnNCvq6vq/5R6GJ8vs7BYajw1xgVaLw
 s8yXUyTq+vSkuXCId3nZnomz3BMZwokdS99VWiRaF1qkLyTg/CdJdfNI8RSachUKrOcv
 ude8HsvnQkKPI2ohMHS1tt3MBBzaLAw9ny1V1Hvj3BLkpTvZPcUJL+GMqbnRVAx+Yjyu
 1ifg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=k0345gAo
Subject: [Buildroot] [PATCH] package/mosquitto: bump to version 2.0.20
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/mosquitto/mosquitto.hash | 4 ++--
 package/mosquitto/mosquitto.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index 34f50906c..f644f688b 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking gpg signature
-# from https://mosquitto.org/files/source/mosquitto-2.0.19.tar.gz.asc
-sha256  33af3637f119a61c509c01d2f8f6cc3d8be76f49e850132f2860af142abf82a9  mosquitto-2.0.19.tar.gz
+# from https://mosquitto.org/files/source/mosquitto-2.0.20.tar.gz.asc
+sha256  ebd07d89d2a446a7f74100ad51272e4a8bf300b61634a7812e19f068f2759de8  mosquitto-2.0.20.tar.gz
 
 # License files
 sha256  d3c4ccace4e5d3cc89d34cf2a0bc85b8596bfc0a32b815d0d77f9b7c41b5350c  LICENSE.txt
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index dc7db75bb..1b06809b9 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 2.0.19
+MOSQUITTO_VERSION = 2.0.20
 MOSQUITTO_SITE = https://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPL-2.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v20 edl-v10
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
