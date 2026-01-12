Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA959D2504A
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:22:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 856C2844B5;
	Mon, 12 Jan 2026 08:22:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y3ce-zO6GBJp; Mon, 12 Jan 2026 08:22:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA40E8447F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768206168;
	bh=SxVt9Cqf7IUz0R9yeoq0VPqpd7Nm+vqkEABa75tj+SQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cLFcjsdHp5ul1T0Q1YRBhobPCL4oAA2sOtUUc9rUY88M4O6kr8ixggHmYQfHg4Udg
	 NKiRMt67prx5xR4xD7Dkr4m7dEHCRYQ9XaGGyVOSXM+9Ri7ANcHFBkYt0aR7G4JUDX
	 7VMwUaNKn6+9XP6QUUohKRfWTTHRn6+d+vqcHL0aEuFA3ZeoBvRQSCd0C0eHde38mU
	 +J9pa1qX0xK+HbkiGOhmQHSME6wnXWKPej7CWAveW3SDl9u8NpJRvtXpXyjpuWFm0d
	 O9Zcu3RhwVdHcg6UZqB3aWNPZTB5xieubsFnTTAoeAr5KfWv392YdjyTV3GkRwAKhX
	 2NhJyPuMi9E2g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA40E8447F;
	Mon, 12 Jan 2026 08:22:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 46AFB12E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:22:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2DF688447F
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:22:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a3dXe805Dvrn for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:22:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 28116843B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28116843B1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 28116843B1
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:22:46 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 92486A4C4228
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:47 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuX-000000003M6-1ZCX
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:03:16 +0100
Message-ID: <20260112080419.2516889-41-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205147;
 bh=YF8Zu79d+S8/Te3GWznFb5ejzwsgp7IVDByLgRKLfqw=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=Dkh+oe3fAfu6HqAbFXFaVKj5OqU68GQ2HtVCJZN59REDnZOXHMVQPhli+ILV49nD6
 cZRHQqDd7Q4TGftqRUFxpPEePi7fBIxhdz8GpN3LicNk8jlGtBA3SeDoPCNny54RhM
 IuHx96gb08akE03XJ2iRFvYQlEq0sZ1+0vBuNSGdE5WPjWDfwPyz5DJazNLpai9CUW
 80tXngziXogxbG9w/d8e+xgprOZHVtGR0Ux4XbupXUlL61iGKi6RMJ2UIB79wMfW3N
 qDxtVhen3+FhFpht9Wab3MUzjfBezgz0i453/NGYwZSvcIp94VPsdZHMyeE1NXjHU4
 n+JHbF9F6fiFg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Dkh+oe3f
Subject: [Buildroot] [PATCH 041/104] package/x11r7/xapp_xkbevd: bump version
 to 1.1.6
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

https://lists.x.org/archives/xorg-announce/2024-December/003566.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_xkbevd/xapp_xkbevd.hash | 6 +++---
 package/x11r7/xapp_xkbevd/xapp_xkbevd.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_xkbevd/xapp_xkbevd.hash b/package/x11r7/xapp_xkbevd/xapp_xkbevd.hash
index 40b813fcf2..e06f5adbd8 100644
--- a/package/x11r7/xapp_xkbevd/xapp_xkbevd.hash
+++ b/package/x11r7/xapp_xkbevd/xapp_xkbevd.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-November/003255.html
-sha256  38357b702de9d3457c4ff75053390f457b84c4accc7f088101255c37c684926b  xkbevd-1.1.5.tar.xz
-sha512  9e4a56484771e5eb5444fbd11e7d0bb952a2746eea79b84298e2000ada96896d501b886727c4ef08c120b5dcce550fca2d3e3dd762f4ca0327c38d9609961c5b  xkbevd-1.1.5.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-December/003566.html
+sha256  d9b401f84cf8568342ff63b1ffc6aecd3877579256d89fe6408645e2741b073e  xkbevd-1.1.6.tar.xz
+sha512  5120909376d11c1b153198ba887c1af8c0398f2a7ded8ec85402418f9837730cc4ca689773f326f4f74dc348942644ab0159bd2c973de0007d21a4f14731ac1a  xkbevd-1.1.6.tar.xz
 # Locally computed
 sha256  38c6dbf8f88b1c920561ff3a4d1ffdb85c069c664f5f8b64a9adb477ef347b7c  COPYING
diff --git a/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk b/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk
index 5b99e6967f..b252d368a6 100644
--- a/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk
+++ b/package/x11r7/xapp_xkbevd/xapp_xkbevd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XKBEVD_VERSION = 1.1.5
+XAPP_XKBEVD_VERSION = 1.1.6
 XAPP_XKBEVD_SOURCE = xkbevd-$(XAPP_XKBEVD_VERSION).tar.xz
 XAPP_XKBEVD_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XKBEVD_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
