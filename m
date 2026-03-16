Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EBBBF53D6E
	for <buildroot@archiver.kernel.org>; Mon, 16 Mar 2026 16:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 638C482813;
	Mon, 16 Mar 2026 16:14:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gUKTuKWQkFQ6; Mon, 16 Mar 2026 16:14:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D93B827AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773677677;
	bh=t2zJT5tf1cJagdD18RROMFNXnoNY5Uv2H+cD0yFbpZE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mGGatTbP/me+c86GUBqnztgTPtMdrgwD+x6lQUXbIFlgcIrfk94rVkozAxrrEghH5
	 kB8l9XFv62sEKJPh63hVD/gozZXNkwBdA9HMbJn0iipJi4bNRiHxDursc3m71Sjptf
	 33aIii8HTrIEqol5qbeq2r6ezUDK4LAeZBNomJeWy1z7mMU3Uaou5R5BVp690ydYHT
	 x6dSQMSUKA1rIaybWYWeqeg+jVaWMaEQSxK/xGTmsYApYpD2PLvHMOtAuuK6TODFOa
	 3GNtd0brMDBXe4Q4sy+dUcH8e+xC2GqMU2N80+pP3/i3cyHwi7kqxvsBFAS3g3fygg
	 7Y01rUZ6/e5wQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D93B827AA;
	Mon, 16 Mar 2026 16:14:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D4E133BE
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 16:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BAC8260FE0
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 16:14:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kNdtYUpM-WMI for <buildroot@buildroot.org>;
 Mon, 16 Mar 2026 16:14:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=207.54.77.171;
 helo=esa4.hc555-34.eu.iphmx.com; envelope-from=jimmy.wesolowski@mobileye.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5BC4760FDB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BC4760FDB
Received: from esa4.hc555-34.eu.iphmx.com (esa4.hc555-34.eu.iphmx.com
 [207.54.77.171])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5BC4760FDB
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 16:14:32 +0000 (UTC)
X-CSE-ConnectionGUID: NZA92tSYTeagN6fgGNvV+A==
X-CSE-MsgGUID: qyg7mlBqTNSz2dO5QR+sLA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
 by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 18:14:29 +0200
X-CSE-ConnectionGUID: 0wOnjf35QA+a8GpdBqgX7w==
X-CSE-MsgGUID: CwKbbDhxSDyY46191FtpCg==
Received: from unknown (HELO epgd074.me-corp.lan) ([10.154.54.3])
 by ces02_data.me-corp.lan with SMTP; 16 Mar 2026 18:17:37 +0200
Received: by epgd074.me-corp.lan (sSMTP sendmail emulation);
 Mon, 16 Mar 2026 18:14:27 +0200
To: buildroot@buildroot.org
Cc: guenther.harrasser@mobileye.com, Scott Fan <fancp2007@gmail.com>,
 Julien Olivain <ju.o@free.fr>,
 Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
Date: Mon, 16 Mar 2026 18:13:58 +0200
Message-ID: <20260316161402.1994225-4-jimmy.wesolowski@mobileye.com>
In-Reply-To: <20260316161402.1994225-1-jimmy.wesolowski@mobileye.com>
References: <20260316161402.1994225-1-jimmy.wesolowski@mobileye.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
 t=1773677672; x=1805213672;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AtChC9IevpNIwSMlfdnYFuCLo4NZKWi1Rp92NBqO+lc=;
 b=a5bqtPX5IutDVfULG/VHNRkHO+VtuSy/zsq2EUcwcKgTdyxQj/LaU+bS
 vKg/TaLKjTwioldEchwdDTP62CxoSpuOX/fVYdfYTdDBNe2HKAtB8WdpR
 u0/ItU/jnYP+aGCT9mxJa8xxuPN/qVK215ydPMKSsybx5CJvBy5MFQe6J
 f0vyBovj+Bl0o+IGZGuaj9E+iKx2PzmCv61ZfjouPkJSWCgp99Gd5tdYa
 dL84QWjdvUkc+EqFOMaQ/hRV7HpLq2lYzjA3lfSYD2OjBXApBZSC0Ijgp
 rmjuUib5ftDCX7TBDHC+4Fou97U/NHWP79qyl/ePa7UfUUx6i58oZlQpZ
 g==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mobileye.com
Subject: [Buildroot] [PATCH 4/5] package/libopenssl: bump version to 3.5.3
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
