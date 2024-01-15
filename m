Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10AC5C47258
	for <buildroot@archiver.kernel.org>; Mon, 15 Jan 2024 07:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D70240925;
	Mon, 15 Jan 2024 07:42:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D70240925
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Efc3RtlSNqEC; Mon, 15 Jan 2024 07:42:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38180417BC;
	Mon, 15 Jan 2024 07:42:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38180417BC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5B13E1BF396
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 07:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4154A81E7C
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 07:41:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4154A81E7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kz3IDZB8dZpP for <buildroot@lists.busybox.net>;
 Mon, 15 Jan 2024 07:41:28 +0000 (UTC)
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 64BD08177A
 for <buildroot@buildroot.org>; Mon, 15 Jan 2024 07:41:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64BD08177A
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2cdb50d8982so11893281fa.2
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 23:41:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705304486; x=1705909286;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Li7kM+6JnTyGPE9S3nHfT6RpOoA6FJJZrH++ln6qs8Y=;
 b=sZzQ2zssAZRiosKGiVqsIgxNZ5bE8ntpWvn9IoHyqJJvRPdVkHQM0wFSjTHmH7OMJg
 3Zo4kOe2nMWfPBUFFZEdP064xNVe6J52vB+sqCVoNRGpapqWiSBcjOvggVoo/E9Qxodx
 SKaJGhRiG0dOBLTowL3d7Jo382rVVaKiNz19KIOgh21vO2vEE7NJfIlQMdQw5MxR4R6v
 TvfqDZ9l/Iwi9N53DXyvxaa2CY2cdoAOHn6l/FX+Omp4aVynDYJksqgR60fsbTK/IAjk
 69SSWdY2Q4wEnqGZyR/kZsdyq3ToREiC/TbiJbd0TL5/8i01vKtO3QEwLIzpgpkwKDkY
 gUwQ==
X-Gm-Message-State: AOJu0YxoP9VkBtlTIqPhwPuwrPUtFPk3f9Jmjs/nzvG4HlLaP3vnMxz+
 l1LNTs68Dxj/ZW+XbLgbaV3TAOTl6FqBhg==
X-Google-Smtp-Source: AGHT+IG0UlHxwduczZXFI8UoiaHw203QC61ZMy90eG2rlLqWoTLCKzFDjeAX/r9BSLWzw4clSZ7xQw==
X-Received: by 2002:a05:6512:3084:b0:50e:6cce:f83 with SMTP id
 z4-20020a056512308400b0050e6cce0f83mr2843319lfd.41.1705304485819; 
 Sun, 14 Jan 2024 23:41:25 -0800 (PST)
Received: from localhost.localdomain ([176.10.248.204])
 by smtp.gmail.com with ESMTPSA id
 fc6-20020a056512138600b0050e9c5b289asm1383913lfb.91.2024.01.14.23.41.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jan 2024 23:41:25 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Jan 2024 08:41:11 +0100
Message-Id: <20240115074112.157216-4-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240115074112.157216-1-troglobit@gmail.com>
References: <20240115074112.157216-1-troglobit@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705304486; x=1705909286; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Li7kM+6JnTyGPE9S3nHfT6RpOoA6FJJZrH++ln6qs8Y=;
 b=ZF6fULN8tw3XJXALMqWXhVCWtbatuavI4Raubt/lbulm1+JQycCs1ZpXuPiS8KtZYy
 DSjLPTpPguEP/8orh7eLsAP23sFJRlEJNoUrcccMzC+ias8mp1gSISZmz6BvV+lijein
 IdHOicE3xbcD7XEGoBWT5B2NbnE9GJYtw4tV75iCudsN0iYi9Y/GgYTrHsuN0/rBMWZW
 ixwiFfS1E2iNZvvyx8JxZ7stXV1Os2xUg37nFlAopFi1Xr7asSS/Gvtx3Ba/PUoSqCBh
 waHJ9NgG9Sqlti9Y+xTBJK96ODuDxrscrosaWH8TD2Mn4jt16/YyGtm+Z5Jc0NLcPlGx
 KGdA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZF6fULN8
Subject: [Buildroot] [PATCH 3/3] package/watchdogd: add menuconfig support
 for new system monitors
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
Cc: Joachim Wiberg <troglobit@gmail.com>
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
index db1bee94c2..2cac60971f 100644
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
index 9af71dbfaa..4c94926280 100644
--- a/package/watchdogd/watchdogd.mk
+++ b/package/watchdogd/watchdogd.mk
@@ -43,6 +43,17 @@ WATCHDOGD_CONF_OPTS += --without-meminfo
 else
 WATCHDOGD_CONF_OPTS += --with-meminfo
 endif
+
+ifeq ($(BR2_PACKAGE_WATCHDOGD_FSMON),y)
+WATCHDOGD_CONF_OPTS += --without-fsmon
+else
+WATCHDOGD_CONF_OPTS += --with-fsmon
+endif
+
+ifeq ($(BR2_PACKAGE_WATCHDOGD_TEMPMON),y)
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
