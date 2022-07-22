Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA395C43334
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 10:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 719428490D;
	Fri, 22 Jul 2022 10:18:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 719428490D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4C01sqXFtuey; Fri, 22 Jul 2022 10:18:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8ED0C846DF;
	Fri, 22 Jul 2022 10:18:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8ED0C846DF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 10E2F1BF32B
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 10:17:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE49F83F4A
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 10:17:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE49F83F4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C-1QMbvtw296 for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 10:17:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F08E846DF
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F08E846DF
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 10:17:42 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id sz17so7783665ejc.9
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 03:17:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/tfI5BhiI9OmDis/oHlG42fdFYHOAAcycOpS9qJmWT4=;
 b=mILQnzhkcAGwPvgBsB4kMp5ZEO6Cg5YCNzy36QdzBnbOi0iUvA/mqytPdjwb5tCucE
 uiH95HlcxSCq88WqrrH2+ad1UDfbzZKh5KaNu7188dS5t0d6WEOYyKIFjLYmzUqsqz/P
 cC9Xs4MR/FdkFqaN7Wehpsek+ImervdEF5Vw8eg2YOHStergDGIp3um6bYDn4fGZfOUL
 YD3slUd4PHI09UkuWmEXBYS+JClahBQtO0IVC8onnO6UKFagdjor31PyUds4boNrf6ZQ
 XY1gskzZo+0k51+5m5uh3sF5j7VP0jxug/l97OvOutM7pwt60zor9uMuf3LgeFVRe/Ea
 e4Og==
X-Gm-Message-State: AJIora/OpdCtvTssxhJ0fmQEiY8phmn75nKwiF+3uyk7uBiODmsEASM+
 zo/uVQLuik0TPbxxP8lZNiTB5MvI9UZG3w==
X-Google-Smtp-Source: AGRyM1vOVCi+XyeB/dXlsaho9i0LILp+QBgRDxrdoKnTxwWQUoN3svluw8zuyWhQrf/zkPGtSMngdg==
X-Received: by 2002:a17:906:a10e:b0:6f3:e70b:b572 with SMTP id
 t14-20020a170906a10e00b006f3e70bb572mr2614709ejy.546.1658485060406; 
 Fri, 22 Jul 2022 03:17:40 -0700 (PDT)
Received: from debian-noppl.. (62-178-205-20.cable.dynamic.surfer.at.
 [62.178.205.20]) by smtp.gmail.com with ESMTPSA id
 p9-20020a056402074900b00431962fe5d4sm2300671edy.77.2022.07.22.03.17.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 03:17:40 -0700 (PDT)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 22 Jul 2022 12:16:50 +0200
Message-Id: <20220722101653.7475-3-nolange79@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220722101653.7475-1-nolange79@gmail.com>
References: <20220722101653.7475-1-nolange79@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/tfI5BhiI9OmDis/oHlG42fdFYHOAAcycOpS9qJmWT4=;
 b=CGmklnqBvXqi8oRgIo2hjiLEblQ/hcqIN7FfQuJ/JKErrFz3mhnOkY2M8N1wlVLOR/
 cdVvEQjDl0qsunQPd6MDdWpM0UlvFJAwxr7M2cE/eERodHdDH7XveK69JQPXIcCoHf1L
 tVU21AKGVt6phmi6ftnjVJyUQZthlZwH9Ww/N6lL5dcFpAutzg3AbNhbNQxlIP8ec8ID
 AhqwoIv2jzA9YgxuJOpZ1Q6ekpLi8FHnu3tKzH1yKsIMw0KRoi1Wn4A5WWZKg3AaYHOY
 2aP7D/qXkWaApZJbEwMMCsBJcqWtV/fFhz7WBNUJB0fkOsHEoWUkZW4jpjfiCZyfYx3K
 +isA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=CGmklnqB
Subject: [Buildroot] [PATCH v4 3/4] package/systemd: allow package to be
 used without init system
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
Cc: Norbert Lange <nolange79@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Allow systemd to be built as normal package, this is usefull
for repeated rebuilds.
There doesnt seem to be a technical reason to disallow it.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/systemd/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 1cd74618f4..7c4827a2fb 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -16,7 +16,6 @@ config BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
 
 menuconfig BR2_PACKAGE_SYSTEMD
 	bool "systemd"
-	depends on BR2_INIT_SYSTEMD
 	depends on BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS # kmod
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
