Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9098C4828D
	for <buildroot@archiver.kernel.org>; Sat,  3 Feb 2024 18:02:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F2BC41D75;
	Sat,  3 Feb 2024 18:02:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F2BC41D75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m0YAnH1bZ62P; Sat,  3 Feb 2024 18:02:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD1D141B88;
	Sat,  3 Feb 2024 18:02:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD1D141B88
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 886E51BF2B9
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 18:02:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6BB9560ABD
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 18:02:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BB9560ABD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4R_Y_l2IyavR for <buildroot@lists.busybox.net>;
 Sat,  3 Feb 2024 18:02:53 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1C01460774
 for <buildroot@buildroot.org>; Sat,  3 Feb 2024 18:02:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C01460774
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40fcb4ef7bcso11567455e9.0
 for <buildroot@buildroot.org>; Sat, 03 Feb 2024 10:02:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706983370; x=1707588170;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wCGlr6cnwqoYhro0m6Ouecm9VI6lSkEQquma2z0kKWw=;
 b=dOoZPezQeWWZATGcpkGPkiQX1/5oKsxQRgy7OSsNmC2NbaiqUhA6mfoZN4bkTBK+uQ
 uHT24Z4kGOWDtrbRGZtMdMusmRn6peVDLe6tj8+izAxQL4u7UcqyxfASZ3frFQkXHHxP
 EFfeT0CZ/x7o0LuCVtAhRO4kiOZ0bBGlpuInMTmktC98DHy39rs02r3gKgecljryVHU+
 RUxdBGl8eoYhrxoo7hHPigE7zVZcTMqQ1tl2/6JKG53ck6c0+4hkHjsD1+C6kBdDTmQf
 a1JSqZ3RAfHROYEQSY0e81ZzZuSSquDwNPVorUAmwdlRRi3PlWFwBt434GowJsYV4Kuf
 hRTQ==
X-Gm-Message-State: AOJu0YxfMOm+MYkgXRDKmOboVM4cfh2xEKjYRIbM8R9tjGWft5Oi73Xx
 Lm4r9Qh2zdV5S2wsdGSGDFqf8etAneysVLvRbqYBBsBwZHHxN5oSvEWJvzjepRI=
X-Google-Smtp-Source: AGHT+IEzMniZRiPnvsAV7pPwS5oT07nQOKqhqkVYzVxgcwGCfTA75HLVIHnN4ZrZfF4qaTc8EE/1eQ==
X-Received: by 2002:a5d:6d8c:0:b0:33b:2eda:ebf5 with SMTP id
 l12-20020a5d6d8c000000b0033b2edaebf5mr1657239wrs.67.1706983370213; 
 Sat, 03 Feb 2024 10:02:50 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 i18-20020a05600c355200b0040ef2e7041esm3551945wmq.6.2024.02.03.10.02.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Feb 2024 10:02:49 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Feb 2024 19:02:47 +0100
Message-ID: <20240203180247.143487-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706983370; x=1707588170; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wCGlr6cnwqoYhro0m6Ouecm9VI6lSkEQquma2z0kKWw=;
 b=W+Y17KxHxzMRPB7LTPUeZWhJbNjmPFJlP46p9JQG8QucRvUiu3949nXhpO09a0oP37
 /XWI3xzLz6wHkAm6brdXmI4jtQzzZV3aDFDvK7IIQkNvyDh65O0PXBN1BNt2UbdyVzgB
 SlDAqcSRIr/hSrgfrwooahWpxC3e5s6uGR5qsoG/bv0iA8POT8BBuCEVgcDMdanzId61
 C4O5x7DsTarROF/E0NkLjshu7DcCOryrbmFA9L5c3l7yo4m2D69mGOsS2LyHxWxtqiqu
 taBYYWV4NZb/onSa0Nht4IwjnS/nBMDQOzlxiWOJkDFIFh9fsrferltgYR21JGuIp2U6
 br6w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=W+Y17KxH
Subject: [Buildroot] [PATCH 1/1] package/netatalk: update
 NETATALK_CPE_ID_VENDOR
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

cpe:2.3:a:netatalk_project:netatalk has been deprecated in favor of
cpe:2.3:a:netatalk:netatalk in September 2023:

  <cpe-item name="cpe:/a:netatalk_project:netatalk:3.1.13" deprecated="true" deprecation_date="2023-09-29T11:15:00.340Z">
      <reference href="https://sourceforge.net/projects/netatalk/files/netatalk/">Version</reference>
    <cpe-23:cpe23-item name="cpe:2.3:a:netatalk_project:netatalk:3.1.13:*:*:*:*:*:*:*">
        <cpe-23:deprecated-by name="cpe:2.3:a:netatalk:netatalk:3.1.13:*:*:*:*:*:*:*" type="NAME_CORRECTION"/>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/netatalk/netatalk.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
index a47bfa7e84..40e64dabeb 100644
--- a/package/netatalk/netatalk.mk
+++ b/package/netatalk/netatalk.mk
@@ -12,7 +12,7 @@ NETATALK_DEPENDENCIES = host-pkgconf openssl berkeleydb libgcrypt libgpg-error \
 	libevent
 NETATALK_LICENSE = GPL-2.0+, LGPL-3.0+, MIT-like
 NETATALK_LICENSE_FILES = COPYING COPYRIGHT
-NETATALK_CPE_ID_VENDOR = netatalk_project
+NETATALK_CPE_ID_VENDOR = netatalk
 
 # Don't run ldconfig!
 NETATALK_CONF_ENV += CC="$(TARGET_CC) -std=gnu99" \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
