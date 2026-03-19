Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 462621090222
	for <buildroot@archiver.kernel.org>; Thu, 19 Mar 2026 12:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80103841D8;
	Thu, 19 Mar 2026 12:43:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Xrp5SFfOsTZ; Thu, 19 Mar 2026 12:43:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5A4B841FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773924200;
	bh=wqyT/fG9NqzKogyex0WDL3nn9g5zKrw9Er/kPHvLoF0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=O95ClIaQ5ygaDUNC2Bey070/9yqcIV4txmrixlN3ofitgh5ZMuYtxh+/hvaCnAPKg
	 rLcKKLUHp+C8c2p3VmCDSEq7G+2kHlECvWd0l/XppD65pYDLZaSNHuhE7SW9t+hfIT
	 AvxGT8BLwtjUR9Mvv5RF1TWXDB9oG5jHwl8BSlhrWwEdLgxi5Nm8BPgceecYCmiNKI
	 4OT/dIZgiM2d2MICoSFc9fUdIMXEJYg8DK3LsHJHX4PVR/7JqLPeMxOtpq/YQY+P4+
	 y/kd0XKWpqUx6M9utwrCezy/Mkqr8fl3z++apT9oi0U7zPs1wxaDqDb/xFUgBJ1GME
	 PR4Oovs8B08eg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5A4B841FC;
	Thu, 19 Mar 2026 12:43:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 13CEA1B6
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 12:43:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED9086100C
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 12:43:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HV9hPOlctL3W for <buildroot@buildroot.org>;
 Thu, 19 Mar 2026 12:43:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=23.90.104.144;
 helo=esa1.hc555-34.eu.iphmx.com; envelope-from=jimmy.wesolowski@mobileye.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 23FA460FEE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23FA460FEE
Received: from esa1.hc555-34.eu.iphmx.com (esa1.hc555-34.eu.iphmx.com
 [23.90.104.144])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 23FA460FEE
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 12:43:13 +0000 (UTC)
X-CSE-ConnectionGUID: rNxwcGOmTD2Brth11jWCtg==
X-CSE-MsgGUID: 4fiThf9vTPGgkZ4YAnFeCw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
 by esa1.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 14:43:11 +0200
X-CSE-ConnectionGUID: wfpdmfH/Tkiwsl3hjtAWgA==
X-CSE-MsgGUID: OGJ9y+qdTxSXEoVv1lt+sg==
Received: from unknown (HELO epgd074.me-corp.lan) ([10.154.54.3])
 by ces03_data.me-corp.lan with SMTP; 19 Mar 2026 14:46:14 +0200
Received: by epgd074.me-corp.lan (sSMTP sendmail emulation);
 Thu, 19 Mar 2026 14:43:10 +0200
To: buildroot@buildroot.org
Cc: guenther.harrasser@mobileye.com, Quentin Schulz <quentin.schulz@cherry.de>,
 Scott Fan <fancp2007@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
Date: Thu, 19 Mar 2026 14:42:42 +0200
Message-ID: <20260319124247.2973165-5-jimmy.wesolowski@mobileye.com>
In-Reply-To: <20260319124247.2973165-1-jimmy.wesolowski@mobileye.com>
References: <20260316161402.1994225-1-jimmy.wesolowski@mobileye.com>
 <20260319124247.2973165-1-jimmy.wesolowski@mobileye.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
 t=1773924194; x=1805460194;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7RrkAfjuh5vnEzbqUhqGnXLcdeIzkJQmFS9B8IbH7e0=;
 b=Mtl0vWNSvKBEsmI/GSmZaf0AQP1nLA/27j7yveuZ9sYxCwprDwmgOQAW
 WipzV1GiqP0eabvlsO1e08Aw8HCNTLK90VbgMPNJYtWkBXtvtCSj0wGyf
 Ctuq7xn/rAbXRWY94CxKAdEkUNnxXSPBIjXC5lvXqX4+cFZJEIkTbZz8L
 eM+l7su3Lc1fqmfeL8yFUwynkCptmmAe8KnjwybZThZQG1PJrIwr4mYes
 //u9h54qf+bXdaOY7xSyPTGBeKlyQz+Pz1r7SQbT92RXJM6Nl7z72HRnQ
 7we1RkBgK1FCo6J4LnAYabKJ6fvmCSfhD3HXkpNasCLkOEefYT+upzARX
 g==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mobileye.com
Subject: [Buildroot] [PATCH 2025.02.x v2] package/libopenssl: bump version
 to 3.5.3
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
From: Jimmy Durand Wesolowski via buildroot <buildroot@buildroot.org>
Reply-To: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Scott Fan <fancp2007@gmail.com>

This release incorporates the following bug fixes and mitigations:
- Added FIPS 140-3 PCT on DH key generation.
- Fixed the synthesised OPENSSL_VERSION_NUMBER.

https://github.com/openssl/openssl/releases/tag/openssl-3.5.3

Signed-off-by: Scott Fan <fancp2007@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 92a6b6c108b904dc780b419985e0d4d50518fad1)
Signed-off-by: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
---
Changes v1 -> v2:
  - cover letter added
  - patch prefix corrected from [PATCH] to [PATCH 2025.02.x]

 package/libopenssl/libopenssl.hash | 4 ++--
 package/libopenssl/libopenssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index 7f3795e1ac..d0ca45d303 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openssl/openssl/releases/download/openssl-3.5.2/openssl-3.5.2.tar.gz.sha256
-sha256  c53a47e5e441c930c3928cf7bf6fb00e5d129b630e0aa873b08258656e7345ec  openssl-3.5.2.tar.gz
+# From https://github.com/openssl/openssl/releases/download/openssl-3.5.3/openssl-3.5.3.tar.gz.sha256
+sha256  c9489d2abcf943cdc8329a57092331c598a402938054dc3a22218aea8a8ec3bf  openssl-3.5.3.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 38d04ea924..b892d4e236 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.5.2
+LIBOPENSSL_VERSION = 3.5.3
 LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = Apache-2.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
