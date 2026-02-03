Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFA6E87839
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 14:55:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DE5E605A0;
	Tue,  3 Feb 2026 14:55:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fBVq-hpkw85P; Tue,  3 Feb 2026 14:55:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39A9A6070C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770130502;
	bh=49k9qseE0stql2DCNINP7mce3iZuOxUxThu2Yg7Vsa4=;
	h=From:Date:References:In-Reply-To:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=d0XqbehAt376jaCoqEDZjhS1IoAVWI8UxzQOr/Y9KJW+tNUyBELNI0R8uKQuj4NNi
	 QGUFuQUfpGymJTzo5Wg8y0K97Ig3awaWIW1JTWlgMfi62FJSNNf7MdO17MTp3SDWlL
	 fotwGsvWaU/wQO0Ljnb8PqnyFxn4aB4hpnyyUmS6UPGQOZ2AFZaYPgHmZc5BWyglvM
	 kd53cCBu25CiN7r6Gfz23arZbLCDJn2/TAof+PpP/anORWAu85OrFRxsyU2Gis33In
	 Z2de8Gs/0GJ6wBE5iI4k4OkAT/jz1DfMNO7/TizIJWiZ1fzQrFPTgzvJBbvZxduyAF
	 AILngmeIhiSWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39A9A6070C;
	Tue,  3 Feb 2026 14:55:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D6BFBF5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:55:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5B21401C9
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:55:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DJFnN1prD3-V for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 14:54:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=46.105.56.233;
 helo=8.mo576.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 971F440071
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 971F440071
Received: from 8.mo576.mail-out.ovh.net (8.mo576.mail-out.ovh.net
 [46.105.56.233])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 971F440071
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:54:59 +0000 (UTC)
Received: from director5.ghost.mail-out.ovh.net (unknown [10.109.254.119])
 by mo576.mail-out.ovh.net (Postfix) with ESMTP id 4f55h15YK9z5vLn
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:38:25 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-5twcp (unknown [10.110.101.93])
 by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 75BD5100222;
 Tue,  3 Feb 2026 14:38:25 +0000 (UTC)
Received: from armadeus.com ([37.59.142.98])
 by ghost-submission-7d8d68f679-5twcp with ESMTPSA
 id DBaCFGAIgmkRehQA2wKZ7w:T3
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Tue, 03 Feb 2026 14:38:25 +0000
X-OVh-ClientIp: 90.126.104.208
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Tue, 03 Feb 2026 15:38:13 +0100
MIME-Version: 1.0
Message-Id: <20260203-bump-imx-packages-lf-6-12-49-2-2-0-v1-2-548f3fc77a59@armadeus.com>
References: <20260203-bump-imx-packages-lf-6-12-49-2-2-0-v1-0-548f3fc77a59@armadeus.com>
In-Reply-To: <20260203-bump-imx-packages-lf-6-12-49-2-2-0-v1-0-548f3fc77a59@armadeus.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.3
X-Ovh-Tracer-Id: 603763827643050869
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTGUcoclSxuORx42qrQ/hju/YmU7c0TIdXXXf+O/VQtyEoQH5bwpjhu+nuzRuktn5WwaOPR5ylyy7RpWkJXj/dJWFDvCwtP6c3VV3/IwIXjelch0ySPK12HtPdMt9HOOfa0h8r2CikFT1jUxMMuGHGDa+TCWHmUTGAjHUuf+tYkI/QVV1voooX15zIz5NuKvocz5De/LPXtJfGLetZzYrvn4JtLqh/IMXctSjWVprEV0knHKpnZJmjdaXIJIxe5n0IWf4+IR5SaXe+R05sADHyKMx2eBVivoybZyJaV2lpXp2TK89mDJKof63Qyg/tqlQCniZp3r7lrou5sJGiR/I0KpCtqQlHxArX0rW0PgIl4sd24UmC3sOrNvPQgk11mdWf2YAJgtDh+2Nt97JCSfmhrFvOqmikXBU1pgAqmI8SSxK41modt0p5a9k1wF8VosXyGShU1TT1Dju2ZAfkNJexlIscsqzcavJSf62U+BQxu6Bhk8GGE4WrRfzKCaT9qRKLAZHgB13/XrplyQe8SPfOlvH1QBF6boKhs8D9JdnRr8eIQ3zaSx4Q/63Haxx/o5tYklp5X3p4l4FV+3eXu4itV0c/mM3KukXU4hBU50E5HxUNtSn6uRvK6lJji5GmtwxkmtCkd1UnTwuI8aBSoDSRzrhTD+5EmKAIq9MtWpRvcYkA
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=uOlqvbHEjzNOf8UYbeNF9sSsZ6/czafwhemYk0NBsFA=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1770129505; v=1;
 b=jimGuzqUNbyrDIlVxp9yvO0yHeWUbYIcMAtHMXj16E3G1lkWcud3TbV/Ge3pbB6d54zrQLSR
 +nvNE+PnkMoe09GlaF6fW8cyD3SI1HeEy5BB9RPFFwrps0tJm3WK4UmuuttjwhO6VGAlxVJVPq2
 zQba7w1Jl4tmfFCrWr5YE7NEr5nx9KWvmaB9NeH0rQD6kTmQK6eHfkkuBEzB1VewGOMR6K8w5vy
 zLY0xTP4foanB8hSNebMoXMjQtCrhDMyL7QPP6ZtY+T6hUxO1pGc6vZYDKM3pKDZ2pPBTLkO38V
 QSn/B6zsHrMxUpujzCuVgc7o8NnSh6xShyj6DfIVCFtXg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=jimGuzqU
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-98R0023461e69b-0e35-406c-9a3e-6dfbbf67e05e,
 004BD5E907DC429EAD4B1A0856BA767B03FD8B65)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 2/9] package/freescale-imx/firmware-imx: bump
 version to 8.30
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Erik Larsson <karl.erik.larsson@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyB2ZXJzaW9uIGlzIGFsaWduZWQgd2l0aCBOWFAgTGludXggQlNQIHZlcnNpb24gIkxGNi4x
Mi40OV8yLjIuMCIuCgpMaWNlbnNlIGhhc2hlcyBjaGFuZ2VkIGJlY2F1c2UgdGhlIExBX09QVF9O
WFBfU29mdHdhcmVfTGljZW5zZSBjaGFuZ2VkCmZyb20gInY1OCBOb3ZlbWJlciAyMDI0IiB0byAi
djYzIE1heSAyMDI1Ii4KClNpZ25lZC1vZmYtYnk6IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJh
c3RpZW4uc3p5bWFuc2tpQGFybWFkZXVzLmNvbT4KLS0tCiBwYWNrYWdlL2ZyZWVzY2FsZS1pbXgv
ZmlybXdhcmUtaW14L2Zpcm13YXJlLWlteC5oYXNoIHwgNiArKystLS0KIHBhY2thZ2UvZnJlZXNj
YWxlLWlteC9maXJtd2FyZS1pbXgvZmlybXdhcmUtaW14Lm1rICAgfCA0ICsrLS0KIDIgZmlsZXMg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvZnJlZXNjYWxlLWlteC9maXJtd2FyZS1pbXgvZmlybXdhcmUtaW14Lmhhc2ggYi9wYWNr
YWdlL2ZyZWVzY2FsZS1pbXgvZmlybXdhcmUtaW14L2Zpcm13YXJlLWlteC5oYXNoCmluZGV4IDEz
ZTllMWE4N2JhOS4uN2VjNmQ3YjJjYmY5IDEwMDY0NAotLS0gYS9wYWNrYWdlL2ZyZWVzY2FsZS1p
bXgvZmlybXdhcmUtaW14L2Zpcm13YXJlLWlteC5oYXNoCisrKyBiL3BhY2thZ2UvZnJlZXNjYWxl
LWlteC9maXJtd2FyZS1pbXgvZmlybXdhcmUtaW14Lmhhc2gKQEAgLTEsNSArMSw1IEBACiAjIExv
Y2FsbHkgY2FsY3VsYXRlZAotc2hhMjU2ICA2MWY5MjVlNjA2YWIwMjBiMWEzNmYzZjdmN2U0NTlj
Njg0N2Y1YjlkYmM3OTQyMWY5ZWY4NmU4ZmMxMjRlYjJmICBmaXJtd2FyZS1pbXgtOC4yNy01YWYw
Y2ViLmJpbgotc2hhMjU2ICAzZjRhMTJjODJhODRiZDFjMzU3OGM5Yzk4NmQ2MzcxYTYxZDMzOTk1
MjVlNzYyODhlY2JiYWUwMWRhZjBhZTI2ICBDT1BZSU5HCi1zaGEyNTYgIDM4ZjE0MDhkNmU5MzVj
NTY0ZWZkOTExOWMzMTMyNjllNjQzYzFhODVjYWIxZDkzMGMzYzViZDcwYmMyNjE3NjkgIEVVTEEK
K3NoYTI1NiAgMTU0YjFiNTg5MGRkZWJlNDVjYTI4MDYzNDI2MGE4Y2RhZjM4YWRjNWIzMDNhZWVh
MjhhNWViYWQ1MDRhNzkxMiAgZmlybXdhcmUtaW14LTguMzAtM2ZhODRmZC5iaW4KK3NoYTI1NiAg
MzAwMWNmODQwMThjNWNiMTBkMTgzYTY3OGY2ZWM4YTkyOGM3OTc2MTZiYTA2YjM5OGQ3Y2E5M2Mw
Nzc5YWFhMiAgQ09QWUlORworc2hhMjU2ICBhODI5YjEwOWEwYTQwNmE2YTJmZWMxOTk3NWEzMzJm
ZWNhMjI1MDk4Y2U2NmJmYWIyMjIwYzY2MDhkYjhmY2U1ICBFVUxBCiBzaGEyNTYgIDQwZDAyZjZk
NmI0ZTk0ZDkzMDc1Mjk0MDhmMzcyZjVhOTkwOGNmM2QxNTZlYzUzM2E0ZTU0Mjc0YjQwZjI3MWUg
IFNDUi50eHQKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9maXJtd2FyZS1pbXgv
ZmlybXdhcmUtaW14Lm1rIGIvcGFja2FnZS9mcmVlc2NhbGUtaW14L2Zpcm13YXJlLWlteC9maXJt
d2FyZS1pbXgubWsKaW5kZXggZjhjOWRmMWNjZWU5Li44NjQ1ZjZiOTA3NGUgMTAwNjQ0Ci0tLSBh
L3BhY2thZ2UvZnJlZXNjYWxlLWlteC9maXJtd2FyZS1pbXgvZmlybXdhcmUtaW14Lm1rCisrKyBi
L3BhY2thZ2UvZnJlZXNjYWxlLWlteC9maXJtd2FyZS1pbXgvZmlybXdhcmUtaW14Lm1rCkBAIC00
LDggKzQsOCBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotRklSTVdBUkVfSU1YX1ZF
UlNJT04gPSA4LjI3Ci1GSVJNV0FSRV9JTVhfUkVWSVNJT04gPSA1YWYwY2ViCitGSVJNV0FSRV9J
TVhfVkVSU0lPTiA9IDguMzAKK0ZJUk1XQVJFX0lNWF9SRVZJU0lPTiA9IDNmYTg0ZmQKIEZJUk1X
QVJFX0lNWF9TSVRFID0gJChGUkVFU0NBTEVfSU1YX1NJVEUpCiBGSVJNV0FSRV9JTVhfU09VUkNF
ID0gZmlybXdhcmUtaW14LSQoRklSTVdBUkVfSU1YX1ZFUlNJT04pLSQoRklSTVdBUkVfSU1YX1JF
VklTSU9OKS5iaW4KIAoKLS0gCjIuNTIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
