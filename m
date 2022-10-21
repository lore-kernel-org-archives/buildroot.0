Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5582C433FE
	for <buildroot@archiver.kernel.org>; Fri, 21 Oct 2022 22:32:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 60B32409D9;
	Fri, 21 Oct 2022 22:32:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60B32409D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TaMgLjeaaK3K; Fri, 21 Oct 2022 22:31:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 996DA409C1;
	Fri, 21 Oct 2022 22:31:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 996DA409C1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CBE3F1BF94D
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 22:31:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1EBB4184B
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 22:31:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1EBB4184B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hxGEs3QnX_L2 for <buildroot@lists.busybox.net>;
 Fri, 21 Oct 2022 22:31:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C16B41835
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2C16B41835
 for <buildroot@buildroot.org>; Fri, 21 Oct 2022 22:31:51 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 bg9-20020a05600c3c8900b003bf249616b0so2986473wmb.3
 for <buildroot@buildroot.org>; Fri, 21 Oct 2022 15:31:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AQiFrUge0eBsnR75nZuRaWcltU7OxBjlWFtpqc+m2cM=;
 b=WdaBrXBaELc7qxBXL+d0aqHWP0A9DC7Lsm36iD6K87pQDElh0Su5LK2dVg8I2F0cd6
 ciYFFgursjt2VSoFzhdjpqLuBm63IHwj5t0C1FR4k+3pI4oCtve6Z1Vspf3+0YBr+oPa
 RV2KHMTUpZG0Uat4fWKagGikNkYTnaH0thUF6E3N07JxhWso0bB+LPOZVoKs24JG3C1a
 M4l12jDj37askeogQlju63wF3jjGbmC2b931dfDJGabppGH8JW63LoWNc+EgnoW0Wypu
 Cylh9fogrPNLewpmwssSeKnTb+R5rd5MTkAElMxCACEj4kfRi4Xck0SCMBzY73N5ofIf
 /oMQ==
X-Gm-Message-State: ACrzQf10kO+gmDuus7Ur92P6X/LMQST9nxCaRQ3Wjl5lMZoMMxszDjHQ
 O7Ar3uUfiqZTIavcUz7OYN4LUX3SuVw=
X-Google-Smtp-Source: AMsMyM5L5rh2qvUOD0ByihOFqcTDNM4QoF4NEDiATonToXZNI1ODallsQFYsLtp5mLXy+wj2bmswxA==
X-Received: by 2002:a05:600c:4f44:b0:3b4:c554:a5f4 with SMTP id
 m4-20020a05600c4f4400b003b4c554a5f4mr34350622wmq.107.1666391508917; 
 Fri, 21 Oct 2022 15:31:48 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 q63-20020a1c4342000000b003c43dc42b4dsm783024wma.16.2022.10.21.15.31.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 15:31:48 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 22 Oct 2022 00:31:44 +0200
Message-Id: <20221021223144.116049-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AQiFrUge0eBsnR75nZuRaWcltU7OxBjlWFtpqc+m2cM=;
 b=aR7a6oQhlNCYL5dg1HbtCNy5FkfPhJTl/ll0jarYBbuzdp4ZhTI8WLSdikEKSMWg7h
 gaBP5lMh4X3ovIh9W9NFdXI8l0Eaxp8E3C3dtOnJ4JMWJnBXOtcQhPA15UgxE5/DV3Tq
 Kxy2NUMCyeOYVax1tHrwR9vBzU00lF/XPlVzuJYUGkFKloTuT3yhiAP6QV1+8pwdQ0hD
 HeFjazfYgiCRoUfp8KbXqjpqneWiDD7GCAa3af8E16NJ56hjAt5t0xGFl+NoLViXGM6A
 npupMJUa9pGbrrKx61idyLS0sMtJ7rvg3cG7Yh+RKI+Gn3KEaeHUc5igODC1/3DkDL/6
 XEhg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=aR7a6oQh
Subject: [Buildroot] [PATCH 1/1] package/libcodec2: bump to version 1.0.5
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/drowe67/codec2/releases/tag/v1.0.3
https://github.com/drowe67/codec2/releases/tag/v1.0.4
https://github.com/drowe67/codec2/releases/tag/v1.0.5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libcodec2/libcodec2.hash | 2 +-
 package/libcodec2/libcodec2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcodec2/libcodec2.hash b/package/libcodec2/libcodec2.hash
index 795ca37006..ba44aa015c 100644
--- a/package/libcodec2/libcodec2.hash
+++ b/package/libcodec2/libcodec2.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  14227963940d79e0ec5af810f37101b30e1c7e8555abd96c56b3c0473abac8ef  libcodec2-1.0.1.tar.gz
+sha256  cd9a065dd1c3477f6172a0156294f767688847e4d170103d1f08b3a075f82826  libcodec2-1.0.5.tar.gz
 sha256  9ebb6f82b7380a62ac74c5f0322c88e6744dedf2ebe1f54d6f088282b39844bf  COPYING
diff --git a/package/libcodec2/libcodec2.mk b/package/libcodec2/libcodec2.mk
index b4f08a496e..b97db8ff59 100644
--- a/package/libcodec2/libcodec2.mk
+++ b/package/libcodec2/libcodec2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCODEC2_VERSION = 1.0.1
+LIBCODEC2_VERSION = 1.0.5
 LIBCODEC2_SITE = $(call github,drowe67,codec2,v$(LIBCODEC2_VERSION))
 LIBCODEC2_LICENSE = LGPL-2.1
 LIBCODEC2_LICENSE_FILES = COPYING
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
