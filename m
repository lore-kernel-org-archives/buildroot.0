Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E1431077605
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 18:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18D1360F96;
	Wed, 18 Mar 2026 18:41:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A6VsPTR2sI0z; Wed, 18 Mar 2026 18:41:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1712460C27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773859281;
	bh=ZgBnkTqQPBzhXVTHP6JPvolvcxSG987Mf9DcBbpcrnM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=px13SrnOxHtPwPBfbHcL/px0Q9g85YJMeZ5LrA/LBh5LsavibyUcpnbLABB6L0Ipp
	 KjBOLCy2lall2pxemR/3ldkI366sNVDcCichfOowi0k53UMWfFvk5KdsmLq2yBW1hl
	 J4HvOWvXulF89e/wDXJa5apl0yrSjNYlPNXJmhkqk4sW3WMPBZjUzyKXe6D5yJjO4/
	 7CNQpLAJO21SgVRskSDSxR6iKvtrMkIwwpop1CQOCFuLBCczswj/YRCM1JAZr0kwsG
	 mU+0zBCqP38GI+EapIuKofaj6NJnikJGyKTGCTx/wOKQzLHpD9IlAySOfhSMBNXqCG
	 H6bruSH9W7Hhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1712460C27;
	Wed, 18 Mar 2026 18:41:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AE35C264
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 18:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9BB81404A5
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 18:41:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f3ljWow1drS7 for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 18:41:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.11.138.130;
 helo=gloria.sntech.de; envelope-from=heiko@sntech.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CCB9340494
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CCB9340494
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CCB9340494
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 18:41:17 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Etienne Carriere <etienne.carriere@foss.st.com>,
 Quentin Schulz <quentin.schulz@cherry.de>, heiko@sntech.de,
 Heiko Stuebner <heiko.stuebner@cherry.de>
Date: Wed, 18 Mar 2026 19:41:10 +0100
Message-ID: <20260318184110.2121178-4-heiko@sntech.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260318184110.2121178-1-heiko@sntech.de>
References: <20260318184110.2121178-1-heiko@sntech.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
 bh=2F7n9UTu9Pe4c+jkhzJRin9rMpnFzAgusFqsTSArK2s=; b=wu6JcDxy6VIk64hLlCGn6fNA43
 PK07YUJcWM2crN7Dd6PQ4AheJgR4vlze8uV+FnQnyc49A4AKpcP8kSzDY3nAHCa+OLQDhI26OTZmH
 wiyeWLHCp/AGuTVyJiTHOWZinMB6TTj6LSAe/tXeDeHzL3EJRVHruVQ0bvqTrxDGCzz3Ct/jPOEut
 3/oqS8FFdcEboP6hopbshTFGM95H4dnRrpySGN6yrk548Rbw5V906K+kWBR7JO4ljp4I9C/osp+g9
 tjAnAZDLZ7f6O10O20VeS7n0UZi/fbgsW/Jrd82sdV5kz0o236y+weBCk4C60XgwMlVFGGv6nhO48
 25TMVVwg==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=sntech.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256
 header.s=gloria202408 header.b=wu6JcDxy
Subject: [Buildroot] [PATCH v2 3/3] linux: add option to override the
 CPE_ID_VERSION
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
From: Heiko Stuebner via buildroot <buildroot@buildroot.org>
Reply-To: Heiko Stuebner <heiko@sntech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Heiko Stuebner <heiko.stuebner@cherry.de>

CPE_ID_VERSION defaults to {pkg}_VERSION by default.

When using custom tarballs or repo-revisions, this VERSION will contain
either "custom" or the repository revision as its value.

This prevents tooling like CVE checkers, etc that use the show-info
output to know what base version to check against.

To solve this add a config option to (optionally) allow overriding the
CPE_ID_VERSION if needed.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 linux/Config.in | 12 ++++++++++++
 linux/linux.mk  |  3 +++
 2 files changed, 15 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index 44f8b08e71..84f7abddab 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -139,6 +139,18 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 	help
 	  Include git submodules in the kernel source tree.
 
+config BR2_LINUX_KERNEL_CUSTOM_CPE_ID_VERSION
+	string "Set custom Linux-Kernel CPE_ID_VERSION"
+	depends on BR2_LINUX_KERNEL_CUSTOM_TARBALL || BR2_LINUX_KERNEL_CUSTOM_GIT || \
+		   BR2_LINUX_KERNEL_CUSTOM_HG || BR2_LINUX_KERNEL_CUSTOM_SVN
+	help
+	  CPE_ID_VERSION defaults to the package version, but when using
+	  custom tarballs or custom repository revisions, the version of
+	  that software is unknown and set to custom or the revision.
+
+	  Allow to set a separate CPE_ID_VERSION, that will generate
+	  more accurate CPE entries for the software-version used.
+
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "6.19.8" if BR2_LINUX_KERNEL_LATEST_VERSION
diff --git a/linux/linux.mk b/linux/linux.mk
index c61089bfe0..35418373df 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -11,6 +11,9 @@ LINUX_LICENSE_FILES = $(call qstrip,$(BR2_LINUX_KERNEL_LICENSE_FILES))
 LINUX_CPE_ID_VENDOR = linux
 LINUX_CPE_ID_PRODUCT = linux_kernel
 LINUX_CPE_ID_PREFIX = cpe:2.3:o
+ifneq ($(BR2_LINUX_KERNEL_CUSTOM_CPE_ID_VERSION),)
+LINUX_CPE_ID_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_CPE_ID_VERSION))
+endif
 
 # Compute LINUX_SOURCE and LINUX_SITE from the configuration
 ifeq ($(BR2_LINUX_KERNEL_CUSTOM_TARBALL),y)
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
