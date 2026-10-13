Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7383CA9ED2
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 11:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85D464030A;
	Tue, 13 Oct 2026 11:57:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fn5Z9eHcCewW; Tue, 13 Oct 2026 11:57:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 90B3340311
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791892659;
	b=bOvTdne1dkhyEKJZOTOA/+TsAfBWT2J2NmPJHGNcd5gB8yX6UpSmCA4cOa2q0mQ8Ug54
	 XEj4kK7vsod+ju39/rP6ISkPVHb2e91+hxKXN0ig0iUxRbGO0yAsN6E7FeicVSk27oGpn
	 eobNFVWHa9fJAsPScAFbMtQ0Pk+XwIrcYGUdz266StkHgD8ULHjSmy1huJf35iXOtp5UW
	 4sGZmGF3Yree74MQ3NnAVLqufUVqBWvga/1Q1fDytbqRj0oD+SDafZeYizP/Jlx8OuGx7
	 UbrOWoKmQIywoh1plBm4XFpfWLo0gSGlCU7TEu7w91OfEQAfQJOfEYoTA3VyKdrLXdg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791892659;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=RbvUuzvq7X8N6oFI7u0x1mmMOblfWdD6aNBHq7xW/bA=;
	b=i+cxFgbo16cyQPVRsn67T7hAwOc8Q5WMasEZWhl/dGTuW88IiFwkbWLzMo+K2W3Jipkk
	 VjVW0vToSStaKrsbfzrW+PUowUK4GimgZT6jJ14KCy+HUsRPHtpy9kWAAbGUIPo4lva7Y
	 4DlpZAAz9WlDagry+86HB8+0uOtpp4cO+IB0PUz87q54YJEw5J05YaOCXjlKIC836w+DA
	 uizbn6vhenZxATV4qK9rEBlkSRI9hTzDCQQHh59NK51DnD2gmw6Qq6CxRwcTfISSrAh62
	 lF30DBDUBf1DDOjbYT+zj6R3lWwgqQ2q6u7LMs3Fy17Lvx1+wsclnAQCg8QfwN8wzDg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791892659;
	bh=RbvUuzvq7X8N6oFI7u0x1mmMOblfWdD6aNBHq7xW/bA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=a007EbbngWvfaFrVDbvsFYDR99Zm9HatknyfzOfHbmEY6vGMbuUj846XU1u125sn9
	 5Px6f9U+C3YwZ/cgpV6PoDb/AX5g7mEfUTXp8wfBHohiBIMKnW89JitlJf4xaVu3uf
	 E1d3Xm7q1yvmFQQwOb6wDyhQGwClq+Zp/K99sNNK0IpfSeA2xU1bjOpi1Dtf40/+82
	 zZ8XGgr6I2b7FEAXH9qg1EFVuXL3bx/v1QQ1aabTbKFNGk43E4ihLl4tbQnlt4R/sd
	 dmYrG3fvl4NzvTNFH1Wemv16YVJuRclNkHFQK6VE8PDpzHGQ3n3tJ4LW6v7izsZojc
	 qOUcVuriEN22g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90B3340311;
	Tue, 13 Oct 2026 11:57:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 208A34DD
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 11:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 100464029F
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 11:57:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BwCFtFXxPX0V for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 11:57:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 5EE3640282
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791892657;
 b=F3fkF3HxMs7wovGE5fpNgJGC7dewJ7//1oT5lac5r/lp7sJh5ZaAEXhRwWWlr4WacQFu
 48bIJjKOQxClL+aoHRzGvnEbR9btxtqzPykwL8bCDbqqDW5AJ+TzHHCU58CVIpKphzed/
 3tII/cD74e3u8hx04PXYDgfkAZ1+bLLI5YM4BZO+FCf5qJDgK/cICRZyej3Y2xFp7vsmx
 0Vj7BgjoYm4hFfcukQURV+WLHfRr/Vmz4Ez2kDxWkpK5f35P1cRRl+cbhRp6dShBbGKBN
 CT5l4dR+fxMUJ9/TlPEUwElzjMXaIvFueQ4taP1v8shnZcGWKXKl18Ogb3zrHyphTbg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791892657;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=wHM3WPPVz2HOhU8XO963rn8NNeMlNpjw5HDFeFvBIVk=;
 b=CHiJcAX1mgJeIU1gWmPO81cjmvNJE4DLxrQLLbY+6eD9Dz6V82eU4h/t8U35uwqtGPBm
 W1enMW8DVd+j8KTwCgaW/So+2l0GAW4FVm/iTfoiduMCVJ/nvO2xHa06ddEDvGbjMtdR9
 REYscK0POC8yWUKFUqS3jmb8LN6fzTvzamfnCocNTD93SSo9QmTbkhGGf7xfCZZ2a9VzL
 KP6omaBjfb/epuO/Lbh9GHXZACpAsSDylF9R+Hsn+wNmO1YxSc8IiQmM3PAbtpPk4LM12
 ZI/j9Ioq0fiOwrYoLyLIFa5BbRTVpgIWgu1PcZ2OCOrYhuka1eEITBg5ACWlXFWATeg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5EE3640282
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 11:57:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B4384956A1; Tue, 13 Oct 2026 11:56:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 11:55:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9077096abd6bdf9a1fbe9d205d997ebcc8f9ec41
X-Git-Newrev: 876ca37c01d8be203f79fc37212090de5e8fd0a6
X-Patchwork-Hint: ignore
Message-Id: <20261013115617.B4384956A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-html-parser: bump to version
 3.86
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/876ca37c01d8be203f79fc37212090de5e8fd0a6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

diff LICENSE:
see https://metacpan.org/release/OALDERS/HTML-Parser-3.86/diff/OALDERS/HTML-Parser-3.83#LICENSE

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-html-parser/perl-html-parser.hash | 6 +++---
 package/perl-html-parser/perl-html-parser.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-html-parser/perl-html-parser.hash b/package/perl-html-parser/perl-html-parser.hash
index 3de461c7ef..6d6ca1e522 100644
--- a/package/perl-html-parser/perl-html-parser.hash
+++ b/package/perl-html-parser/perl-html-parser.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  17a4c886024bfad1cffcbe6b46cda128  HTML-Parser-3.83.tar.gz
-sha256  7278ce9791256132b26a71a5719451844704bb9674b58302c3486df43584f8c0  HTML-Parser-3.83.tar.gz
+md5  e08b9a5c118e392bf3d7589445ab3752  HTML-Parser-3.86.tar.gz
+sha256  5305e1d5faa70ee0aa282d85a5c9aa93911e8c7afa590ad1ced5703a544e20f6  HTML-Parser-3.86.tar.gz
 
 # computed by scancpan
-sha256  cb797b8a92dcb2329dcde194a3032d5d94c172289e9e54ffe8dd1785bc3de2df  LICENSE
+sha256  c371a9aed7094062bb8cfad3da1bc45fa1984b706443c78cdcd8dbc06a63c509  LICENSE
diff --git a/package/perl-html-parser/perl-html-parser.mk b/package/perl-html-parser/perl-html-parser.mk
index 02ce08b567..d7cb1be856 100644
--- a/package/perl-html-parser/perl-html-parser.mk
+++ b/package/perl-html-parser/perl-html-parser.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_HTML_PARSER_VERSION = 3.83
+PERL_HTML_PARSER_VERSION = 3.86
 PERL_HTML_PARSER_SOURCE = HTML-Parser-$(PERL_HTML_PARSER_VERSION).tar.gz
 PERL_HTML_PARSER_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_HTML_PARSER_LICENSE = Artistic or GPL-1.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
