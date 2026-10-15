Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1E9CCA464
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 20:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1524F811E7;
	Thu, 15 Oct 2026 20:01:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ebFccVvHMXPy; Thu, 15 Oct 2026 20:01:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3D03D811EC
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792094488;
	b=Gz8FvVpUBpYxUx/V1m1HogjNinJ7fgBZRfrgz18nVjxD3mjYI8YAcTh1KxsV5cZb+RIz
	 GpowkmpdUSPT4EetkQw64kn5EUXVt3GkV9x4ZK9devFFka62EtfSq1FcIX4t9fbnGngUM
	 8E/aIN0VaBnZzV/Nye7Ho4Jr6V4aaKiERWdnavu+eT/JtqHKxgo9otF4NH4BIuoSpxG2L
	 ZLPpPq2q8ogbmcVDhVI2OjT43ltr3N140egB+cgcqyCHn5jt8MeybpRr/BxmadBczJjIe
	 3fJvyStBKWzi2/+PCg/xjk3C2QcqBzoh69Y/tKwUyvJXXNIeJuP0pBepiyDI2rXbbgw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792094488;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=3GhzUs5w8wmbxzwN+fKNlrhrDwNpYTrClz2sdA8L37A=;
	b=oYiZ94OO8fi2B0n2YR1X39zIk8NQgapnPngkm9OVMxzwZLcEWUFlN0uzsXYJ+HP3ZFPZ
	 yNB7s/Tl5cf2k0uExDD4t1oAe9Heh7jWoL1f1nWWVDchm17xoCu2slsN4QC0DocbvVRGP
	 a2K2p1exLyaCJhytLmD/IZfmicXNvmrVnaxR+fetSeTl7vzj5xRmALXaBqVA++qVhVl0V
	 562FlJd9t3Lf12a8HPqPzRePgLCEZZv0dIYoLocdgkYXIS4DTFCGdeS8EPzLrk8jDVmF/
	 /LYk0Gjvjc6FXhp1ZWiHNvhaY8pe9WqNbeoGnj8ap5T2qupIZQTy33AnpVFnr+0nWeQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792094488;
	bh=3GhzUs5w8wmbxzwN+fKNlrhrDwNpYTrClz2sdA8L37A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=S5DTr15Y4nACG2SiVOwA51pcykv2dPfulcfY4FFpRVcv8+N1Vley8Q8GsGyFChFzm
	 SjAjwNHEW3kdkO9RDN8hUA19kzI9be3PwPQacFaFZtKd1rGlvAql39ryAY+RTuEeEI
	 BK1It2xkFC9Mau/GV2+SLgmQevzP9B6QIsmBZT5YmgJ/B05DQnH4qEEuRAIRSegbzC
	 G13CPU/oPOUevNwNi9bYX+4lQmOt29geGqFY66k/m/TauE4tzV54ONkN190Z1BjiRQ
	 kvde9sjrrXRoS8DOd2ryFzHMp8Cjb0icDQIMjU7SeNLOOcnuUX+i1H22abQkzassum
	 Sw1/MkY6OYDWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D03D811EC;
	Thu, 15 Oct 2026 20:01:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 26EE7920
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 24B2260A7B
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:01:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xzaf2HWhWAg6 for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 20:01:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3ECB860A3E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792094483;
 b=lX2vptbmUxZouc+drWOI/PthS7LTIUGLh9y/wwXVvN/KVE12us1dZofvuzUb5T/9sV3l
 oj7ettDRacjlWr7NeVsY8qH8cuGRMGZHlBxSC75o73i18da8+gjRLUxFaOB1s6MPwYh5n
 ++eaoe6ghCbvYwuhtuc29rxTmVXtm/o9HJmhF2s1Le2VD97qxjH0qxIkpvyZLTR2pVpU5
 H6iADWVF5458udE/+cfXhWWljCAIF/0SOucLnQor6O8BK2+j6WuHv9UtFDBeYTGit6ML8
 DdtukiKgQ6biZsSpgHo9sMpInOl3bUXSRkNzMO1XjMm/z3laXKxIxf7JbtuZPDeIKJw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792094483;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=/Ahrertr5CLYoEkRgSp8tzQN50cxevEcwIocr4ExQNc=;
 b=GWCW49hNsv8fhWvi9NnBjNLZS2nw5kH6EaEMBvVCmE5aO4mb2DnXAvnqJNriBy1JJPif
 ACEGAWUGi+yuX97yd22ANGQ5ww0b7n3oA2510mYJwtWmBJPd85zQWX93akjTZMzKRmy2G
 QHVO9ykKVp8+t0x62Ar05nyLe8BuzcFiL1loCD1TAIIo98xQQZeRYbW8atHBK05uWjGVC
 6kjJI5gp7dOtepjqnKFxWdDoCtA/+Rx7+fJFcHQDhUtfPSuYoUcGmzysEwYHYjPIxhB/I
 a48NlrS3Ckh+qh0RjKpc+596uV0ukZmU4x8h2Wt6oRPkqK2v+8Oha7ekawDH6DTuP4w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3ECB860A3E
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:01:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 812CE95CF0; Thu, 15 Oct 2026 20:00:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 22:00:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4a1aaaed803be622b4579edcf21f0d5e5a7ad7a6
X-Git-Newrev: ed40a20a0248cd78f4101bcc23061f3bb8e7dd7b
X-Patchwork-Hint: ignore
Message-Id: <20261015200002.812CE95CF0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-serialx: bump to version
 1.13.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ed40a20a0248cd78f4101bcc23061f3bb8e7dd7b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-serialx/python-serialx.hash | 4 ++--
 package/python-serialx/python-serialx.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-serialx/python-serialx.hash b/package/python-serialx/python-serialx.hash
index 11c2b7a512..603e515ead 100644
--- a/package/python-serialx/python-serialx.hash
+++ b/package/python-serialx/python-serialx.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/serialx/json
-md5  9b0b380643606d0d84339bbff9df67de  serialx-1.12.0.tar.gz
-sha256  e19e45ba198e919b86952f428376207c8dae39b741546e02e8e5657981cc3b1d  serialx-1.12.0.tar.gz
+md5  f4daa494184f90a7cc3381fe498c7f88  serialx-1.13.0.tar.gz
+sha256  0f9ecfb157ff04beb280cd01fce6cca36a5092af861dbb31072e636bd3b8f547  serialx-1.13.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-serialx/python-serialx.mk b/package/python-serialx/python-serialx.mk
index 0ce0a81112..0dc1f46ec4 100644
--- a/package/python-serialx/python-serialx.mk
+++ b/package/python-serialx/python-serialx.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SERIALX_VERSION = 1.12.0
+PYTHON_SERIALX_VERSION = 1.13.0
 PYTHON_SERIALX_SOURCE = serialx-$(PYTHON_SERIALX_VERSION).tar.gz
-PYTHON_SERIALX_SITE = https://files.pythonhosted.org/packages/c7/68/efe61ac6dd5fe536eba0a3a23e92d09caa9e78cc59f97bdeb594a0098ada
+PYTHON_SERIALX_SITE = https://files.pythonhosted.org/packages/07/a8/aec21f8a6d23be84a9dd9eb9259f3f2feec2b5169eefb2fd647d3a14d5e0
 PYTHON_SERIALX_SETUP_TYPE = setuptools
 PYTHON_SERIALX_LICENSE = Apache-2.0
 PYTHON_SERIALX_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
