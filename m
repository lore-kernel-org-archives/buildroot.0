Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F4A7C48260
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 20:43:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEEA1822A3;
	Tue, 13 Feb 2024 20:43:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eBvGA5IcDqO6; Tue, 13 Feb 2024 20:43:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDBFD822A6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDBFD822A6;
	Tue, 13 Feb 2024 20:43:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E6C821BF2AF
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 20:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D42DB409F0
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 20:43:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h_6pbyuZFhxJ for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 20:43:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.51;
 helo=mail-wr1-f51.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C2461409ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2461409ED
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C2461409ED
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 20:43:21 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-33ce2d1ab86so302984f8f.2
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 12:43:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707856999; x=1708461799;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xTArRcD+9rz+6H+xEIwH8BDtCeP8B+zTT6dNwJfr7bg=;
 b=E9I5x63cF6mMwELjXFoK+qu/o0i32PVHHItcPHUc4Wec+50uerJNjKk7hzKZvC6FQB
 lK0nms2BJgASJVubhja2yW/fPb7gai1BXJuSAi3Out9zp6JH1Mjp1C3AhmlZxoglhT0P
 L9OmIadDHHz2W0c6FXfjak6OOOQqMqVVzvYDkSpELRjkdrerBvYnZTj5wVC5bK33Izh2
 TCoymsWUVNP9vRsvtxy7Rlo0AxCqwUMGCJLyps/LPmtRX62Z+4ta56FIEaBlJ5ldBr0Q
 AXq+Rodz5ZReXHo9ZWD9ERZRdfhdTXzVOy+kBwt1fARGEGDU9OpKYJC971gDHqXrTxwh
 DMgw==
X-Gm-Message-State: AOJu0YxQC5g2QcsTO7n0ggy7XzImn60SZD+Zh0AfANr5TmGCQuRpB4Yc
 K9maEcJ9ux8jfKAFo6UfQuNgLYDntwmP51NxRiMlhSnpY4Dzf+ZjNzPZMwHo
X-Google-Smtp-Source: AGHT+IEW/vLxdL4KWQKa0E28X+Xge88sHSfJI3mgcxdhUjqlQ54Q2NbM5LD1+5ITO/NHfxhlWZmQGQ==
X-Received: by 2002:a5d:458d:0:b0:33a:e7de:aa8b with SMTP id
 p13-20020a5d458d000000b0033ae7deaa8bmr257843wrq.26.1707856998514; 
 Tue, 13 Feb 2024 12:43:18 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:eb68:2f00:4e64:96a7:94:e878])
 by smtp.gmail.com with ESMTPSA id
 a8-20020adffb88000000b0033cdcd309bdsm2257517wrr.81.2024.02.13.12.43.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 12:43:18 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 21:42:40 +0100
Message-Id: <20240213204240.105047-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v2] package/wayland-protocols: bump to 1.33
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Announce:
  https://lists.freedesktop.org/archives/wayland-devel/2024-January/043400.html

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
v2: fix wrong announce version in git message
---
 package/wayland-protocols/wayland-protocols.hash | 6 +++---
 package/wayland-protocols/wayland-protocols.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wayland-protocols/wayland-protocols.hash b/package/wayland-protocols/wayland-protocols.hash
index d039cd6fba..58c432e365 100644
--- a/package/wayland-protocols/wayland-protocols.hash
+++ b/package/wayland-protocols/wayland-protocols.hash
@@ -1,4 +1,4 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2023-July/042836.html
-sha256  7459799d340c8296b695ef857c07ddef24c5a09b09ab6a74f7b92640d2b1ba11  wayland-protocols-1.32.tar.xz
-sha512  90bbd52daf342b98823ddeed04e349ae242d2eaf925ab8d603cceb36c980c83b5681bb890961e0d49584cb5c2e60a33abf8821770c6ab87956383630bd5b7966  wayland-protocols-1.32.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2024-January/043400.html
+sha256  94f0c50b090d6e61a03f62048467b19abbe851be4e11ae7b36f65f8b98c3963a  wayland-protocols-1.33.tar.xz
+sha512  4584f6ac86367655f9db5d0c0ed0681efa31e73f984e4b620fbe5317df21790927f4f5317ecbbc194ac31eaf88caebc431bcc52c23d9dc0098c71de3cb4a9fef  wayland-protocols-1.33.tar.xz
 sha256  f1a2b233e8a9a71c40f4aa885be08a0842ac85bb8588703c1dd7e6e6502e3124  COPYING
diff --git a/package/wayland-protocols/wayland-protocols.mk b/package/wayland-protocols/wayland-protocols.mk
index 2cfaa830e5..50a08d1988 100644
--- a/package/wayland-protocols/wayland-protocols.mk
+++ b/package/wayland-protocols/wayland-protocols.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_PROTOCOLS_VERSION = 1.32
+WAYLAND_PROTOCOLS_VERSION = 1.33
 WAYLAND_PROTOCOLS_SITE = https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/$(WAYLAND_PROTOCOLS_VERSION)/downloads
 WAYLAND_PROTOCOLS_SOURCE = wayland-protocols-$(WAYLAND_PROTOCOLS_VERSION).tar.xz
 WAYLAND_PROTOCOLS_LICENSE = MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
