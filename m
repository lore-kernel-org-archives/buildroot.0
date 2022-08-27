Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EBE1ECAAD5
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 21:00:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9AC960E0A;
	Sat, 27 Aug 2022 21:00:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9AC960E0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i3OTlZV0wxMf; Sat, 27 Aug 2022 21:00:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3B9560BBD;
	Sat, 27 Aug 2022 21:00:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3B9560BBD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F21231BF95D
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 21:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D7F0B40935
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 21:00:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7F0B40935
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5PrcLN9Qb7-j for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 21:00:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 759A84090C
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 759A84090C
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 21:00:35 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id bs25so5672100wrb.2
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 14:00:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=+X49xc0g753zX1r0KoMUaWYbrB9FE45vjb8HiPw2y+M=;
 b=W87F2VPNVIwOQtGwOb0mpuJ0Z/Z8E2r0R41eF6oboZNIe9Nh/qAg0UExPGnfOH6JwS
 ty4uMFtlLp836onYWeYh3zL1jSORuYvAhFRecZAecf668Fz8L+CukXCf3+HTynEblEyS
 8V3+3A/pypNfLxbhIY9VbtWyRrp+Ta4VmX9af+POupJtcBLV/7MEOZ/D1eFsRYqGj3hK
 +T9WhXWK9VsSk2GrEehqR/OCRj2B1Y1mFLcGcIONnqE/yFXDMATptC5hkzQwSmGHJUoW
 PT5l9aVKVW76xpAuNY4qfhA4edfAcvGTuE++l/Ul7xMEEtMACRArgMO5WluQDbNk7Xyv
 DgWg==
X-Gm-Message-State: ACgBeo0JMqalnJg3rjU572Ft3p94KvjWiRJ7bJNVATo9SKPIk1KeXIPt
 lMKKMBsFVeqtULwnebiEdBkE+OWofDs=
X-Google-Smtp-Source: AA6agR4VN/dZRfxq/hLXnfaIpGiYz60fkY/c1sXZaAIm+ObEvbP7cEUzGCHhWwBSegPyEge7dXw65Q==
X-Received: by 2002:a5d:5989:0:b0:221:7c34:3943 with SMTP id
 n9-20020a5d5989000000b002217c343943mr2598337wri.441.1661634033388; 
 Sat, 27 Aug 2022 14:00:33 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 o7-20020adfeac7000000b00226332f9275sm3075732wrn.22.2022.08.27.14.00.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Aug 2022 14:00:33 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 27 Aug 2022 23:00:28 +0200
Message-Id: <20220827210028.308523-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=+X49xc0g753zX1r0KoMUaWYbrB9FE45vjb8HiPw2y+M=;
 b=QwsiWt/WWEY2RLDCOuzgTV9Fp5oFw05gitQaF0WYcx7bNFqIetdDc6MGRbGbrlZ79q
 +MMle4VruPe78yITWht+MfhPSendA5C7331gW+a35VUlgYRJxwlbz8Xe4WSd1SCzRYQV
 XwGMN9vVj/YHzrA0/lpiDu9l7ae+C7pzZRCsY8XBcoGarjMOKJgzA7k6xbjEsvRVKqdl
 3IIpFHQYyRLiZObDhsITSjwdmA5HMrL5ega3M/iLea2VcE+W/wkTcNZnxqAOet5KwvdZ
 h6Zyo7/xci52uFjUoiVG0mBaaDDoyZcqMu6Eh4O8qR/va8plYViPkfWd4u7rYlXpzI9F
 geUQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=QwsiWt/W
Subject: [Buildroot] [PATCH 1/1] package/libxslt: bump to version 1.1.36
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

https://gitlab.gnome.org/GNOME/libxslt/-/tags/v1.1.36

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libxslt/libxslt.hash | 4 ++--
 package/libxslt/libxslt.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxslt/libxslt.hash b/package/libxslt/libxslt.hash
index 39523a6953..8d1a2af193 100644
--- a/package/libxslt/libxslt.hash
+++ b/package/libxslt/libxslt.hash
@@ -1,5 +1,5 @@
-# from https://download.gnome.org/sources/libxslt/1.1/libxslt-1.1.35.sha256sum
-sha256  8247f33e9a872c6ac859aa45018bc4c4d00b97e2feac9eebc10c93ce1f34dd79  libxslt-1.1.35.tar.xz
+# from https://download.gnome.org/sources/libxslt/1.1/libxslt-1.1.36.sha256sum
+sha256  12848f0a4408f65b530d3962cd9ff670b6ae796191cfeff37522b5772de8dc8e  libxslt-1.1.36.tar.xz
 
 # Hash for license file:
 sha256  7e48e290b6bfccc2ec1b297023a1d77f2fd87417f71fbb9f50aabef40a851819  COPYING
diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
index df0286e986..d908e3c552 100644
--- a/package/libxslt/libxslt.mk
+++ b/package/libxslt/libxslt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXSLT_VERSION = 1.1.35
+LIBXSLT_VERSION = 1.1.36
 LIBXSLT_SOURCE = libxslt-$(LIBXSLT_VERSION).tar.xz
 LIBXSLT_SITE = https://download.gnome.org/sources/libxslt/1.1
 LIBXSLT_INSTALL_STAGING = YES
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
