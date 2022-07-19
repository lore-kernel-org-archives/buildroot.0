Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 274EFC433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 19:01:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DD03827CA;
	Tue, 19 Jul 2022 19:01:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DD03827CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 90JTp741NPPI; Tue, 19 Jul 2022 19:01:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85A3A8270B;
	Tue, 19 Jul 2022 19:01:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85A3A8270B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7E9B01BF580
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 19:01:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F2388270B
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 19:01:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F2388270B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q2IhUSctygX0 for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 19:01:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6806C81306
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6806C81306
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 19:01:46 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id y4so20900526edc.4
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 12:01:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0duXxbVNPgUy0+XRtpQg9wkcQ8lanIgDihHvuFEJegQ=;
 b=iIGwFUxxHKEtep20EnVpaCzxpSxPewaIQ7G09T5x9f9Jow25Nhirl7+D++jX5VwbgO
 moRs5DcgDZDRUPCKhr8QxavPfRoS/EVYksSeBJqhwKZ7df1J1ASGJtrsXl4x2bx/UmED
 YLsJ/69fbDGqz0qVVmL/YPIhjeAMvjVGZ33v4WXvtHEydlfZZ1jgJLPSMwX4425WriVa
 YWvYoDRsRMGYNJSfC/o+0ks/RpNMrnb2urJsMHC7mVw9z6CPHIA7v/b08qQCdVHwJUG2
 AkyV3CIMxeP7P2/Ulzps7A06Bv68kzmVFhQyLFo78WdbL1HYAfOZdnqTpadKaTu8ZHM2
 DdcA==
X-Gm-Message-State: AJIora/JP3apgM+rn5KGA+Oo1EgbzduHVFRd2FGYgxh8aCUxM6gPczih
 X2kLY1hz5bkZ8T4Lc1tevJRGoKeYLe8=
X-Google-Smtp-Source: AGRyM1urPOLMWXNZV8GqTeOxyMj800i4KHH6JvncOETRZrWvpvMynR0gpHXi7DM+fPhK5IIXenGB4Q==
X-Received: by 2002:a05:6402:2554:b0:43a:902b:d31f with SMTP id
 l20-20020a056402255400b0043a902bd31fmr45647720edb.416.1658257303785; 
 Tue, 19 Jul 2022 12:01:43 -0700 (PDT)
Received: from hthiery.fritz.box ([2a02:810b:5a40:2a43:8e16:45ff:fe22:ad85])
 by smtp.gmail.com with ESMTPSA id
 kb1-20020a170907924100b0072b1bc9b37fsm6967010ejb.22.2022.07.19.12.01.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 12:01:43 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 19 Jul 2022 21:00:50 +0200
Message-Id: <20220719190051.555180-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0duXxbVNPgUy0+XRtpQg9wkcQ8lanIgDihHvuFEJegQ=;
 b=ZMLC+c33hA2931USQgNh8KkKaX3uyyJunj47vhmrqoSkMI4q0Jptav63RaCR2kCgwd
 +PYgMWecJIdidfHpkOLDQqvtopW2PeWmGqZn6rKFVmF2FbQ3bpswU9VLkRe9T+WPg+F+
 Vs6DF/6v/1s3w9RYvOGJ5zOfScsaYSem9g5BZxyBEJT7oeGf+RVF6lM4iEzLjOldBDEY
 cYkKhUVpNr+xRbYf3IygnO5ZBWxPRDHoYjvGZl7ScrI3YMDS6kVnCDJYyvqg/5Kzp6h1
 i23sJ2iHJqdMmKRdoIoC5d4ANMVKHMoIBnbj9kzBLmu0FsZSGby5lH2rSerGGkOfVLrI
 j56g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZMLC+c33
Subject: [Buildroot] [PATCH 1/3] boot/uboot: add
 BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX option
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since U-Boot 2022.04 a host dependency to util-linux (-luuid) is required if
the U-Boot board configuration has CONFIG_TOOLS_MKEFICAPSULE enabled. So
introduce a new BR U-Boot config option
BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX to solve this problem.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 boot/uboot/Config.in | 8 ++++++++
 boot/uboot/uboot.mk  | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 91d98c7e63..340b2d17ff 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -190,6 +190,14 @@ config BR2_TARGET_UBOOT_NEEDS_GNUTLS
 	  typically the case when the board configuration has
 	  CONFIG_TOOLS_MKEFICAPSULE enabled.
 
+config BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX
+	bool "U-Boot needs util-linux"
+	help
+	  Select this option if your U-Boot board configuration
+	  requires util-linux (-luuid) to be available on the host. This is
+	  typically the case when the board configuration has
+	  CONFIG_TOOLS_MKEFICAPSULE enabled.
+
 config BR2_TARGET_UBOOT_NEEDS_ATF_BL31
 	bool "U-Boot needs ATF BL31"
 	depends on BR2_TARGET_ARM_TRUSTED_FIRMWARE
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 5808e30818..70d4d585f7 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -231,6 +231,10 @@ ifeq ($(BR2_TARGET_UBOOT_NEEDS_GNUTLS),y)
 UBOOT_DEPENDENCIES += host-gnutls
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX),y)
+UBOOT_DEPENDENCIES += host-util-linux
+endif
+
 # prior to u-boot 2013.10 the license info was in COPYING. Copy it so
 # legal-info finds it
 define UBOOT_COPY_OLD_LICENSE_FILE
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
