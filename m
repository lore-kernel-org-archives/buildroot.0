Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC17DD41D74
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 11:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F49A814C7;
	Mon, 15 Dec 2025 11:43:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JeEwsdVbkzxT; Mon, 15 Dec 2025 11:43:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56C89814EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765799013;
	bh=wCf/w6FdCMTl0w9G7qGO3rNFipmMQI5ZmveM3a895o8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M8WnWkCWkMUZAbk5IE+heCci3trUJHW2RcYz0/sKlc+/4R3Uifng+RxDTrcxnzOI0
	 859imOH4EnfN1wvrqFTK+PHuDVyC1zWVVvg9guwZa9rhC5zQwYg2Pu7lpYjINdY3CA
	 OQrWjytJcajaUtFsKMHfj5r+7jqDwCqiQggz5ZubMV9xch4M++H2SOUEBNDYYPoExd
	 qXPkosAAeF0dHIhDgikTrxIBXa7RZZBwyM6AWpgyVhgtwHjXfuCx35BuIV7WfkbAZ7
	 owSckGCMCgFlvTPc8sFfHSHkq8dQK0gu66y3IBAhT81pNZWeATEep1nU0QOMuz6m3a
	 1fAOWR3RxI5ZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56C89814EA;
	Mon, 15 Dec 2025 11:43:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7AD2E117
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 11:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6CAD04077D
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 11:43:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9DubIZ3HjxlX for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 11:43:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AE7E9406C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE7E9406C6
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AE7E9406C6
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 11:43:26 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-42fed090e5fso946326f8f.1
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 03:43:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765799005; x=1766403805;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tyZPKD7RW9FlZ26r22ItfqjpZPFSSL996j+zndkK3GM=;
 b=J34RB1vzSlACq8O5KTLRQfmiWTKbVCNzbclx5pL08lP2EZsbTZRjmV24pldB0gFNjk
 +CLhzIiZLDBhCdLa3kqApuWtnlgnay1OemCc1YEOOWU8aXpIDSCohZUirfcGwPDw8/0h
 OyLf39yrLVvGoCZStvS6bFesWd+9VIIpenLqdeq3VmWmYSyog9s0O5W5A9poBxAKSTwK
 UM5mARb0vecQ5QZgh0EQnYa1G3RwZPIZZHVlJ/3Kvw2v7CgCWIM29qRrP/dKxW1drQPY
 rftGXe/TXlR61+AQBnHbi0aKW2038cZy/aDNOWvcYFt05YhMTIe27IvMBAAVhVdE42Cx
 kofg==
X-Gm-Message-State: AOJu0Yx7FeYJ8IPmFf/VjnVYaGW+kZxH6qjIG7uWEpmHJyiw+hZB/rfu
 /sRcswQeqHnY9Gi39IM5TWtL4GJzMxGC/bSkxot83Zhdd78vKh+kfVjs3zLbPg==
X-Gm-Gg: AY/fxX6XPFCr67IeGLG2o4q6nAYCIWp4bti39/V3Hz8ThE47hBLpqSCpuHAqI0cgGRz
 q6efxbBUF0zsB7qfSt0xocdsDqZ02PZg7Qv5dSl4DxkiSEEDpE+kNpG4a6YqIHMIh+fX2ZjSCsk
 uvfqNzFFbtuQVwopRa3qR17YoD/uWc+QWFMmF68nmgxTQ3XtnrZebcUo8ZgvAVZ3grk49A49JWk
 UYvdFufpmUcmFapv9q4pF0MiiacJ9gPmyX3M80+bcHP8Mpgi4vMrP8xLwtBm3HID0w0vyx98ZiC
 G0Go1B4E+la/mDr3UgaJge7uiOP0Jbl/lhbQ5W88rOF9EnzgGAp2rgM4iF/Nq74g131DFtgHRaQ
 XNva/H9MyPPHxVqpEG0kpSMv7y7aEBxbEzej1oHL8F11+ICEAtLRQB+RExSkz9RgL+/VdXTPlRU
 GB24w=
X-Google-Smtp-Source: AGHT+IFOlJMoLy3SLuZPpmouJY00Ve1px56ycQ2f2s55Kge7m8bwYX0J8n/TekUoM520NpmshtdQGg==
X-Received: by 2002:a05:6000:178e:b0:430:f3ab:569c with SMTP id
 ffacd0b85a97d-430f3ab58f3mr7941353f8f.53.1765799004513; 
 Mon, 15 Dec 2025 03:43:24 -0800 (PST)
Received: from freepad.. ([2a01:e0a:6f:bdf0:a136:2350:a5d3:b428])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42ff626b591sm16349117f8f.15.2025.12.15.03.43.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 03:43:24 -0800 (PST)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: ju.o@free.fr,
	vjardin@free.fr,
	Maxime Leroy <maxime@leroys.fr>
Date: Mon, 15 Dec 2025 12:43:02 +0100
Message-ID: <20251215114302.32596-8-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251204134742.406507-1-maxime@leroys.fr>
References: <20251204134742.406507-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765799005; x=1766403805; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tyZPKD7RW9FlZ26r22ItfqjpZPFSSL996j+zndkK3GM=;
 b=k8uOwCXDyOIolauzqbmq54XSVrXgl8JwcGyVmuyv1Vt96mrsm8qi/nrrWVkjFXz+eZ
 lzO/S/RUzM8iEvRz9zmgAZvi+vX21u4GnOMzEFP2SPpcQTN0XS7mBR4ODCT59TMpJ2kW
 6qvTj25ubLFjvUzwgtQeRXft74bF8eD7g8vdrpJ+PwYdIuHiu0v7xfDePxVnkTjCLD9n
 10R7ArfAF032b0XiIn5LA+IEHNfGRXuS3Ntr+yr4z+mYACP+Nz+HjlA13Y4gj9eqbFBU
 eAmvDD1LAOfCkvUILXiLBkZolxt8pdI6qVEWwoEVWlZbvg0EBGDGS23fhfBkdkt5caUM
 O1Gw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=k8uOwCXD
Subject: [Buildroot] [PATCH v2 7/7] package/dpdk: add option to disable
 target installation
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

Introduce BR2_PACKAGE_DPDK_INSTALL_TARGET (default y) to control
whether DPDK is installed on the target. When disabled, DPDK is
kept in staging only for build-time use.

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
---
 package/dpdk/Config.in | 13 +++++++++++++
 package/dpdk/dpdk.mk   |  6 ++++++
 2 files changed, 19 insertions(+)

diff --git a/package/dpdk/Config.in b/package/dpdk/Config.in
index 627683d283..c220b4d01a 100644
--- a/package/dpdk/Config.in
+++ b/package/dpdk/Config.in
@@ -37,11 +37,24 @@ config BR2_PACKAGE_DPDK
 
 if BR2_PACKAGE_DPDK
 
+config BR2_PACKAGE_DPDK_INSTALL_TARGET
+	bool "install DPDK on target"
+	default y
+	help
+	  Say y if you want DPDK libraries and tools installed on the
+	  target root filesystem (e.g. /usr/lib, /usr/bin).
+
+	  Say n if DPDK is only used as a build-time dependency from
+	  the staging directory (e.g. for static linking), and you do
+	  not want any DPDK files on the final image.
+
 config BR2_PACKAGE_DPDK_EXAMPLES
 	bool "Install examples"
+	depends on BR2_PACKAGE_DPDK_INSTALL_TARGET
 
 config BR2_PACKAGE_DPDK_TESTS
 	bool "Install tests"
+	depends on BR2_PACKAGE_DPDK_INSTALL_TARGET
 
 config BR2_PACKAGE_DPDK_DRIVERS_LIST
 	string "List of enabled drivers"
diff --git a/package/dpdk/dpdk.mk b/package/dpdk/dpdk.mk
index 080f924329..2f744e519f 100644
--- a/package/dpdk/dpdk.mk
+++ b/package/dpdk/dpdk.mk
@@ -74,6 +74,12 @@ ifneq ($(DPDK_APPS),)
   endif
 endif
 
+ifeq ($(BR2_PACKAGE_DPDK_INSTALL_TARGET),y)
+DPDK_INSTALL_TARGET = YES
+else
+DPDK_INSTALL_TARGET = NO
+endif
+
 ifeq ($(BR2_PACKAGE_DPDK_TESTS),y)
 DPDK_CONF_OPTS += -Dtests=true
 else
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
