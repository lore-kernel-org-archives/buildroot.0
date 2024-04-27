Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DDB3C4345F
	for <buildroot@archiver.kernel.org>; Sat, 27 Apr 2024 13:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 886F3405B0;
	Sat, 27 Apr 2024 13:48:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tiHVYo7PC0A5; Sat, 27 Apr 2024 13:47:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 571C2403B9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 571C2403B9;
	Sat, 27 Apr 2024 13:47:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 46A701BF25B
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 13:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FB9382F76
 for <buildroot@lists.busybox.net>; Sat, 27 Apr 2024 13:47:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i1_mXbGmCJ0W for <buildroot@lists.busybox.net>;
 Sat, 27 Apr 2024 13:47:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.218.51;
 helo=mail-ej1-f51.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E3A1281499
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3A1281499
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E3A1281499
 for <buildroot@buildroot.org>; Sat, 27 Apr 2024 13:47:55 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-a58a36008ceso382027666b.0
 for <buildroot@buildroot.org>; Sat, 27 Apr 2024 06:47:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714225673; x=1714830473;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DH3hIXdC1ts1G55nYmJRmSrIDyyOCQnsr5jdUCz/HVA=;
 b=En2HXH1NyYE3R4VZZnkR/Pj5qkNa8N18EfLvEJ53sbD6d3/q+fDZ/dHNrGbeO4+Rum
 6cEctQX1pgPiiTkdEdW69v/5zAuj2xCNQ76b4dRpga8rd6rOKRHA8DM5mLfuZ0BfkNbN
 Xsdn/QHbx39gE+N/EJB1jRqti7Bgb91hAuBMGCIRc6kDJv5kNcA9QWydWGMKgoExltjo
 8IG9ed5ojMm5eBY731Ti7dr/MtD454Wk3MtCTCGWJhQliP9TERiENhQcK0io8EEyVRc4
 TWgCO3C7CB1qw5qgAWRwUd7/lWoV9mtmy+HJjN3lr+OB71G6XNErXbmJAsP9lhYp7lu/
 GDNQ==
X-Gm-Message-State: AOJu0YwRM2uPm+5crhaYUaVbyytnJ6Mb78HwYjD8/rt33X0GcOiTdLs/
 gY8+1jTxNqWjXad/mr54Ikm5OFO/OCvF7juoPRT36hkdhwQHfW4jT4nn/Q==
X-Google-Smtp-Source: AGHT+IHmO8xhCD9drueW8if9tdsskyLhkfr0ECQseZdWADW5jJEv31wZ0Y4R/9naPeSCTUi6UyOzFQ==
X-Received: by 2002:a17:906:3d9:b0:a52:6636:a29 with SMTP id
 c25-20020a17090603d900b00a5266360a29mr4105021eja.28.1714225672745; 
 Sat, 27 Apr 2024 06:47:52 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:eb68:2f00:d5bf:f5:506b:c838])
 by smtp.gmail.com with ESMTPSA id
 bt15-20020a170906b14f00b00a51eed4f0d7sm11688919ejb.130.2024.04.27.06.47.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Apr 2024 06:47:52 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Sat, 27 Apr 2024 15:47:47 +0200
Message-Id: <20240427134748.700804-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1 1/2] package/weston: bump to 13.0.1
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
  https://lists.freedesktop.org/archives/wayland-devel/2024-April/043575.html

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/weston/weston.hash | 6 +++---
 package/weston/weston.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/weston/weston.hash b/package/weston/weston.hash
index ded5d35275..5fa0c9d2be 100644
--- a/package/weston/weston.hash
+++ b/package/weston/weston.hash
@@ -1,4 +1,4 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2023-November/043326.html
-sha256  52ff1d4aa2394a2e416c85a338b627ce97fa71d43eb762fd4aaf145d36fc795a  weston-13.0.0.tar.xz
-sha512  8c656cdf24ec9429c76c64ebd2d58351991f5990a6d4b5900ac913243ad8e2c9c0fb1a748f018d177fbfd7e0a8836d0434d97acec287a8f977d47335ae30eacc  weston-13.0.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2024-April/043575.html
+sha256  ea1566ab4f5ffce7e9fd4f7a1fca5b30caae4d50023bf459213994094e02b29a  weston-13.0.1.tar.xz
+sha512  4a0fd0b1aec823219421d701030bc534576be64b71ede70c7d33f131e9e64c0e0dc209e62f75cecb9368df7604c1d5b2321932eccc818b529d246ec2e3114122  weston-13.0.1.tar.xz
 sha256  fdb65868f65d0fbdb05c2d3b779e10ce9969fa0c4b9262ba4f260e87086ab860  COPYING
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 5ae9c22973..499cf45fab 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WESTON_VERSION = 13.0.0
+WESTON_VERSION = 13.0.1
 WESTON_SITE = https://gitlab.freedesktop.org/wayland/weston/-/releases/$(WESTON_VERSION)/downloads
 WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 WESTON_LICENSE = MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
