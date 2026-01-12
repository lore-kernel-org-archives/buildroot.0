Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F02CD25050
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA6E660652;
	Mon, 12 Jan 2026 08:35:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DSDHest10uRE; Mon, 12 Jan 2026 08:35:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DBF660724
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768206956;
	bh=LwOomkGNkIszZzS+ZrgDf3gIRIun/DYB+WGw5WAs0fI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DcJ0XWQxUJPZRDpWKM7RvfVpk1LfJyPmM7y64rivfIwCtN7JuthwQzivz1uVU8ylw
	 JWyQExQyF6OVYTRFhgsiUkG9DsJKkL7ZOuVO7m7l4/yOtIT9h8SGACJiQXUTYZd4ek
	 b+wSfcV4lOJoeTyUrdmn1wwC2nbg50vyjnZ5la9I8n8RAgjg7Hc3KoGcFlHJxqfim2
	 6dPSZDkz4011LSqfnDxoZyu7rOL8jVTqyR58HHRq2e/oNrKGoPyPGRPwsa/RNpKlca
	 kprgFQgRCDcyBqZEaWGn5DSx/3u9TB3Zqpk72VUJTl1WWqhs13nc9Ti6akNBYjbBnx
	 23EyT+fbfWfcQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DBF660724;
	Mon, 12 Jan 2026 08:35:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 29F0F1CC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:35:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1067F60669
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:35:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AYmBwRt3JVpz for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:35:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 02B4B6064A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02B4B6064A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 02B4B6064A
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:35:53 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A04FDA4C3C25
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:30:22 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJF-000000007z0-49o7
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:29:26 +0100
Message-ID: <20260112082950.2528445-78-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206622;
 bh=zs/72gffUjtUQOBvlhPlqeQvTroKzzCNkjbG0qVBy3k=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=pPZpe2T1Ut42d4VbN+TAiDGdPvyNkz/NfqcnPiBzX9+DCJYH6MWmVzbZxeoz2euy6
 bLOFaJ9eWTpV33Azir0/PqzqYan9o2IvfD6td7Pyl5D84bq69iwLVim2XMmGn0H5Ho
 SIich6VRAHljqm+RvShc1y9ZIzccS0cq+6QJkpmSv8ICoRQcIZiNN1Abh02g5gprDp
 vTEmNAt2pRP2JjwAo/c9I8IvapkbansC1Wi6F/DWoOf+6TKJkX5Bds08GYl2W6Jzeq
 slJbMYV2WRkpWlE9O6WpiCsJ2Hg7f0kWng5+0ovyvmiMDmjQ0sp2KURcCFJr4fszOR
 eKzw7Lcw1VjbQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=pPZpe2T1
Subject: [Buildroot] [PATCH 078/102] package/x11r7/xapp_xmh: bump version to
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
