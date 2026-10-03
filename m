Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F05C5CA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83BDB40BBA;
	Sat,  3 Oct 2026 07:02:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YhKQkK0_2mZ3; Sat,  3 Oct 2026 07:02:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 10C7C40B8A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791010924;
	b=fIarY0hDBG4wP7wcorkj4cBxBM9iiZVslDUq2QmIPtRb+Dk3ObQr+ltmVg8pNtBnj7Mg
	 E7cYBhmbxMc7c8Y+Szwr6uYe+fQC7rWF2D3lQRNLDg1u6BGV5jGVfTyKG8yGXJUoQkNGC
	 g4blEQo1NUsIezFPCefuwDgjEHzi6xlurvZKvGgj8XnTixO5XbyxCyqyUoysNdVYn2qTk
	 Hi+za9vdSM5gb7sR3vp84T73oFswRj1JxaOjtHV7mjhixvNHVxSpmdbYD/MBQlwLgdgLv
	 hhPZHQZ7934JOT2SvLwiB1GK3cf+TSxqfG3h1wsnuwUtGiuxi12/bxEahJBelR+U23w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791010924;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=gOvj2H7qoq4RysfgS/cNY6Fvu90KfuPccLSiJWCr5Dc=;
	b=Vdn0Oq2nhU4ZGQVqGY4M7OXRPfdsY+Kh7x/ndRjHMdbCJlmlAbVPocAqqQHPbjHTcSRt
	 fWVLlxlJ33GXMUDRMeFzoTYfG/ER/ZwIlwkOMgN0NqjHD2EU5epB+TaBkMEVaD7aXQxp6
	 VhjTEyvtx+MGwHlmYv1umkKtC9z5m/8sJ7PDRvgm4WE3I46+VW/8s8BYICvcTYMwmfpjI
	 C5wIwKZ3+pFadbx8uUnQ4+fsQRJNvfGNYcaqaySt3NNqAvdrZWc13xbfbff9MAYxiXzRl
	 LDhwk/6eWDxFm1TwzB6jeDYlU8pqYmfyfwp5LTx9qyZNztlYrNHnPr/Ga4Ykrs5m0Lg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791010924;
	bh=gOvj2H7qoq4RysfgS/cNY6Fvu90KfuPccLSiJWCr5Dc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=YQk/MiqftD2f6CYpiw5V6dsjKnSClHXdWkp3xQSEGGY0s+cQaVlmAbZRVeK6dQTwe
	 ALM6eLxJmzDOTM+b25mybUdNZVxDTQ56Fj5lB9V+RjHTvtyU38mwecgLqLMrN7pSC2
	 tLJkdHP/xgoeqPeXSX7D4kb2RqUdIyKH0Fp4OcXeEZye9K6dGhTOv3+OZcTeDoub5W
	 oIMI2wsu47Bsl3Wm6FoXI9cuqpdSIcbRLwOi8FXBiC7712ef3G+MTa8cbHFxD/GAQD
	 v8/Fg5bt2WA4Vs1l0dP3iHsffGw0Q/IaZoQdd0Q7Z8pDL2YW13oybT5zMyVvTqoJUs
	 AQAdn5lV9SydQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10C7C40B8A;
	Sat,  3 Oct 2026 07:02:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 152432E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:02:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFA7D81178
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:02:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IJvp501lq-24 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:02:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5A9108109C
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791010920;
 b=RGxZUp0aEA4L7B6ELZ1JkeNVlUQVkfJ1KU2KlXtnBLbpRsJio729QggzNj6EN5mtKuS6
 y3JZJBVCgJatkWdAPCWkkKjAJFwjiLjtxp3THOEa6Y4xCeLWCddEbUTWbkGRcJ5XO3n24
 mqXlfhnUMgiHcKQiqigI2YViwNj/MQuIhIQVea2+EPHZQTEJSH7MqkM560AZIJhtEvhbB
 8vstlm9L1BqgRdxiuC4n63JASH5g0fZxAfbG/V3M/MvqdUFY818ijn5V/otWYYz6riDo6
 2YdHO3gh7YEQd79TsFOWL6SruBQ2QyjFFBywOA8PJLOaDOefDN78SqpOEFRY2eCvdcA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791010920;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=M2Kx+mV+RTjeYhpsBDp7CwzGk1zhwJvSv5JhITFVPR4=;
 b=WWQuqAhz8d1POqxoXVxt9zzWaS6E0Qhz8UAbNO8XYYDz7uBEWPWKa1yOAWvQ+JTCRwCv
 5Q4HqRcIkjB+Zs9Ch8BQ4nOSMthRe400OonSxCLwB0mR5NDWEul2eE1Zxn+BI4HkTa0Yl
 Y6nvDfLW0JhATvfUgZMV54Sa9cBoeGZmFls+Phdm0uNlGhEvtRVOmrD4TVlYQCtdYCjWD
 awFHsbLXb1EHG5g/5r0KN14DJRP6GUaFAEeS9EYZCsIDtthIqlnXnSI/qF+dbYns1DaAC
 fyvwISJ9ruQaucHMWqdKWaTyCTIV2mItU1Nwk8Mg2nNgyB1cJ+YCe5lGs4wN4dSr50g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=LZL+R0NN; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=LZL+R0NN
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A9108109C
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010901;
 bh=M2Kx+mV+RTjeYhpsBDp7CwzGk1zhwJvSv5JhITFVPR4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=LZL+R0NNY+1oeBIKBitexrMdMGKL5ts0r6FiNeVU0yQ9zta2HY6B+RvyHsw0/zoVT
 oblHexWpbIZahMRBmM0kIW89ZkkIC+dKZ0xrTQviV9A8HRvpllzUh6Nq40rE7Xa5Hf
 gB3TJSjhTT+G83OOgSSlTdjOqTGCGM40WZNetYz1DvW0/2OX2balrk00z8aqilGlns
 OV53L/lOHOL47AJ9YUpv2KXDMselLb9l5iEwUbl2c5QgvEpzZIGBMQ2s74kjPp0FOL
 kzU3LDx0f+Qa8OHuGhE1Dv8p3G+TQOE+rx2gRKnIBDSaT6xTfC2odkQiWvtNVHkEm7
 XXm0on5TqyogA==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 6dZJ63iY9xcIfWqfdLOWoOl6HNUjOPDE4IiZUjgD5YL3p0rKMRnsE4gYAADhGLXlNi990wKqTT/
 Mw5gC6+ApX9Zm/SK0aDtxNBclSfijrmW11QfBJYkhfCCqYteudj5FBczXwPL//Yn29Hz773pFBK
 aW7z+mgNPghaemOO3NRvcHfCRe72lVfzGVRVVPvwqVinP6PPq6L+jxNrSg4fSSoYkvLMWudQh6l
 RuPFTYqs45QhGWKU4lNnLivRT71acwj3vqxVi9UsZPwwmKhrPHgpYRJR63U4IA2dH4l7yIx8gr0
 G3aVfb0AsYcEEaWE1MrwFE7UfCuMbzSEyKAPvjllCmZbUPLqLq+tsRdFv6myrJ+upEqj43Fb36F
 YW0AlbgDWf3gOx4HxnNxJPxe1RqxPiA5GFz78nPScL5N6WxaOsLoLEYWESI/iZWjzmYkxquIeao
 PQQbCypmpB9Vl5rjpdUeOW6uJy/zucOmUtRSWk74EJ4fA0bAcM8XwFFIZcHUom8q02fXFU79F0a
 39pgWVGhbATbEEQXPAVeyQ0fD3ojQA+c2dLKLLo0S30bgEY1uFC9iRME/eWTDr3eLgBWo2/YvpR
 ITXQHYniQoLkBryDHlF9kaMRHqzRqcrQaRA9Eo/xvS5pfXpqLjrl1KrbGvYDR6k=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D1D93A4C53CD;
 Sat,  3 Oct 2026 09:01:41 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkb-000000007Zo-1EeV;
 Sat, 03 Oct 2026 07:01:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 08:59:35 +0200
Message-ID: <20261003070128.1295458-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 003/114] package/python-asgiref: bump version to
 3.12.1
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-asgiref/python-asgiref.hash | 4 ++--
 package/python-asgiref/python-asgiref.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-asgiref/python-asgiref.hash b/package/python-asgiref/python-asgiref.hash
index aecbdf8000..43195778f9 100644
--- a/package/python-asgiref/python-asgiref.hash
+++ b/package/python-asgiref/python-asgiref.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/asgiref/json
-md5  85bc32494d842f4941e2b1fc2c7b61cb  asgiref-3.11.1.tar.gz
-sha256  5f184dc43b7e763efe848065441eac62229c9f7b0475f41f80e207a114eda4ce  asgiref-3.11.1.tar.gz
+md5  1997ff1970b2879b5945c9e8c9f8765d  asgiref-3.12.1.tar.gz
+sha256  59dcb51c272ad209d59bed5708a64a333083e86017d7fcdd67498eeab7784340  asgiref-3.12.1.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-asgiref/python-asgiref.mk b/package/python-asgiref/python-asgiref.mk
index 392f0a1c1e..4955a631d1 100644
--- a/package/python-asgiref/python-asgiref.mk
+++ b/package/python-asgiref/python-asgiref.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASGIREF_VERSION = 3.11.1
+PYTHON_ASGIREF_VERSION = 3.12.1
 PYTHON_ASGIREF_SOURCE = asgiref-$(PYTHON_ASGIREF_VERSION).tar.gz
-PYTHON_ASGIREF_SITE = https://files.pythonhosted.org/packages/63/40/f03da1264ae8f7cfdbf9146542e5e7e8100a4c66ab48e791df9a03d3f6c0
+PYTHON_ASGIREF_SITE = https://files.pythonhosted.org/packages/e6/26/3b59f2bdae5f640389becb1f673cded775287f5fc4f816309d9ca9a3f93d
 PYTHON_ASGIREF_SETUP_TYPE = setuptools
 PYTHON_ASGIREF_LICENSE = BSD-3-Clause
 PYTHON_ASGIREF_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
