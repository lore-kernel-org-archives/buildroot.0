Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F29F55100
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 16:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B03EA83E9E;
	Sat,  7 Mar 2026 16:06:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BZLXswEEpLRK; Sat,  7 Mar 2026 16:06:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 202BE83D47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772899568;
	bh=maAOuD3N++K3OkFeCRH4dUKF+Kn77f6+Xpd7om7G+ZM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iZlsdeTadmyeytNH3Hrvo7iXWa9sMGXVyETSJ+UOPD9Rsd7v7G4tlTTn5KYij6BSK
	 2HusbNSEfhWbrMI5/+wqAqyRrA2fBV8gjqwHG3uPpYVzn5MxF1p9W+ZeWqaqpgyONP
	 Iytpcx2/sd5pLylFIuQ5Mx8yy3q4cwDWj/hX87uJbQPWFQxqFFrz50RivRECBNbOt8
	 NM8+cI4KDwQKtkmIGUTHhCs6tE22BWpSWD8HZ9wETBfN9/Z4Jgmxq+M3Cb1B3czS5h
	 TP+un8iKj7uuNs5hY5nY6cmJsvtJ49suZkhR5ZPqdv26emx2V593X/N8nYW+DIvcHZ
	 nzI0znMJ9iuzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 202BE83D47;
	Sat,  7 Mar 2026 16:06:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3DAE6169
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 16:06:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B2F183D80
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 16:06:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8y-aNG1bj0ch for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 16:06:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9ABBD83D73
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9ABBD83D73
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9ABBD83D73
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 16:06:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc67.dip0.t-ipconnect.de [84.161.188.103])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BEE12A4C373C;
 Sat,  7 Mar 2026 17:06:00 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35516)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vyuAC-000000004Ne-1tuW;
 Sat, 07 Mar 2026 16:06:00 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Philipp Richter <richterphilipp.pops@gmail.com>
Date: Sat,  7 Mar 2026 17:06:00 +0100
Message-ID: <20260307160600.2249410-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772899560;
 bh=G6zvYwSM0lne222gALxNMpM0ziZjlDQDZ6QtxF9J1b0=;
 h=From:To:Cc:Subject:Date:From;
 b=ijrWNpW34QRe8VuVfdxExrsgJdqTUbfUiSJK3wV56TsNE7NFqUu1i+rw6l0Ww5RsD
 AS28159hss/oSJ04SQsf7WWOpjvucq9zlK21HfzrQ1XDSYRPVqDO2hoT0KpkMeDtwd
 ayk/D6LTTnD4O5AM4d0wRHzS9+J182gJ1CcNFuE7BBfWRKt3f24ZcYIX6neyNvBmDw
 GVkBsUhKUtBNbmdGNe5tK1uPqeDMosh7Cx6jUum+5UWqLe1/Sd6u71PIWV9miuzXOx
 ijHMFMxXoBfvsN5VNcDBbs6DIddvFdDFZ8FGfmoRZlRRi6giVlVa4XtiWaRrgHPNQh
 xbgU1nP4l9Qsw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=ijrWNpW3
Subject: [Buildroot] [PATCH 1/1] package/libtorrent-rasterbar: bump version
 to 1.2.20
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

https://github.com/arvidn/libtorrent/releases/tag/v1.2.20

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libtorrent-rasterbar/libtorrent-rasterbar.hash | 2 +-
 package/libtorrent-rasterbar/libtorrent-rasterbar.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libtorrent-rasterbar/libtorrent-rasterbar.hash b/package/libtorrent-rasterbar/libtorrent-rasterbar.hash
index b1abe85d84..6b6175d9de 100644
--- a/package/libtorrent-rasterbar/libtorrent-rasterbar.hash
+++ b/package/libtorrent-rasterbar/libtorrent-rasterbar.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  eee8e99548dc5eb5e643e49db9202f4f97112c032dba883dfdc8144af5b6e40e  libtorrent-rasterbar-1.2.19.tar.gz
+sha256  ccbf8e8c21dc81635de95166b498922b4725f9725a23b2cfe2a6b2fead6fb9fc  libtorrent-rasterbar-1.2.20.tar.gz
 sha256  f3a5dd1558cce616b12edad521427ec8976ce2bb0af33f7f359cfa648bf55ad8  COPYING
diff --git a/package/libtorrent-rasterbar/libtorrent-rasterbar.mk b/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
index e95877d28d..1d86abaa84 100644
--- a/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
+++ b/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTORRENT_RASTERBAR_VERSION = 1.2.19
+LIBTORRENT_RASTERBAR_VERSION = 1.2.20
 LIBTORRENT_RASTERBAR_SITE = \
 	https://github.com/arvidn/libtorrent/releases/download/v$(LIBTORRENT_RASTERBAR_VERSION)
 LIBTORRENT_RASTERBAR_LICENSE = BSD-3-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
