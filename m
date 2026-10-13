Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 740E4CC6B1A
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 17:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 373D960745;
	Tue, 13 Oct 2026 17:51:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Lt88RYNf5OL; Tue, 13 Oct 2026 17:51:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5B1E460797
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791913915;
	b=OJITTQkm+TtApJ+zAJ5/1vnKiibfojHU7D/izHQbze5JuZFmBOa8q/z5UAIRgXqriRKB
	 FX13xFXOV1+YgExgLfuxfnaViaeYLSc6T0F0m1+Hr1URY4Ei2HZWvaMMEpOjXQVXxgGZ8
	 GeYsG2YGuQvnJmeQ02A+PPcr3HiVPKm0azCr0UJivbMw1aJnhy6o6vP4X8eI5EQT6NJDm
	 r/vT/8gFdRq8z2YarZeuxbR+GqGy2DI9UDvjg1LxQDmO3pU0N2MEO+WhZo9GpoB9imRWL
	 PVQGw7Fib1Gc0jM0rHv7hP6nPxzNuikxWsnF2nOyAy8c5HTqNU/vjLT82KE6NyaKiNg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791913915;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=LfvtP8XPmflJ7mktnGwbw9yUElO/mnd83fkQ2Z4yt70=;
	b=NNSn7Ljo3AlI17Yi4rxs+Z4PBpsxZ9dHzr43va+EscdJ9lQR2dzITW+1naQLJVyahZDS
	 HO6oWxKmm/V61uojXEt6BmduP+Wg4/nE7rEzcIQdkDylDSvaj/FqauYE+RIwhJry5XYKu
	 kbkc06i0WiuJHES4Tz4IxMEMozdJEf9gjv/b93+nY6mJUWVQkbEpwyZILKp6JyPkPdpIY
	 OiarppQxwjYS4AguVuhopP2jmlOPUP48DtX8LGqeLvMxwLqsZHssnKsrJDhqbKlYty9zN
	 vz64JoVjQ8cYnadIfnEzjokXDRqZgaK7K/KvRCEeCuf8G6aMBRWJsWyQRSAypdjP93A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HMAuAIAK;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791913915;
	bh=LfvtP8XPmflJ7mktnGwbw9yUElO/mnd83fkQ2Z4yt70=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=MBxiR3CfCi+bN0dLQy+XtkbeQABDqGjtoDXtGlYR2Q+S3potU9yQFMLWW/L0nPoKl
	 YTfnkg0PKe1qfPeOZpo04HHCV+Vm5E032GKhPiTVVQIhq6lnqxKbOG4CeDiNkwuPLT
	 lT9Dh+9ynbbg66aEG/WLgf7dfEGv3dRjFO1a1bU+37o505pgY92oGBbEytEY1K43Km
	 RinPdVtz6qYOGN8ntcS3/gV2uyiUhBW9wNiLP+wDMmpKP8qAIr2jcveN2DOhGRYwhI
	 uE0+pqW8HSolkbYvINsolR0vjfPJxJm5VnhM7NElCgEk9ZzLiJzCawoghGmnAnCeeo
	 eI6k3kh5TQICw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B1E460797;
	Tue, 13 Oct 2026 17:51:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B7191362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A8716607CD
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:51:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 21jkfWGEMmIT for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 17:51:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A36EA60705
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::234"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791913909;
 b=LjunQ1/wSiqmTfy7SnRTlvl+h7/3gGINKGh1DD8W3qIYJUpQFVNmFouYbn6yESBope9t
 /14XitCR5DxIpluuK7YKSg1LQtTuRDXGTScV2ERRwTXkkZBXKRw6Zt5Ij8JmtGPTIJzNL
 J2WEXWEON+s9IWO64AVLEydsUNWG3wWZA9OOu98p0PNPIixy0ATz1ua/C7gBB0WoxXFKb
 c5lJ85B8hhmGkm9Cw6EprxiH0G/ae1VtgG/BAdRmdTYGur/mkygn7EfhtNt7DV++47V6G
 f+SO7L+BOsO7+0pFuxICP6UyMIfL9fFEClU7kzldqYO4ll1UVnWEQXuJ7u9PrIqgNpA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791913909;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=HVF9uSYLo6StyxajVf8TH6CEl124fdlwTgX6yIcIlWM=;
 b=jQ31LmqVc0KadrRkXZGX/rrqcBpmqAXy9Ne6+c7l8Vt95Yem4F0WnfZtOVTJeFBGqFmO
 ZI3jSqJA/AzGgkk3XpWId4Kw73UPCFny14vHrtdzCs8JKhzteR28f9wREHUZhlyi6mPLY
 mgspKKqA3DrXPTg9NZpa2DTMyaZfoszR3cN9857Q0+2ZzvT7+9sdHqeA9NNW5p2fxCbuk
 2Lk9EatJ1WEKxXh/5V7Q27YlQ+Fqig+laYK/vt22EnMhD2dK5FJCZGSmpOkcC57fe+bg8
 QcBtbBLsOSuSsokn+CHnpeSXef3ykE6MCO1ybKEXDwpMtuqDcm2hFf9zycFp+NnU7YQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=HMAuAIAK; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::234"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::234; helo=mail-oi1-x234.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=HMAuAIAK
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A36EA60705
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:51:48 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-4b28d9537bcso2335587b6e.0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 10:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791913907; x=1792518707; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=HVF9uSYLo6StyxajVf8TH6CEl124fdlwTgX6yIcIlWM=;
 b=HMAuAIAKtMNlgSTh70svuvEWPSx8q8C51lxHB/7FJgSGQeUsSrcRBrtdjVpUN1qPEO
 dSoCI7XD1Y4SvWPK6lbNBYBVyR8gCDn188ZvkiBXCzXAD9HMNnZBaWz3jX6xje71toAv
 wMe8TVvChbZ32GFX4CIx/iO9xeV/j5XsnGN1ZmcWJwhgUpOMmrO6o+fYIHy03TwcHPrz
 F13/3ccHl1ksZTrIMT/SkSpgoDre6bCO7/VSN6JyQENAIDRnE2iHNVfgHvInLijabMGQ
 H+5NSD5kV200Wrp4JKBE7poQplPu6CpkqZSQpD3gci3+vqs8RFX6TlXlH7iDN7P7IQRR
 vm8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791913907; x=1792518707;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=HVF9uSYLo6StyxajVf8TH6CEl124fdlwTgX6yIcIlWM=;
 b=TjvlMu3A8ZqLfFmembBAqNFGBab994SCiA5wfK2ezHkvqKx3C+I2KCv5cHUnebHZZT
 pGFZCjl7o3y21lcGwu0ArlkkkoZYbJDMSbK24rPu8x1XMdBPXYovhSm6atpAUs5G7wMz
 qChZ70DHx2Rhjm4/hBdTw+fvxP0s3cmU1nYuiqRryT8KMJl8x75tdMqqO/mfDeXxUFZd
 FBeJFD3CV2jpy/HcyZvLWWZcxnwtO22HlvK9hG7IdK+qovjqYrDgRmQCaE9pfyHQOAsk
 cSatXJMirLP/GsYPddWANQIC20DP3E4EFfMdoX5QiDb90iXzWhQm33uON7w18rXAxc+8
 c/fg==
X-Gm-Message-State: AFq9FYK5w45mEsewhBmz8Pmpj3hSmcrT92qjMNLN+IZa7GGgfG2nMHt8
 dCe22XrAOcHdrsJgNDFZHxZ8Lx9+Igt/cfOmx68qprL0nNOr43UwTXUgQKkybZ/D
X-Gm-Gg: AYBFou2C3fRu6rWBsabGVF8T3JFzPknOKJfJZfXsoHM2F2Lsg3HIpqScwm6unT2b8mV
 yVv0QIWWhOHBwhuooYBOGRfYSbELiGaODvoJ58fcylvD2Yr1HTtR6fevzwyiJyv/2dIOlGkrgjF
 XkukPV4GedlxtwzUWCaGvcWrIdsPX/WrEgUiG2wTPB6GSSkv1A40ODWKZOWW1msUMTKD5V2D2lC
 hAsWUClQHC0d+16cVlGKBSGCeqjfvk5rPxM6HtMCIdgmNP9Hyk8qxlZmiPS6f2zBuiMleSAfs+L
 SOQanywk38lNvh6tfVVdZTBGBAH6oUTdZY4PnA/tS4m7JJ9UNZBSU/oh9vKP1BkeCZSMcaBytJC
 3Hydzo3KR97XoBNmUcvUsLAsFel6at9RZdCfJVGdYgwyrrpv/RdH6nxxz0BSqef0NiQooP0SX7g
 PZPdHlahcqDToupOeghfAmpIb8m267E9c6TSK8rTHxX6g+lq37aD54+LvA07VawzdvdGXQugUob
 VlIgSRg2X4asiAzFMrF8jNS0RIDWN+VrAWM80018447D9m52p0QNTe5g56D5RKH+0th/RPrc9jq
 id5JR0TjwdSOl+2fCQaEb8c9EDww9j1KaEOldkkETf8P666rscBgLcH1Z3fDl1dINPST6HmVpjo
 oIxPiHEol6YatLBmzHP+NnLAltOcWWGWqgksQuanE2czP
X-Received: by 2002:a05:6808:4c09:b0:50d:26fc:e6d3 with SMTP id
 5614622812f47-50d26fd22a5mr8070655b6e.43.1791913907519; 
 Tue, 13 Oct 2026 10:51:47 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-50c1c120686sm15424624b6e.16.2026.10.13.10.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 10:51:46 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 11:51:19 -0600
Message-ID: <20261013175130.1822395-10-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-texttable: bump to version 1.7.1
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
 package/python-texttable/python-texttable.hash | 4 ++--
 package/python-texttable/python-texttable.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-texttable/python-texttable.hash b/package/python-texttable/python-texttable.hash
index 538aa78458..628bf4bea2 100644
--- a/package/python-texttable/python-texttable.hash
+++ b/package/python-texttable/python-texttable.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/texttable/json
-md5  e5d380c04fab132ccf0bbfd4f761bd51  texttable-1.7.0.tar.gz
-sha256  2d2068fb55115807d3ac77a4ca68fa48803e84ebb0ee2340f858107a36522638  texttable-1.7.0.tar.gz
+md5  fb024678d892bd42fec4a3907089d036  texttable-1.7.1.tar.gz
+sha256  ce71fc5928ede6cd7a60dbe3cb2845e6df8f5598fe435252ea1b31722415fda7  texttable-1.7.1.tar.gz
 # Locally computed sha256 checksums
 sha256  4ba7bdab54504a3bc44eb33ecca873a26a63ab902822101a87bb46235da63594  LICENSE
diff --git a/package/python-texttable/python-texttable.mk b/package/python-texttable/python-texttable.mk
index 1e4e7572c9..5bb5b91684 100644
--- a/package/python-texttable/python-texttable.mk
+++ b/package/python-texttable/python-texttable.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TEXTTABLE_VERSION = 1.7.0
+PYTHON_TEXTTABLE_VERSION = 1.7.1
 PYTHON_TEXTTABLE_SOURCE = texttable-$(PYTHON_TEXTTABLE_VERSION).tar.gz
-PYTHON_TEXTTABLE_SITE = https://files.pythonhosted.org/packages/1c/dc/0aff23d6036a4d3bf4f1d8c8204c5c79c4437e25e0ae94ffe4bbb55ee3c2
+PYTHON_TEXTTABLE_SITE = https://files.pythonhosted.org/packages/72/c8/c926b35a849405ae0cb21956f8d7bd5e4f2c277c211784ed7d441df1b807
 PYTHON_TEXTTABLE_SETUP_TYPE = setuptools
 PYTHON_TEXTTABLE_LICENSE = MIT
 PYTHON_TEXTTABLE_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
