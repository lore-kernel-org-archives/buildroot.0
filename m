Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66763E87839
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 14:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F05580DBC;
	Tue,  3 Feb 2026 14:45:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c_cLtf_YRLCr; Tue,  3 Feb 2026 14:45:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D5B180DEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770129941;
	bh=ZChu8Exel4TWXiqL87k9ecvh5dAkhInM8loQ6nzrWGA=;
	h=From:Date:References:In-Reply-To:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ewIoI95iBZaNlH1J/sbzdlKgVLNmlAznrw879pz9bofBi2lQvyfpj6wfUXrevSFGd
	 peSC80+0kqoEZWjPG9kGhRLPClHJmDJwQCgts3+V25YwKPTD9AOeRDBEkoP3U4fRnN
	 EetNgZBZ1/9Ahmoi6rBEZQlSUZ3XYDu++PKvDu3iGMisiEaoYpEl4/P4B0m+ekwYHB
	 iGIpFEIbkR5C1QlmZjWEak8TzmZpQhdQ2RR46D4DVuuY1sy3URVWw+00BCUizXTDe2
	 EIKIVEciR/QOnJprPomKYYYgvZWWEOz2JqGsWTCFbvZutekWjXhDYvH5mNASGHZg4F
	 og3GfF/NiKBJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D5B180DEA;
	Tue,  3 Feb 2026 14:45:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B16313D
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6BAE140AFF
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:45:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z59yUG99irp8 for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 14:45:38 +0000 (UTC)
X-Greylist: delayed 358 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 03 Feb 2026 14:45:37 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F3D7440AB9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3D7440AB9
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=46.105.63.100;
 helo=6.mo575.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 6.mo575.mail-out.ovh.net (6.mo575.mail-out.ovh.net
 [46.105.63.100])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F3D7440AB9
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:45:37 +0000 (UTC)
Received: from director5.ghost.mail-out.ovh.net (unknown [10.110.58.221])
 by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4f55h128fzz60PS
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:38:25 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-5twcp (unknown [10.110.101.93])
 by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id E800C10017C;
 Tue,  3 Feb 2026 14:38:24 +0000 (UTC)
Received: from armadeus.com ([37.59.142.98])
 by ghost-submission-7d8d68f679-5twcp with ESMTPSA
 id DBaCFGAIgmkRehQA2wKZ7w:T2
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Tue, 03 Feb 2026 14:38:24 +0000
X-OVh-ClientIp: 90.126.104.208
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Tue, 03 Feb 2026 15:38:12 +0100
MIME-Version: 1.0
Message-Id: <20260203-bump-imx-packages-lf-6-12-49-2-2-0-v1-1-548f3fc77a59@armadeus.com>
References: <20260203-bump-imx-packages-lf-6-12-49-2-2-0-v1-0-548f3fc77a59@armadeus.com>
In-Reply-To: <20260203-bump-imx-packages-lf-6-12-49-2-2-0-v1-0-548f3fc77a59@armadeus.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.3
X-Ovh-Tracer-Id: 603763827868232565
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTFR6Hs/Lkwa25FSwhn4cx65/69OWS1yyehCdGUP1UuxFLzyyfQkv/Wy/UyrN2853hOMVGJ0lkYrIQhh4Eu1Zul3jdGNbHZKgQdqViE9yYVc7cY6dzXqX0cmloLnrpxM5VXlVDzGoDbeLjq4jiAjbPAfEthW/3blWnezyNLucPkJhOALntjJK+a9QTaAmL1a+sgfoF2SgOKFNbilU06FLsz+vUP0G3Gtk02CX2rete6BAEZr4SxNi42if8C+WkAm7DXAmCymRy8lDk7kl3oAvTrn6NU79ZkGGfJkN+9NE+VB6jWTr81E0C6n4gJ8QBctNRbOcBRM23FKOkYIkUHIlb8FZkEzKbQ3i6KK1+pz6qZG66G0LoOI9i6z0BJo8Ivf+5peWYQR44U0m+aHmMKHxTVPK+5FSHDznLOez3B3g+0fXjmrIZNoZabq/SlGwaT8Fa5fs/SU28fo50ZCXZ+nTSw63D5XMawcZaSyLSzZbyM8wZpBlwSDiuLG6HjutkDVsgr/PgT06eyzbT4//dT42IiMUHvgXbBeiSEDUYXHzv125fotca50IJ3vQRA0eTxoVMaaGUM9JJvzlI9IonUjB5SwNoLvZRuVJzQp0Igez1BRYSpKpU3xSN+aW7CnSSJ12rey/WqKGzc3PYBaCFi3vQEp1POegJ1g3wuQRSZeGpljhQ
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=+suQKRDhs8ulR0HLXrnaHEuLb1TuSkvCUIDM4xJhCsg=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1770129505; v=1;
 b=HRo6dsDN/KrY/AMVCatNXqqiSeC8dql/o8y6USF7ssbIpqsmSj1449wbX1uXnnpeC0cUdjrN
 g7l4EWi3auimaUim6lrYylj/EINae9qGg46HYYcdRV63Adzxh+IIPzC5lv/8qfnV7rehYJHHsa9
 MLY/nmvcR9AaU85sJIcTbu8UJisbtp679HIT5WUkZPdWHGiJamJc9+PpEgfTooPRZOY84yPR4vJ
 kmp4pbyaHcjZ6xF4e3vSgMBmdLLhIMsicIXh2Ut9tL7ASY/FcUZQXbw4QGkMpHNAHARCzGcRaVw
 IJukPGCwUiMF69JpJEwCG7dm0p+M4a+OTMJqIigArqjTQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=HRo6dsDN
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002e23ddec5-5b5d-49c9-a546-ed49e6dbcba2,
 004BD5E907DC429EAD4B1A0856BA767B03FD8B65)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 1/9] package/freescale-imx/firmware-ele-imx:
 bump to version 2.0.4
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
ZmlybXdhcmUtZWxlLWlteC9maXJtd2FyZS1lbGUtaW14Lmhhc2ggfCA2ICsrKy0tLQogcGFja2Fn
ZS9mcmVlc2NhbGUtaW14L2Zpcm13YXJlLWVsZS1pbXgvZmlybXdhcmUtZWxlLWlteC5tayAgIHwg
NCArKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvZmlybXdhcmUtZWxlLWlteC9maXJt
d2FyZS1lbGUtaW14Lmhhc2ggYi9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvZmlybXdhcmUtZWxlLWlt
eC9maXJtd2FyZS1lbGUtaW14Lmhhc2gKaW5kZXggNTVlMTg2NGUzMWU2Li5mMDY0ZWYxODMwNDAg
MTAwNjQ0Ci0tLSBhL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9maXJtd2FyZS1lbGUtaW14L2Zpcm13
YXJlLWVsZS1pbXguaGFzaAorKysgYi9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvZmlybXdhcmUtZWxl
LWlteC9maXJtd2FyZS1lbGUtaW14Lmhhc2gKQEAgLTEsNSArMSw1IEBACiAjIExvY2FsbHkgY2Fs
Y3VsYXRlZAotc2hhMjU2ICBhMmYxNmU0M2U4YWZmOWNmMDE4ZDA5NjJiNzAzMTM5NDBmNzcwNzli
MzE0MzMxYWIzOTgwYzRjNWY0NDI0OWNiICBmaXJtd2FyZS1lbGUtaW14LTIuMC4xLTBhNjZjMzQu
YmluCi1zaGEyNTYgIDNmNGExMmM4MmE4NGJkMWMzNTc4YzljOTg2ZDYzNzFhNjFkMzM5OTUyNWU3
NjI4OGVjYmJhZTAxZGFmMGFlMjYgIENPUFlJTkcKLXNoYTI1NiAgMzhmMTQwOGQ2ZTkzNWM1NjRl
ZmQ5MTE5YzMxMzI2OWU2NDNjMWE4NWNhYjFkOTMwYzNjNWJkNzBiYzI2MTc2OSAgRVVMQQorc2hh
MjU2ICBjM2FlNGExZTFhNDFkYTQ0MWJkNjE0ODNlZjAxMWFjMjRiZjYyNGFhNmJhZDM2Zjg3OWI1
ZGZhNDM1NjQ3YjRjICBmaXJtd2FyZS1lbGUtaW14LTIuMC40LTkzNDkyZTAuYmluCitzaGEyNTYg
IDMwMDFjZjg0MDE4YzVjYjEwZDE4M2E2NzhmNmVjOGE5MjhjNzk3NjE2YmEwNmIzOThkN2NhOTNj
MDc3OWFhYTIgIENPUFlJTkcKK3NoYTI1NiAgYTgyOWIxMDlhMGE0MDZhNmEyZmVjMTk5NzVhMzMy
ZmVjYTIyNTA5OGNlNjZiZmFiMjIyMGM2NjA4ZGI4ZmNlNSAgRVVMQQogc2hhMjU2ICA4NzIxYTYx
N2E1ZDRjN2YzNjZhYWY4NTdlYmRhMjFlYjRjOWZjOTE3NWRjOTJiNzBmNjI3YzYxMWQ0MDNlYzhl
ICBTQ1IudHh0CmRpZmYgLS1naXQgYS9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvZmlybXdhcmUtZWxl
LWlteC9maXJtd2FyZS1lbGUtaW14Lm1rIGIvcGFja2FnZS9mcmVlc2NhbGUtaW14L2Zpcm13YXJl
LWVsZS1pbXgvZmlybXdhcmUtZWxlLWlteC5tawppbmRleCA4ZjI1ZjRiNWI1MzcuLmE4NDRjYTBk
OTRjOSAxMDA2NDQKLS0tIGEvcGFja2FnZS9mcmVlc2NhbGUtaW14L2Zpcm13YXJlLWVsZS1pbXgv
ZmlybXdhcmUtZWxlLWlteC5taworKysgYi9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvZmlybXdhcmUt
ZWxlLWlteC9maXJtd2FyZS1lbGUtaW14Lm1rCkBAIC00LDggKzQsOCBAQAogIwogIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMKIAotRklSTVdBUkVfRUxFX0lNWF9WRVJTSU9OID0gMi4wLjEKLUZJUk1X
QVJFX0VMRV9JTVhfUkVWSVNJT04gPSAwYTY2YzM0CitGSVJNV0FSRV9FTEVfSU1YX1ZFUlNJT04g
PSAyLjAuNAorRklSTVdBUkVfRUxFX0lNWF9SRVZJU0lPTiA9IDkzNDkyZTAKIEZJUk1XQVJFX0VM
RV9JTVhfU0lURSA9ICQoRlJFRVNDQUxFX0lNWF9TSVRFKQogRklSTVdBUkVfRUxFX0lNWF9TT1VS
Q0UgPSBmaXJtd2FyZS1lbGUtaW14LSQoRklSTVdBUkVfRUxFX0lNWF9WRVJTSU9OKS0kKEZJUk1X
QVJFX0VMRV9JTVhfUkVWSVNJT04pLmJpbgogCgotLSAKMi41Mi4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
