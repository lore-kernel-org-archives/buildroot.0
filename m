Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 795D0CCD187
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 06:16:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 159CC61165;
	Tue, 14 Oct 2025 06:16:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HxvspHM_e3e4; Tue, 14 Oct 2025 06:16:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48FF9614FE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48FF9614FE;
	Tue, 14 Oct 2025 06:16:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B4810BC
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 06:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B221541317
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 06:16:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cHDm6aD5ZQwD for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 06:16:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0238141269
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0238141269
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0238141269
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 06:16:25 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 629896676; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 14 Oct 2025 06:16:23 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1v8YKd-000KsI-0C;
 Tue, 14 Oct 2025 08:16:23 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Oct 2025 08:16:21 +0200
Message-Id: <20251014061621.80231-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=WB1lgtnB9eHY4itQg9QdGhKUDaLzB0acXBZ0yDar+8eOE4FkV88W9JtjAe4VtIUbPaL+Tj0CBptw2BD1O5uVB2d5cnW5E3JWFyM+5mvNJn+31yUTR7kGNnmtJGZKerGaum/LtcKMn7mapvMZEO+prXeQMcCn9FpJXXd7yG2VBIFsSlwHXW/3P8kosviyMNvoZ+F2obVot6azikl6s4QIZnfOckfSTEZsHiVbddFYXuMsU+tkV0OdfNqw50EDhf8QbEGw9t5U7MCHCS0Tl6SgdoMvVd8adYhK/MwadkEQHwEYSZ1w0prHhjTJ0SUG87bliqc+4xILXrNEBA6NygXMpQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=XvmYK8b3vXC5alJdFMdHvgn71zbRNFVniykehZjTfAE=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=WB1lgtnB
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/gstd: bump to version 0.15.2
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

Bugfix release:
https://github.com/RidgeRun/gstd-1.x/releases/tag/v0.15.2

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gstd/gstd.hash | 2 +-
 package/gstreamer1/gstd/gstd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer1/gstd/gstd.hash b/package/gstreamer1/gstd/gstd.hash
index 632f83f8e8..bdbc137287 100644
--- a/package/gstreamer1/gstd/gstd.hash
+++ b/package/gstreamer1/gstd/gstd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f4a83765d2cf2948c38abc5107ab07d49a01b4101047f188fed7204f1d4e49c7  gstd-0.15.0.tar.gz
+sha256  d9d3205551482acd6b7ec2a865407b60efce252e8f747553628401c84f88c556  gstd-0.15.2.tar.gz
 sha256  10162be9f7ddb9e98c22c3edd0f78d62ab88f0ca8b1cc968bd85d5d665489d90  COPYING
diff --git a/package/gstreamer1/gstd/gstd.mk b/package/gstreamer1/gstd/gstd.mk
index 965ede7949..d855fc52f0 100644
--- a/package/gstreamer1/gstd/gstd.mk
+++ b/package/gstreamer1/gstd/gstd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTD_VERSION = 0.15.0
+GSTD_VERSION = 0.15.2
 GSTD_SITE = $(call github,RidgeRun,gstd-1.x,v$(GSTD_VERSION))
 GSTD_LICENSE_FILES = COPYING
 GSTD_LICENSE = LGPL-2.1+
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
