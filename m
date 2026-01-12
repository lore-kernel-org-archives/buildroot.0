Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7411D2503F
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D765807CD;
	Mon, 12 Jan 2026 08:10:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BmgZ1J2KUP5l; Mon, 12 Jan 2026 08:10:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF5DC807E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205455;
	bh=LwOomkGNkIszZzS+ZrgDf3gIRIun/DYB+WGw5WAs0fI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E8sq0fRbz35L2kmwnyW7jIDm0vU0CIRLcekG/aYdq7gIU2dq82s0hX4oNMoMSrnR5
	 5JsNmXEPz6nTTucDQH9/mkYuJoN5uFG4V//W0WkeOhVAtNQBFgyDBV62yg3hSTKvlB
	 kZ6ItQ7B0rBpO34VgvKSc6f+FSii6kK+M0jR13L64Ys1jY6AHdeN9cSPdN7JWKiLPj
	 on278depkRKg+vvfVNWMZEnTpO2ff7Ie4q03dwC9BKfbMpOjbmhjWcQ7TSmY871XAM
	 e8xBjoBmHvd/4Y5MxmuxwgsuKrzvruQowlb2jBUKvM3qIFXwVFdgZN1E4igpzL5sPj
	 4i71kkGgxgzXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF5DC807E1;
	Mon, 12 Jan 2026 08:10:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AF11C12E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 958BF60792
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:10:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lrEcE3IbFui1 for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:10:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 73D6A6063C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73D6A6063C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 73D6A6063C
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:10:53 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DFAAFA4C3B70
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:14 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCua-000000003M6-0IGG
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:03:54 +0100
Message-ID: <20260112080419.2516889-79-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205114;
 bh=zs/72gffUjtUQOBvlhPlqeQvTroKzzCNkjbG0qVBy3k=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=QDK03qHDqs2SX6gT73JMD36RyYZx6/NSY04LcP6Cz+5w7zvqmzcKTtdROMoTBAgGn
 hwt5Pu9EKgrk2b2/hJoBsjISsMxSt2AhB74WtsFSHcO8AW+qWsJjwgwHdlckOTNdxp
 cDUMK3z6fby1Y2J+AmDL7hBGym4MWGW30pckGuuOkDjAS/oxRXQoOuZPhGsS3nWz9k
 trQpB+UUJihV1YL6knAQwho+wwpxuiEc8lNOD6iF+VrAoL4m9pnqAcHeWxPxId8PIn
 EPb5Ot2WxJgMJrpAhEEMWY6Qx1BG6Hr/7NElqAeUYR63qeKyN1JFUdpqmZ4lNMKZXp
 9WU3IEM3x+ELw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=QDK03qHD
Subject: [Buildroot] [PATCH 079/104] package/x11r7/xapp_xmh: bump version to
 1.0.5
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

https://lists.x.org/archives/xorg-announce/2024-March/003476.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_xmh/xapp_xmh.hash | 6 +++---
 package/x11r7/xapp_xmh/xapp_xmh.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_xmh/xapp_xmh.hash b/package/x11r7/xapp_xmh/xapp_xmh.hash
index f0c9fa9567..d917c5a6ec 100644
--- a/package/x11r7/xapp_xmh/xapp_xmh.hash
+++ b/package/x11r7/xapp_xmh/xapp_xmh.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-August/003208.html
-sha256  e82c425a4c4156eee2e344d2e952f3fd816e03973005cd656ec1e9acf6f329db  xmh-1.0.4.tar.xz
-sha512  03bba7d3e7c2070b03378335aed0188dd0fd0a488f19dc5ad3f26674a9b38e6599377d082328041dd3ab72123ed60acae32cff19d7149517545b80e1339db26a  xmh-1.0.4.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-March/003476.html
+sha256  2e8055b065e0492450a2c0bd8842b48ba7b0f0f377736a219b1752d0eec64c70  xmh-1.0.5.tar.xz
+sha512  fbf5c7e7994832b1df0db9464aacddba6a445c6fe6b8d2e09c311dc27edb96f6e198816ee21b5ee361fb9637302ce54da2691c784e03ab5c1af8590f00b48bab  xmh-1.0.5.tar.xz
 # Locally computed
 sha256  27d8cbdcde7a0bd062ce49cdf8c672201452a64e3e6823f09b1beffe2c4b8eff  COPYING
diff --git a/package/x11r7/xapp_xmh/xapp_xmh.mk b/package/x11r7/xapp_xmh/xapp_xmh.mk
index db6102eb75..92b2bd2217 100644
--- a/package/x11r7/xapp_xmh/xapp_xmh.mk
+++ b/package/x11r7/xapp_xmh/xapp_xmh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XMH_VERSION = 1.0.4
+XAPP_XMH_VERSION = 1.0.5
 XAPP_XMH_SOURCE = xmh-$(XAPP_XMH_VERSION).tar.xz
 XAPP_XMH_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XMH_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
