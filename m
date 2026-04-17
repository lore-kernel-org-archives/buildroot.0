Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C59F436BF
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 19:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FC8A40F6E;
	Fri, 17 Apr 2026 19:23:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6bIz5m8-TjgV; Fri, 17 Apr 2026 19:23:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD40D40F19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776453789;
	bh=ke8u5WahyuoWjGzQ9uCrPq43bijCoxe+zdpTx6Dpk/g=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LS/HGWqP3ifJlFP72FC7Crh+GhLEkpJforHCUToXemid1q8O9KGpBrPK/uC4tiJxV
	 a9p/gZ52M7P9+CnlfUetnaoJeMCCoKYjlscXxoGS5KkxbrZWEfHxNVFTL4ogR6zt+9
	 8TQrSPyyMTM+NBjo5LxW14XFGZ/hIDwrnXLVwIer9Bq77tGzuqniuUmMUwoD7kg5XB
	 j62WOtjpWegLoiAGVW7ECpii9wN5aZT9yJcwoMkRDXIDUqzr2+PtV1F48ra5MNZxpc
	 gBJ8Tan95NJcbptTn097N9fr07NL1cNaPYEzxqh6G+A9LBeG4ZupiiFQgtosBjnZsZ
	 DPn+n3EVwjfeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD40D40F19;
	Fri, 17 Apr 2026 19:23:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BB345270
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 19:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD0C881E3A
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 19:23:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xr4QixtdUaEk for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 19:23:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F316081B58
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F316081B58
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F316081B58
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 19:23:06 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0897.dip0.t-ipconnect.de [91.58.8.151])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9D1D7A4C20DB
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 21:23:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52642)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wDomM-000000002kz-1G76
 for buildroot@buildroot.org; Fri, 17 Apr 2026 19:23:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 17 Apr 2026 21:23:02 +0200
Message-ID: <20260417192302.1061333-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776453783;
 bh=QOj9302EOM+BkGHTKauhyVE1PKtMJ4wRiMVfBa910Ns=;
 h=From:To:Subject:Date:From;
 b=GICVs8V/II4RlEzFltLOPN9xvTm/7mg8r/oAkgGBLmXOyJYL+tDesvh84kyOIzqt0
 8Sux6JDhw6VrveJ+uTAQrm+GhTa4/5nnrTWFBEfFl0d/+hvPr1+DOxLOiu5MKFbDHZ
 M38aOih/u4boh+uklA+IHnBMZlaYbCldTiNFrBJma+xvulABQf35E+W3LpJFAq+fGI
 nSJ6YMXpiWvzOjMirxxH/7yWp8s4YTSt72yU+coS57w2noluWVZnGaX9SCWnVQSYU/
 vLLvhPGVWtMrRuc6ofkOlNZHeRLzzXwD+OcmxBbB2g7mN8VWPl2GvZMPTVUnJi+/+G
 OfODib9+ILLZA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=GICVs8V/
Subject: [Buildroot] [PATCH 1/1] package/iperf3: bump version to 3.21
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

https://github.com/esnet/iperf/blob/3.21/RELNOTES.md

Updated license hash due to copyright year bump:
https://github.com/esnet/iperf/commit/010381c4b8fa19e236db571e787a246c31a414ee

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/iperf3/iperf3.hash | 6 +++---
 package/iperf3/iperf3.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/iperf3/iperf3.hash b/package/iperf3/iperf3.hash
index ee60d717e6..cce50581e6 100644
--- a/package/iperf3/iperf3.hash
+++ b/package/iperf3/iperf3.hash
@@ -1,4 +1,4 @@
-# From https://downloads.es.net/pub/iperf/iperf-3.20.tar.gz.sha256
-sha256  3acc572d1ecca4e0b20359c7bf0132ddc80d982efeee20c86f6726a9a6094388  iperf-3.20.tar.gz
+# From https://downloads.es.net/pub/iperf/iperf-3.21.tar.gz.sha256
+sha256  656e4405ebd620121de7ceca3eaf43a88f79ea1b857d041a6a0b1314801acdd8  iperf-3.21.tar.gz
 # Locally computed
-sha256  7c9ba0385fcf35c4c9e08ad0c0cba72d4315f36f0f742fef4de826a28cc33a97  LICENSE
+sha256  6c6e9abd761ff429c11189cd93bdee5bff7e3591253bd614b253a5f4fd30cbe5  LICENSE
diff --git a/package/iperf3/iperf3.mk b/package/iperf3/iperf3.mk
index bb8eece6b2..bff9a40865 100644
--- a/package/iperf3/iperf3.mk
+++ b/package/iperf3/iperf3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPERF3_VERSION = 3.20
+IPERF3_VERSION = 3.21
 IPERF3_SITE = https://downloads.es.net/pub/iperf
 IPERF3_SOURCE = iperf-$(IPERF3_VERSION).tar.gz
 IPERF3_LICENSE = BSD-3-Clause, BSD-2-Clause, MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
