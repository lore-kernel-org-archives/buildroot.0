Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4AEEEA7941
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 19:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46CAE8063D;
	Wed,  4 Feb 2026 19:05:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ch82hxlYbN2w; Wed,  4 Feb 2026 19:05:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57F0C80C98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770231908;
	bh=80c1Mm9pNFmtuadv5D+kS+BsifylF9ZtogX3+nwZ4B4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QTwnntIJ9iPKDcrqBBTTEon6tP7tp+w2FkcUiCGcOhxkfH5ogJf4e5tCC7pSulegK
	 NqlrazQBbWKQ5SrnFFpYTvUp14MQpZl+VpLmSceeyYtEcqFygWfcqYX1VwLdBi+xS6
	 aPVsF/t1xj+MB+e6k91XwsJVPx50uMHy2cBRUiaf2qzP7GfFtaqrRE/IKmJRAIcjF5
	 xC8eKNfKyb1ywlluqHO5vAeVL8KSsqdoPLiClfP8t2ZB+qS7iPk92BUjC3c5DsYv5U
	 Y4griZS82y9okM+BGFApsyZedYCXHiYVkRWk16XJ11O/2NserJh0LyC/Pmd6XuKnCy
	 m8L5/DKqIrYFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57F0C80C98;
	Wed,  4 Feb 2026 19:05:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1275F17A
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 19:05:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E75358063D
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 19:05:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uI57-yQ32Rhh for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 19:05:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9E3AB81095
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E3AB81095
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9E3AB81095
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 19:05:05 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0ed3.dip0.t-ipconnect.de [91.58.14.211])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EF278A4C5880;
 Wed,  4 Feb 2026 19:59:26 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60334)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vni62-000000004qh-3VL2;
 Wed, 04 Feb 2026 18:59:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>
Date: Wed,  4 Feb 2026 19:59:26 +0100
Message-ID: <20260204185926.1073422-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1770231567;
 bh=rEeV/EcYROmr/ToAGFAjPrPfVkZUITQk1wMerRYvY+Y=;
 h=From:To:Cc:Subject:Date:From;
 b=sZx4WEPh7nB8UeSnu4EHQTL14eHo4aN9vy3jAbl33hKGP+WqlT2NdCZhE8wGfob31
 pM5TdyVShAiTbvQRoqDP46U3I0hZUUzXZAKi+0XMsUqDPwCd2g6HlQEmmQy+C+QkO2
 ZqHRMg+M/tcWecZOIc5p+hjgCINiH4RZRPZ35rjp3UVkOjkG/wCWSyhBt/IzNAx65t
 ZBWdcqJLR1zdWdSNOYt4/tFk1XFNrCaVnuqxs6JAiCBsGu9PEBf38YEEpejtIr+09V
 fZIF7C1oAKiawKDGO0+p5YK2sNqV5f6+7jrBRfGl3WRnLrjKRas5ecwXS9HeNoqhUm
 zOv2mYp5NPDOA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=sZx4WEPh
Subject: [Buildroot] [PATCH 1/1] package/mpd: bump version to 0.24.8
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

https://www.musicpd.org/news/2026/01/mpd-0-24-8-released/
https://raw.githubusercontent.com/MusicPlayerDaemon/MPD/v0.24.8/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mpd/mpd.hash | 2 +-
 package/mpd/mpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index afdb66324c..91995c5b4d 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  47c4f146f39a09979ca65d232063d7df566b101c5b36ca8895083f9f278b0460  mpd-0.24.7.tar.xz
+sha256  1868aded6aabe6a02a6427ef1d3856b11370612afc53d28184533db53991d2f7  mpd-0.24.8.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index f54dd58cde..94decd8460 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.24
-MPD_VERSION = $(MPD_VERSION_MAJOR).7
+MPD_VERSION = $(MPD_VERSION_MAJOR).8
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = https://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf fmt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
