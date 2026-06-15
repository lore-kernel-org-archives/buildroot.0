Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C77CD98CF
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 18:29:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A277B614BA;
	Mon, 15 Jun 2026 18:29:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eA6jc63zNfwJ; Mon, 15 Jun 2026 18:29:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D205A614B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781548176;
	bh=5e627ld9zxVgCxsPhT2ozP3NSOsY+gvFzItgoCVQ1No=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gDx/dr1iqZ+8p6htKiOj/CI/ru20aBcR0x/8mTJpJnIi3AD/DrOsuzEPsCrIU7eTm
	 FG2WKsIwP19dRgUGxJJJTm0pSFTHoFAeAX1Is0WhtP1S/X1ly3GB0tlrQBQGnaL+fQ
	 I+MaN6RfqI1WTGA27MuyeHwCIFuCi4VjtHrYqHBCEk2y7KTOmjgaNT505n0AOoAbiF
	 zsldkvYdhnXpB8ooTv+s34qvl0ig9fG/ag5Y3xbeQ6++BziyNQxwhsy/Ta7ztrUfYZ
	 FLX5YvpinKghRQDYQyHyOFwMAHdHNUxUfnNakbJDOZukMC2mee90Mz+jEHJMSSiBKX
	 BBIw0KxCmHOFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D205A614B3;
	Mon, 15 Jun 2026 18:29:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C2A4C2F3
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 18:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B4951614B6
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 18:29:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D6y0MiJN0JUa for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 18:29:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8711E606EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8711E606EE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8711E606EE
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 18:29:33 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a04de.dip0.t-ipconnect.de [91.58.4.222])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 57DEDA4C339B
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:29:16 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50112)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wZC3g-000000006g5-05Lg
 for buildroot@buildroot.org; Mon, 15 Jun 2026 18:29:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 15 Jun 2026 20:29:14 +0200
Message-ID: <20260615182915.1888004-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260615182915.1888004-1-bernd@kuhls.net>
References: <20260615182915.1888004-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1781548156;
 bh=COgqPvmsHkdS3avSvPr8fyGKWTzF6+ElIgc8dqSIkrY=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=SCBhdHuOHBkhxUEkZ/j6bHdfFZmsb0jjhDzLrS/Fw+1G/2Jq1AntYj149h7AWUF6Q
 1VmYp2vi27lm7Egtsg634we+9256XJ/5pU5Ew3VrFepU2bCk/aHJO4F9KvLB/nXNbm
 mlfgXqNY4RmZLmPY/vnMURsZdv7GgD78cETFDLAxm6blX5Gj3AR8lK4FVO9UbT0A2j
 iu/Ox3x9VQ8nHJYQSZDSHNr07hCNsYldT+a0qH92zhAw7zrPkx/h+pc0Ybakh7XgHm
 O5ZFnROqxXPRNeygirgRbNfvkwgdpB7J6BpK21Y7TDKb2NZxmCGk/G68MVpHRaMitQ
 d/eH1WRnSQ7BA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=SCBhdHuO
Subject: [Buildroot] [PATCH 3/4] package/kodi-pvr-zattoo: bump version to
 21.0.7-Omega
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/ad40439fbf81d306cc35d33bf35e93c320dbefa8

 package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash | 2 +-
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
index ecec000e3d..8b5509d947 100644
--- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
+++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f6df1fa29ec3778f591281f57190099bf5a510c293c711ea978497556765352f  kodi-pvr-zattoo-21.0.6-Omega.tar.gz
+sha256  d57efceff2f451cc8864d429abed6c7d808ea5092fddf3ece3f598d4a5e26b1f  kodi-pvr-zattoo-21.0.7-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
index 2de33b26b5..12d2d5ff09 100644
--- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
+++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_ZATTOO_VERSION = 21.0.6-Omega
+KODI_PVR_ZATTOO_VERSION = 21.0.7-Omega
 KODI_PVR_ZATTOO_SITE = $(call github,rbuehlma,pvr.zattoo,$(KODI_PVR_ZATTOO_VERSION))
 KODI_PVR_ZATTOO_LICENSE = GPL-2.0+
 KODI_PVR_ZATTOO_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
