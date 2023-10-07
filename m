Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C67FFE95A65
	for <buildroot@archiver.kernel.org>; Sat,  7 Oct 2023 19:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DB5E83C0B;
	Sat,  7 Oct 2023 19:22:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DB5E83C0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VtdcIWhJNeru; Sat,  7 Oct 2023 19:22:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C51D183BD9;
	Sat,  7 Oct 2023 19:22:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C51D183BD9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2EA131BF25B
 for <buildroot@lists.busybox.net>; Sat,  7 Oct 2023 19:22:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05F5C83C02
 for <buildroot@lists.busybox.net>; Sat,  7 Oct 2023 19:22:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05F5C83C02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fGAQw64VJ3np for <buildroot@lists.busybox.net>;
 Sat,  7 Oct 2023 19:22:32 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 13F4883BE1
 for <buildroot@busybox.net>; Sat,  7 Oct 2023 19:22:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13F4883BE1
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-406618d0991so29387345e9.2
 for <buildroot@busybox.net>; Sat, 07 Oct 2023 12:22:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696706550; x=1697311350;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+iuHeTuY9+Ix5YHJ0VieBfqc0/yjVn4PQ4B/RbI40qg=;
 b=SICR6gPEN2OVMNmxXcG/eOq2PHzuL+VsTM2eAXbi+hZPx3ZH2OrPVWrnJPacuc9VZm
 7jiNn1DHF5WNupzmvzdvZ1tuUTRaw6q4N77e8Jj+YJTSPLafl3AKTLC3cKH6Xy+34y+4
 sqV7cm2N3XTic3iaT9DtkQkTN43MV9thdIsVWtSGbzRi9Rj9Swj+eDVSON+/pjCgPyNX
 FBATlHsHIFYxTgn4IaAWMbS1HYf98y1QFlhCqCw/jnuEvk7i+55RlMYwfR4ggPFoc0sJ
 DpALLOVhNBaaGubi5gOC4HqU7bebgxT24gJzF3Rwg479ugaGVaVoJrzY4dmw4gPFM/z8
 H7IQ==
X-Gm-Message-State: AOJu0YwsYT7oICJBquKvcQUX6u+fGl3cHcjB2GI5mxBOY8CvfpCWigil
 VNQx0O/64zqALDR2CsQ9xLEExId2Vas=
X-Google-Smtp-Source: AGHT+IHj91JHENr/EX/J70Zg2LrV71/ok85JLY2XZY5U4b4pl4sGITq7c82/1yartWXz6ISo5Ml3yQ==
X-Received: by 2002:a05:600c:4751:b0:406:8491:ec2 with SMTP id
 w17-20020a05600c475100b0040684910ec2mr9662270wmo.15.1696706549961; 
 Sat, 07 Oct 2023 12:22:29 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 z19-20020a7bc7d3000000b0040641a9d49bsm6774637wmk.17.2023.10.07.12.22.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Oct 2023 12:22:29 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat,  7 Oct 2023 21:22:25 +0200
Message-Id: <20231007192225.3670096-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696706550; x=1697311350; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+iuHeTuY9+Ix5YHJ0VieBfqc0/yjVn4PQ4B/RbI40qg=;
 b=QSYhPwYE6/OymE57wasEh7+uJFsPtP+K5RtdOTzuce2Mb6jyE0Lut88ZBz9RY24u91
 nYCnHPGQRoBSTTQWq/48kpsboM/RrJMf57RWqa/FzQlgfwqzr+MAOilkDisnm+9/ayQb
 HZKpRqV3fK8mtEGBZIzVLHmIYZ3UpHAdVtCbOci4iU6Cry4Vtl6s/U9U/t14325WJfgr
 MfYN2da0nhQUD1PT83ci1obxJfrya/8KOsePvg3Ra7iOnC8eeOEa+kqSOFLswcSY2hhu
 6QLZhE4dCUZ26XO/YZB1LGGFs6Fg4Z01QHW2yC8ppdsYKGMBMo3u9298bfhw8ELZpvjj
 p6Og==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QSYhPwYE
Subject: [Buildroot] [PATCH] package/mbedtls: bump to version 2.28.5
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/mbedtls/mbedtls.hash | 2 +-
 package/mbedtls/mbedtls.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
index 6aa6d0235..d0cd0b210 100644
--- a/package/mbedtls/mbedtls.hash
+++ b/package/mbedtls/mbedtls.hash
@@ -1,4 +1,4 @@
 # From https://github.com/ARMmbed/mbedtls/releases/tag/v2.28.4:
-sha256  578c4dcd15bbff3f5cd56aa07cd4f850fc733634e3d5947be4f7157d5bfd81ac  mbedtls-2.28.4.tar.gz
+sha256  849e86b626e42ded6bf67197b64aa771daa54e2a7e2868dc67e1e4711959e5e3  mbedtls-2.28.5.tar.gz
 # Locally calculated
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index 62eda6ec9..1b941e04f 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MBEDTLS_VERSION = 2.28.4
+MBEDTLS_VERSION = 2.28.5
 MBEDTLS_SITE = $(call github,ARMmbed,mbedtls,v$(MBEDTLS_VERSION))
 MBEDTLS_CONF_OPTS = \
 	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -std=c99" \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
