Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65CECCCF2D3
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 20:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3118380FB4;
	Sun, 18 Oct 2026 20:51:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BsGIii__1AFb; Sun, 18 Oct 2026 20:51:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 387A780F92
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792356684;
	b=IT0+GzQ5qHqtQU7s5foC40f0Wp+DxVrhPaMjfvX/TcppafW2nHW/dVvVLl2JNOcioMMI
	 rh2X0XSAB9Tj83jgMPnGEpKiEqh8k/1GzDtjslbZ0usFnYIb3wF6St5hK6qJnvVMwcyX2
	 OAytqyBFXoTUjDueI7QoHkCGxNUk0rKZvtGdYwZceZ2pbJNhGqHk56DUM2vjN479Uyt1s
	 mk+ey2o5rVjdPqFB/JRHvmFlk1YtD7WgxSOausBREnuZlKg5YopHht3fDhhxkPgts80gW
	 CJFd/ne/LkTqoG3C/TRTmAD86umEvA8GwvCZEwsDiCEfkHQswDrUk3CJz7H1jYwdV7w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792356684;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=aXbYQKl6yyfyAWUcfevBaONmtq9iGYMf4dI9wsKAueI=;
	b=IBGdPmjLtSpW/I/swLCOp2bFNSx7J3/Ft9C0qmiKYya7IMqOWNAJJhjnQ28NCqAZo9Yv
	 6xqQq9NWIA+Vf/VdeGo8nbOd5boHITz5LX56hKCoyp3iZnbm1QLHBLFX/FLzrajby9wRV
	 PsrMMB66Ky0HZKnAG0IJKUbhPneXJ0Jz8zACF47xzhT3rQhfR1OcJzcIV5D2MEG/BdcHL
	 vvbVGymvwgp+0f4i96Hprk0dVMpvMu445E9yziCkAgv7O75HH+Q9hiX1nW0fyblBamVkn
	 oT6PmLAzlUxdu1MyxX6F7myjnCMuZn1wlLvleoHz0DoXSn00UT7hSb8h4eQeYNLc/Xw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792356684;
	bh=aXbYQKl6yyfyAWUcfevBaONmtq9iGYMf4dI9wsKAueI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=T8CHGK1c8QutGElycZg9J2FEnQVdx++X5S5JHT1GVw8pbj1JLBbACrpTtuwFn7eRl
	 NdvUG48502nM8rC48eq8qSV0QrWEI2dWCrzn56utf7EqvBXOye457ARoEzQOQKmY7z
	 FrEbd+d1Jmbqzrw2rYCW3YUVZ9ViWCxi40/QnbhrjoIyLdNpUMp+blrl9CwNjFTDL0
	 kDSDhUyAF9xgs+YgHw1ZnGTTNXvcck18WDJG++KyxTiW9dMOW+BqKRsUnGQJ/zoSPc
	 r2ooRAcHg087m8ciV7RD1BLUPkK6VAxVJ0qHqpFCZWSBJb4YANOg7aVZ2OP8LYUPaI
	 NJGR9cWY6hqSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 387A780F92;
	Sun, 18 Oct 2026 20:51:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CE50ED7E
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F3914060C
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:51:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H4Q9lNC212K0 for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 20:51:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 60E07406D1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792356676;
 b=m3ItRci7o4xTkqlqNPiPJ9wlWUUNDgB7ayCp2yKIloywAK+ElibbjR/5qV/fi+HOe8WI
 V6h6jFpYRyoJzn4U8YEAxTC5eOYEI6KSjRH5IC+P9N1FMlUP/dI1/YXvcXzN7tRE1WADO
 7s9orUZZ1GCp98UwQJDCDEedf9aWfj/JtcVx2olgoGV61Xwdrb1/fg6KNBiW2LjngAJIy
 /+Oh1TnTYYbszTyBZ3RXO9ppsZoUZ3CSyizwVQ030NZLpWjc/gdN1K5EOigszWYZh7TPR
 f3JL9l/S9vMdKQwTLjPrLEs1mPP1QHW5BxE1+95f6w8PNfI0O38FFkuN8bcR3A5QLkg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792356676;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=J58TEZOrV3+b26fvPubYFuOYRRnGAfCAEP0mVOUTJT8=;
 b=ncmgndj3YafIbDzLP4PYSiVKBkcyTQQ6O+ki2sOte+sJBWsglCpeZu9jF2aPTPPGSBQt
 vrlqBs0qoG/XcmrnFGTwA6WKMe9J73WnV9PKbuct/NkpqYO8p2ya85ZyXWb5w4tqnOWke
 S0bjjDJNHpy3q0cyolhFat0jVE2DHszxUwqrXa6+eEUyPAvzZyxmy/oegIS5NVXn58jcD
 eZIj1ZYN09pwkh1pNczaSB+bQyuDYrHBz71DOERtbZ/5r8AwBo0Jaz29C8z+U8jUoGOX9
 5lJ67s0UVu6WxWlYN5o5kPCwmEitoc15ZxPaDEzKsSN01ZlRFSnXMZIAEt0QWKrIBTQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60E07406D1
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:51:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0D31698435; Sun, 18 Oct 2026 20:49:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 22:50:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 32627e5b61d0a303ed6499cf589d8e2548cac966
X-Git-Newrev: ed800f27f749339035951b0aa975612642eaee56
X-Patchwork-Hint: ignore
Message-Id: <20261018204954.0D31698435@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-distlib: bump to version
 0.4.4
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ed800f27f749339035951b0aa975612642eaee56
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/python-distlib/python-distlib.hash | 4 ++--
 package/python-distlib/python-distlib.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-distlib/python-distlib.hash b/package/python-distlib/python-distlib.hash
index 8504366a0c..f1aa34beaf 100644
--- a/package/python-distlib/python-distlib.hash
+++ b/package/python-distlib/python-distlib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/distlib/json
-md5  6a6a1389a42f24634f06ab6978d5d96d  distlib-0.4.3.tar.gz
-sha256  f152097224a0ae24be5a0f6bae1b9359af82133bce63f98a95f86cae1aede9ed  distlib-0.4.3.tar.gz
+md5  027419d731f53771b20d66578c4abc13  distlib-0.4.4.tar.gz
+sha256  ca4175b4ac7f71223cc30ed7248c45d2b38c2439d8ee6e498ab67ed63cf3508d  distlib-0.4.4.tar.gz
 # Locally computed sha256 checksums
 sha256  808e10c8a6ab8deb149ff9b3fb19f447a808094606d712a9ca57fead3552599d  LICENSE.txt
diff --git a/package/python-distlib/python-distlib.mk b/package/python-distlib/python-distlib.mk
index 581c4ee4f8..2354d8bb33 100644
--- a/package/python-distlib/python-distlib.mk
+++ b/package/python-distlib/python-distlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DISTLIB_VERSION = 0.4.3
+PYTHON_DISTLIB_VERSION = 0.4.4
 PYTHON_DISTLIB_SOURCE = distlib-$(PYTHON_DISTLIB_VERSION).tar.gz
-PYTHON_DISTLIB_SITE = https://files.pythonhosted.org/packages/c9/02/bd72be9134d25ed783ecbbc38a539ffaefbf90c78418c7fb7229600dbac7
+PYTHON_DISTLIB_SITE = https://files.pythonhosted.org/packages/68/bc/d36966de7304047a1001a7559fbf266c464bb5d8cc85464536ef8c9bcc32
 PYTHON_DISTLIB_SETUP_TYPE = setuptools
 PYTHON_DISTLIB_LICENSE = PSF-2.0
 PYTHON_DISTLIB_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
