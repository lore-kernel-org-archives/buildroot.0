Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF35FC3DA79
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 08:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B04E40578;
	Thu, 29 Dec 2022 08:48:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B04E40578
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k2BFmpvlcF7M; Thu, 29 Dec 2022 08:48:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 911FC4057F;
	Thu, 29 Dec 2022 08:48:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 911FC4057F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 01D4D1BF3A0
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 08:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD6A860C31
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 08:48:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD6A860C31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gGiRlUA63-dv for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 08:48:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C621360C29
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C621360C29
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 08:48:22 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 b24-20020a05600c4a9800b003d21efdd61dso12760154wmp.3
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 00:48:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9o2EAcQQu/2Dtr3CUz8z6XqjF6YT+bn/52Koxhv93WI=;
 b=G/IB6T8AAmuEdz2uvVZEILzHB/U50H7gxI87LN9pbg9xD2586T2eeJkHXp23M1KKy8
 xz3qZRi58lkNaKvIEReiSGkASystlFYKBdRqslGcPcqS23Pp7sXcFY9/Q2gdRD5LrsKo
 i+nxtH/YxPlUXDhVIWYlgdQFp8OJNWfSzBv/kefa5IigaJjz6aAvinrqoRZNX7TKXXUl
 KWVmcHk8KbhkuHToo1d3dk3dD/Py1iimnvH9fTgdcUuxzcVw+Q+cyFUkn5b8kWXEClOy
 E7ictdAOPm987WTE6CHJckYCYLXj4Yfz0jQHRNBUzTO0uBvVw45/SH2oOhNW/O1NZPBV
 PpIw==
X-Gm-Message-State: AFqh2koFgXHvM3NwzO4rBB6pR+TNm5lE1pX9eP1o0zAgE23TzT6Z6Xjn
 yNGPU3s10fn8VWKeQhv2EfmtngwuEyY=
X-Google-Smtp-Source: AMrXdXvaBT4Up3qEIYbxudjE3roG21e6qPJ9+jVDuVNanYUYvELJFt2r1GoYNfmiDroobw1yyadaqg==
X-Received: by 2002:a05:600c:1c97:b0:3d2:274d:be7c with SMTP id
 k23-20020a05600c1c9700b003d2274dbe7cmr20074553wms.19.1672303700520; 
 Thu, 29 Dec 2022 00:48:20 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c468c00b003cf57329221sm27322845wmo.14.2022.12.29.00.48.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 00:48:20 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 09:48:14 +0100
Message-Id: <20221229084814.3302-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9o2EAcQQu/2Dtr3CUz8z6XqjF6YT+bn/52Koxhv93WI=;
 b=pU7fYiiINENnticZsSAE4JmV1gRw4ylKXiNoRDuarOUmoE5v8Wlh/D3BB5ZSnRMmv/
 dnR+Ze8QjPOA8BYqCcHGAk2DkIThtVtz2/DfApROxPsWoHkZ8dk9YTkbKthZh29Mp8HC
 ibdZVNMf6s2nlxHkD3vUDpAoDZyT3cKLthB6v6NOXvnToWc4YlUkTfkGQNEFNbDy3IfK
 JdtFAc3P+6LuXgiYhweizuPsM8KNWSvsrPZISKzfIkfYP+hkh+f8IqwbUTVG7MvkLX3v
 PtSBmHDqG7h8g9Wr/2JOUcxfMv9zR/QozaXUfS+KJmVwPWylqHoGiGRWOzMqy7adlYvy
 uGag==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pU7fYiiI
Subject: [Buildroot] [PATCH v2,
 1/1] package/tiff: add libdeflate optional dependency
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
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Drop default y

 package/tiff/Config.in | 5 +++++
 package/tiff/tiff.mk   | 7 +++++++
 2 files changed, 12 insertions(+)

diff --git a/package/tiff/Config.in b/package/tiff/Config.in
index f842c2ead8..cc9aa5cfd0 100644
--- a/package/tiff/Config.in
+++ b/package/tiff/Config.in
@@ -11,6 +11,11 @@ config BR2_PACKAGE_TIFF_CCITT
 	bool "CCITT Group 3 & 4 support"
 	default y
 
+config BR2_PACKAGE_TIFF_LIBDEFLATE
+	bool "Libdeflate usage (still requires Zlib)"
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
