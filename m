Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A7DD25050
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:47:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C570846A4;
	Mon, 12 Jan 2026 08:47:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a3wuYLPOD8W7; Mon, 12 Jan 2026 08:47:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51BD98466D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768207644;
	bh=SxVt9Cqf7IUz0R9yeoq0VPqpd7Nm+vqkEABa75tj+SQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WYwXpykubS+NE9ZRlCYhkbd5t/1+Rp8tnUhhonIhtg6qZ3twQT7Q1Wkze6ZFp5mbd
	 75oE+IF7a372WgdoXLaBn0Jy+mdPnnrv+tnmHuHwQYnnhmOl75pD9hyU0eD9GnptUq
	 2k6ov1bJ89qBTA13tCfJkhWqlnR9G3XvDIkIw8sLvAiP6Wsqv1kBUwT3MRnYwX+rY3
	 qyvItJyvp9JOsDs88lTmdyFcagjoRs7wPqCxi3MZbBhOJs3nXkjX9JfIw9PjGt2dTO
	 nkjdztN+w9EXh0kR0Hyi6rBZ3EBbOmVaufJ5+ZzpkewOwPY6Wh+m87kXr+hCX7HCJ1
	 0b9IbzY6/3GjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51BD98466D;
	Mon, 12 Jan 2026 08:47:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2754318D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:47:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E1EE614EC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:47:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YOZEegGafMM9 for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:47:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0261B60B0E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0261B60B0E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0261B60B0E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:47:22 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 07190A4C4224
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:31:09 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJD-000000007z0-1ufV
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:28:48 +0100
Message-ID: <20260112082950.2528445-40-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206669;
 bh=YF8Zu79d+S8/Te3GWznFb5ejzwsgp7IVDByLgRKLfqw=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=mVkGlocQtUy2b1eP5JOy0qdg2sesNKNfsQlgNTZGfkWn+W9ToNqWPFg+eVuLXNtRq
 TTPayTcGgWxJEW+5Shg/p40AzB0a3J/7spUR43UeZ/TOBmEhloC0+c4RKsSlqxJEzf
 BYsXE8zThBwx0FUHDkVbmYMz7vPQtwDQTs3cbjgydW08q98WgFH2IoxU9Ea+u1guqA
 4/3gPXZ62HtSWwh5tSqNF9Il/mb8RlIG/TkkE4l+fRyhpiO464gmPDtW3eDhbnk7Hl
 LHY7FVHrEw+T7XNnCwl/p03/f/L58r3sZfGD/k8AGfARxUbMI1XyjirYjKfssv1xiH
 URxQFMzfa1Zrg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=mVkGlocQ
Subject: [Buildroot] [PATCH 040/102] package/x11r7/xapp_xkbevd: bump version
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
