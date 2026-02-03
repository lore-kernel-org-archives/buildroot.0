Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35BB4E8783D
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 14:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF3CF60858;
	Tue,  3 Feb 2026 14:44:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jnGFqhdbueb2; Tue,  3 Feb 2026 14:44:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94E61607C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770129891;
	bh=sjqoHoKmJoE2j67/BTRXdrekre+y6I8Tqw9zhx4Oh9Y=;
	h=From:Date:References:In-Reply-To:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=NTB2GC/WSB5unSGygYyrX+zw0EVb9MXHQzq6BlwMzZli60REYNo5VgXDH2UKt7tAm
	 gBDHpOrKnS/J3XyH3o8IQvzgPgtxTEXggLBQJwhm5lxZqCJwAL2jYLwmoSNmQdFDSw
	 ViF17B1OE4lt1SAtGyzJvxe+bA/gLZKmCZPQiBGuIb5+YcZOtF9WXC05f1NOdyVv3i
	 E5rdRc6DL4qjeV9P90pFAJa3BYdh84p0XzXMPbBBVk43ms9DBgbOudZdov8tf4a5V/
	 El19OS+EgGgfezi4VWJN9EUHtlPYCcydkC4sXEZLTajpywPEtBBFqJ3yJn5nmrHab9
	 Kkly3JOnOjNlg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94E61607C1;
	Tue,  3 Feb 2026 14:44:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AAD00F5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94A6040AFF
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:44:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IB_rgn4Qim_T for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 14:44:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=46.105.56.233;
 helo=8.mo576.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 76A2B40AB9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76A2B40AB9
Received: from 8.mo576.mail-out.ovh.net (8.mo576.mail-out.ovh.net
 [46.105.56.233])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 76A2B40AB9
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:44:49 +0000 (UTC)
Received: from director5.ghost.mail-out.ovh.net (unknown [10.109.254.119])
 by mo576.mail-out.ovh.net (Postfix) with ESMTP id 4f55h30l4Mz5xW3
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:38:27 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-5twcp (unknown [10.110.101.93])
 by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 9289410016A;
 Tue,  3 Feb 2026 14:38:26 +0000 (UTC)
Received: from armadeus.com ([37.59.142.98])
 by ghost-submission-7d8d68f679-5twcp with ESMTPSA
 id DBaCFGAIgmkRehQA2wKZ7w:T6
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Tue, 03 Feb 2026 14:38:26 +0000
X-OVh-ClientIp: 90.126.104.208
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Tue, 03 Feb 2026 15:38:16 +0100
MIME-Version: 1.0
Message-Id: <20260203-bump-imx-packages-lf-6-12-49-2-2-0-v1-5-548f3fc77a59@armadeus.com>
References: <20260203-bump-imx-packages-lf-6-12-49-2-2-0-v1-0-548f3fc77a59@armadeus.com>
In-Reply-To: <20260203-bump-imx-packages-lf-6-12-49-2-2-0-v1-0-548f3fc77a59@armadeus.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.3
X-Ovh-Tracer-Id: 604326778539666293
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTGUcoclSxuORx42qrQ/hju/YmU7c0TIdXXXf+O/VQtyEoQH5bwpjhu+nuzRuktn5WwaOPR5ylyy7RpWkJXj/dJWFDvCwtP6c3VV3/IwIXjelch0ySPK12HtPdMt9HOOfa0h8r2CikFT1jUxMMuGHGDa+TCWHmUTGAjHUuf+tYkI/QVV1voooX15zIz5NuKvocz5De/LPXtJfGLetZzYrvn4JtLqh/IMXctSjWVprEV0knHKpnZJmjdaXIJIxe5n0IWf4+IR5SaXe+R05sADHyKMx2eBVivoybZyJaV2lpXp2TK89mDJKof63Qyg/tqlQCniZp3r7lrou5sJGiR/I0KpQyf1vPokrU+1+LHnrmN1zwGSo7I3oTdDQxcDn3vsJ+Nmk+cQ9a3Tj7gDVdY/2EjBLOslADLt8gz/366W0UFoIK2Uy+HFgRY8mpxvH9UYWi7+Ima/FxR5D2IJkc9LMKh4f3cPiK5vCQShZGnxKfXdEFNt9Txo3CLClAjqwTLJy0Tjw1A47Y83Txdy718UJStD6i4YyjjIUSm/Lsz3KO5YVB5T3dDOqq0cJMk/ujGOonXsFzYZ8dWmSiaAT7R0Oee1BWLmkOAHgSZTZlLeSh9HN32h+V7ctec3P7q6cmoEKENZEbkxrceu/xpdC9ujStt4+tCuiBleLjuXz7DwKDBuuA
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=B6tPtv5jKZkeVd250nXr3rNP54ngxPlr8EzQSW+IlDU=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1770129507; v=1;
 b=nqrjRi5DstTdkbl0dl5QLiGTnSd9GYL/+aN83PYAyn1TyA2RMx1zjViJc/bGANTOecnTZn2M
 CUo9K4Sn3lKtyATglnWa88VQrTbV7lpr4oBAE8QxO13k2gAM+sLvfrj6wFv17rokySiCTuCqr3e
 tgQRbRDDWZJ5bg7Squb0MHorKcdz4vyawFOXUlw09xFqmnjwj+Cb0dku8m6qY+lCu453uQMddTf
 ndFoV3o7aik8X9VRkoLVd4sGkAqWIRTfZbLyz0Tsx1JC5ZTlYkS4YzTWJIroXH2lik3mihLz6cv
 DYS8NRhJqxjc/N9nPWd4bz40c5NT1DxHFcc0L5EmRVcfg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=nqrjRi5D
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002fde69393-ba1a-43f5-ba8e-407ed6a925e4,
 004BD5E907DC429EAD4B1A0856BA767B03FD8B65)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 5/9] package/freescale-imx/imx-vpu-hantro: bump
 version to 1.39.0
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
aW14LXZwdS1oYW50cm8vaW14LXZwdS1oYW50cm8uaGFzaCB8IDYgKysrLS0tCiBwYWNrYWdlL2Zy
ZWVzY2FsZS1pbXgvaW14LXZwdS1oYW50cm8vaW14LXZwdS1oYW50cm8ubWsgICB8IDQgKystLQog
MiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvcGFja2FnZS9mcmVlc2NhbGUtaW14L2lteC12cHUtaGFudHJvL2lteC12cHUtaGFudHJv
Lmhhc2ggYi9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LXZwdS1oYW50cm8vaW14LXZwdS1oYW50
cm8uaGFzaAppbmRleCA2YjI2N2IzZWYwMWIuLmMzMWZjNzBkYWQ0MSAxMDA2NDQKLS0tIGEvcGFj
a2FnZS9mcmVlc2NhbGUtaW14L2lteC12cHUtaGFudHJvL2lteC12cHUtaGFudHJvLmhhc2gKKysr
IGIvcGFja2FnZS9mcmVlc2NhbGUtaW14L2lteC12cHUtaGFudHJvL2lteC12cHUtaGFudHJvLmhh
c2gKQEAgLTEsNSArMSw1IEBACiAjIExvY2FsbHkgY29tcHV0ZWQ6Ci1zaGEyNTYgIDBlZjFmYjVj
NjY1M2MwOGYyZDI4MTJjNzJkZWRmM2U4YmViMDkxZGQ1YjNkNzBkNmUyNmY0MWJhYzRlYmZmYTcg
IGlteC12cHUtaGFudHJvLTEuMzYuMC0xOTRhMzA1LmJpbgotc2hhMjU2ICAzZjRhMTJjODJhODRi
ZDFjMzU3OGM5Yzk4NmQ2MzcxYTYxZDMzOTk1MjVlNzYyODhlY2JiYWUwMWRhZjBhZTI2ICBDT1BZ
SU5HCi1zaGEyNTYgIDM4ZjE0MDhkNmU5MzVjNTY0ZWZkOTExOWMzMTMyNjllNjQzYzFhODVjYWIx
ZDkzMGMzYzViZDcwYmMyNjE3NjkgIEVVTEEKK3NoYTI1NiAgMzA1OWI1YTAwNzc2ZDFhMDQyN2Fj
ZDgwM2FlZGZjZjliZjRiZDI0NTE0NDE4NmQ4M2EzMTg4ODg0NTI4MDYzOSAgaW14LXZwdS1oYW50
cm8tMS4zOS4wLWVhODA0ZDAuYmluCitzaGEyNTYgIDMwMDFjZjg0MDE4YzVjYjEwZDE4M2E2Nzhm
NmVjOGE5MjhjNzk3NjE2YmEwNmIzOThkN2NhOTNjMDc3OWFhYTIgIENPUFlJTkcKK3NoYTI1NiAg
YTgyOWIxMDlhMGE0MDZhNmEyZmVjMTk5NzVhMzMyZmVjYTIyNTA5OGNlNjZiZmFiMjIyMGM2NjA4
ZGI4ZmNlNSAgRVVMQQogc2hhMjU2ICA1ZDA2ZmY5ZGU1NmYwNzg4ZjZiMDkwYzkzMjI2ZGQ5NTE3
NjQxMjQ2MzVjNjg3Y2VmNjRmMjk3NzZjMmU4Y2Y4ICBTQ1ItaW14LXZwdS1oYW50cm8udHh0CmRp
ZmYgLS1naXQgYS9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LXZwdS1oYW50cm8vaW14LXZwdS1o
YW50cm8ubWsgYi9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LXZwdS1oYW50cm8vaW14LXZwdS1o
YW50cm8ubWsKaW5kZXggZGJkNTBiZmFlOGYzLi41OWM0MTJlMTA2NTIgMTAwNjQ0Ci0tLSBhL3Bh
Y2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtdnB1LWhhbnRyby9pbXgtdnB1LWhhbnRyby5taworKysg
Yi9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LXZwdS1oYW50cm8vaW14LXZwdS1oYW50cm8ubWsK
QEAgLTQsOCArNCw4IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1JTVhfVlBVX0hB
TlRST19WRVJTSU9OID0gMS4zNi4wCi1JTVhfVlBVX0hBTlRST19SRVZJU0lPTiA9IDE5NGEzMDUK
K0lNWF9WUFVfSEFOVFJPX1ZFUlNJT04gPSAxLjM5LjAKK0lNWF9WUFVfSEFOVFJPX1JFVklTSU9O
ID0gZWE4MDRkMAogSU1YX1ZQVV9IQU5UUk9fU0lURSA9ICQoRlJFRVNDQUxFX0lNWF9TSVRFKQog
SU1YX1ZQVV9IQU5UUk9fU09VUkNFID0gaW14LXZwdS1oYW50cm8tJChJTVhfVlBVX0hBTlRST19W
RVJTSU9OKS0kKElNWF9WUFVfSEFOVFJPX1JFVklTSU9OKS5iaW4KIElNWF9WUFVfSEFOVFJPX0RF
UEVOREVOQ0lFUyA9IGxpbnV4CgotLSAKMi41Mi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
