Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA68AC00140
	for <buildroot@archiver.kernel.org>; Tue,  2 Aug 2022 20:22:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6ED6F409DE;
	Tue,  2 Aug 2022 20:22:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6ED6F409DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pz4zyRbXsRyz; Tue,  2 Aug 2022 20:22:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 89641409D9;
	Tue,  2 Aug 2022 20:22:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89641409D9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4CF4A1BF3B8
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 20:22:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34EF1817BD
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 20:22:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34EF1817BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nQn5RHfWvKBy for <buildroot@lists.busybox.net>;
 Tue,  2 Aug 2022 20:22:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21619817E4
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 21619817E4
 for <buildroot@buildroot.org>; Tue,  2 Aug 2022 20:22:10 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id bz13so11202196qtb.7
 for <buildroot@buildroot.org>; Tue, 02 Aug 2022 13:22:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=68GUWXX8CsoTbYUvicdsU4ZDOrHwkLxyuPHZlFrFRro=;
 b=hO4vOz8B/yVgg+IeaD0zMnYVH+jJO9fzs9IHpyUOitRvgvj03CvsltTAzRl1DWpMiB
 Kx65fnVaE2hQkffuBQTcmfWiU42S8N0BMrNu0H0lbNiAQd7RtIgNVVQtst+LI40+BDYe
 xl0L3f/M7I/HuUHmPtc2m1v1wfKmGFfgDjAn3t5RR6hfEwT1EqH6sScX/TKluInXHj+m
 +mjW78btl7R7g/+AsWkdb8H5V/jYigT3wscsH5WpFgoh6BNA1GxZUd/cKu6tcK1goiDn
 oYManA9Am/GNNeWfS+xWRV+GzwkBzA2JrUmzkg7zQ1yCRlLEzn6qJJN2zvBXt+9/UPcO
 bESQ==
X-Gm-Message-State: AJIora8xekX5zdfP/v8e+q3N5AyRvudGFalqahDXQ+Uizt2bedHl/WNm
 jEsHbq42BsU14rAWTKeW45iF1THfkuHQEw==
X-Google-Smtp-Source: AGRyM1vI41O2YAl2QMAKmEpw7XEWt1X4vlnA5iV46XLC7Scmyrbnd0x+K5Q0tVyeKyqp79guuaisjg==
X-Received: by 2002:a05:622a:1a0d:b0:31e:da67:7cb4 with SMTP id
 f13-20020a05622a1a0d00b0031eda677cb4mr19676420qtb.643.1659471728946; 
 Tue, 02 Aug 2022 13:22:08 -0700 (PDT)
Received: from hefring.. ([50.212.55.89]) by smtp.gmail.com with ESMTPSA id
 x14-20020a05620a448e00b006b6757a11fcsm11661660qkp.36.2022.08.02.13.22.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 13:22:08 -0700 (PDT)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
X-Google-Original-From: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
To: buildroot@buildroot.org
Date: Tue,  2 Aug 2022 16:21:41 -0400
Message-Id: <20220802202142.1770838-4-Ben.Wolsieffer@hefring.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220802202142.1770838-1-Ben.Wolsieffer@hefring.com>
References: <20220802202142.1770838-1-Ben.Wolsieffer@hefring.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=68GUWXX8CsoTbYUvicdsU4ZDOrHwkLxyuPHZlFrFRro=;
 b=bTQYHgFh4GK1txpsFSrWBbS5K5hruHJc2/NIJCRxIyQiebC8QoVRR60dTE0jOq1KIf
 8klKkCinaHk0eVWtvcocjHEbrI+znMxGSzkxxiSOzoTE5sMBRtF49AJT20fn4QNBC9Df
 jECWWmhHH9rLzev4SCw6ezFpIRwwssDoqWKbLmUgwyT9yDZzglWB4MBNI1HtF8tl3TK8
 9NNqiiieRsxn4qVc/csCk0aXJVYkUsj/YDjWgJgVO30bMz0QnIYVVHRPnsLnd/XWqMTo
 qsJhDTTjc1JuPWek68NAfXr5ndonB+VY7v8xb2JQakBdcyGEVKfOAAbTUKWC0ONNpG5B
 UaPQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=hefring-com.20210112.gappssmtp.com
 header.i=@hefring-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=bTQYHgFh
Subject: [Buildroot] [PATCH v2 3/4] boot/uboot: pass -mno-fdpic if FDPIC is
 enabled
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
Cc: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

If the FDPIC ABI is enabled by default in the toolchain, it must be
explicitly disabled when building U-Boot.
---
 boot/uboot/uboot.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index a9f9b1bf16..4955a59a60 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -158,6 +158,11 @@ UBOOT_MAKE_OPTS += \
 	HOSTLDFLAGS="$(HOST_LDFLAGS)" \
 	$(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS))
 
+# Disable FDPIC if enabled by default in toolchain
+ifeq ($(BR2_BINFMT_FDPIC),y)
+UBOOT_MAKE_OPTS += KCFLAGS=-mno-fdpic
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_ATF_BL31),y)
 UBOOT_DEPENDENCIES += arm-trusted-firmware
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF),y)
-- 
2.37.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
