Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE983D25051
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:37:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A761761575;
	Mon, 12 Jan 2026 08:37:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RbawMnl_KcWY; Mon, 12 Jan 2026 08:37:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C21E96152A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768207052;
	bh=ikllmme8xSY0Pdix2K+vzGryqzJUAT7awJQPZ9SG+IY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cxrInV+HgOWoUT1YgUgExiHk1Ci1CO+UgTL5Tvyh5V0uLIwwO4jUVUri/iQ1B2juk
	 zQpnSz/cU8sAdo/dmATd3a372TgutvPWFHMMlqmwHzVp01OLjddMDsI2tzEQDDlGr9
	 KbCCk+DoaF1zYWvU4W3hUPvwCSaIkJx9g0YoR1YaevWVO75SZtMdi+Sj8XDRqe/VLl
	 MmCnV9MEGxKHc1Bt4ZYQF1/yIZWEao+b37T9Td4b+pZ3duzzqXd0pNk+y+Wey9nJaw
	 BhRHWkAzjMO8Zxi2BhAg7OWfL0ZZATXZ/JvqAkDFt50TgzXrYWo60wl1onAx/O2aqa
	 /0UpaTU9i9yqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C21E96152A;
	Mon, 12 Jan 2026 08:37:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 561141CC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C777412BE
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:37:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pyF_TmRLp6lY for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:37:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 30186412BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30186412BB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 30186412BB
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:37:30 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6486DA4C3C93
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:30:33 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJG-000000007z0-3Dqn
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:29:37 +0100
Message-ID: <20260112082950.2528445-89-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206633;
 bh=SHKLgIPdbJb67ZOsm3sU+yUCb1Bswj10R59+aAnr/aQ=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=aL0VnL8vKSmjwFLlQreDLYGiNwuSanSptJ3lCoT6bvRski+tW2UfrI+8lOqNYjlGy
 7d9m8XsYUudHYlzrMeXrlbUFigdW3W3U746QjcJqXQkw5Xwcz7koLZSVe5Ic8NiBbd
 8hGh5gpdEEyIm77J9sbMBB6q3rw9r98KU0mVnCFs7Wy+qYdryRXiLnBaLtrEmGIMWT
 6yOkAXyoSFW4ZwQZEfpzsRF46ri1XaXmXXxjBW2meKdnUJD+x8fVxQgA2uzBbztmbK
 v8eB9MPye+iEN5NBfauBX0noUxfspGyq0Pi9kmthAsgG9rPaBSlAtT0fm6EgnUFns8
 Osyopnbzoeliw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=aL0VnL8v
Subject: [Buildroot] [PATCH 089/102] package/x11r7/xlib_libXext: bump
 version to 1.3.6
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

https://lists.x.org/archives/xorg-announce/2024-February/003454.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xlib_libXext/xlib_libXext.hash | 6 +++---
 package/x11r7/xlib_libXext/xlib_libXext.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libXext/xlib_libXext.hash b/package/x11r7/xlib_libXext/xlib_libXext.hash
index 2ab509598b..77284e2b37 100644
--- a/package/x11r7/xlib_libXext/xlib_libXext.hash
+++ b/package/x11r7/xlib_libXext/xlib_libXext.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-October/003241.html
-sha256  db14c0c895c57ea33a8559de8cb2b93dc76c42ea4a39e294d175938a133d7bca  libXext-1.3.5.tar.xz
-sha512  fd9805982dabfb14b1526c0cb71f94508003fa3fcd60560d387465afd891c1dca61927ae86278436d53f4b840cacd1f412071fdc3dce1d6f730610a9c163d59b  libXext-1.3.5.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-February/003454.html
+sha256  edb59fa23994e405fdc5b400afdf5820ae6160b94f35e3dc3da4457a16e89753  libXext-1.3.6.tar.xz
+sha512  fd7693b5698cc4f5e80002a2cd4bd88e5d52c755c19a0417ee73029bd65f9d77b0969e765a1febc4d8fce1ba5dfb7278717f47be742e33d8fc5eb941e769792e  libXext-1.3.6.tar.xz
 # Locally computed
 sha256  fd62910be4b13829d94e76c1447cf840953f0e225c4dc6c79349c84dd0557f22  COPYING
diff --git a/package/x11r7/xlib_libXext/xlib_libXext.mk b/package/x11r7/xlib_libXext/xlib_libXext.mk
index 0bb3efa31f..bb35244b01 100644
--- a/package/x11r7/xlib_libXext/xlib_libXext.mk
+++ b/package/x11r7/xlib_libXext/xlib_libXext.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXEXT_VERSION = 1.3.5
+XLIB_LIBXEXT_VERSION = 1.3.6
 XLIB_LIBXEXT_SOURCE = libXext-$(XLIB_LIBXEXT_VERSION).tar.xz
 XLIB_LIBXEXT_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXEXT_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
