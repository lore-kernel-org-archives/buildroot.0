Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1759EC4167B
	for <buildroot@archiver.kernel.org>; Thu, 22 Dec 2022 16:51:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC8B360D67;
	Thu, 22 Dec 2022 16:51:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC8B360D67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O8cBU84eRXYs; Thu, 22 Dec 2022 16:51:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04E5160BE5;
	Thu, 22 Dec 2022 16:51:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04E5160BE5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 612111BF4D7
 for <buildroot@lists.busybox.net>; Thu, 22 Dec 2022 16:51:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3ACFA41843
 for <buildroot@lists.busybox.net>; Thu, 22 Dec 2022 16:51:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3ACFA41843
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZoTYdfFU9HEB for <buildroot@lists.busybox.net>;
 Thu, 22 Dec 2022 16:51:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04A29417FC
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 04A29417FC
 for <buildroot@buildroot.org>; Thu, 22 Dec 2022 16:51:24 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 b24-20020a05600c4a9800b003d21efdd61dso1724326wmp.3
 for <buildroot@buildroot.org>; Thu, 22 Dec 2022 08:51:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e0c7gtPxZjO4ZOUjh0VDMk1Q25hwtGyl9gDw4Axdibc=;
 b=lT0Gywvletmr3u43UKZGzLEqItoOtez76akv7k7RSLjIoIC24PTP71DRTpn8ijwFp1
 gr/VahxmzpB+/QpzyD5LI82OtYkCU8+z4oyjpnCAG8SKqQhb7B75UnmHAFKpiV9irVae
 dYkUaT+iETM/L3m86J99IzBaqiDtQ5j1WKhjwOIGuIEwZfmVODHi88SbdB4R1OT4WupI
 n1TS7nf/o1ipyjj6vC5FMuKaJ8lJyV3Pz6t5xDw21TRaZCR5Xd5E2T9ov3BQTfEg/4Ff
 9cFnyMIii4QCe+B3eTzKJHE1jmsWfc54jgPcvFOgbgfihY8b00nETqCyQLEsa+qU0hsF
 IRLA==
X-Gm-Message-State: AFqh2kqyi7mBFKdYcv31spt4nHE1i7/sw4EQwnflKp4BpAlzF1uTyKBe
 QcVcuDFx4u7mJqCTSvLDtcV4pB8Yt5c=
X-Google-Smtp-Source: AMrXdXtw/Cry30tZcBQyUeKBmy9euVBZcXBSCSEfE8eMhNLCkQ8Ozgm/W34P1VLfjly9a24gf4QLzQ==
X-Received: by 2002:a05:600c:4e14:b0:3c6:c6c9:d75e with SMTP id
 b20-20020a05600c4e1400b003c6c6c9d75emr5505129wmq.0.1671727882826; 
 Thu, 22 Dec 2022 08:51:22 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 c12-20020a05600c0a4c00b003cfa3a12660sm12342695wmq.1.2022.12.22.08.51.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Dec 2022 08:51:22 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 22 Dec 2022 17:51:17 +0100
Message-Id: <20221222165117.62002-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=e0c7gtPxZjO4ZOUjh0VDMk1Q25hwtGyl9gDw4Axdibc=;
 b=DNqhBhDC5OgJOxn1HFQTe9YEIArrWS8H3Ix53SVhp/LkGgvRDHIi/7EzRkGRWuUJEN
 CBJ6mt6WbJMW2b5d/JacprWG2ws/L+1s2YIgZu8Jiw3s8ZZxVBu8+1s/hW8dkp/Kd+TW
 dBrnZ6Z14J+roesOZqfZsQb9Lj1xV+khCSDCOdY+UhxH0zvQLuU1/DK3oIFehjmpv6Q7
 9ZS48xHwJVgGjQcBzooOjb8KSt8uP8gwG4O99A/W0PYf8HmxwRUfh9eItPXEEqz7OZhA
 f8gL02uEKMvwZl0oaSPNgoLGbaCYzEhHa5weQqjQ07o7/fnnI55WNxUgUzH7xup0yoxs
 llJg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=DNqhBhDC
Subject: [Buildroot] [PATCH 1/1] package/tiff: add libdeflate optional
 dependency
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

libdeflate is an optional dependency which is enabled by default since
version 4.2.0 and
https://gitlab.com/libtiff/libtiff/-/commit/3a2de853a932bd0ea79d1677d319841edb736c38

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tiff/Config.in | 6 ++++++
 package/tiff/tiff.mk   | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/package/tiff/Config.in b/package/tiff/Config.in
index f842c2ead8..58e2052ea5 100644
--- a/package/tiff/Config.in
+++ b/package/tiff/Config.in
@@ -11,6 +11,12 @@ config BR2_PACKAGE_TIFF_CCITT
 	bool "CCITT Group 3 & 4 support"
 	default y
 
+config BR2_PACKAGE_TIFF_LIBDEFLATE
+	bool "Libdeflate usage (still requires Zlib)"
+	default y
+	select BR2_PACKAGE_LIBDEFLATE
+	select BR2_PACKAGE_TIFF_ZLIB
+
 config BR2_PACKAGE_TIFF_PACKBITS
 	bool "Macintosh PackBits algorithm"
 	default y
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index 7981bdf2c9..a753065fde 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -33,6 +33,13 @@ ifneq ($(BR2_PACKAGE_TIFF_CCITT),y)
 TIFF_CONF_OPTS += --disable-ccitt
 endif
 
+ifeq ($(BR2_PACKAGE_TIFF_LIBDEFLATE),y)
+TIFF_CONF_OPTS += --enable-libdeflate
+TIFF_DEPENDENCIES += libdeflate
+else
+TIFF_CONF_OPTS += --disable-libdeflate
+endif
+
 ifneq ($(BR2_PACKAGE_TIFF_PACKBITS),y)
 TIFF_CONF_OPTS += --disable-packbits
 endif
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
