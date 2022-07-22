Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D20C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 10:18:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1022242337;
	Fri, 22 Jul 2022 10:18:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1022242337
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zIoQOrm6xEVv; Fri, 22 Jul 2022 10:18:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8A8A421CB;
	Fri, 22 Jul 2022 10:18:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8A8A421CB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CCCA71BF32B
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 10:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F651607F1
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 10:17:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F651607F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LqcQ0v6mfzZX for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 10:17:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7EEB60692
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D7EEB60692
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 10:17:43 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id tk8so7773954ejc.7
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 03:17:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JjXCEhQqUAcEvyj7bAUw3NqiRedEPEgvDrATlPRZIKk=;
 b=AesXGm7Bz6wJB2w/UvBDgDATmkwPuMoQAKNP5MesZqczkRel5tNT/zLqsrbCnG82r1
 LENW/k6kyAMtwxF/FdjsCQrk3y/NQHaCEigqBjloiWHDKV3Q5IGqL7ted5/KURtj1x4V
 xb6Ct0tEDTfjOrWASDeqnfKV0JHmWwRHVdDjiMfXPdeNbrdNwxNIOzONbSsQYzeG3FmO
 6YiUIXxLDJEM/k6qUU9lUYSGDvkz+KCbxRxjPqou6Q8/9D6MzixQ8fSybaj5tt+kV5lj
 6h3YbcxyOU5kLHnHIu7inzjiPod+vHB2Ptw7gXlP35dYUmN+fbmjfZEszHVQks+ukbyx
 C3kA==
X-Gm-Message-State: AJIora/F1GeLFuBhnorE7G6+PUZYEoLgdME8tZOZI38D3+dWSIiSjycp
 IGkcdZY7OP/0WZIH0fLQItrFzQbVcT1mYA==
X-Google-Smtp-Source: AGRyM1t+ksIHvIB+U0HVyFb1bj6hIJpcohDvF9AbZsrXNDLnSoOCH+icSncyaxFhMluDDf1nU4KwIg==
X-Received: by 2002:a17:907:8a14:b0:72b:76d0:520 with SMTP id
 sc20-20020a1709078a1400b0072b76d00520mr2538302ejc.468.1658485061704; 
 Fri, 22 Jul 2022 03:17:41 -0700 (PDT)
Received: from debian-noppl.. (62-178-205-20.cable.dynamic.surfer.at.
 [62.178.205.20]) by smtp.gmail.com with ESMTPSA id
 p9-20020a056402074900b00431962fe5d4sm2300671edy.77.2022.07.22.03.17.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 03:17:41 -0700 (PDT)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 22 Jul 2022 12:16:51 +0200
Message-Id: <20220722101653.7475-4-nolange79@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220722101653.7475-1-nolange79@gmail.com>
References: <20220722101653.7475-1-nolange79@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JjXCEhQqUAcEvyj7bAUw3NqiRedEPEgvDrATlPRZIKk=;
 b=SfNXeL6y7WORmM57qV0YvslU5M25d3IXQqERcEvUHPe4SH1cL+Q4iMN65YWDy3+ouv
 UydggSBUio3TSRlIn6v+V0MSBIP3x1nYjOOi2N85fTTg4l9RLyi1v6KbODuOI5foS3nO
 Aa6WJV6jvDJKUuv75AlZ+59uMvt7vOh/Mzj4Zi0C+15fLLsme3yTvXkjW9f+jYJlSCjx
 QhKAtEaN3yW56v1sr95W8gOVeMDgWBRahCaaIyHtJGPNltwTKXH185yraJNVNlnCqe1o
 DkJkjtO5s0MW9i+8VdA+P3FwaG1re+cRckJfvJpk4XSfTfIPkqg68MfbvJwlN7HXZF/8
 jsyQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=SfNXeL6y
Subject: [Buildroot] [PATCH v4 4/4] system: Warn if systemd is used with
 kernel < 4.15
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
Cc: Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

To quote the README:

> Kernel versions below 4.15 have significant gaps in functionality and
> are not recommended for use with this version of systemd. Taint flag
> 'old-kernel' will be set. Systemd will most likely still function, but
> upstream support and testing are limited.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 system/Config.in | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/system/Config.in b/system/Config.in
index 24a0e941e3..7c4e1c1140 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -141,6 +141,15 @@ comment "systemd needs a glibc toolchain w/ SSP, headers >= 3.15, host and targe
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \
 		!BR2_HOST_GCC_AT_LEAST_5
 
+comment "systemd highly recommends headers >= 4.15"
+	depends on BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_TOOLCHAIN_HAS_SSP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
+	depends on BR2_HOST_GCC_AT_LEAST_5
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
+
 config BR2_INIT_NONE
 	bool "None"
 	select BR2_PACKAGE_SKELETON_INIT_NONE if BR2_ROOTFS_SKELETON_DEFAULT
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
