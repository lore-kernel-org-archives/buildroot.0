Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD684C3DA4A
	for <buildroot@archiver.kernel.org>; Sat, 27 Jul 2024 17:58:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92C7140571;
	Sat, 27 Jul 2024 17:58:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QajViPUdZwRN; Sat, 27 Jul 2024 17:58:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5680840625
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5680840625;
	Sat, 27 Jul 2024 17:58:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5189A1BF2FF
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 17:58:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A5A6810E6
 for <buildroot@lists.busybox.net>; Sat, 27 Jul 2024 17:58:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Wa-qSUvr1A4 for <buildroot@lists.busybox.net>;
 Sat, 27 Jul 2024 17:58:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 64F9E80E85
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64F9E80E85
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 64F9E80E85
 for <buildroot@buildroot.org>; Sat, 27 Jul 2024 17:58:07 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ce6c.dip0.t-ipconnect.de [79.214.206.108])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6EF2BA4C30D9
 for <buildroot@buildroot.org>; Sat, 27 Jul 2024 19:58:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47394)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1sXlgD-000000006FO-1LBS
 for buildroot@buildroot.org; Sat, 27 Jul 2024 17:58:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 27 Jul 2024 19:58:04 +0200
Message-Id: <20240727175805.1739987-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1722103085;
 bh=X2vlqRxYdIkc07BJG/mNWAqAMEqCY55kYFEWYX3mRqU=;
 h=From:To:Subject:Date:From;
 b=UYca7H4C9CLfCmk2EQW5ySxUBVjo1V7frs5SOBvezzFw716FmjCnNvGx/NtUBUczB
 YYO0NrA0Cp1ETFBkQStOCqY6DljJAWcKXso28NOPeVbUcs1i7gqCggPb1E4xMR9Byy
 YffVMxXFPunLrFxyPr6uQ6+J5T7U+54oUAA53Fwg5G2gN/zcwO6G2bz9rqcJUBODgI
 mJ9q7w/tR9x5lCGS/T45IBpHiLNk3NT+EQEoZwEN42emvioa+GwgpGUA4gLZcbxvHw
 8+yC09jtrldJBSbs8oDGNuqCXPlCinGaBBatyFq4ls+kqp0gZpOGuY55li4nxSeRbp
 pMUuon8BzcFYg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=UYca7H4C
Subject: [Buildroot] [PATCH 1/2] package/libks: bump version to 2.0.5
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libks/libks.hash | 2 +-
 package/libks/libks.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libks/libks.hash b/package/libks/libks.hash
index f66798699f..de16d0b029 100644
--- a/package/libks/libks.hash
+++ b/package/libks/libks.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  af94f9fcdb2022b8f09187309ac2d372a5a4cc639af77cd4375f2d5c88b4fd63  libks-2.0.2.tar.gz
+sha256  8525dd943cf970c860cd2596207c7ba6646c9e1f407e350fc0a39b76af75e625  libks-2.0.5.tar.gz
 sha256  3aba376a08bf91c95518532e627157f0ee3ab2712d1198463e2b1ac9186dd142  copyright
diff --git a/package/libks/libks.mk b/package/libks/libks.mk
index c8bcb30961..2de6b727dd 100644
--- a/package/libks/libks.mk
+++ b/package/libks/libks.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBKS_VERSION = 2.0.2
+LIBKS_VERSION = 2.0.5
 LIBKS_SITE = $(call github,signalwire,libks,v$(LIBKS_VERSION))
 LIBKS_LICENSE = MIT
 LIBKS_LICENSE_FILES = copyright
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
