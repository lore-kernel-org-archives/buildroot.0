Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63CDACD8CA4
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 15:04:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 198B347489;
	Tue,  9 Jun 2026 15:04:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JKDQEqqg2k3L; Tue,  9 Jun 2026 15:04:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59A554424E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781017471;
	bh=xqtdDs+8jDQrx5CUC4yD5QboOFJf/fO8i05Fmio98eI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=TEKeARh8OOHFq4y8mjfra6LbtfNTc96oFL4k32HrCooH/5qZuIhWsqiV2vFhFTE46
	 P7W3N/l+l2ejV3FDNRgri2k/jyc89SYnaodonCnAJhVnnbU8XEAuE+QGhNICYQq5QD
	 RF5VBlhFNq4u+BIQnCkL7+F01cVD/9pBJi/1oxm5tY1a/dhHrWeSlMF+LkM3ov4Jq1
	 fp2Z5fstXBltOzw1dIzNsn/wuRdfBtwksgHOzulgYsTfMitfPaI0jDA3QkTEA4IblB
	 FPtRTdv6EzONsD5Op+nJ5Hd3ZdfliG8pDi4VzB8e7YjMBWdtOCXZVLTUW9utqs3QJ9
	 DRyLIvo0sAvig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59A554424E;
	Tue,  9 Jun 2026 15:04:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CE8442C1
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 15:04:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BFB0981D9F
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 15:04:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yu-n5MsVt_Ip for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 15:04:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9A97E81C40
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A97E81C40
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A97E81C40
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 15:04:28 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -104733847; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 09 Jun 2026 15:04:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1wWy07-0000000C7N3-0sLv;
 Tue, 09 Jun 2026 17:04:23 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue,  9 Jun 2026 17:04:08 +0200
Message-ID: <20260609150410.2888215-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=gZDloXerBt/jlFs3Kwq4lKpO21KRSyGPReTjFB7f+s/XpoAb6XwvK61K36SMR85xeBf98A6DNFwysCpD3LbsRM8NvyMzsAA2Gray1tWdlaGdRG8ikbnldfRC3sQ0K+ceI7n3TOEFsyS72I3IAPbgMbiv+1ZExA08TIQzRwYElPGUO52GMO12eiPiKv4PJfNqWwm3VnwfLWFHBfPji+Za77XalN9cByyE2V6NBh7QIqU0jHkXRT6IyHvnrX0ucw0rVqmkWrKcURMMSzsqrTCVpOTB/Pf0V7mLGZrCsGjxm8WqDrCS68iR5TZo6mZAC1241FmQ1gndYXpN6dWOnm5Cdw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=XGjNTCYlf8FRFkmHSJuG0KpR4p2pDJqrB2GWxmm1kic=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=gZDloXer
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/rsync: bump version to 3.4.4
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
Cc: Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bugfix release containing a number of fixes for regressions introduced in
the 3.4.3 release.

For details, see:
https://download.samba.org/pub/rsync/NEWS#3.4.4

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rsync/rsync.hash | 4 ++--
 package/rsync/rsync.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rsync/rsync.hash b/package/rsync/rsync.hash
index 666bb5cf99..2deaed0674 100644
--- a/package/rsync/rsync.hash
+++ b/package/rsync/rsync.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://rsync.samba.org/ftp/rsync/src/rsync-3.4.3.tar.gz.asc
-sha256  c72e63ca3021cbc80ba86ec30102773f4c5631fbc492b52e773b3958f82a53d3  rsync-3.4.3.tar.gz
+# https://rsync.samba.org/ftp/rsync/src/rsync-3.4.4.tar.gz.asc
+sha256  bd88cf82fa653da32314fb229136407c5c90f80d1758d8f4b091767877d8fa96  rsync-3.4.4.tar.gz
 # Locally calculated
 sha256  85c19ea50a224c2d0067a69c083584e5717b40b76610ec1218f91385775067dd  COPYING
diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index 5b4345d036..5dd89a82d2 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RSYNC_VERSION = 3.4.3
+RSYNC_VERSION = 3.4.4
 RSYNC_SITE = https://rsync.samba.org/ftp/rsync/src
 RSYNC_LICENSE = GPL-3.0+ with exceptions
 RSYNC_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
