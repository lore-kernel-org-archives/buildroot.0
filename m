Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB3AC5472C
	for <buildroot@archiver.kernel.org>; Sat, 24 Aug 2024 15:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C87904012B;
	Sat, 24 Aug 2024 15:15:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xCOsVfVQ04oE; Sat, 24 Aug 2024 15:15:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B8FD401ED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B8FD401ED;
	Sat, 24 Aug 2024 15:15:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8314D1BF2CE
 for <buildroot@lists.busybox.net>; Sat, 24 Aug 2024 15:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 702AB401ED
 for <buildroot@lists.busybox.net>; Sat, 24 Aug 2024 15:15:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Cx_XrCdDuYh for <buildroot@lists.busybox.net>;
 Sat, 24 Aug 2024 15:15:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 013A44012B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 013A44012B
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 013A44012B
 for <buildroot@buildroot.org>; Sat, 24 Aug 2024 15:15:17 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-5334c4d6829so3947957e87.2
 for <buildroot@buildroot.org>; Sat, 24 Aug 2024 08:15:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724512515; x=1725117315;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=471eOqBqf+MgFMwgRwNOFHZ8vZaRtKNoUw5CXeTq9dE=;
 b=I1sN3zY6J+C8j1J8KWS3F5cB3PfpvA9Nfv2P6MlBTL7Tcv3W+UO4j17R3yYa8Ks0CO
 AggHHf9lKs1MBsdj4w6Lt5I48/vLlTmVA4F7mG68G4R57Z5VouvIdz42wAAcm8vS+bmh
 AHRukGKXni/XaTv8pnW2RDocL2hRij0tCys62p66aMsBsDled8qojM5KB0mqI2w0LlVU
 iimVzkBbgspd0Gb6vobMxj/9AYcHPyI+DR48caqxfkNJY2ioCm8Qqbuw9P5CLDwerx5T
 mStPVWwKNUelagBDeHde4J5KvrGypBGiN8sMUa//QzIV/lCMgND20ZOhsjqz8BB4S3ti
 71TQ==
X-Gm-Message-State: AOJu0YwVQzPf+iBNWfkaPkBgxPe1YyOEPRkEnYNq6A0j2I4C9cHQEA65
 PCgragWVYt5tvpC9cCHrD+iU+JGlrofRtxTAAGKoyTcReo7baiyRzqd483t2nU+chDhxoYoBrZf
 QDwA=
X-Google-Smtp-Source: AGHT+IFXclvguiuUHWUoPj5x3ZfwJxBWhB/kkAEoby02sQXX1dW/8Fn5TkUz4wl/RMOvSGZq0gfSUQ==
X-Received: by 2002:a05:6512:3e0d:b0:533:901:e441 with SMTP id
 2adb3069b0e04-534387683eamr3490174e87.10.1724512514501; 
 Sat, 24 Aug 2024 08:15:14 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-25-99-149.retail.telecomitalia.it. [79.25.99.149])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f48ae53sm412450266b.187.2024.08.24.08.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Aug 2024 08:15:14 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 24 Aug 2024 17:15:11 +0200
Message-ID: <20240824151511.3178807-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1724512515; x=1725117315;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=471eOqBqf+MgFMwgRwNOFHZ8vZaRtKNoUw5CXeTq9dE=;
 b=BqiB5MdafdYhhJhy/u5GD/a8pDfQqs5ByIlZ4ZE4Bh32pQDVjJRZ/Zx8+vaONVdSL5
 dKHIZ+K/J4E+Upjjdx0G/LBhbCxfJLvdb0bsrlFnB3qtAghvFSUdl1AFfczJQ7cupUI9
 HmjwVHLSIrzJ3eIeLtEaFAcYaENOTNlRdVLOo=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=BqiB5Mda
Subject: [Buildroot] [PATCH 1/1] package/armadillo: bump to version 10.1.0
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
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- C++11 is now the minimum required C++ standard
- faster handling of compound expressions by trimatu() and trimatl()
- faster sparse matrix addition, subtraction and element-wise multiplication
- expanded sparse submatrix views to handle the non-contiguous form of X.cols(vector_of_column_indices)
- expanded eigs_sym() and eigs_gen() with optional fine-grained parameters

Fixes:
- http://autobuild.buildroot.org/results/d4e9e7b453960a4f62a199344b30b729a4f235bc

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/armadillo/armadillo.hash | 2 +-
 package/armadillo/armadillo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/armadillo/armadillo.hash b/package/armadillo/armadillo.hash
index cc91fb456aa0..d7a17f226f4e 100644
--- a/package/armadillo/armadillo.hash
+++ b/package/armadillo/armadillo.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  d78658c9442addf7f718eb05881150ee3ec25604d06dd3af4942422b3ce26d05  armadillo-9.900.2.tar.xz
+sha256  72e3f1b4b4d1b4df70d9cb1e321a254ea04d7843f68a6c34d82691997d558395  armadillo-10.1.0.tar.xz
 # License files, locally calculated
 sha256  3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  LICENSE.txt
diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index 8661bfd9da87..b3ae9ef68fa9 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ARMADILLO_VERSION = 9.900.2
+ARMADILLO_VERSION = 10.1.0
 ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
 ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
 ARMADILLO_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
