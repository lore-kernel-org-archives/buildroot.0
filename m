Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A75C433FE
	for <buildroot@archiver.kernel.org>; Fri, 11 Nov 2022 10:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 159BE41742;
	Fri, 11 Nov 2022 10:59:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 159BE41742
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2c6ZjlKEqD3t; Fri, 11 Nov 2022 10:59:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8F09416A9;
	Fri, 11 Nov 2022 10:59:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8F09416A9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 038121BF2C8
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 10:58:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D3B0160B26
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 10:58:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3B0160B26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q5brMpnve8eC for <buildroot@lists.busybox.net>;
 Fri, 11 Nov 2022 10:58:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1C3860A84
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F1C3860A84
 for <buildroot@buildroot.org>; Fri, 11 Nov 2022 10:58:35 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 t25-20020a1c7719000000b003cfa34ea516so5349603wmi.1
 for <buildroot@buildroot.org>; Fri, 11 Nov 2022 02:58:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JjXCEhQqUAcEvyj7bAUw3NqiRedEPEgvDrATlPRZIKk=;
 b=phDZmeXrpgnJ1UJpHG1AyTflqB/ss01h9D3eJDaqJ8dWh+36lDDt+bttzDCTn2nV5L
 BOFQUSB7+EfAfUs/WvXz+FXIWaMrdnS5Dl+51u/Ye/odSQbLWkwGS3gFNHzNLg3BK62H
 3MnIVf5JdfkGEfKFpCyHcObIImvVEQRFfNDlonrdSAkSQocEO3+sTb8RVCCQCJU+tQuf
 NZvUB1532+y21JVz+ZVrZec1fWCcfMZ3Yc4DKNI92kSSaWgB82YQuxgkOOP0aLLimbim
 plSGHhDYeEoYWgsCZJINsSj+XQavKOWCIMSIMDYJm4ga9pnkkBTPnqo/PbAg5QerLmgn
 1W/g==
X-Gm-Message-State: ANoB5pmF4tRlSaAl8IuPW6Fj0wwSpgFOulDAZJsnE18uv0L8AkmyUfnX
 DgldgWrZQbotkueKkpDyO9PcDv7o5qw=
X-Google-Smtp-Source: AA0mqf6euDwCwheoTIXc7ZrDodGAAPW2a8mTUz8X0lqZf0x14fZ4mLAWQesKSsk5S9PJTxyFIFIU3A==
X-Received: by 2002:a05:600c:5554:b0:3cf:9be3:8d26 with SMTP id
 iz20-20020a05600c555400b003cf9be38d26mr852730wmb.185.1668164314045; 
 Fri, 11 Nov 2022 02:58:34 -0800 (PST)
Received: from lano-work.. ([80.120.136.76]) by smtp.gmail.com with ESMTPSA id
 q10-20020adff94a000000b0022cc6b8df5esm1627594wrr.7.2022.11.11.02.58.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 02:58:33 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 11 Nov 2022 11:57:56 +0100
Message-Id: <20221111105757.552459-4-nolange79@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221111105757.552459-1-nolange79@gmail.com>
References: <20221111105757.552459-1-nolange79@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JjXCEhQqUAcEvyj7bAUw3NqiRedEPEgvDrATlPRZIKk=;
 b=oBoO4HutlHXDe0dXqByYDfQihcgXEi1YRJa8GGC8YtdxVGHWz5fvZXGLEOuo2mBoGB
 1D0LGsbjaoG5wfQ4Zh5lHQLZw8LMDLlG/DymXTV1JSqws+z8FtELWWVUt48ZafwPvAz1
 l6X7iNxxQxo702P7mkHqMl9lmsnlaAxGrEVYheFT4sEtaV0TMJan2Ngx6/hhbI/mr6/S
 GSWSRd9Q2jrPyW8zN8QjZKBA7e92qmaIH22cq8ph0KrYPp+cXkrnwW3EHFct/eJaEJ/P
 5HwDTr2InY1thCvwJ6LsGPAGc/V+pEcsZMB9bvC/pX8hjuiyoS37GnaNeTSvt14QBwoF
 ltFQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=oBoO4Hut
Subject: [Buildroot] [PATCH v7 4/4] system: Warn if systemd is used with
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
Cc: james.hilliard1@gmail.com, Norbert Lange <nolange79@gmail.com>
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
