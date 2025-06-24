Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB92C7EE2A
	for <buildroot@archiver.kernel.org>; Tue, 24 Jun 2025 17:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B96E660B31;
	Tue, 24 Jun 2025 17:08:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LElYNPaFR9yO; Tue, 24 Jun 2025 17:08:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5B736087D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5B736087D;
	Tue, 24 Jun 2025 17:08:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C30BF154
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 17:08:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C058F6087D
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 17:08:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KZQ0-_Z50UxZ for <buildroot@buildroot.org>;
 Tue, 24 Jun 2025 17:08:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C56F360699
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C56F360699
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C56F360699
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 17:08:39 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -792800061; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 24 Jun 2025 17:08:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1uU78N-00BpQ9-2E;
 Tue, 24 Jun 2025 19:08:35 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 24 Jun 2025 19:08:32 +0200
Message-Id: <20250624170834.2819257-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=3nc+UVxvgWwbmEaxH1nuJBZFLp7GOzLAD2dpBaepsicLAg4j4ezka9epjqE2hCGENgWvWOKq7Bat5GRtOyJx1ioA9YMtfJCHGZL4Ef2SvivLN/R1Rvh3hUZCm1F8iXe1yiIKT1I77bdfyicr95U9H5j3VrEKfU/R69vRcmr70KSxdLygIyeCSXHfifMVPATdrhWsLf4XVeNmszXI6XLurjopynwHrF6B9kjVVAqLvvDElWlKllk8Iw3zxS+fkLu2i5pVH38LVE4GdgtFxTDqjmV1HaF8RtPVVBScL7zKLsj+xOB48eso13CA48hv9NZWfOm4+q5Ki55LAzxC+vjtkQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=j0kdlW/+frj+i1K9e7G0ru3Ut5sU27crGDU8Ju0yUz8=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=3nc+UVxv
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 1/2] Makefile: sort unexport lines
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

The list of environment variables to unexport has grown organically over the
years and is no longer sorted. Sort it alphabetically for clarity.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/Makefile b/Makefile
index 26db176674..a052628ac7 100644
--- a/Makefile
+++ b/Makefile
@@ -407,27 +407,27 @@ ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 # Hide troublesome environment variables from sub processes
 #
 ################################################################################
-unexport CROSS_COMPILE
+unexport AR
 unexport ARCH
 unexport CC
-unexport LD
-unexport AR
-unexport CXX
-unexport CPP
-unexport RANLIB
 unexport CFLAGS
-unexport CXXFLAGS
-unexport GREP_OPTIONS
-unexport TAR_OPTIONS
 unexport CONFIG_SITE
-unexport QMAKESPEC
-unexport TERMINFO
+unexport CPP
+unexport CROSS_COMPILE
+unexport CXX
+unexport CXXFLAGS
+unexport DEVICE_TREE
+unexport GCC_COLORS
+unexport GREP_OPTIONS
+unexport LD
 unexport MACHINE
 unexport O
-unexport GCC_COLORS
-unexport PLATFORM
 unexport OS
-unexport DEVICE_TREE
+unexport PLATFORM
+unexport QMAKESPEC
+unexport RANLIB
+unexport TAR_OPTIONS
+unexport TERMINFO
 
 GNU_HOST_NAME := $(shell support/gnuconfig/config.guess)
 
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
