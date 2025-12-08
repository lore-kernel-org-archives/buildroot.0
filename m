Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A280D3B7EA
	for <buildroot@archiver.kernel.org>; Mon,  8 Dec 2025 16:57:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 014EA40B2F;
	Mon,  8 Dec 2025 16:57:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2N75TUePnuin; Mon,  8 Dec 2025 16:57:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E53F640B18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765213027;
	bh=qRk2ubyZmWJsysb3ixXYzcZtAQZtmcTWVHJqVklcGzo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lme2k9HvCbNHUnmdEbbaXHd0OLkdXI6CQDe5tuflJVZ17sN1BCwLgZzZUmAXK2vT3
	 NPylVNZvUUZka3+y/A/DHlbnD5d7Xt5dYn8KoYPP1H9r9yKrn1d1Q7X6kGqK7C6Not
	 hOvomYgNhzEFSxrdjvGcfKQx2ltDJSbreehjJdIy2j1m/yiiCUm/VbEdAKVkBnC22Y
	 poCfBlkreQ4YMNOK9y35keehJoM+OZKP8JFQQZLmHlxQCWOsrBD9e+a1AAfMgAwOrC
	 ZwbZnNRmUuSCF0yK1YwL5JrDFYkK4NJ2/fNIJHMWVXCt38cGUScNkkdTdG7k9LAVBC
	 pbkODlL4IbovA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E53F640B18;
	Mon,  8 Dec 2025 16:57:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 25FC0E7
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 16:57:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 245CC40AF9
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 16:57:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Du5hDPp14MEQ for <buildroot@buildroot.org>;
 Mon,  8 Dec 2025 16:57:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 60B3440AD9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60B3440AD9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 60B3440AD9
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 16:57:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 85887A4C0928;
 Mon,  8 Dec 2025 17:56:59 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38898)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSeXi-000000004do-3Qmm;
 Mon, 08 Dec 2025 16:56:59 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  8 Dec 2025 17:56:58 +0100
Message-ID: <20251208165658.3644480-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765213019;
 bh=uG62M0ldYNqurkAQs/wyOsabjawvor36TcMPx84zZuA=;
 h=From:To:Cc:Subject:Date:From;
 b=fNorFqM8vtTVTVQswuByKgOlXuxVsM8pJ3C4AIZh2B9141EQsRcscyiojnAI960mc
 HaIyVXvH3AWi54aUrEcNHTuwjuGKrOuCbW9IEsmrcHWkAuPJVEh2ysgtiq9yjBU7Nc
 lAQmhUJyadzguJXB6hEHgRQ4zaHvNbjr3I+NpWDZVpc6ahbawcUnVUAZYF2+0q/q2V
 wiNjCXiDDz0WutPKeZn2dJpJ/oXbiBgmIwrECMKyZpkIUIfYnwq7LRftRcprN+yAHQ
 jS8dDh9nngMEIJiXDGuRl8HEg3gDyw0OlfuVlp9sQOkblsOUtQDUqC4khyp/FPBMQ6
 fJcnXNlavY94g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=fNorFqM8
Subject: [Buildroot] [PATCH 1/1] package/strace: bump version to 6.18
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

Release notes: https://github.com/strace/strace/blob/v6.18/NEWS

Buildroot commit a06d79862a60d3c8d5ddd6a9ab12b5ccdd91984c bumped the
linux kernel to version 6.18 which broke the build of strace.

The build error was not yet recorded by the autobuilders.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/strace/strace.hash | 4 ++--
 package/strace/strace.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index f6833d08f0..6789d8048a 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature with RSA key 0xA8041FA839E16E36
-# https://strace.io/files/6.17/strace-6.17.tar.xz.asc
-sha256  0a7c7bedc7efc076f3242a0310af2ae63c292a36dd4236f079e88a93e98cb9c0  strace-6.17.tar.xz
+# https://strace.io/files/6.18/strace-6.18.tar.xz.asc
+sha256  0ad5dcba973a69e779650ef1cb335b12ee60716fc7326609895bd33e6d2a7325  strace-6.18.tar.xz
 sha256  ca2a0994c57e48b16828008c80cdb626e471b6b59116a8443b2ce4e3c77ddc3b  COPYING
 sha256  7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa  LGPL-2.1-or-later
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index c693d15bf9..5230b4d60c 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 6.17
+STRACE_VERSION = 6.18
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = https://github.com/strace/strace/releases/download/v$(STRACE_VERSION)
 STRACE_LICENSE = LGPL-2.1+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
