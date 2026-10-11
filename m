Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC439CA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 13:07:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7936C60622;
	Sun, 11 Oct 2026 13:07:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0EkMGEtiaGIE; Sun, 11 Oct 2026 13:07:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 86E826060A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791724068;
	b=DYBLPfgQsCKIK+/BAub7R6vS/O+e8sk/5p6HLpkJxtuOI5DKqHVwzUpdUEqaMO2gicPc
	 XzhLbrkoNJmPz8NBluKTNU9b9KPa6Bs32BLjOXUD3huBUU3KVv0AnlkGH5bQEY78Nsp5T
	 ak5ygI6Zx58rO6cC37g5tPGeXeEbDg/FY2bC5/10a97u8T6G22kgO18RXpVMvfxaL1Ng/
	 qDfJW6onYsDpTmBjqVUFLv/1L67S+EFbpQcNckssSLzUJUqUifF4eQN9s7C6do3jQwtaw
	 nxMNmJ+PGHQADpvNcUObg2ENwEMaE+blIJgsY4GPku2TtBB8xUzzuiHn6o8jhp3bJ3Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791724068;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=YBt32S6Uf/6Uh5i1qWElljGdcI32pZDk1Er82WSVeRM=;
	b=kI69iE4uLn0W1pL0jgXdnQmg82DutlJGKvpk3lFQQYzFTttxPNa744Cbopy1I8BAKY2i
	 9fJYOsbIbrEkXCRhOGiOOewIZahqD5LvDC6svuqHHFZjs0vKPRZLy2G1X8DJACphI8B97
	 WcY0H91H2HIe+SatRkdzTsrEiA4X8S84t6ZSAHaKQcSAtL/mw8DJFk/fMMMloi6zYMsFQ
	 LAGKhrJxJcwPVQEx653Qb2xw0mCo+a5SSY+zqVQaU1zGodsZs1ngjvWmsIWFpq4eXn35W
	 Yoqz7MyV0SI6EMLQkW4h6hYwiKLLFwa20/0Ult0ee/knxEn5wLtVjASLd/4ENcB1O2g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791724068;
	bh=YBt32S6Uf/6Uh5i1qWElljGdcI32pZDk1Er82WSVeRM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F9tnre0a3symVXi0005senrXomZ2Yxt3zJkyEeQEUAQQm781QASmqfHueyjwUBsA6
	 Tc4ypYvSWu3SbfYGGj7qAJI8WCfNAZo+RcZ5r9bQOhWB46pO1I724XylzayGgkQSLp
	 a/B7avj3Z/zv96BVSrR3zNOLInkUIhwjbmTa3PuL6Hx1KwsVIms4J/tBR23eG/S/gX
	 h1vrku218XunmUiC6Ji+J2kM1jDhO9YGMzmMszEFWpc7x8o8eCfWl3f6wsstHd9dUN
	 bcjryfzj+C5Lmb51/hielLLVWMGvM0ySWDKnbImSO+Ej+ro/V30kCcDp1wbPXhNTyU
	 BJvj7MQZ++LFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86E826060A;
	Sun, 11 Oct 2026 13:07:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FBB41A6
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:07:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75D154008B
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:07:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HMfIr8UyKTpR for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 13:07:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 977C74002B
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791724066;
 b=IigmiNdd7VYQUehW/u1zzpowudOFFouBaD0hwSXOoYUVIc1yrZotfzus0EAB4l6loUGx
 U/PuGtKS6/B31HtOsEQL+kK1q+qp1RgSA5UkJvQTeLwM7cpKCLbTcVsLhpMUSUzavx7Zk
 FS5y+SlhPqteocynLIhWLMjtpBcS8rTf/uNjm9iYMe5kVHT++JAXAciYOymlCL4+oKTf4
 WSp3nSixBNb8Da+iHNyMrEY4krgSm02z2YcBU1eViPiuB6yKSobE9Xk0ozofVKwuYku37
 W9jDhp45513ywu9DVCYTwLMfXe/Iw80v7C9TWkt5VHbYldbNO72T36uH8g+ESZFYgqg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791724066;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=XwKQEnzBAHqTeZySi1o+lNTXj4vtAZN/G+QMQLgp4iA=;
 b=I/GwMHawTS/e1RA3K/vdpxjtdzPVIft90Xx2siUFOWLqAc2lUXtNwmkPYiNXtBeFNP17
 RU31iEU+UiTWcMoTPbQXuuXpoSIo8gI6lP+NQF0KMFMcfkw62O+Vc/t0GTDhMAQ3IbVmJ
 rxVFT1QyljJ396DRjZX9x+yxISU24wzyIDOv1RfH/otaSrnTgXtKAcFMyzSXSRVie1EB0
 +GkZT3J08UhiwIwqdxly2MBCpnsh4h+yQyns2xV494w9xwI5d1JUzGd+cjcbWq2Olm9oO
 NAeKyNQNKpJEU95ze8FwnGESqJvb4WA4bixn8WOWxFKO7fMIKcixGvXlsDaaJ3gsaIg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=hlh96bGG; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=hlh96bGG
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 977C74002B
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 13:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791723664;
 bh=XwKQEnzBAHqTeZySi1o+lNTXj4vtAZN/G+QMQLgp4iA=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=hlh96bGGnYlPBigW8P2WSqMtu3sUEJkNkU/tIJ93qlUND2C4GUJpJZEYTP/IJ5smZ
 dr9TQCsNZm6Hv7cgTT6Y4radjOzKdQqHwCu8Y2JaT9Qb6wPpMMm0Eux24lycZ/5Z+t
 TFZsp9ngJBvPAE9DfKMkOSl5pPYVjY10LFHZK/ezJYhXHCBRVyaLX1F+emvVJdYMo1
 2MOzduYrJ1TZtkBh8tUf3tL3c4E8Wf+MDs5+SgENdS/JF+7Zs1EUVsaFDF2xbnbA7H
 3Mh5OjPKI3RVcX1j7k8ajw8bLLVc+3yBVqJCk4MQGQfmcBjyQltSg6EjaCSteoU74o
 dsYwjiOMJf0jw==
X-KAS-Sym: v3:f51bdf72230551df:Ox5mmHqwgIvMyI1QgKEa7Ro2UqoiVPYwa1ib8hnsjjQqD
 25s8M2vwFrIHsd3K5yBRCNR9KcmhbTBGk0Z/UIeFpf8wsnVNojbXdjCN1xVotleGBWWjjzHBgEE
 74kL4L+STMwD/l3tPdkNjVc2aEcTg5E+9kq3JIuVVgKZUkyGnD/Kyv1FD6YSp7FcFjV40N/5gBQ
 c1a8pSNeJlBzzKSDlvrm7tStdZZURMMjpShUwTVAm3ujJrgLAxVichT90dl6Ye+LoRN+5NYuoCq
 FrxKp8YCAl4Fk1rds2RrRz+55Ma6FGhELkZkdxRcDOeNbj/YZtgaek8wOz/3DQCuSXG5FAKA==:
 XPAtmwxwCvUEcYcLERfspwoIbj+UGcHEBbIdAL868RNeOmjL39iHLYJX6oGdT82DmsfyE7Z3eov
 92CDP33gBLAd7rkD3uoGKaEW7pvxaWB8Snsps16JH8sU+31sYQfTwUmh8/mobS4tCPcE7QPuy8X
 eCpKOgIa15WnpaNjsWVT5a0IwQAOhUGfiRflGLhmAyoJWdrbh2Kt9kx75dbp1otMwt+MdssHjSF
 kmtVbkiR2veCUkqzuQ7Izy34Bw6NrrWxAG4qKEDMc1rL9iqva/hX+xZbudTQzoeHfFxVXkLGX/y
 WjTumo5/H+LTGwrIKn8ioHPT9qrU8UAUBiD+FSLCQ8emvOC0zptgKqtoSyXhbAAM08f9NLfLAYs
 ff+mynwfI848f6p9nFzAh/FuPWpGHqEmGkqIoePVdCxjKHUvmGbhVO+zm1anBQc9DvOJksRmTbN
 pV87K7dFvpge1o4pMxCOALlO2sLv6Wxz92TBvh8MpWj/pvKwbTs089XonIzve8bRT/0Lt1HZ4dm
 7zaQiqpHgOkLFvOevl1TDHfqcNTw+BYyRJlj2u2SyIpxvDllNkD6wDaSxsB7aJx9LZxQ0VD/Hno
 YzJP1EM=
Received: from fli4l.lan.fli4l (p5b3a0ea9.dip0.t-ipconnect.de [91.58.14.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 065B2A4C5886
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 15:01:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52426)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xFtAl-000000007Fz-42Cc
 for buildroot@buildroot.org; Sun, 11 Oct 2026 13:01:03 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 15:00:37 +0200
Message-ID: <20261011130058.3443432-33-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011130058.3443432-1-bernd@kuhls.net>
References: <20261011130058.3443432-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v9 32/52] package/bento4: bump version to
 1.6.0-641-6-Piers
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/xbmc/Bento4/releases

Removed -std=c++11 from cflags due to upstream commit which added
compatibility with c++20:
https://github.com/xbmc/Bento4/commit/9380a868a74252fa53c80174a3e942168e6c0d85

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/bento4/bento4.hash | 2 +-
 package/bento4/bento4.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bento4/bento4.hash b/package/bento4/bento4.hash
index b933c74d2d..bbb10785d1 100644
--- a/package/bento4/bento4.hash
+++ b/package/bento4/bento4.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f1f8cfa4f7cb651b609e587f825607cb4b06fe5b08af876fd0154a434f9a5315  bento4-1.6.0-641-Omega.tar.gz
+sha256  cb5006cd30889238760556e6148f69be34fef4dc48e8d895a9822f805504a5c0  bento4-1.6.0-641-6-Piers.tar.gz
 sha256  7daae92c8628ada28def8d096fe2fde298b72ec3e2d64a3c408afce38edb361b  Documents/LICENSE.txt
diff --git a/package/bento4/bento4.mk b/package/bento4/bento4.mk
index 569e320a2f..bb91c9b65b 100644
--- a/package/bento4/bento4.mk
+++ b/package/bento4/bento4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BENTO4_VERSION = 1.6.0-641-Omega
+BENTO4_VERSION = 1.6.0-641-6-Piers
 BENTO4_SITE = $(call github,xbmc,Bento4,$(BENTO4_VERSION))
 BENTO4_INSTALL_STAGING = YES
 BENTO4_LICENSE = GPL-2.0+
@@ -20,6 +20,6 @@ endif
 
 BENTO4_CONF_OPTS += \
 	-DBUILD_APPS=OFF \
-	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -std=c++11 -fPIC -DAP4_PLATFORM_BYTE_ORDER=$(BENTO4_BYTE_ORDER)"
+	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -fPIC -DAP4_PLATFORM_BYTE_ORDER=$(BENTO4_BYTE_ORDER)"
 
 $(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
