Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B9CCC6B19
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 20:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C9CA607C8;
	Tue, 13 Oct 2026 20:52:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ySk9_-9Ntusu; Tue, 13 Oct 2026 20:52:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 74017607D2
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791924751;
	b=gs2fHwRNge7q9u53Hzm+ErBhXfpV4tfTDxAZ45YTprt4gYgATpZalE3J/LU5Qc9paurE
	 F/RYZ/eL4atJH9LO20x+ywOFitn0IH5LhQL5wIB+F5UenCcKJHwJatyypPcx3RY8rOznL
	 0fA/c7eAdSK6KCa8QKXsJHCC0f8SenbJu7D32Dxke1y/o/MInfiFvJkTZghOOZYlTlnBI
	 OJL25BoSsq4ei21+x7Ms0PZmb4Ly9HlkQewRb9HWIIeLieFiLEzI3hwWtnL6O4kMkYYE/
	 iQtwN9/gJpnqik0QB83OEHq3iHEhPuBhdjDSdqaxP36KI4mji2x6ObereDV9GkcMhEw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791924751;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=hQiCcIWl+FAvopO7SinxT8y2LrioOwTyw5l7VnhQsYA=;
	b=ev1k9JI2drdWaS4O9YaraFb54tzSImkMpgb5ioVsdY8P8F28oGA7Wgl6pcIZODJbCvCH
	 R1R0/DPZ+iELWlPlq/4H9yes0ERKbEBo2oxp+No3/D8Hp+hvEIAhq3KGdXGDHlTWb9r3w
	 WghuEpSGD0AwWDt9JygQtDUoNuFZCgMKuo9zrTWqIVJbM5coyqNXoN52YiA3HhsLAX9R7
	 0AypEtNlw9sfJm8bTdQef3OMcLZi7kDYtuR9+i/NJe61fAb4huv5aw1Tvy87HCyQkk4RV
	 jRV4oJvufL9xwJXtowEDFBIAalstqBCTaRcxTwYwQaihn/PTecF4IDU9eIgOD+hSuIw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791924751;
	bh=hQiCcIWl+FAvopO7SinxT8y2LrioOwTyw5l7VnhQsYA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oeIBt6h2rJqvBGWJfiJ2vFC7n/sO6HN7/F/hwuquLbD7Av4NuWuZtHK/XEf5fkDNw
	 jUDu0Hzm2qgJzIHI3K0re5Q2d5rcPJvBR99RZRzn1kRxBxAxIERrkxsjjXrTsy5pe2
	 BnAZfg8kc/ea9npDP3JXDpHuuY3a6KILwpMVA9FmQ4LdWzK7NQmyB0oMMbdsy+p13z
	 njUCO/BBJL5zcwkTFDNNjyNikmiW/sHLHqXJtpBW0FcxHSF1ztjREm9uE8XgI/KPOH
	 uEETKKmt1gdAdJjGarnSdPqGAMDHm5RFLVqsrsuGthEEHM3Sg1SHM4kzVNxmPXRKGp
	 Kv34Jl8K9cgvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74017607D2;
	Tue, 13 Oct 2026 20:52:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4491943F
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2923B40666
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s-67f00N6Ioi for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 20:52:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4CF9D405B4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791924745;
 b=kH6VS5gnqmoELNrey2d297JtY0HI21BSLPXUe8oD77eiNCfIBSc9TOsugeLgYXeq4irm
 ELZx6Bo/VIrq2igjZJGewJUr1r7xgZX0zPI4LWRTyu+NHrZ7pkJiZJQl5Ztn8eXKcc5tu
 MsF7jM10rRxbtm1svGN1S3mOtKjeeWrWg60x7HVG2Am+rMJjv/ipscUGMMDZ3+IuFG2E2
 XdYnxmHDyInEESYKDzvwqfe0f8XTpWGhCqQpzytwRgocClIXaTBkyv2G6XI9oaovohfKH
 jNpr9cPeX9nsgMvoO3XVPSHkk5CaVJBIxuCpwhWY2IwYJtc8fHRot2dL39zPrusQitw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791924745;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=JqGn//Il4rNPcb+n+bS/3njsGs347lP24El7kdYy8jw=;
 b=gRSYsGhffiFbeQXQjW2sWIN7a/pxI7Tijq9MlK6Wi3IiR0hvc1NFy8di2wnKcYRRN6nV
 aKCZbAkPXlxAuR+1Z/JWGn6CDdHCxiMOpjeZ+Pb85vJpp2aMhiJTJ1aHsN0owi6seKWqU
 y+Tdo5EsYnp1JjzJEpuongKRdicqPmXf1BgEViOjFbaiZWWbhHEw06xBIXMWy+1IBIvnj
 5BE8ntXordqBZODkoHZCbVKFhcjxK+X41ckI5GUhL3Ur9mXN72+fphHchjwel/u7rKzUl
 NprDiRdok57v3mPzsDT9Ap7hmGJuwlVvSHRVotDXjaDMkkZkyXNkgA5e0VrJtafDGmg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4CF9D405B4
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 76F9C93577; Tue, 13 Oct 2026 20:51:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 22:42:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dfaacfcdf7ff3d0de6099305d03b4f53ad4393a2
X-Git-Newrev: 4131ccbdd08aa47b2376ad28d91e8936fd2bc958
X-Patchwork-Hint: ignore
Message-Id: <20261013205105.76F9C93577@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiohttp: bump to version
 3.14.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4131ccbdd08aa47b2376ad28d91e8936fd2bc958
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-aiohttp/python-aiohttp.hash | 4 ++--
 package/python-aiohttp/python-aiohttp.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiohttp/python-aiohttp.hash b/package/python-aiohttp/python-aiohttp.hash
index 13f6e2be21..2bcd068ec7 100644
--- a/package/python-aiohttp/python-aiohttp.hash
+++ b/package/python-aiohttp/python-aiohttp.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp/json
-md5  1befc420af8c5cc860a80a629d66cb00  aiohttp-3.14.3.tar.gz
-sha256  9491196535a88924a60afd5b5f434b5b203b6cc616250878dbdb223a8f7844bc  aiohttp-3.14.3.tar.gz
+md5  c31a05528821715778ebe0e56374c4dc  aiohttp-3.14.5.tar.gz
+sha256  5558a7f5a05af9ecf744af91e5baefc436f93c9333e656c27ec253f9a6bbe178  aiohttp-3.14.5.tar.gz
 # Locally computed sha256 checksums
 sha256  2e4be5fc6c4c72a466fcb665d726e049a6891981fe536c4f04b6366749461d23  LICENSE.txt
diff --git a/package/python-aiohttp/python-aiohttp.mk b/package/python-aiohttp/python-aiohttp.mk
index 7f48f5a19c..7667440a45 100644
--- a/package/python-aiohttp/python-aiohttp.mk
+++ b/package/python-aiohttp/python-aiohttp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_VERSION = 3.14.3
+PYTHON_AIOHTTP_VERSION = 3.14.5
 PYTHON_AIOHTTP_SOURCE = aiohttp-$(PYTHON_AIOHTTP_VERSION).tar.gz
-PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/58/d9/22ce5786ac0c1653ae8b6c23bded02c1686d11f0dbb45b31ce128e0df985
+PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/6c/4c/bdccd81e9ee225b69c60e7766c9a5b05364f118f4d383713b89a682d772d
 PYTHON_AIOHTTP_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
