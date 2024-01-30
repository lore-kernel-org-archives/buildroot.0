Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8278AC46CD2
	for <buildroot@archiver.kernel.org>; Tue, 30 Jan 2024 21:57:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2791483EF3;
	Tue, 30 Jan 2024 21:57:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2791483EF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zhGK7A-4tpNb; Tue, 30 Jan 2024 21:57:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F44483DBA;
	Tue, 30 Jan 2024 21:57:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F44483DBA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0BE751BF263
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 21:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D901E611F9
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 21:56:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D901E611F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mmut8REdDj2s for <buildroot@lists.busybox.net>;
 Tue, 30 Jan 2024 21:56:47 +0000 (UTC)
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2C6B2611E3
 for <buildroot@buildroot.org>; Tue, 30 Jan 2024 21:56:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C6B2611E3
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2cf2fdd518bso42803951fa.1
 for <buildroot@buildroot.org>; Tue, 30 Jan 2024 13:56:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706651805; x=1707256605;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eo1kNwFuT2Cm74I1A/bm0oqLjY0agKFrG1C87aoa47M=;
 b=czLUyduHhUSl6cn8bqZqRwMTs5edh8IZOR8/T1w34WitnlBfkBXBdV1I2elazBSjY+
 3vmsDdXxmzJwAgkJBf+CaNfVe1zRjVRsvWzbKTC6fzZWr+/jbsgNhRLG93sPtPdm7Bzz
 9rLVOjqUDGVtbGraaCrtrERvzrwVDmJ0VcSxnrYStbIreFn2h81Z6HTYDf3Y1FDALiug
 XjnNdhM9qJyHw1NfiBUxXWqE2Us8Xb2WM6p14MNcFOK9KkXvw1uV3gdt99Ie3gRcDS3U
 ALisl9lBvl5pySf1C94foodgWtxg0hPnhKnyDXtT8pfz73oBEj/B8YD2XttxR4NJpRoY
 Lrxw==
X-Gm-Message-State: AOJu0YyAjz0NvMKUuJyeR2hLcZW2RIy1eP1NWR6tddDGRKmzf+IjIQ4i
 YkP5MvnR/gaYMm6562QA4apGwsRHg3OrV8LFoVZG/gLlq+1/EAsMJ2kfkURb
X-Google-Smtp-Source: AGHT+IE0JMgy/DPyl4EsiIwoLka5eaxuHlceivMNmidJ5pwVnkXMySriWlCHWSGMki4b3Ln/lBE5Yw==
X-Received: by 2002:a19:8c18:0:b0:50e:7f5c:8954 with SMTP id
 o24-20020a198c18000000b0050e7f5c8954mr5655414lfd.40.1706651804726; 
 Tue, 30 Jan 2024 13:56:44 -0800 (PST)
Received: from luthien.lan ([2001:9b0:214:3500::c2e])
 by smtp.gmail.com with ESMTPSA id
 w28-20020ac2443c000000b0051121ce0ad8sm105435lfl.32.2024.01.30.13.56.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jan 2024 13:56:44 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 30 Jan 2024 22:56:25 +0100
Message-Id: <20240130215628.884512-3-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240130215628.884512-1-troglobit@gmail.com>
References: <20240130215628.884512-1-troglobit@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706651805; x=1707256605; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eo1kNwFuT2Cm74I1A/bm0oqLjY0agKFrG1C87aoa47M=;
 b=IxC3sOmlPgiBt00RfGGNMrxOBwtsDYNFR9LD3qtCidVkRvb6ho98e/DVumQSzfV/ME
 55C+e4Qsw8UYRyxmEx+uMhv9FGrjYtsladXWISasC8nC9R3Rw6dtY3Jurd2PjMUQBgrK
 A+DGEbGoU9//dybtlL6H8GSB2Ls1+66b3asxxuLTu1wHAI8BhUgZPR5Hcisf8mR//eC1
 PFogQxb8dQAVoYrpAQIRtvYC49UHq1AXhNE/aHWRUkYSm0DsK1ZzHSzBrvqlYQeG+VEk
 5xedsEfEzEzHqvhuDwlcwlRRxPBU2k4UtlfmDj5otFHH4FOrNK+ZrUB5I6gAjbJzMgxv
 W4YA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IxC3sOml
Subject: [Buildroot] [PATCH v2 2/2] package/watchdogd: add menuconfig
 support for new system monitors
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
Cc: Joachim Wiberg <troglobit@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/watchdogd/Config.in    | 10 ++++++++++
 package/watchdogd/watchdogd.mk | 11 +++++++++++
 2 files changed, 21 insertions(+)

diff --git a/package/watchdogd/Config.in b/package/watchdogd/Config.in
index 0b0480ea27..0aeaad165f 100644
--- a/package/watchdogd/Config.in
+++ b/package/watchdogd/Config.in
@@ -51,4 +51,14 @@ config BR2_PACKAGE_WATCHDOGD_MEMINFO
 	help
 	  Enable memory leak monitor.
 
+config BR2_PACKAGE_WATCHDOGD_FSMON
+	bool "File system monitor"
+	help
+	  Enable file system monitor.
+
+config BR2_PACKAGE_WATCHDOGD_TEMPMON
+	bool "Temperature monitor"
+	help
+	  Enable temperature monitor.
+
 endif
diff --git a/package/watchdogd/watchdogd.mk b/package/watchdogd/watchdogd.mk
index 2e67c2847e..9d06b04bd3 100644
--- a/package/watchdogd/watchdogd.mk
+++ b/package/watchdogd/watchdogd.mk
@@ -43,6 +43,17 @@ WATCHDOGD_CONF_OPTS += --without-meminfo
 else
 WATCHDOGD_CONF_OPTS += --with-meminfo
 endif
+
+ifneq ($(BR2_PACKAGE_WATCHDOGD_FSMON),y)
+WATCHDOGD_CONF_OPTS += --without-fsmon
+else
+WATCHDOGD_CONF_OPTS += --with-fsmon
+endif
+
+ifneq ($(BR2_PACKAGE_WATCHDOGD_TEMPMON),y)
+WATCHDOGD_CONF_OPTS += --without-tempmon
+else
+WATCHDOGD_CONF_OPTS += --with-tempmon
 endif
 
 define WATCHDOGD_INSTALL_INIT_SYSV
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
