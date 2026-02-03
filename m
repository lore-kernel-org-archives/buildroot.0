Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E52E8784F
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 17:23:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B141A6064F;
	Tue,  3 Feb 2026 17:23:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hcG8PlV0ljA1; Tue,  3 Feb 2026 17:23:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2AD560703
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770139393;
	bh=qizmVb2sgLYfDt+0J2Q/re+XmUVooEahNqatph8jcWQ=;
	h=From:Date:References:In-Reply-To:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=JIBxDDCAMf5hw8tnLiCKuIjAKQpMBiGRWQC9E/Xt+tPKGh49K9LJUTxy3n9EAN7C1
	 67WQnqX/lh/HjWnHzWHRp7KNF49vTQuxv2itwm++PdJvLLq4py52JhopQQyUUZhdyf
	 JpT5upT7kEIcHTGfdqcUgnbxfacK3h3K567NMf/BwkCgqZ+HMBmfJ4Ba56FJ+SGypI
	 EMWiZqbF7Ym5nWXy3BYeiCk3U9aJ5jCcQSDLoKFngc6qZ4JiKUD/Sb7GxcHX4cAgrC
	 X1QF2ErezEG9VJJ6EQuYnxFBj7rG62qpFtpVWouNnjF4VB6vG8vL5kUqWbko1e3SeW
	 2Du6IgRgG0rQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2AD560703;
	Tue,  3 Feb 2026 17:23:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D0AA4F4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 17:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE0FC40B1A
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 17:23:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EOIFN-XRG346 for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 17:23:08 +0000 (UTC)
X-Greylist: delayed 9877 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 03 Feb 2026 17:23:06 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4CFC740B16
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CFC740B16
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.33.248.196;
 helo=1.mo584.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 1.mo584.mail-out.ovh.net (1.mo584.mail-out.ovh.net
 [178.33.248.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4CFC740B16
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 17:23:06 +0000 (UTC)
Received: from director5.ghost.mail-out.ovh.net (unknown [10.110.37.160])
 by mo584.mail-out.ovh.net (Postfix) with ESMTP id 4f55h21DC0z7w85
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:38:26 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-5twcp (unknown [10.110.101.93])
 by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id CBCBD10017C;
 Tue,  3 Feb 2026 14:38:25 +0000 (UTC)
Received: from armadeus.com ([37.59.142.98])
 by ghost-submission-7d8d68f679-5twcp with ESMTPSA
 id DBaCFGAIgmkRehQA2wKZ7w:T4
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Tue, 03 Feb 2026 14:38:25 +0000
X-OVh-ClientIp: 90.126.104.208
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Tue, 03 Feb 2026 15:38:14 +0100
MIME-Version: 1.0
Message-Id: <20260203-bump-imx-packages-lf-6-12-49-2-2-0-v1-3-548f3fc77a59@armadeus.com>
References: <20260203-bump-imx-packages-lf-6-12-49-2-2-0-v1-0-548f3fc77a59@armadeus.com>
In-Reply-To: <20260203-bump-imx-packages-lf-6-12-49-2-2-0-v1-0-548f3fc77a59@armadeus.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.3
X-Ovh-Tracer-Id: 604045302887541621
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTFR6Hs/Lkwa25FSwhn4cx65/69OWS1yyehCdGUP1UuxFLzyyfQkv/Wy/UyrN2853hOMVGJ0lkYrIQhh4Eu1Zul3jdGNbHZKgQdqViE9yYVc7cY6dzXqX0cmloLnrpxM5VXlVDzGoDbeLjq4jiAjbPAfEthW/3blWnezyNLucPkJhOALntjJK+a9QTaAmL1a+sgfoF2SgOKFNbilU06FLsz+vUP0G3Gtk02CX2rete6BAEZr4SxNi42if8C+WkAm7DXAmCymRy8lDk7kl3oAvTrn6NU79ZkGGfJkN+9NE+VB6jWTr81E0C6n4gJ8QBctNRbOcBRM23FKOkYIkUHIlb8FSmQONQwkvGhYEQNoBeLhdYduslMOX7HfQiZYypzX8q8tP69uc+KP+9juabs5y8yqBemDdYnwFKhRqZlsNjD9S4gobpNvdnGYj9rMuhKrzCx1lciCrVoOQxS2uK/d1597o4gHHgua8zVqpVbhu9E2pBBblP8rIQ4CbBmAXh23FseGMf+EFst3C9UgJ7W4UOBhJ679q2GCkko8CdZTscXtaxQ+LK7PGPNFlzR/3nHG4y2z8RTECLOv13r3IgK9vuWzDxp0bEhnBok0uN8Zr0Cx3DlR+HfWX/upaQoQ4DdTAAfsVMp1qjRg5g2Zn6q2swm5b8HNsjfrm3o0tGEpsgDLQA
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=3VyS9X2+M1AgIeD3BZrQ3LkCQQG7ibUwKOr9y8eSDAg=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1770129506; v=1;
 b=TbkJHU0sBp/SamM9KYWnxVhwu7CJn+7CjuXYvUI4UnJkgEkrR/bSUYgqV73NVeaW87Amv7yz
 LEY/bqDUxPRF/3f/F/kQOBj/Z71mCk2K0E3wt4WfV4L0ZIyz0Ec3a26Tnx++8nHW+YogxfPB0Dd
 bIhvgnVk9gTWS5jermu17b286uEtRdfcchRsy0ZtPIrMNEqcHUZnsQb7VTlhc4Oh40dZnwY7hRj
 sQAt1Ye2lbaFj7Cdrqjv5B3TXWfikG5mj0zxqEoCZ4T3VfqoELz1AsHQTrkB/z9PtwCaf6qwoSN
 7LocsOVPCE0wtXweIR9eyNwKp/MnJjTZ07ORhwmSGNrBA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=TbkJHU0s
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002a4ede19c-c12f-4f0c-8fa5-e60f2e1a0c0d,
 004BD5E907DC429EAD4B1A0856BA767B03FD8B65)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 3/9] package/freescale-imx/imx-gpu-g2d: bump
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
aW14LWdwdS1nMmQvaW14LWdwdS1nMmQuaGFzaCB8IDggKysrKy0tLS0KIHBhY2thZ2UvZnJlZXNj
YWxlLWlteC9pbXgtZ3B1LWcyZC9pbXgtZ3B1LWcyZC5tayAgIHwgNiArKystLS0KIDIgZmlsZXMg
Y2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtZ3B1LWcyZC9pbXgtZ3B1LWcyZC5oYXNoIGIvcGFja2Fn
ZS9mcmVlc2NhbGUtaW14L2lteC1ncHUtZzJkL2lteC1ncHUtZzJkLmhhc2gKaW5kZXggNGJkODMw
OTBhOGRkLi41OGZiYjcyYWFiN2QgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9p
bXgtZ3B1LWcyZC9pbXgtZ3B1LWcyZC5oYXNoCisrKyBiL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9p
bXgtZ3B1LWcyZC9pbXgtZ3B1LWcyZC5oYXNoCkBAIC0xLDYgKzEsNiBAQAogIyBMb2NhbGx5IGNh
bGN1bGF0ZWQKLXNoYTI1NiAgZTZjMzM2YzBiODc2ZWZhYjc1OThhMmQ3ODE3MTExNzcyMjg0NDg3
ZjY0NmQ1ZDgzYzQwMDY5MmYyY2RmZWJlMyAgaW14LWdwdS1nMmQtNi40LjExLnAzLjAtYWFyY2g2
NC1jNjAwZDAzLmJpbgotc2hhMjU2ICA2ZTFhNDJmMmM1NzA1ODJiODAzOGQxYjVjODZkYmRjZDY0
NWU3NWNjMTBhMWRiMjNlNzE2ZjY2MmQxYzEzMjlmICBpbXgtZ3B1LWcyZC02LjQuMTEucDMuMC1h
cm0tYzYwMGQwMy5iaW4KLXNoYTI1NiAgM2Y0YTEyYzgyYTg0YmQxYzM1NzhjOWM5ODZkNjM3MWE2
MWQzMzk5NTI1ZTc2Mjg4ZWNiYmFlMDFkYWYwYWUyNiAgQ09QWUlORwotc2hhMjU2ICAzOGYxNDA4
ZDZlOTM1YzU2NGVmZDkxMTljMzEzMjY5ZTY0M2MxYTg1Y2FiMWQ5MzBjM2M1YmQ3MGJjMjYxNzY5
ICBFVUxBCitzaGEyNTYgIDM1MzAxMjBmMWY3OWVkY2U1MjU3NDJiZjVlYTI3MWY3MDAwN2Q1Mjkx
YTAxNWUyNTE4YTU1OTI1OTkyYjYwMjMgIGlteC1ncHUtZzJkLTYuNC4xMS5wNC4yLWFhcmNoNjQt
ODQ2ZTEyZS5iaW4KK3NoYTI1NiAgM2Q1YjdkOGYzNzYwZTAwMzJhYWFiZDI4NzhmNjdlMmQ4ZmQ4
ODM3M2FmMjI2NmIwNjM1Njg5ZTc5OWRhZmEwNyAgaW14LWdwdS1nMmQtNi40LjExLnA0LjItYXJt
LTg0NmUxMmUuYmluCitzaGEyNTYgIDMwMDFjZjg0MDE4YzVjYjEwZDE4M2E2NzhmNmVjOGE5Mjhj
Nzk3NjE2YmEwNmIzOThkN2NhOTNjMDc3OWFhYTIgIENPUFlJTkcKK3NoYTI1NiAgYTgyOWIxMDlh
MGE0MDZhNmEyZmVjMTk5NzVhMzMyZmVjYTIyNTA5OGNlNjZiZmFiMjIyMGM2NjA4ZGI4ZmNlNSAg
RVVMQQogc2hhMjU2ICAzZjNiODE3Y2E5NDkwZmJlODlhODMzOTVhMDk2MTEyMmFjYTEzOGJmNDNh
Y2Q4NjljNmNhMDg2NTAyYTFlMTMxICBTQ1ItaW14LWdwdS1nMmQudHh0CmRpZmYgLS1naXQgYS9w
YWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LWdwdS1nMmQvaW14LWdwdS1nMmQubWsgYi9wYWNrYWdl
L2ZyZWVzY2FsZS1pbXgvaW14LWdwdS1nMmQvaW14LWdwdS1nMmQubWsKaW5kZXggNGQyOTk3NGRi
MTZlLi4yNzJmNDI5YzExNWUgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgt
Z3B1LWcyZC9pbXgtZ3B1LWcyZC5taworKysgYi9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LWdw
dS1nMmQvaW14LWdwdS1nMmQubWsKQEAgLTQsMTEgKzQsMTEgQEAKICMKICMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjCiAKLUlNWF9HUFVfRzJEX1JFVklTSU9OID0gYzYwMGQwMworSU1YX0dQVV9HMkRf
UkVWSVNJT04gPSA4NDZlMTJlCiBpZmVxICgkKEJSMl9hYXJjaDY0KSx5KQotSU1YX0dQVV9HMkRf
VkVSU0lPTiA9IDYuNC4xMS5wMy4wLWFhcmNoNjQKK0lNWF9HUFVfRzJEX1ZFUlNJT04gPSA2LjQu
MTEucDQuMi1hYXJjaDY0CiBlbHNlCi1JTVhfR1BVX0cyRF9WRVJTSU9OID0gNi40LjExLnAzLjAt
YXJtCitJTVhfR1BVX0cyRF9WRVJTSU9OID0gNi40LjExLnA0LjItYXJtCiBlbmRpZgogSU1YX0dQ
VV9HMkRfU0lURSA9ICQoRlJFRVNDQUxFX0lNWF9TSVRFKQogSU1YX0dQVV9HMkRfU09VUkNFID0g
aW14LWdwdS1nMmQtJChJTVhfR1BVX0cyRF9WRVJTSU9OKS0kKElNWF9HUFVfRzJEX1JFVklTSU9O
KS5iaW4KCi0tIAoyLjUyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
