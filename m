Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C439CD37B2
	for <buildroot@archiver.kernel.org>; Mon, 11 May 2026 15:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8E8880306;
	Mon, 11 May 2026 15:59:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g4349PJqV3O1; Mon, 11 May 2026 15:59:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FC4680068
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778515172;
	bh=shW5yX8N79NPyO4IAJ7RG4vw2YlbSzp9Cig23+OngBg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=W2o3I4i5IF2kcxWrHsSwInWvTApcTR08ueFpqC40qIhTN+dShuyRU5Wd3Me046h3K
	 KShxuJZs+FflVGF03++FZmii/d0fhEGvQDn9WNiqZQ0o9BYjCwXgkhpfrm9l1WQTIO
	 w55dryyJeTke8PoqWsVbMAdKoDmSkA9+1IOwobhmBsESLvjkOzKySVa+mS7e0QOnn/
	 XkOw1oDLiyguuvoW0hiuax2v27LV5LQExlST4T8mF6eaBHz5NcYP9aQlA2la5clWRr
	 u2Owdobrz9CahNliWuPTk5aD8um7PZwdtFyHmH/9TxzIMDmE4UP1m55CrJya++9VDa
	 AFyBNL2aexyyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FC4680068;
	Mon, 11 May 2026 15:59:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 59A02223
 for <buildroot@buildroot.org>; Mon, 11 May 2026 15:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EE9E60035
 for <buildroot@buildroot.org>; Mon, 11 May 2026 15:59:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QblwjnvLpw1j for <buildroot@buildroot.org>;
 Mon, 11 May 2026 15:59:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 32B1A60034
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32B1A60034
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 32B1A60034
 for <buildroot@buildroot.org>; Mon, 11 May 2026 15:59:28 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c559.dip0.t-ipconnect.de [79.214.197.89])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C5755A4C3595
 for <buildroot@buildroot.org>; Mon, 11 May 2026 17:59:26 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60354)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wMT2U-000000007Y2-0TCz
 for buildroot@buildroot.org; Mon, 11 May 2026 15:59:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 11 May 2026 17:59:26 +0200
Message-ID: <20260511155926.1225557-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778515166;
 bh=zPOoO0LZsWn7EabtdMUpRco89I0D57sXGz2A64bWqew=;
 h=From:To:Subject:Date:From;
 b=GCHPfZSCpl89wev/mWwL2wZZ5xKy0MVDoEzNlFnMTqSPAVFd3cpQYG6+G2aC1BUrx
 3tiTLy+yHL+ZTMwi8VaM8BOZ4DqNS2SOYCr0n4Q/7UrUMzVhtzh9sv/xCF7hMkhdZn
 MVx//tm/7B63iPDrdAuiYHokRL4MMLBeeRW1f275H7J4Ff43o99hsLoNiyk9vDjji2
 laGcVVOdM9gx0+s/0s+ds/658pjGnJkowcitmYFMKgFD4M4GKXTlQUgym7EA/weKn3
 RB8cChw9H4Gt6j+ZYi/1tgJ5erDagM/dFDEeeWYT/Fv43J4xURM6bDn6KPyspURt5+
 6Y1gnA6u8o8hA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=GCHPfZSC
Subject: [Buildroot] [PATCH 1/1] package/libksba: bump to version 1.7.0
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

https://github.com/gpg/libksba/blob/libksba-1.7.0/NEWS
https://dev.gnupg.org/T8121

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libksba/libksba.hash | 4 ++--
 package/libksba/libksba.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libksba/libksba.hash b/package/libksba/libksba.hash
index b7e1e2f9f5..afb9e5756d 100644
--- a/package/libksba/libksba.hash
+++ b/package/libksba/libksba.hash
@@ -1,6 +1,6 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  ff1705f512ab18323571e009d8ead407f7d0279f  libksba-1.6.8.tar.bz2
-sha256  0f4510f1c7a679c3545990a31479f391ad45d84e039176309d42f80cf41743f5  libksba-1.6.8.tar.bz2
+sha1  789ca7db1b1dcb87bca3eb2f53d5e6729810e943  libksba-1.7.0.tar.bz2
+sha256  e1d3a5745911f5a663fddecf526541c4241052a9e4cafbc92dc7f4096c7efdac  libksba-1.7.0.tar.bz2
 
 # Hash for license files:
 sha256  078dca2d4a2a5d19788b18dc05e039f7a63cb789f6f0b6f9e3fbe6284e6968bd  AUTHORS
diff --git a/package/libksba/libksba.mk b/package/libksba/libksba.mk
index f43693872e..10ec0ab2d5 100644
--- a/package/libksba/libksba.mk
+++ b/package/libksba/libksba.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBKSBA_VERSION = 1.6.8
+LIBKSBA_VERSION = 1.7.0
 LIBKSBA_SOURCE = libksba-$(LIBKSBA_VERSION).tar.bz2
 LIBKSBA_SITE = https://gnupg.org/ftp/gcrypt/libksba
 LIBKSBA_LICENSE = LGPL-3.0+ or GPL-2.0+ (library, headers), GPL-3.0+ (manual, tests, build system)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
