Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 328DDEA719A
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 13:16:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5CA660903;
	Sun, 19 Apr 2026 13:16:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j6OKib03BHHZ; Sun, 19 Apr 2026 13:16:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D022960F0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776604560;
	bh=4sdmbNmsDAshcLQftvdowOev5Cb5ZfAl6mu+11bsDKE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=K7eW5EL+4/ab4qxGhDeiBf74k92us27czx5we6dZghYKeTes+KXd08zMRfqr2t7ZA
	 44KlQSoMqqB+bDigV4nKrl2ZBy9j4k9P+ppZn7+AMIPSjdK5jerY6OI9MzODiZfSQ8
	 8KYIfO/P9bjiN74ThqEVsHP/M6hHW0G11RgcbAO4R6b3V0FH3weIZNkolQ7mHju1tY
	 fKagTahRVYAa9aekDmp9TzoWeXk8Siphjf5Ob90xd8882IZdmhaGIjJ7UKafThwLfz
	 VoCd1I/V5aQIuZ/MTnZy/Mt57L8Vutpceckai+plldHefjHOV2f+NK9xbMuAvrvMBO
	 V5wW4rqfrAzpg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D022960F0C;
	Sun, 19 Apr 2026 13:16:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B9C4624D
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 13:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A024E40457
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 13:15:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nS7Z1JHrl5oj for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 13:15:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EE1A9403D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE1A9403D8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EE1A9403D8
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 13:15:57 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc94.dip0.t-ipconnect.de [79.214.204.148])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8E4D9A4C356B
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 15:15:54 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51922)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wES0A-000000001CC-0qyN
 for buildroot@buildroot.org; Sun, 19 Apr 2026 13:15:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 19 Apr 2026 15:15:54 +0200
Message-ID: <20260419131554.2952082-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776604554;
 bh=xeOoM+XXJkbO/7kBm7yAaWgGXPrFMHlB5iOwZ/Yr3ZE=;
 h=From:To:Subject:Date:From;
 b=BSy961tXoq6VBLTbDQUNOTIPt98gn1PNd7MUzq8/j/UwwJ2R067m2fEC6zX6NRUVY
 jzo/tTkOfjMaIZRz9QhZEd7v3+XNxBgutnDwWQJ8QG1UzeufqdpL/WEmyA7rOYDQ0u
 nRFK9GKemGvyVkBqmMz/fCozL3gWvdcY47WtgnlQ7y2Q5Bjieuaj8XQr2K+XmOVG07
 IE7N81nhsJb8JZPLCrIOTXQMKeHqZG3wNXOAgm/Ii4SiY7h4U1DcVbXdbpEdTzFIlF
 oyU2kFcHo9i9kBrLajPQMv02Zi62Ej3s8hZdvM/giFJSw5baK1f4YKirZ0/hG3lqAn
 ujg+ktpshIpAg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=BSy961tX
Subject: [Buildroot] [PATCH 1/1] package/proftpd: bump version to 1.3.9
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

https://github.com/proftpd/proftpd/tree/1.3.9/RELEASE_NOTES

Removed fix for gcc 15.x added by buildroot commit
c53f5e78fcd0c6af9174c76d381a44aa48fb4f24.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/proftpd/proftpd.hash |  2 +-
 package/proftpd/proftpd.mk   | 10 +---------
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/package/proftpd/proftpd.hash b/package/proftpd/proftpd.hash
index 88b5906945..482534fb1c 100644
--- a/package/proftpd/proftpd.hash
+++ b/package/proftpd/proftpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  42ba40d8d5a5a9f28c9dcd7f15aa6b5368fe5efceaacb999041311b170f076d5  proftpd-1.3.8d.tar.gz
+sha256  4a5f13b666226813b4da0ade34535d325e204ab16cf8008c7353b1b5a972f74b  proftpd-1.3.9.tar.gz
 sha256  391a473d755c29b5326fb726326ff3c37e42512f53a8f5789fc310232150bf80  COPYING
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index d450489cb0..a30c46ee27 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROFTPD_VERSION = 1.3.8d
+PROFTPD_VERSION = 1.3.9
 PROFTPD_SITE = https://github.com/proftpd/proftpd/archive/v$(PROFTPD_VERSION)
 PROFTPD_LICENSE = GPL-2.0+
 PROFTPD_LICENSE_FILES = COPYING
@@ -27,14 +27,6 @@ PROFTPD_CONF_OPTS = \
 	--with-gnu-ld \
 	--without-openssl-cmdline
 
-# source code contains a number of variables named 'bool', which
-# conflicts with the C23 keyword. Fixed upstream in 1.3.9 with
-# https://github.com/proftpd/proftpd/commit/61be7eb14f200b97804a3cfa85fed51661067c62
-# so can be dropped when bumping to that
-ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_15),y)
-PROFTPD_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=gnu18"
-endif
-
 ifeq ($(BR2_PACKAGE_LIBIDN2),y)
 PROFTPD_DEPENDENCIES += libidn2
 endif
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
