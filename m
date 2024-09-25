Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386A9CF58ED
	for <buildroot@archiver.kernel.org>; Wed, 25 Sep 2024 13:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3D2F42663;
	Wed, 25 Sep 2024 13:38:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hiYRRdS1FYlz; Wed, 25 Sep 2024 13:38:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C11AF42665
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C11AF42665;
	Wed, 25 Sep 2024 13:38:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8CBA41BF97D
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 13:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65B4B8480E
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 13:38:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0HIH7cKSH0Sj for <buildroot@lists.busybox.net>;
 Wed, 25 Sep 2024 13:38:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 29398847AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29398847AA
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 29398847AA
 for <buildroot@busybox.net>; Wed, 25 Sep 2024 13:38:06 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-375e5c12042so3565241f8f.3
 for <buildroot@busybox.net>; Wed, 25 Sep 2024 06:38:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727271484; x=1727876284;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OFybQqkDBV80fTT96Ct6zs0zG/IRuUH+PuQa0rteKBg=;
 b=OV4kFdSp57dDa2RAnyjct/CsAay8HTLz3HHAFIDFcO5GyeediJfPjUY73UVtR2r0dg
 4Oy+3RfrHnfVZ67pabXb3PQFMLY8opOotARMW9T/6WVU9ha3PMvOAqFLZ1NHudSg1HKR
 cvuKME0RmF3ML6m61rtLnmYOp2pQUcinAAA2Il9nQLxL7QS09GWWbef2DihYVjRNPr7f
 cIm8K4lbqkJwPHfkwmT8+YzDYH1OkwrwCRmFQKg9k0EueaRP3lbfa3Vl7qf0aMcxBp7Z
 5SF0BwdrvZltemt9eE/Ncgx/RruNxJGfTswcd0REs04qj4DrOipJwHFax0E1lTPJhsUo
 IooQ==
X-Gm-Message-State: AOJu0Yzj3v/qQKPZNIpe3Qlznipc4ZE6Lg2/eF938frW1DRrrhcrS8hk
 tHxZx0jVd40xj4svZwtl9xHiLPhRV+eDMuii0KENgu1jwASAW3Za1vS25xvST3yXNb/0gFVcyGr
 3Vw==
X-Google-Smtp-Source: AGHT+IH0Lc5E0FtHrX8NE9OBdVrDBdjc+HdizAGh6Fmnm5WG/aOLXGDducXupC8qmcvhrG3rX9gQcQ==
X-Received: by 2002:a5d:47cb:0:b0:374:ce15:998c with SMTP id
 ffacd0b85a97d-37cc248357fmr2408109f8f.30.1727271483996; 
 Wed, 25 Sep 2024 06:38:03 -0700 (PDT)
Received: from vm-2404.. (55.6.65.37.rev.sfr.net. [37.65.6.55])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37cbc2f989dsm4053559f8f.84.2024.09.25.06.38.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 06:38:03 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 25 Sep 2024 15:38:00 +0200
Message-ID: <20240925133800.3899888-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1727271484; x=1727876284; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OFybQqkDBV80fTT96Ct6zs0zG/IRuUH+PuQa0rteKBg=;
 b=g1rIWrJlha0yJVEHd2MrRdp3AvBPIrKPkuvEO9kXm+p+SOupBdwWtb/T1LyxtSFF+p
 kYxVB1/RH6B6IaBFeYvVn3NiK20/DMAPqm9vF7Zq6rEnMTi2TcC+Y//L2KRuUuEFsDHB
 Do/YaNXC7z3UWxohvxPPEXXo2W2aw5PJ7fvwiYyuDA0N3oDvvP4OcAxahZHljLgTmKN+
 X01TVa8+7A2BXuh8l51eqztZ3NHhp0+D/LPeBCdF/gT341DFEn9qXqHcG8gTBptd+0rw
 rbJxgRdpwORAWV8JcigPX5nbbelawtG5PLVMtfg+mAc5cnW5MB9kkIKTk3L/uvhafTqE
 yAFA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=g1rIWrJl
Subject: [Buildroot] [PATCH] package/mc: bump to version 4.8.32
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/mc/mc.hash | 4 ++--
 package/mc/mc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mc/mc.hash b/package/mc/mc.hash
index 84ea4b2ac..01c0f61b4 100644
--- a/package/mc/mc.hash
+++ b/package/mc/mc.hash
@@ -1,4 +1,4 @@
-# Hash from http://ftp.midnight-commander.org/mc-4.8.31.sha256
-sha256  24191cf8667675b8e31fc4a9d18a0a65bdc0598c2c5c4ea092494cd13ab4ab1a  mc-4.8.31.tar.xz
+# Hash from http://ftp.midnight-commander.org/mc-4.8.32.sha256
+sha256  4ddc83d1ede9af2363b3eab987f54b87cf6619324110ce2d3a0e70944d1359fe  mc-4.8.32.tar.xz
 # sha256 locally computed:
 sha256  5576bbec76296e1c8e081f7037ebd01bdada388635f58d844a2f20d37bbe4284  COPYING
diff --git a/package/mc/mc.mk b/package/mc/mc.mk
index a6c3e0bc8..b7e7e107c 100644
--- a/package/mc/mc.mk
+++ b/package/mc/mc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MC_VERSION = 4.8.31
+MC_VERSION = 4.8.32
 MC_SOURCE = mc-$(MC_VERSION).tar.xz
 MC_SITE = http://ftp.midnight-commander.org
 MC_LICENSE = GPL-3.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
