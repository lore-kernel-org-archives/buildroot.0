Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A9B9C4345F
	for <buildroot@archiver.kernel.org>; Sat, 13 Apr 2024 13:18:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11D2281F38;
	Sat, 13 Apr 2024 13:18:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nCXthM1TPVbB; Sat, 13 Apr 2024 13:18:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D95E82209
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D95E82209;
	Sat, 13 Apr 2024 13:18:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 08C361BF855
 for <buildroot@lists.busybox.net>; Sat, 13 Apr 2024 13:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 035D7400CF
 for <buildroot@lists.busybox.net>; Sat, 13 Apr 2024 13:18:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rtFqagfDhIUo for <buildroot@lists.busybox.net>;
 Sat, 13 Apr 2024 13:18:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EF205400C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF205400C4
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EF205400C4
 for <buildroot@buildroot.org>; Sat, 13 Apr 2024 13:18:04 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a51ddc783e3so212042466b.0
 for <buildroot@buildroot.org>; Sat, 13 Apr 2024 06:18:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713014283; x=1713619083;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1AoV0pG39hBORxb51NepZX79fVrboZPWxejIuQW49S8=;
 b=Y9h7I05WXhKnDdwvojZPtHwI5NpKehPAuS1Xhnbx8Q7dlJIOb0wB2ywKaxLDauldB8
 5TGuU2DjhadUNNdcQiusm6EVSoRL4CBgLf78ik3iy2886+pTUtMXqflzv0h4w/zIQjkh
 gz3XzbUZP596N30Wajls2LPDDB51NEy1jQTQRGvy+0+CvBJPwpAWW7jBxjOc7rFbTnEp
 51PerydaVj69FobNOaj5aZG/DB5XXM0Hpo5A06xHNraOCbWVeUSQngScxmVC8R6go0V9
 QZR9tM+yQ2hDvH2fh1K0fYJPQCla99N651G1Qno9AXCZQ5nNHfSuhUbq5NcMWGAxd/ya
 JDXA==
X-Gm-Message-State: AOJu0Yw0N22IT7DrtGWeLn9E12IxtODlIXlLbQ4EAU8fNTLSmA1g266f
 D9PrwZtZQSMuVJCEwcQv0B6vLw9S+IOV/MI/DyKBrtrpQiGhsUE9YOVJcbKY1yihBE/RgxDkpav
 H6wc=
X-Google-Smtp-Source: AGHT+IEWVRes3PcOy3+H9iYt7IYTNuiCObMVfUO9d9htdEoYtId5Sv2tmQr8hQC+xocTdRFEoETmOw==
X-Received: by 2002:a17:907:bb97:b0:a52:5608:75cb with SMTP id
 xo23-20020a170907bb9700b00a52560875cbmr182279ejc.21.1713014282818; 
 Sat, 13 Apr 2024 06:18:02 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-8-99-67.retail.telecomitalia.it. [87.8.99.67])
 by smtp.gmail.com with ESMTPSA id
 jy3-20020a170907762300b00a521603e14csm2993302ejc.138.2024.04.13.06.18.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Apr 2024 06:18:02 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 13 Apr 2024 15:17:57 +0200
Message-ID: <20240413131757.3627575-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240413131757.3627575-1-dario.binacchi@amarulasolutions.com>
References: <20240413131757.3627575-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1713014283; x=1713619083;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1AoV0pG39hBORxb51NepZX79fVrboZPWxejIuQW49S8=;
 b=mIY+uX1AVFo317tOiczkqU6VXmDZrOlDchy2mVnkOLoN80nM9RpJAYRF8os2x2UC5Q
 RFOva4TFfw6dZg6SMX+LW9aT4s7U2Lk6HKWUp+jcFf0qS4dBJxwJO4GeohCIa5GPwIZW
 pHf2AnueoMa8QLI4fbzeP+LVTPGOZXx6op6k4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=mIY+uX1A
Subject: [Buildroot] [PATCH 3/3] package/bmaptool: bump to version 3.8.0
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
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Note that, although not explicitly specified in the changelog, version
3.7 renamed the file COPYING to LICENSE, requiring corresponding changes
in Bildroot related to the license file (specifically, the name and hash).

Release notes:

- bmap-tools 3.7:
  * Use GitHub Actions for CI (#109)
  * Add `poetry` for dependency management and `black` for code
    formatting (#104)
  * Add functionality for copying from standard input (#99)
  * Switch from gpg to gpgme module (#103)

- bmaptool 3.8.0:
  * use 'df -P' for POSIX portable output
  * bmaptool has new maintainers
  * bmaptool has a new home
  * bmaptool is now only called 'bmaptool' and not one of a dozen such
    variations
  * switch to use an X.Y.Z versioning number scheme

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/bmaptool/bmaptool.hash | 4 ++--
 package/bmaptool/bmaptool.mk   | 6 ++++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/bmaptool/bmaptool.hash b/package/bmaptool/bmaptool.hash
index 9d621e76a52a..84040c948a2d 100644
--- a/package/bmaptool/bmaptool.hash
+++ b/package/bmaptool/bmaptool.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7a2e1305bf7e06bc4a580cc719f0facf9d99af8d41659b57c0acae4ad93ff45a  bmaptool-3.6.tar.gz
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  3c741ccdd5049b5cb6983bc186f7be8040a132ed7e9c2afda4d9e7390888163c  bmaptool-3.8.0.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/bmaptool/bmaptool.mk b/package/bmaptool/bmaptool.mk
index 34664d13b37f..fa453d4e9819 100644
--- a/package/bmaptool/bmaptool.mk
+++ b/package/bmaptool/bmaptool.mk
@@ -4,11 +4,13 @@
 #
 ################################################################################
 
-BMAPTOOL_VERSION = 3.6
+BMAPTOOL_VERSION = 3.8.0
 BMAPTOOL_SITE = $(call github,yoctoproject,bmaptool,v$(BMAPTOOL_VERSION))
 BMAPTOOL_LICENSE = GPL-2.0
-BMAPTOOL_LICENSE_FILES = COPYING
+BMAPTOOL_LICENSE_FILES = LICENSE
 BMAPTOOL_SETUP_TYPE = setuptools
+BMAPTOOL_DEPENDENCIES = host-python-poetry-core
+HOST_BMAPTOOL_DEPENDENCIES = host-python-poetry-core
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
