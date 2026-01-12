Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A674D25049
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:18:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E891614ED;
	Mon, 12 Jan 2026 08:18:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mngeUIO889ZA; Mon, 12 Jan 2026 08:17:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A97ED614C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205878;
	bh=om5Kjt9umVHcM7ropTSx0NDALd4uRUiyrCIh6Uh0Cz0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VK1BZJW9t0qTbIKKkTEyCQL4k45Krlf3I51+RaaXdr8G2xHRAOSRrme1tNBVzhqYy
	 GDyPfVG1Av5srQc8B7TwEMHOAZyVNPJVdu97uMpK+mYkst27+YSHPErMRjvo25M3UP
	 d6CXUHYU6hVWyXnVIsqcGY+SD61CnT1LfsRcvYq0n5ok0r08NQP6vw8DHBQGtO6wMQ
	 D3vwCn5g6uuMXHSV9HHD1i6WyfTGw4voQfRYEv/kG2FCZzgNlthH9e0aFlPv+JXHoT
	 sp+lXTPJCUADLrbCaz07P8ZFq/VAtZgMFQWZjZv3viu8kmlA+TzHRR37okV/9nUvLd
	 uNALJK4M9NUGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A97ED614C7;
	Mon, 12 Jan 2026 08:17:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BF46918D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:17:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1E4E84428
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:17:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5t2fjeAFfYvs for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:17:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A170184432
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A170184432
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A170184432
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:17:55 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3A16FA4C3EE3
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:41 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuU-000000003M6-0WUy
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:02:52 +0100
Message-ID: <20260112080419.2516889-17-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205141;
 bh=JiZ5nTJY3YVOkNRLUdXiS5IrZZrwqLIjnIjt+VJNUzE=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=iOs86lDmyHVbpFQEJNDcIsZWnNMGQVrWIKbnIwsdn4fMBw4t71kbEa4GsvN78CPnY
 R2eSnihCp2Z/79pZjESuBerg9A3mrTBUkLITu0kwiNTSmkXNbp39EMMmt2NHZZgkVS
 Y2QI6uS6GYCXLgMbsFUzi19bMj0nSRxVkghewoz9ST7oYQfTKXBuXU3ZDHJA74XIEz
 Aq7E7nuIsMYRkopdNYbWB28PPvIfOh34LAcZ43zAi+bXYKPirF4BchgTRUs72A8CZU
 UESBYCGH916Tgpb8W+TRDRGBKReoOZR5dTWgb0uKb6J0H3k8T1KTZ+X1KLt0vxFgJh
 LbdfUk/e5JZTw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=iOs86lDm
Subject: [Buildroot] [PATCH 017/104] package/x11r7/xapp_xgc: bump version to
 1.0.7
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

https://lists.x.org/archives/xorg-announce/2025-July/003621.html

Updated license hash due to upstream commits:
https://gitlab.freedesktop.org/xorg/app/xgc/-/commit/ff0106429414d845d72c723fc69123ee2beebaf1
https://gitlab.freedesktop.org/xorg/app/xgc/-/commit/3e699516059eaebbd9a65b7844b052c0bd71aaa0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_xgc/xapp_xgc.hash | 8 ++++----
 package/x11r7/xapp_xgc/xapp_xgc.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xgc/xapp_xgc.hash b/package/x11r7/xapp_xgc/xapp_xgc.hash
index 7664e31186..896fd29068 100644
--- a/package/x11r7/xapp_xgc/xapp_xgc.hash
+++ b/package/x11r7/xapp_xgc/xapp_xgc.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-October/003221.html
-sha256  7b87bbdbce4ec858738a3b81b8a3943aff01036001e2a1d00bb5384392a8b240  xgc-1.0.6.tar.xz
-sha512  f449b9b2d313aeba1fe9bf33fef90291776403f1fdf4afc507c4b973045c97fc8ded65ddec4f8c58727e7e4c7c4ad6a65ae79581eb4bdfe9c79a5f909dbc0a1f  xgc-1.0.6.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-July/003621.html
+sha256  d858258c05eaac2d1f48bb44820dc2dce0a68601a14fff97853c72b48d1b7d08  xgc-1.0.7.tar.xz
+sha512  2d994c1dfa93b8c99756336d099737025d97ae0e6ec102e964ffe4a46209e518917fb2bc57bf0274010e099742bd50fcdebdaf9add0d9c02849edb220bced4a7  xgc-1.0.7.tar.xz
 # Locally computed
-sha256  13ebeb3e59e406064d46e94a707ed5ec5d8d2bf840971265dd46db0850d22d02  COPYING
+sha256  db697e5e99f065bb3602a16fb7e60789cbd34c5cce49c5d4a4577e73d733bb12  COPYING
diff --git a/package/x11r7/xapp_xgc/xapp_xgc.mk b/package/x11r7/xapp_xgc/xapp_xgc.mk
index fc055f57dd..8248daf8db 100644
--- a/package/x11r7/xapp_xgc/xapp_xgc.mk
+++ b/package/x11r7/xapp_xgc/xapp_xgc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XGC_VERSION = 1.0.6
+XAPP_XGC_VERSION = 1.0.7
 XAPP_XGC_SOURCE = xgc-$(XAPP_XGC_VERSION).tar.xz
 XAPP_XGC_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XGC_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
