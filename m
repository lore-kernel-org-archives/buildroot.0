Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D706BC43458
	for <buildroot@archiver.kernel.org>; Sun, 12 Jul 2026 11:31:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A92BA409C5;
	Sun, 12 Jul 2026 11:31:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FPiELowlSgWU; Sun, 12 Jul 2026 11:31:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D59AC409E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783855888;
	bh=xN5rOJFUrVyYlesAMT343TiyC5fsfQAUl+eyqcEOJWQ=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fYNds9wDC57ZmrJ/10C9izD2QOsIf9VlkBKHM5pn4TnyrkykbxrH+PAHCuWe7tG6d
	 d9deNVKFeqi3WqrpJSO6Hag7caAwBCFV91TecGpxqPaLd+b6ViYiYQu+Su6FlG8wEL
	 gnwJ7YKL5J3AEU9KTf1zxEknLAr8ft244j+f+P5ErSnm29bNFhoPFcI1y+94Cylyvj
	 qMIIVI0cbZlPCAoHz7OfczUuKW2GOADc44wxZHmrnUKFTh+lyooXMWVzZTwgXgTOre
	 Y692yXLK+DVGpat0mg8nDgebWpvUH9MvwyyBl3SHMmaPxrE9GVvTNOjzF7f5mWhXCd
	 +uJcT8E5O6Ecw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D59AC409E8;
	Sun, 12 Jul 2026 11:31:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 55207359
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 11:31:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 472D740181
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 11:31:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XYdZA-9Dd7qy for <buildroot@buildroot.org>;
 Sun, 12 Jul 2026 11:31:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 31CCA40108
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31CCA40108
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 31CCA40108
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 11:31:25 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0d51.dip0.t-ipconnect.de [91.58.13.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E94F9A4C3571;
 Sun, 12 Jul 2026 13:30:58 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35390)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wisOg-000000002jy-2VeY;
 Sun, 12 Jul 2026 11:30:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Date: Sun, 12 Jul 2026 13:30:57 +0200
Message-ID: <20260712113058.1579954-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260712113058.1579954-1-bernd@kuhls.net>
References: <20260712113058.1579954-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1783855858;
 bh=NBFi4kPmN2Rdd39QrScW4HajUatOf4FyKwhi1rPwnRI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=PVKeu1AZxXjGiM1xBvZxPUaqD6UOAnW9durUx+hqG1ulytBxho2i0oKKjPRue4I/D
 y4MSMwkwIBT+So0ozWdNPxlfezPBDRARHRkpwNLX9d4lmrHHkTYqT4fw0J+V74cA6t
 JqPGUmvSYhfHOMjU4jamAH7MtvAap3Vi8qbVlrpw3Tnn/WudResah8s/Jm/TOqIRu8
 MvOr+OWfY2gbo6fC6WBeAt2FKjRG1QNRtyvBb7TraW3cZ3niJ8JVIBpamQkwEVE3Ow
 B9KsBac3+reDnUGdJfA/Y9p5fcMW+cioc6ZXXmBgYU+hXTABYno0JaKuI3mteQnhGb
 kelz9ka6UzZAw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=PVKeu1AZ
Subject: [Buildroot] [PATCH 3/4] package/x11r7/xwayland: security bump
 version to 24.1.13
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://lists.x.org/archives/xorg-announce/2026-July/003717.html
https://lists.x.org/archives/xorg-announce/2026-July/003716.html

Fixes
-  CVE-2026-55999: glamor Font Atlas Heap Buffer Overflow
-  CVE-2026-56000: GLX contextTags Use-After-Free in CommonMakeCurrent()

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/ac5c6561894d41b86a43af13c4a5af16612c9195
https://gitlab.com/bkuhls/buildroot/-/commits/9c78a853c88fa85f7a31404b4ab324370cf049f6

 package/x11r7/xwayland/xwayland.hash | 6 +++---
 package/x11r7/xwayland/xwayland.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xwayland/xwayland.hash b/package/x11r7/xwayland/xwayland.hash
index 2bf2d19020..c9b931b6e2 100644
--- a/package/x11r7/xwayland/xwayland.hash
+++ b/package/x11r7/xwayland/xwayland.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2026-June/003704.html
-sha256  6df02c511b92c1b9848734d9d1b03a4c24f8375ba3cada44e9684a21b5f78e21  xwayland-24.1.12.tar.xz
-sha512  b4ee41761c2caa7332573be07d9143b60015bb4a7910c90b6ae079dde0a1bf6b0b4773ff4e6fba48279cdee83b4de5eb4a19b9369b5753e4147b94fa2deece96  xwayland-24.1.12.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2026-July/003717.html
+sha256  173aea3d6f79609164c04528e1c8e4c9b60fcd59391c3c9dad4667297d727fb6  xwayland-24.1.13.tar.xz
+sha512  e06e58025b441892fdd17ac55fd5c7e137bffc941b76ad784dc008047c778c6ee2895fcc47b9e8c74b1d8372491e69c39933c4186aec4df55571614f8ba98e3c  xwayland-24.1.13.tar.xz
 
 # Locally calculated
 sha256  c9f90a6669109aad6c9a7c3b46cc2c574221a73b792afa419336816b49da5c11  COPYING
diff --git a/package/x11r7/xwayland/xwayland.mk b/package/x11r7/xwayland/xwayland.mk
index 2b8513602c..02a21b96c1 100644
--- a/package/x11r7/xwayland/xwayland.mk
+++ b/package/x11r7/xwayland/xwayland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XWAYLAND_VERSION = 24.1.12
+XWAYLAND_VERSION = 24.1.13
 XWAYLAND_SOURCE = xwayland-$(XWAYLAND_VERSION).tar.xz
 XWAYLAND_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XWAYLAND_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
