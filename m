Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B747C98324
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:55:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AD7B40B0C;
	Sun, 27 Sep 2026 10:55:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1dyuGVC8W9uA; Sun, 27 Sep 2026 10:55:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3E15C40B1A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790506507;
	b=PZjjLwbF1dOBy5SflGpWwhzd+AgwRe6QIuwIzf4/vxgWDV++Kq1cglt1nenSd3apYGG9
	 1R6kippU364pNQxtwNw92BNZoZMesCsVTWLXhaPLC8/Carfq+tNq/sE6kFt8lL5O6/IVR
	 T/gD8Y+rpi9CmXhyPr2InS12Lecwjm+AHZzd8Lkv4GKG6qQWTzFVJec6GR4cgcP63MQ9R
	 a7Kr2xG2XLXsLeKiBr41tfPd95MptvUibcRTdcDkViEAEPguBaZNj803zkdImWWIgOnTU
	 +Q7LCxC47hTMVu3lbu584rOuS3xCPwZYOzqiznyAdA9kuUCHMXFpUHHG2rgzHf9To7g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790506507;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=PeqDBmhJc2A3az0SecpZF71MlkzI6GC+pzltDKJRPL4=;
	b=fngr5GJDIcwt86JASMW325ww/7BK5XtG9xDb8lXBJ740nd3ekDO8CrxQHOf90T/VRP+c
	 HthomGr9R++4exoCiResG7qEWd30AN+WAQfkrZ/QKLhKAnP6J7evds2H52abBxHWAs6g4
	 EmqylToeBFh314bJq0You9oEqvd2NJGgwEsUkTRWcNKk9sLKlbtQqZ/rnzgIaSBRWE0u9
	 EHxgULJcBmWpHHh8eUSTnFA6r6u0ka1fRgdK52SRyE1Ifl3wATteo3VrHRR/pV16Y+aTV
	 DZZyuXdAZHI7pInoSrLUiPta3QS0BZGuWTEnHQKzmkWgzUCIlk3ZyBAiQNnh4gY/5CQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790506507;
	bh=PeqDBmhJc2A3az0SecpZF71MlkzI6GC+pzltDKJRPL4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=gd5sEIM8+4J8BVQ5sNCP6taDIP0elS0/LQ4lU2mQ8Ea3TZ4jTuJe6ayoyMqhIlxo9
	 T54F+WM+bPw6FDvtQry/jwWy6eveFX/kznvNNDIvCKosCGC5qFgg/hQ0P10vTJcuw1
	 AtOfjYwiLIYhpdyib/z0iclx/BH7o3AqMEJ4Gfv00qCiY08L2SxjRqPxT6asM/GWAl
	 ZqQt58QxhR3ocYRL8mDsvbDz7/C/ltbTIBuUqSKKI4flrEdhEQxsZfMs+xSS/lstjA
	 IjL3PlPAwttNkPwGZyeLLHfJtojtemE+lY3BrxJi/kE0UEJJseuAFZg8uH/bDO+Tpg
	 fJWVPu4aIWneg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E15C40B1A;
	Sun, 27 Sep 2026 10:55:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 699AA335
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:55:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F5C86068B
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:55:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 03xQLyyaz-Qh for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:55:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C5F9A60685
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790506504;
 b=GKUl8PosdeHRPInvhXQYbBE13XUpI9fJ3uriS/kOdMjrUfsfFMBjJa4rq8Rxnuy4fZf0
 d3Nu+PyDSb991sw601F2LnK8gKfG4Sr7jNVn3PyOPcS/fpz9B8Ud6WJGSQzGyG/7QR1E3
 aQrQbZgLP6cIwjW1xLewpLYkynBb0x5VaB1aXUJvSm82AYECbnO2JC6vgClIOCrtn6RuT
 bSRJE6rOszG1FQmvoUkF8YARuh8BxWbMMFyfHdVh2V9YtrlyNg7AmUp+09RXylfNtDYtL
 870sS7joHtIgap1pIXRkKwFe4i9k/F4J8vs7tklv3fQqRAm3n9uI1fX+tJX15ZpoNjA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790506504;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=cym8RRhSwvDZxQAXzHSuynuMOEOPoHuZiAINFnex+GA=;
 b=jOEqW55YNjflnln8cZNWygSnLzaLJhxP/9AF5CtPgAgv5Y5PXf8WXVgl3wBRutS6BsQI
 hOqRjgsELJGE9k1RwO1epn01OPIklM6dMGUVegU6doCe8daJrjoNKZjBjOiGlEyZviSKs
 TBtMu+liMIK85PtUO8U6e7MilmkWAcpnE2gQ4Ze+Cgz/a0vSABAHzUcG2rHYakCvnTH+o
 Aw6/EPnro615y3iP6oQXUyEbCqOgXV98evY9/YBcNGmlrL2Y+gt3uqEOemh9rtevdOLMD
 K2pTaygci2WmlK5qQqhESJ/3bRTNfgKpJVLqWUrn33SElZoz/KKEKgT1EPYQOn+DBXA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=e7R9mSkt; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=e7R9mSkt
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C5F9A60685
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505858;
 bh=cym8RRhSwvDZxQAXzHSuynuMOEOPoHuZiAINFnex+GA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=e7R9mSktPCsic1eZ26+QZuFjM/wDERJyW/AYL2Fws225SjLbWOlsCVUzjgZZD4gWm
 ux6T79zErX+jABXcrWTCnMIp13g17jBirplPRZbV6sh95yen7TiWNNYWdMV1tBERcO
 kOFdBI0wzcHZsGRvA9yl7+1nYSPX64E7EdwzIm4eWgDyeRJR7wX8Fe1Lgx8EAAB77l
 vH2MWEMVQSZuPtDvsVb5NtvP6L+EYvBKjGucAnotGf9aGdaN98LPFK6qNC1Wu9lZRW
 dtyY/QVMkKyVLri5Sm9b8YBa9H0rwQ62BH4S5ZeqqC80f8g1kAG/2QmQcl631D4Bhf
 IyRWjPjfMpW6Q==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 APY5REle9AOK9VqkCQLFr8TqdICA8NHn+e/jzOidLiuxFrNIrEER1wL0+ZEz4QZZJKzETV6uOuB
 CjTpFjWE4XgKRHoLOdXu/zQqlT5BILZArZOE0LnK8RAvQ/KTGbSgnj1kDK/5Lh6wSTB3l2YeR0+
 q4RkDwd2eVNI3aa+cLa6eQK4k0LN7cgYM5bME74vOTlF8YYKa+eESuIhhlEFQzPB6izyN8cnSh5
 3WQddBzwaofAWuMEJHr1L8rFjilS8Gq6n87iYjOjsd7QiMpFAST2HzHbX8OiDdinlrrtUHPHsKy
 5djPaEdRTqB6AHQ6IMqqt1yQjEXiYC3aTctJS6oz+VeMRImkmpIUFrLg2+1f2Es47bfiWC8PTG5
 t7txri5Eax+MKl+cjvg8qZQbrBjihPxI6zeI3TtGX3MzwTB+TFTgvKmRK+FFkYlC7O0iKjWRpik
 Q3A296SB2qKOlCG+yMwGzw28ptsTTmFeSW8D+q7l3YHFavgXFPOpVDrUndr6TuqOhWGA4NOJbMh
 R3V2Q6ny9zhg+9wanwqnlAI87YljAyarMgymlifOd1t3qiHV5ipch6YFvtgf5Gt0C2lywKUVTk6
 KRdxUhD1GupBPwNDTGllqDhjbJG1E56VsTkVQ/zqeK55jjh71NR8I5orKFtXITMHSfiHJUCmlys
 CHbWqCaF+ajgYzkICgvku0cP1g+hHFYQYWTpE0UZc3C8x5hqL/yPRO0Pz/77GkQ==
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 54FFEA4C4FAF;
 Sun, 27 Sep 2026 12:44:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLb-0000000007a-1Pmb;
 Sun, 27 Sep 2026 10:43:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:42:08 +0200
Message-ID: <20260927104301.1801638-31-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v6 30/82] package/resiprocate: security bump
 version to 1.14.0
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
Cc: Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Sen Hastings <sen@hastings.org>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/resiprocate/resiprocate/releases/tag/resiprocate-1.14.0

Fixes the following security problems:

Use CSPRNG for security-sensitive SIP/STUN/TURN tokens (CWE-338)
    Use crypto RNG when generating certificates and nonce
    Use crypto RNG to generate various IDs that are supposed to be unique
    Improve transaction ID uniqueness
Authenticate STUN Binding responses (CWE-345)
Add Digest Authentication Support for SHA256 and SHA512/256 algorithms
Add new DigestStream class, capable of MD5, SHA1, SHA256, SHA512 and SHA512/256 hash algorithms
TLS handshake fixes
    Avoid using undefined client verification mode in TLS connection
    Disable TLS compression by default
    Correct TLS logging
Allow applications to get TLS connection/handshake errors
Propagate SSL Certificate Validation errors to ConnectionTerminated event/message
Cleanup SecurityAttributes
WinSecurity: expand constructors to allow setting of defaultPrivateKeyPassPhrase and DHParamsFilename
WinSecurity: perform normal preload process so that domain certificates can be loaded

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/resiprocate/resiprocate.hash | 2 +-
 package/resiprocate/resiprocate.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/resiprocate/resiprocate.hash b/package/resiprocate/resiprocate.hash
index 93a7131141..be09ac4624 100644
--- a/package/resiprocate/resiprocate.hash
+++ b/package/resiprocate/resiprocate.hash
@@ -1,3 +1,3 @@
 # Locally Computed
-sha256  059fda8f63c456fd61130d468a67655cfeafb5ba8ff5c1d0a55dc383f83e4fba  resiprocate-1.13.2.tar.gz
+sha256  f132e4d0fcae0c155f91e5dad608a9985e199e4e3c09b6029a70b1b3b6d0b156  resiprocate-1.14.0.tar.gz
 sha256  8c93f7d6085486e9d24b7c6f9c662d92e0b65571003ad15d0827bb99fd924261  LICENSE.md
diff --git a/package/resiprocate/resiprocate.mk b/package/resiprocate/resiprocate.mk
index ab8299302a..4af7bb7e76 100644
--- a/package/resiprocate/resiprocate.mk
+++ b/package/resiprocate/resiprocate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RESIPROCATE_VERSION = 1.13.2
+RESIPROCATE_VERSION = 1.14.0
 RESIPROCATE_SITE = $(call github,resiprocate,resiprocate,resiprocate-$(RESIPROCATE_VERSION))
 RESIPROCATE_LICENSE = VSL-1.0, BSD-3-Clause
 RESIPROCATE_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
