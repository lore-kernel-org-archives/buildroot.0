Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 709EFFED2F6
	for <buildroot@archiver.kernel.org>; Thu, 12 Mar 2026 09:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29A2284C03;
	Thu, 12 Mar 2026 09:24:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U00FyTiUxowG; Thu, 12 Mar 2026 09:24:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1295C84BF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773307473;
	bh=KoR0zsvYXF9k0Hx1uSQ+RVHVLMTEdar7fwM+qFm6zMw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cfA/yzTFn6HMehWRczUetDZguOHPvaLQdvRcYpZaUGO55qSF4z1r0Y6A5bQjFrjkM
	 KB0yOjHQ2xG58HMjz5BG34pZnujNFXQukJyvCAnFHOEDzI3zfHLQ1Wau2hAE/o8mYs
	 7BbF2+vj+Jn2eY+YocDK3SSDQsnitHuJ5/T9LkTowIivfFen67Xl+cSRDpJBAVnkbH
	 bfYQfknO5uAYsAtH/xvuvzmPWFIrASEN6H8D7z+w7Cu9MYcTQHaxQ9gCnt0wTuUh+6
	 Lo4kAJr4Rqri4HhW0KuJIBj0IG2IiHnH8FGP2r5KY/QyASZtLp89UaBKt7hlDBI+lC
	 +PJ+gFv88YIFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1295C84BF9;
	Thu, 12 Mar 2026 09:24:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 69664201
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 09:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F1B961C2C
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 09:24:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id No8JFxazoh_g for <buildroot@buildroot.org>;
 Thu, 12 Mar 2026 09:24:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6092761C3C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6092761C3C
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6092761C3C
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 09:24:27 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-482f454be5bso19954505e9.0
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 02:24:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773307465; x=1773912265;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7HZOWhgWGxJ+zfJ+qNIrrLim6ZzdQsIg93aGs/6Ysxk=;
 b=g9T07JYIvL5UGxjCNaFSiOrOJLgx0CihikKkK4gFfm/hp5Ov5UUeJGCGg3oR65IhEI
 2xMKvKG2lR+8fiI78oOJ2Rjm9KXZW1YR00drYC0ehkp/yROefuzknbtX8JTTRz1nlCHu
 UdBhYgBSkkw7cRrOyjE5VJBNidA7lnyTcsh4zAvJ5FNOONjD+3RUu8VTFnn8s4rqY401
 JDbWzfMxPRjCt6KruOwBqGYUUZA0vYDuzxHLsUcuABH5gqI/xRKiUQTZmhpvODkWRxjN
 mH0cevmFpnmg/fzpmtQwtc5M8R7EYRwImGrBx4ywdgOoatutCrcTgV0ITTPXyjPMbw4R
 yeIg==
X-Gm-Message-State: AOJu0YwX7yVJ8kaHNsLfIGgVSZTRomGNmwWyVEC0LfF/3ZzmC6E4bXB8
 SKTufQGSzxIo/oM/lUVpyHhbIMGT3NHcUYdOrjAk8XhLjnn49S8FAkRG2Eobdobwg0G95FC+zt3
 cjG6G6Xg=
X-Gm-Gg: ATEYQzz+WY1BG+W5iquMdNYeB1kOjfUEYjshbN6BstImpcyaSrf3zIC6Ldho+Ssb/35
 PPu8yqQx/yYgW+8cTBJ35uloVBwf3uaaUQ4Rg8j2oQS0l8iGxdcpNugBznPcQL9CHdT3G+oGUwY
 zmINO/zuTm5Ikvj8yCXQFIZW15w/C8fq4u1caS/OPDxfeF3yI0WsFpPh4GDLoiS0vNMLtrHXWtD
 wTMiC0tR8XkiqqzZ8bzi+KRMb33+tQWwffgnGTVpQgOkKjLL1U0RlAwWZUpqEjNM9zzEWO/fwjc
 gFXeqwj5JzkUuofb1dG843UR/RousAWeq+mokEMYp2D/2ypwSjEdPRjvWH1uw+fEPLAEj/0s+06
 ACSE5w7xXTDN8xgkiqh37//4KNjf5q3lVfr7JF3K6uowLf/SApwLmQTrgAxsuj/00MQSdWftkEw
 UeK7Ewox66qJOU/O2UHr0qyoY8SnoEhVgcW4WWDLJsnbt7ZG5vnjZswSjsdiVafUuJyDD5uZCjL
 1Hym4WFXjO6CVB2LFEn
X-Received: by 2002:a05:600c:8b5c:b0:485:3c11:de84 with SMTP id
 5b1f17b1804b1-4854f599ac7mr40705495e9.14.1773307465092; 
 Thu, 12 Mar 2026 02:24:25 -0700 (PDT)
Received: from P-NAN-NAPALM..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48541b7f3cdsm243996485e9.14.2026.03.12.02.24.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2026 02:24:24 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Dowan Gullient <dowan.gullient@smile.fr>
Date: Thu, 12 Mar 2026 10:24:12 +0100
Message-ID: <20260312092413.545638-3-dowan.gullient@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260312092413.545638-1-dowan.gullient@smile.fr>
References: <20260312092413.545638-1-dowan.gullient@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1773307465; x=1773912265; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7HZOWhgWGxJ+zfJ+qNIrrLim6ZzdQsIg93aGs/6Ysxk=;
 b=Dd6wBj7Kjfdop5r3V+s3tG5atxsXilXLVEW4d4c7WXPssli9Tv2ud1jt495F2Rmw14
 GbBMAxlhN4Fo1l+e8QF4Yezvd1KuGVqLQs1Kcgo+d86CDyjSXEXTkwB9MDQZjCyRJPnO
 U5Nu6F3vw3JrD631tK3BWLO590YI3kDp0JGBQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=Dd6wBj7K
Subject: [Buildroot] [PATCH v3 2/3]
 toolchain/toolchain-external/toolchain-external-arm-aarch64-be: bump to
 15.2.rel1
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
From: Dowan Gullient via buildroot <buildroot@buildroot.org>
Reply-To: Dowan Gullient <dowan.gullient@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update the ARM aarch64 be external toolchains to the latest 15.2.rel1
release from ARM.

This involves:
- Updating the version, site URL, and source filename in .mk
- Updating the SHA256 hash in .hash
- Updating the display name and GCC version dependency in Config.in

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
---
 .../toolchain-external-arm-aarch64-be/Config.in           | 8 ++++----
 .../toolchain-external-arm-aarch64-be.hash                | 4 ++--
 .../toolchain-external-arm-aarch64-be.mk                  | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
index 3a71e1356b..c3592b9d20 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
@@ -1,13 +1,13 @@
 config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE
-	bool "Arm AArch64 BE 14.2.rel1"
+	bool "Arm AArch64 BE 15.2.rel1"
 	depends on BR2_aarch64_be
 	depends on BR2_HOSTARCH = "x86_64"
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	help
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash
index 317fc10a09..95dead94d6 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash
@@ -1,2 +1,2 @@
-# From https://developer.arm.com/-/media/Files/downloads/gnu/14.2.rel1/binrel/arm-gnu-toolchain-14.2.rel1-x86_64-aarch64_be-none-linux-gnu.tar.xz.sha256asc
-sha256  0ea5d00d0ba4c5d16bc8e140d434c54367516b568a146d724936c589a2f56aaf  arm-gnu-toolchain-14.2.rel1-x86_64-aarch64_be-none-linux-gnu.tar.xz
+# From https://developer.arm.com/-/media/Files/downloads/gnu/15.2.rel1/binrel/arm-gnu-toolchain-15.2.rel1-x86_64-aarch64_be-none-linux-gnu.tar.xz.sha256asc
+sha256  f848f5b15d49217fbe8b3d72e1cc44eac06b096e6b66fa892898fa9c710a3c05  arm-gnu-toolchain-15.2.rel1-x86_64-aarch64_be-none-linux-gnu.tar.xz
\ No newline at end of file
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk
index 381a591932..264e8bff71 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION = 14.2.rel1
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION = 15.2.rel1
 TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_SITE = https://developer.arm.com/-/media/Files/downloads/gnu/$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION)/binrel
 
 TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_SOURCE = arm-gnu-toolchain-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION)-x86_64-aarch64_be-none-linux-gnu.tar.xz
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
