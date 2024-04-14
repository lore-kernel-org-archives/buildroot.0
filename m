Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA394C4345F
	for <buildroot@archiver.kernel.org>; Sun, 14 Apr 2024 13:05:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DE586074E;
	Sun, 14 Apr 2024 13:05:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UuqPl0dH-nZo; Sun, 14 Apr 2024 13:05:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3184960750
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3184960750;
	Sun, 14 Apr 2024 13:05:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AEBB81BF379
 for <buildroot@lists.busybox.net>; Sun, 14 Apr 2024 13:05:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A1B1281E1C
 for <buildroot@lists.busybox.net>; Sun, 14 Apr 2024 13:05:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eMm9vy12yZud for <buildroot@lists.busybox.net>;
 Sun, 14 Apr 2024 13:05:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5F5FC814B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F5FC814B3
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F5FC814B3
 for <buildroot@buildroot.org>; Sun, 14 Apr 2024 13:05:27 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2d88a869ce6so27120281fa.3
 for <buildroot@buildroot.org>; Sun, 14 Apr 2024 06:05:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713099925; x=1713704725;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uabRGeyKyGpdLuRItPlhioL3KAUiPUGM6RC7PCFNFvo=;
 b=mwiUv4CxhEWulGAWMaT9uMYRIBYb7n5+WLLE6f6gYeOaLPZVCuRzI+dnae+9714da5
 ce2hIMs5SZ+/n+w5Y0267csDSlWgPwFF6z9xVEPBuNVRe/iyL+AtCBCP7hCkyVqthPNV
 JWZzrqd13UscFtSzbycu+bn2gjkInV5VUkME8A/WctCkRjX+NoVOhVNFRmLqqRNCYZcX
 05PEOKZvACstszJ3M7Y2g+JRrD8CBFdE9Y6rCT/UNN4+ofCamyOikRVjn9D8iHctNGFe
 ifaRDLOCuhqjPKQycoXX15X1TOJzCN7oI5qH9SWrZTaS/omhSb7YzmvrUlDXALlMZcW0
 5x/Q==
X-Gm-Message-State: AOJu0YyjyY3CiJrschhXHtj1IFoDBNq5kgM9MAT5zbgPVDiyjS/umsnd
 mVo7J7QBiR7ibPqVhDo28TmrZ8wfIGBtjskWz8fxo0aHthrRREZoHNmT49sCStBMZ6IREkXNi2i
 6M/Q=
X-Google-Smtp-Source: AGHT+IGQjnRRch6r5fVq6B3wp2bKlyTFppPqYPEGR4gXp+dTXF4m2FtppdXpUoD73g929mSijqAtBg==
X-Received: by 2002:a05:6512:3083:b0:518:cfd1:cd4c with SMTP id
 z3-20020a056512308300b00518cfd1cd4cmr1471132lfd.10.1713099924619; 
 Sun, 14 Apr 2024 06:05:24 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([176.201.31.28])
 by smtp.gmail.com with ESMTPSA id
 i10-20020adffc0a000000b003456c693fa4sm9083686wrr.93.2024.04.14.06.05.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Apr 2024 06:05:24 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 14 Apr 2024 15:05:18 +0200
Message-ID: <20240414130520.3647875-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1713099925; x=1713704725;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uabRGeyKyGpdLuRItPlhioL3KAUiPUGM6RC7PCFNFvo=;
 b=fzo0sQ4R49SnTeXnfMyUMv18yUJAkizxMPy2xWwwgTN7u2XKP5hAWJckAEyw2h69Gy
 Jwc5HR/KxcNLKMgf/GCGuA9j/M3AD+jx5FcaLMvfO0k/RRmueETMcef1SzSIAMukiRGu
 G+otkeohMU/1L3Qm/IPFpS1jiwo1sarj6cC08=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=fzo0sQ4R
Subject: [Buildroot] [PATCH v2 1/3] package/bmap-tools: update GitHub URL
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
 "Yann E . Morin" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As reported in the README file of the old GitHub URL (i.e.
https://github.com/intel/bmap-tools), "The code at this location is no
longer maintained and will likely be removed in the future. This project
has moved to https://github.com/yoctoproject/bmaptool".

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/bmap-tools/Config.in      | 2 +-
 package/bmap-tools/Config.in.host | 2 +-
 package/bmap-tools/bmap-tools.mk  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bmap-tools/Config.in b/package/bmap-tools/Config.in
index 91081069c739..425b7dfb9e07 100644
--- a/package/bmap-tools/Config.in
+++ b/package/bmap-tools/Config.in
@@ -40,4 +40,4 @@ config BR2_PACKAGE_BMAP_TOOLS
 	  python-gpgme is not available. Optimized bzip2 decompression
 	  is not supported as pbzip2 is not available.
 
-	  https://github.com/intel/bmap-tools
+	  https://github.com/yoctoproject/bmaptool
diff --git a/package/bmap-tools/Config.in.host b/package/bmap-tools/Config.in.host
index a20829030d68..cb4d35a437fa 100644
--- a/package/bmap-tools/Config.in.host
+++ b/package/bmap-tools/Config.in.host
@@ -9,4 +9,4 @@ config BR2_PACKAGE_HOST_BMAP_TOOLS
 	  image files, can be copied or flashed a lot faster with
 	  bmaptool than with traditional tools like "dd" or "cp".
 
-	  https://github.com/intel/bmap-tools
+	  https://github.com/yoctoproject/bmaptool
diff --git a/package/bmap-tools/bmap-tools.mk b/package/bmap-tools/bmap-tools.mk
index 32399ca151c4..69a22c4745ab 100644
--- a/package/bmap-tools/bmap-tools.mk
+++ b/package/bmap-tools/bmap-tools.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 BMAP_TOOLS_VERSION = 3.6
-BMAP_TOOLS_SITE = $(call github,intel,bmap-tools,v$(BMAP_TOOLS_VERSION))
+BMAP_TOOLS_SITE = $(call github,yoctoproject,bmaptool,v$(BMAP_TOOLS_VERSION))
 BMAP_TOOLS_LICENSE = GPL-2.0
 BMAP_TOOLS_LICENSE_FILES = COPYING
 BMAP_TOOLS_SETUP_TYPE = setuptools
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
