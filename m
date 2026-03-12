Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE2E106ACCB
	for <buildroot@archiver.kernel.org>; Thu, 12 Mar 2026 16:39:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6286784DDE;
	Thu, 12 Mar 2026 16:39:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AaFk_CXoAhuQ; Thu, 12 Mar 2026 16:39:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 256AB84BAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773333571;
	bh=RmlXQR8W84FINtaZntSoeZSqA68iPLZpaFd62zfjkJ4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WRVXoIZ6IiI6/beGzo/2hpLaGb4xd1JsutsNJgEwBYfuroN/mqL6g7dRfFZ9XA5bU
	 FLzs0CEdprp/0hhv8vOqvLVgBYIoMs2MmZdBFpkduiA5rc9UKEqof/rTwzB26k2XAj
	 YkLY8EnJKj93vDtF5CEvE8vRLBkdP/EuZ22hkfJXCfl4jHqzQfSfS/qvs+twqPaJcZ
	 5J+PMavGfhXDPteOlUOdl3Eo7m5T/3mw+9jeBoGtshoJijGlSZB5oRqHzQkK87GAQM
	 k3B4k243PNkpB17PFJ5jbgxBROV4vs6xUWdbRTZgez5WvL8RmVqLwJ93dhyUiL7Pxq
	 tPMJLLJw3B80Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 256AB84BAA;
	Thu, 12 Mar 2026 16:39:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C961201
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 16:39:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 526D46EAA1
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 16:39:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J_ReKRyWGosA for <buildroot@buildroot.org>;
 Thu, 12 Mar 2026 16:39:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4274B6EA49
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4274B6EA49
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4274B6EA49
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 16:39:28 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0199.dip0.t-ipconnect.de [91.58.1.153])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 68C01A4C066D;
 Thu, 12 Mar 2026 17:39:26 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59134)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w0j4I-000000003HS-1s41;
 Thu, 12 Mar 2026 16:39:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Date: Thu, 12 Mar 2026 17:39:26 +0100
Message-ID: <20260312163926.3178494-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773333566;
 bh=2M2Ofw4c9it06xu14rjEMf0WLGg2oLeyHVBTFcgAeD4=;
 h=From:To:Cc:Subject:Date:From;
 b=p2jiybHcu1UgHdddYhALjdftBRnc6XZj0T1BO5ynyDbgvrTIBO7sdUO7WKIYVBpGW
 28hferWhAb64CydVXRzVjfnYg/PqJWypFWMiDlN3iQostbyh1xx5Vmr6zRT5sLJ/AW
 tFB3+DYZaNIZ5mSatXCimK3tF7bY7SYBs4XuNS4PUFBNyoqdKUK2YF2kYwGfS6Oo/f
 8a5ng7gSPaXgMbxZyWNbFGTwXkqEvV+dgBvnR44fQPzUkoDjDssIzzcGVx07T6Fbat
 yEJRzxGYp9GwSzleN2zksAVPMLk82pCok5eImLldxXMe5wYG3tQMc5o3CvC8ilOy9b
 xKbn6LQEWJwqA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=p2jiybHc
Subject: [Buildroot] [PATCH 1/1] package/libarchive: security bump version
 to 3.8.6
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

https://github.com/libarchive/libarchive/releases/tag/v3.8.6
"Libarchive 3.8.6 is a security and bugfix release."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libarchive/libarchive.hash | 6 +++---
 package/libarchive/libarchive.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
index db7ed95bd9..be357183e2 100644
--- a/package/libarchive/libarchive.hash
+++ b/package/libarchive/libarchive.hash
@@ -1,6 +1,6 @@
-# From https://github.com/libarchive/libarchive/releases/tag/v3.8.5
+# From https://github.com/libarchive/libarchive/releases/tag/v3.8.6
 # After verifying the pgp signature from:
-# https://www.libarchive.de/downloads/libarchive-3.8.5.tar.xz.asc
-sha256  d68068e74beee3a0ec0dd04aee9037d5757fcc651591a6dcf1b6d542fb15a703  libarchive-3.8.5.tar.xz
+# https://www.libarchive.de/downloads/libarchive-3.8.6.tar.xz.asc
+sha256  8ac57c1f5e99550948d1fe755c806d26026e71827da228f36bef24527e372e6f  libarchive-3.8.6.tar.xz
 # Locally computed:
 sha256  30e556b3959e3985d66efefec5eaac51d4995053caa1d3cffe6eb916f146f229  COPYING
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index f3e90e5910..3b8fdbae1e 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBARCHIVE_VERSION = 3.8.5
+LIBARCHIVE_VERSION = 3.8.6
 LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.xz
 LIBARCHIVE_SITE = https://www.libarchive.de/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
