Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 322C1D25049
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:15:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09B94614E9;
	Mon, 12 Jan 2026 08:15:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 67PO-CR4NSSH; Mon, 12 Jan 2026 08:15:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36825614B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205721;
	bh=/HFOvJHin4X5H0yX7w+3UM+jy1rbpBT2uisCB1Q2yN4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IpQCJyO+fkA+rncT+C95vp+03gPPLODzdxEFnEqnD1gqVj9fXu1LSkpLeyCG26UTf
	 /UL0VmZlnWQISV5NX60T5QaYFr+ztSSOEdaZfmNSmCDxDlvrOlmWEMYBrXo7SAxuBx
	 cjD8t5gxcnP0HMQTqovCWjQzty+eiM72yM6loP5f5J7S+4yfqHR2Ee6yAPehs5CMvI
	 MAgv75SWxmP4tcN9TCxp59e6Z71719bcFkFF13BRsStwnkDpvTJWTn1Q0F4GXS7/g/
	 OkXY07kJmxgBP6KHpyv6QLvYusdwrrZTFVyBoig6huW4nrzs0i+jrik0Q6ZsFdmlp/
	 tub2V7otqWYVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36825614B1;
	Mon, 12 Jan 2026 08:15:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E5F8C12E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8299807CD
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:15:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xh5ACFdC6OTU for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:15:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D73028449B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D73028449B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D73028449B
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:15:18 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1EA00A4C3CC3
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:35 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCub-000000003M6-3WaR
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:04:18 +0100
Message-ID: <20260112080419.2516889-103-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205135;
 bh=koDUf22n8pZIysOrEzYrrX2pEJbH6VJSjzwr60SQ8zk=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=GJfUJm/t9AX30lWYFE0OT3D0mKrS3Lf0ShO+/Z6RE/tfz0OQTpaA6jEA6dRiQ6pbM
 +E1tPMx62jWYgAhvrCSeX+fM7PYKeG6tcgXfrhoH6zJb2QeNXXjlzmHwPTXlidcgRk
 YVf7CeFzqp4Wks7do+0MsH8zkaXUiAeOsIV2i8m2cdklUypOl8xzFCFMKz/WTPz8tA
 ojBhO88snIKyEVgfZTnkQV9oGfB102VFrY5y7kdIsrZj81oH8PXQ2eHENiJWjEInf6
 Ea89QtGA+cFhGT3VXNiGT9ZV2wgni+YSRtHh9IPXj26RI3GGWKd8vMXGjB/jtSSpeJ
 JULgpzZEJ28rQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=GJfUJm/t
Subject: [Buildroot] [PATCH 103/104] Revert "package/x11r7/xkeyboard-config:
 bump version to 2.46"
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

This reverts commit 6d3ca5f33455e3386f664f8bb4567907c4ff689a.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xkeyboard-config/xkeyboard-config.hash | 4 ++--
 package/x11r7/xkeyboard-config/xkeyboard-config.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.hash b/package/x11r7/xkeyboard-config/xkeyboard-config.hash
index e832c58cc0..3a19075ba1 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.hash
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  10c58218fb60d08fb1f7b30304deb3ba47613195aa8a08a81f1972775ccc3640  xkeyboard-config-2.46.tar.xz
-sha256  fc03f6535d16b3fe9beece45b84214a37e6ca4b6550c03cadaed7e1b951fb294  COPYING
+sha256  0690a91bab86b18868f3eee6d41e9ec4ce6894f655443d490a2184bfac56c872  xkeyboard-config-2.38.tar.xz
+sha256  6ca90f4b67dced4062894d6d77f4cc39343df9e359fc12f5e5d3c89ef2a3ef6d  COPYING
diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
index 56f2f7c3bf..7c9c814d95 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XKEYBOARD_CONFIG_VERSION = 2.46
+XKEYBOARD_CONFIG_VERSION = 2.38
 XKEYBOARD_CONFIG_SOURCE = xkeyboard-config-$(XKEYBOARD_CONFIG_VERSION).tar.xz
 XKEYBOARD_CONFIG_SITE = https://www.x.org/releases/individual/data/xkeyboard-config
 XKEYBOARD_CONFIG_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
