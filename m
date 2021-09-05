Return-Path: <SRS0=j1wI=N3=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4248C433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 06:58:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7235960F9F
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 06:58:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7235960F9F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F9B1401D5;
	Sun,  5 Sep 2021 06:58:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id et6tGQl3FtUr; Sun,  5 Sep 2021 06:58:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64518401C8;
	Sun,  5 Sep 2021 06:58:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 393C91BF5D7
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 06:58:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 29BAC81985
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 06:58:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mjsfT1FVL1XK for <buildroot@lists.busybox.net>;
 Sun,  5 Sep 2021 06:58:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4CDD68196A
 for <buildroot@busybox.net>; Sun,  5 Sep 2021 06:58:16 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id q14so4807016wrp.3
 for <buildroot@busybox.net>; Sat, 04 Sep 2021 23:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KEnYOrv0lhw5o7sDBbgngH2kPxMzUfPT+us0nqUFCHg=;
 b=bLUOXU/11Km6ThryXJA9U6XXLKc+mukW+mDPokiw9ppM3wsqQJ/VdhxVBlXil7iyHf
 I8hDB72A0/3gnLo9Ro76Cv34OaMKYMBuNR1bfCA/RIJSLwFKH3W5al6h3QFUNwr9LShB
 yVBmNcmnP4kgY+0hypBYR31REE5ck067+pBENgSVjQGB9fOK63bqOtBFatG89HQmK8eu
 VtAkoJ708TyzE+Aue3+vTFO2emmMqdchoxvzVttHW3I9ox/ifKCN49opXicE8x8JSlfi
 Nx4o4+FNIwQ35IlhjV77Ze41VDtcqWjQ6aDKSjdvQwP2pBdvv9mUo6PWVeiBw4q6G/Df
 3IVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KEnYOrv0lhw5o7sDBbgngH2kPxMzUfPT+us0nqUFCHg=;
 b=JODbKn3doGW/Thb/s56O5AGxoA/03J1KcBALzinXmlVU6PC0K14D5JFGVIzEI3vhz4
 psG5U8GnvO/fX8knjrRd7E4c6ciaOODKyCtPZFoKKS0mPeUd7FBBthME5ch7xbRugGAP
 pdxZcnTwaJbalc3pHDrpSKeLOjEHr9WDGlnjvFw4S4dHo2H1pNk3wkMQr/01idZFe0hZ
 0IAV8TAIdytvMUsiNz8IdkbuO1vK7rEfPVd73Pef876eCi+6i7yoT8YAVJVq+ZHWKo9j
 mfKzUyN3pyJ5j0VCWgyrep5tHDQ36UxkNoIAbXcx0a8JtPxlpXMNbJztF1NfBSNiJxdR
 zt6g==
X-Gm-Message-State: AOAM533s9D/qrdLFgQuAe4r14xXnQpxvXmC2bo7ERdpPlRGXFm6RR9na
 G0lahBUqhD3rnII2AQn1NcTghRFSCSk=
X-Google-Smtp-Source: ABdhPJyiYz37F73dGiexTkQJ6Kf5IsOLSo1MlN2vCB3y3enLJa2nDIhiO6IwyhZrFxbyCwLkPNgVqQ==
X-Received: by 2002:adf:c449:: with SMTP id a9mr7139566wrg.256.1630825094723; 
 Sat, 04 Sep 2021 23:58:14 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id k4sm4186357wrm.74.2021.09.04.23.58.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 23:58:14 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun,  5 Sep 2021 08:58:08 +0200
Message-Id: <20210905065808.1828855-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/librsvg: bump to version 2.50.7
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/librsvg/librsvg.hash | 4 ++--
 package/librsvg/librsvg.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/librsvg/librsvg.hash b/package/librsvg/librsvg.hash
index cb558f147..8b32c6581 100644
--- a/package/librsvg/librsvg.hash
+++ b/package/librsvg/librsvg.hash
@@ -1,5 +1,5 @@
-# From https://ftp.gnome.org/pub/gnome/sources/librsvg/2.50/librsvg-2.50.5.sha256sum
-sha256  32701574c234fed352520c6d0bd5081f728184bc1a9b9c87d423dd27c32b9272  librsvg-2.50.5.tar.xz
+# From https://ftp.gnome.org/pub/gnome/sources/librsvg/2.50/librsvg-2.50.7.sha256sum
+sha256  fffb61b08cd5282aaae147a02b305166a7426fad22a8b9427708f0f2fc426ebc  librsvg-2.50.7.tar.xz
 
 # Locally computed
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
index 5f3d68839..e4b1942b7 100644
--- a/package/librsvg/librsvg.mk
+++ b/package/librsvg/librsvg.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBRSVG_VERSION_MAJOR = 2.50
-LIBRSVG_VERSION = $(LIBRSVG_VERSION_MAJOR).5
+LIBRSVG_VERSION = $(LIBRSVG_VERSION_MAJOR).7
 LIBRSVG_SITE = http://ftp.gnome.org/pub/gnome/sources/librsvg/$(LIBRSVG_VERSION_MAJOR)
 LIBRSVG_SOURCE = librsvg-$(LIBRSVG_VERSION).tar.xz
 LIBRSVG_INSTALL_STAGING = YES
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
