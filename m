Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5652AD25044
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:07:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DCA48429C;
	Mon, 12 Jan 2026 08:07:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MdHEGzznE5XC; Mon, 12 Jan 2026 08:07:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44FAD843C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205250;
	bh=pSAJmnPHlrjcEw8nwLERD6wjrhSTUgGcoueXdWAtD18=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GGzXGDQCrrNreVcchZsZOPUuCN8mBAN7uzIXRk0gK13E/3odM/x7xYq7/FVLh4Je6
	 kLK9roG6WKGxHWcMGVOpst91StDb3EY6UjS+LhUE2ZWxeepVWeEvM+nfO65awoTarT
	 GFEU1Wr8HZWZNN/D0rRHvAjHSZ65UavuyVHRCbZFN3Yfu//mESwiG5iAsHOI/a8eyR
	 SnrYOunE7v2wEh6Hw8xF3vx4o9upjDdZWL0eLgTdXeOW1WgaJhGszzKm3wJkwbVMuI
	 1iSPgMoiSSJ5gMxe8dqczY+yK0cpdQGK+3CdN8XK2FGNE/Wn9VN1caDUF7u/AAfZ7p
	 0psDAD68jKAgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44FAD843C7;
	Mon, 12 Jan 2026 08:07:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4169F18D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:07:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 271D9614C3
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:07:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T6PObAqCkiay for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:07:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 136FD61484
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 136FD61484
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 136FD61484
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:07:27 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 216AFA4C42DE
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:04:55 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuY-000000003M6-48tl
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:03:39 +0100
Message-ID: <20260112080419.2516889-64-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205095;
 bh=alv+eHDzR/y+btUJWcIg/fx3R4zRkhKXOsqbB5h6KTs=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=h5r2vFpMg1jLcYB0JI10CsYfqTj0DqKG0InWI1ZF8PDwApQrmj+0/k1I/dpYcmtAj
 wET2WHsZSJz/7i+jet2+cBZocWNXIBV9Qz7eLFO/r/auDuO73VSluZPKqWPCzjkHl+
 7F7hQqcur2OKoNL9CLxbsU8VVhFWrnpEUTLYc49MHe6yvCXsexw+MgbwDR7bO6oeak
 IPv4rcfuMTLLG74CksPjXjCI4CvSbH2D0BUc8Z8i/0RpxlfEQig1NQdVJjuIxDdoqI
 PUAOWBLnhi2nF7umfIK9lvO+bcPO01nrQ37DTENlla8/EORtXgLmPzKrYhW/ahsyk8
 WbxWJ1uJ2VWIw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=h5r2vFpM
Subject: [Buildroot] [PATCH 064/104] package/x11r7/xlib_libFS: bump version
 to 1.0.10
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

https://lists.x.org/archives/xorg-announce/2024-August/003524.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xlib_libFS/xlib_libFS.hash | 6 +++---
 package/x11r7/xlib_libFS/xlib_libFS.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libFS/xlib_libFS.hash b/package/x11r7/xlib_libFS/xlib_libFS.hash
index 6ca152ac4a..e88e77b2ce 100644
--- a/package/x11r7/xlib_libFS/xlib_libFS.hash
+++ b/package/x11r7/xlib_libFS/xlib_libFS.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-August/003200.html
-sha256  597379438b3242ccc7d7b0fc432dc6c844eca0d4a82a7b82518bfeb203fc208a  libFS-1.0.9.tar.xz
-sha512  7d012e62736c6d567931bad982eec221199d296f0fe41e1e7fde5575b8b928e9a8c644aa8746242bdfe72393635320b58774d9a519285765bd26d633588092b8  libFS-1.0.9.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-August/003524.html
+sha256  9babbd3c86069c98563da044045fdc0ece4ec0c93dcdd2c68aa74eb34b4f3b77  libFS-1.0.10.tar.xz
+sha512  f4dc361b7e1dcc1f348ea86e96c5a60ff40c5168b6097f00d8a5db2b86d089cfca12ac13dbde5ce3b53279b7eb8773ed6dcd9c678c2e95363ffa5127ecaacee7  libFS-1.0.10.tar.xz
 # Locally computed
 sha256  5386724e7475b89394dd836b954a6688f875efab99e43e8eb7e8775f5b99a341  COPYING
diff --git a/package/x11r7/xlib_libFS/xlib_libFS.mk b/package/x11r7/xlib_libFS/xlib_libFS.mk
index 0fbf453ca4..1311c8df7a 100644
--- a/package/x11r7/xlib_libFS/xlib_libFS.mk
+++ b/package/x11r7/xlib_libFS/xlib_libFS.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBFS_VERSION = 1.0.9
+XLIB_LIBFS_VERSION = 1.0.10
 XLIB_LIBFS_SOURCE = libFS-$(XLIB_LIBFS_VERSION).tar.xz
 XLIB_LIBFS_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBFS_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
