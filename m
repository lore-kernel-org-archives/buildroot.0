Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54288C25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 10:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B83C681DFF;
	Sat,  8 Jun 2024 10:25:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VGUlKiz_Xnx0; Sat,  8 Jun 2024 10:25:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27CAA846D3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27CAA846D3;
	Sat,  8 Jun 2024 10:25:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 168CB1BF41F
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 10:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0314D4272F
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 10:25:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GVrgc7a-5lu4 for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 10:25:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.50;
 helo=mail-wm1-f50.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9AF93405ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9AF93405ED
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9AF93405ED
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 10:25:38 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-42160f2dc32so18741585e9.3
 for <buildroot@buildroot.org>; Sat, 08 Jun 2024 03:25:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717842337; x=1718447137;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mmm81ZQokELfVtCOusDGIXXJ6H0JHf64QdBmoDeCbOo=;
 b=JFKF5QBG8Rux2/zOHypJ7wbbht3AtoIjFzMZDz+FHZ+lXsQ+EWdpaR20lXKC/xp4QQ
 4Zmrjkl7HgC0NyGGp33LXj/yKOm+fDppnjVxOQ7DxsQV/ruvKAAcAw7VMVJYbz5kh2vd
 QlHlNaHOcHxd3MtG6EgO/22J8zF8kg/B1ZmM/yOdttYhkDpvdmgQRDYo/D8aOf3aeaeT
 +RGzdlKEZm0PjwF9wzSUVBHSllc3Yar5usWJ6uEV+LIX0KZfcYfsR3JEY0uj8RJrQmsM
 dhmBdX0DjnWdRiKOSCsusLCHJVCLLZQdRE1VYImTGH/f/TK6mw5usTsUUMRaAJRQZHcA
 S1TA==
X-Gm-Message-State: AOJu0Yz98D+BCtFQGrQutU9IlLukbLCtd2tbMPt8Mo0jL3Myf/+YUUem
 9yO12SNnFnj9PoWW2aqY6z7iVP7AAnb/n0yqG+zrP5LAqi9JmJkBW+rSIQ==
X-Google-Smtp-Source: AGHT+IFzYYrG4W/UDzdvT+HM9LefxoctX8quoPD89SuzT98s5/Ba54bzHuUx2+O91MLOSAO+Jc/XLA==
X-Received: by 2002:a05:600c:4f07:b0:421:661d:89cd with SMTP id
 5b1f17b1804b1-421661d8d81mr39278135e9.25.1717842336577; 
 Sat, 08 Jun 2024 03:25:36 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:3a9a:8c80:dbb9:3d10])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5d66cf6sm5981739f8f.49.2024.06.08.03.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jun 2024 03:25:36 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Sat,  8 Jun 2024 12:25:27 +0200
Message-Id: <20240608102527.2467188-3-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240608102527.2467188-1-thomas@devoogdt.com>
References: <20240608102527.2467188-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1 3/3] package/wayland: bump to 1.23.0
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
  https://lists.freedesktop.org/archives/wayland-devel/2024-May/043636.html
  https://lists.freedesktop.org/archives/wayland-devel/2024-May/043625.html
  https://lists.freedesktop.org/archives/wayland-devel/2024-May/043614.html
  https://lists.freedesktop.org/archives/wayland-devel/2024-April/043580.html

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/wayland/wayland.hash | 6 +++---
 package/wayland/wayland.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wayland/wayland.hash b/package/wayland/wayland.hash
index 5da527e318..627cb5a1b0 100644
--- a/package/wayland/wayland.hash
+++ b/package/wayland/wayland.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2023-April/042647.html
-sha256  1540af1ea698a471c2d8e9d288332c7e0fd360c8f1d12936ebb7e7cbc2425842  wayland-1.22.0.tar.xz
-sha512  fb1974efc8433e97254eb83fe28974198f2b4d8246418eb3d34ce657055461e0c97bc06dd52e5066ae91bbe05bac611dc49a0937ba226ac6388d5a47241efb12  wayland-1.22.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2024-May/043636.html
+sha256  05b3e1574d3e67626b5974f862f36b5b427c7ceeb965cb36a4e6c2d342e45ab2  wayland-1.23.0.tar.xz
+sha512  9c525231a7ea3e68d3178230d476285a960d23e38571ac96d885f86c0588c52ef01460bff6833db5adb9456ce8db7b996613611187aac972736748ba91b8fd81  wayland-1.23.0.tar.xz
 
 # Locally calculated
 sha256  6eefcb023622a463168a5c20add95fd24a38c7482622a9254a23b99b7c153061  COPYING
diff --git a/package/wayland/wayland.mk b/package/wayland/wayland.mk
index 1a764d5580..06adafc3e1 100644
--- a/package/wayland/wayland.mk
+++ b/package/wayland/wayland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_VERSION = 1.22.0
+WAYLAND_VERSION = 1.23.0
 WAYLAND_SITE = https://gitlab.freedesktop.org/wayland/wayland/-/releases/$(WAYLAND_VERSION)/downloads
 WAYLAND_SOURCE = wayland-$(WAYLAND_VERSION).tar.xz
 WAYLAND_LICENSE = MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
