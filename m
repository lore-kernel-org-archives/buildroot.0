Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD34EEF36E3
	for <buildroot@archiver.kernel.org>; Mon,  9 Mar 2026 06:21:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24C6282C7C;
	Mon,  9 Mar 2026 06:21:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id if5ujkRKF7qz; Mon,  9 Mar 2026 06:21:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4603882BBA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773037272;
	bh=VNMbKJnJlaO1/f6fE7yauUDxGfdO8gT/nY3TocY4b/w=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CFMUzQLNWsSWfArI8aVejnnkuOj9iqXcSTBgeoTeewZwpSd76i90m6xvizgt2BKbR
	 VFaFGw2n2oqUhqyKSCWL+FUtAn01M4Dr7QLXwPV00jwUaixHNhet9LHbjlHVReXZbh
	 VohtmOVX6wAwNtz/2lsoRxvn423Wwt/eC38JetluhYjaNn2JOdrEO/4guoxRZv0SPb
	 pMIHf/74+kgf7TwuRAL8rxTui2QEblsYAwqHKpygJaGNNV0duvz61zdRFkmZA4zF93
	 dIH4lc2zyvAC+f8bSJZ2uJ8dQkLZvu1hiritSPDFQGYQAjlLl1p6Xv478sy+yISLLS
	 m6d6dtlu1zIAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4603882BBA;
	Mon,  9 Mar 2026 06:21:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F22F158
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 06:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 39D91400A2
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 06:21:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6wQ1DSNw7yr2 for <buildroot@buildroot.org>;
 Mon,  9 Mar 2026 06:21:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.175.65.13;
 helo=mgamail.intel.com; envelope-from=mika.westerberg@linux.intel.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6881940060
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6881940060
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6881940060
 for <buildroot@buildroot.org>; Mon,  9 Mar 2026 06:21:04 +0000 (UTC)
X-CSE-ConnectionGUID: 2vcaKTrTSH6nw7D+yhfttA==
X-CSE-MsgGUID: 4rgml2EcTAOa4W+cql2zUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="85142194"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="85142194"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2026 23:21:03 -0700
X-CSE-ConnectionGUID: JsdJhOZoTOap8BO7GXy/+A==
X-CSE-MsgGUID: 0qeV3WvoSGKuZcNjNlVlxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="223755892"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa003.jf.intel.com with ESMTP; 08 Mar 2026 23:21:03 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
 id 6996595; Mon, 09 Mar 2026 07:21:01 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Date: Mon,  9 Mar 2026 07:21:01 +0100
Message-ID: <20260309062101.4046141-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773037266; x=1804573266;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=etMskHZW5TslLQ8irqNgfkDeOzKsav1sfry0qs9uq4o=;
 b=UJrvW3OFx2uBFPzewuDtt+Qzm8+oQ/aN+Xmr6zn4J7yVA+qfaSQ3blyk
 qt15dpV5NFfvYaXVAluo3Ia2cp1yHtJ4Zu/iNDJEnOsvHDFKKBo6aSGrc
 4R5qtd2luHgTY4lThfwd/dHVYyiNxQkv3D3TtxeE7MNGmtdpq2SxMJc0H
 cbk7SYHW5tfPazIKcETW0r7cJ/IsR60PBccX1EVbmW+EWcrrCd4yn0cG+
 1rEUpYAQrst2jJPBo0UwodTe//6Nh54EJ7WuGMuilSplUD1SGk1LOsV9k
 +wxR2WjFaHBH6FQCdHV6L8zpbj85tbC+yHLKg7a6Fu9viPq4pVe56afG7
 g==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=linux.intel.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=UJrvW3OF
Subject: [Buildroot] [PATCH RESEND] package/tbtools: bump to version 0.8.0
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

Update to the latest release of tbtools. For change log, see:
https://github.com/intel/tbtools/compare/v0.6.0...v0.8.0

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 package/tbtools/tbtools.hash | 2 +-
 package/tbtools/tbtools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tbtools/tbtools.hash b/package/tbtools/tbtools.hash
index f62d3c36d6..a66ae15e63 100644
--- a/package/tbtools/tbtools.hash
+++ b/package/tbtools/tbtools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3fd91206483884f44ef757343f68c9acf91817ebbcdf4c0f6821a3734eb54984  tbtools-0.6.0-cargo4.tar.gz
+sha256  114c0dfb3f30cc491c9fcb583adf0f8b356268d8207bfc8c73a5bffe990e0c6a  tbtools-0.8.0-cargo4.tar.gz
 sha256  9b16a3add311d607af8d9b348a842a37840d0f47dfcc6cf2a7756ee02c24ed69  LICENSE
diff --git a/package/tbtools/tbtools.mk b/package/tbtools/tbtools.mk
index 3031b86144..ed5ead332d 100644
--- a/package/tbtools/tbtools.mk
+++ b/package/tbtools/tbtools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TBTOOLS_VERSION = 0.6.0
+TBTOOLS_VERSION = 0.8.0
 TBTOOLS_SITE = $(call github,intel,tbtools,v$(TBTOOLS_VERSION))
 TBTOOLS_LICENSE = MIT
 TBTOOLS_LICENSE_FILES = LICENSE
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
