Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB6BF94CA7
	for <buildroot@archiver.kernel.org>; Tue, 21 Apr 2026 19:00:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B767E41EE8;
	Tue, 21 Apr 2026 19:00:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KnQ7T4v01RpK; Tue, 21 Apr 2026 19:00:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70A3C41EDD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776798038;
	bh=PmHrF4BVQHGtVr+/VjJFMn8V/5IoXoveUQMLGwIipkg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YdX7ryS/9B6XM9qJYFL+SFPQ7DVMV2+LI+hPUns4KvPb52XCiDoDyepZD/LPdK1lx
	 1wQFryMnlfR541cu8Wae0nWw8SQPvgj7rg21fthhnHbCfwIX1bnR0ETsA7nFNNf292
	 sn+X8SKRH2io28YwLR51jieIX3aTYm70w5wTNcRYif6qw4a7h6pBiV9Tmg8B4kTrzd
	 uME8/SxocJrCFimI9dJXU+AFupKrH4d2GiQHWZUtRpcSaZqCfJUWtWGkyH8lHzfAh5
	 CUKiZ+wQSzOZUQ3PVa2svRNhFOGGUpfCuBUYkrdSDW1NxhMT/f3/SJTOPCUiwslAK/
	 H6AZpK8qFyyTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70A3C41EDD;
	Tue, 21 Apr 2026 19:00:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8735F183
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 19:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7942640364
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 19:00:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qDIpJ8GG9FDc for <buildroot@buildroot.org>;
 Tue, 21 Apr 2026 19:00:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6E46E4030D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E46E4030D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6E46E4030D
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 19:00:36 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0177.dip0.t-ipconnect.de [91.58.1.119])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 87BB6A4C0602;
 Tue, 21 Apr 2026 21:00:34 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50262)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wFGKo-000000003Kj-0xrK;
 Tue, 21 Apr 2026 19:00:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Alistair Francis <alistair@alistair23.me>
Date: Tue, 21 Apr 2026 21:00:34 +0200
Message-ID: <20260421190034.2722046-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776798034;
 bh=wqbShoz5CKyFMDIiAAjreGwVGsv7hrjQ/crtMW+fZoI=;
 h=From:To:Cc:Subject:Date:From;
 b=VJQC117fOjUKFUaMm/XPrl3wGFBQHHhJWAA4g9xkgMVK+P1uyYe2PTPQQ2edYSC06
 d5BykYLFsa4iNZSHiUTvvUdQ474uO91caC8QMMnJCP2E14/HgGGxV0SAI7S3zqBkjS
 WVraClTyMEXb8gR97E3C8ZWTYdnMwLW6DvkaUoDk1Ak92bt7VDmU9EasT6U6YJMUdY
 0R8aYKCPf7WiKwmJX+fAbILx3Cj5LUwk8DoMAgv3PdKP+dmSVUuNkffvw2kBZqrN3I
 Mx1FjOn1u4/nJFKeY3EsCUT3m3r7PU+xzj5InkqH/heLfdTZUWERLTRuZOq7K9ZpPR
 Zqzg3A/2XLYjg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=VJQC117f
Subject: [Buildroot] [PATCH 1/1] package/libspdm: security bump version to
 3.8.2
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

https://github.com/DMTF/libspdm/releases/tag/3.8.2

This release brings a fix for the security issues described in
https://github.com/DMTF/libspdm/security/advisories/GHSA-j54w-759w-xj3m
https://github.com/DMTF/libspdm/security/advisories/GHSA-m4wc-xmvg-369f

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libspdm/libspdm.hash | 2 +-
 package/libspdm/libspdm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libspdm/libspdm.hash b/package/libspdm/libspdm.hash
index 1c7b6b3158..0e281a5471 100644
--- a/package/libspdm/libspdm.hash
+++ b/package/libspdm/libspdm.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2184a586bfe030218c6f336750d0fb0c3747fcfb0ed8af9a921bccb567029671  libspdm-3.8.1.tar.gz
+sha256  8d53d5072540ff86ffe496d83b83f49c82792883738bd23ae6ad41fe7c773edf  libspdm-3.8.2.tar.gz
 sha256  8c891ecf439cca84ceab33fc819c029a72c198f31818aa53a3788a0553841d6e  LICENSE.md
diff --git a/package/libspdm/libspdm.mk b/package/libspdm/libspdm.mk
index f76262c77b..fc3eea424e 100644
--- a/package/libspdm/libspdm.mk
+++ b/package/libspdm/libspdm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSPDM_VERSION = 3.8.1
+LIBSPDM_VERSION = 3.8.2
 LIBSPDM_SITE = $(call github,DMTF,libspdm,$(LIBSPDM_VERSION))
 LIBSPDM_LICENSE = BSD-3-Clause
 LIBSPDM_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
