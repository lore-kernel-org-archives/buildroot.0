Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B2EC433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Jun 2022 08:30:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27D9461049;
	Tue, 21 Jun 2022 08:30:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27D9461049
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2-Be_wOFCT6A; Tue, 21 Jun 2022 08:30:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34D556101F;
	Tue, 21 Jun 2022 08:30:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34D556101F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B14271BF5DB
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 08:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A36141892
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 08:30:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A36141892
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rj1sUZKp7O3v for <buildroot@lists.busybox.net>;
 Tue, 21 Jun 2022 08:30:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FE52416F7
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8FE52416F7
 for <buildroot@buildroot.org>; Tue, 21 Jun 2022 08:30:36 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id g26so4499724ejb.5
 for <buildroot@buildroot.org>; Tue, 21 Jun 2022 01:30:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yxQFQI3kSofPC9PFa/WXJXpCBkNz6BfcSQVt/9S5HGY=;
 b=Etfyief22HVaXG8us94f92IFGWBt6epFDWnyw4p1v41iKog7CNm7Bk4wL2X9LhMAwT
 vmiZV1pfO8uyOtASlAy3lS4f6UneCoZBXRzLAbHFHQOeB8pEBtSSzcwLy7nAgZvHyuKs
 IzEkGNOd7fWCaLc7HaQO/eozg8q8rN4nFTr594w3Auk7Q+9WyFc9I1tXbvyzSncjT9y3
 7YecHrVIEI6xLHz3fqfSXCpzXEDCoTxjLbicnCtyadn1alf9v7Go/ELqxiKuK70sZ401
 rBlxBp5Inljk70EVI+NAb2hYfMlI16+GNj8xzkzoLc5QXzH19wsS5D75vMauvFDxlNg/
 nTJw==
X-Gm-Message-State: AJIora/CtzP7KOQPcZ+fQC/Zo57zehu1IHNi8BLNRHmWfrzxhkcObstU
 iVTvVIkcXgfqch9FXVAOKPn9KCttPj+S3w==
X-Google-Smtp-Source: AGRyM1vtRQ80TmAjEb5k1qcPwvJZA/gnSyp2At8kUsEuJhxLrUBv6K7/fJJOLR8qPPHOAr6yvXCkIg==
X-Received: by 2002:a17:906:51d0:b0:6ff:2415:fc18 with SMTP id
 v16-20020a17090651d000b006ff2415fc18mr24373285ejk.94.1655800234433; 
 Tue, 21 Jun 2022 01:30:34 -0700 (PDT)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 c5-20020a056402158500b004356b8ad003sm8019362edv.60.2022.06.21.01.30.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 01:30:33 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Tue, 21 Jun 2022 10:30:27 +0200
Message-Id: <20220621083027.2587218-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/qemu: add qemu host tools
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Devoogdt <thomas.devoogdt@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Devoogdt <thomas.devoogdt@gmail.com>

Always build host qemu-tools e.g. qemu-img.
https://qemu.readthedocs.io/en/latest/tools/index.html

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@gmail.com>
---
 package/qemu/qemu.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 290186ec4e..9e1bec3836 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -390,6 +390,7 @@ define HOST_QEMU_CONFIGURE_CMDS
 		--disable-vnc-jpeg \
 		--disable-vnc-png \
 		--disable-vnc-sasl \
+		--enable-tools \
 		$(HOST_QEMU_OPTS)
 endef
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
