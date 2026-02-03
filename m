Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 399AAE87834
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 14:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E232080CE9;
	Tue,  3 Feb 2026 14:44:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wj6_Vj2zbMyn; Tue,  3 Feb 2026 14:44:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6916780D60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770129894;
	bh=lVFbMnGTOn+LUkXIBGZCMlury6AqRIVLoafy6USwG8E=;
	h=From:Date:References:In-Reply-To:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=L+CEGbxyyl0VhtDwBOCwT3VIsn4+mONsPQRVgDuR2s2OeYfrLR6fVVTbqkhPk8gUW
	 1yvZSj1bU63DNhmVub3TmXfj06UiF0ZJGCUBEqw+0kVopLnmHJqtU8cZrcfrxicG+q
	 PS1pZdNFRQ5AnhrFCM6BIxM4EOuvFMVmGnT4qsKM7I8asPkZP4olJd68OnKyIjcutM
	 pBjzsyqN2A2x/lbw4GTUk4uW/Lwy0MEXtqCuYM+3wBE1y03KRua5ZBHrbZTLRhbZzB
	 2tg5FicWSUUONErrOlKn3IvSnVO4/SVigbwbADbNp62e3XTBYxlMvSy731/qEGit9t
	 TCx+EshPtEA1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6916780D60;
	Tue,  3 Feb 2026 14:44:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B6E3F1A6
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 994BF607C1
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:44:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rulQzGCzf7wn for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 14:44:49 +0000 (UTC)
X-Greylist: delayed 377 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 03 Feb 2026 14:44:46 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DD3D3607AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD3D3607AE
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=46.105.56.233;
 helo=8.mo576.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 8.mo576.mail-out.ovh.net (8.mo576.mail-out.ovh.net
 [46.105.56.233])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DD3D3607AE
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:44:46 +0000 (UTC)
Received: from director5.ghost.mail-out.ovh.net (unknown [10.109.254.119])
 by mo576.mail-out.ovh.net (Postfix) with ESMTP id 4f55h23gTpz5vbq
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:38:26 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-5twcp (unknown [10.110.101.93])
 by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 37225100222;
 Tue,  3 Feb 2026 14:38:26 +0000 (UTC)
Received: from armadeus.com ([37.59.142.98])
 by ghost-submission-7d8d68f679-5twcp with ESMTPSA
 id DBaCFGAIgmkRehQA2wKZ7w:T5
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Tue, 03 Feb 2026 14:38:26 +0000
X-OVh-ClientIp: 90.126.104.208
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Tue, 03 Feb 2026 15:38:15 +0100
MIME-Version: 1.0
Message-Id: <20260203-bump-imx-packages-lf-6-12-49-2-2-0-v1-4-548f3fc77a59@armadeus.com>
References: <20260203-bump-imx-packages-lf-6-12-49-2-2-0-v1-0-548f3fc77a59@armadeus.com>
In-Reply-To: <20260203-bump-imx-packages-lf-6-12-49-2-2-0-v1-0-548f3fc77a59@armadeus.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.3
X-Ovh-Tracer-Id: 604045300897213301
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTGUcoclSxuORx42qrQ/hju/YmU7c0TIdXXXf+O/VQtyEoQH5bwpjhu+nuzRuktn5WwaOPR5ylyy7RpWkJXj/dJWFDvCwtP6c3VV3/IwIXjelch0ySPK12HtPdMt9HOOfa0h8r2CikFT1jUxMMuGHGDa+TCWHmUTGAjHUuf+tYkI/QVV1voooX15zIz5NuKvocz5De/LPXtJfGLetZzYrvn4JtLqh/IMXctSjWVprEV0knHKpnZJmjdaXIJIxe5n0IWf4+IR5SaXe+R05sADHyKMx2eBVivoybZyJaV2lpXp2TK89mDJKof63Qyg/tqlQCniZp3r7lrou5sJGiR/I0KprotQ6Kyg66X6o4kImhbGZxiMqmuYdqvSvLnkIY0A5wuDmV5xGgNtCpsCcutsoCy2sJEUOnD4dBRaYVHRvo2kYP4lwykTYi9E23s3ELgRLWhGJp0V1FBHC62M/gl24zUTaMw+8b37xtBAGcW8gDoQR2r/A86A7BT8YT1An+FESv56MEnGv5/i72cS4DMvCKNZPI8hsXKM1PiQ3UOcJoj5cczRlIX2dDd6O9Wp3VCwF9nFsqoqZyYQC3/04cmuUbwCudg3TlYF1cJhWitv1RtwZ4706qnF9BNhj3QPAh6kHYYSXxxVN0qnoFOrmCjQncUHQVe0TLTV5tlLIvzBfgem8w
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=yfhOa7voU82GdXjwUeOGeq3MlLvkia1aaJe6p5cZCzs=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1770129506; v=1;
 b=CtgbnV/5W68XiZgU3qkI8Ux8E9OfT8EOPjBdrWTTTpZm3CRldLp7b+iRyAkcm6iLdmYVI5t7
 OrRAP4W7R/VGeTvPsMvkmmcHkQpmR5Z19CSTdG/cJ9rrW/Wvcg2ypXK1ikt512xgtYbTCDrDEaz
 mycZW5rqitaI8DdcziSjcD8s7UTp9Y0patm2TcRjrwJzHXrGh+QXu8uJIM9MqNIDA8kNm2oRG1I
 iyhyMWFQxOAuQDs1khuESay9CH2/YclohLq+KHS6e+ZpKeSs87fUTuWQYe428kIeQUMi+FjpGdL
 atB9YhZqW9S6P8Um1Nr8ikOF+StiRNBW981Y+xblnYFuQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=CtgbnV/5
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002dcbf9cb9-cf4f-4145-aef8-1ebe177fbc33,
 004BD5E907DC429EAD4B1A0856BA767B03FD8B65)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 4/9] package/freescale-imx/imx-gpu-viv: bump
 version to 6.4.11.p4.2
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
aW14LWdwdS12aXYvaW14LWdwdS12aXYuaGFzaCB8IDggKysrKy0tLS0KIHBhY2thZ2UvZnJlZXNj
YWxlLWlteC9pbXgtZ3B1LXZpdi9pbXgtZ3B1LXZpdi5tayAgIHwgNiArKystLS0KIDIgZmlsZXMg
Y2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtZ3B1LXZpdi9pbXgtZ3B1LXZpdi5oYXNoIGIvcGFja2Fn
ZS9mcmVlc2NhbGUtaW14L2lteC1ncHUtdml2L2lteC1ncHUtdml2Lmhhc2gKaW5kZXggN2I0ZmNl
ZGY0YTVlLi43ZjczMjBjZTIxMGYgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9p
bXgtZ3B1LXZpdi9pbXgtZ3B1LXZpdi5oYXNoCisrKyBiL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9p
bXgtZ3B1LXZpdi9pbXgtZ3B1LXZpdi5oYXNoCkBAIC0xLDYgKzEsNiBAQAogIyBMb2NhbGx5IGNh
bGN1bGF0ZWQKLXNoYTI1NiAgZmU4ZmMyMzFmMTgwNDdiOTU0N2EwMzhlMTExYzA4ZTg1NTc2MDE5
MGQwZTk4NDhlYWQyMmIzODNkNzkzNDk5ZCAgaW14LWdwdS12aXYtNi40LjExLnAzLjAtYWFyY2gz
Mi1jNjAwZDAzLmJpbgotc2hhMjU2ICA4MmUxYmI2MzA0ZDJhYWM3MGM3MmI2OTEyMzlkMWJiNWY2
NzM4Y2FkZmE4MTJkMDcxOTZkYjJmNTgwYzYzZDI5ICBpbXgtZ3B1LXZpdi02LjQuMTEucDMuMC1h
YXJjaDY0LWM2MDBkMDMuYmluCi1zaGEyNTYgIDNmNGExMmM4MmE4NGJkMWMzNTc4YzljOTg2ZDYz
NzFhNjFkMzM5OTUyNWU3NjI4OGVjYmJhZTAxZGFmMGFlMjYgIENPUFlJTkcKLXNoYTI1NiAgMzhm
MTQwOGQ2ZTkzNWM1NjRlZmQ5MTE5YzMxMzI2OWU2NDNjMWE4NWNhYjFkOTMwYzNjNWJkNzBiYzI2
MTc2OSAgRVVMQQorc2hhMjU2ICAxOWE2Mzc3YzgxN2UwMDQ5ZjhiNmJkZGI3OGJhZGMxOGFkY2Ni
MjA3NTQyOWMyN2M4OWFlZTk1ZDQ0MTk2MTEzICBpbXgtZ3B1LXZpdi02LjQuMTEucDQuMi1hYXJj
aDMyLTg0NmUxMmUuYmluCitzaGEyNTYgIGFhMTIwZjM3ZDkwMTBmYmRkYWJjNjAzODczMDBmYWJh
ZjQzYjJjZjMwODk0YjZlN2I1OTczOTQ3ZWM2YmJlNjIgIGlteC1ncHUtdml2LTYuNC4xMS5wNC4y
LWFhcmNoNjQtODQ2ZTEyZS5iaW4KK3NoYTI1NiAgMzAwMWNmODQwMThjNWNiMTBkMTgzYTY3OGY2
ZWM4YTkyOGM3OTc2MTZiYTA2YjM5OGQ3Y2E5M2MwNzc5YWFhMiAgQ09QWUlORworc2hhMjU2ICBh
ODI5YjEwOWEwYTQwNmE2YTJmZWMxOTk3NWEzMzJmZWNhMjI1MDk4Y2U2NmJmYWIyMjIwYzY2MDhk
YjhmY2U1ICBFVUxBCiBzaGEyNTYgIGFiMjBmYTNmNTI3ZmNlOTkwODdkOGQzY2Q0ZTJjZjRiOWNm
ZGZhYWE5OGIzZDc2NmEyYjU5NTNhOTgxMzIzZDMgIFNDUi1pbXgtZ3B1LXZpdi50eHQKZGlmZiAt
LWdpdCBhL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtZ3B1LXZpdi9pbXgtZ3B1LXZpdi5tayBi
L3BhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtZ3B1LXZpdi9pbXgtZ3B1LXZpdi5tawppbmRleCA4
NDk0ZTg3NWUyMGQuLjZjOGEzYWFkYjc1MiAxMDA2NDQKLS0tIGEvcGFja2FnZS9mcmVlc2NhbGUt
aW14L2lteC1ncHUtdml2L2lteC1ncHUtdml2Lm1rCisrKyBiL3BhY2thZ2UvZnJlZXNjYWxlLWlt
eC9pbXgtZ3B1LXZpdi9pbXgtZ3B1LXZpdi5tawpAQCAtNCwxMSArNCwxMSBAQAogIwogIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMKIAotSU1YX0dQVV9WSVZfUkVWSVNJT04gPSBjNjAwZDAzCitJTVhf
R1BVX1ZJVl9SRVZJU0lPTiA9IDg0NmUxMmUKIGlmZXEgKCQoQlIyX2FhcmNoNjQpLHkpCi1JTVhf
R1BVX1ZJVl9WRVJTSU9OID0gNi40LjExLnAzLjAtYWFyY2g2NAorSU1YX0dQVV9WSVZfVkVSU0lP
TiA9IDYuNC4xMS5wNC4yLWFhcmNoNjQKIGVsc2UKLUlNWF9HUFVfVklWX1ZFUlNJT04gPSA2LjQu
MTEucDMuMC1hYXJjaDMyCitJTVhfR1BVX1ZJVl9WRVJTSU9OID0gNi40LjExLnA0LjItYWFyY2gz
MgogZW5kaWYKIElNWF9HUFVfVklWX1NJVEUgPSAkKEZSRUVTQ0FMRV9JTVhfU0lURSkKIElNWF9H
UFVfVklWX1NPVVJDRSA9IGlteC1ncHUtdml2LSQoSU1YX0dQVV9WSVZfVkVSU0lPTiktJChJTVhf
R1BVX1ZJVl9SRVZJU0lPTikuYmluCgotLSAKMi41Mi4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
