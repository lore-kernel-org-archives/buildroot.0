Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB9DBE87839
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 14:57:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E628605A0;
	Tue,  3 Feb 2026 14:57:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aMUULbUeMeBZ; Tue,  3 Feb 2026 14:57:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AE726070C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770130636;
	bh=P+XVBeDq8A+w7u1INA6qQLTJMKx4clswFh6LIKo74Ik=;
	h=From:Date:References:In-Reply-To:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=PgVH2S2eeGiNXliL/KkXDalDtcgw0VZoh5G/mvDU2phFA8Y3jaayO4c8qceN4TGac
	 2N7O38ia+jU/lBz88DZiqY1W+whv/6HhNI+IvkWO/bonmgqQBp1irlWUZhHw4lOw+p
	 zjhzBcIgTRes+mFFrY7Woa77CInHfZLXdhve9c24ew2QtnYzeZW0PSsVAEMD9rApMN
	 w8RmNcSl9Knxq5EZ+Y69xb5PybY/XhbWN3+40TADPP41JEA5hJp5SDdd8EXeTjzLso
	 MjoVhgDG/Roe1X21Gk0RGwXfxE1EJQED4Jd0C86ek+urM5t2haaF4xCUn3/O6pJVoZ
	 dDf46YocF88zg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AE726070C;
	Tue,  3 Feb 2026 14:57:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CF09B13D
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:57:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC5F76070C
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:57:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kFpytMKsyegi for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 14:57:14 +0000 (UTC)
X-Greylist: delayed 598 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 03 Feb 2026 14:57:14 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 979C6605A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 979C6605A0
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=188.165.38.119;
 helo=11.mo582.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 11.mo582.mail-out.ovh.net (11.mo582.mail-out.ovh.net
 [188.165.38.119])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 979C6605A0
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:57:14 +0000 (UTC)
Received: from director5.ghost.mail-out.ovh.net (unknown [10.109.249.188])
 by mo582.mail-out.ovh.net (Postfix) with ESMTP id 4f55h40d53z5vtr
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:38:28 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-5twcp (unknown [10.110.101.93])
 by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id AE6F710015F;
 Tue,  3 Feb 2026 14:38:27 +0000 (UTC)
Received: from armadeus.com ([37.59.142.98])
 by ghost-submission-7d8d68f679-5twcp with ESMTPSA
 id DBaCFGAIgmkRehQA2wKZ7w:T8
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Tue, 03 Feb 2026 14:38:27 +0000
X-OVh-ClientIp: 90.126.104.208
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Tue, 03 Feb 2026 15:38:18 +0100
MIME-Version: 1.0
Message-Id: <20260203-bump-imx-packages-lf-6-12-49-2-2-0-v1-7-548f3fc77a59@armadeus.com>
References: <20260203-bump-imx-packages-lf-6-12-49-2-2-0-v1-0-548f3fc77a59@armadeus.com>
In-Reply-To: <20260203-bump-imx-packages-lf-6-12-49-2-2-0-v1-0-548f3fc77a59@armadeus.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.3
X-Ovh-Tracer-Id: 604326777304181621
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTFR6Hs/Lkwa25FSwhn4cx65/69OWS1yyehCdGUP1UuxFLzyyfQkv/Wy/UyrN2853hOMVGJ0lkYrIQhh4Eu1Zul3jdGNbHZKgQdqViE9yYVc7cY6dzXqX0cmloLnrpxM5VXlVDzGoDbeLjq4jiAjbPAfEthW/3blWnezyNLucPkJhOALntjJK+a9QTaAmL1a+sgfoF2SgOKFNbilU06FLsz+vUP0G3Gtk02CX2rete6BAEZr4SxNi42if8C+WkAm7DXAmCymRy8lDk7kl3oAvTrn6NU79ZkGGfJkN+9NE+VB6jWTr81E0C6n4gJ8QBctNRbOcBRM23FKOkYIkUHIlb8FHKygOVVbqUH68GL8JKsPqDCUVbXVaU4emaRekhOIUPFtD6bRWMxa5pduSrKGvS34/QZAC2yLhOVYnc8TNqVb8zY2XpnaZJvfnE9pB/2RzM9W3W6PLXyPimwCog3D3uGPF/i1w7sIDV6z2Of31QSPz8XsliL/3BJx7d7GxvuSqfPOsmzURL2YGpNpcNDtj3EWZjTSGCgY2TU7BcKrw4OuP8BSAAx/qXcbM/ZvVwKremNV9BuFfdoR6VHGUyySvFBlX4OX6VwUYvh64dvK3139dH+NoONbxR34otfDsekkYeNtw7pDny+L2wR030JZnWWDM8BdcMtxISN5VZrKhywLFA
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=K3vPGSHNSYa3Hhg/4QvVpoJiPP56JODD4Asti3pfhbA=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1770129508; v=1;
 b=NyzdnDkxhz4igI4wVqCkwlT2tNmZ63DGw2yvwCjgKjS8jrszQkucKu25hU/orLymua8JmvKL
 niBQH4oh8xYuubH+3YKI4JlhjStMju7HzST48dQi1sS8xm0ZWRZ136tF/LZIoNPa3X0642DhbZG
 0bShmAwV5P7G7KaFUzu2DEk0yowqDp1GK8tCrO9ZuoEe89FptXL5UQx1sBVbeA6IFB5l7LnuuFY
 qvxvK4xR3sYn/odem+Fj4Yq7XD8f6f8hksndOnAllkIt5fXQMghL7j/gBZoAYGcmfKSfk7Ja0TV
 YK5os+he3oRywrt67FfXxGWYacIAh6akxhTOgjbk6mHjA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=NyzdnDkx
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002b01988da-f6d2-4f1f-ab69-3eaccc465bcf,
 004BD5E907DC429EAD4B1A0856BA767B03FD8B65)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 7/9] package/freescale-imx/imx-vpu-hantro-vc:
 bump version to 1.11.0
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
WFBfU29mdHdhcmVfTGljZW5zZSBjaGFuZ2VkCmZyb20gInY1NyBKdWx5IDIwMjQiIHRvICJ2NjMg
TWF5IDIwMjUiLgoKU2lnbmVkLW9mZi1ieTogU8OpYmFzdGllbiBTenltYW5za2kgPHNlYmFzdGll
bi5zenltYW5za2lAYXJtYWRldXMuY29tPgotLS0KIHBhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgt
dnB1LWhhbnRyby12Yy9pbXgtdnB1LWhhbnRyby12Yy5oYXNoIHwgNiArKystLS0KIHBhY2thZ2Uv
ZnJlZXNjYWxlLWlteC9pbXgtdnB1LWhhbnRyby12Yy9pbXgtdnB1LWhhbnRyby12Yy5tayAgIHwg
NCArKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LXZwdS1oYW50cm8tdmMvaW14
LXZwdS1oYW50cm8tdmMuaGFzaCBiL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtdnB1LWhhbnRy
by12Yy9pbXgtdnB1LWhhbnRyby12Yy5oYXNoCmluZGV4IDFiMTQ0N2MzNGVmYi4uMTJlZWIyZjIx
NDNkIDEwMDY0NAotLS0gYS9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LXZwdS1oYW50cm8tdmMv
aW14LXZwdS1oYW50cm8tdmMuaGFzaAorKysgYi9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LXZw
dS1oYW50cm8tdmMvaW14LXZwdS1oYW50cm8tdmMuaGFzaApAQCAtMSw1ICsxLDUgQEAKICMgTG9j
YWxseSBjb21wdXRlZDoKLXNoYTI1NiAgNzEzYmEzNzVmMjU0OTA3MjdmY2M2MmJhYjVkNTUwOGY3
NGRlMDMyMDRiNGMxNTM0NjRiNjk2YjY1MmM1YzdkZiAgaW14LXZwdS1oYW50cm8tdmMtMS4xMC4x
LWMwMjQ0YTEuYmluCi1zaGEyNTYgIDYwMWZhNzkwYzViNGQwMzU3OWJkMTgyZmI0ZDY1YTZmMzI5
YTMyZmFmNDlkYjIyZjk4ZTQ2MDgyMjFlODYxZjcgIENPUFlJTkcKLXNoYTI1NiAgYzNkOWE3YjJh
NWE3ZGI1ZGE2OTBlOWMxMDgxYjk4YjY2NTgwMmMzZWZiYmJhN2ZiMjM3MzM5Mzk1YTkyZjYwNyAg
RVVMQQorc2hhMjU2ICAwNGQyYTljNWM3NTgwNGExMWE0NTAwYTAxMzNkZmM3ZDhlODRmNzQyNTRj
ZWU1MmM0MjA3NWY1ZWNjMjI5NTUwICBpbXgtdnB1LWhhbnRyby12Yy0xLjExLjAtNWUxOGE4NC5i
aW4KK3NoYTI1NiAgMzAwMWNmODQwMThjNWNiMTBkMTgzYTY3OGY2ZWM4YTkyOGM3OTc2MTZiYTA2
YjM5OGQ3Y2E5M2MwNzc5YWFhMiAgQ09QWUlORworc2hhMjU2ICBhODI5YjEwOWEwYTQwNmE2YTJm
ZWMxOTk3NWEzMzJmZWNhMjI1MDk4Y2U2NmJmYWIyMjIwYzY2MDhkYjhmY2U1ICBFVUxBCiBzaGEy
NTYgIGE2ZjAyOTdhZDhhYjQ5MDYyMjk5NTdjMmM3YzRiZjgyNWQ1NDNkOTlmZmI1YmRhZmMyZGU1
YThkODg0ZWI4OGIgIFNDUi50eHQKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9p
bXgtdnB1LWhhbnRyby12Yy9pbXgtdnB1LWhhbnRyby12Yy5tayBiL3BhY2thZ2UvZnJlZXNjYWxl
LWlteC9pbXgtdnB1LWhhbnRyby12Yy9pbXgtdnB1LWhhbnRyby12Yy5tawppbmRleCBiMjhlNjFi
ZDhhNzcuLjBlOGUyZGM4NjBjZiAxMDA2NDQKLS0tIGEvcGFja2FnZS9mcmVlc2NhbGUtaW14L2lt
eC12cHUtaGFudHJvLXZjL2lteC12cHUtaGFudHJvLXZjLm1rCisrKyBiL3BhY2thZ2UvZnJlZXNj
YWxlLWlteC9pbXgtdnB1LWhhbnRyby12Yy9pbXgtdnB1LWhhbnRyby12Yy5tawpAQCAtNCw4ICs0
LDggQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLUlNWF9WUFVfSEFOVFJPX1ZDX1ZF
UlNJT04gPSAxLjEwLjEKLUlNWF9WUFVfSEFOVFJPX1ZDX1JFVklTSU9OID0gYzAyNDRhMQorSU1Y
X1ZQVV9IQU5UUk9fVkNfVkVSU0lPTiA9IDEuMTEuMAorSU1YX1ZQVV9IQU5UUk9fVkNfUkVWSVNJ
T04gPSA1ZTE4YTg0CiBJTVhfVlBVX0hBTlRST19WQ19TSVRFID0gJChGUkVFU0NBTEVfSU1YX1NJ
VEUpCiBJTVhfVlBVX0hBTlRST19WQ19TT1VSQ0UgPSBpbXgtdnB1LWhhbnRyby12Yy0kKElNWF9W
UFVfSEFOVFJPX1ZDX1ZFUlNJT04pLSQoSU1YX1ZQVV9IQU5UUk9fVkNfUkVWSVNJT04pLmJpbgog
SU1YX1ZQVV9IQU5UUk9fVkNfREVQRU5ERU5DSUVTID0gbGludXgKCi0tIAoyLjUyLjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
