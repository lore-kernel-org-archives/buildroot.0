Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 183B9D25032
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:16:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD80280CEB;
	Mon, 12 Jan 2026 08:16:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3lOZ1vEjWMgE; Mon, 12 Jan 2026 08:16:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F41D80D41
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205781;
	bh=VnpCciKsAO33invfnD27SCFEYu631ws/2w/P1QraE+k=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j5f3vwFyKGEeoXDn7XEegi3p0CNI2iv/aD40n0BRsW6bFWwaSHfiKSneUxnQQkdfz
	 VVKf3h3uWRKIxtu505neK9sRWVn5ngr9/im1jq7VxcH7Lsq2kkwBs1GiqNEG7OgM2m
	 +W4ETjOjUVeqvNOzODOJcQQfGnhPCXhs8w6kZyQrqKBACtxo3F9XgarM0ZLEcYouQQ
	 7g87wGJhygedVpvMMF7gtgqQQPWPfRzl/+4IF9+v/XTvN+QThNilKlsCSMGv+UBfdq
	 SVza26kfPAcMp63jymjaLZUxJuC5iW89c1v7SI0eVO78WZQDgFEXJCoTbk1ZrDsX1m
	 qBL0d6VkjwqwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F41D80D41;
	Mon, 12 Jan 2026 08:16:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C7BB612E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:16:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B9F448087C
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:16:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d0xiStj2nuBg for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:16:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B4F8E807C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4F8E807C0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B4F8E807C0
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:16:18 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A28C3A4C3D2E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:36 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuR-000000003M6-4B0l
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:02:44 +0100
Message-ID: <20260112080419.2516889-9-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205136;
 bh=rEeMKfN2HgMyHy/s4uQZVuZG8ti5z6x9pbDvNII+rKU=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=vCVtAp1xRP+nkPbkuPVTcECz8BGfmHH66NafVngXeLaiCltnXlEcW4w0br5CtRL+g
 zfabpdOlM5wPneOztxick2XWrcu0Mr3KKgpO8Q8LLbNx7jzH/Ok0ThDIPW5UUdMQPj
 OwVLi4rz3R1qVtGpvgL61nEn1iCiqMsErio9aExZeinCLBuhSn5WI7V6RYRNpe/IJU
 pz6j/kUlZ+/A7K7Ez9+ypwFAZjoJCPOhX2PBceM8ksXm2hkEznFTDrBCXeUbVPyu2R
 72c/1kUm2gOqVe5MaIsbkD9NnOr97qULn6Kb9Cadq+3/kFpMeunDV19L+gEPZ7gEuh
 N9XomT315Z4Pg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=vCVtAp1x
Subject: [Buildroot] [PATCH 009/104] package/x11r7/xkeyboard-config: bump
 version to 2.46
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

https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config/-/blob/xkeyboard-config-2.46/ChangeLog.md

Updated license hash due to upstream commits:
https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config/-/commit/9db3b1fb6c643f9eb8411439399de64fd4c0a273
https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config/-/commit/8d42430f6498ceb1f9ca31f2fb9d0419c682912b

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xkeyboard-config/xkeyboard-config.hash | 4 ++--
 package/x11r7/xkeyboard-config/xkeyboard-config.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.hash b/package/x11r7/xkeyboard-config/xkeyboard-config.hash
index 3a19075ba1..e832c58cc0 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.hash
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0690a91bab86b18868f3eee6d41e9ec4ce6894f655443d490a2184bfac56c872  xkeyboard-config-2.38.tar.xz
-sha256  6ca90f4b67dced4062894d6d77f4cc39343df9e359fc12f5e5d3c89ef2a3ef6d  COPYING
+sha256  10c58218fb60d08fb1f7b30304deb3ba47613195aa8a08a81f1972775ccc3640  xkeyboard-config-2.46.tar.xz
+sha256  fc03f6535d16b3fe9beece45b84214a37e6ca4b6550c03cadaed7e1b951fb294  COPYING
diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.mk b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
index 7c9c814d95..56f2f7c3bf 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.mk
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XKEYBOARD_CONFIG_VERSION = 2.38
+XKEYBOARD_CONFIG_VERSION = 2.46
 XKEYBOARD_CONFIG_SOURCE = xkeyboard-config-$(XKEYBOARD_CONFIG_VERSION).tar.xz
 XKEYBOARD_CONFIG_SITE = https://www.x.org/releases/individual/data/xkeyboard-config
 XKEYBOARD_CONFIG_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
