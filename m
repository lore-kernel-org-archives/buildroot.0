Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB94C3DA7F
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 19:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B13B405BA;
	Mon,  5 Aug 2024 19:06:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d0Ud4b4CydDU; Mon,  5 Aug 2024 19:06:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C38F9405D9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C38F9405D9;
	Mon,  5 Aug 2024 19:06:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 506E21BF34A
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 19:06:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4AC996078C
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 19:06:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ses172XQLp3N for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 19:06:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8334560712
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8334560712
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8334560712
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 19:06:31 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bad7.dip0.t-ipconnect.de [84.161.186.215])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8B576A4C03FE;
 Mon,  5 Aug 2024 21:06:28 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40404)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1sb32J-000000008Mq-1ODS;
 Mon, 05 Aug 2024 19:06:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  5 Aug 2024 21:06:27 +0200
Message-Id: <20240805190627.3410877-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1722884788;
 bh=STWBdmqiFZuxX/4NVf2tTuHDrAdnXjXHCp++sQbSivM=;
 h=From:To:Cc:Subject:Date:From;
 b=V6HUC4n85tjUdhIRUhHVHEk8rvRcoZaJeZ2aQ8UtKHDPWwS4OMxM+Xjfa4IgwOYHC
 z0U095EIYt5oGknXXAiFDgc97vw5Vo965rPo4bQQRn3Bfg0rEZSwCcu5hC1ry/UM6n
 D+YCpYPq7mTHuB8C4cJaa7IBO3blcI5cDcyb6JAsLRsfadOn8gqgFbBRcWdnCn/IR3
 D9hlaiqnxPvR261zsSFpWFkoDqV300t41dmH5+tbCB1fAh6H30P5aM0tWFuHG+ytxs
 jtFuss6IgEXYv/lI1JW9ZWPcMW0zZC0Y3T+a0IB6a3yZYVwpYABxJxlF0AyO8V22+C
 mc1e5HzwnNpew==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=V6HUC4n8
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: bump version
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This bump adds support for ffmpeg 7.x.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/tvheadend/tvheadend.hash | 2 +-
 package/tvheadend/tvheadend.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index f0140aefdc..871fc9ca01 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b613319b01db2f7e08f735dd1da318041265a6f44b435491f3e8b0e32efd6d2f  tvheadend-b774bdd25351e51eba0282ccf7c65904dc1b5655.tar.gz
+sha256  192cf8d181eb03cbf18e4fd4beb16edf89ef34aa25bc1c73c891bc904342aade  tvheadend-078a822cf548b37bc474475fa57e48e9604090ee.tar.gz
 sha256  16aaf037a2d00e6e7804de64619887fc7539f1ede99e3282c86dfbc61c2af63e  LICENSE.md
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 46a082838f..ee82ecb1e6 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = b774bdd25351e51eba0282ccf7c65904dc1b5655
+TVHEADEND_VERSION = 078a822cf548b37bc474475fa57e48e9604090ee
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPL-3.0+
 TVHEADEND_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
