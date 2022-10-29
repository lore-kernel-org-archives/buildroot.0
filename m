Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB03C38A02
	for <buildroot@archiver.kernel.org>; Sat, 29 Oct 2022 19:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B561660B3D;
	Sat, 29 Oct 2022 19:51:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B561660B3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q5hh00z63q-j; Sat, 29 Oct 2022 19:51:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C64F7605DB;
	Sat, 29 Oct 2022 19:51:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C64F7605DB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3046A1BF421
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 19:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0780140323
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 19:51:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0780140323
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2ugafFdMafXw for <buildroot@lists.busybox.net>;
 Sat, 29 Oct 2022 19:51:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAE044008B
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EAE044008B
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 19:51:14 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id j15so10739778wrq.3
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 12:51:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OFJKivTrkPPd7GXa8LZRXZbRJGv1TIadrSpjFEyEaBw=;
 b=r/LBuinYiyxlDDvJfpU7hMqudp8XnnWdrYFWuP2KLCJTPbMmThqu0beMHPBX6OJBT9
 Xntb7uPfGuJbhmGewD/klqTgc+d5vPsHgswVzTRQ5K0WxWwbOjNoRtJPZWdoDKNwvNxf
 ogrtjvwNBE/aMbv2+Bcj8PKscUqWl6rfTG5LHU8YRaCxBzArdsp5ZONiMjNGjWtbcgeg
 79i9A0bmwzsg1pBunRt6Hp0H8jLZvP+3dPfZh32PhlU/01eBd5d0ODyZPwQRohpUs+M3
 1sgtnRCseLXBcSf7WEKfdRYEBNp91AwlV9nvHsmdGAvtB9DGBlwI4BFjroEpx/2Bh3xD
 D0Jg==
X-Gm-Message-State: ACrzQf3eMgJMpxqUaASSbG3DD/ityMRUhn2Bu1QLR6HB7rlfAuNKbzLi
 2yBWraZpVJztedL0CenZsfloDdvHcdo=
X-Google-Smtp-Source: AMsMyM7+S88MNBsHzCxGpX/GxcFyA6waPC/UuKzT9F0/2AzztR4CCf2b245NuD8ZZHP3DTTJwcC0Yg==
X-Received: by 2002:a5d:4c8c:0:b0:236:a834:8e8e with SMTP id
 z12-20020a5d4c8c000000b00236a8348e8emr3065777wrs.644.1667073072655; 
 Sat, 29 Oct 2022 12:51:12 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 bq13-20020a5d5a0d000000b002365921c9aesm2297067wrb.77.2022.10.29.12.51.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Oct 2022 12:51:12 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Oct 2022 21:51:08 +0200
Message-Id: <20221029195108.35473-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OFJKivTrkPPd7GXa8LZRXZbRJGv1TIadrSpjFEyEaBw=;
 b=I2p8BSknWj27rgboX2exMZM6GGhZt1Si4/tNT2dXJFmwlETpI0MFN4CG75VK4B/pGd
 goRbdxG7efztjv4Oo2iSBxLobdTx+2bogAHslGvzA2hnhLPaAV8xgxLhHeXbiwkqOIlt
 FEyntWTh9wOqQVYhPMIaVGKGEAdiAWSwSiaiHEvn98eTwgpuPJHPn2dtmtS4GARqhb8x
 qL1i71kttTfYzJ7BL1SFI9hgKltJsDLKcGdxCLovCEBd4g+W4kspTgX7nlAFh2++qEbZ
 VT16T+VSCwMljZ5fGC9thFViAE7FxqRclbLwT1KIcvFXYlBeyR1kMuI+U4l2WCb67Ckz
 sw/g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=I2p8BSkn
Subject: [Buildroot] [PATCH 1/1] package/minissdpd: bump to version 1.6.0
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

Update hash of LICENSE file (license refined for github:
https://github.com/miniupnp/miniupnp/commit/af812c877532f2432b0566633e1e539797ef9c13)

http://miniupnp.free.fr/files/changelog.php?file=minissdpd-1.6.0.tar.gz

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/minissdpd/minissdpd.hash | 4 ++--
 package/minissdpd/minissdpd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/minissdpd/minissdpd.hash b/package/minissdpd/minissdpd.hash
index e14fe7ab2c..bc1db5f283 100644
--- a/package/minissdpd/minissdpd.hash
+++ b/package/minissdpd/minissdpd.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  a073be9c6d9194feaeccf31cd986c48afd2212426b6594e75166cedff1c461aa  minissdpd-1.5.20211105.tar.gz
-sha256  45950e1d443106906f83a4ec7b9c2e1a9d6457130737a493cff0e5b7a39da570  LICENSE
+sha256  f4c2dea6a472e0a5cc9dca2dc4c1fc36ba5538eacf8d793825293251725546bd  minissdpd-1.6.0.tar.gz
+sha256  a0f853256954f388ce4fab5faaef6a1f5bcd5e682c3c7c70b07b7130e932a021  LICENSE
diff --git a/package/minissdpd/minissdpd.mk b/package/minissdpd/minissdpd.mk
index 2b9fac4df1..4f594cb5a0 100644
--- a/package/minissdpd/minissdpd.mk
+++ b/package/minissdpd/minissdpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINISSDPD_VERSION = 1.5.20211105
+MINISSDPD_VERSION = 1.6.0
 MINISSDPD_SITE = http://miniupnp.free.fr/files
 MINISSDPD_LICENSE = BSD-3-Clause
 MINISSDPD_LICENSE_FILES = LICENSE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
