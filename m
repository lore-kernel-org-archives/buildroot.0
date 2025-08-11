Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27DAAC87FDB
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 12:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEEBE610D6;
	Mon, 11 Aug 2025 12:09:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8qTIqJcf_5ro; Mon, 11 Aug 2025 12:09:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AFEA6112B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AFEA6112B;
	Mon, 11 Aug 2025 12:09:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 928FB1C5
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 12:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4AE2F81B71
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 12:09:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XwRK34AeDzPU for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 12:09:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CF4F883D54
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF4F883D54
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CF4F883D54
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 12:08:59 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-af95b919093so627003266b.2
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 05:08:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754914138; x=1755518938;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bL5MJjRR4ROLnQ0un84LCUGwPmmrIKLzUiQy3UzptZw=;
 b=I9yh4C8KLMJxa6yGgiIGFAlMs9Cqr56JbDwkdVeJUv6pJzxDQXbX0lnwvimgJ6WwyE
 ijmL/pkJQrP+tDYhRRDw1Xyzwf7f4sXtOBZCsxw/CsbqViQIcHUW4LRoKz4qtArEA+bI
 5KxG7dM2cOVq80vH2F+OAWhCUQ2jdaiOJt/4zwYqVH4J6q71ByzaPqOLNIq0vli7gWb/
 PzFaVsORlaVelIeKvGwCUan1RS1YnkbsKIBCoWkTY5ovmXhRIvrj265ZdYIgFTHmrA1y
 40+oqM5cACfz79hdvAuJMsnww2CIG5kBLvdhw01UYyFuWb81zpC4doJ7rETXnNtcRj5/
 nLMQ==
X-Gm-Message-State: AOJu0YyWzrT1dntq8dtA92LD+vAusE0yf6OwCrvDzT8M5qrShAXMZFVc
 pHWh3oZEUbFYA6P2lvg78KvrcGLoqltD1gM3VRCdFC0xsyW8LETBjemSO1uyF8azMVulYAjVHP4
 MOExDdr4=
X-Gm-Gg: ASbGnculRBmk3HSeMe1evAi5wsN7e4p96o2aKoRJnwI8rToDFWmuEWnoPh+W3Yii5zU
 jc0mDIM+FUhIyndSeFEL5FOjliiCy73GihfL/Uhpd66IeGncT3LsJnwVmLRazY4UFUf0bGIvJpl
 7Pii9MqW13gcEvoZYyb4EH3AMMdzUCXuXIDk7OOxb23F6vZRVPqV+qAR1m7MQDyxUCrzEN948OG
 E5XqFoggJjGeByVjdfmSxbkb11+YN4TiIea8J+3q+Pm1B4idQOq9NRJHRBXKvr0glk70SKdgUhP
 x9s3oqMa1EfeU3hEt3IFdlFG+6ltjoQqhtnaOQPsylgS5LmswpJmOdreFGLlH/nLHXmWW+e6s5v
 ph8jS0YhyG+A5wcQom87cPUq8bzab0ENaDYpvkw+14tJJ5rxFEmCT+QK1D7Lgf4VEz17dZ49gEr
 82ZWXUhy872h3zqkWPF1wkdaYj
X-Google-Smtp-Source: AGHT+IEHx7Y6jk/Spbhsy5ei4r3FsxUJzdXnP27MbK+9nrK9CjGYI8K0YFI9T5aCwv+9CSAqjazwqg==
X-Received: by 2002:a17:907:9627:b0:ae3:163a:f69a with SMTP id
 a640c23a62f3a-af9c655d877mr1231187366b.33.1754914136816; 
 Mon, 11 Aug 2025 05:08:56 -0700 (PDT)
Received: from dragon.local.ess-mail.com
 (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a218ab4sm2015207666b.92.2025.08.11.05.08.56
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 05:08:56 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 11 Aug 2025 14:08:50 +0200
Message-ID: <20250811120851.543585-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754914138; x=1755518938; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=bL5MJjRR4ROLnQ0un84LCUGwPmmrIKLzUiQy3UzptZw=;
 b=TmxrllTyrR+SSEpGZgDKRRyKKwyilG5qPoPNeT3JQhugqJewBmndxHfIH3Qnxfotev
 zkHtV+tqt63dkPYmY7NaT4cISOtFr1eCrOlbK7nM1f3hgg+CyovRA2zQm+aYTaA/gbUK
 quqyDsHLUd2MjBoo+IUBrhsEGlc0q53IjA1cHxerkYFVoGzHm6i0jBbAAT+3ETy0IMZF
 rf52e/dWM9ObFZTw8nsqhNSTJtFqAmvBjh/+CFUAqGZY/vXBkpisC5fSRMS6CHqmX3D5
 3ARY93drW8+ek/q/rrfDqp0kwVgBVNTNbDlguCwCrpPt7KPcFb+ajEaWxRJGkuo6Zj0I
 ASxw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=TmxrllTy
Subject: [Buildroot] [PATCH 1/2] package/ofono: mark CPE as valid
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

The default ofono_project:ofono is a valid CPE, see
https://nvd.nist.gov/products/cpe/detail/734A0A32-DA21-49B8-86BD-1A60C7CDF864

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/ofono/ofono.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
index 1ff43092c4..ba0846e823 100644
--- a/package/ofono/ofono.mk
+++ b/package/ofono/ofono.mk
@@ -9,6 +9,7 @@ OFONO_SOURCE = ofono-$(OFONO_VERSION).tar.xz
 OFONO_SITE = $(BR2_KERNEL_MIRROR)/linux/network/ofono
 OFONO_LICENSE = GPL-2.0
 OFONO_LICENSE_FILES = COPYING
+OFONO_CPE_ID_VALID = YES
 OFONO_DEPENDENCIES = \
 	host-pkgconf \
 	dbus \
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
