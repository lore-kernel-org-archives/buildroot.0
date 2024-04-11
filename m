Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2065FC001CC
	for <buildroot@archiver.kernel.org>; Thu, 11 Apr 2024 21:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E468D60652;
	Thu, 11 Apr 2024 21:01:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oktegsf2NWvq; Thu, 11 Apr 2024 21:01:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8BA2608DC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8BA2608DC;
	Thu, 11 Apr 2024 21:01:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 26CE61BF983
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 21:01:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11CA441F2E
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 21:01:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eW40g6lLCiTw for <buildroot@lists.busybox.net>;
 Thu, 11 Apr 2024 21:01:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B0A4C41F21
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0A4C41F21
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B0A4C41F21
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 21:01:36 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1baba.dip0.t-ipconnect.de [84.161.186.186])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D995BA4C3057;
 Thu, 11 Apr 2024 23:01:34 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52100)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rv1Y6-000000001GD-0GeQ;
 Thu, 11 Apr 2024 21:01:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 11 Apr 2024 23:01:34 +0200
Message-Id: <20240411210134.2127917-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1712869294;
 bh=kEpOQhHOAkp1DGYg16+c+Zy65q0uAAmPhH7TvD5cZuQ=;
 h=From:To:Cc:Subject:Date:From;
 b=MGBoTCJC+aYvf0HFlaZ20YcK+tgSBSE1ttqPyse0N9GwUBc6YsbB4gMTwTVkEf0hl
 jGtoBZBO6aGFL9C+e9rreB9Ujy4bWzrcRC43fuc+4we8QZCwyPr0df+c0QwX3aTlEh
 cPQrJeA/EOAXe/QMzf8Vntg+/Z7f18a3A6bb9xcoMgKJZVCQFWB7eyFda+ytGWKuSl
 sOGRe1qjMA53enlqfhupv01E4hiLjaHjX7Jwz4xmh+KHPcFHk8SNFLejHrLlXr73gC
 vGxst0YbPcbZXxSLSDHuoQE0/wv9OmmjT9C70Tb2UQUaF9cKR7Jh+e7qOAiAY/snzJ
 dTRcJBT2hsV7w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=MGBoTCJC
Subject: [Buildroot] [PATCH] package/libmicrohttpd: bump version to 1.0.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Will Newton <will.newton@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://lists.gnu.org/archive/html/info-gnu/2024-02/msg00000.html
https://lists.gnu.org/archive/html/info-gnu/2024-02/msg00003.html

Changelog: https://git.gnunet.org/libmicrohttpd.git/tree/ChangeLog

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libmicrohttpd/libmicrohttpd.hash | 2 +-
 package/libmicrohttpd/libmicrohttpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmicrohttpd/libmicrohttpd.hash b/package/libmicrohttpd/libmicrohttpd.hash
index a4c8fbca5b..f1b3f8b7d8 100644
--- a/package/libmicrohttpd/libmicrohttpd.hash
+++ b/package/libmicrohttpd/libmicrohttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9e7023a151120060d2806a6ea4c13ca9933ece4eacfc5c9464d20edddb76b0a0  libmicrohttpd-0.9.77.tar.gz
+sha256  a89e09fc9b4de34dde19f4fcb4faaa1ce10299b9908db1132bbfa1de47882b94  libmicrohttpd-1.0.1.tar.gz
 sha256  7399547209438c93f9b90297954698773d4846cea44cde5ca982c84c45952a3b  COPYING
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index 72b2bbafd8..6998ffd1ae 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMICROHTTPD_VERSION = 0.9.77
+LIBMICROHTTPD_VERSION = 1.0.1
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_CPE_ID_VENDOR = gnu
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
