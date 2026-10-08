Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE30CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:27:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 765DD40A28;
	Sat, 10 Oct 2026 09:27:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fs32n-vWxGgC; Sat, 10 Oct 2026 09:27:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6768340A27
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624472;
	b=fMcIaZMy31mI5F8ltiYw85fdlV0JZ68fYyw2+YHuWOirTD3uHvev6EZAvXT4szLnZUfe
	 DnFDRnAHEvqTKNm/I0GkIQxpSp7CsXUx54rgpafWKms1iXDomb8618j3KR2lZWLBtrmrh
	 yWlkBG/15rFeQXt2S8mER6m5NvY1kPsiWroSLDxla5IcdsJZ5UIi+j3xb2JbltxfCMxuq
	 SAIC8z5KREdfQjKtgdeOULcjZgjf8YL8x4wSOhV8Kbfbm19ScStHoud7h244Xwdu//aSY
	 4gWqFj93QQrCd+biFp+yPC7HbHVo3eEW7fO/+3qGrWZKEpBDNcztNh+MeU64Fgezj7Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624472;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=5FF6zooBIQZQqr9c5mDNfeSCM8vtrbTwzdFOc1KxZYk=;
	b=bwyXZASxa8LKrghJ+WzYF9PUH+f8ion1VFcYS7wf+uFDj2ZgJnhFIF8xSzeaUbZReRzk
	 d1R79u5PGnG8D/tBHJ4On1mMwvf9/ydJZUH3ZJAaXNbpKjVKnkZ7erWaZlLh1ZXarYZ9J
	 d1p8N0Vcow9kbLRph/vEWOOBGZixrHIcLJu594a5fRpl6VFMu3DdNeWub9u5Z4/jRkUHZ
	 UbikZ6yBnP/bkRmuLS2RXLybYW0uUCQXVTeTHrTAyGCa6Fnvwh+io/wDcYIc1OXptkcy0
	 EIJHxIYEBI/dbA9yjcda2H1cJBVeP2gHRX5A87mz8UTjsnxZrF5ptaGt2Uqw3HUsMKw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624472;
	bh=5FF6zooBIQZQqr9c5mDNfeSCM8vtrbTwzdFOc1KxZYk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UX+f8WQKB9g3Q7Tzu82OgLyAC3Uf5XuvpvURCmTWHhHXbZJtnG3epSyXIvMZvvX+U
	 Lm2p0II0ZcJqK+gZErfSOeUirO2eFZ91V8ETCbFjdC3dOFuIxDBqnXvs9vvAahDbM+
	 1hTa4yNgaj9pqVSDnuPaQYe9jGO/lgS6INnKraecgLCCru3+I/hZytEM3uOwfWmKsH
	 Gm1wp11kJa1xBqRD08yMQ6S4eUlA1/I0ejPY2tLkUYzeYBl7OIGsQNQRzS34yfdDgf
	 GQXB+T2UWTOE/UMYMw65SMEBLInaSfX3owW3lHxp/R6wSOLKBjSt73JekFTjPPqyDi
	 n5sHdcgAt77Rg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6768340A27;
	Sat, 10 Oct 2026 09:27:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 395C9A64
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3480E81173
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Iu2SohiefLf for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 07E1181126
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624442;
 b=W8u6bYyTsUqsfzTEROkbAE9XbHHHrXoXPTcip01rvXj5QEkngN4AXOKyxyxMnb3MUZjj
 IvAnFUHNIJaTsk69tTQeyNYmdSq2ukgGSpc6wvYnKjjdreTpGbBgICrWPu5Tm7MZbPaEw
 1ygHOqNmGs94JVW8q2moHP286vRZhoT/VtaPU7D3vMACq5awg6k3jrrEWOoh3DTXagcDC
 CEC8a8z8SkAMy4bKNGH8CfuRYLLP4jZyBnGvOASNGfN0VBq2//zd2qAuimE7/IRhnbkSj
 RP1rnO73ZMB6KhFHn5R4ouuQU+bDGxaFWZVY/DYpTkZbvhJ/z7I031P4vZRpjNDg62g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624442;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=5/J1sVLWri9X81HlcdYfKy3adz4YkhyWstMfNZvvt44=;
 b=RTAZWmvOxUpvpSJjknHEdxPzgcs/HH7BB5O5cWruvUwMM/ap1sEdA335/MQJ+Yjmth6q
 UaNJwpue7Yz5AJ3axx6BEVsdltvordq+yGZ5AktzDdR9O1f26GjxYfXBpUrjrqMEYKi4Y
 fHhWLxbzN6ikbWK520bM3DcKixn25VS8HqM5ui/RiERqnrC0D0j5mzlMTXJOPRZrBwWa7
 hF2xxHbnY5+GqqKvSkl95EAwyN7fRG/6kOGHH4Vzd7jQKG76KZ3o/QOdeHXEsKVzpQHYG
 /zsjryrQM5KFuw/BD7wz+57LGDNIy/p/gBPjXCALOTdNugGIAFAe0aqPXQcnGTKrw7w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07E1181126
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:27:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E44688F1BD; Sat, 10 Oct 2026 09:26:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 12:07:39 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6a804f7557f22d963dc8eb9b7d20b1fe783498c3
X-Git-Newrev: b8d6d076888e5af4c6fdff7bbce2318b69be7bc4
X-Patchwork-Hint: ignore
Message-Id: <20261010092603.E44688F1BD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-twisted:
 bump version to 25.5.0
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6347011640813056977=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6347011640813056977==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b8d6d076888e5af4c6fdff7bbce2318b69be7bc4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/twisted/twisted/blob/twisted-25.5.0/NEWS.rst

Updated license hash due to copyright year bump:
https://github.com/twisted/twisted/commit/662f2a9b0563cd7a0f6acf0ed92891ae2cd7e1f3

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit ae6ff907b6f1583398c9299ef8713eee5a617de5)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/python-twisted/python-twisted.hash | 6 +++---
 package/python-twisted/python-twisted.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-twisted/python-twisted.hash b/package/python-twisted/python-twisted.hash
index 436f4c48a7..f3cf53bcaa 100644
--- a/package/python-twisted/python-twisted.hash
+++ b/package/python-twisted/python-twisted.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/twisted/json
-md5  a21b5326a74079a92d7bc4748b419280  twisted-24.11.0.tar.gz
-sha256  695d0556d5ec579dcc464d2856b634880ed1319f45b10d19043f2b57eb0115b5  twisted-24.11.0.tar.gz
+md5  845d6782c2236ef764f3849948f4bfad  twisted-25.5.0.tar.gz
+sha256  1deb272358cb6be1e3e8fc6f9c8b36f78eb0fa7c2233d2dbe11ec6fee04ea316  twisted-25.5.0.tar.gz
 # Locally computed sha256 checksums
-sha256  78d059391dddba18a695c1998ac9dde68160a1df1635f34adcfb3ecba4564802  LICENSE
+sha256  16b7f6825ee8aaed193e7fcfaee67ab493087302c700483f8991f22b70c539e1  LICENSE
diff --git a/package/python-twisted/python-twisted.mk b/package/python-twisted/python-twisted.mk
index b7217da6e4..8db5d3750c 100644
--- a/package/python-twisted/python-twisted.mk
+++ b/package/python-twisted/python-twisted.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TWISTED_VERSION = 24.11.0
+PYTHON_TWISTED_VERSION = 25.5.0
 PYTHON_TWISTED_SOURCE = twisted-$(PYTHON_TWISTED_VERSION).tar.gz
-PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/77/1c/e07af0df31229250ab58a943077e4adbd5e227d9f2ac826920416b3e5fa2
+PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/13/0f/82716ed849bf7ea4984c21385597c949944f0f9b428b5710f79d0afc084d
 PYTHON_TWISTED_SETUP_TYPE = hatch
 PYTHON_TWISTED_LICENSE = MIT
 PYTHON_TWISTED_LICENSE_FILES = LICENSE

--===============6347011640813056977==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6347011640813056977==--
