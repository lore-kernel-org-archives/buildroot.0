Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E786ACCF2E0
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 08:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB4CF60750;
	Mon, 19 Oct 2026 08:37:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wlCooH2Bn_9p; Mon, 19 Oct 2026 08:37:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AC8B460748
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792399057;
	b=hxL7a4XpRGLy7BuPUztcBE3g8RL6QuykV7retR0ZY7RUPecjS2dwqiwg3StGkKH11cg8
	 CarUI3yT1J5edFW1Mg0E8/6ivwqhEDSRybPVhN6MvxGy24V+cx3U6h/d9WRxszeAXuiKx
	 CG6WzVVTmuI5fk7E27EeUlxih12sXwaWySLDbhQervZBx2bgRRLDGpKw+gjcaZa08VddE
	 KKvy+KijrfY33rBvScOoL8BZGuGT3Upz1TuSVYJAJFNH5kHLD129AkGyLj2gd1ArZmoW1
	 aAOYUZCB46YbiiFLlUJ1PC+ERU5aUSDCtKDThAnxKTkWx3UQgfr3TZl7u1agY+fZ29w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792399057;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=y/0/IHqc5Ppn7kpJ/OZipgf1uvWlw4VfHQ4qbMWHFMY=;
	b=FjoRfSLDVn44nrEuG4RUOEXpthi2VQNuYOXdj6VgosNT4f2h4cbCohoRqHcDLKcOlxC1
	 yoZ2/KYsibLEXxotvo3hyiKBXwBx+9guIxJAMfngAwMVYxz0/ddtOV6G7XI5Sw7E42mP7
	 muH9baWfsZ6F4FULGhWIvqUisffxYR5H4xDP2CwToV9vnu4XOrXgdcqmprBjij+XwTmJP
	 LBWLwa1qa4UBPmx6vc3rbcOKDxudMdyt191z8fI+rm8rnes3yuflnhnCw+5E3UYYEkOAI
	 wNQIDNNH2zP4CrLjhkAGaOYKlXuGGpCTc1QJYr22/HmxyMdN5l+bD3gj6wwWiI6eCzA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792399057;
	bh=y/0/IHqc5Ppn7kpJ/OZipgf1uvWlw4VfHQ4qbMWHFMY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ePwWOByv91LnQkYK7BOvMPqM0DquFyczF/XJnbioBpEN4U74r/JfboA8YlgoHEs2N
	 bp3ybIgZfsKH4CMjNAG83Ful8fFHpcO1T69qWbce2Mw0w8HiWz98j6c7ObTVM8Byk1
	 ZFtIlaJuE+3adJCgKpKW3o56ln6E8aAM+Y04FOHhNpK06WDW5uXykGt8cmgPCc8WB1
	 zofRs0H09MNp5RC4SwJFHAScxsdWRs+YzyCgKn1UvXLYMaDEvJ145RZglXWG8oDBCd
	 tcis1Zs+wUImX5HmMcu+ysJWQWgtDkoAvC1qmlJencFUvrZAuj2EE5w3coFiUW2vp1
	 FKVgqG7tyy8ag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC8B460748;
	Mon, 19 Oct 2026 08:37:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AE81DDC9
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 08:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8FCC0401F0
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 08:37:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YaElA9O7avj7 for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 08:37:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org BF2C440062
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792399051;
 b=q/Gozgd606nnl3zRdh3Jn4aWmnA3Q5CBp8mfRKFPIBwEREk+5I1eiAPXyf96zshZSACa
 MLWL9cnD6YtsavTN3QyDvyBd3XjA32k7tRRYotwmIg5VKSPrn7dc9VrImXhAqIS4iwHnd
 PrTTkwIoyWmQkSCFF8OyHIt2CfukOnCCtciWLYA14mIg28sH1IUEJ7lzLCRTaRrn3svc+
 amZscFt6NOqQkQ5SlkcXXjyaLYUoqbzTATchGHyl4XbCZk5GeHfghTzRlzBphWsNNCqiN
 xycnTRgdwVtu29rvlWUGX8xhrAq7fWus4uZZgB/vitCFQibftnw9abitTUIHcDlrMlA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792399051;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=GD0y6TzyOXsLuQPYg/nXAxpZLKQsaqQhjhlQk3lB7pM=;
 b=bJjnmzwY9RDWnf8iuozTJ+GnPJgNLz6Vt+QaBoE8Rwalo1aKVemVQjZiR8Ck2hp2BTe6
 u0uoqX+zqZEgmK4Cnv8wtzWLsuXuL7Kxr4GudkpdE/J0vEeiZVVajB+uHBxtmUCpEyOZ5
 XOe8T3kpGaankvfK9uTUTIClGSyZsoj9TPI3R2yDZe61IHhKNpXIkdS4FMO5aHOb79GmG
 RUuPS13yjx3MweaknU59+2OV/rdpqS8qx5es+n5SNeR7cHhpyrmTkhu6xBlZ+nhOMBLSB
 ZxXFz7TBvHKi67Xbu4LaYSivE5qGfrQLtycOhO1xAcnc0ifBPBWwYwdDkN0cQwlXNnQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF2C440062
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 08:37:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 429CF98499; Mon, 19 Oct 2026 08:36:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 10:28:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4cf4feecc05d0d64b3654832741ae9afddf42c76
X-Git-Newrev: 3deac2f6d4ea2ac7dc5b4f8ce61cfede745386f4
X-Patchwork-Hint: ignore
Message-Id: <20261019083609.429CF98499@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cachetools: bump to version
 7.2.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3deac2f6d4ea2ac7dc5b4f8ce61cfede745386f4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-cachetools/python-cachetools.hash | 4 ++--
 package/python-cachetools/python-cachetools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cachetools/python-cachetools.hash b/package/python-cachetools/python-cachetools.hash
index 59c97017d9..3145620cb9 100644
--- a/package/python-cachetools/python-cachetools.hash
+++ b/package/python-cachetools/python-cachetools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cachetools/json
-md5  4ea5f8d2e11ad9db332ad02758db0164  cachetools-7.2.1.tar.gz
-sha256  b1a7537025c06abf96fcc1443e496af9a3fb95e774e70e1f0af226f73f7f2dcc  cachetools-7.2.1.tar.gz
+md5  cc17ff466a8a3c11920c5f9744719db0  cachetools-7.2.3.tar.gz
+sha256  e6fafd06de4a5bd915ff7d247588ea497e28c9a568c62db8678d9a5f11515a9a  cachetools-7.2.3.tar.gz
 # Locally computed sha256 checksums
 sha256  28c000b52b0ee27138a68ef778227e4057046e86b65f62f1cacb99b0cc49e0d2  LICENSE
diff --git a/package/python-cachetools/python-cachetools.mk b/package/python-cachetools/python-cachetools.mk
index cda505c404..73bd924bc2 100644
--- a/package/python-cachetools/python-cachetools.mk
+++ b/package/python-cachetools/python-cachetools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CACHETOOLS_VERSION = 7.2.1
+PYTHON_CACHETOOLS_VERSION = 7.2.3
 PYTHON_CACHETOOLS_SOURCE = cachetools-$(PYTHON_CACHETOOLS_VERSION).tar.gz
-PYTHON_CACHETOOLS_SITE = https://files.pythonhosted.org/packages/31/44/71476a5812da1ddf2c9a3efd31ae76d01480a1cf03ed13ac28aa8f2402e4
+PYTHON_CACHETOOLS_SITE = https://files.pythonhosted.org/packages/09/88/27fe0785c7a9aa285c753db0b4ea967adbf76128fede66379c35a4b8d054
 PYTHON_CACHETOOLS_SETUP_TYPE = setuptools
 PYTHON_CACHETOOLS_LICENSE = MIT
 PYTHON_CACHETOOLS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
