Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE81D25050
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3133B80DBD;
	Mon, 12 Jan 2026 08:49:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xE-JwcLWd55t; Mon, 12 Jan 2026 08:49:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54CE9845D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768207788;
	bh=C5Py4fAwBom8bYOPK+1/7rK0vWEIHVxEuzF91AaInOI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fNZy5PngLInos4sH1iHzDBffoJZctdVeThfHgOKCZteEfKK7rY62FXPuQamTibpgP
	 1R64jZRLtu64UWIrfRueefIgJZhst4FdSpECCqqOoj+WKnPEdNUqqD0U2xS6aNpA9w
	 KEM9Fvpn9hnMwJKo3mI71VXDa7KRZ1/G6YEkX9CYnxWBAjYHpc7DLrnvxu6NCyytXO
	 4bwqvt1juwxioEjZ+kcMUEAM+okZdocGCXNnWmdlOhx4Lid7WTbTrn4B6YcKV++ESD
	 sbXe/g4rP86Aly1qqnliym3x5ffFW+m1UgHZdkoIl99eSqEWemMvGbeJUtss057sYQ
	 RWO5MnEmwyJkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54CE9845D7;
	Mon, 12 Jan 2026 08:49:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 61A4318D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:49:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53A3740350
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:49:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yyW49o60vcFs for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:49:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 50E784004D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50E784004D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 50E784004D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:49:46 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B0D21A4C423A
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:31:11 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJE-000000007z0-19DR
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:29:00 +0100
Message-ID: <20260112082950.2528445-52-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206671;
 bh=hLP70RvEQ+5AzEEeQ8TV6w/LYmudR9PJAuibJlGuWwE=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=gGpyeYz9KBAwtDMo0lbp+atb3ajU+DPr015vSSHVj+bPl83uPjVa60XOWKyiqPcAa
 UYbXPyHLrfNJikTcWuQv8P6c8oLeB+9NdarfWyKvLJtHpzEXzw+Rt72paP3RXKDJWU
 ZZ4kAf52gyhrm5O1glSFVWkCB+6cXkSeOqpoxcmTU5pcCDCKfQWstOQ+YLXse4rwoS
 krj2A5rNOQ7pjmXjf/dQ6aIljFBgXDkz5+s8jbPyjErujh/w+PEOzUPnYJjaJaWn2Q
 ohBBs11n57X/h+PeOoLS/K0ATe/xJnN7BiLOSOmsXaPicCdekLPQryTC8vY25zVfuI
 O9DhBTaCRzJ/A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=gGpyeYz9
Subject: [Buildroot] [PATCH 052/102] package/x11r7/xdriver_xf86-video-r128:
 bump version to 6.13.0
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

https://lists.x.org/archives/xorg-announce/2024-October/003540.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../xdriver_xf86-video-r128/xdriver_xf86-video-r128.hash    | 6 +++---
 .../xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk      | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.hash b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.hash
index cf9b21ebe8..135bbccae0 100644
--- a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.hash
+++ b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-December/003275.html
-sha256  7d023c2b171f1664e43d12a1d21674079d8065536f82bb95b448bfce4981c741  xf86-video-r128-6.12.1.tar.xz
-sha512  18b2408fe68161c32f84c7147717f8e6c6377e81e9d59e2f098843c54cd0ae757aab5059568da8c71ef38100807d56ee22447417c236c1b3deea292bb676e700  xf86-video-r128-6.12.1.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-October/003540.html
+sha256  f20bed5ac201edd517fe0878dd2bcef78c8805c9f7faa3d0d7a4dba2e973f745  xf86-video-r128-6.13.0.tar.xz
+sha512  6eae2a4f3a563d00c357025ffd3206c2b20cd35327af21add052a28447da9c0f642569bfb423cacb8989995bc92fc73cddd96d673e64438d1d7569eb926fb2ae  xf86-video-r128-6.13.0.tar.xz
 # Locally computed
 sha256  69f7c71859dc8f51aabdbe7a9ee915a480933eb81658f8af2bf4c918e65afe8b  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
index 49514e3d3a..0ae5cd169f 100644
--- a/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
+++ b/package/x11r7/xdriver_xf86-video-r128/xdriver_xf86-video-r128.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_R128_VERSION = 6.12.1
+XDRIVER_XF86_VIDEO_R128_VERSION = 6.13.0
 XDRIVER_XF86_VIDEO_R128_SOURCE = xf86-video-r128-$(XDRIVER_XF86_VIDEO_R128_VERSION).tar.xz
 XDRIVER_XF86_VIDEO_R128_SITE = https://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_VIDEO_R128_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
