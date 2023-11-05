Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71CDBC4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 09:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 080B160FFF;
	Sun,  5 Nov 2023 09:51:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 080B160FFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o78b_i-rdQAU; Sun,  5 Nov 2023 09:51:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 473FA60FCD;
	Sun,  5 Nov 2023 09:51:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 473FA60FCD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 82F8F1BF592
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 09:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6068A404DB
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 09:51:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6068A404DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kA8N4SbWmbBP for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 09:51:14 +0000 (UTC)
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D59C1400A6
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 09:51:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D59C1400A6
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2c54c8934abso49549641fa.0
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 01:51:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699177871; x=1699782671;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mNmpIbBH7wGlkNsHDhqoT1GccMoKXin6LjKO78na5qw=;
 b=P1nxf/bIKkPAPZ0bzWDNCPhbkk2Zgwrrk3K+zhOZVdF3oh7zyvmzPzS4vAMim5vUAz
 L8/+cSBe/jddSJr8AVno17OmwJe3+/aIgmbVjP4xrK8XMl9hQKDDXy/WynlI0v/HF/Fy
 1rc/nZzC02avPVWrZZFE9Mg8gDfVboiko38zNZyfqG9+x1z+d5FvMQqzDUcdjU9GdExL
 tlTOP7qUDaU879EQ+RJsjrx23sAO+I8CciesazQ52pVPIrN8ijsCcdRPvjYIIeEmamc9
 J86sv76DrmSfObAXXhYI1rLcMZSmIGve1J7iX2qt9ooU5R/a5jUkrqsUuF007ag57p2k
 wCTA==
X-Gm-Message-State: AOJu0YzC/Olbl64hDpA+fcY7VE1zE/I7tTu+4ChS8/Pv3I7x+DoJEic3
 ecCf2m3dIf5ddgjM850JycEd9IXvgug=
X-Google-Smtp-Source: AGHT+IEvkNzKHvSULrl/T0Toos8yd5PAXcy+cjX1XbdGoRkjfyvAC+mwFRsFbcfVvBnYUU1fZWUjRg==
X-Received: by 2002:a2e:86c3:0:b0:2c5:94a:ac96 with SMTP id
 n3-20020a2e86c3000000b002c5094aac96mr22239992ljj.9.1699177870524; 
 Sun, 05 Nov 2023 01:51:10 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 x17-20020a05600c2d1100b004077219aed5sm8291428wmf.6.2023.11.05.01.51.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 01:51:10 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 10:51:08 +0100
Message-ID: <20231105095108.777043-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699177871; x=1699782671; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mNmpIbBH7wGlkNsHDhqoT1GccMoKXin6LjKO78na5qw=;
 b=ePDz78h7fbM/lDfT3v172KeaT8kJEQXBqdNdTkPfpraxtqr8Tl/USV6T1JTL6GG4g5
 malGw47ko9ItqNQetB0BSDvXR7ARPt5YXdFGHIgiqySIjuKIwGzPHKwqIAVnCgVNFUcr
 2LJNe6c1pdZ9KubRrPznZjLKTtj4q/GN8LR8wn+yIk17PesWnPE59xOiP8XPlaneUrLO
 zvpi2q4OkP4HBGH4YM+/tbkJgNpfCwLPOWPvY/JKpuRjqx2rL2j4wdr270myOnB9PFM2
 Y9AHd+XlfA1CvibSbero/+1E1OJZyERq1/UW2Yihr9QVh2loHtnvqz9/zNlQORnZ7Ve5
 2s5Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ePDz78h7
Subject: [Buildroot] [PATCH 1/1] package/flashrom: fix build on sh4
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure on sh4 raised since bump to version
1.3.0 in commit

/home/thomas/autobuild/instance-3/output-1/per-package/flashrom/host/bin/../lib/gcc/sh4a-buildroot-linux-gnu/12.3.0/../../../../sh4a-buildroot-linux-gnu/bin/ld: libflashrom.a(internal.o): in function `internal_chip_readn':
internal.c:(.text+0x8): undefined reference to `mmio_readn'

Fixes:
 - http://autobuild.buildroot.org/results/f74a9d315fb519f284428234713f43fcf4e35fd0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...G_INTERNAL-depends-on-raw-mem-access.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/flashrom/0001-Makefile-CONFIG_INTERNAL-depends-on-raw-mem-access.patch

diff --git a/package/flashrom/0001-Makefile-CONFIG_INTERNAL-depends-on-raw-mem-access.patch b/package/flashrom/0001-Makefile-CONFIG_INTERNAL-depends-on-raw-mem-access.patch
new file mode 100644
index 0000000000..9d3f3d9c51
--- /dev/null
+++ b/package/flashrom/0001-Makefile-CONFIG_INTERNAL-depends-on-raw-mem-access.patch
@@ -0,0 +1,35 @@
+From aac91025386aa9d7b8214f8ad1746ef5c02f2d8d Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 5 Nov 2023 10:38:32 +0100
+Subject: [PATCH] Makefile: CONFIG_INTERNAL depends on raw mem access
+
+CONFIG_INTERNAL depends on raw mem access resulting in the following
+build failure on sh4 since version 1.3.0:
+
+/home/thomas/autobuild/instance-3/output-1/per-package/flashrom/host/bin/../lib/gcc/sh4a-buildroot-linux-gnu/12.3.0/../../../../sh4a-buildroot-linux-gnu/bin/ld: libflashrom.a(internal.o): in function `internal_chip_readn':
+internal.c:(.text+0x8): undefined reference to `mmio_readn'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/f74a9d315fb519f284428234713f43fcf4e35fd0
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://review.coreboot.org/c/flashrom/+/78930
+---
+ Makefile | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile b/Makefile
+index bf01d0f8..cd21f22f 100644
+--- a/Makefile
++++ b/Makefile
+@@ -115,6 +115,7 @@ DEPENDS_ON_RAW_MEM_ACCESS := \
+ 	CONFIG_ATAPROMISE \
+ 	CONFIG_DRKAISER \
+ 	CONFIG_GFXNVIDIA \
++	CONFIG_INTERNAL \
+ 	CONFIG_INTERNAL_X86 \
+ 	CONFIG_IT8212 \
+ 	CONFIG_NICINTEL \
+-- 
+2.42.0
+
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
