Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0772AD25044
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFA1A80850;
	Mon, 12 Jan 2026 08:06:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k3w0Jt2Eixik; Mon, 12 Jan 2026 08:06:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B829843E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205213;
	bh=ukIQ8iD3VlxoS+AzQFG5qmyPsYZCWm8w4zxnuDzjrK8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LvstUOKpHtlelwh32+Ck76zUeVrcuMWfsDkBkoXLYdCxhlPDcty1MJDGGG36cZQGh
	 Pdb1ajiT3lSwCiYwjSCjPTpyi1CkNjTo38EENV00Z7Phi7AJvB4in6OHbJkHanYGPm
	 ZtrKHMCoOkew89EvxcILxXAd1jOt72kECV23nBgk6gR14yPE1ronx3ny09RRM/4aj3
	 KrivGXwAiEAHWgERoyySEgW1tOyk4tenEsPjlG6cMQLBvnkOFADj9vFuT+Vcieid+R
	 +IDZvk0PxeYRJCBVKwChrONLI+R9ShwQBhL0piAfbS1gVs/Ti4SBDFE3+pnW5xxNnx
	 D+FDLZJzUSeCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B829843E9;
	Mon, 12 Jan 2026 08:06:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AE62512E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95A02843E9
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:06:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 43C9Dw0NM1Kk for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:06:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 928B880850
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 928B880850
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 928B880850
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:06:50 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5C18BA4C4213
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:04:53 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuY-000000003M6-3HFi
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:03:36 +0100
Message-ID: <20260112080419.2516889-61-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205093;
 bh=gD09A7FOHukksZ5ZEAWPFpihrLBUil3GvuhuWPoI7BM=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=ufclEbUe71025L0ykb5cLQgtIAlhq9cyv0vqRxlpA4D1iAzBWpqy9l2BXm/c7fxEW
 X6KK8tIplsAkT/8TgENheLbRHKZS6/ov8I0ldCcJyv4xOAClHJeZYHpLFRwi1x/njZ
 WVqHgE9p2ZXkv8cAWjWyJVovYp6ztaGG5LoGFR/14ueEf95/sd3jqhj7v9f1zbS5JT
 IhAqqIhird9UlcDvW1ouzsseThtcXvTKve6wgdV+uRZK3n0Eoa9D6yH1QPq3u6kOvU
 zmZ99NjA6PyxdYU/DPBK6VmPi30KD9NNkkoOWAPdYMIDM7lSt0U7M2axespDW0Q9Br
 2hyh4W03IWObw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=ufclEbUe
Subject: [Buildroot] [PATCH 061/104] package/x11r7/xapp_xclipboard: bump
 version to 1.1.5
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

https://lists.x.org/archives/xorg-announce/2024-August/003529.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_xclipboard/xapp_xclipboard.hash | 6 +++---
 package/x11r7/xapp_xclipboard/xapp_xclipboard.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xclipboard/xapp_xclipboard.hash b/package/x11r7/xapp_xclipboard/xapp_xclipboard.hash
index d848a47342..9d78920389 100644
--- a/package/x11r7/xapp_xclipboard/xapp_xclipboard.hash
+++ b/package/x11r7/xapp_xclipboard/xapp_xclipboard.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-July/003171.html
-sha256  f43d4560d1464e8ff58e850212f6bdb703989b66d599fb61f351b5f9e077f253  xclipboard-1.1.4.tar.xz
-sha512  efa7800e0c4fb0242362c4263d80182d591bded07d1064a36b157b6202b15b0c82f083658ced2b82392eca905fb57c04a537d67e75c1237a1667ed2ce0cb09fe  xclipboard-1.1.4.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-August/003529.html
+sha256  8e47a4e18a88d47b14e8eb61a5f298687624a38f9decee9988d8b51a20514c45  xclipboard-1.1.5.tar.xz
+sha512  9962b8d19e6387c9af87a47d66d81577ec3e2ba1d0aa6f6ca8fa89664ccfb0dd20906e143a4d19a303a4eded4f29c4bd40868477fbf754a79cdb48256846a8d3  xclipboard-1.1.5.tar.xz
 # Locally computed
 sha256  f0a362fc1b8e788845b1c0ad7ba9ade58fdfb73da750c3b9780db5d70b947657  COPYING
diff --git a/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk b/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk
index c76d5ded3c..a49cee930a 100644
--- a/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk
+++ b/package/x11r7/xapp_xclipboard/xapp_xclipboard.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XCLIPBOARD_VERSION = 1.1.4
+XAPP_XCLIPBOARD_VERSION = 1.1.5
 XAPP_XCLIPBOARD_SOURCE = xclipboard-$(XAPP_XCLIPBOARD_VERSION).tar.xz
-XAPP_XCLIPBOARD_SITE = https://xorg.freedesktop.org/releases/individual/app
+XAPP_XCLIPBOARD_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XCLIPBOARD_LICENSE = MIT
 XAPP_XCLIPBOARD_LICENSE_FILES = COPYING
 XAPP_XCLIPBOARD_DEPENDENCIES = xlib_libXaw xlib_libXmu xlib_libXt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
