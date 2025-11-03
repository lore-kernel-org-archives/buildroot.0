Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52ED3CCF9F8
	for <buildroot@archiver.kernel.org>; Mon,  3 Nov 2025 20:32:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E8D2810A5;
	Mon,  3 Nov 2025 20:32:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zHN6vtSwILmC; Mon,  3 Nov 2025 20:32:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D97A810A1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D97A810A1;
	Mon,  3 Nov 2025 20:32:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CF4C6462
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 20:32:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B629D40459
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 20:32:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1T3CdvV5K-53 for <buildroot@buildroot.org>;
 Mon,  3 Nov 2025 20:32:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9979C40421
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9979C40421
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9979C40421
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 20:32:41 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0d15.dip0.t-ipconnect.de [91.58.13.21])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7EB26A4C5F00
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 21:32:39 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35530)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vG1EF-000000001KE-0kq2
 for buildroot@buildroot.org; Mon, 03 Nov 2025 20:32:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  3 Nov 2025 21:32:39 +0100
Message-ID: <20251103203239.213614-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1762201959;
 bh=qHyqr5qNCWw85a7ff/H0Ax5TVoOfPURRjNAcX5Np6Mo=;
 h=From:To:Subject:Date:From;
 b=xprGSUPqFON0a0De2alN+cED3KzcCB4TfVtlH+oLcKF+jr1DN6p9JaiHqLUxwe6ha
 2Lksx9mvqmOP9LtDJrydVwqnhwNGZhYML/tYnAg+T+BBlTJwyWEKFxPFDuCpCVkiop
 9rUd2yBBivuw+THLenlr9Aq5xgNayAuzNU9DwTxKXaqFG7U80UHKlGckhowbYMM4UI
 MA8nT3BRlUgjIdanxfM2dh+CWXsDk/uCd9BQDv1pDvCE2QUIITUKAmEnYVVNHbYJk/
 8owpITC55TN0BdNp3WEpiT3niXaAo2SW1Sr5tsgi4uCN7rl6rB1yhgHaEmi86mRG8I
 f3yc9Foz3FM/g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=xprGSUPq
Subject: [Buildroot] [PATCH 1/1] package/dav1d: bump version to 1.5.2
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

Release notes:
https://code.videolan.org/videolan/dav1d/-/blob/1.5.2/NEWS

Updated license due to copyright year bump:
https://code.videolan.org/videolan/dav1d/-/commit/04faac69004ac951b74ac7fea331f3790ec043b8

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/dav1d/dav1d.hash | 6 +++---
 package/dav1d/dav1d.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/dav1d/dav1d.hash b/package/dav1d/dav1d.hash
index 2a64b5bc46..22dbf7220d 100644
--- a/package/dav1d/dav1d.hash
+++ b/package/dav1d/dav1d.hash
@@ -1,4 +1,4 @@
-# From https://download.videolan.org/pub/videolan/dav1d/1.5.1/dav1d-1.5.1.tar.xz.sha256
-sha256  401813f1f89fa8fd4295805aa5284d9aed9bc7fc1fdbe554af4292f64cbabe21  dav1d-1.5.1.tar.xz
+# From https://download.videolan.org/pub/videolan/dav1d/1.5.2/dav1d-1.5.2.tar.xz.sha256
+sha256  cce88ebcffd3f790bde49caa75f97b9cc2dd54ca8f57e38c62707266ec71bc4e  dav1d-1.5.2.tar.xz
 # Locally computed
-sha256  b327887de263238deaa80c34cdd2ff3e0ba1d35db585ce14a37ce3e74ee389e9  COPYING
+sha256  dd92c3c2247c5651606fc23a5e2d6a1ebc5ace9a3e49cbde0e12f05ad1cb1ee5  COPYING
diff --git a/package/dav1d/dav1d.mk b/package/dav1d/dav1d.mk
index c7b5156b21..f9cfd171d5 100644
--- a/package/dav1d/dav1d.mk
+++ b/package/dav1d/dav1d.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DAV1D_VERSION = 1.5.1
+DAV1D_VERSION = 1.5.2
 DAV1D_SOURCE = dav1d-$(DAV1D_VERSION).tar.xz
 DAV1D_SITE = https://download.videolan.org/pub/videolan/dav1d/$(DAV1D_VERSION)
 DAV1D_LICENSE = BSD-2-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
