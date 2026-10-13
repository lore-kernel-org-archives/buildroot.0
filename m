Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A6A0CC6B03
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 11:57:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 264E060653;
	Tue, 13 Oct 2026 11:57:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T4jw3gng9x-h; Tue, 13 Oct 2026 11:57:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 161AF605E7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791892663;
	b=hiJIsY6SAx7b4iTsjOjbeBQq3PsacbgAoGWAIlOXFOKk8WPegcEbo02eYHmDMNjJ2maY
	 yI6ZkwjsRV/HCt3EVIQ2GXZIpLDLjP7EjuYLfHkpl6VNAlfqLdeV7SNZ6naJb30Sm4tI2
	 F2B5HanRsK4vDrEyXpjMuFXoNgTH1mBFYY/BXletBY/qN9f0XYNHgQgC0tMd7U52izX+F
	 0puqOywJ/MgbFozwi7XE/K4X/KM9iVrV/OKtNlJ9DONsAOpTHP70mhO4BvL+RBlJc0CIT
	 rW/A/IIngcooX3wDNjH8MRnG9yjByz0BQ+MTMpfUMzENypvCOOxtjNjOEw81mft71dA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791892663;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=smdKrViXReQjnaLCjN7zXM8izpGZ3DXktBRt62M5cx0=;
	b=RJhF9t967gIbIWinuJvgcDOmpq9/sUOn9UXTqi2iYiX4nDrOhNqY7m/dnN/71Ye7chFo
	 knavjriKSrwo6Hyvmt+V3boRzFaANgRlPbcPE8Syrunx98VQktQ7llNLiNYbqK+e8v18T
	 1xSvVdRmBVirTi81SzSNAwq58jxp3UbRJmNESoEKillZ0eyFERFHkdVlVRTxk23AgazXb
	 gI2GEop2VCrVGqFsMZqUEfRDoskx0Qh79rKLNCcwp9KbILin4CqANSbE/ky4r0/lVacfU
	 oONcrT/8bUwmbezxVwOG8BQ39OouM7RyU7pF0fK8JQGlZ7V12Zd0G3LwW4KcxqFSgBA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791892663;
	bh=smdKrViXReQjnaLCjN7zXM8izpGZ3DXktBRt62M5cx0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=d5S/fQ8wiQViF/tQ+7AdZmtaXI67KThAtyInb5BRgKGygZjfnTAV+AViBUDUzHSsx
	 VjzLy7fv9BGES1+8PSCtPXVJURj03apLD67Y7DxIpqVzl6tHgrbnEJ7gXTyIq7uz9G
	 w+3BrSASHK/xwhiuHjX0OUCMvfK1PNu4mHB7Jh6rLDR/hnOj2Ln9i8lSxNTjgKeAAl
	 xlgvl0psmRigimai33cmIay8PBkRHbx9J1rOL4LmjFBNqraD21nCJkcn4pIfa0ZMLA
	 hHe6eYiE4gFmhJPqqGKiZBp/pfcO3v7b9pfPtqV4mVEIzK+h1QaubvtnHYCOZNd/9M
	 kNAI7854dxhRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 161AF605E7;
	Tue, 13 Oct 2026 11:57:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 48156129B
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 11:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 298ED40282
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 11:57:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KAP4JFZOCR9m for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 11:57:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 6C62640296
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791892657;
 b=VXgT93v1J9MCmlEeaxaZfDwm8yKDgskxq5FU6XnQkWzQPdDFb77QDHshwav6iYhGMh8X
 SDQMer0y4ItJsklIVxWsYfg28+vn/NWw6s7k36a5Ox2KXG3dp1gkHizP3Vlj7fSyvrD8I
 B/vSCjOGN9ul7bvsVQzwpgtmGeTcKIxqS/y5b5g4u6x1rMUpJdYYiN1g7udso/yTysU1c
 AfmBuQfesLKJJkZKy1nOEiFQqkWYJPhieeY4gA0Tu75pCYZlgGBDK/qjKAgwERlKt/UQg
 xb1juIfH/4j6HsXSAGLgLo9OZatvhEVebVv8YFJsWpnQ5oGJ1zDusoqeg7qXZJLHOtQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791892657;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=9aZzTbGw5Ayh1RfTkaApuhvFdq7QaAMGd+k0U3cnhYk=;
 b=DC6nUhUgaiSwUXpb97bwa8+GdE3v72hb0hInkJhKrXtuoAty51D0HDUu4hZdet7a2IF6
 YmWBqguOWfCRLU9j+j9RZXkNRHENbr22anNlwPFUA1moz1DZVBxiJmyVvKvoAPFRiHu78
 qABAMZGe25FnDZauV+SFNf3oDAjRB+Q5pRugVv3uQfj64+NFCotsPXQHyhwnzI+PU7qao
 HjIzBtM0O2lFf17nl1n+wXfRG5SCWdbFP+WPY404BjvU+CQquRZmhQc+2GIrdmlDPzwhM
 TEx3SbM768gj5P7anLdtw+VcPjuQvI/USzfW5lxUwL6gIlPNsg4dit8WYCxbpCBNigQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C62640296
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 11:57:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BE312956A3; Tue, 13 Oct 2026 11:56:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 11:55:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 876ca37c01d8be203f79fc37212090de5e8fd0a6
X-Git-Newrev: d2699b79baa9c7dd39334f021c09a477cc6ee622
X-Patchwork-Hint: ignore
Message-Id: <20261013115617.BE312956A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-http-date: bump to version
 6.08
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d2699b79baa9c7dd39334f021c09a477cc6ee622
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

diff LICENSE:
see https://metacpan.org/release/OALDERS/HTTP-Date-6.08/diff/OALDERS/HTTP-Date-6.06#LICENSE

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-http-date/perl-http-date.hash | 6 +++---
 package/perl-http-date/perl-http-date.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-http-date/perl-http-date.hash b/package/perl-http-date/perl-http-date.hash
index a6f7701829..844641826f 100644
--- a/package/perl-http-date/perl-http-date.hash
+++ b/package/perl-http-date/perl-http-date.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  60462359bfeb1e6d14602508cfd07885  HTTP-Date-6.06.tar.gz
-sha256  7b685191c6acc3e773d1fc02c95ee1f9fae94f77783175f5e78c181cc92d2b52  HTTP-Date-6.06.tar.gz
+md5  5955c394ed659bf4cd41fbd526c42ec1  HTTP-Date-6.08.tar.gz
+sha256  b57d80ca6d821c6949ca48b27467d45aba7a9c77346562306facca781a003e44  HTTP-Date-6.08.tar.gz
 
 # computed by scancpan
-sha256  6186a79a305a0e62c5087f9737b4f66fa5793fa1b396da0126e3c8722c460245  LICENSE
+sha256  994ab45a4f8ef43f47b7baabc48d100838c42d226d8d161d6ac1f49c5f9d7c84  LICENSE
diff --git a/package/perl-http-date/perl-http-date.mk b/package/perl-http-date/perl-http-date.mk
index 2f1aeb7da0..a66130935d 100644
--- a/package/perl-http-date/perl-http-date.mk
+++ b/package/perl-http-date/perl-http-date.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_HTTP_DATE_VERSION = 6.06
+PERL_HTTP_DATE_VERSION = 6.08
 PERL_HTTP_DATE_SOURCE = HTTP-Date-$(PERL_HTTP_DATE_VERSION).tar.gz
 PERL_HTTP_DATE_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_HTTP_DATE_LICENSE = Artistic-1.0-Perl or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
