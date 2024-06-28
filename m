Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0CEFC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 28 Jun 2024 16:48:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92B9441A6C;
	Fri, 28 Jun 2024 16:48:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GLbMkDR4F7k0; Fri, 28 Jun 2024 16:48:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DBF8415CD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DBF8415CD;
	Fri, 28 Jun 2024 16:48:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7DAAA1BF39D
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 16:48:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C180605D8
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 16:48:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gBFvjniPaIoW for <buildroot@lists.busybox.net>;
 Fri, 28 Jun 2024 16:48:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6B28B605A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B28B605A8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6B28B605A8
 for <buildroot@buildroot.org>; Fri, 28 Jun 2024 16:48:44 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cda5.dip0.t-ipconnect.de [79.214.205.165])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7B02BA4C0F39
 for <buildroot@buildroot.org>; Fri, 28 Jun 2024 18:48:25 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34592)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1sNEls-000000000HR-3bVP
 for buildroot@buildroot.org; Fri, 28 Jun 2024 16:48:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 28 Jun 2024 18:48:24 +0200
Message-Id: <20240628164824.11246-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240628164824.11246-1-bernd@kuhls.net>
References: <20240628164824.11246-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1719593305;
 bh=aTNWowyJGcUQGMW3syUq6JpdVIpSNC6M6FC4i+JPKxc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=YC+gs0ur9wzPNry+TvUhgD3Ew12oCmudUH6uoEcUBtY6Y6smFuxZa5ntrWFWk8yyE
 IY219HvI7H4AL26JnkE53OUExP8y11etl3lZGnw7O2/9Rv7m6hXLuy3Qo3+cEUcFQo
 d3KqX5p4O3QHOtazGwRCG4EkQ77pZ8Zx3lg5WRCf8/z6W+9DESFI6+92C2DnQyjiNc
 ZrrVfPGf444CUa/5AdjRGAy0Kq2RqFlFyS3NZlxvyc0I1QRJ9b6ijXJ3j/s3WntzKR
 4qE5LYhspiK3b8rlNy/JAeRPZX+KfHE0RKdeTQoY/2j28or4X8nJF2Wu65FWQoD6PE
 YfMDN2aHR2OaA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=YC+gs0ur
Subject: [Buildroot] [PATCH 2/2] package/libva-utils: bump version to 2.22.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://github.com/intel/libva-utils/blob/master/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libva-utils/libva-utils.hash | 2 +-
 package/libva-utils/libva-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libva-utils/libva-utils.hash b/package/libva-utils/libva-utils.hash
index 2c80435ca6..049781810a 100644
--- a/package/libva-utils/libva-utils.hash
+++ b/package/libva-utils/libva-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  15ca12bd11c7001c04af5079512754fea6ba8d79151b9f07908c99b27622714e  libva-utils-2.21.0.tar.gz
+sha256  7b57615c130427ec134bb5d2b80af516ce5bb19a40e89b1dab46a0d59760d96c  libva-utils-2.22.0.tar.gz
 sha256  c6220c9f87832c27abcb8a32eafdd2823e13ce146b3ea63d5deae2a76798ef50  COPYING
diff --git a/package/libva-utils/libva-utils.mk b/package/libva-utils/libva-utils.mk
index f58685e51b..0536f022d2 100644
--- a/package/libva-utils/libva-utils.mk
+++ b/package/libva-utils/libva-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_UTILS_VERSION = 2.21.0
+LIBVA_UTILS_VERSION = 2.22.0
 LIBVA_UTILS_SITE = $(call github,intel,libva-utils,$(LIBVA_UTILS_VERSION))
 LIBVA_UTILS_LICENSE = MIT
 LIBVA_UTILS_LICENSE_FILES = COPYING
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
