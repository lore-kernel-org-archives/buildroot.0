Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F41BC27C55
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 10:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E747A812D8;
	Sat,  8 Jun 2024 10:25:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MIIjKPPNOeYr; Sat,  8 Jun 2024 10:25:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03E388133F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03E388133F;
	Sat,  8 Jun 2024 10:25:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1BFBB1BF41F
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 10:25:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0922B606B1
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 10:25:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GVUj5veKndYX for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 10:25:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.52;
 helo=mail-wm1-f52.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C6885605E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6885605E9
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C6885605E9
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 10:25:35 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-42172ed3487so9946855e9.0
 for <buildroot@buildroot.org>; Sat, 08 Jun 2024 03:25:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717842333; x=1718447133;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q9TN0lHIpRzSSNQV1SMlgyBubtuE3tWbLii7NLJZLXc=;
 b=iKU7BbMQnz3odWkuRqBihw+Kzvue6x1zIXTj1K8LqmReCMtNH1FoFp/DCkLZdGVOt6
 Y1O+KomzeqTqD6H/6tnhBBOGh9GCFcFmUcCRTZjPuc/tNLSOVtNi/DZyvXcg4t9l1AF2
 brM0GYXiCU1oGIi12F1z0XsA7SI12WhHGziCaWugi/Ytl1NEinocU5WkUHaVLKLfgFaJ
 TS87XeKnw52x/1m9sz2bGqdwzdwszYvn6Q35Y7A1q4PwHRFkHGpUlWV7sVu0A6w29X8f
 nYoHnGMXF7C+zKV7rrjNsSBScs/jzBvwC1i8xUFOahizcHUFany93O/WU8bqgoq/7vil
 J7ew==
X-Gm-Message-State: AOJu0Ywbr7yG5DZwOekyPeQYcwY4912o2IqC1x1j7Ju5c0/FrgMNBDYH
 E4ZllcK2nWkxP0POimm/dawoohSaIZP7VRp17k1koasMiwtLz6yvEOb7pQ==
X-Google-Smtp-Source: AGHT+IFGogoZM385FsPNi1d7gcjleUshgp2ayksX+qyZ6vJxDchGeowmoe3V5otij5OTNC5QqYIBwg==
X-Received: by 2002:a05:600c:1f91:b0:421:2985:bf44 with SMTP id
 5b1f17b1804b1-421649fb1d8mr40644005e9.13.1717842333252; 
 Sat, 08 Jun 2024 03:25:33 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:3a9a:8c80:dbb9:3d10])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5d66cf6sm5981739f8f.49.2024.06.08.03.25.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jun 2024 03:25:32 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Sat,  8 Jun 2024 12:25:25 +0200
Message-Id: <20240608102527.2467188-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1 1/3] package/libinput: bump to 1.26.0
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Announce:
  https://lists.freedesktop.org/archives/wayland-devel/2024-June/043657.html

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/libinput/libinput.hash | 2 +-
 package/libinput/libinput.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index 643cb16213..2ab56e4827 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  193bd592298bd9e369c0ef3e5d83a6a9d68ddc4cd3dfc84bbe77920a8d0d57df  libinput-1.25.0.tar.bz2
+sha256  8c582b86c6865aaee2516ee96b299cef60c98e113d1391bbd2683eac08221a07  libinput-1.26.0.tar.bz2
 
 # License files
 sha256  80de50b2022a840db044c56db804ca3565600a692c0714babface587acc6d1b0  COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 499ed5ff4b..3b5070c85e 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.25.0
+LIBINPUT_VERSION = 1.26.0
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.bz2
 LIBINPUT_SITE = https://gitlab.freedesktop.org/libinput/libinput/-/archive/$(LIBINPUT_VERSION)
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
