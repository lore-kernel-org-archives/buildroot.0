Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FE4C2D0CD
	for <buildroot@archiver.kernel.org>; Thu, 15 May 2025 09:16:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B02580E34;
	Thu, 15 May 2025 09:16:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5hzYZRkc77-O; Thu, 15 May 2025 09:16:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65B5A80D8F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65B5A80D8F;
	Thu, 15 May 2025 09:16:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F677119
 for <buildroot@buildroot.org>; Thu, 15 May 2025 09:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 24EAC6064B
 for <buildroot@buildroot.org>; Thu, 15 May 2025 09:16:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UrEBThX6yF0Q for <buildroot@buildroot.org>;
 Thu, 15 May 2025 09:16:43 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=192.198.163.16;
 helo=mgamail.intel.com; envelope-from=mika.westerberg@linux.intel.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 142A460067
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 142A460067
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 142A460067
 for <buildroot@buildroot.org>; Thu, 15 May 2025 09:16:42 +0000 (UTC)
X-CSE-ConnectionGUID: Pz+MQdr0RFel2Rp+RXYUhQ==
X-CSE-MsgGUID: Xr3gDXSLStu05epPFUOGLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="36844812"
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; d="scan'208";a="36844812"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 02:16:43 -0700
X-CSE-ConnectionGUID: rJZD6iAHQFmxV4IAmYrNmQ==
X-CSE-MsgGUID: zcZwDzyCSsCjut3Nk+QcMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; d="scan'208";a="161601434"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa002.fm.intel.com with ESMTP; 15 May 2025 02:16:42 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
 id A795523F; Thu, 15 May 2025 12:16:40 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: buildroot@buildroot.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Date: Thu, 15 May 2025 12:16:40 +0300
Message-ID: <20250515091640.2914921-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747300603; x=1778836603;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oiargNqhXc4sA1M220mZKD5TpTdCAvv2U5tUdhyEF0k=;
 b=OQ1FGCOjbA48ZrPHcwRHH5RIPQ5G+cvG65XaX8OzAvodiPE6rIIHv0WI
 iaXn1ij4uM4lgR90ITZ45jTxCW7PrCH9IvTKEwHQORkGBdqcbRu3G7I+q
 XH792rCbuCk4EAkIojIHgHkdIDSHy32E+Wu8cn8OdPkj62AvS/FmETxZA
 iduIWv5zDELkEiVDdD3smguCUs2pU9XRhrS5jk5/p1BhKlsRE3QyHYq+p
 5QJjz4T0aQd0ZbmW4mSIe8XdpHptERKIarlw/+qOglWGOA6l0yhjPwmij
 fpihPjDqCRasQ6KTmNk5LP7eocyYXdwnnVcXa2AdzQw7uKzE+BGs0gc5k
 Q==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=linux.intel.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=OQ1FGCOj
Subject: [Buildroot] [PATCH] package/tbtools: bump to version 0.6.0
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
https://github.com/intel/tbtools/compare/v0.5.0...v0.6.0.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 package/tbtools/tbtools.hash | 2 +-
 package/tbtools/tbtools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tbtools/tbtools.hash b/package/tbtools/tbtools.hash
index 58793dee0c..1d4f154cb0 100644
--- a/package/tbtools/tbtools.hash
+++ b/package/tbtools/tbtools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  377d2fab96cf78d24dfd1b16b737afb4e47f0b712e13abb7ac1443fc2aa0931a  tbtools-0.5.0-cargo2.tar.gz
+sha256  125807bb59723d0055e7a0b248a7e563835dfef30d239120359e6da9cee253f5  tbtools-0.6.0-cargo2.tar.gz
 sha256  9b16a3add311d607af8d9b348a842a37840d0f47dfcc6cf2a7756ee02c24ed69  LICENSE
diff --git a/package/tbtools/tbtools.mk b/package/tbtools/tbtools.mk
index 1200e1c669..3031b86144 100644
--- a/package/tbtools/tbtools.mk
+++ b/package/tbtools/tbtools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TBTOOLS_VERSION = 0.5.0
+TBTOOLS_VERSION = 0.6.0
 TBTOOLS_SITE = $(call github,intel,tbtools,v$(TBTOOLS_VERSION))
 TBTOOLS_LICENSE = MIT
 TBTOOLS_LICENSE_FILES = LICENSE
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
