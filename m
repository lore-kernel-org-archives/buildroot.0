Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B8D0FF8867
	for <buildroot@archiver.kernel.org>; Mon, 27 Apr 2026 20:15:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A41388124B;
	Mon, 27 Apr 2026 20:15:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iOE4Wrjb_NCw; Mon, 27 Apr 2026 20:15:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BB9981165
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777320930;
	bh=jmVwaTvGmwJKfgmOmbtfsXQrwxHrxC9Yl3l/4LgvOpQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GcjP/KJu0V3u4M3wVXmy7tct6fTzjkB0DizI7GuRNt35akeuTGUFOTNHD9h9GeN++
	 AQsF03mxkk4lew9eCIvAP0xmTTsPEikM2gRpGQ+1PznsLTJfsYogEp9yP20RcJqKvA
	 DhfEj9AQJ6B/pDMGFHAlkuQ7HPQg7TnZTGipNtB50TbiwlvbyQrtJTnyz7vA2p2Qt9
	 B1JRXdDKjQM/TvisbLrXUfA/1iyYUYbJl0UEAYO1AdpXFXiTiWJUaYXLA7ob2LyYFQ
	 2Erk+M3SLl75MmSa2m1rkbzyV7M9LeobLiK02aSnz35oMbyrVm4xZFtBYvH8kn9guN
	 lJmEPV+AeRw6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BB9981165;
	Mon, 27 Apr 2026 20:15:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 12A021B8
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 20:15:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E67E4400C4
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 20:15:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YeCSvEO20WXf for <buildroot@buildroot.org>;
 Mon, 27 Apr 2026 20:15:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 23D6940027
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23D6940027
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 23D6940027
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 20:15:28 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c5b2.dip0.t-ipconnect.de [79.214.197.178])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8FD2DA4C1449;
 Mon, 27 Apr 2026 22:15:25 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46160)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wHSMW-000000006AZ-3XXi;
 Mon, 27 Apr 2026 20:15:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Will Newton <will.newton@gmail.com>
Date: Mon, 27 Apr 2026 22:15:25 +0200
Message-ID: <20260427201525.3447689-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777320925;
 bh=Wh3zM5DnpRwIVcooqbhPk99SCrzpK942HQgLgk+WKTs=;
 h=From:To:Cc:Subject:Date:From;
 b=TXTEaNfCXfxJIyFSGSEygmuvfA5S9ivnGxlp8p808iEUodhW6OQZNKWe3s0cxpvsK
 GKH46D30raA5I/sbQ2GiAQZU8nDVHQMlvCn4T28veoDSyHmWgIIDnk3J2kkwkZbGpd
 u5MFuMTLm78+/qsmYJBDweie9Zy8bYUtYFERfxFtlm4w/NyPtbfBuHzZYOJ/fI9VwJ
 AV04VLaW3YajkkyNzphU1Qri/Aptsqli13J8BKy/fyJLVTXQhVMuJcUvrEYfl+yjaN
 aPd3bvmUcosWvuXzALIP0gbglOF6p4h2noM9YcNjKx0di89VikLZfBYApYnM9xk+hc
 GdcahV9P+gvxQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=TXTEaNfC
Subject: [Buildroot] [PATCH 1/1] package/libmicrohttpd: fix build without
 pkgconf
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

Buildroot commit 712121326f84e2508ab161053c2b04e45511c79f bumped the
package to 1.0.5 which includes upstream commit
https://github.com/Karlson2k/libmicrohttpd/commit/a1f937422658d3c6d53853c587bc025274afac4d
that breaks the build if pkgconf was not found:
https://github.com/Karlson2k/libmicrohttpd/blame/master/m4/pkg.m4#L84

Added PKG_CONFIG=true to _CONF_ENV to fix the problem.

Fixes:
https://autobuild.buildroot.net/results/e3e/e3e25753c670b5d86d042d850582e2e1e0eedca5/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libmicrohttpd/libmicrohttpd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index 7a243b42cf..01d8d5f11e 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -20,6 +20,7 @@ LIBMICROHTTPD_DEPENDENCIES += host-pkgconf gnutls
 LIBMICROHTTPD_CONF_OPTS += --enable-https --with-gnutls=$(STAGING_DIR)/usr
 else
 LIBMICROHTTPD_LICENSE = LGPL-2.1+ or eCos
+LIBMICROHTTPD_CONF_ENV += PKG_CONFIG=true
 LIBMICROHTTPD_CONF_OPTS += --disable-https
 endif
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
