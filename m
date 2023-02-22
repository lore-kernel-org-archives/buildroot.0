Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A7FC636D6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 14:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B7ABF4105C;
	Wed, 22 Feb 2023 14:35:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7ABF4105C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JSGRYUvF4Fj8; Wed, 22 Feb 2023 14:35:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA76A41054;
	Wed, 22 Feb 2023 14:35:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA76A41054
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1F40E1BF589
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 14:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED5284198B
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 14:35:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED5284198B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MqbrT8gFTqMs for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 14:35:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D25D41987
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8D25D41987
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 14:35:17 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id t13so7875931wrv.13
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 06:35:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rKVsHTvMk2ecd4Dhj2YNSn2NcYzBdDSogs1qt31ivPM=;
 b=swvLbRPXyNAV2zlRU/2k99BnCbYYyBojyDa6xkf//fyvPTPvmh8t9ppfyiqdid9kA0
 /1Z4bG91Z+WjmA0YQoVNkFAg7U33ltB+byx/e91bt87z1kX7wTqwmJnBdpv+GPRN2HQO
 RNqWT6k80tbnYJLDg/VdIHty0DnxeOD65DzcW85QXLsgXVHhqH2/5HBj7G104CRl6wmP
 fc0siCeczAN8mGc/PMyEXpBbr6wctSMIN6A+alQ7Ow0ZKOJM8Rn1D+LDiojHE6IJb9xX
 TNJ9MDNHv6utvAtYxd7mTiu4S+3nemKvtPzQQEGaSz0pbWln+/OHWuelnEmWCmp/LV1d
 Lhzg==
X-Gm-Message-State: AO0yUKW+S+kyH5yXE/FpAxVVZD/xalWJqiEazBv08bz1WkohU8NCRlSj
 uMO6OQehH1YErdKui7tw2mfhjNPlYAA=
X-Google-Smtp-Source: AK7set+QM23ylaSm4HBwVV+7A45NrL4fUTiwGvCg9MPj1XW2NNazB1HsSabzQ4tgOCfQchoYy2+FhQ==
X-Received: by 2002:a5d:5b0a:0:b0:2c6:c9f1:e444 with SMTP id
 bx10-20020a5d5b0a000000b002c6c9f1e444mr6438887wrb.16.1677076515260; 
 Wed, 22 Feb 2023 06:35:15 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 b4-20020adff904000000b002c54f39d34csm10934968wrr.111.2023.02.22.06.35.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 06:35:14 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 15:35:12 +0100
Message-Id: <20230222143512.1555539-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rKVsHTvMk2ecd4Dhj2YNSn2NcYzBdDSogs1qt31ivPM=;
 b=OtfPilo6k1C8DlT73O1JTUlstAjOO4Wp9hqLaf72vTVRZvNTIh3S2nTkxzPQb+VvEU
 x0htsUP2tB4ds9p1HmUZ1CaI5TPwpdlUpgH3ggsmvHz1jaHOE97l3ZbXI6RQQuRyzVDm
 UJ/hzaSuOlOUWyPfnkjw/+4WQyVRb4OOQFpURZ+L8tv0AH61cYi7+gAh5QI86wiUdig1
 pkr0Ty/iVaTIlSN7LsLP18fA+G0X5dR7Nr6W+KUoAQW1cqx7ut5u4AC87Q/NtIqXkGjK
 DjAcC4lX9P+xAt4cNDMKQPTuYdEueMz7+PDIa5o5s1MfCmrSgKEiDTF7P8eaKbnOXnGA
 kVuw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=OtfPilo6
Subject: [Buildroot] [PATCH 1/1] package/audit: force arm mode instead of
 Thumb mode
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure:

/tmp/ccY5gl3z.s:2145: Error: selected processor does not support `mcr p15,0,r2,c7,c10,5' in Thumb mode

Fixes:
 - http://autobuild.buildroot.org/results/9d18a0d360b2e2f9e87c55daedda62d6ce198bb9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/audit/audit.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index cbb174b980..af81dabac0 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -15,6 +15,13 @@ AUDIT_INSTALL_STAGING = YES
 
 AUDIT_CONF_OPTS = --without-python --without-python3
 
+# src/libev has some assembly function that is not present in Thumb mode:
+# Error: selected processor does not support `mcr p15,0,r3,c7,c10,5' in Thumb mode
+# so, we desactivate Thumb mode
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+AUDIT_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCAP_NG),y)
 AUDIT_DEPENDENCIES += libcap-ng
 AUDIT_CONF_OPTS += --with-libcap-ng=yes
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
