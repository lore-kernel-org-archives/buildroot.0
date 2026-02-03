Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C2A2E87843
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 15:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 087B340B85;
	Tue,  3 Feb 2026 15:54:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zP5OcjkNT4Tc; Tue,  3 Feb 2026 15:54:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 349B6409A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770134097;
	bh=cWwyiP4NxvLet6a0KjE8B0kJ5KjHJ3hZi+HsmcKpQpA=;
	h=From:Date:References:In-Reply-To:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=G+Spfs3LaVvJo73eHIkpyA9WeuP7x9J5royHchtM36zOyfCCfzcewQaIFI/iLgSuJ
	 LoVta3Pbdh5eYM4qiwrj8hfPA8X124oqzOk7XdvrtO3zLZ/cu5DtMtg7/2PTXcg5Ay
	 8kCaZjK6T6EvI8GM/MsWp63AU/lFJTxBxPh1QY7mVZNZLZh94Jg044xnAYJ4OYbF9P
	 NDQOR42ZEBcbwUnThvorImvbHGx3Lo51SQZMukthgljIqAj4xjoWLRMy+Fa5He5+mA
	 9j6yQ9N3ZcnUc7nSMCfK2VxE3itJAfWyDG2hbs+IdFeknb5VRnqfsvv7egaTAMNhDK
	 gnmEVR3uw49zA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 349B6409A6;
	Tue,  3 Feb 2026 15:54:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B48B4F4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 94C91401D7
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:54:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8CPuYsE78hK3 for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 15:54:54 +0000 (UTC)
X-Greylist: delayed 4217 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 03 Feb 2026 15:54:53 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ED25B40025
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED25B40025
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=46.105.43.205;
 helo=6.mo550.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 6.mo550.mail-out.ovh.net (6.mo550.mail-out.ovh.net
 [46.105.43.205])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ED25B40025
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:54:53 +0000 (UTC)
Received: from director5.ghost.mail-out.ovh.net (unknown [10.110.37.10])
 by mo550.mail-out.ovh.net (Postfix) with ESMTP id 4f55h43xFQz5ybd
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:38:28 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-5twcp (unknown [10.110.101.93])
 by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 1806F10020A;
 Tue,  3 Feb 2026 14:38:28 +0000 (UTC)
Received: from armadeus.com ([37.59.142.98])
 by ghost-submission-7d8d68f679-5twcp with ESMTPSA
 id DBaCFGAIgmkRehQA2wKZ7w:T9
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Tue, 03 Feb 2026 14:38:28 +0000
X-OVh-ClientIp: 90.126.104.208
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Tue, 03 Feb 2026 15:38:19 +0100
MIME-Version: 1.0
Message-Id: <20260203-bump-imx-packages-lf-6-12-49-2-2-0-v1-8-548f3fc77a59@armadeus.com>
References: <20260203-bump-imx-packages-lf-6-12-49-2-2-0-v1-0-548f3fc77a59@armadeus.com>
In-Reply-To: <20260203-bump-imx-packages-lf-6-12-49-2-2-0-v1-0-548f3fc77a59@armadeus.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.3
X-Ovh-Tracer-Id: 604608252676467573
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTFR6Hs/Lkwa25FSwhn4cx65/69OWS1yyehCdGUP1UuxFLzyyfQkv/Wy/UyrN2853hOMVGJ0lkYrIQhh4Eu1Zul3jdGNbHZKgQdqViE9yYVc7cY6dzXqX0cmloLnrpxM5VXlVDzGoDbeLjq4jiAjbPAfEthW/3blWnezyNLucPkJhOALntjJK+a9QTaAmL1a+sgfoF2SgOKFNbilU06FLsz+vUP0G3Gtk02CX2rete6BAEZr4SxNi42if8C+WkAm7DXAmCymRy8lDk7kl3oAvTrn6NU79ZkGGfJkN+9NE+VB6jWTr81E0C6n4gJ8QBctNRbOcBRM23FKOkYIkUHIlb8FQQLunGFEkJicsiHdeGBdbUaoO5nPq/ezBKhd53YNmYQwXtbQ3mNg4fxJt1Ln5k/ajHLRlxN5SiP9a1zy9iv5kr/UcQqFtesHJpJ8mVxR3I0D/PhPk0TlYODiBnL7VElXzd7apctDMlNNBtrq3UjhTRwAuhGVH/zML9WSiEt7iLzFS8VRxNh0Kt9L3BU15vlndcw29sUFSxnXWnTDDhyRUd2G4yQYfldNsl80RM42lIA9aS9sHGL95D1hApTlVH37lOOWbUw0pJZQTcqQXU4ghoP64eBONqW0HUrJkxvKKuVumDNkhgLQOO2jMBVSEgcZOvv5wuLHBkCPqZTGJZhKNA
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=onMF80LcIGZBapMFGVzklb0I77GBLWRbfduiX+3K7Gc=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1770129508; v=1;
 b=rekVbKJedMOxJbDIwNlVa1F/0PsnmN3x8xwONkGhG5ls+aD6NjHffs0kZl337fLWEOGZUGH1
 6pOacZOHTbxaEgrkbcEhK3KKBKRBjQG0T8u4rto224S9Lzh4dHehJmxzRXPprY+05l3d9wsO8ws
 gJUp+Us57bja/uHRTW9ABr8mBDK1Q7oftUQtn570dmxt/Q6rHq5fckqRGS/WRRTVdGsFh2lT1fs
 rWBWUUg7EkYxRZOyOyAm3BGvC0JDHPD3+xDnLmSr2l08TrS/wEf+ItExPgFwhV2pJzv4Rs5lsQ+
 jLUjsZ9fdYLkM5wwNyjDdZTUhlssr1QFZrh/ZSUPj884g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=rekVbKJe
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-98R00208686b84-826a-4d89-b517-a0e4e51c7d3c,
 004BD5E907DC429EAD4B1A0856BA767B03FD8B65)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 8/9] package/freescale-imx/imx-codec: bump to
 version 4.10.0
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
WFBfU29mdHdhcmVfTGljZW5zZSBjaGFuZ2VkCmZyb20gInY1NiBBcHJpbCAyMDI0IiB0byAidjYy
IE1heSAyMDI1Ii4KCk5vdGU6IGluIHRoaXMgcmVsZWFzZSwgdGhlIHBhY2thZ2Ugc291cmNlIGFy
Y2hpdmUgbmFtZSBjaGFuZ2VkIHRvCmluY2x1ZGUgYSByZXZpc2lvbi4gVGhpcyBjb21taXQgYWRk
cyBhIG5ldyBfUkVWSVNJT04gdmFyaWFibGUgd2l0aCB0aGUKdmFsdWUgcHVibGlzaGVkIGluIHRo
ZSBjb3JyZXNwb25kaW5nIE5YUCBCU1AuCgpTaWduZWQtb2ZmLWJ5OiBTw6liYXN0aWVuIFN6eW1h
bnNraSA8c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20+Ci0tLQogcGFja2FnZS9mcmVl
c2NhbGUtaW14L2lteC1jb2RlYy9pbXgtY29kZWMuaGFzaCB8IDggKysrKy0tLS0KIHBhY2thZ2Uv
ZnJlZXNjYWxlLWlteC9pbXgtY29kZWMvaW14LWNvZGVjLm1rICAgfCA1ICsrKy0tCiAyIGZpbGVz
IGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9w
YWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LWNvZGVjL2lteC1jb2RlYy5oYXNoIGIvcGFja2FnZS9m
cmVlc2NhbGUtaW14L2lteC1jb2RlYy9pbXgtY29kZWMuaGFzaAppbmRleCAxOGEyY2ViZWM5ODcu
LjcwOGFkMmJiYzhiZiAxMDA2NDQKLS0tIGEvcGFja2FnZS9mcmVlc2NhbGUtaW14L2lteC1jb2Rl
Yy9pbXgtY29kZWMuaGFzaAorKysgYi9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LWNvZGVjL2lt
eC1jb2RlYy5oYXNoCkBAIC0xLDUgKzEsNSBAQAogIyBsb2NhbGx5IGNvbXB1dGVkCi1zaGEyNTYg
IDFhNDFhM2NhZDllMGY0YmFhOTA0ZmNlYzg5NjEwNWQzNDc0ZTE4ZDEzZjE2OWRhZDExNzJkNTY5
MWZjMTFjOWEgIGlteC1jb2RlYy00LjkuMC5iaW4KLXNoYTI1NiAgYzllZTUxODUxMGQ3MmUyNTRk
NjI3NDNmNTA5ODE2M2VhY2RiNjQyOGM2YmE0ZDgxMTlhZmUyZDEyZWRiYTA2OCAgQ09QWUlORwot
c2hhMjU2ICAxNjVmNmMwZWFjYjRkM2EwNTI4OWRmYjc5MzMxYzlhMmMwNTIwN2ViN2E2N2VmMjhh
MTE3ZjI0NmEwMTQ1NDI4ICBFVUxBCi1zaGEyNTYgIDU4MzJjNTkyMTVmY2M1ZmZkMjU2NmMwYmIz
NWM3ZTVjODE4MWNhNjA5ZjUyOTk2MmMyYmQwNjA2ZjNmMTJhYTMgIFNDUi1pbXgtY29kZWMudHh0
CitzaGEyNTYgIDgyMjQyMjE5ZTBkMzUzNmFlZmYzMWQ5YzIxNTU0M2JmZTU1NDE1NDBiZGI0ZmE4
ZDYxZTgzMDY3YjAxNWUzMWYgIGlteC1jb2RlYy00LjEwLjAtNDY0ZTlkOC5iaW4KK3NoYTI1NiAg
ZjI0ZGFhYmI1NzdhZDMxMTA1YTdkYjU2MmJiMmY0NjIzNjAzNzE1Y2JiM2MxNjhhMzEwNTY0OTc0
YWMyYTJlOSAgQ09QWUlORworc2hhMjU2ICBiZmMxYzE2MjM4NGM4Y2M0ZDVhNzhjNGM5MzBhMzE3
YThjMDFmZDJjZGFkMTE3NTVlM2IxM2E2MDA0YmI0OTYxICBFVUxBCitzaGEyNTYgIGNiNzliMDE1
Y2YyMTg1YmFjM2RkZTBmNzdkZTIyN2UyZDY4YTVlNzFmNmI1OGZhMjg2MmM5NDU5ZmRkMDhjZDIg
IFNDUi1pbXgtY29kZWMudHh0CmRpZmYgLS1naXQgYS9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14
LWNvZGVjL2lteC1jb2RlYy5tayBiL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtY29kZWMvaW14
LWNvZGVjLm1rCmluZGV4IDBjZmU3NGRmMGIzNy4uYmFhZjljMDk4YTJkIDEwMDY0NAotLS0gYS9w
YWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LWNvZGVjL2lteC1jb2RlYy5taworKysgYi9wYWNrYWdl
L2ZyZWVzY2FsZS1pbXgvaW14LWNvZGVjL2lteC1jb2RlYy5tawpAQCAtNCw5ICs0LDEwIEBACiAj
CiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1JTVhfQ09ERUNfVkVSU0lPTiA9IDQuOS4wCitJ
TVhfQ09ERUNfVkVSU0lPTiA9IDQuMTAuMAorSU1YX0NPREVDX1JFVklTSU9OID0gNDY0ZTlkOAog
SU1YX0NPREVDX1NJVEUgPSAkKEZSRUVTQ0FMRV9JTVhfU0lURSkKLUlNWF9DT0RFQ19TT1VSQ0Ug
PSBpbXgtY29kZWMtJChJTVhfQ09ERUNfVkVSU0lPTikuYmluCitJTVhfQ09ERUNfU09VUkNFID0g
aW14LWNvZGVjLSQoSU1YX0NPREVDX1ZFUlNJT04pLSQoSU1YX0NPREVDX1JFVklTSU9OKS5iaW4K
IElNWF9DT0RFQ19JTlNUQUxMX1NUQUdJTkcgPSBZRVMKIAogSU1YX0NPREVDX0xJQ0VOU0UgPSBO
WFAgU2VtaWNvbmR1Y3RvciBTb2Z0d2FyZSBMaWNlbnNlIEFncmVlbWVudCwgQlNELTMtQ2xhdXNl
IChmbGFjLCBvZ2cgaGVhZGVycykKCi0tIAoyLjUyLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
