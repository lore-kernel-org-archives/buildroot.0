Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87719C79F87
	for <buildroot@archiver.kernel.org>; Mon,  5 Jan 2026 13:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 350AE40688;
	Mon,  5 Jan 2026 13:24:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id chqBXwK-Jeac; Mon,  5 Jan 2026 13:24:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4644E406A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767619441;
	bh=yR1k8uG8hHAEHYOZfnghGIO1fPLhK1wIpTiPJI2GAPg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Sxb0+zYvbuKOHrlPzGzEggw/KDpG/P2nPWZP86CaQ3Hzgo2b1GZNcms+v2wkD+Qs4
	 vypKXxyoMx0MOfQOWyQ2G7YSnTnS8QVDVGTboYnsII+ST2qK5L9vlYb2DqhBf3CJvw
	 6kzxNA4Jmyh5mdZkza+JjVdAeldEQX+UxIxqaCLqeN7FwDZEshcLxiFtWZe9mNsdU7
	 nUb4jbg88yCAKylE4G38xKpmss/wnXv34509wnkWLu18X2CJNW6VdcQkzeBq3qliJa
	 QoB9DRngUMivhxgzB9huRaWbVofBkQdY14/Sxn8mZRniW1ov5NnRwoiAVl6EYRlz8H
	 vtTT1QO9wN4gA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4644E406A1;
	Mon,  5 Jan 2026 13:24:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B6E612DF
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 13:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D4E6406A1
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 13:24:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dywKGknMwLnC for <buildroot@buildroot.org>;
 Mon,  5 Jan 2026 13:23:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7D26240688
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D26240688
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7D26240688
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 13:23:59 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-64b9dfc146fso3486531a12.0
 for <buildroot@buildroot.org>; Mon, 05 Jan 2026 05:23:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767619437; x=1768224237;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XWa0PE2CVnKPzRbe3SeRMXEKc0Or3fEEzxD701nrSgc=;
 b=xJj3MGGYgZ+zz0RZJgYeCWryQarlN7sTPh7W7sY4yvCYYKrwhLJLdA4/5+rklXgHPK
 JiTdtl/tudsx8S/YqQGT1yyOhvOGJateFro/EjxMMxRC8xZZ7Dd/JURDqVkSkoMSrGxe
 78PDgRvclkl0h1QLU6Bl7UFBC2w0H9jP/fuWwOXzv8ITM6IdOnAptV1iPKcXl9air3pg
 C52ZkL62BnPnvFZ7y/QcHwV6d1OAIsVS3aCeE/vFPufnMl1ZroRIaQO5GQW/VFpOtFEb
 Locmf0P4sDzYe6Y6hFvGpA+Fw4OuZ5KPMbyJSeJ2IbNKq0zcn9KA7Y9e88dTRyhpBNbv
 0dCw==
X-Gm-Message-State: AOJu0YzFI/cwmFFCTUXoewQK19voD4zg/ziT9KdtHVH5ZD7O5cTfxysz
 4NO3OaPz7upz48VPCDq7Ut1Rldhjrsd885ElZTOztXREuZNTVUXNSKJ15Mx1WQ==
X-Gm-Gg: AY/fxX6Ut/fZm1b1ZZdhFE46xnhjQIMsmPf9/xCXF+kAgnmVcpk+UVOQbkoLTAqQRwu
 /jWCJHf9nd+j6UYrnbDz+af41PlUoTwOT17CQRpSbt+8bfTTbqc54yq/phScZKK9SeTgKTCteGX
 Hka6zaXzq1wjrc4cuaJ2W1/7iLRBIh/SC2FcvPojhCm7EmJQ2rNqk7PwgXYAtsWjkiGA8NYe3Ys
 uCZ2beRabmqBKNk4JyGz2+0SiSE9pts6XFeMcUYQGxAoavp+VQ9oAJFXDXHr//0qT4/Q622K5+H
 8u9IawOPRiU9v098lJJMUbEzNGfcHOG6Z66Kckxh39kFth8TNzETZHf1MlGfmvSMzWGayavEZWl
 p5OKEVHAcmlg2K0kTEmogZgzTFGGVQ7Mf4BSnJkYW1Y/XxeVuxU1+/Hmzad2JL6Hc8N63RQDI5K
 7pO/GUn1QALUYJj+SYY5xcJNIRAg==
X-Google-Smtp-Source: AGHT+IFiypbCQ8E5k2nAf3lESRpwHdDcDl7tMiQzCdzA5EvWfMMeXc5bKN/OOprEVyFxtveFP8Z1SA==
X-Received: by 2002:a05:6402:34c9:b0:645:d07:8924 with SMTP id
 4fb4d7f45d1cf-64fd4b4914dmr7678113a12.16.1767619436638; 
 Mon, 05 Jan 2026 05:23:56 -0800 (PST)
Received: from hthiery.fritz.box ([2a02:810b:5a04:dd00:18f9:775f:be73:a0e3])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64b916b82e7sm57867232a12.35.2026.01.05.05.23.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jan 2026 05:23:56 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Jan 2026 14:23:27 +0100
Message-Id: <20260105132326.4867-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767619437; x=1768224237; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XWa0PE2CVnKPzRbe3SeRMXEKc0Or3fEEzxD701nrSgc=;
 b=lT0vEmBBjGcr9jjYWySmkBvv72bLAbJG7+wVSE6y0mWhCVpvzb0/fgPHXTwulR7xN1
 pG+q/Fqt6TH/VjjMRQ7gBruvJKW+guLQhkaMz0zklnkw1pHxcb+g7OGJ5fhh6MioLm2f
 Gg5C94YJvDhgcYn4eDCI2QB/eeTCmkjeljUDx5BCd+AdJMzAm0cn/QqVwWv2ekThVTGZ
 42W04+cVk3AeP8OcLr81TW8TWZrlFLiq7diiKCVrp8Z5rR//Dska0p7hHI8hHVOngz+e
 +Ce+wrKk0DFlRR5I6dSGVsjV6NdZ+nIgOcmmGnxY+jR0vvo5PT92lRTWhUKUrKHi1wMi
 fpzw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=lT0vEmBB
Subject: [Buildroot] [PATCH v2] package/uboot-tools: use U-Boot host tool
 printinitialenv to extract environment
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
Cc: Matt Weber <matthew.weber@rockwellcollins.com>,
 Michael Walle <michael@walle.cc>, Heiko Thiery <heiko.thiery@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

If u-boot is compiled with the LTO option, it is no longer possible to
use the script 'get_default_envs.sh' for creating an initial U-boot
environment binary image. The problem was already observed and a solution
available upstream u-boot since the commit 486aef08de09 [1].

This was first available in release v2023.04.

Now if the the new tool 'printinitialenv' is available it is used. The
tool is build with u-boot that is a dependency of this package.

[1] https://source.denx.de/u-boot/custodians/u-boot-tegra/-/commit/486aef08de091ca35386f32fe961a201c3cfa9d4

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
v2:
    - used hint from Arnout to check for availibity of the new tool

 boot/uboot/uboot.mk                | 4 ++++
 package/uboot-tools/uboot-tools.mk | 9 +++++----
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index c92568a559..e613d015a9 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -144,6 +144,10 @@ UBOOT_MAKE_TARGET += u-boot.stm32
 endif
 endif
 
+ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE),y)
+UBOOT_MAKE_TARGET += u-boot-initial-env
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_INITIAL_ENV),y)
 UBOOT_MAKE_TARGET += u-boot-initial-env
 define UBOOT_INSTALL_UBOOT_INITIAL_ENV
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 1925047ccd..f8d9cae270 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -154,10 +154,11 @@ HOST_UBOOT_TOOLS_DEPENDENCIES += uboot
 ifeq ($(UBOOT_TOOLS_GENERATE_ENV_FILE),)
 UBOOT_TOOLS_GENERATE_ENV_FILE = $(@D)/boot-env-defaults.txt
 define HOST_UBOOT_TOOLS_GENERATE_ENV_DEFAULTS
-	CROSS_COMPILE="$(TARGET_CROSS)" \
-		$(UBOOT_SRCDIR)/scripts/get_default_envs.sh \
-		$(UBOOT_SRCDIR) \
-		> $(UBOOT_TOOLS_GENERATE_ENV_FILE)
+	if [ -x $(UBOOT_SRCDIR)/tools/printinitialenv ]; then \
+		$(UBOOT_SRCDIR)/tools/printinitialenv > $(UBOOT_TOOLS_GENERATE_ENV_FILE); \
+	else \
+		CROSS_COMPILE="$(TARGET_CROSS)" $(UBOOT_SRCDIR)/scripts/get_default_envs.sh $(UBOOT_SRCDIR); \
+	fi
 endef
 endif # UBOOT_TOOLS_GENERATE_ENV_FILE
 endif # BR2_TARGET_UBOOT
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
