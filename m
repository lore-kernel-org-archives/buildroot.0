Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A65FCC64EC4
	for <buildroot@archiver.kernel.org>; Mon,  6 Mar 2023 15:51:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D1FB81441;
	Mon,  6 Mar 2023 15:51:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D1FB81441
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PkGilrZ5tTDf; Mon,  6 Mar 2023 15:51:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BC0281747;
	Mon,  6 Mar 2023 15:51:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BC0281747
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 687EB1BF399
 for <buildroot@lists.busybox.net>; Mon,  6 Mar 2023 15:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 435BB4051C
 for <buildroot@lists.busybox.net>; Mon,  6 Mar 2023 15:51:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 435BB4051C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4BkGNann0DaV for <buildroot@lists.busybox.net>;
 Mon,  6 Mar 2023 15:51:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51083400F2
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 51083400F2
 for <buildroot@buildroot.org>; Mon,  6 Mar 2023 15:51:49 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id ay14so36820143edb.11
 for <buildroot@buildroot.org>; Mon, 06 Mar 2023 07:51:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678117907;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WfsaWlUQwsSkWzvjUO5tBQmTHoVWBowoL5tx7RaEahI=;
 b=roMwuhhddOXCuMGVsbvqu9R7WH4SJ8vWQurAVcAr5IsUo+ANl7+JVKhWgPcokphYZh
 5PfcL0wwpnqKKwREbo2olRlYq7Za4/rkcYLXjquKYeJimJ8QN2nAwMaQmNlZGyRsVX3i
 KZ/khzgoruorF23WDalczqls3jh56B0MJOJy98hVcfHLYz3aSGbZwn0H/Z8CiCL0fyz+
 0GXsHWTMILDWXsokeiYbVTey8QXO3qV6kLflxcUeo0u4NbMn3uVNukRqQFn4mysabE+6
 mxHsVFTdSxGFLmH9TSUs9sNjn2LMj1kZ/pyUiiMKerO9Il1hCvoPwLniN7WcKp5/xiyh
 ehmQ==
X-Gm-Message-State: AO0yUKXERqCXe7bYqwFbOn0OYcsbmQjMRGPHUDjotgGGWjza2FXT1uMi
 DcIDSscWM2sgJqBo6aelG3RTiPOdz++Jnw==
X-Google-Smtp-Source: AK7set8zvPxFH4a4tKV7I+RaRyA0jUB9H2nwO7jT1RQ+QUBWqiFFiZHHVORIZ/Jo293849Fwm7ejfA==
X-Received: by 2002:a17:907:8c8a:b0:8ee:babc:d2dd with SMTP id
 td10-20020a1709078c8a00b008eebabcd2ddmr10567460ejc.18.1678117906762; 
 Mon, 06 Mar 2023 07:51:46 -0800 (PST)
Received: from hthiery.fritz.box ([2a02:810b:5a40:2a43:7200:ad55:a3ad:7bab])
 by smtp.gmail.com with ESMTPSA id
 a15-20020a170906368f00b008f883765c98sm4804399ejc.14.2023.03.06.07.51.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 07:51:45 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Mar 2023 16:51:35 +0100
Message-Id: <20230306155138.476438-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678117907;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WfsaWlUQwsSkWzvjUO5tBQmTHoVWBowoL5tx7RaEahI=;
 b=iHyR9eP46XtbVD3n3kmIsEUVlMnaTKCzUPHqAyD9PvAryleZtmZHJQAkERMBsKo5vo
 kodXFqZEoq2ffmrn2uh3l7sJW8d8DFo5/5kZo20ib2lsfp4gO2QxjzOFIRa55SB/Ll/U
 FM8JKoG66Rjw4x4eHXf9DgT8MaWF7Y8N59aOf9pFlmkW0AfaHubmLALoNf23eZvz7aP1
 rosVWwUap9ilPA4qzISX6X8Qh+mNKS3hS92tpQhsMQ+oHjFNt4J7U6AUJ7vl7YJQkF5B
 cOaLqnF4RtnMQrBCir5TKSK4qIRfW3rkWqDW17fZ5ckb3eLDjAovg7io/Nh41CUpOpal
 DQxQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=iHyR9eP4
Subject: [Buildroot] [PATCH 1/3] package/rauc: bump to version 1.9
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Heiko Thiery <heiko.thiery@gmail.com>, Andrey Yurovsky <yurovsky@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/rauc/rauc.hash | 2 +-
 package/rauc/rauc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rauc/rauc.hash b/package/rauc/rauc.hash
index 8351d0266e..1cd5f7f314 100644
--- a/package/rauc/rauc.hash
+++ b/package/rauc/rauc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d233247c1763b1c56c851d0adef2094b7aa2fcd72decf524a8ac0419188e0978  rauc-1.8.tar.xz
+sha256  73802ce28d1045c757b547f5b4a222f0e825b5df77bca3464350278fc6fd200e  rauc-1.9.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index 0c81a6cc35..2baa25ec9e 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RAUC_VERSION = 1.8
+RAUC_VERSION = 1.9
 RAUC_SITE = https://github.com/rauc/rauc/releases/download/v$(RAUC_VERSION)
 RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz
 RAUC_LICENSE = LGPL-2.1
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
