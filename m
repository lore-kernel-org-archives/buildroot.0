Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CCF1D6D252
	for <buildroot@archiver.kernel.org>; Thu, 28 Nov 2024 01:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DF1784F85;
	Thu, 28 Nov 2024 01:22:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TYV_fb3bKaxr; Thu, 28 Nov 2024 01:22:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 962B584D89
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 962B584D89;
	Thu, 28 Nov 2024 01:22:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5384F1167
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 01:22:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33EB143354
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 01:22:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rGczXkRGiuxK for <buildroot@buildroot.org>;
 Thu, 28 Nov 2024 01:22:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EA42543351
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA42543351
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EA42543351
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 01:22:35 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-21207f0d949so2572955ad.2
 for <buildroot@buildroot.org>; Wed, 27 Nov 2024 17:22:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732756955; x=1733361755;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kRThbtNjQHkuXsUE8QQrBHLL4PFuppySf1DCz8rXny4=;
 b=BeY1Jrde33WFckp2FCS3PPMSxGBMVJNHxBDLy7tMIW3VmFVvdAZqF3u+VEdKzIh1td
 Y8TsvsmB8e0XjOkfk9RGfKx/5edQuJYfSHz4tv6Ee02xOTI2IAdVSIhWRZq7oaTfrM7n
 ZAiBhU4lQMTSNsqcJkKOQui46ekuo4fVCd2iqoUzHC0LUrchz/3DmsMB91nWTskFm16Y
 t1MNm8rLXcuESRgG1eJHL0gEptK4GwZX1szLHruyrndyyKMbI4+z8Umh4OVEFQ+egvTu
 pjrEMhPKksdHZ5PLr44UguMDRetZWoIZi7V2Q3AQbesY+1WVbFlUzt7awlLjFkgpDrGD
 fCrw==
X-Gm-Message-State: AOJu0YxpGDTCeR/mDWvJoiNKv+jGSLr47giit/Az7zKEPrT7ysg8HImR
 R7WIUE6KPdBVfJ9zNWz2ron+sDMelxqnD5DSdf5G/og+WnjC/iR4DprzhkBDRiRek5mgtDcvoqV
 zeig=
X-Gm-Gg: ASbGncvToYjjppv5jrmLtsOcxsNnKgP0QkMaDhNUGEtcJiIMQHIhIVmPOtaLahtL1Re
 8xvfC3U0ap3ugBICJm4OyJy8O9iTWz7mtxQ1HuJaIzLTuW3tnn6+d9pldY+ixUi0HqXn2MmTACh
 NkS32XAI06Q3mFl8o1C0G3D58+bqGxT/AlAwhfXHkmC6SKwUWCbSVkV3ZOQqgwtvyYzhXtRytkX
 m3vIKUbJg7MObh4SkQFwLCtyCzlsvmqEOunWWwU22Q8Ge5unDGaKRlN39hvGAl9RSLo+xixYwFE
 8shAF4fQvXUBs0vMxj7R5xv+CfIrrLfjsTvd4TLY
X-Google-Smtp-Source: AGHT+IEhXEQTY8x0v3U/rK3RXWVZH+Ym6b7DJTY8Sw94i22Wsi/MGGbLsxXYoAJSo3zF88LVrToM9g==
X-Received: by 2002:a17:902:cecc:b0:211:f335:aba with SMTP id
 d9443c01a7336-2150157068bmr65400255ad.31.1732756954987; 
 Wed, 27 Nov 2024 17:22:34 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2152190614dsm2030545ad.95.2024.11.27.17.22.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 27 Nov 2024 17:22:34 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed, 27 Nov 2024 17:22:17 -0800
Message-ID: <20241128012217.21455-1-christian@aperture.us>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1732756955; x=1733361755; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kRThbtNjQHkuXsUE8QQrBHLL4PFuppySf1DCz8rXny4=;
 b=AHuGH7+WZO+sJQMkhzUGgmIIdl3rKatojRkiUKk5HeHDUKehP5nAoIpyR1Jl3IqOuW
 KiCJl+G38G8wxDz6+WohkK/dvSUrAIYRrWfe1m+toHB17VVLWi+mE5uwwKSAAacTfhO6
 UBUxi3tq6eipQ2KZ/PlcGNQ+kt2KtNxT6Rqi0pGWUBDUTH+Te8v9GPnBtpH6oShz+9fr
 6bJutFPj0lQdqCt5m0cJDyh+tDaly9RlaSgdu6LnwL3tRGPNBhWNCx0++0HTT75kmto7
 Gzb888wrvKyr1pz8zMwA+2fg5DiNiDUL9BC/1f0iWM66Cc3FuGCdLk9KKmg6jI4M4xMx
 S2qw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=AHuGH7+W
Subject: [Buildroot] [PATCH v1 1/1] package/go: bump version to go1.23.3
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

go1.23.3 (released 2024-11-06) includes fixes to the linker, the runtime,
and the net/http, os, and syscall packages.

https://go.dev/doc/devel/release#go1.23.minor

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/go/go-bin/go-bin.hash | 14 +++++++-------
 package/go/go-src/go-src.hash |  2 +-
 package/go/go.mk              |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/go/go-bin/go-bin.hash b/package/go/go-bin/go-bin.hash
index cc87cac3a6..5f008c773e 100644
--- a/package/go/go-bin/go-bin.hash
+++ b/package/go/go-bin/go-bin.hash
@@ -1,9 +1,9 @@
 # sha256 checksum from https://go.dev/dl/
-sha256  36930162a93df417d90bd22c6e14daff4705baac2b02418edda671cdfa9cd07f  go1.23.2.src.tar.gz
-sha256  cb1ed4410f68d8be1156cee0a74fcfbdcd9bca377c83db3a9e1b07eebc6d71ef  go1.23.2.linux-386.tar.gz
-sha256  542d3c1705f1c6a1c5a80d5dc62e2e45171af291e755d591c5e6531ef63b454e  go1.23.2.linux-amd64.tar.gz
-sha256  f626cdd92fc21a88b31c1251f419c17782933a42903db87a174ce74eeecc66a9  go1.23.2.linux-arm64.tar.gz
-sha256  e3286bdde186077e65e961cbe18874d42a461e5b9c472c26572b8d4a98d15c40  go1.23.2.linux-armv6l.tar.gz
-sha256  c164ce7d894b10fd861d7d7b96f1dbea3f993663d9f0c30bc4f8ae3915db8b0c  go1.23.2.linux-ppc64le.tar.gz
-sha256  de1f94d7dd3548ba3036de1ea97eb8243881c22a88fcc04cc08c704ded769e02  go1.23.2.linux-s390x.tar.gz
+sha256  8d6a77332487557c6afa2421131b50f83db4ae3c579c3bc72e670ee1f6968599  go1.23.3.src.tar.gz
+sha256  3d7b00191a43c50d28e0903a0c576104bc7e171a8670de419d41111c08dfa299  go1.23.3.linux-386.tar.gz
+sha256  a0afb9744c00648bafb1b90b4aba5bdb86f424f02f9275399ce0c20b93a2c3a8  go1.23.3.linux-amd64.tar.gz
+sha256  1f7cbd7f668ea32a107ecd41b6488aaee1f5d77a66efd885b175494439d4e1ce  go1.23.3.linux-arm64.tar.gz
+sha256  5f0332754beffc65af65a7b2da76e9dd997567d0d81b6f4f71d3588dc7b4cb00  go1.23.3.linux-armv6l.tar.gz
+sha256  e3b926c81e8099d3cee6e6e270b85b39c3bd44263f8d3df29aacb4d7e00507c8  go1.23.3.linux-ppc64le.tar.gz
+sha256  6bd72fcef72b046b6282c2d1f2c38f31600e4fe9361fcd8341500c754fb09c38  go1.23.3.linux-s390x.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go-src/go-src.hash b/package/go/go-src/go-src.hash
index b475ec4a46..1a185d011c 100644
--- a/package/go/go-src/go-src.hash
+++ b/package/go/go-src/go-src.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  36930162a93df417d90bd22c6e14daff4705baac2b02418edda671cdfa9cd07f  go1.23.2.src.tar.gz
+sha256  8d6a77332487557c6afa2421131b50f83db4ae3c579c3bc72e670ee1f6968599  go1.23.3.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 33dc681358..3dd590bf6f 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.23.2
+GO_VERSION = 1.23.3
 
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
