Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E3C0CC6B1A
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 20:52:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2A0E809CF;
	Tue, 13 Oct 2026 20:52:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jHo9xoV44VwU; Tue, 13 Oct 2026 20:52:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E23FF80A56
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791924749;
	b=CaiMA3by9JUlYCCEttiUj8cvzv7t0FAFTTGt0Iw3BzyKwXQZFyQMOv6jWRjouggSAX0E
	 E1j/FXsO6+DrlAlyfXWS6tgIr3xYYucqGx6UQPcYVBfSPbHfUDABWlGFg/bSs28OWUHWp
	 KMyGo1PBZmhzkRyJ6PKUSjSRLyWfFyjrlnRe7DJ7vkmBnvGOQtffiRUYvHIqS05jx39l0
	 0knL0YQqQtkFUL3sFJHi+rDRopAxgByzBdkjrDu3Mx+7eEMIjBPBSjFWdzfHIRnMTz4Qz
	 CokAPE0XJBbtO8APLFU59rlESmkrTQKrksEEAJ95FeIVu/lKQaKIGDKLnR2eAY2CNXQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791924749;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=91B+0n17Gsu/b1Voz0odNoIt3aI2dxX00cHqB/DU1vs=;
	b=KqcTu9UisaGKyAEiGj23Sz5T8pEdquG6sx5DnJ66t9F81qJb8+sb3vqeAQd3uQtw4FOB
	 icNpwZqMqL82g1GoCvK+rEc6w69OBK2rVJSj0ltMl3PK5FJ12SCnSF44fUkALkA6SP8v8
	 CkM8itVwRjM+v8bWNacCt8NyeJ91RqYgFXAsOJHlzzDDVCTjZyL1wyaebC7SwbYSFssNa
	 dy/xhWriPB9x1LplHOEA+APYt5+9qNYeEnQUIoV7gUZYM37fQRgRITFeL7eXh07Ca6c6g
	 oRelO8ZGXKmQ9DeCOo3s5KkWkbWc5XxiRa342xdz5RNDFCQIy0LcL5DePVTwVP7WG8g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791924749;
	bh=91B+0n17Gsu/b1Voz0odNoIt3aI2dxX00cHqB/DU1vs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TcQ/WIWxJz6BOPBnfYNGPAO2YxoFvFMPcGm71bkbrt+8udi90lxgmJaluVKDTIaru
	 6C7SyihJF/zSnnIRSab6v1s5ZH2ECNiJ7LlHWA6O+MfpQrCFhRFeyQXKo+5Q8D17Ur
	 ROgRjtvFgsp1mG/88lyXWs6hnq5SNyimt9n6VB68rQDr0VZGNYRTJVnUy3+5w4GzTX
	 nhCMJHyUqUKzIMnrLKB1/oiBqz35KmXSLEUwYQ2h8fYLyFESBAMrEmIw5UnayZp/ru
	 YyhbwO/JlE6tGzZKWVlF1fLDdZJuGilmK5NVFig/57NHjPMUuYxw4+yV4GEu8FFK4w
	 9FG1mQJ5+5tsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E23FF80A56;
	Tue, 13 Oct 2026 20:52:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B73B43F
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 276B780A76
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2_oHV8Oxv0ay for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 20:52:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 685C7809CF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791924745;
 b=Ocs9xqUTQiURVXMa3+aYFOOdFYQsviPc1YMEgK/KOg7qlIS3S/vSi/S64gMwCACpEt3Y
 xL1QL0ovAEux4bGIweIXCOxH8i80geHJfQEkpNfZDNY3Wjt07Gb1KP9elR1hUDjth/5ZD
 mzfDgNVemxNnyQ1CfNqchvLL4u8TJdjIpihbyWhOy2JyZWboQRWTtlOyOhcaAVanebNsv
 oXqxd3F2/h4+hw32tm+7MKJk60uh2ES5DQ8caUV2A0Y/XvtiJ2x60dS47MDLlhKo/gWq5
 N9k3imfcbUEyA0YbirmWYLZzOWqHjxcO1jUJZgrExcOu4XAdorqwbosmEcf4Awb2FdQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791924745;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=DNVZQGgAgqIk/yVNfpT9LvK1Y3BgyyZtkHflHU+PQDk=;
 b=USSB61R/Fpwu0Dq25C8J1Kzn2lc0yaFK58zxNvspzf+Jmyp+E2MBlQI5UrL7R0xxJSxY
 bTBUncNTFOdoRS5gamHim6ieXzpWj1NxrEB2/z3KnavzigOx0RK+nuzN2hhRXVN5Bh4cF
 LRr6oJeWNDiGfj7Jmv/suNgiSdJqqXLbt+j9RK7gsYmwq153nKcbXbJWFRYPSKuK/UAG2
 ZJUM17ybG5bZ2qo2Ble9UaOczyjbPCOqPeQ9HMUO/s22+hu0lsq4r1+p6/jr3tpn3ZfNK
 R1SDauO1oU1XH0UqH71vh5JJgxWNSzHjsLp1c9R11qQxdlDYRC3T8JiArDXoTSh2jNw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 685C7809CF
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 93988956DF; Tue, 13 Oct 2026 20:51:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 22:42:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7e0b4b6368dd3bbdbd53e3d0dda2259a9330b0f0
X-Git-Newrev: 82e3d29d352b8ddce0d55a8f41be5a16b0a47b30
X-Patchwork-Hint: ignore
Message-Id: <20261013205105.93988956DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cachetools: bump to version
 7.2.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/82e3d29d352b8ddce0d55a8f41be5a16b0a47b30
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-cachetools/python-cachetools.hash | 4 ++--
 package/python-cachetools/python-cachetools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cachetools/python-cachetools.hash b/package/python-cachetools/python-cachetools.hash
index 30d162f443..59c97017d9 100644
--- a/package/python-cachetools/python-cachetools.hash
+++ b/package/python-cachetools/python-cachetools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cachetools/json
-md5  6e88355ee27dd4c21a817cebc3c3c6b6  cachetools-7.2.0.tar.gz
-sha256  bcac1a1b8da6909994a2957238a57b8140dab7c5c5c69a43669654fe87a33c1d  cachetools-7.2.0.tar.gz
+md5  4ea5f8d2e11ad9db332ad02758db0164  cachetools-7.2.1.tar.gz
+sha256  b1a7537025c06abf96fcc1443e496af9a3fb95e774e70e1f0af226f73f7f2dcc  cachetools-7.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  28c000b52b0ee27138a68ef778227e4057046e86b65f62f1cacb99b0cc49e0d2  LICENSE
diff --git a/package/python-cachetools/python-cachetools.mk b/package/python-cachetools/python-cachetools.mk
index 19d4a6877f..cda505c404 100644
--- a/package/python-cachetools/python-cachetools.mk
+++ b/package/python-cachetools/python-cachetools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CACHETOOLS_VERSION = 7.2.0
+PYTHON_CACHETOOLS_VERSION = 7.2.1
 PYTHON_CACHETOOLS_SOURCE = cachetools-$(PYTHON_CACHETOOLS_VERSION).tar.gz
-PYTHON_CACHETOOLS_SITE = https://files.pythonhosted.org/packages/29/2c/3f18755527b03ca9ff6be724bd5370cb777c76a87f17301377cf04a4729b
+PYTHON_CACHETOOLS_SITE = https://files.pythonhosted.org/packages/31/44/71476a5812da1ddf2c9a3efd31ae76d01480a1cf03ed13ac28aa8f2402e4
 PYTHON_CACHETOOLS_SETUP_TYPE = setuptools
 PYTHON_CACHETOOLS_LICENSE = MIT
 PYTHON_CACHETOOLS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
