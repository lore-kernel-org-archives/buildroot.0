Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 473B9CC6B0E
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 16:43:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AFD480D7B;
	Tue, 13 Oct 2026 16:43:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 85BFHnyblppJ; Tue, 13 Oct 2026 16:43:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BF25B80D85
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791909797;
	b=Ib4V7PMydqjhCYzMKOLHpPBWnz85w3uI1mTnH70zbgHUOsS5tMeG2uEMq1Z86wBbpbdE
	 X4iDF+JX8abWj0HCVAkpd5xg8WN8UrHAb6vGbmCjqbEYXKhoP7MhFXSxcNqQqjWKcgk4O
	 Vfn81HemLqempFC53fy4zLs4jtoXFphUmdNBbJIRtO/AHnwTdTvVWMOhF/+6tvWLH7hNa
	 PozA2wFaw2rvHQ9IDQ4bPYbj7E7VP01cI5k4w4n0loOSu59UVWPE2upHPIBKVJiDozAG2
	 9JElyGdzGfCLOxXx/QUmCrWY/TpNijL1VWmCjWOxRYqYaDzpcGkcYtf187XEiNuqj9w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791909797;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=LdCBUioV6XaHx1x3B+cZUPh+02vcR5JshRimFnu28sc=;
	b=BN0LCVaoNhCdWDPHJtFmf9Rrf/ljWG7P0ufq4frNygcVE29WbInnMlgOcxGjdkl3HcWJ
	 eVMINaRAXJ39tyX6CJr26lxfVIPssQc7ShNLpB2HuYCfKVHyQINqgbat+9m6UIn9AjbIw
	 RDFWSBtDImxhNEItbhdTwdXITX7i+RR2yePMRZiaxCGyo0VjOPetZmIQbJX76GSxb8pGD
	 SLJkOAmjqybGbs6c9AWPaGv7HJg4Y1yhLUBE0/PINRYN3AQtLekaRZhvetGwrWv4+LRpr
	 z/csNFZqU8hh41dv01Jje0zZPOf8JCeZWpX69IPcZ8GINIeaW9Gdz60DEQxpV8x3n6g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791909797;
	bh=LdCBUioV6XaHx1x3B+cZUPh+02vcR5JshRimFnu28sc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=HILXb+GKIu76ngViFFJSKHA1qMphrKXxhltlEYlQ1ukD6546gWz6VoMol09/M8MEi
	 aHe+U3yaJw2oWEheidder8ic/NaX7+L1XNTvYe1mYAnL7WkO2Vd45tgUYWxGpS+ScU
	 D7sqCtJaNXCsJno9CDMWHlQeDgBM/1hdB7eVks1YS96H/XtLSG8iTNKu7U/LJewgP0
	 Yf5rb6RJFWVjyh8DU364RIy/msFpdcpEs6CFtF6fGReO46QzX61fafR1fT20MUo8/v
	 oT6hr4r+DQOWE1MsdNPLqOALsVYsX9yQxbrZ9GCAV1n7n4vGlgTQfuzIEnd1m9Wbqv
	 gF7QJgenwfGmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF25B80D85;
	Tue, 13 Oct 2026 16:43:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 93F60DE0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7AD884007D
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wVCxMUl2SCoP for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 16:43:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 812C740049
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::233"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791909791;
 b=UH3SNzguV5EtKIiaZinUPhqeRFtP9ZVePQhdN2t3kCGzMtkPrU8FmBcKPZGtiEp4BbOl
 SmIiSlwYw7+bc3Q1B6FubRIWTED+O3AdhsNfSixZ000PsvYqLUfpqY9o/cmc5wqmTCVUG
 jcEG6p1b7U+QbXS+wdVtQUzoYefCg+8xCIGln5Lq+/6NtEL3/7/PAMeUnZ7gTXRCHtQEb
 mNM86RSwxkVtFN21P9ERgJaDVGWWSmYHR5AePcRuJEzT3DYMwMOKoKaAXA6l4SArqekVV
 vkSdaUIrSTJAmlT6HClIySzuDbU+O9gatYPz+3A/QssF0UcotMs5d4m03Rfur52gI2Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791909791;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=3nLBkRQRaL8Bi1/ejphNrCVlR1FKqoLO+VXcZqtLeXU=;
 b=pkdSjC5kd4CfBFy9riexlE8HYn3ZxRcRCajuYQr121ZR6FUv7qdfb1LeAIYDDkVewfcs
 T241d+ZIWkgcrAlhqbI8wJHJZscGI/DUStncgZkTlz/fn7Pv5uPGXIKUQkRh1Tr6/U8mO
 HT7UKJNm+xeTQKW7HkuRZk+T19bA24OgPzBMoo2RZjlsqOnTpHEGVadR+xuBbe1BFodhv
 uhQ1h8i0gga2OoTf2t992D4tkrdAj9UCgOsQR/RKyxdJ6sooYDGU47zpus2rTaSWyeTJ+
 VDaES/8XfwW0o5rTc32isuvk1C3zq7FRSq7U0ytDVFBiwu0KxsHttms4pw6QDd4RRug==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=rmo8duvi; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::233"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::233; helo=mail-oi1-x233.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=rmo8duvi
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 812C740049
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:11 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-4af7283bf83so1279059b6e.3
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791909790; x=1792514590; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=3nLBkRQRaL8Bi1/ejphNrCVlR1FKqoLO+VXcZqtLeXU=;
 b=rmo8duviSVI7FN2svTUda0dJgoI1o20oz0A+M7ut+0Cu6DDiuu/7ayHvy9T2Kfgxrs
 eCMA/orkqfBZHNBM1zomAbf862bDZ+rGwd7OUZeVLbHobgnkNPBbDUeopwmn0ecQcIpM
 Sxra3RgmGEy34ELmqbQqjZq3ph9WYsg5eI0tXCZWP1Uat1k2j+VMtl2sXkc/qsfl3ZGb
 RqvvRMwqf+jKMb0+9Ba5V5rmAPR1u70QjEwwf5CvdXM3B5pl64Vgfgr2wJrI8CxixRPK
 6NdYG9ZNGWC+1JhSZex5ejCmg0CepwItYjhGEk1Mn7ylP0uyy3tGLJFSvUkaV5ymbqwi
 /Ttg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791909790; x=1792514590;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=3nLBkRQRaL8Bi1/ejphNrCVlR1FKqoLO+VXcZqtLeXU=;
 b=h1O6p71QnL+1JNXbzeA7bUA2R3+Nru62+/L+xU2ktowhkO5nWxiIA2DnLo+OX3zJr1
 tqgaz9WzUSgJijmyfkqH4xUAg+jY2ATokjC4f87I4fnlVWdKLZEbLGi0t9QxYOjadGtr
 a7MMs2tL2oevnAU9Ycq4rrODw4FYLViAmFFHrMKyEkg+uu8zCxn2muOgoBPrRkllUoB8
 aLUqosZJDld6jaZcfc2GVc09gfMjdPGzz2ZiuRzl1eVo5l4BA4aWPhH3fKwh8IHz+bla
 mVQKnZeBfuX8BnTQs9q9F9bh+YIisrFFgW/uWvwzcqVyFOJZYE++so5/pUryNp7f5PhB
 fzVg==
X-Gm-Message-State: AFq9FYIOBjiNJdW86pXRClmPTRZpgRRAWPCKVgnRq7GS8/GXZY7gM9uQ
 Ad/FqGSKyyh3mrTSH2SnvI8B8eN2dUFdJuRtFzWXVx1LlXSBONypUrsACDmVsQ==
X-Gm-Gg: AYBFou2xQSC6HuyxDFMonHfFInrosHnnmTC1ox/CMAP/sd2KAHnrZK8xMAbe7qRR5it
 S2vJjaqzyOA+kGbYMxSPdzOplDAFoaFcGaF1MgxWljMGoXV3p5ZBVfOK0SU7kbpXGF+JITEuT7x
 LZ20eTC8iLfzmI7R78qmWnTT8QOBq2/QBDvbclJ/KLQd9DideM5zOuSIH3+gwOTRcQymhIPrs31
 veujO4EeAR9n2fPuHqRrHCNnUYr56F5dz5nZgwHylPf+ggvPIhjyJPKtLC+rTJ2KtQ5euUjgXjU
 xVngs9lgEOjJ+ZSUxXc8Ni+T0fN+0Itb2GYJ/pNaCa+Yux6VqK3TxmOmfY+HI7gsIUNGp1kAruT
 3ix5dHvxhNZbnu2hY/FFcRM0oeL4U8TCWvsortYyobRsHbmJAkSyRirkjM3KhozU8aB1+Kl9W2d
 b0k+kJhSpZW2xFtX3fNEyGAVB26L7hnzSKjAR/HW9y/AKZ+NJlv97IvnFTv6hRgtpXvF5c2/xjN
 r33lBPQax+fx9lut2dERlXrE8Ygr6CexJYXdVMnbU8aduzQ4yHJ61EEaEoDNo2jZ8tCPfROY3wg
 qZBqELoX0Pp+BCSCKPTlq2WPGMXBYKB30kIrvPRIZJd1siwt+FYdfXKGGfWgHvObbrl1Cp+dUHn
 mNDzA2cIhH9kqwql8u1sQ7DXuJoJzqOHKI8Le2YIYAFE=
X-Received: by 2002:a05:6808:3c48:b0:4e7:c6f2:75a6 with SMTP id
 5614622812f47-50c590b2f42mr11400012b6e.68.1791909790186; 
 Tue, 13 Oct 2026 09:43:10 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a6df881fbfsm200254fac.2.2026.10.13.09.43.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 09:43:09 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 10:41:56 -0600
Message-ID: <20261013164254.1476592-10-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-filelock: bump to version 4.1.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-filelock/python-filelock.hash | 4 ++--
 package/python-filelock/python-filelock.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-filelock/python-filelock.hash b/package/python-filelock/python-filelock.hash
index 23472337ed..80be2af490 100644
--- a/package/python-filelock/python-filelock.hash
+++ b/package/python-filelock/python-filelock.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/filelock/json
-md5  2441f82b97ae84b4dd06f6f183c1c19f  filelock-4.0.10.tar.gz
-sha256  00d6a81f976a6332551c2c10f39e12b4abb7e01c64d4c497b81a615bc9186f1f  filelock-4.0.10.tar.gz
+md5  1cd0ee2e9db394c77d013ce31435c200  filelock-4.1.1.tar.gz
+sha256  7ba0927482c5a814b0a7f391d029ccdb8010f576f0a74c0dcde1811e8bc4c1b6  filelock-4.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  608c89d5060ae9921adccf3236695bc654a9946e12323ef6c021dfa04e294d48  LICENSE
diff --git a/package/python-filelock/python-filelock.mk b/package/python-filelock/python-filelock.mk
index f24b309787..376ab42dee 100644
--- a/package/python-filelock/python-filelock.mk
+++ b/package/python-filelock/python-filelock.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FILELOCK_VERSION = 4.0.10
+PYTHON_FILELOCK_VERSION = 4.1.1
 PYTHON_FILELOCK_SOURCE = filelock-$(PYTHON_FILELOCK_VERSION).tar.gz
-PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/4b/51/a182494d1d8dde1240bff84dda57d48165d982e59582ce8f167e8e3d7628
+PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/35/c8/1d457d9150ff948f2ce6ada7715e0eeebbe5d3b58a45271a1e222474bcd3
 PYTHON_FILELOCK_SETUP_TYPE = hatch
 PYTHON_FILELOCK_LICENSE = MIT
 PYTHON_FILELOCK_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
