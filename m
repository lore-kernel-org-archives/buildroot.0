Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF01D25051
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:42:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E66C761516;
	Mon, 12 Jan 2026 08:42:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nbu6UiTdQZ3c; Mon, 12 Jan 2026 08:42:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D9976152B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768207353;
	bh=m+9xshwapyuvJs+WautIfCsFaYn+7lEXxjvB2CPSj1w=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lYTIlXk0/8Q6Z4Nh25WS+VHwpFTXqY0pwt9d4w0MS3jb22F4Q1tiBSEpTVUVFqcoj
	 ptRoLZRBd/9xScr2AR7GcffUtNk9Blx3VXsFl/wfH1qfKMU97FEdue+TKtuQMzrlpL
	 23E7toAzkDc6McQoA0yNyb3jzErAKG6d60VMSQfWyfiEyE3vEACIJjor3rgCjh7TE+
	 DolMl9mujgkfY5aWZEbbwYnIeHG9kBREgvEdEN2isUDS5/cg2OXn7t5rK3z51Vzj2J
	 JSsV4YCeGLuinGVjhuakhq/RTwOui9pDDvHPK67J/DktsRKLVLZ0zjAk+isMuSkWS2
	 BnIyFdB7KTuiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D9976152B;
	Mon, 12 Jan 2026 08:42:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F3E41CC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:42:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3524C6152B
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:42:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hDxN3xTCEMN5 for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:42:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 27BF961516
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27BF961516
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 27BF961516
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:42:31 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 24B77A4C3FBB
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:30:50 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJB-000000007z0-2RuG
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:28:21 +0100
Message-ID: <20260112082950.2528445-13-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206650;
 bh=bbxwDL0gQUjVBQ2limjKqBsDd9itAsH78gFRDYhqm6w=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=W0spX2X+O7W0M3HvYmP9jnuSNUu7MnZvF3sPjr16Ux1otYbfjMOPgDRlmpbgeIGaQ
 L6cHEhJ0Y6rpDM2vsHJGh7njHGM481Q3Xb2uFDmHGxnxrOoc/Gly83UU6jD7j8skTT
 gB7Dt6gvcHatw047FwXvRJf2+65XLeJL5GRQcfnl5XNYybdQu4SXehCQ44AVkZluHW
 WatlEoD4k3aZuGsDF/HCItmPBsWZL3Vh4WByQOaIdZd/LKIFreEE59vFJ06Fyu86YL
 mkUk+L/76dtblWhKyesnOKYYzG3cHfKr/36mfkW5buC1kzdrBxVH5xTGGsV64mvAO+
 l2avfUvPXg3HQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=W0spX2X+
Subject: [Buildroot] [PATCH 013/102] package/x11r7/xcb-util-cursor: bump
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
