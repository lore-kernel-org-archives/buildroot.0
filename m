Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E73DEC61DE1
	for <buildroot@archiver.kernel.org>; Sun, 30 Aug 2026 19:42:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72C134059E;
	Sun, 30 Aug 2026 19:42:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id chQ0LPmrfD-T; Sun, 30 Aug 2026 19:42:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788118920;
	bh=v3fbRoF2uV8zv41WOrr0p1JQwXKtUPR5BapuMbQKuOQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=T+nYLlILuXDzOhJl+OXlse46oDz9z79AlWtP7a4z7OmhLiW7BO6FzeUVxqizo3rU8
	 lAddQjGXRYXQBfdM8t47syOpTvZYPynMuZ1kWBPHKnUZBYiI+Iqd6qv2fGla55cHZw
	 37rm1rqL4MU3f8IvY7LysWu4S0XYyGCgwrSBhI/9O/R+27yPsohsyO06okfYbsB9Oo
	 qs69+uaa/m0s3ajMweCTHNyr9npulys33xv/9ySJQTcWKhSp/KJdi+mr5ei88ElF/s
	 +hufGGa7M7GOybQQaho1bi5cLy/nXs6ZiTAmc5ow9Yxbbpbzx5ZKZsdS0naLuF42Lm
	 uOqqGRrjuOv+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 506B540505;
	Sun, 30 Aug 2026 19:42:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2408D334
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 19:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 21D6A8063F
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 19:41:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kHfUrCVGaA-i for <buildroot@buildroot.org>;
 Sun, 30 Aug 2026 19:41:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=qzU14akd
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6718980C8B
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 19:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788118913;
 bh=V8F54sgrBOpso2G8a+EKW3EkNcO9HbTgZV/GwtjdYSg=;
 h=From:To:Subject:Date:From;
 b=qzU14akdC3qUVwbKHi/Kv3XXERYT5dLEkO5gfV6dLK4NmJw23lEPnokaIvKF+lJAG
 Wc/33T9aUYR7ZE3tmh7eRcX6ct2dG4gmNB1aHkuWxjag0Ib+2FOtWsDg2Bx5tk2Tre
 5aXZzQ+Pqj5JRnvqSlsYCBUwjnt19OV1qEe4ejxVEL0Pw6gpDirNC2wN1bDbV/B/eT
 7IwCJTXcG/98aHrN1LD2Uv0T/Pgs2cdj8rxB7ylkwPKI/OOjgqujWPvjGpl2t+sGtY
 fUo1DMplLu7338WsMXGPTGVfe14Ovcsm1Rw91QXJMu38hVn5fAv6l2VsDbUBe+XdfS
 bcUIDB/SqEfzw==
Received: from fli4l.lan.fli4l (p54a1b089.dip0.t-ipconnect.de [84.161.176.137])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6ACBDA4C073D
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 21:41:53 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36094)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x0lPc-000000006Bu-3pWj
 for buildroot@buildroot.org; Sun, 30 Aug 2026 19:41:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 30 Aug 2026 21:41:53 +0200
Message-ID: <20260830194153.2400025-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/libldns: security bump version to
 1.9.2
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

https://community.nlnetlabs.nl/t/ldns-1-9-1-released/3403
https://community.nlnetlabs.nl/t/ldns-1-9-2-released/3404
"Please do not install ldns version 1.9.1 as it has a wrong .so version.
 Install ldns version 1.9.2 instead."

Fixes CVE-2026-10846.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libldns/libldns.hash | 8 ++++----
 package/libldns/libldns.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libldns/libldns.hash b/package/libldns/libldns.hash
index b8bb3f55a5..c346fdf154 100644
--- a/package/libldns/libldns.hash
+++ b/package/libldns/libldns.hash
@@ -1,7 +1,7 @@
-# From https://www.nlnetlabs.nl/downloads/ldns/ldns-1.9.0.tar.gz.sha1
-sha1  9cfe5623dcd40cee0e480b438318c3c4a26c1ecf  ldns-1.9.0.tar.gz
-# From https://www.nlnetlabs.nl/downloads/ldns/ldns-1.9.0.tar.gz.sha256
-sha256  abaeed2858fbea84a4eb9833e19e7d23380cc0f3d9b6548b962be42276ffdcb3  ldns-1.9.0.tar.gz
+# From https://www.nlnetlabs.nl/downloads/ldns/ldns-1.9.2.tar.gz.sha1
+sha1  d197d9fb46e1802a7160368b38bf063b493f1be1  ldns-1.9.2.tar.gz
+# From https://www.nlnetlabs.nl/downloads/ldns/ldns-1.9.2.tar.gz.sha256
+sha256  b524fa21994b6e834200ceb8c27f1b84bda5982fe35706f058196c079db94d5d  ldns-1.9.2.tar.gz
 
 # Hash for license file:
 sha256  9e0b1505c358d1a7c79555ee8bd1acbe2985dbc74dd81f3697cebf2161e922e6  LICENSE
diff --git a/package/libldns/libldns.mk b/package/libldns/libldns.mk
index b4734ee54c..8ad3f618f4 100644
--- a/package/libldns/libldns.mk
+++ b/package/libldns/libldns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBLDNS_VERSION = 1.9.0
+LIBLDNS_VERSION = 1.9.2
 LIBLDNS_SOURCE = ldns-$(LIBLDNS_VERSION).tar.gz
 LIBLDNS_SITE = https://www.nlnetlabs.nl/downloads/ldns
 LIBLDNS_LICENSE = BSD-3-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
