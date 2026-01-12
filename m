Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48EBDD25050
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:33:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DBF961548;
	Mon, 12 Jan 2026 08:33:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 52tRgGKvBrqF; Mon, 12 Jan 2026 08:33:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C48261512
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768206823;
	bh=1dSaQlIB8AGYSC0UHKQWH+SVk3viZEIJW6c2jlyY57M=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=La1P9P8LWlAVTpS1Ayxb+SFiPiXZmxsJrDDDLuOL9lUFrgL7Bo7ZR0KxsyoCQ0335
	 vpDSGneiz7EODawevzD4KPf8jZIaGTjrSQzfCpAZFFQrudlrI73dpARXU3YveaqFRh
	 p8GlByu4QR+IvgqPbwj8DxByhsKyUDuA2GmxwuHZ3mnIMmV/+MfAxYGHufwZcP/xNT
	 z2l07QbMf1eiROp987tehFTueElmqbekuajeAypG03hLESPvwa7EEqBtX81cS4dWUf
	 N5fZj8iXzKSyoBlE4vLEzXutvvzmwn0mqHJa7YGYzQuPkQp9Vx/7C6//lj0Zne7Ti+
	 nj5O/95O/zOmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C48261512;
	Mon, 12 Jan 2026 08:33:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DC10B18D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C38EF4153C
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:33:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pQzD6DhbwACl for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:33:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B43CB4153B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B43CB4153B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B43CB4153B
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:33:41 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0E2CAA4C3BBC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:30:17 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJF-000000007z0-1gRF
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:29:17 +0100
Message-ID: <20260112082950.2528445-69-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206617;
 bh=l/Meocj9lNXPDlsRzM1FKXAMPyDhzzaYPJdWa8eCfzk=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=RxQZgZEgH184Fi9nWYLCIqYqAFo7feoAPU6z/a6AAAxMmu8w7Pn5VsBtDBT95KmO+
 IlEZNumaDnW4OFO5LgKQ4KykTFddveg/PY8QNQ8yAKCZY4DOWSMEMv6bjoyHdNMTm0
 yi/JBgOwEzBqINFFl7mph11+63fxYTPAsgv0CSCPognx6Yv1IxGc34H9GfAyjGxdXv
 5Gd1bvBxMNZI/5ayrzsg9cZziRWwYBflBs18/5XLbe3bML5qKb4WDg/Uy9vgBc+l2n
 VllX0zX1kZRTI6FgFaxHB0Msd2IIecvpAGoi8sRsIbgWiVbJYrqySZNNM+iVV82S2O
 CTuPOvEIvl9Kg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=RxQZgZEg
Subject: [Buildroot] [PATCH 069/102] package/x11r7/xlib_libXmu: bump version
 to 1.2.1
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

https://lists.x.org/archives/xorg-announce/2024-April/003508.html
https://lists.x.org/archives/xorg-announce/2024-March/003493.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xlib_libXmu/xlib_libXmu.hash | 6 +++---
 package/x11r7/xlib_libXmu/xlib_libXmu.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libXmu/xlib_libXmu.hash b/package/x11r7/xlib_libXmu/xlib_libXmu.hash
index 58d3545156..2fb3923d3c 100644
--- a/package/x11r7/xlib_libXmu/xlib_libXmu.hash
+++ b/package/x11r7/xlib_libXmu/xlib_libXmu.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-October/003224.html
-sha256  210de3ab9c3e9382572c25d17c2518a854ce6e2c62c5f8315deac7579e758244  libXmu-1.1.4.tar.xz
-sha512  3cf90cb3ff380aafefbb39297bdd95b9e1e6d6618cecb53ff09faf38f9b9c54599d28367f07a9ec77a20214c6c3e661b8d0a12b38082556790a79a59942039c1  libXmu-1.1.4.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-April/003508.html
+sha256  fcb27793248a39e5fcc5b9c4aec40cc0734b3ca76aac3d7d1c264e7f7e14e8b2  libXmu-1.2.1.tar.xz
+sha512  05a30e5961e00e940ad7ec4eb94ec482b5cbe808585972bf70c849333af3fddf4ae4bd87895d706507fb3a94ed0fb73ea161e0e27dc2840323a1a1af49c0e8a3  libXmu-1.2.1.tar.xz
 # Locally computed
 sha256  8f0f2ca7a05cfd10bf9e307a272182de7cb52d7a603feaf17b9943c2c9a4838e  COPYING
diff --git a/package/x11r7/xlib_libXmu/xlib_libXmu.mk b/package/x11r7/xlib_libXmu/xlib_libXmu.mk
index 051968059b..f47d943e65 100644
--- a/package/x11r7/xlib_libXmu/xlib_libXmu.mk
+++ b/package/x11r7/xlib_libXmu/xlib_libXmu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXMU_VERSION = 1.1.4
+XLIB_LIBXMU_VERSION = 1.2.1
 XLIB_LIBXMU_SOURCE = libXmu-$(XLIB_LIBXMU_VERSION).tar.xz
 XLIB_LIBXMU_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXMU_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
