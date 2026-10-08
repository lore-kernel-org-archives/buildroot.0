Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C071CCA9EC0
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DE0D60A67;
	Sat, 10 Oct 2026 09:22:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hRwjAk3VXOAf; Sat, 10 Oct 2026 09:22:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A81A4608FA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624133;
	b=Rd2HHNYFUqUGrTOHodqv42VeTh9NiFYqPieaCpqWLtFmum1+GThirsvXQzwcGHk66fIs
	 dNRl2VOzBdfhFHRY8AYFQYMYWMHeL9IE3oeKAcVpttfOinW0b2lqjEgUggaMGlv/GuLk2
	 hwQcCOZttgXi8UTP9NIisVM+xv7D1swlD8F+ywwyyQeYHfS82vZ70RScoBr6+KKi1T368
	 ekELsFC30pkzcXsd9+FWZAPsN4QABr4xblHs/rAf9lkSTzpEayHBa3BHUHH4vzGVWddvC
	 vUjnQ7twpWYuOSfSfrruPNVexqq2ld0QRYE5CN0GVMxDSQzngB3LIcr3gRmJbzvXOqw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624133;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=PCEhvRj/cliVEznwFYGvoasK1EjpvjqiDZBiDPUq6Nk=;
	b=Toe+8XbdXXBEV6Jx5tnB4/cQCgFdZ0cnUz4WoxsjHC5VgWlQU8U2Np5OaIVe53Bi9/Z6
	 nT4Hsu1ynlzh09f2rFMl7h6uA2tp0WdaZicPz9k0jhe2n3+IXu0vN7cdb9KtsSPMPcI1e
	 DLwhN/eJ2xyz1qVbfBft/0gN1etZxWnzRdCuMubH841YFzX3nZl7BusBaZ6wp558084mb
	 EPjBz3jtqHRLYDMDlcZt3cYnnBHUGBn5Y/GCYxL7eCnxGUIfUZtkpX1P191pxNw46M/r7
	 S1n9Ei+cSwe4NsNaFFOWKbn7w1cXd3TXOOwisH/P2m+nCPDypHyPvGMenwkyWV0q2qg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624133;
	bh=PCEhvRj/cliVEznwFYGvoasK1EjpvjqiDZBiDPUq6Nk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=a/7rrzfN8i2C9lYphckSIhbPXzl15QMpRyvqy9AsrbUehriGqFqeiqAfIFtjlh+gn
	 vmH+0tOMetrgVMGufLLNURwfGx3VrQh7haqw0EbhZ14F1Zanpyz4LpSMw5VMpnbPCF
	 9hmjfgK4xrwLPbobQJSPGmFFsaQrc8bqOGPYqsCN5/a6yJgvRNM6zLjnZVW1iz6iPC
	 xh7H659Ltf04DVjCVuw18AJkNVIUhyqEXvDnnF4sU23S53QTi74i+b8mPo8s7smWCZ
	 0D+AXOW9daA2Lbyh67Mb4PQ6fmjjK4fJJd+V7ih7AZxto+OFJqFeNKnM+ftpMDkh4m
	 cfH4gcydveN8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A81A4608FA;
	Sat, 10 Oct 2026 09:22:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D77E75
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6FB326067C
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QT8KMBZPQ4-R for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AAF3E6064F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624087;
 b=ovNGPeqm7S1C1+BwB6xKVV9u7ygeJHhcXKC/jSgGh+oYDwXhB9vxXwInxmqP6bTYLBHK
 u8r8fOWt2tAMTcrzSv+Oi5j+nIpdK1vJnBVCEbiSg/qJrgL1hhz12OMNW96vBbvU2iAII
 qcD/Y57SQtwhhcupgWvxYiYDb1aLlUPN9mC1wlrpmYMShOWdM5lsI/ND3cCttLsC6ILNX
 NXoIm2aCx9TXOxLBLl9kgKsz4a+vK+ndjl+fQjAEm9NvSAh5ML679OL1ThHUPnw6DhtYZ
 rHSIhNtjEqtVtHv7iS8RRJMGJ0gXaj71YUda9gZMHymduWih2h/9QbbHPF4rp3OIt/Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624087;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=44UkpspR8ECQ8EyhjXuZBh5ZuuP0jbrznB/JLdVag/I=;
 b=LP7Bbl1VVgDXl6yfGzAqCUv48snBnPPKYwNXC8YJ59hia3oJA7YpYSDQjljjaw9s4h2/
 WYXaVYQDMJB/X+epCThT4rbx+Gt5A5tSIuiiR078D+d/n/IjGEqVwzbimKidli9ITlrGA
 iD1EgMJt4gUKZKMK2CR7vXo1srOnwI1QCA7yA3NU3BSI8CMjEpdzud8Detq3F7rin+HgW
 qVpLJX6C9friEaEz9dQhGAgfwCshC9S80vBETulgA2KYrAyb7JuiVOdT32sPYsZN/cVah
 ywItLZzSJZXVkleoDNb0VYAVtjquiof+aQpQtT9K73sNPx4k2XdxtTtFr/HZajKsx7A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AAF3E6064F
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 959418F0B8; Sat, 10 Oct 2026 09:20:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 12:28:02 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 240b30a2a56dd91538ce88b2cf21624ebe107077
X-Git-Newrev: 76b472df0a2c500b1a5f8df9ce03a9bf867679f9
X-Patchwork-Hint: ignore
Message-Id: <20261010092009.959418F0B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/libgphoto2: drop
 autoreconf
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
Content-Type: multipart/mixed; boundary="===============0489742458221063413=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0489742458221063413==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/76b472df0a2c500b1a5f8df9ce03a9bf867679f9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Commit 8b05934511ab ("package/libgphoto2: bump to version 2.5.34")
removed the patch touching the autoconf macros, but left behind the
comment referring to it and LIBGPHOTO2_AUTORECONF = YES. The release
tarball ships a regenerated configure script that already includes the
jpeg_mem_dest size type check, so autoreconf is no longer needed.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e493982138e1ad726dd07e2832d40a8bdfbb59d1)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libgphoto2/libgphoto2.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/libgphoto2/libgphoto2.mk b/package/libgphoto2/libgphoto2.mk
index a639245c25..1c39b26cd0 100644
--- a/package/libgphoto2/libgphoto2.mk
+++ b/package/libgphoto2/libgphoto2.mk
@@ -9,8 +9,6 @@ LIBGPHOTO2_SOURCE = libgphoto2-$(LIBGPHOTO2_VERSION).tar.xz
 LIBGPHOTO2_SITE = https://github.com/gphoto/libgphoto2/releases/download/v$(LIBGPHOTO2_VERSION)
 LIBGPHOTO2_LICENSE = LGPL-2.1+, GPL-2.0 (adc65), GPL-2.0+ (some camlibs), \
 	LGPL-2.0 (sipix), LGPL-3.0+ (pentax), BSD-3-Clause (ax203/tinyjpeg)
-# 0001-autoconf-checks-for-the-size-type-of-jpeg_mem_dest.patch
-LIBGPHOTO2_AUTORECONF = YES
 # There is a single license file for the LGPL-2.1, no license files
 # for other licenses
 LIBGPHOTO2_LICENSE_FILES = COPYING

--===============0489742458221063413==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0489742458221063413==--
