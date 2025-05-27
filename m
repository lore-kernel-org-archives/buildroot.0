Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23EDDC54ED1
	for <buildroot@archiver.kernel.org>; Tue, 27 May 2025 21:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3DB360D4E;
	Tue, 27 May 2025 21:56:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oYxrNWrUsCOU; Tue, 27 May 2025 21:56:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C606760B5B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C606760B5B;
	Tue, 27 May 2025 21:56:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 13434127
 for <buildroot@buildroot.org>; Tue, 27 May 2025 21:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 042C480830
 for <buildroot@buildroot.org>; Tue, 27 May 2025 21:56:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Ky-aUyCEhD0 for <buildroot@buildroot.org>;
 Tue, 27 May 2025 21:56:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0B1D48084D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B1D48084D
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0B1D48084D
 for <buildroot@buildroot.org>; Tue, 27 May 2025 21:56:31 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-b2c40a7ca6eso1530582a12.1
 for <buildroot@buildroot.org>; Tue, 27 May 2025 14:56:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748382991; x=1748987791;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WS0kvSMfiBSXyjlhg6G6alhBUDqKvh1X2YOFTIRATkM=;
 b=POUhJn5jpMQnOwxNT8i1Yxm3E+382lP93tJSLtiTiDB/ikVrahplKjd2BLc13O4GLq
 AIdA3NptgOXDnS4gaYLsbfCwwon5ZDizEGqhiE72F4gazcdDDXrWQS/AQE5+s4m3Eo7e
 N+S3Eq+E8H4+eeEJCsDloQzAdcJ33ceETr+2R31MyFZI6R825WxxpVtwxXy+BHc8F0UF
 eebu+yPdjOXlQoukOlCVfLtgQo1HPyTaVABY9gFgYDiV0afvXBmv4ugE4ID+b2bEd4J9
 iljCouGcUw/Fx/39fEDjssSyxuzbDblY19JNVUEOXU6iar0LBGCnzKoOZRfXOgIPRZYB
 Tc2Q==
X-Gm-Message-State: AOJu0YwOeDJgv21j4Dt1EB87eV1XnKBomt1vjZidl4FLUguZCwPTunpG
 z1Yu4WhLmz97S7rEQoHn4qgBbVG0abneFJxLGeJUdwIEbnZsk6oR8JR8ehFn/qzp
X-Gm-Gg: ASbGncvGDclqpplEIalQcrHSdgHNGIZoBpyg1RkbV5EsgOwMQfuSKYUR1EYtGsDoD2o
 hbMjft32JB22ocsgfwSi0Q9a7zUYDsIi7wL4gRWLmSakPdexjxghHAt96UFptI8s5n+lFrQYERu
 RdGYdSiy50U/36R7zElYM/RkYORSlA9j+9AB2rYExlL5ifq8rdeAqBOcNwmkSKLezIZbUVD4riw
 +/w4dvkkHEPU95pLNq9u8Xm2QGD89zExixJY2l/78yKrd892z+bKG9+bFLUbX8gVIHowQ6KbQXW
 U+9WD2CanX2xaxEDlbtnghOGKbIGKCVQ78havCErZWcPu+uLGiRTc4GIwIxGAq9/B5TUtGFTQv6
 OARG+Gun3WiCHeeMdIAvmmJ6cjZspVDtCSrDmrQ==
X-Google-Smtp-Source: AGHT+IHmGUsy6MrDF9p0KIgWLPCPsmAafxrAqyMd/XjNgjPkA8JcT0aSdq0lWwNQLWHn4387nOHRRg==
X-Received: by 2002:a17:90b:55c3:b0:2fe:b907:562f with SMTP id
 98e67ed59e1d1-3110f0ec419mr26620336a91.14.1748382990768; 
 Tue, 27 May 2025 14:56:30 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-311e3fb18eesm46020a91.35.2025.05.27.14.56.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 May 2025 14:56:30 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Kadambini Nema <kadambini.nema@gmail.com>
Date: Tue, 27 May 2025 14:56:21 -0700
Message-Id: <20250527215621.387724-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748382991; x=1748987791; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WS0kvSMfiBSXyjlhg6G6alhBUDqKvh1X2YOFTIRATkM=;
 b=DkoDq5enFUL7R1522liq/JYB9wFhvytVVoA9iMRa81UiXOfsVg32SZAwnsR6YymzXE
 VdJhERHk6XmspPONc4AOcdlDcup1cs/GTTJBAr50i3aEFLigZD2CKUHI+Hc7o7OXKSZy
 U0LOSIODd/B2npN/2JpZKcr3HtsDr/BHSoI9uHVchQtacRccXuoyEGVSae9tl2TM69ws
 +b0XLQUGuyR59R2uSg44AjsOw1yGjXv/kIaA90FRm1dNrWvakhdZOh8RRiUbDWz6aBvX
 BUfX1AvkecbZQxWksYTMpVAUlW6hO8I4WK/0CRbehTs4FDyGEbUzHnnUCQE9QMIyW+MU
 3sZA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DkoDq5en
Subject: [Buildroot] [PATCH 1/1] package/whois: bump to version 5.6.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/rfc1036/whois/blob/v5.6.1/debian/changelog

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/whois/whois.hash | 6 +++---
 package/whois/whois.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/whois/whois.hash b/package/whois/whois.hash
index 06237b65d4..6b1a3f4cc6 100644
--- a/package/whois/whois.hash
+++ b/package/whois/whois.hash
@@ -1,6 +1,6 @@
-# From https://snapshot.debian.org/archive/debian/20241116T203634Z/pool/main/w/whois/whois_5.5.23.dsc
-sha1  18227c0efec651c31fe764cdc3af17f5389bcc21  whois_5.5.23.tar.xz
-sha256  35c04e46bd8435f46e446a817728b5fae2f0a389033a9383e5e20bb6e8fba14a  whois_5.5.23.tar.xz
+# From https://snapshot.debian.org/archive/debian/20250527T144819Z/pool/main/w/whois/whois_5.6.1.dsc
+sha1  4c10bcc05b610bfd5a5c9c4465c97cf117826c2b  whois_5.6.1.tar.xz
+sha256  86b4d99d1ea219d2eaa20257b9c549642f101393b4b9369c391370a39341fc32  whois_5.6.1.tar.xz
 
 # Hash for license file:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/whois/whois.mk b/package/whois/whois.mk
index ca76b22e6d..836180e0ae 100644
--- a/package/whois/whois.mk
+++ b/package/whois/whois.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WHOIS_VERSION = 5.5.23
-WHOIS_SITE = https://snapshot.debian.org/archive/debian/20241116T203634Z/pool/main/w/whois
+WHOIS_VERSION = 5.6.1
+WHOIS_SITE = https://snapshot.debian.org/archive/debian/20250527T144819Z/pool/main/w/whois/
 WHOIS_SOURCE = whois_$(WHOIS_VERSION).tar.xz
 WHOIS_DEPENDENCIES = \
 	host-pkgconf \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
