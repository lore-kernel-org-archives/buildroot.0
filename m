Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D12E5D25051
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:38:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7B5361509;
	Mon, 12 Jan 2026 08:38:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mh4xHRP4V-sI; Mon, 12 Jan 2026 08:38:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C2CF614F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768207125;
	bh=EySRzzlRShCPySZG44a2nowZJvfGRH9g3Lx4RgsC6Co=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=apxYvhNYUygZQdIavHdtJ8E/+3evgTkm7JY41px3Kl9TWDkM6/1/UdIPLLHB7U3rC
	 hbCG8D3S8mPaZsEv6oL3Lf+B/cneb35B/ic47MwlisEAu3ag8RMPwAeWVCqKuR9evF
	 6ivOqboXBLBuzMijwgRkUJ2uLjHpkpCNTVAA6gXqvUVHfX1z0/yTMMYcGfz2UUYNMq
	 iiCsTWjFZKhIUy++rdMstTPqoGKocC3GKpxaq0/gh313INEvylcgBXwsmas4k477KV
	 CX3zThqlrHv9pn2eGACtJ5evlk+FS96Y7nevnSZLY6dnC9N26ikHE2mAc9paLbc5KG
	 c2y+N6Gy1GGqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C2CF614F0;
	Mon, 12 Jan 2026 08:38:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A4D0418D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9786F40052
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:38:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oiilo8k8uQz4 for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:38:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8FEF14004D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FEF14004D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8FEF14004D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:38:42 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8E501A4C3CC4
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:30:34 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJH-000000007z0-0QyD
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:59 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:29:42 +0100
Message-ID: <20260112082950.2528445-94-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206634;
 bh=FbTdvVBNVebCYdkKT0YcQjUJtcWwHBs5Bj+1uFVkGrk=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=dgfCahQuA2FS15TyAiL3k37cYnHBYH991hO6tfN2ZT0rE4A8IxqLChBSIFe8Urejt
 mtdM8y+YEmrEFKUY17M7Fx2FM2QeyLieTcW206wi0Sr312m0XKF0pK43J6ixg3xdxf
 OP0P1wMOfcUrPe/GgNOmM9o2lQSntpcQ9RLqL6mB9ZYor1KvZ12VOfSjw5lSq1s4Yx
 mwCFcll0tr5nldONO4Cl0x8oV0M2p6Bl04Bhl3HdZugKOq9OdWfCJE/u4f19Isj2ij
 QDzESWkHG5RToTu/W7gs5Nu5DuF+fruG8oMOVZqwxk59fwyd3a4JRQoXzD7Zrp92kx
 dXKWgmaTFFQ4Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=dgfCahQu
Subject: [Buildroot] [PATCH 094/102] package/x11r7/xlib_libXrandr: bump
 version to 1.5.4
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

https://lists.x.org/archives/xorg-announce/2023-October/003427.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xlib_libXrandr/xlib_libXrandr.hash | 6 +++---
 package/x11r7/xlib_libXrandr/xlib_libXrandr.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libXrandr/xlib_libXrandr.hash b/package/x11r7/xlib_libXrandr/xlib_libXrandr.hash
index 3d3bb640ed..e2914eabd7 100644
--- a/package/x11r7/xlib_libXrandr/xlib_libXrandr.hash
+++ b/package/x11r7/xlib_libXrandr/xlib_libXrandr.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-November/003262.html
-sha256  897639014a78e1497704d669c5dd5682d721931a4452c89a7ba62676064eb428  libXrandr-1.5.3.tar.xz
-sha512  0c385fc304a872048ffca5cfb8789dfe3132e3126894d54b2fe642dff19d286e7ade1d2f6da894e03788df9c5cf31427c674e987143037b7d385b19285590edb  libXrandr-1.5.3.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2023-October/003427.html
+sha256  1ad5b065375f4a85915aa60611cc6407c060492a214d7f9daf214be752c3b4d3  libXrandr-1.5.4.tar.xz
+sha512  f7c0b083943e11b4cc3c97e10e2cbbc3920fe0c9c5031ef86fca2eb5df413d767caf53dca266abf65395eb10e55354c8fe59ed6b3265402ffccb919a813bc781  libXrandr-1.5.4.tar.xz
 # Locally computed
 sha256  73777e5be1cef2827d843e4b186803f050c66db472cf8076d88e2b5f71696e67  COPYING
diff --git a/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk b/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
index 5e88173ed7..20b6805b51 100644
--- a/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
+++ b/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXRANDR_VERSION = 1.5.3
+XLIB_LIBXRANDR_VERSION = 1.5.4
 XLIB_LIBXRANDR_SOURCE = libXrandr-$(XLIB_LIBXRANDR_VERSION).tar.xz
 XLIB_LIBXRANDR_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXRANDR_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
