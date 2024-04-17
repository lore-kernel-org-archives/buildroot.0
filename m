Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C58B6C4345F
	for <buildroot@archiver.kernel.org>; Wed, 17 Apr 2024 21:26:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C69C4021D;
	Wed, 17 Apr 2024 21:26:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TDqtMRSsT3sF; Wed, 17 Apr 2024 21:26:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 388E940569
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 388E940569;
	Wed, 17 Apr 2024 21:26:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A2AD81BF267
 for <buildroot@lists.busybox.net>; Wed, 17 Apr 2024 21:26:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F82D40A6C
 for <buildroot@lists.busybox.net>; Wed, 17 Apr 2024 21:26:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fyhzpHjLpJ4N for <buildroot@lists.busybox.net>;
 Wed, 17 Apr 2024 21:26:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.67.36.66;
 helo=mout02.posteo.de; envelope-from=gero.schwaericke@posteo.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5B0CA40104
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B0CA40104
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5B0CA40104
 for <buildroot@buildroot.org>; Wed, 17 Apr 2024 21:26:48 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout02.posteo.de (Postfix) with ESMTPS id 894D0240104
 for <buildroot@buildroot.org>; Wed, 17 Apr 2024 23:26:46 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4VKYrP5TkHz6tlh;
 Wed, 17 Apr 2024 23:26:45 +0200 (CEST)
From: =?UTF-8?q?Gero=20Schw=C3=A4ricke?= <gero.schwaericke@posteo.de>
To: buildroot@buildroot.org
Date: Wed, 17 Apr 2024 21:23:42 +0000
Message-ID: <20240417212614.963345-1-gero.schwaericke@posteo.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=posteo.de; s=2017; 
 t=1713389206; bh=5yMmmKQ8fjGVhVeUgoTLkcutb9PBpFbn37DjvjmE1a8=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding:From;
 b=ltyvzb1NIT/VyQveH8MDHkIE89g08gqmy4C42TUixylE48U+Qf0R2Z4nFCBk0TNbr
 zZewBYiTu9un4U71fr8TJsmCCHYhyeEnVINtIgOsDJCOe/dk2NnexZVUt/jIIBqulx
 HQrgRJClGtIMlBa2rmisAq9g1skhqKYmUSUTZ8cmTc99HdM14JSEk0pVj//ifNkmU5
 mAbwZn8ejfV57vQrDLXT8hOAqW6BMrukOCmUuw/D5u3tQJOkOHe8DC666lhmd5lg5j
 nEePLFCdBJ5rSoIevCgqdJyY7SNXCoWdUrZuoVSpAiuZGwKAip4sHqpbFGfR8ZYDt1
 NbHNTI0cbTrYQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=posteo.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=posteo.de header.i=@posteo.de header.a=rsa-sha256
 header.s=2017 header.b=ltyvzb1N
Subject: [Buildroot] [PATCH 1/2 v2] package/linux-firmware: RTL_88XX_BT:
 install all binary blobs
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Bernd Kuhls <bernd@kuhls.net>, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 =?UTF-8?q?Gero=20Schw=C3=A4ricke?= <gero.schwaericke@posteo.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VXNlIGdlbmVyaWMgcGF0dGVybiBydGw4OCouYmluIHRvIGluc3RhbGwgYWxsIGJpbmFyeSBibG9i
cy4KClNpZ25lZC1vZmYtYnk6IEdlcm8gU2Nod8Okcmlja2UgPGdlcm8uc2Nod2Flcmlja2VAcG9z
dGVvLmRlPgotLS0KQ2hhbmdlcyB2MSAtPiB2MjoKICAtIGZvcmdvdCB0byBzaWduLW9mZiAoc29y
cnkgZm9yIHRoZSBub2lzZSkKLS0tCiBwYWNrYWdlL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13
YXJlLm1rIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9saW51eC1maXJtd2FyZS9saW51eC1maXJtd2FyZS5t
ayBiL3BhY2thZ2UvbGludXgtZmlybXdhcmUvbGludXgtZmlybXdhcmUubWsKaW5kZXggN2UxZTVj
ZjZmMi4uNDRmYTIyYjIyYyAxMDA2NDQKLS0tIGEvcGFja2FnZS9saW51eC1maXJtd2FyZS9saW51
eC1maXJtd2FyZS5taworKysgYi9wYWNrYWdlL2xpbnV4LWZpcm13YXJlL2xpbnV4LWZpcm13YXJl
Lm1rCkBAIC05MCw3ICs5MCw3IEBAIGVuZGlmCiAjIFJlYWx0ZWsgODh4eCBCbHVldG9vdGgKIGlm
ZXEgKCQoQlIyX1BBQ0tBR0VfTElOVVhfRklSTVdBUkVfUlRMXzg4WFhfQlQpLHkpCiBMSU5VWF9G
SVJNV0FSRV9GSUxFUyArPSBcCi0JcnRsX2J0L3J0bDg4Kl9mdy5iaW4gcnRsX2J0L3J0bDg4Kl9j
b25maWcuYmluCisJcnRsX2J0L3J0bDg4Ki5iaW4KIExJTlVYX0ZJUk1XQVJFX0FMTF9MSUNFTlNF
X0ZJTEVTICs9IExJQ0VOQ0UucnRsd2lmaV9maXJtd2FyZS50eHQKIGVuZGlmCiAKLS0gCjIuNDMu
MgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
