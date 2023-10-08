Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CCE6E95A8E
	for <buildroot@archiver.kernel.org>; Sun,  8 Oct 2023 21:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AA84821A3;
	Sun,  8 Oct 2023 21:34:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AA84821A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I3vpe6BsJ4u1; Sun,  8 Oct 2023 21:34:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 011AC812E7;
	Sun,  8 Oct 2023 21:34:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 011AC812E7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 185411BF2C8
 for <buildroot@lists.busybox.net>; Sun,  8 Oct 2023 21:34:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5ED160FC9
 for <buildroot@lists.busybox.net>; Sun,  8 Oct 2023 21:34:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5ED160FC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mhZGr6Buko2W for <buildroot@lists.busybox.net>;
 Sun,  8 Oct 2023 21:34:27 +0000 (UTC)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8254460FC0
 for <buildroot@buildroot.org>; Sun,  8 Oct 2023 21:34:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8254460FC0
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40572aeb673so37741635e9.0
 for <buildroot@buildroot.org>; Sun, 08 Oct 2023 14:34:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696800865; x=1697405665;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ouCLjt7rKx9KIUsY6ElXlykZinTdqailxRo5V/hBi+U=;
 b=dyo9e0eQJ+mzk+p82AwjwyvdjSdnyiS/yiu9qFIsHUMwRsoz98Azaa0Ep5W1lU60at
 WucET2Xala+X0Geu677kG8L4wPhlJFIKRycPozUw0MKteDwRXU6n3of8GNPGYcTgPLUv
 b3y3r0+LH6Kzbk4Zia6Ur8as2e62EjdAoIYZHEmLv6IfSOnrrAEAq9P+49L3Qxre69p9
 yVuA384lNaimksXj23sEwb9wVPPzipPK9cJECYy+gdUmdIBlKDwbnNfk5/JNiTS+7/Th
 j9l8jDQv2uT5u227vQZ+eWIdwjzlbzDR1skIuNMuM1oa+eZu4KuuMv8Vf/5yS6xqZwaG
 rs/g==
X-Gm-Message-State: AOJu0YwXLlA1gltfzqy8D88yi4xB7wPTxkzB5Bg0+/3gIwGbg+3uPnvK
 UjM7baNUPGpXNGtjC4RGmkrrBNBK95o=
X-Google-Smtp-Source: AGHT+IF45EAALVFMfjOejPWSt1d5xAZrVTqZVz+7nBP5tRMbofvdva0SkLtVSXxBDnUJcJGR4nXlsA==
X-Received: by 2002:a1c:791a:0:b0:406:5308:cfeb with SMTP id
 l26-20020a1c791a000000b004065308cfebmr12445725wme.11.1696800864877; 
 Sun, 08 Oct 2023 14:34:24 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 s4-20020a5d6a84000000b00327bf4f2f14sm7715678wru.88.2023.10.08.14.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Oct 2023 14:34:24 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Oct 2023 23:34:18 +0200
Message-Id: <20231008213418.85380-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696800865; x=1697405665; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ouCLjt7rKx9KIUsY6ElXlykZinTdqailxRo5V/hBi+U=;
 b=fpiNt7mwrQqANLynfTPGAC4i2gIJLmjisUg3FYa/opM5uycMuIiIyRirRHybCSR/QG
 5aIclkiX6vnoyKAeoibMeGGS8CTCBwGZ16ueRYvi7GBCl6Ms/TgG3vivw0qF7noe4xjT
 L7XBOircSnZ1clbRio1gBfGyRWA1uf2g0bu/DGLukPIFFueqI9UFnhdvRFuGXZuiTjdq
 kft13tpXYlexxjdKxPCE/yjGPukG/Rb3O65t7DqI3DkFXZqX7MM5GkF7QevWBTSlD2xh
 j1ji/ySuWWmEhFEmaRoBMgZypHoSn/Eo2LsQAFXNyLX46MdinFQpqbRgGMJEzqfYihAJ
 Ljqw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fpiNt7mw
Subject: [Buildroot] [PATCH 1/1] package/c-ares: bump to version 1.20.1
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

Update hash of license file (modern MIT license text used since
https://github.com/c-ares/c-ares/commit/6d077838f7e3f1899ba93da9d301b7fe49b311ce)

https://c-ares.org/changelog.html#1_20_1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/c-ares/c-ares.hash | 4 ++--
 package/c-ares/c-ares.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/c-ares/c-ares.hash b/package/c-ares/c-ares.hash
index 3e1573f2cf..c2897f6e44 100644
--- a/package/c-ares/c-ares.hash
+++ b/package/c-ares/c-ares.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  321700399b72ed0e037d0074c629e7741f6b2ec2dda92956abe3e9671d3e268e  c-ares-1.19.1.tar.gz
+sha256  de24a314844cb157909730828560628704f4f896d167dd7da0fa2fb93ea18b10  c-ares-1.20.1.tar.gz
 
 # Hash for license file
-sha256  db4eb63fe09daebdf57d3f79b091bb5ee5070c0d761040e83264e648d307af4c  LICENSE.md
+sha256  80fff25340df53b0cf0c3cddbca9050b559b9cbed2ad71830327cfef54959aef  LICENSE.md
diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
index 46b8acd673..7a49b2639a 100644
--- a/package/c-ares/c-ares.mk
+++ b/package/c-ares/c-ares.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-C_ARES_VERSION = 1.19.1
+C_ARES_VERSION = 1.20.1
 C_ARES_SITE = http://c-ares.haxx.se/download
 C_ARES_INSTALL_STAGING = YES
 C_ARES_CONF_OPTS = --with-random=/dev/urandom
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
