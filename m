Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D69C61DC7
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 21:21:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C22E280E9E;
	Thu, 27 Aug 2026 21:21:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lDAQqKUaBeci; Thu, 27 Aug 2026 21:21:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787865696;
	bh=yIwMJVpaXphAzfpoMj2lhJ6YNHf6bgsASnCH0RWycgk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=i5V5CMSiMRiAoC06+7RpzybugUmTgqjiVnuX5lqXD61SxIFMX+wRM2lF5uMp5e+WF
	 hO7/pcJGbgfkjq0MgIDcPE/fW9YrprOhMl3RxNMhenQyHZSmFTC6SG5H3hY6Yt4b0m
	 Uj37Ry3P2TDlJN+FI2WozPjOol12pIKdai56MzbI5k09SRKl4oRjFXSSqEENuLrafA
	 TNa9KK/YMjeSN4FvpYDfZrvHRqfY/4C61oUg5xgwCy/qhPDp2c8vqJMCYuNa4d0wdv
	 QJFprG2YYcK69ddMwj5qDRLzxtMsyq2w+vOYLhAlCnTfLEzYt8Lr7KWw6AOINnvwSK
	 2ST+iQDdNEJ1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEE9A80EA6;
	Thu, 27 Aug 2026 21:21:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7203D465
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 21:21:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58926607A8
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 21:21:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ogd1-wIOGrhe for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 21:21:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3F07F607A0
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 21:21:30 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-47fd4531020so61246f8f.3
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 14:21:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787865689; x=1788470489;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=PqIsseJgGri0DB9rQdd1fap7dHIlQ/Vby/5h18qRChU=;
 b=ZJUd62oUhgeR3rhpA5LZEaat8Rbfk4QFE9bj5KMIPpTfE+JKDmo4IhG2IOms9ul1xx
 jlIB13wrEs1ya3s8kbxQvsIoCUINw8ugwGIDxf++ESf+Xg3zQqDHKy+0EiD6s+f0SMND
 9Oky8yow24ApLNvUQ709LQ0KOEnEqLg9Ppamf68Hy/o60ABqzApgpUQYn981cMyjw3WO
 7tym3I4TJXPoYNJMdKSph3rSeKeSoAGnBBejZsZT0tF1QERx+uwQxbt4OlFSHx9gBd8k
 glvK7HRXD1JAamvxQwnSWbMGyCFEw4T7RYtbSEUQ0k0iauPObkoPB5HCbY5KN5BAnKAd
 OW/g==
X-Gm-Message-State: AFuF++k4PCQ0Egxid9qqMTnimDrxWU/Wuq6OJAehG4UUnHkHDv2ZlgOM
 0+q2E/59wiBKWwm4Ztb6vouJHMXsaSVvgETcrBVGZc+VTRVMHiXdpIjhCXymn49SNd+BO65tTHU
 tVC/MTK8=
X-Gm-Gg: AR+sD11RsLNaHg1XNY/e8qkmMrXDdg2co+/B1IUDNKFnCUnNlCSwf2cUUG6H8DfG7rn
 MAsNCe3Vinw7JgWoSlR6+qo/+uOP4RISf82vQrVRJwSVpHSagVTQzfOzGBxczOEcioEcp0REbYD
 3prafBj09Ef8f9vuhs0rUHo+zU9BhubfGaG+ktt7ejUZLwApm5CNb+oiN5vz8ZFmGLD7CtANzzH
 yp0O7zeD61mBbTgbk2KtiIwgbV1xfypLvXbI4X419WIPbwqaB+wJimnYdnJITtUdreOsxvTPgld
 uLnaFhJNM1F7QoZ40oVRWu2WOwL11E6hTrj0xQhJjFVfPNOpdxFznFIIYLfBglV05FzdHE1x6Ac
 YqX/4qEg2DJb276uRgUpneqWCVCcEW00ovOEyYDUFIDEoI7uQINQnWwj4fm20ppGmg67kAiI8eZ
 TdOaWLnmfA4cSj+8EQY4cf3HOEBQORuf7D6DtcJ97K/Q2DlJClmqn2rdsPJhSHB1GoS5SyOstC/
 dk0YerxdF4uwDrFPQiuXNAhtTDnfjtXMAiAa4G1MlnUipu8DVYsePUvG9yS57Y=
X-Received: by 2002:a05:6000:2dc1:b0:482:aa2a:52f6 with SMTP id
 ffacd0b85a97d-482f7977a50mr2556205f8f.1.1787865688755; 
 Thu, 27 Aug 2026 14:21:28 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482e27a9945sm11303467f8f.9.2026.08.27.14.21.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 14:21:28 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>,
 Alexander Egorenkov <egorenar@linux.ibm.com>
Date: Thu, 27 Aug 2026 23:21:24 +0200
Message-ID: <20260827212125.1988552-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827212125.1988552-1-romain.naour@smile.fr>
References: <20260827212125.1988552-1-romain.naour@smile.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/gcc: enable decimal float on s390
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Floating-point type _Float16 added in gcc-16 on s390 now requires
decimal floating-point support enabled in the toolchain [1][2].

Without decimal floating-point, gcc 16.2.0 fails to build with:

../../../libgcc/config/s390/_dpd_sd_to_hf.c:27:25: error: decimal floating-point not supported for this target
   27 | HFtype __dpd_truncsdhf (_Decimal32);
      |                         ^~~~~~~~~~
../../../libgcc/config/s390/_dpd_sd_to_hf.c:31:16: error: decimal floating-point not supported for this target
   31 | force_convert (_Decimal32 x)
      |                ^~~~~~~~~~
../../../libgcc/config/s390/_dpd_hf_to_td.c:34:1: error: decimal floating-point not supported for this target
   34 | _Decimal128
      | ^~~~~~~~~~~
../../../libgcc/config/s390/_dpd_sd_to_hf.c:35:18: error: decimal floating-point not supported for this target
   35 | __dpd_truncsdhf (_Decimal32 x)

Enable decimal floating-point support as suggested by Alexander
Egorenkov.

Fixes:
https://lore.kernel.org/buildroot/ansJ5dXXblvYeMLB@windsurf/

[1] https://gcc.gnu.org/gcc-16/changes.html#s390
[2] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=5d6d56d837c3dbeabd382c1fb4f7d21d9891f4b9

Cc: Alexander Egorenkov <egorenar@linux.ibm.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/gcc/gcc.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 04ba70c52c..c183bf8848 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -70,7 +70,6 @@ HOST_GCC_COMMON_CONF_OPTS = \
 	--with-gnu-ld \
 	--disable-libssp \
 	--disable-multilib \
-	--disable-decimal-float \
 	--enable-plugins \
 	--enable-lto \
 	--with-gmp=$(HOST_DIR) \
@@ -80,6 +79,15 @@ HOST_GCC_COMMON_CONF_OPTS = \
 	--with-bugurl="https://gitlab.com/buildroot.org/buildroot/-/issues" \
 	--without-zstd
 
+# https://gcc.gnu.org/gcc-16/changes.html#s390
+# Floating-point type _Float16 added in gcc-16 on s390 now requires
+# decimal float support enabled in the toolchain.
+ifeq ($(BR2_s390x)$(BR2_TOOLCHAIN_GCC_AT_LEAST_16),yy)
+HOST_GCC_COMMON_CONF_OPTS += --enable-decimal-float
+else
+HOST_GCC_COMMON_CONF_OPTS += --disable-decimal-float
+endif
+
 ifeq ($(BR2_REPRODUCIBLE),y)
 HOST_GCC_COMMON_CONF_OPTS += --with-debug-prefix-map=$(BASE_DIR)=buildroot
 endif
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
