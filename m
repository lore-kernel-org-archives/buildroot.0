Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC72FD25051
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:30:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8974884480;
	Mon, 12 Jan 2026 08:30:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VXdysyYAAVSM; Mon, 12 Jan 2026 08:30:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B91C0844F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768206619;
	bh=PZ5Umi1msGJa61phT7IySeVyPisLec2HiiIbD4SCP+s=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mOIgkhF0pLhKmV6VQOVRNd0tyiwD5EZewnOhubm3q9aY2Xg/UeoFQEtlodSpMCArS
	 w+u0G/Kk/6efxp/8BcbdYfBT3D8tmZ82tiul/U4qeNigQqaKnMjXrqCfmqolbhYq54
	 tSh7Bgntv3HQs5D2KkHz3mC++j/QWYN6uuyaEtvC7JfD4K4Z53Cla7r6frp0h6adbE
	 YY6H8PGUyAiwPfb3DRKIi4qFvd0+I5SUEobe60vby75GWS/VbbmIdwpoGm428kzQwk
	 q0K0NMmH/YwrLHJo6W1vBltER/DIyFr+0JQFHZFTMqGKQLaYWLDLmjZ8h5kvYfE0SO
	 nRHaLsocHYGPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B91C0844F9;
	Mon, 12 Jan 2026 08:30:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 47AF218D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:30:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3978084480
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:30:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T0A3MuoXsu6K for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:30:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2D499843F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D499843F4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2D499843F4
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:30:17 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 416D6A4C3A6A
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:29:51 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJ8-000000007z0-3u0R
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:28:11 +0100
Message-ID: <20260112082950.2528445-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206591;
 bh=HIB5x3OSFaDsSqvwuYVHShUZHfQhc9/JNR2xDZRuPCw=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=CmDD+1+7Iibsb+6vVYJg/7Db5i2m2Lb2UU2baw5GgXeXCJWlLmaR8Hb5DENYy8uZ0
 aaBmuN2rdXwXGc5bmq4ivXceHCkQ7fR57//FTK9tWj+JmJ7mzay5YAgxbxxvpb5jhD
 VXsqBIFYGC85wcDwJqcMo88rJkmUKLdhZyMSWyDkukwCQ27KarHqAqEwTfFG74NWuO
 AbSRDqr+nEQmqHKfZER56KPB9t4wd/1NUpSGxsSLhpCFJ41edmEWhRJNolKE9JFDYG
 TQ6skppVCszyxVYAwM1Y/xzRMsxngsFsapA3FCxfPdDaND4RbtYJwumxde2CKLeopU
 4xTSngCsNWSZw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=CmDD+1+7
Subject: [Buildroot] [PATCH 003/102] package/x11r7/xapp_xauth: bump version
 to 1.1.5
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

https://lists.x.org/archives/xorg-announce/2025-December/003653.html
https://lists.x.org/archives/xorg-announce/2025-March/003589.html
https://lists.x.org/archives/xorg-announce/2024-March/003472.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_xauth/xapp_xauth.hash | 6 +++---
 package/x11r7/xapp_xauth/xapp_xauth.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xauth/xapp_xauth.hash b/package/x11r7/xapp_xauth/xapp_xauth.hash
index 966c3ba028..bde3c2ef9f 100644
--- a/package/x11r7/xapp_xauth/xapp_xauth.hash
+++ b/package/x11r7/xapp_xauth/xapp_xauth.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-April/003158.html
-sha256  78ba6afd19536ced1dddb3276cba6e9555a211b468a06f95f6a97c62ff8ee200  xauth-1.1.2.tar.xz
-sha512  ac23fcd166b45abf7b030994ff3332c9906023dc1ddfa9b9d3000e6a914dc5e0213c4a2aa409cb3ddb93e1f9f4f6374376109241a95ef8c36af842de1f6f76e8  xauth-1.1.2.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-December/003653.html
+sha256  a4000e2f441facebf569026bedecc23ba262cc6927be52070abe0002625cfbe0  xauth-1.1.5.tar.xz
+sha512  df94b59de49ced2490351b7ab42d56d3ef92077891b8ba7a73c53b6babb1facd250d934b82f36ee1ddc355dffefb8f52914d30893c9d578711264f82e9bf3cb9  xauth-1.1.5.tar.xz
 # Locally computed
 sha256  dcdf5fa36a652efbe61a21def1301739b0010334ae3f049f1cff433221a8c7a5  COPYING
diff --git a/package/x11r7/xapp_xauth/xapp_xauth.mk b/package/x11r7/xapp_xauth/xapp_xauth.mk
index 248a66e3a0..978a20e690 100644
--- a/package/x11r7/xapp_xauth/xapp_xauth.mk
+++ b/package/x11r7/xapp_xauth/xapp_xauth.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XAUTH_VERSION = 1.1.2
+XAPP_XAUTH_VERSION = 1.1.5
 XAPP_XAUTH_SOURCE = xauth-$(XAPP_XAUTH_VERSION).tar.xz
-XAPP_XAUTH_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XAUTH_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XAUTH_LICENSE = MIT
 XAPP_XAUTH_LICENSE_FILES = COPYING
 XAPP_XAUTH_DEPENDENCIES = xlib_libX11 xlib_libXau xlib_libXext xlib_libXmu
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
