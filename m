Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F45CD8CA8
	for <buildroot@archiver.kernel.org>; Mon,  8 Jun 2026 22:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A340542AFB;
	Mon,  8 Jun 2026 22:14:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q6bjElVI52Y1; Mon,  8 Jun 2026 22:14:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDAD442AF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780956876;
	bh=XTVYe6h2bSqTnC9+wJ/MUFwtdXlWgtFuY9hAXqLkyCM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kcjZHusrDLqY9r1/vEHnANJ+YqNjVgWNhZEDLlSdIEnaOt3BDZnhsF1ngV1HZQqlM
	 VS9MTfX4oXv4p61ze4d1EInKx2gNQg0n2yi3Dk00Thf0+KEpN8Ogsi6HQW1+BLp1uM
	 XRlcK54YJcPxCp1igHRse8Gli+7gnUVcifFbDuYhe0gOYfyETUnSnUtZTSJ//JgiSQ
	 AgZWB/ls1gcc3GDONuDDFeLAgBxQlGK/eXrlCU7CdRT99LtUQUOkTLIPzPrVtyqEiZ
	 rDcZOuVsyjzVW9Ot6NeOwQcI4MYGrrdS07tod5mBPu3CfxUlGcBKspzXOKBL8YtUf4
	 KtEXFnjIfwA8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDAD442AF4;
	Mon,  8 Jun 2026 22:14:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 95CFA190
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 22:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A6D7811DB
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 22:14:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cJCamxPUNpHu for <buildroot@buildroot.org>;
 Mon,  8 Jun 2026 22:14:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 94235811D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94235811D2
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 94235811D2
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 22:14:33 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-490a76757e5so31439645e9.2
 for <buildroot@buildroot.org>; Mon, 08 Jun 2026 15:14:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780956871; x=1781561671;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=B4K8kCDKDKAac4k+u3mgXSpePfbJywfSLSolqrsK49I=;
 b=rQc1JShYGACXw4I2oUisH9lk6Zu4v4VdDjopfmW0JeaIyZtZQ1v5nLJbb9cGmAoByC
 LVnT20pPwEIlmbk1LHGY2sJwLFsUcwlCPFSremCIk2kFdmy3c2SMsSRsi65H0OfFjl1t
 Q3HVSw1om5fwef2eIKGMVoPR5NxpqMwVOO+6buJjtYZ/N8KL1LohSFlrQirNLxQG4TON
 N4MIRle4KdRskiCwpMrMhHAIN8N0MdDygUFNRuPi/3QXwk8JbJ2aekac1NtwuhlN/0bJ
 +FmZThzPVyuSSWT76K24LH7byDwSnF8tMcfxHA7nhcOytGZZMwkmEFiL2i1fa+RfnbTN
 TRQA==
X-Gm-Message-State: AOJu0Yxh2hytYsH4jcN9gi3sRM1kvRInxGhFuknIczqPVJO9KmXdVzFw
 JPnZsEjoXEwKNmNGioE+vtoXOCFMOJc+8o/2DmdqFqktGmJckYjLqQ5zm556brpmQhzX4l5NFH6
 3Zswj
X-Gm-Gg: Acq92OHDoS3PxAGC7QhFTVwOXPjZOw9Yx6V1i6pwQfAeS1+cZ/ETiE8JB3AgG7TOJNv
 +x3KydSoBdKZbZ22GaufSkPdM9ZEcUXIksIld6BXR9vsvJ+N2QfUWoxOJFOijE/JEVyg/oO2oP9
 6La0wr2ZAKlfAehFu/wltf5flRmH/GjM28A8kklxywA8EFpJeLlZzM0IVCQwbgk96HVTs2M+Kyx
 WRilf+2KVFsvRMnVcb8xNTK1K37WWP9mTSOcG3y8hR1nhyPwT3tncPJ66ZOXFknLkIY5FCLuaMu
 KdZhwR/7mAKcQj42P0tADngAUEnPPvuA6b7Xgp+yfdWnFanLq/DH8KzPeAgt1stTUWfn/9xwQYW
 OhEcbCR1okd4rDVGM8j2yFITcUtg10pMDIp0cKPbqo01HHm89kqRM0L9iRSba9fHrRVLoeNmcAl
 4dFVadgHTQU2MkbU07+oHEgz7JJyWKwtppwn80sPv7hz4lss4=
X-Received: by 2002:a05:600c:1d29:b0:490:50eb:b777 with SMTP id
 5b1f17b1804b1-490c2597822mr289322245e9.5.1780956871477; 
 Mon, 08 Jun 2026 15:14:31 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2f5612sm53788826f8f.15.2026.06.08.15.14.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2026 15:14:31 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin@orange.com>
Date: Tue,  9 Jun 2026 00:14:16 +0200
Message-ID: <20260608221416.919015-2-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260608221416.919015-1-titouan.christophe@mind.be>
References: <20260608221416.919015-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780956871; x=1781561671; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B4K8kCDKDKAac4k+u3mgXSpePfbJywfSLSolqrsK49I=;
 b=Z/VqCfBrJszV91SxqUIMwawVDZzwRroWOhVlQr38FWxyMMcBhvvEOe1YhKHfMCtyXh
 ZU0wAqesXEJ2gGqskJLIc+uNUDa1uOX5h0jVbOljQy09tznZO5ZIeLOyV80/krMwaaCW
 LGd86MPad16U8p4Gv+I6rchppNvFMmFjjyBX7cLql6fYPh/4aPpXOaw28Ag+akWmdX38
 rFYJ6glforfNF8bIRsFuqPfLC9f/AQszsMn/nlqHFWtR6U/dyHNOYhC4Va2ddMymzcK+
 iRgSnSYvYHaAY91lOVkKGYuw03TNGZVQQF/FpniKkHDGX7NlhGZv6ZJU60hXk35lYTzq
 eVdw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Z/VqCfBr
Subject: [Buildroot] [PATCH 2/2] package/{binutils, gpsd,
 x11vnc}: fix newly implemented MissingCVEPatch
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- In the case of binutils, add a missing prefix to the specific version
  to which this patch applies
- For x11vnc, fix a typo in the patch name
- For gpsd, remove 2 entries that are legit

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/binutils/binutils.mk | 2 +-
 package/gpsd/gpsd.mk         | 6 ------
 package/x11vnc/x11vnc.mk     | 2 +-
 3 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index f772c9cf9a..f89adbe966 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -31,7 +31,7 @@ BINUTILS_LICENSE = GPL-3.0+, libiberty LGPL-2.1+
 BINUTILS_LICENSE_FILES = COPYING3 COPYING.LIB
 BINUTILS_CPE_ID_VENDOR = gnu
 
-# 0003-objdump-memleak.patch
+# 2.44/0003-objdump-memleak.patch
 BINUTILS_IGNORE_CVES += CVE-2025-3198
 
 ifeq ($(BINUTILS_FROM_GIT),y)
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 27a02c1754..7fd8cec8ab 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -14,12 +14,6 @@ GPSD_INSTALL_STAGING = YES
 
 GPSD_DEPENDENCIES = host-scons host-pkgconf
 
-# 0005-drivers-driver_nmea2000.c-Fix-issue-356-skyview-buff.patch
-GPSD_IGNORE_CVES += CVE-2025-67268
-
-# 0006-gpsd-packet.c-Fix-integer-underflow-is-malicious-Nav.patch
-GPSD_IGNORE_CVES += CVE-2025-67269
-
 GPSD_LDFLAGS = $(TARGET_LDFLAGS)
 GPSD_CFLAGS = $(TARGET_CFLAGS)
 GPSD_CXXFLAGS = $(TARGET_CXXFLAGS)
diff --git a/package/x11vnc/x11vnc.mk b/package/x11vnc/x11vnc.mk
index 645ef40643..4ec1813430 100644
--- a/package/x11vnc/x11vnc.mk
+++ b/package/x11vnc/x11vnc.mk
@@ -10,7 +10,7 @@ X11VNC_DEPENDENCIES = xlib_libXt xlib_libXext xlib_libXtst libvncserver
 X11VNC_LICENSE = GPL-2.0+
 X11VNC_LICENSE_FILES = COPYING
 X11VNC_CPE_ID_VALID = YES
-# 0002-scan-limit-access-to-shared-memory-segments-to-current-user.patch
+# 0002-scan-limit-access-to-shared-memory-segments-to-curre.patch
 X11VNC_IGNORE_CVES += CVE-2020-29074
 
 # Source coming from github, no configure included
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
