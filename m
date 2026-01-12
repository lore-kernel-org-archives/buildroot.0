Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B003D25049
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:17:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FFC2614BE;
	Mon, 12 Jan 2026 08:17:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fzZvQig1TwM5; Mon, 12 Jan 2026 08:17:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 633E0614C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205841;
	bh=m+9xshwapyuvJs+WautIfCsFaYn+7lEXxjvB2CPSj1w=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Il1yvoO6pJhTaB8AZtok8sF0DNh6VMjf+IaAUDiN4VmrtJBivSs+6DOgqjnmTMnR5
	 sMl+I7TxfxZhHT12iRg7WvFDkOtDUGo+Bf4ejS49qJC6Ai7PbPvTzcxGnrA2TAKtRV
	 Ibd6relGBqH9UXyjiAVvkQsrSQWYaF33zLmKX/3S/cjCwlV5EKZvdnnfTCHD+jAksU
	 9GlN8i9gVJL0YamBCBWGFlGGFiLiAC4yHrZSabMgZJqXcjHAl+CvF+gMk4mIhky0wt
	 Q8F8lwUH3a7bG9ms/1rSxVetZS9v9ExuWb1Hkd/5i0YROHHunA4T0KUz5rdinOemOG
	 KqdIY+gMf4iRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 633E0614C5;
	Mon, 12 Jan 2026 08:17:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 53D9C18D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 45D4180EA9
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:17:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fnYevTfu7Foy for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:17:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 41EED84390
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41EED84390
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 41EED84390
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:17:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 60069A4C3E2B
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:39 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuT-000000003M6-3l20
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:21 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:02:49 +0100
Message-ID: <20260112080419.2516889-14-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205139;
 bh=bbxwDL0gQUjVBQ2limjKqBsDd9itAsH78gFRDYhqm6w=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=MTXvKnhYCujpuBaa9WTRXkSkXAy/VSbVRKu/vWlkLBboB+yleZU49twlOWdzCQySC
 7X6mLrxZ1id70UF/I6WCvg6F+1GLcoiF/RvKcMG/UAm99HYR0e3Ear/tUX0C5R5PPx
 aUCQk33p/PzMJMLQO/H9vCjMOaW7nP3lDatjCMiXhdLF2lAkkGQcfQpyHJWrzZDsZf
 kUHCT/ORdkcV0xNSFg6PGZm4UdfbWt3tKC8KGwxbbREd9a6Cx53rcZsFkZIIeQWhNC
 KzYWZhqh751OIv4QAD4mHFkkTnnvHdKmvHyLhv3dALs9FIMMHAsKXI7u4y9McSSs5Z
 mVz9Ov4Rq7NBQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=MTXvKnhY
Subject: [Buildroot] [PATCH 014/104] package/x11r7/xcb-util-cursor: bump
 version to 0.1.6
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

https://lists.x.org/archives/xorg-announce/2025-September/003625.html
https://lists.x.org/archives/xorg-announce/2023-October/003428.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xcb-util-cursor/xcb-util-cursor.hash | 6 +++---
 package/x11r7/xcb-util-cursor/xcb-util-cursor.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xcb-util-cursor/xcb-util-cursor.hash b/package/x11r7/xcb-util-cursor/xcb-util-cursor.hash
index ca316d3ce8..f105a301e5 100644
--- a/package/x11r7/xcb-util-cursor/xcb-util-cursor.hash
+++ b/package/x11r7/xcb-util-cursor/xcb-util-cursor.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-October/003230.html
-sha256  28dcfe90bcab7b3561abe0dd58eb6832aa9cc77cfe42fcdfa4ebe20d605231fb  xcb-util-cursor-0.1.4.tar.xz
-sha512  d27dd59a4d7ded9994dca77774421dd9533e3ee823b880af35d3219bd7340c89fbc61d1d0fa10e2991de2cac9e6395e09497769d7b8728eedc691e76649107b1  xcb-util-cursor-0.1.4.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-September/003625.html
+sha256  fdeb8bd127873519be5cc70dcd0d3b5d33b667877200f9925a59fdcad8f7a933  xcb-util-cursor-0.1.6.tar.xz
+sha512  5cdf2f942e3aad9662456cf6b5c2be2ff1837d73348046f6d8b72aeabf005c481a5f00ee169d9ccd18878697cb1744f0b274d0caa85955979c8e4f92d2cc3f72  xcb-util-cursor-0.1.6.tar.xz
 # Locally computed
 sha256  0dde91ae1d443105dc9e13cbaed6674c36683b7095836ad9ddfce26be270aad5  COPYING
diff --git a/package/x11r7/xcb-util-cursor/xcb-util-cursor.mk b/package/x11r7/xcb-util-cursor/xcb-util-cursor.mk
index 0fb131693b..14cefede7a 100644
--- a/package/x11r7/xcb-util-cursor/xcb-util-cursor.mk
+++ b/package/x11r7/xcb-util-cursor/xcb-util-cursor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XCB_UTIL_CURSOR_VERSION = 0.1.4
+XCB_UTIL_CURSOR_VERSION = 0.1.6
 XCB_UTIL_CURSOR_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XCB_UTIL_CURSOR_SOURCE = xcb-util-cursor-$(XCB_UTIL_CURSOR_VERSION).tar.xz
 XCB_UTIL_CURSOR_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
