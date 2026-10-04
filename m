Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C56CA5FCE
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 16:08:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BCC680DBA;
	Sun,  4 Oct 2026 16:08:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YHmxSMYapS6h; Sun,  4 Oct 2026 16:08:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E35C680D88
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791130080;
	b=ofs7OJf/KCrLhD5pEem2k0W8vJg95t/VtkdYkJN/KOIZhxvVQbHAYYbbhfRnslLshHTh
	 1tGdtIerb4bw4npzee+lGhzFyfepHIpfAKLbuRIkbZjp/lqInX4ntuZrMVvaJ13m4mrwi
	 j7CnsyBjUoDUjB0HDT1C773mX1jW3aawO3uoww85zIDyGSDE88EBsCFBYjBXXTv+2nyQ2
	 e3jnUlz2b8lP0P46IRBTkTk1wJ3PZ/C4HhZHcbPtWXDcO+V+Gk1ippZJ4S/sQfPxJZo5a
	 FEcyX5uUgqK7wYQsv60pxFo4vxRXOezkMtV4zEdvM0DujXtGkZL51c1qPfNZh/6ovHg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791130080;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=JJlhfr361ncEJxtfoZTOBFGZBRqnl7gfJ8kr09o+5xU=;
	b=a0wvkBM7ZNmJ98w11SMGL7xOKO5pTWIQuDJjdsyPJ/eClbncmg+Z8LJAN2Tv8DNwyXrS
	 6oqzvI5+OXgyMwRkq4ay1N6MSYX1XTV4Sjc3NZwGIUFLvbCtR8C+JJo91qrjwSv5zVmLk
	 L8qSWWvhyAo90hHGhnaEn+03zqwfhjcIC5252cqAq0NeuO+GNaYlKtKYyUYO9qK1m/8Ge
	 MbGSLb0B0Mb6a0Qxz0mDpb7xxiR1zyQxftslkELF+WGZuTbnJA3MJko16Itq8ycXGzLSl
	 egJsF1YlkXECFZXiqmNqeIJJKqOgup7D1znOWCMfl5S0ghYD2qYyPFlc+C2I9GxQh0Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791130080;
	bh=JJlhfr361ncEJxtfoZTOBFGZBRqnl7gfJ8kr09o+5xU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Vfkn5aDGqc7uOlRrdLk9pmQpkhBcW25M8b/tc//ypuUfTURfBcYmttdhW6bFVHGfE
	 oCf2VIKZLxw9GCgEl0+NKIupvkH9N/PYn0VO00jTr5AyVdof+qRVgRTvVCrBIKEYIp
	 9FgHiysRlIep7/9U8ymW4G6fztCKsOLl/x5ud+o6iglkUxyazjraxbiIL8PfqI8fja
	 ih5p2yq21q8HexmqSV+JGhWZG687UbHFwGLGBrI+j3L1bE1dKFsPxXUl5/aLNdv95H
	 3GIm7UYQrjB+M+soDaBKzkkNcqr8h24zRgq2u8dDAblRS8iUAxlZvb76fDKbFDX6HG
	 D91UkxYNLyYEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E35C680D88;
	Sun,  4 Oct 2026 16:07:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 29AA134E
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0FFDB4007E
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:07:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d2RIOyuCN52r for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 16:07:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 4CB6840068
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791130077;
 b=ne+XwYMVUMNkXjq8uWvJMKEzXK60Y3eXv9sJeugzNEzVt0M7hvpEasfVqyao70qvq8FC
 RB61UR2RVApZjstdNDB6XL9AW7oP9NkRJhV1N0L2adlyfP0vT9xniQ4lSMX6Ez80P2+3L
 AhLqGLTUZt616ITN36+vad7GcIlYpn7P0fnxvyT913bGCUA/4yi330AIkNRl8KI8qvW+o
 L0mA2hLCBqO7WFnOgKCyMeZp/jsUFArhx2DcMGh3o7uFEqMkGr54sFbeIhm4Gqp7xrwsf
 wNRFMujOoHmX9Q25nTihO9yK5gU2keY+HsumioYIY4Q3FWxlqQBtxVW4afKj9XvYFRQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791130077;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=RNvU5sluHMbvqg0rcBkQa5/A0mmEH4sQQEfW7lac6To=;
 b=OeXpx4SXRva3nwWkv6q8xmepuyLAPzRcroQGhgkejm4UCtVSFS2v7bqtjLHoQYAtsK3S
 YL7zJVfOzTkFknks5G3Q3cQMhUdzvvQjGlZH/U0QQDJIF3sgYMk7l0vTAivODnjrF6fXZ
 Hv0ISvSf0EPQk5OjOmLWGp5c3wevRsjx/9dnNjEX3bN7At+zFuy135h1XNv33PhFJOpkc
 XfmI5bkoz63bj6Zew4NXQnHxTVSQgCTywsI/614kGHcRao/DMn4XX+SZ9iqHYxbYUwlzE
 41bxP5nf2DWdfnu11N7DVYA2XApN0bJyrtCL8qH1uj4TfPuRAcffIqjQkU0V9p/8dig==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4CB6840068
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 16:07:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0225D8D22E; Sun,  4 Oct 2026 16:06:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Oct 2026 18:02:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 89d113bf6c1fbbdaeed5a291fcdd3b86c732c126
X-Git-Newrev: b46eec503e7e46f8aeb319d0660ecebcb6bd3521
X-Patchwork-Hint: ignore
Message-Id: <20261004160642.0225D8D22E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pysnmp: bump to version
 7.1.30
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b46eec503e7e46f8aeb319d0660ecebcb6bd3521
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update license hash due to copyright year update:
https://github.com/lextudio/pysnmp/commit/fc678e541972a2f43c2a06f2d373cf6048653728

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pysnmp/python-pysnmp.hash | 6 +++---
 package/python-pysnmp/python-pysnmp.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pysnmp/python-pysnmp.hash b/package/python-pysnmp/python-pysnmp.hash
index 6019925c4b..13686eba23 100644
--- a/package/python-pysnmp/python-pysnmp.hash
+++ b/package/python-pysnmp/python-pysnmp.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pysnmp/json
-md5  33203585898e346a35bd49c2344deb5b  pysnmp-7.1.22.tar.gz
-sha256  37ac595c7f0c1c00514505939b4dcf5b4fd5a9ffe51b0349f60bb640c11b0f77  pysnmp-7.1.22.tar.gz
+md5  af979cb67cd5fc816e90ca8eedbec289  pysnmp-7.1.30.tar.gz
+sha256  db72f439b066725d2586dff068478dc8e9b303a4dba3294462b0e76b3cb63bc2  pysnmp-7.1.30.tar.gz
 # Locally computed sha256 checksums
-sha256  1c372007e7b71c1773a8ccc4fa840061822cb8053000f232a51da830b9d6d287  LICENSE.rst
+sha256  aadf5d3f4d90a949f05e2c185b783b877efbf625874992c361f70a536bed83ee  LICENSE.rst
diff --git a/package/python-pysnmp/python-pysnmp.mk b/package/python-pysnmp/python-pysnmp.mk
index e82ba2bdcb..fa6cc9b341 100644
--- a/package/python-pysnmp/python-pysnmp.mk
+++ b/package/python-pysnmp/python-pysnmp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYSNMP_VERSION = 7.1.22
+PYTHON_PYSNMP_VERSION = 7.1.30
 PYTHON_PYSNMP_SOURCE = pysnmp-$(PYTHON_PYSNMP_VERSION).tar.gz
-PYTHON_PYSNMP_SITE = https://files.pythonhosted.org/packages/c5/f7/63a4833b675f3f85296d85f2fddaed93d76799f29a813a2d5ca2bbe7fc50
+PYTHON_PYSNMP_SITE = https://files.pythonhosted.org/packages/55/2a/ab68df5b1a2f673da731da7caf39c29d924735359e7d50eacb80d2d38e53
 PYTHON_PYSNMP_SETUP_TYPE = flit
 PYTHON_PYSNMP_LICENSE = BSD-2-Clause
 PYTHON_PYSNMP_LICENSE_FILES = LICENSE.rst
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
