Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A60AC61DE8
	for <buildroot@archiver.kernel.org>; Sun, 30 Aug 2026 22:16:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7A1C809B5;
	Sun, 30 Aug 2026 22:16:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LvOKeUx4ffcb; Sun, 30 Aug 2026 22:16:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788128173;
	bh=GyyWYQ7X+uIjGSZYrIRd9p3DDj5NwyEaSuIS/NdjEeE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SwqGMA3teUlntfQg5BiOSAJ9W3HBQMi91QTgH4sAEjxW1YPP/XTeY4EAOVHCibbU+
	 0NN46/P944TSmAN5ft3SteAi3nNOuvgllrLBgc36/eM3tS5EZJNtdiwPWM5y390YU8
	 1znNaLfTFHDV87YVMLQUOTJrccfK90jIhvXbDH91WbEp9x1xaRaBxfkCNyQlDADK3f
	 ADckDV9yWrwVVKghzX6TJFVOzDhz/ecUU7R5kKAz5N41+TgdjDyUa3tqIzvV5CuKLl
	 41bDQGuVS3/z8T+X018AArdHeGOztAW7rkIMvs7Aejgk1v4c5iWEagC70BQf4MzU79
	 EVCCJfFcGaUCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DA61808D2;
	Sun, 30 Aug 2026 22:16:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 33278334
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 22:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 193F540074
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 22:16:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yG8v97_FkAyI for <buildroot@buildroot.org>;
 Sun, 30 Aug 2026 22:16:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=U764vZHT
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 58E7C40050
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 22:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788128166;
 bh=YqIYdxVYRKqA/K5oyz6YnuakpnCj6KOSpKOBe0B+26M=;
 h=From:To:Subject:Date:From;
 b=U764vZHTWX/ksT6vptvWMUnSHm4JtnB+hbrNGJWA3dDQoifC84h8bbOAZRSLc3JBL
 S3hq2GijkYVocFLncleaPemJDXIyct5RI3TlutYaqoYvSSiD2F6sNQiQ1bwYpck+1v
 f/Shv81IAtz4rd86uZkg0nhybuq7J9v0bbngRVa7aknSPwjIA8yXLaNbucCbfeE3Zu
 lezJ2Xs30P7TNe4Di93Ys8f6mAhgTNhGyuo8Loq9oRWpPQr2N3QS34m1ebmGhp2eKc
 SgXaY/KFZiRS9NSdaizD0N0gkBc79bQdOwN8IJZaQdOz2fyyDgmRwZ5t4pREMCpbF4
 Is1u6AoUbSfIw==
Received: from fli4l.lan.fli4l (p54a1b089.dip0.t-ipconnect.de [84.161.176.137])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 63FECA4C060D
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 00:16:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38810)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x0nor-000000008Ja-3o0g
 for buildroot@buildroot.org; Sun, 30 Aug 2026 22:16:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 31 Aug 2026 00:16:06 +0200
Message-ID: <20260830221606.33953-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/proftpd: security bump version to
 1.3.9d
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

https://github.com/proftpd/proftpd/blob/v1.3.9d/NEWS

Version 1.3.9b fixes CVE-2026-44331.

Switched to sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/proftpd/proftpd.hash | 3 ++-
 package/proftpd/proftpd.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/proftpd/proftpd.hash b/package/proftpd/proftpd.hash
index 9ec632884c..1c81240d81 100644
--- a/package/proftpd/proftpd.hash
+++ b/package/proftpd/proftpd.hash
@@ -1,3 +1,4 @@
+# From https://github.com/proftpd/proftpd/releases/download/v1.3.9d/proftpd-1.3.9d.tar.gz.sha256
+sha256  68b094b1c57c775ad00ef469e9a87783dbbf31a85f98f48faf60becc2e84e4ec  proftpd-1.3.9d.tar.gz
 # Locally calculated
-sha256  bc3c7c47033ecff29f010efc18315d5906eb942d2e673ebce0138a96f11af0b4  proftpd-1.3.9a.tar.gz
 sha256  391a473d755c29b5326fb726326ff3c37e42512f53a8f5789fc310232150bf80  COPYING
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index ba026f5dd1..e3216ed802 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROFTPD_VERSION = 1.3.9a
+PROFTPD_VERSION = 1.3.9d
 PROFTPD_SITE = https://github.com/proftpd/proftpd/archive/v$(PROFTPD_VERSION)
 PROFTPD_LICENSE = GPL-2.0+
 PROFTPD_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
