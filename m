Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FFF3C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 21:40:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 299D86113E
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 21:40:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 299D86113E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB638825BF;
	Sat, 11 Sep 2021 21:40:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EyKHyf6TPq8M; Sat, 11 Sep 2021 21:40:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F36582496;
	Sat, 11 Sep 2021 21:40:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B0B4C1BF2C0
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 21:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A021C608CF
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 21:40:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4e_HIWCVM13U for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 21:40:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3AC336080A
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 21:40:46 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 m25-20020a7bcb99000000b002e751bcb5dbso3798341wmi.5
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 14:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VmXP5f7Of7ASGVN2YOYcccyRu/zRaIEhpCx9GV+xnxE=;
 b=CUkdBvnlel8GCIwFUQ3TEspyJCBj+VnpAFjALTyive0dq6jtlaztzLZbAj6V4QJ3JN
 buIskjp/y7Ur9VobVUPV/5C8rhGwk0YjuMQgQOl4Yc6zaC876jzY4GccuIFGm//blL6L
 7SvdJ2YSPBMYpnRuJVnud4+okL+eHNOIgJRWkNOXPIlUCFs9K4J9xxDtwze3Cru88RPJ
 6jWwgtu/jOFYWksCn4GshJntNqrTsz0o87H0eAcEDySttOWNsVvez3xsFKAOx1CmcH6g
 bCboae3+4jvrDXOwisUNU2qpw4FlCxG7XR+j5yjJJvoMagl9koOfm9do8OfzeHSrV2M9
 RFGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VmXP5f7Of7ASGVN2YOYcccyRu/zRaIEhpCx9GV+xnxE=;
 b=UgWbAuXiCV/GC3lvDnhbXJWepiDiyzbIdInjvXkZwI3nk/BL7DawE6ncFHNsoiGnie
 207j0AjMIc+cu0sAblHZpF+yK+b+1aRPmGR1QZAr1iGGQH/d4BP19pdavs9r26lX/Qk9
 Ndbk0/zOc7t0jen/2nSyDBnw5iO6FY46fLkS4nUMWwP13wa1teqNs/PiHIwnEw7Awz6c
 eKir94YF3rzP/xL9V8r8mQjlq90YJnDc6Pj6wCc+A85LeXcLqh+7St3SWwBmCx1KJ5AC
 WhwihEVmh87zMMdN7pVYbFwjRHrW2uj4yQXaYUJrN3Z5x3WPlTjIZGL5cmMiWa8ap4Pe
 hjDw==
X-Gm-Message-State: AOAM5309qJmSSFvWXvawPZBHJFM3ZqL5P7Mkf5zMQoVKlkJI0EslxX+X
 /C4HeANOMzur8ZZcjqKOF0nOuOVsjEU=
X-Google-Smtp-Source: ABdhPJwwEYdVQ3d0QjINkKigqMY1y4B7+S9ztk7laT8a+vKSv+OE7m7RvkrOz8Y1m3GsSAC5mTAPZA==
X-Received: by 2002:a7b:c92f:: with SMTP id h15mr2296744wml.60.1631396442629; 
 Sat, 11 Sep 2021 14:40:42 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id r25sm2913049wrc.26.2021.09.11.14.40.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Sep 2021 14:40:42 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Sep 2021 23:40:35 +0200
Message-Id: <20210911214035.961528-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/openjdk: needs host gcc >= 4.9
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Tudor Holton <buildroot@tudorholton.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

openjdk needs host gcc >= 4.9 since bump to version 16.0.1+9 in commit
057e27029c9811ba8cc4922e30cc3878bed98807 and
https://github.com/openjdk/jdk/commit/2a8f92e7e71f7c1ed4010fa31f4b413758c8752a:

configure: Using gcc BuildC compiler version 4.8.5 [cc (GCC) 4.8.5 20150623 (Red Hat 4.8.5-44)]
configure: Using gcc BuildC++ compiler version 4.8.5 [g++ (GCC) 4.8.5 20150623 (Red Hat 4.8.5-44)]
configure: Using gcc build linker version 2.27 [GNU ld version 2.27-44.base.el7]

[...]

g++: error: unrecognized command line option '-std=c++14'

Add this new dependency to all openjdk versions including version 11 as
most of the users will have host gcc >= 4.9

Fixes:
 - http://autobuild.buildroot.org/results/7072308d148ccb8237180729551df65c87a76f11

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/openjdk/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/openjdk/Config.in b/package/openjdk/Config.in
index f2b7f5ffd7..cee361ec6f 100644
--- a/package/openjdk/Config.in
+++ b/package/openjdk/Config.in
@@ -20,7 +20,8 @@ config BR2_PACKAGE_OPENJDK
 	depends on !BR2_STATIC_LIBS # glibc
 	depends on BR2_INSTALL_LIBSTDCPP # cups
 	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib, cups, libusb
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # C++14
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_USE_MMU # cups
 	depends on BR2_PACKAGE_XORG7
@@ -152,13 +153,14 @@ comment "openjdk needs X.Org"
 	depends on BR2_USE_MMU
 	depends on !BR2_PACKAGE_XORG7
 
-comment "openjdk needs glibc, and a toolchain w/ wchar, dynamic library, threads, C++, gcc >= 4.9"
+comment "openjdk needs glibc, and a toolchain w/ wchar, dynamic library, threads, C++, host gcc >= 4.9, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_OPENJDK_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS
 	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_USES_GLIBC || \
+		!BR2_HOST_GCC_AT_LEAST_4_9 || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 comment "openjdk does not support soft float configurations"
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
