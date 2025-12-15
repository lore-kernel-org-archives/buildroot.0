Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B73D5B86A
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 19:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C88940425;
	Mon, 15 Dec 2025 19:37:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AfR_1Fwoa6ru; Mon, 15 Dec 2025 19:37:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0A8440583
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765827478;
	bh=+1G0zlJsUOD8YKR5NxB6OU2Xe2/j47ZJAIOCJvQT8LQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=StWBfooIRwRWgpX0hxR5Z/pCAw1m2scGeR6FHH5FP8oal/6WY+lyxf+NC+b3DqD7g
	 rdO+URzBcS5Dde1fTpqkEX2CFCDqziuu+FFrBigq1om97mc+QAbcNkNBsC9vT138MT
	 wmymIs7iBHKbd02hb7WRatBBU0AsyourvkCypumO4fvhyaimeDJ3zgxvS90VWQt6rj
	 1E/W6ox0ZU00cbMWgiaWRfRNDKAv9twlaXA1bYR17cJ5qMXFECnIW7rwlfgNOiV4N/
	 ts+hhinNkUZBEQga0GLJCog65zjg0d8Nuttk9ERdqfL9HautJV7rbcRNoADGYtJN39
	 WeDFFR/6IZCIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0A8440583;
	Mon, 15 Dec 2025 19:37:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 24E6D117
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C4EC40583
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:37:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qSukljnB29aC for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 19:37:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A75D240425
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A75D240425
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A75D240425
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:37:55 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 12E8CA4C421C
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 20:37:53 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46950)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVEOG-000000000xz-21OE
 for buildroot@buildroot.org; Mon, 15 Dec 2025 19:37:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 20:37:52 +0100
Message-ID: <20251215193752.1776166-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765827473;
 bh=KSeBXnBvKlxUneZ6litTdS52Bt7dTFOwp29zLxx5V+8=;
 h=From:To:Subject:Date:From;
 b=ImlBM4CMqDMSt1jWVgelcEtQV7W/EWDVZVb/R5k5KPV6j9LrHa3x9w09EPaUhJzVG
 RFY6ZH0uaMqU0ne/7vQ0FX+rWOi12FqSfXNBiZnSNlh7P2VmSaicxPA+ak6ie8p15w
 KgMjPARexeHTktealCqpskazFdVPtNltu16cneDsCX5PXVwVVAoDk0yzpjjXNrH1op
 gZL5IITJuIjdTkKf/tcz2IbkXAbtXTZ9G68yKej3pt8+CxwHjIXd7bAoLT7gua1RNR
 DoMm+/ZtzSZT0FRDlTFxvcCLIb5/SzHmDz3lhQRVcrleeyXM9y/hx1UdEbbeVRb58u
 pkuHFpjB18gVA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=ImlBM4CM
Subject: [Buildroot] [PATCH 1/1] package/libldns: bump to version 1.9.0
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

Changelog: https://github.com/NLnetLabs/ldns/blob/1.9.0/Changelog

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libldns/libldns.hash | 8 ++++----
 package/libldns/libldns.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libldns/libldns.hash b/package/libldns/libldns.hash
index ffdfbedc13..b8bb3f55a5 100644
--- a/package/libldns/libldns.hash
+++ b/package/libldns/libldns.hash
@@ -1,7 +1,7 @@
-# From https://www.nlnetlabs.nl/downloads/ldns/ldns-1.8.4-rc.1.tar.gz.sha1
-sha1  43d013b904e6df5ac5e28001cdc91bef537f3f6f  ldns-1.8.4.tar.gz
-# From https://www.nlnetlabs.nl/downloads/ldns/ldns-1.8.4.tar.gz.sha256
-sha256  838b907594baaff1cd767e95466a7745998ae64bc74be038dccc62e2de2e4247  ldns-1.8.4.tar.gz
+# From https://www.nlnetlabs.nl/downloads/ldns/ldns-1.9.0.tar.gz.sha1
+sha1  9cfe5623dcd40cee0e480b438318c3c4a26c1ecf  ldns-1.9.0.tar.gz
+# From https://www.nlnetlabs.nl/downloads/ldns/ldns-1.9.0.tar.gz.sha256
+sha256  abaeed2858fbea84a4eb9833e19e7d23380cc0f3d9b6548b962be42276ffdcb3  ldns-1.9.0.tar.gz
 
 # Hash for license file:
 sha256  9e0b1505c358d1a7c79555ee8bd1acbe2985dbc74dd81f3697cebf2161e922e6  LICENSE
diff --git a/package/libldns/libldns.mk b/package/libldns/libldns.mk
index 6ced75a44f..92c379f37b 100644
--- a/package/libldns/libldns.mk
+++ b/package/libldns/libldns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBLDNS_VERSION = 1.8.4
+LIBLDNS_VERSION = 1.9.0
 LIBLDNS_SOURCE = ldns-$(LIBLDNS_VERSION).tar.gz
 LIBLDNS_SITE = https://www.nlnetlabs.nl/downloads/ldns
 LIBLDNS_LICENSE = BSD-3-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
