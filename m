Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6654CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E0B681753;
	Sat,  3 Oct 2026 15:57:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ycb8tktzSAvO; Sat,  3 Oct 2026 15:57:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 3A4238186A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791043027;
	b=cct3xP30P0E29ZP6VLhAHzfqQLg8mYWXfZe0OfCIMRiJAWmPCEFMfTOf+oBy3K51mOW2
	 2cC0+7jeFXkMV5LXFJkVx4mHlWMNwY4If5uTIdv4OmSeEADD1toQJEsT/KRR4+zYyF0SZ
	 5ylM2r3xScPE19gqp4wgQ/jDevp6gj+liwJswENM5hsh+9sAQtC9Q2TovC12XEFIunlgi
	 J+iRnvblgWnjFI/UhcpeWfQbtX6DGQJqOc7ZQr0vwvJs3ZaHgYku899aAtCjQmWNsrPEt
	 jq9jBcCoXSnlUQ0nhNEAZion7UjeJWeQFfm7a6w33MlyhirNvk0pLnD1iQJtWtN8iUA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791043027;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ME+De7U8GZZzYE0QvM/1Ym7YeWLvvya9LyqZ1LH6qPw=;
	b=BQPnHf9Z9Al2O2FNOgktncalkf1D7adRzMVDWySCrhde8yR/xgjfcCd89rDwqWA4I1MK
	 1fWaH1tcWdk/sQxW9pNLrJmhdXc3+bIw5r2+njwUtXTwNWp8Pe3R5GXu6r4tZ8qPJlOna
	 7jCSHUpckuqRTwPrcQsu2CLX/2uLOp03XRR6Ua15j5bJElcQAHeDk/Vwyy97QZCz2gPaC
	 OzCdFUXuI+TMjH2nUhrMTStDc4tNR3axVj1GyDqtoPVZ7Ub8Et0MyiWtUunCfwQCBMT5k
	 Q6hf367e+OKwNwNQFIZjIkK2H+/W0NvtsOAKslUi/pzeDkmJP/nQ5v8IGk8d8wvUuXg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791043027;
	bh=ME+De7U8GZZzYE0QvM/1Ym7YeWLvvya9LyqZ1LH6qPw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=k4XVKfQDuLd/FKVIvcwDHQq0XMLJUbJWfWq/0v/MGYa9mim5XOTLeiM8WpcN+1h49
	 DbMNc5qN6yswppFgiZ+/mW6tg1DjOf3r/d/XETe72cTc3BAFyJaZ6sHM4xr2nfKlm4
	 SO+feqP6ODJOh7AVvXUVMjWIXwTjwmWmJVNXLelIdhHJBYIgCf97iJSJROCd7hf7z/
	 ozQBUoseJDOuRC2NmcFwsAeKW251LpNkMSb2yXTJGiQJQFtV7lRdrEgd8OcshecPow
	 YKA0GG7mScYD5jH7pd8Bu4gD+UBMId31HO273U2Wi4Lt5neRPhMzgq/0cZGI7oBh5B
	 /R0kV9PPwX8HA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A4238186A;
	Sat,  3 Oct 2026 15:57:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C4ED4B7
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6021F6067E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NqSQU7lpqANP for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4E72C606C7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042848;
 b=lOf67PzIrX6FKcHGW1PzLfbKQROuN4d2kegZnK9ZpUYE7/L2Oo8qyAVu0UPBwoUNU8kG
 i6NP0fmzrhHiZSJ7b2d+8lgAlS5pe57MTKgPKqUZChdMPVkBdIt9cHITOX0RgFBIOCyPr
 rR4/6/Pc7lRoMzL+IijazLSUH/7Zpd9oLsaK2URHetMMF7meF90gSlUFHdkOXSKpw5C2s
 zI6SEjmJXAjxk+0CAaApqQ6Gu5Vha1KyH5Xr4Qs/Nu8binRwWaG87p6hGlUJ8LJ/NfVXz
 Vwnpdui2h9XnTyVAlOyScMHQw8q7RcoUpWvywI21IhOAf5ufbbJzR2Ypf8UEq/691+Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042848;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=3O+SzAkXsazO+T4O67WuNUamDjx+1GNaG8H/lONPWS0=;
 b=Gst/0t3kwN22pIuilW4IP+A5rop6CH0faujkGyVdRhCMOIVQID5JwzD7LfbWs6Hr2xH0
 Ru3ZfBtAOUWFwB8saTYTU00UWDHFJOChFPN3ScXav8uVhUPx1DFy4dR5fct2NAU9stYBl
 Rfihtwq6T6IIRgpM/34kRytyJHGMHR4afl8WxihDrzhcb4yER091PIulu0dpvs5E4h7C7
 80S1d/S9GYV3HmGTzQ4jW1CLyMWRhCOZrF3HCy44cNT4MCzPLUFEqRIQCUK8mzxnMsqHh
 FXiI+qh1rIgHbynvaz9TPf/RUJczSSGpLokrL8h7d8Xk43Vd2qQGSykpg3btrZWIMYA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E72C606C7
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8EC008A31E; Sat,  3 Oct 2026 15:52:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:44:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 938a13fd35bbb868403b9809141770595e82296b
X-Git-Newrev: 01d4a3ec930885131b02f09eac021e03b09461e8
X-Patchwork-Hint: ignore
Message-Id: <20261003155253.8EC008A31E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-matplotlib-inline: bump
 version to 0.2.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/01d4a3ec930885131b02f09eac021e03b09461e8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-matplotlib-inline/python-matplotlib-inline.hash | 4 ++--
 package/python-matplotlib-inline/python-matplotlib-inline.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-matplotlib-inline/python-matplotlib-inline.hash b/package/python-matplotlib-inline/python-matplotlib-inline.hash
index 6370d2ce87..bd86592bf8 100644
--- a/package/python-matplotlib-inline/python-matplotlib-inline.hash
+++ b/package/python-matplotlib-inline/python-matplotlib-inline.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/matplotlib-inline/json
-md5  25b1b460ee846df0d4d5d92dc8e6664c  matplotlib_inline-0.2.1.tar.gz
-sha256  e1ee949c340d771fc39e241ea75683deb94762c8fa5f2927ec57c83c4dffa9fe  matplotlib_inline-0.2.1.tar.gz
+md5  20174d6e66b812e9e26ea1ed6bc0201c  matplotlib_inline-0.2.2.tar.gz
+sha256  72f3fe8fce36b70d4a5b612f899090cd0401deddc4ea90e1572b9f4bfb058c79  matplotlib_inline-0.2.2.tar.gz
 # Locally computed sha256 checksums
 sha256  8521b036c6448e0e0aa7213d4713b6fdee0f4c64c9f320450f77346bf5c0e8e4  LICENSE
diff --git a/package/python-matplotlib-inline/python-matplotlib-inline.mk b/package/python-matplotlib-inline/python-matplotlib-inline.mk
index 54c4a18661..0fe043cd71 100644
--- a/package/python-matplotlib-inline/python-matplotlib-inline.mk
+++ b/package/python-matplotlib-inline/python-matplotlib-inline.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MATPLOTLIB_INLINE_VERSION = 0.2.1
+PYTHON_MATPLOTLIB_INLINE_VERSION = 0.2.2
 PYTHON_MATPLOTLIB_INLINE_SOURCE = matplotlib_inline-$(PYTHON_MATPLOTLIB_INLINE_VERSION).tar.gz
-PYTHON_MATPLOTLIB_INLINE_SITE = https://files.pythonhosted.org/packages/c7/74/97e72a36efd4ae2bccb3463284300f8953f199b5ffbc04cbbb0ec78f74b1
+PYTHON_MATPLOTLIB_INLINE_SITE = https://files.pythonhosted.org/packages/bd/c0/9f7c9a46090390368a4d7bcb76bb87a4a36c421e4c0792cdb53486ffac7a
 PYTHON_MATPLOTLIB_INLINE_SETUP_TYPE = flit
 PYTHON_MATPLOTLIB_INLINE_LICENSE = BSD-3-Clause
 PYTHON_MATPLOTLIB_INLINE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
