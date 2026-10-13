Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D546CC6B19
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 20:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D019D6084C;
	Tue, 13 Oct 2026 20:53:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eJxViu-B_7Js; Tue, 13 Oct 2026 20:53:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4823E60816
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791924781;
	b=KKHqwoEpWNW8Ih66m/Knt60EQnzhsdf+mysyZ+OEypjOgcOR8DPYFr98bW5pc9nhiakM
	 mfJ0Bo480bB6fhBhrW2E8pKsD4t69YdaoB4CZBWsUP8RcZBPe8Ay9TgmQNgDA/cuKKY22
	 avDBjGrV1kOd9cBMY1ekvasBMgeySUOjY90JfqYU+0WiEWfbAPjs88DXzUbGW1ew9jzxk
	 YQfD0yJ5EhWzsCdeCFU7eR+ZfVIWj3kRKNv22YI2YmGmY+e0eBtH/h/JPYoO2hYsjLJQ8
	 /s6nMYtjGpdGqfZCiY8xBf0d5WL2+hfIR1ujSrFyZxB+X8DrE+15N1lqIKkt+T5XDBQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791924781;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=w9kJGOw9mJrFFJI7j5ZH0WGGGjR5I+ZtxRtAn9tgl5E=;
	b=Jo9Ty6iUFv4yzJfST98e67t/qF/h+IoVJzRxRWuCLg1IsF8K/BGZRthOHdL3XazI0NsJ
	 G0gZM6tCqbgw0FHuSQJh36FvKXOvJU6dZshZdAJh176l8WI7OLdGUoWcOfsBfft+zCUhY
	 QM9rIodN8rVKTgjdk7dUsNYATepRY2SU5gdQgyxTohGeL3+5+p5Sw1W2kn87xL/yvIDX+
	 0+7xlEvCzQQ5vui41aF+z+Y1Kkb6FaIOntGG+/lxP9hGgqVKKwXx/UY2Y+Ljv1COGVChR
	 s1JT3ItAp2RvXzHgFUteNasbNbPvTsCj/UqADvQNKPAkUVQHf3yf7t3vwXzbVFOb9aQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791924781;
	bh=w9kJGOw9mJrFFJI7j5ZH0WGGGjR5I+ZtxRtAn9tgl5E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nXola8aGw++Ge7Et5F033wosSxnb0jKXAAE5C6/sUDLvsoD6W3d74A6+2HK78plvh
	 FGhmfGSyYlvf/1wa2VjmvLhl1xiXQ5/ZyahihCU8IV7uP4xdOUQC4wQOSMzxkL9Ga+
	 o8cI6VKY5kqgafhyyvcfJwwjqJ8ozbpWK7/xYynDUj/Pu+sMwjYayxg/rT0CyOeXXW
	 z3MRRVKY9Gh5fc8vdppXQdc8dsm5WjgyJd5qMCgbIBktmlBBq0TybNfAOO8IDbj4YW
	 ZJcAAGB7rOp45ACpfWDBQDpjJLiQQquv0wIvCsv9uKLDfpSCA+WCXmswt4OTMNEEDl
	 Mg9qma1F5P+Iw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4823E60816;
	Tue, 13 Oct 2026 20:53:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 53B1F2AE
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 45A37607D5
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JIdchRGESTHY for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 89B88605CF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791924746;
 b=OPtptL5Nydzc07frbG63Aa2O7jEwVj9jyHaWeLvQoRK9iOUuC9fPW6hD5L9Z3Ux7MPzK
 DpeyVBYGvS94LdwTc8sa1gd6L25YQwSaFk0RVP46zMU0j9KqjtFckxqCLt/3lL4P+VBeI
 Yp8ujjVw9PQfh5D7jM53jwluRlFDY5S4NzEm/Xk3dJIsaUT7WRO4lhq5I8CKxNUlPUbPS
 ZO+tYuBV5F6dYyFjIeCVpyWKCV14UZOrHWHJLe01IivYch1V9PFsAToFyMMCj86ym5w7V
 erhpvqz+HHi2Md2i/yBHSaE3j3XjVxG+vV22r8Qn3TsLDj/ythqnjFrnkSv7/gcTcDw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791924746;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=jy461VTxRImtxPRAEO7jldx3SguV+nYqtY3M51leFi0=;
 b=r7jdfEkAOMKSD+BRsH3TRFkl3F01zigjArtlLiABa8yA9ifNayLA6IO2vSRYk1awfJdt
 vU/WlXJ8z+Plrcaa45lnN13nSAV+uy2EZ2twHU8PbqxroZSn3qvkcGtYwa7v0qcQZnT0R
 g18O66dyjoNa3RxzxLfj5iVkY/kBXkGirK15DCv/yRx+QdIn1UiNFnFZJ6R32d1PyoZxG
 z4usYOCHNXeWbdGrnRfPnV+kzvRinCZyHfHeYGV6aTEW3b4dJDRc1kG4COkcMmbzfPIgu
 lT00eDV736bjqmmGn8dKSpWSyijo3Gb0DsZTRSDMxLpar9dA01bMvkAjyr4Bw9ZeqkQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 89B88605CF
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C3F94956E5; Tue, 13 Oct 2026 20:51:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 22:43:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 97efb2bb5c6a6a439750ef3158fbd5fc05b175bf
X-Git-Newrev: b2cadc26be6259b0c874446290544da76d9a683e
X-Patchwork-Hint: ignore
Message-Id: <20261013205106.C3F94956E5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pycryptodomex: bump to
 version 3.24.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b2cadc26be6259b0c874446290544da76d9a683e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pycryptodomex/python-pycryptodomex.hash | 4 ++--
 package/python-pycryptodomex/python-pycryptodomex.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pycryptodomex/python-pycryptodomex.hash b/package/python-pycryptodomex/python-pycryptodomex.hash
index f0b9a052ca..3d3c72172c 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.hash
+++ b/package/python-pycryptodomex/python-pycryptodomex.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pycryptodomex/json
-md5  f8298c5255a43e033703f758fc7c688e  pycryptodomex-3.24.0.tar.gz
-sha256  0428f19f13452c6b89bbaf2c530f84f369873811dfa77f0cee0da4f40fb0474f  pycryptodomex-3.24.0.tar.gz
+md5  1ae989574479d8b5f5440a68a4159148  pycryptodomex-3.24.1.tar.gz
+sha256  09081666ffc599976c0b8b29caf2cf82212c0f05bed233c8f8ed53e4f6e1d356  pycryptodomex-3.24.1.tar.gz
 # Locally computed sha256 checksums
 sha256  4e04660d77c1c64e89d79537919fb8240fa21484a7e3db29f358b2c7f84ea073  LICENSE.rst
 sha256  8e563c767164faa0831a333b57d23d4311cf566eb1b15d93250f4606be4eb549  Doc/LEGAL/COPYRIGHT.pycrypto
diff --git a/package/python-pycryptodomex/python-pycryptodomex.mk b/package/python-pycryptodomex/python-pycryptodomex.mk
index 72f91b0c9a..a9ec4b25e3 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.mk
+++ b/package/python-pycryptodomex/python-pycryptodomex.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCRYPTODOMEX_VERSION = 3.24.0
+PYTHON_PYCRYPTODOMEX_VERSION = 3.24.1
 PYTHON_PYCRYPTODOMEX_SOURCE = pycryptodomex-$(PYTHON_PYCRYPTODOMEX_VERSION).tar.gz
-PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/4c/25/214ea825a9031f5af2c8b2506ee16701a2560d4712165dd00098dd527bcb
+PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/f4/e7/50e72301e32acb73a314e663c2014e1ddefc019d5f434ff14ec89861d664
 PYTHON_PYCRYPTODOMEX_SETUP_TYPE = setuptools
 PYTHON_PYCRYPTODOMEX_LICENSE = \
 	BSD-2-Clause, \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
