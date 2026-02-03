Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EFCFE8783D
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 14:55:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07F2E8040A;
	Tue,  3 Feb 2026 14:55:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4t6ULhCLanyc; Tue,  3 Feb 2026 14:55:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 154AC81E64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770130543;
	bh=gEpG0DBV5hWYwGVA2t6KBmXDgFMUc2No0o+lGNOj7aQ=;
	h=From:Date:References:In-Reply-To:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=mf9I3plMYTQhh27PAHrzSenPMqj9xYWbSxmOiXkwMej8MT/ge3UsGrrN/YnyMZGaz
	 yMMeM5RRaPqkHsUow/xuvE81liHewZjv3R0WPLg+ESwjHQvlheRBK+Ljwj84nS6f75
	 aLsXkIkhB96A3FAbzc8rymFOf8jyso2++Dir2PLgwk2VTNGYT8aQnOYkTkFOiLRyCl
	 iQH6kr55oNwvd/FVPO1USSx9JT9ouQv9TUuCpbprpYQCgmJHdotsGfuXvqVXXEPPo8
	 Nwxrg1SWFRt8AapH2+mn7ZjJ2XLwe3OvtrMN4z/kd9Ri+Njsg/FGpO3HFbdMwiWWGP
	 e+0IpNYfqCzyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 154AC81E64;
	Tue,  3 Feb 2026 14:55:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F3CBA13D
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DEE6681E64
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:55:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FXlf52s9cvKa for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 14:55:40 +0000 (UTC)
X-Greylist: delayed 606 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 03 Feb 2026 14:55:39 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D57058040A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D57058040A
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=46.105.58.60;
 helo=3.mo575.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 3.mo575.mail-out.ovh.net (3.mo575.mail-out.ovh.net
 [46.105.58.60])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D57058040A
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:55:39 +0000 (UTC)
Received: from director5.ghost.mail-out.ovh.net (unknown [10.110.58.221])
 by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4f55h33mbfz60td
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:38:27 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-5twcp (unknown [10.110.101.93])
 by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 3ACA710017C;
 Tue,  3 Feb 2026 14:38:27 +0000 (UTC)
Received: from armadeus.com ([37.59.142.98])
 by ghost-submission-7d8d68f679-5twcp with ESMTPSA
 id DBaCFGAIgmkRehQA2wKZ7w:T7
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Tue, 03 Feb 2026 14:38:27 +0000
X-OVh-ClientIp: 90.126.104.208
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Tue, 03 Feb 2026 15:38:17 +0100
MIME-Version: 1.0
Message-Id: <20260203-bump-imx-packages-lf-6-12-49-2-2-0-v1-6-548f3fc77a59@armadeus.com>
References: <20260203-bump-imx-packages-lf-6-12-49-2-2-0-v1-0-548f3fc77a59@armadeus.com>
In-Reply-To: <20260203-bump-imx-packages-lf-6-12-49-2-2-0-v1-0-548f3fc77a59@armadeus.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.3
X-Ovh-Tracer-Id: 604326777749695349
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTFR6Hs/Lkwa25FSwhn4cx65/69OWS1yyehCdGUP1UuxFLzyyfQkv/Wy/UyrN2853hOMVGJ0lkYrIQhh4Eu1Zul3jdGNbHZKgQdqViE9yYVc7cY6dzXqX0cmloLnrpxM5VXlVDzGoDbeLjq4jiAjbPAfEthW/3blWnezyNLucPkJhOALntjJK+a9QTaAmL1a+sgfoF2SgOKFNbilU06FLsz+vUP0G3Gtk02CX2rete6BAEZr4SxNi42if8C+WkAm7DXAmCymRy8lDk7kl3oAvTrn6NU79ZkGGfJkN+9NE+VB6jWTr81E0C6n4gJ8QBctNRbOcBRM23FKOkYIkUHIlb8FTVqqvH99XkvxDsFlXzSR9Ibk5wkUtgKAnpAra1VDRSRkGfatKnr2EOvvJMV6142J8j6FZrLOtMBxl51lq4DP5u4Z9PohnKcmo0NLZw880Tl2DZnveitRSRb4XyuG8GfSvEI23Uxv/2PBK9jrhBVQBtEYHGrwAfMUfndMXzlxKRJ2uaYCkGiviboNMWczsrXyad1ucnRz7Ulsl1SJO+oLGdoS+wIkTUZGUl4MhKo7e2As4sHWwLU6xTjD+KuBbmHCYZuGnKFR5uQUT9/XCR9B3IkhPnOLKkxHdMPHmtF1PxVIPGRcmB67r5DAFfxPYamL+clZNpcqlRQGCNhmSiw4Hw
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=7ftBeynb066MKymsUa6eQQQgVpEpYEj/M2AxoGDcrdI=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1770129507; v=1;
 b=lsafB0nJXkC7Fgcrtpgu3vCZVNgGz+YAHPhmJWc/q6TdQ0PXGF9mnl3fOrqSvd6/BvFHyERh
 NXZ6y/LmrxiJ4ixdbsNhR1+/F1Pnd9C+pZx7Lqsu3THjwJRmuadrDBTp5UXoSmslWqOSHeDcS6E
 ybOHpVNtY+75Yx/Ifka4GWuGGxtAWJXNwUcCa0s3vTgWfhSiSi0YM8qXJOV4nbqcJ2g96OMWbbC
 bOlnAe7aUP/Y/qYU60CFD9PUuIk0oI4k/cr/I4YVQCOzZBCePVQWm5kqJoPH+scTG7M++2s2yMg
 yfMu6XGicAgkL4RcAhmOgoyvAPmChk4goLPxYtnVRuWkA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=lsafB0nJ
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-98R0025eaebb39-853d-4e22-9984-4fa54700dd1c,
 004BD5E907DC429EAD4B1A0856BA767B03FD8B65)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 6/9]
 package/freescale-imx/imx-vpu-hantro-daemon: bump version to 1.8.0
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
Mi40OV8yLjIuMCIuCgpTaWduZWQtb2ZmLWJ5OiBTw6liYXN0aWVuIFN6eW1hbnNraSA8c2ViYXN0
aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20+Ci0tLQogLi4uL2ZyZWVzY2FsZS1pbXgvaW14LXZw
dS1oYW50cm8tZGFlbW9uL2lteC12cHUtaGFudHJvLWRhZW1vbi5oYXNoICAgIHwgMiArLQogcGFj
a2FnZS9mcmVlc2NhbGUtaW14L2lteC12cHUtaGFudHJvLWRhZW1vbi9pbXgtdnB1LWhhbnRyby1k
YWVtb24ubWsgIHwgNCArKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LXZwdS1o
YW50cm8tZGFlbW9uL2lteC12cHUtaGFudHJvLWRhZW1vbi5oYXNoIGIvcGFja2FnZS9mcmVlc2Nh
bGUtaW14L2lteC12cHUtaGFudHJvLWRhZW1vbi9pbXgtdnB1LWhhbnRyby1kYWVtb24uaGFzaApp
bmRleCA2MWY3ZjM4NDYyY2EuLmU2YTk0YjI4NDgwNSAxMDA2NDQKLS0tIGEvcGFja2FnZS9mcmVl
c2NhbGUtaW14L2lteC12cHUtaGFudHJvLWRhZW1vbi9pbXgtdnB1LWhhbnRyby1kYWVtb24uaGFz
aAorKysgYi9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LXZwdS1oYW50cm8tZGFlbW9uL2lteC12
cHUtaGFudHJvLWRhZW1vbi5oYXNoCkBAIC0xLDQgKzEsNCBAQAogIyBMb2NhbGx5IGNvbXB1dGVk
Ogotc2hhMjU2ICBlNzgwNmE5MmQ0YTVhYjUxYjc2ZDllZGVmNTE3NWE5NTYyNWM0YWMzY2FiNDY3
ZmUxNTE5YmIwY2UxNmU2NTM1ICBpbXgtdnB1LWhhbnRyby1kYWVtb24tMS41LjAtMzIwMGU2OC50
YXIuZ3oKK3NoYTI1NiAgNGQwYTZiYjA2YzY3MWNmMDA5MWRkM2M3NTZjZmMzNmUzODFmZmFhNzc3
N2IyMTZlMjg2MjVkNTM2ODkzMGM5MyAgaW14LXZwdS1oYW50cm8tZGFlbW9uLTEuOC4wLTZkM2Vj
NzMudGFyLmd6CiBzaGEyNTYgIGJiNjQ1ZjAyYjI2MDk1NWYzMzMzNDgxMDBlNDBhZjc2MjUzZTJj
ZDhiMTE2YmFjMDQ3MjMwNDM5ZGQ1M2VjNWEgIExJQ0VOU0UudHh0CiBzaGEyNTYgIGM2MTE3NjA0
OGY3NDk1MGMwODQ5ZDkxYjRiNmIzMGUzMzVlMDUwNDYyYTg5NTBiODlhNGU2ZjM1YzdmZTU3N2Ig
IFNDUi1pbXgtdnB1LWhhbnRyby1kYWVtb24udHh0CmRpZmYgLS1naXQgYS9wYWNrYWdlL2ZyZWVz
Y2FsZS1pbXgvaW14LXZwdS1oYW50cm8tZGFlbW9uL2lteC12cHUtaGFudHJvLWRhZW1vbi5tayBi
L3BhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtdnB1LWhhbnRyby1kYWVtb24vaW14LXZwdS1oYW50
cm8tZGFlbW9uLm1rCmluZGV4IGNiMGEwNzgwNzhhNS4uMmIzZDA0MjZmOWY0IDEwMDY0NAotLS0g
YS9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LXZwdS1oYW50cm8tZGFlbW9uL2lteC12cHUtaGFu
dHJvLWRhZW1vbi5taworKysgYi9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LXZwdS1oYW50cm8t
ZGFlbW9uL2lteC12cHUtaGFudHJvLWRhZW1vbi5tawpAQCAtNCw4ICs0LDggQEAKICMKICMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjCiAKLUlNWF9WUFVfSEFOVFJPX0RBRU1PTl9WRVJTSU9OID0gMS41
LjAKLUlNWF9WUFVfSEFOVFJPX0RBRU1PTl9SRVZJU0lPTiA9IDMyMDBlNjgKK0lNWF9WUFVfSEFO
VFJPX0RBRU1PTl9WRVJTSU9OID0gMS44LjAKK0lNWF9WUFVfSEFOVFJPX0RBRU1PTl9SRVZJU0lP
TiA9IDZkM2VjNzMKIElNWF9WUFVfSEFOVFJPX0RBRU1PTl9TT1VSQ0UgPSBpbXgtdnB1LWhhbnRy
by1kYWVtb24tJChJTVhfVlBVX0hBTlRST19EQUVNT05fVkVSU0lPTiktJChJTVhfVlBVX0hBTlRS
T19EQUVNT05fUkVWSVNJT04pLnRhci5negogSU1YX1ZQVV9IQU5UUk9fREFFTU9OX1NJVEUgPSAk
KEZSRUVTQ0FMRV9JTVhfU0lURSkKIElNWF9WUFVfSEFOVFJPX0RBRU1PTl9MSUNFTlNFID0gTlhQ
IFNlbWljb25kdWN0b3IgU29mdHdhcmUgTGljZW5zZSBBZ3JlZW1lbnQKCi0tIAoyLjUyLjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
