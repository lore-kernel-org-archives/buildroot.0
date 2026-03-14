Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A01F10706EB
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 17:18:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB5F760AC0;
	Sat, 14 Mar 2026 17:18:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YlCJ08XioxJq; Sat, 14 Mar 2026 17:18:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFB946081C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773508692;
	bh=/0v1QLuxJBYLTPkTk3VlwWsGDMzx2VzGvQ0BLGEUnMk=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eLik+04lcCDno2YX/JLe/CGBI3g0MkSjNyz9ucjk+z765W9RELllTMkyBX3zzxGBE
	 QXYWA2ed3oA4keh5s9ZPFQopkbd0war1DeB1nDuk8EoqxEVEYL7a7e2lAK8oNjGIkh
	 sa2/TixvKCGpReRWt6LO3nwZ5eODFDQ9aSt0fiyxItJi0o4R0q9W58zczKKtNAVFF/
	 hwWK55j4kNIMGt5UjwIz48LlSQ4L4GOKAxDLJfQ5lwSw+hPVfrSL9MD8ZLPv3LgsNE
	 m28iMApNcWtjUgKSNDWK7d0NFqxlcVzb5fFG61khDFM/vy89dhj4RFW8FuD3ysAGSz
	 CMehb11bpTHXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFB946081C;
	Sat, 14 Mar 2026 17:18:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DE881B4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 17:18:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4FBD940076
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 17:18:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cxIzPiSREmnh for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 17:18:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3BB0D40073
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BB0D40073
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3BB0D40073
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 17:18:09 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7DCE7A4C0E21;
 Sat, 14 Mar 2026 18:17:54 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54836)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1Scc-0000000045I-0d1q;
 Sat, 14 Mar 2026 17:17:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Julian Scheel <julian@jusst.de>
Date: Sat, 14 Mar 2026 18:17:54 +0100
Message-ID: <20260314171754.3071677-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314171754.3071677-1-bernd@kuhls.net>
References: <20260314171754.3071677-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773508674;
 bh=AmZMSXhfxWZw5tXBnTWwaYgjdpJ2iFyAEjwqgYDC9lE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=utfY/m6iPPzeUGVIuyiSLRjNcUXHrERxW4GN1xVc6eYXVgPjoZ0c1qXfP1BhYxU7+
 SOXuI7Lwaq+jg/jjwq6aKMbTPI5DAQ1iY+DWn7D12w8jPZKfW307bd1It5XfB1F6hn
 3ZCBaZF3ffdUwGjq8nhCO0dM7PkJSK8po6SOYsPyZCZdYmErvHtpvSDT3tOM34RTR3
 WnzdJWJ1I8i7Nk117VKdVhZBRIV587viqxmUbm/RcuWoaQjsl1xSX/3Tofp2IMGqhK
 C97LEXUD09DzbGAEy91sYy8XVbIqfpbKYfbYtDF9EcA8/2f/wcFUq2k6SVt+50S4fi
 FgaQjCbCRd7pg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=utfY/m6i
Subject: [Buildroot] [PATCH 2/2] package/dvblast: bump version to 3.5
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

https://code.videolan.org/videolan/dvblast/-/blob/3.5/NEWS

Depends on bitstream >= 1.6.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/dvblast/dvblast.hash | 8 ++++----
 package/dvblast/dvblast.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/dvblast/dvblast.hash b/package/dvblast/dvblast.hash
index 1b75d779d9..3776cef525 100644
--- a/package/dvblast/dvblast.hash
+++ b/package/dvblast/dvblast.hash
@@ -1,7 +1,7 @@
-# From https://get.videolan.org/dvblast/3.4/dvblast-3.4.tar.bz2.md5
-md5  148a26e1207e111f905461cfb1cd106a  dvblast-3.4.tar.bz2
-# From https://get.videolan.org/dvblast/3.4/dvblast-3.4.tar.bz2.sha256
-sha256  7abd45aff738544017350af87ec7ebad00fcfb4e4effd04f35023d504d9b6f44  dvblast-3.4.tar.bz2
+# From https://get.videolan.org/dvblast/3.5/dvblast-3.5.tar.bz2.md5
+md5  d244aadb0b202a0838449235fc5f27dd  dvblast-3.5.tar.bz2
+# From https://get.videolan.org/dvblast/3.5/dvblast-3.5.tar.bz2.sha256
+sha256  baa5a9aa1726b97240e16fef8856395cd42440aee410bf479479249f9cce6076  dvblast-3.5.tar.bz2
 # Locally computed
 sha256  94f68aec169fb6c9937eade757251714d38a56812be5dbfc3973914a71ad8d2d  COPYING
 sha256  2c1bea2f338d46ee6f2712f2c2bf05b874327ca0bec5eb0b7b4fbe208a23677f  COPYING.WTFPL
diff --git a/package/dvblast/dvblast.mk b/package/dvblast/dvblast.mk
index 3571ff3c74..c3e19f3e3f 100644
--- a/package/dvblast/dvblast.mk
+++ b/package/dvblast/dvblast.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DVBLAST_VERSION = 3.4
+DVBLAST_VERSION = 3.5
 DVBLAST_SOURCE = dvblast-$(DVBLAST_VERSION).tar.bz2
 DVBLAST_SITE = https://get.videolan.org/dvblast/$(DVBLAST_VERSION)
 DVBLAST_LICENSE = GPL-2.0+, WTFPL
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
