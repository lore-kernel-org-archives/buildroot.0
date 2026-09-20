Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D779C982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4702640D9B;
	Sun, 20 Sep 2026 14:46:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pTGWOrYXwtqS; Sun, 20 Sep 2026 14:46:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 37E1B40E43
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789915593;
	b=kL+ZSjbuOkSRX5nKSXOTaU5Crb8ryLSQGwNX1SdZCXKbIhtywIF0oLUlkW+5WhguH/Nd
	 aJptrllbMZWshHxiPBisdU7q8fKKVb/mr/pFSics2qGaojcxdN02xYzN0Pg5KgBUskamD
	 Lsr8QmvNn6Fg0jzxw6uQ2MpVOaHidWheBNoPXj8jN20ZP6KTEFc3VrH/LPX3C1afNCrKS
	 vJZ8AEUCuV8WlJXVuMD94hAkiVtiBqeHO4l9II56sQKyirMQfFNfjKz9Ke43H9j0CP+6i
	 jIW4l5Ew6N54nvmNHYYtL7wb9TTDGwc+UpB4nOVAlndQTbMZDv2HO2Isqhrr1FEhu9A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789915593;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9hjy+p8U0hlDKo3iLgbga+U4tKr8QhzFlTZcwP3lcWU=;
	b=OKVvoALKbDVpVfrN9JZVZNDjTdbXcrIJmmgkg2+RE94abVOmfK6BgRGy3gTeKesZcckp
	 kVA/IgmtTES+NYSk0FuHIJjaf3aiT3gsHyfRr2KkhWvE9rtLDBMnZ7lPUehbAneWaYrrr
	 JmUt3Eo/sidiBx4TKPODvJWZvWvRZSMlSzLjhiEEvXV6Mew96WynPZ5Dj3/QJlw4PgMpy
	 Gb4FC3n08WsV4anNMh1ayaAmXz8db4vVxSuuubcr5uSLb+SeE+nQHGPvABxGcZDm4fR9S
	 XsDbxdXs/XlxosgQ2kiEK0vEP3PcaH/5J7oUAxipZ2nawW+0Tyu8wLsnSKqY9FBchaA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789915593;
	bh=9hjy+p8U0hlDKo3iLgbga+U4tKr8QhzFlTZcwP3lcWU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JstJ3dyjBfzOU/DDAbzZ8bW9ofl8d0FLSy5EhyivTejkZYuwS8rbUh5FGqvvsYBMO
	 lsyqKs4m48CfxVjEojA8jN5/F3a8RrGncbdnKR8naT3lyNTQ9hSYRBovj0VHa0gDE2
	 Ndf5+FZFLifO8MiGmh2N2Wb+mWHcN6o6a2oeTA46BDqP8Tp3Y0IHOQQNyQBonpKOak
	 YtA42uQEEldgQ9mPHf4YfFTa0q2rpxLl26VAObukF2WR4ffVlBh3cErSLq4ZnBvWKR
	 KFHW/k4Qs0rzXQWrER6lxtSz3JS/ufsQJZsy5Xy5acoEvt6vr0M7ODWLU9IJX1G+N9
	 0zKE+bGHS5TGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37E1B40E43;
	Sun, 20 Sep 2026 14:46:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 89C733FA
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63E8B60706
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:46:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n4Fp7Hd9ww8f for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:46:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E64A7606E8
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789915589;
 b=CNfHbNEtBFjLFNae+nT5cXH69/TRhI2LFWyn2+R+usWiN1WYuf/FxqLWBou0rd+9rQT6
 5fdYenAaGuNqWYGcEJQmwDjwr5Q5OZNzcnj3/aKaEYcR9eJiAOWipFJ6Q1WHkpLWQGRbw
 1PbZJ0HVQud4cOUt7CUa2PPuNuhIcJxiErDoqnpJHSxHEB8Rq4uCusctpmXOcOmR5X4FQ
 NV62Egevna0Ebj+xVxQeAYUHf/9/D95ezrTGc9/7nd54leHiYG6YmIrZ1BKnrWiONH4Xi
 D7PJve7/qYbmWxWL9VHb2cA8+Z9FX+fsm7y/0oFhs/8W/yCOE5Q7Uv/qMn/SYXy9Nzw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789915589;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=Ci4+qhLuaJZBZSAe0ZUDK3prlEwSXUALeXMzD6T+wDA=;
 b=BrqxoXwApdzsU048TIF7QeHa+4j96l4x576saWVvy4dn0ufZcT4yv3LjyzgY52MNLuae
 rUoJzNBoqs6S/SvdA05QN+ACzpD5PMOZSo5fOC/vSsadlssSapeGt10wEjUU91xp23cD4
 SnhMLnBTB/SUaTs1ObShdH1zQiN8oseU1WneM41JsNKxJC9IEuxiMz69Cj/2MLmETIzq1
 R3sarLNBN70zEbOrtl2b0hQ/Zud9Nzr1Z6i5uzYhu30wx8gU+NtoDsfRWXmcaQynZcssL
 82m984uZfKuRPkNWvawsPMs1nemEKAjLVIntb5ZQQ96JJDGAFGImMPIrfw3tSSRx4lg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=K+LAnixq; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=K+LAnixq
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E64A7606E8
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789915484;
 bh=Ci4+qhLuaJZBZSAe0ZUDK3prlEwSXUALeXMzD6T+wDA=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=K+LAnixqJfcLk79ZajEvgMUbkKpzoeghlHN5hgEaEMhHXegxoNxa2JgazcXytW3r3
 /v9uJa471ATCAdso1AwrabGYnuabsfcyEt0YkyHbXmiqEu2HBDHAl7b7tR6EjA0oOr
 4kirvscp/h1ylgwLNEc3bs1OZfadI7DhRYd7shqI0OfYD68T01hfd3ggBi42mKjs0S
 62SbdKDletJMHgYePba3mJzr1XttXJVBXSSdnmBRihiJpdJB0Tgy1AExKRSpGCZVnp
 DcS0YVVJ6dgFtKAgrVsS6ilj1jlVH0jCjdSqCdxafOON8ZumkW+9hneR/Kk0Ux5McA
 75qXO+GdTvokA==
X-KAS-Sym: v3:f51bdf72230551df:f9NnCreHs9kSnbMHh6AQdUFyi4vT0ysTuSfFuAQb1+Gxoi8Jfz3lO+KrB2DeTBKeXjT0lwPd2ophCA3F+v+GZvhFlIBU+QKhu+ybVOfg3EHT3MlcRpRvQktOsgJhRsIPALxvYyBhhxNnYCE6obl1o50gAonnv157yLjz1DqCWN47h7t3uGG6haE/+QCl6peUI/vdtKUEOPguOHtIjeLQw2ZSvs9SigPQ0ly22rWdnqQfFx4YWvu/1HbcD6LUsBe0xcLvKWC7ZgeG69JhrpeXORhdzb1VUBZOYiQJc18uAWs2B+mptoIqbEFj6Yl1D0sZ4aKGuMvi+V1/RbjqRW8wdA==:3QR9ygAwkrFHAP3bYf+a36P59us+dnX2/V1nb2BD/bCgeBUVT2OjlIujmFdaaubCmhNfisgyuyfJo7uRFNW5sEYyHlFh79YYgGIFuwZ2ezUH+46qvxJrgpZfSHDltTImK6OLKYLOOzmPfxYPfmiShEZaK4yVyNBJnjH44a+iL5Nx0/TJ3K4/UPjgb0ti0n0rPEIOFboTTIKS17S0K3iVfFbNnyaUeyhIfy/CFCGI6R+yO3skH/Pq+W9daCosOIokpNvQLqiUU1TIkcRg9wz5Ko8pxeakm193xXOsNFsGQRWsNx0+Oi5+RHVZEH+g7HwqUVy1hTSTb5wdPTR9l1+rPRO767ILrpqvRtc9W4pq94O/LUVZJt20ij9qWHG2AapQ/nSjnpoN/cGaMZwZqYvjC2pJV3v4+yOD12OqLVhzxDjONSZCyvx9KzvEXfwVBA5JZNjoqDwakmz+/KfaRyjqEa/65U30vRi8wOdea6SZTLNKUPF3xqKtOsvhcMWYn8OUFX6IWuTwitDAu8sbx5g+WA3Mzi75IStXxXVU2pEaMLqrafZxFJgBkH8A+AFytQ5bs2g7H6rX4+xkDCDPoY2x10EJ3kVK0eI=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 60FBEA4C485A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 16:44:44 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47000)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8Ima-000000000hB-0W3u
 for buildroot@buildroot.org; Sun, 20 Sep 2026 14:44:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:43:32 +0200
Message-ID: <20260920144428.3009612-12-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920144428.3009612-1-bernd@kuhls.net>
References: <20260920144428.3009612-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v4 11/66] package/nmap: bump version to 7.991
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

Added patch to fix build error introduced by upstream commit
https://github.com/nmap/nmap/commit/a24082eee41fcabf7fa180020e1771af3226b358
which was first added to this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...if-compiling-without-Lua-support.-Cl.patch | 29 +++++++++++++++++++
 package/nmap/nmap.hash                        |  6 ++--
 package/nmap/nmap.mk                          |  2 +-
 3 files changed, 33 insertions(+), 4 deletions(-)
 create mode 100644 package/nmap/0002-Do-not-call-NSE-if-compiling-without-Lua-support.-Cl.patch

diff --git a/package/nmap/0002-Do-not-call-NSE-if-compiling-without-Lua-support.-Cl.patch b/package/nmap/0002-Do-not-call-NSE-if-compiling-without-Lua-support.-Cl.patch
new file mode 100644
index 0000000000..54cafdafbc
--- /dev/null
+++ b/package/nmap/0002-Do-not-call-NSE-if-compiling-without-Lua-support.-Cl.patch
@@ -0,0 +1,29 @@
+From 4c36cf12f246b52a8d510bdde8becd5c5b3bf8b5 Mon Sep 17 00:00:00 2001
+From: nnposter <nnposter@e0a8ed71-7df4-0310-8962-fdc924857419>
+Date: Wed, 12 Aug 2026 19:29:05 +0000
+Subject: [PATCH] Do not call NSE if compiling without Lua support. Close #3434
+
+Upstream: https://github.com/nmap/nmap/commit/4c36cf12f246b52a8d510bdde8becd5c5b3bf8b5
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ nmap.cc | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/nmap.cc b/nmap.cc
+index b94c71223..70206daed 100644
+--- a/nmap.cc
++++ b/nmap.cc
+@@ -1858,7 +1858,9 @@ void nmap_free_mem() {
+   AllProbes::service_scan_free();
+   traceroute_hop_cache_clear();
+   nsock_set_default_engine(NULL);
++#ifndef NOLUA
+   close_nse();
++#endif
+ }
+ 
+ int nmap_main(int argc, char *argv[]) {
+-- 
+2.47.3
+
diff --git a/package/nmap/nmap.hash b/package/nmap/nmap.hash
index 17f9eb7f5e..bbdb81ec4f 100644
--- a/package/nmap/nmap.hash
+++ b/package/nmap/nmap.hash
@@ -1,6 +1,6 @@
-# From https://nmap.org/dist/sigs/nmap-7.99.tar.bz2.digest.txt (lowercase)
-sha256  df512492ffd108e53a27a06f26d8635bbe89e0e569455dc8ffef058c035d51b2  nmap-7.99.tar.bz2
-sha512  9ff69659b76573eb10b6e472a0217032fd5fed20f0ac971b3736a4222fb6251c5fbf381ebea7ede313b8ff2feac90a848f645000c61200772d01b843594f4ba4  nmap-7.99.tar.bz2
+# From https://nmap.org/dist/sigs/nmap-7.991.tar.bz2.digest.txt (lowercase)
+sha256  a5d507f29437bef3bedd4771ff9aaa8fc1c2a109ddba1f5b1cf12027456929be  nmap-7.991.tar.bz2
+sha512  d87836eedd453f4f5e55075b50640a6ad61cb5dbc1f887dbaf725fa8c32b6a472d838d174c68a2efa749b3b028512d2f0467aea0ff0b5f5752df714db62f8320  nmap-7.991.tar.bz2
 
 # Locally calculated
 sha256  9d9a9a763c0e6145172cfe7d8483e23b38ce60b6c79a82e4894242917bdae6d3  LICENSE
diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index b04d8b080d..0dd96d2b95 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NMAP_VERSION = 7.99
+NMAP_VERSION = 7.991
 NMAP_SITE = https://nmap.org/dist
 NMAP_SOURCE = nmap-$(NMAP_VERSION).tar.bz2
 NMAP_DEPENDENCIES = liblinear libpcap
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
