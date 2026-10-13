Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C149CC6B1C
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 16:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3066D80EA3;
	Tue, 13 Oct 2026 16:43:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LBsWgJjRh3aC; Tue, 13 Oct 2026 16:43:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 55E3D80E58
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791909820;
	b=KLGBgPuqw0Q2BhzN2N58J27pCqqsti//jcELQQrzzi268N2LQdUmcVQZFT4V34lR/LU9
	 4qHKPT7nqJiZaZg9MDScgka89zTGe69JRTE28IXfXTCvMiz1UPxMyIDYGQE/sA5tG1XO7
	 c0NkxvWEO+SHEw+e0IfFB1TB14SpM9sgsNHvRRwTlQSP7Gy9Q5gr+tbM9+YTrLB/mHB2O
	 D8GbhTSVfBIXQOSDhQJHGkAmWg8tblyJztgrCWePRFkD43LIKo8vZ47Sr6owJg9v8bOIG
	 eYiaciO7Tdp0oB9oXemnfpw9xS/HFWVNjoea7dCdMZxQS8DAa07jwINE5yI3ad/AbCw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791909820;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ahwiMxvClYbb12CaUzxzf+2CkTufR2iAvS1F0TjSntg=;
	b=lN2iP35VeKJJWTcUyjryYM4waYTBbONM79n6ngzLnvWruo4NGXLxLEHiFJI7wUn0Cm7n
	 M8KEVNOhlOyPoM9rKnvpL1ra++mzjpORn7nIACPvMGQ4g3oxljOkhDobUQP0CQb5CWofZ
	 nnDPGHujPMwBXr6LUjjHLJq6gGBXJwFvA2BafjTIFHs9ZpRS2gNQ70EBZTMrxVKYsbgxY
	 tkACKxJlr0ghPt8Sjh8H0r1SzvznkExlKyNgOiW8xiJKSPjbZJrpXTNTBsxPf43NtryxP
	 dRjPI0OlgoJfMt7VwI77z2GUkVzYPycQWqt2ESoiMbEc+LI+E4gRD4rWZE8yR6OSz0Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791909820;
	bh=ahwiMxvClYbb12CaUzxzf+2CkTufR2iAvS1F0TjSntg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=XEKTbNe3wCmG7Zq4EbuUbjE0/V1s6LYDRWRUm61EKPqZBNWwhCJqrW2OgscxzmiRt
	 XNNBBAzfJ7wzulygECRQFRNUP3/vUz2eUwVJvTr/j0Ej6uxvrH/uBUTMP/dEDa3LH6
	 ikc3uzO2cr8nagEhmsW+w2k7EpWh+rOn/3iuFPePDj7oRZCam0DCY+p8wT4Mtqtjmi
	 esDtpwU91pro9azeu7DomfdlGD6vHr/LmmJPhWeQZ5w5BfTbbmGOyEY+tDp5v4W4hn
	 SqLS6w+i69Q3crtjHPnXQt4UfJNiHfPQRkfzYanUm/qqsNMT0VKHUMeTPzaShrc6uC
	 dsUzjRqyAY/9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55E3D80E58;
	Tue, 13 Oct 2026 16:43:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 456C9DE0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 42EAF6078C
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X2Tw7uizNi-2 for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 16:43:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5388760789
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c29"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791909813;
 b=f0sqHAB3PeV3n0CTvJZ7KjtntDUQXMEiziAPEum5MiLEcB0ObxjxFLfVkXVE88/eRN8v
 /xg96U1DWpV3UJxgvoDa9FEXDjXqG2IufqixKRpEpZH/wvto+7iphhlNBm28PO/54PYJB
 7bA6strsJgS1yM1m2rHqsSfAJpWUjM4L5RIKjzkQCIOexd9VC+4IdoKHz9wA0hUJGAukX
 KWAlVkhQISo2NcbaUtUTbzAtuaFutBNA63SDKa0I/9ZtyHqWVe8vPFqXGO6d+nxsHB4Tq
 uJZM9mXkwELexC1E0R9XOGL8QDwESWqcrOUDH2+R9pob36oD3Fx0YmVR0b1aHb0+5Qg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791909813;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=G6eqR3p6JxHpBocWpWKQzDPEUGbw3GYckubZfU5Mz+Q=;
 b=hTktRJz7RL+ySS+ELMZamlFQiJpWboHMxWhsmuzsfggOQwtkK0iXqC+utrOMPhWzreLh
 OujM8RCGDOVwDVn+9pwWiWPvS0j1BAvrORcvtPk6qN9jlqgDqnHzfG0mnQnD5um1fa1zt
 ZUZBs5cbA030ubmRoN0HJxhMy79FDiohgs7Bq236eXdwncL3ourP2nXtgoK4sVTU5NmjQ
 BliAY08pYwrK5lGGuZEqZYGek7LgboIEqKLJqAzxvWMfTHn+1Le5URvmPLl2gC+RCLyvN
 uGSktNOdcWUZ/8TobJgSgtHxWaQqSYs5OvLOC/q4LuhxKE426yxl8Rn4Vkx3P8p9Myw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=asyVQhaw; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c29"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c29; helo=mail-oo1-xc29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=asyVQhaw
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5388760789
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:32 +0000 (UTC)
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-6df1eeb43feso1341071eaf.1
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791909812; x=1792514612; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=G6eqR3p6JxHpBocWpWKQzDPEUGbw3GYckubZfU5Mz+Q=;
 b=asyVQhaw+EWoxxH9DahXyLod0SgOdu/UXoLASSEyXA+kdq5zqS2mUdndMWBpHj3wXF
 sF3eWUxT1eApgyov27TBm5giMIB2MLZN+w0hrG6UdFqn8h2ON/Ggpd+QyUQmPdGmQIDt
 FoOSwEUrHzgLr6U8SgvKV+rr/+9DrL1qrbjVRg8MVWt2ZRWqi7RXmwB8SBdC2tHz7uys
 zMtjQOmOkkaDMqwKiFcfHVl2oqzp0S9AI3nV9rd0GmEBgGwjEP7jEF9qyUSHGTZ1OxjI
 hnw+uiwI/I57EVCLZH0PyYyUYTx7i4fL50JonyUzJkrXHJdLc6fhpCgHzx5THtAjSdvK
 iK6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791909812; x=1792514612;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=G6eqR3p6JxHpBocWpWKQzDPEUGbw3GYckubZfU5Mz+Q=;
 b=CpE+sANMrW40vS2hFyDBL/ST6L0qA4c35BuNtOqebcA37usw6JWPglggRBBzuBYpiB
 yKmE5tctkF1ebafGzWE/9k2vHwscYp0yUO3696kD/vr9ydtS7uqy4hN3EsxChF6t9AsX
 iDcNy137R75WoPBdmNa5BMjgbDpGsMfpNVo8T+cOgAkbkVsbysrC6ufx3Onw0LFrL/ig
 5t1QNPJemdYsQUJwcZv78tyxTxVXPBbzA5f3uadA6aIlaf6Gk2ZVCS6Urke2mtmC+EQF
 LNGbg7xeg9g2JLIb/wp6IHeod4xImoVcSJRmxq9uNSBYYrBU+sQXwG8XZEy366VYOMp7
 0rRw==
X-Gm-Message-State: AFq9FYKA+1W+v1CCN7JkSwVUjTPeqXvDaV56jZQdCHI2jxJpA2CIgoxT
 ylGfAbHDu0F1DX7a9jlDAS95UM2gjxkjGFsqfrNydYa6uz1uV6lXqDbjtr4wYg==
X-Gm-Gg: AYBFou1yguT7YaqAyP4LrAdUqnCi3DHU+95TPDxzNNBI25VVCaFRYJUKHFIFffgNIJE
 9MN6TYDUEOOhON8RgVsw+XcLi1rIzlFtiBE596GtI0XSYhOSkZGmHa8J4TIb53wW7LnCZJIVyYp
 CJDKzZCgOSH33ETTXeUB3iglzWEV7A8mh2Ijc0z3hGiXLgut6Ut9o1Rk7b9Y9zTNS3coEX0wnC4
 OHbS3jKrAWqK/OoKbC3PcvSkdjCwqgWnZRU3kYIuEEwM+lwQqwKbDRaMIhjMXfpqeKIdBoAPns4
 o5QqrZYak/pHGv6Kk6dPR5+KvNcoqrttQ7LlHNobaoXl/qIwOTMsAunsaRYJjJEjFkonqVZxj7m
 u0xT0ZbpxXP2klr7OYlVl4VnH4DIOFHDPv9WBtqDqvRtMKT7pQQbRGsJx0Vm96HLF0LkUtyPvE0
 ljU77y+1R7o7m1jWgla65EH+p5jzo6IsYqUweBaqCVpp7JIyGsJ94Fi+ttDBwAel7LJfQxOHcX+
 UEAVBqdy9mILA1kNFmphvxSDX4OSnzUp5BAkxTuHWyM0z9fl14E7Hh6py7tyHsUswpUL9cuQowq
 I66lpWm0GMPWfxY+fJKXpE4rjQLh3MvO33ae6CjZUDyu+SlQXRuYwihRL9kpZJfp23dopAp+AUa
 NoDp2XDkc5t3BDiGUQ7HnxE4EAlRNMJ+GtIug2Ye8icA=
X-Received: by 2002:a05:6820:603:b0:6f5:f68f:3fe0 with SMTP id
 006d021491bc7-6f5f69eb07emr4653645eaf.4.1791909811851; 
 Tue, 13 Oct 2026 09:43:31 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a6df881fbfsm200254fac.2.2026.10.13.09.43.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 09:43:31 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 10:42:09 -0600
Message-ID: <20261013164254.1476592-23-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-pycares: bump to version 5.1.0
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
 package/python-pycares/python-pycares.hash | 4 ++--
 package/python-pycares/python-pycares.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pycares/python-pycares.hash b/package/python-pycares/python-pycares.hash
index 321434e299..f3d592a90e 100644
--- a/package/python-pycares/python-pycares.hash
+++ b/package/python-pycares/python-pycares.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pycares/json
-md5  36560432e7ebf6e9746080ca2ca7cf0f  pycares-5.0.1.tar.gz
-sha256  5a3c249c830432631439815f9a818463416f2a8cbdb1e988e78757de9ae75081  pycares-5.0.1.tar.gz
+md5  32f250031005a3bd9a4e1a8e39488f2f  pycares-5.1.0.tar.gz
+sha256  4ae0712df072773a3193b23f124d9458d6b2054a22c9ea0059c9dff6b8f91050  pycares-5.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  427bb3a5372024a26e2c290b24382512bcc7ca123431c4dd178dd613beea7eee  LICENSE
diff --git a/package/python-pycares/python-pycares.mk b/package/python-pycares/python-pycares.mk
index cb645e60f0..2b8d2955fe 100644
--- a/package/python-pycares/python-pycares.mk
+++ b/package/python-pycares/python-pycares.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCARES_VERSION = 5.0.1
+PYTHON_PYCARES_VERSION = 5.1.0
 PYTHON_PYCARES_SOURCE = pycares-$(PYTHON_PYCARES_VERSION).tar.gz
-PYTHON_PYCARES_SITE = https://files.pythonhosted.org/packages/df/a0/9c823651872e6a0face3f0311de2a40c8bbcb9c8dcb15680bd019ac56ac7
+PYTHON_PYCARES_SITE = https://files.pythonhosted.org/packages/3f/b9/8f8389df1dfe3c9f6b5b02cfab60781685d146bee529e7628b77a1df7e9c
 PYTHON_PYCARES_SETUP_TYPE = setuptools
 PYTHON_PYCARES_LICENSE = MIT
 PYTHON_PYCARES_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
