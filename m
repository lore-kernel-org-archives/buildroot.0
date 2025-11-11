Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 001DACCFA18
	for <buildroot@archiver.kernel.org>; Tue, 11 Nov 2025 14:50:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A31404095A;
	Tue, 11 Nov 2025 14:50:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QOUYAAP0ON1W; Tue, 11 Nov 2025 14:50:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6E674084C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6E674084C;
	Tue, 11 Nov 2025 14:50:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D32AB31C
 for <buildroot@buildroot.org>; Tue, 11 Nov 2025 14:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B9B08813BD
 for <buildroot@buildroot.org>; Tue, 11 Nov 2025 14:50:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jrzZrGJFZaB1 for <buildroot@buildroot.org>;
 Tue, 11 Nov 2025 14:50:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A5C00812DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5C00812DE
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A5C00812DE
 for <buildroot@buildroot.org>; Tue, 11 Nov 2025 14:50:32 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:7427:ac55:2702:f075])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 6B4546013D;
 Tue, 11 Nov 2025 15:50:24 +0100 (CET)
To: buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>, Julien Olivain <ju.o@free.fr>,
 Romain Naour <romain.naour@smile.fr>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
Date: Tue, 11 Nov 2025 15:50:08 +0100
Message-ID: <20251111145008.910172-1-ju.o@free.fr>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762872629;
 bh=Q5HKfTRps+TIS8imhHIhK95oONnkb6u9i8IqyX1It9o=;
 h=From:To:Cc:Subject:Date:From;
 b=sC78zMBrP5jejxLtflY6veeAinXBQdTYpQKW+2NznKLAR0SJmtA0sfhwYcY0HflFS
 0zKHFQhEWrnACEwQ+5ktaRbrPUg4ELL3vmqC5hGrejhcxvbwwanNc6w4mBPJW8w/4W
 a3XKEHNKyfD7grusb4XaM7c559OI+CbdelHrBi0SkFBn91aSq3b5misSSJGDr6A5dN
 Hn5lFNXV8mQhIXyIOfKcCY9+PfnyXGVtf/SJTEF4zNp72xsPi0DhBHSO1N3h6pibSw
 VzcFxlLld9x20He9nSsKsB/27nmBZml6s7fd8J7Bd+kylfHEV/0biyr/SJVtryFncD
 MvGBvmYOE8xSQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sC78zMBr
Subject: [Buildroot] [PATCH 1/1] boot/edk2: bump to version edk2-stable202508
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rm9yIHJlbGVhc2Ugbm90ZXMgc2luY2UgZWRrMi1zdGFibGUyMDI1MDUsIHNlZToKaHR0cHM6Ly9n
aXRodWIuY29tL3RpYW5vY29yZS9lZGsyL3JlbGVhc2VzL3RhZy9lZGsyLXN0YWJsZTIwMjUwOAoK
VGhpcyBjb21taXQgYWxzbyB1cGRhdGVzIHRoZSBlZGsyLXBsYXRmb3JtcyBwYWNrYWdlcyB3aXRo
IHRoZSBsYXN0CmNvbW1pdCBtZXJnZWQgYXQgdGhlIGVkazIgcmVsZWFzZSBkYXRlICgyMDI1LTA4
LTEyKSwgd2hpY2ggY29ycmVzcG9uZHMKdG8gY29tbWl0IFsxXS4KVGhlIGVkazItbm9uLW9zaSBw
YWNrYWdlIGlzIG5vdCB1cGRhdGVkIGJlY2F1c2UgaXQgZGlkIG5vdCByZWNlaXZlZAphbnkgY29t
bWl0IHNpbmNlIHRoZSBsYXN0IGVkazIgYnVtcC4KClRoaXMgY29tbWl0IGhhcyBiZWVuIHJ1bnRp
bWUgdGVzdGVkIHdpdGggdGVzdHMgdXNpbmcgRURLMiBwYWNrYWdlLAp3aXRoIGNvbW1hbmRzOgoK
ICAgIHN1cHBvcnQvdGVzdGluZy9ydW4tdGVzdHMgXAogICAgICAgIC1kIGRsIC1vIG91dHB1dF9m
b2xkZXIgXAogICAgICAgICAgICB0ZXN0cy5ib290LnRlc3RfZWRrMiBcCiAgICAgICAgICAgIHRl
c3RzLmJvb3QudGVzdF9ncnViLlRlc3RHcnViQUFyY2g2NEVGSSBcCiAgICAgICAgICAgIHRlc3Rz
LmJvb3QudGVzdF9ncnViLlRlc3RHcnViaTM4NkVGSSBcCiAgICAgICAgICAgIHRlc3RzLmJvb3Qu
dGVzdF9ncnViLlRlc3RHcnViUmlzY1Y2NEVGSSBcCiAgICAgICAgICAgIHRlc3RzLmJvb3QudGVz
dF9ncnViLlRlc3RHcnViWDg2NjRFRkkgXAogICAgICAgICAgICB0ZXN0cy5mcy50ZXN0X2lzbzk2
NjAuVGVzdElzbzk2NjBHcnViMkVGSSBcCiAgICAgICAgICAgIHRlc3RzLmZzLnRlc3RfaXNvOTY2
MC5UZXN0SXNvOTY2MEdydWIySHlicmlkIFwKICAgICAgICAgICAgdGVzdHMucGFja2FnZS50ZXN0
X2Z3dHMKCkl0IGhhcyBhbHNvIGJlZW4gcnVudGltZSB0ZXN0ZWQgKGJ5IGJvb3RpbmcgaW4gcWVt
dSkgd2l0aCBkZWZjb25maWdzCnVzaW5nIEVESzIgcGFja2FnZToKcWVtdV9hYXJjaDY0X3Nic2Ff
ZGVmY29uZmlnCnFlbXVfbG9vbmdhcmNoNjRfdmlydF9lZmlfZGVmY29uZmlnCnFlbXVfcmlzY3Y2
NF92aXJ0X2VmaV9kZWZjb25maWcKClsxXSBodHRwczovL2dpdGh1Yi5jb20vdGlhbm9jb3JlL2Vk
azItcGxhdGZvcm1zL2NvbW1pdC9kMWIyOTdiMmFhNjkzZmM3MjNhYzg4Mzg2NmM5MjVlOWQwNDI2
MGM5CgpDYzogRGljayBPbHNzb24gPGhpQHNlbnppbGxhLmlvPgpDYzogUm9tYWluIE5hb3VyIDxy
b21haW4ubmFvdXJAc21pbGUuZnI+CkNjOiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxl
QGFybS5jb20+ClRlc3RlZC1ieTogSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4KU2lnbmVk
LW9mZi1ieTogSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4KLS0tCiBib290L2VkazIvZWRr
Mi5oYXNoICAgICAgICAgICAgICAgICAgICAgICAgfCAyICstCiBib290L2VkazIvZWRrMi5tayAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAyICstCiBwYWNrYWdlL2VkazItcGxhdGZvcm1zL2Vk
azItcGxhdGZvcm1zLmhhc2ggfCAyICstCiBwYWNrYWdlL2VkazItcGxhdGZvcm1zL2VkazItcGxh
dGZvcm1zLm1rICAgfCAyICstCiA0IGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9ib290L2VkazIvZWRrMi5oYXNoIGIvYm9vdC9lZGsy
L2VkazIuaGFzaAppbmRleCA2OGZhZTQ3YWZjLi5hNzE3MGE2N2NjIDEwMDY0NAotLS0gYS9ib290
L2VkazIvZWRrMi5oYXNoCisrKyBiL2Jvb3QvZWRrMi9lZGsyLmhhc2gKQEAgLTEsMyArMSwzIEBA
CiAjIExvY2FsbHkgY2FsY3VsYXRlZAotc2hhMjU2ICBlMDUxMzBlMTA3ZDQ3NmNkZWMwODQ2ZjU1
ZjIyZTAwZmIyY2MwMDMwYjYwZmFmY2U0NjRhNmNmMTAxMzRkMThkICBlZGsyLWVkazItc3RhYmxl
MjAyNTA1LWdpdDQudGFyLmd6CitzaGEyNTYgIDFlNjc1YTk4ZjZiY2Y4MWZiYWUxMTQxNzc5Yjll
NzJlYzI4NzczZDBlNWVjNzdiZGNjODkwZjE0NTAyNjE1YTQgIGVkazItZWRrMi1zdGFibGUyMDI1
MDgtZ2l0NC50YXIuZ3oKIHNoYTI1NiAgNTBjZTIwYzljZmRiMGUxOWVlMzRmZTBhNTFmYzBhZmU5
NjFmNzQzNjk3YjA2ODM1OWFiMmY4NjJiNDk0ZGY4MCAgTGljZW5zZS50eHQKZGlmZiAtLWdpdCBh
L2Jvb3QvZWRrMi9lZGsyLm1rIGIvYm9vdC9lZGsyL2VkazIubWsKaW5kZXggMzYxMmM4NmZiMS4u
MDVlNDRjNzExYiAxMDA2NDQKLS0tIGEvYm9vdC9lZGsyL2VkazIubWsKKysrIGIvYm9vdC9lZGsy
L2VkazIubWsKQEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1F
REsyX1ZFUlNJT04gPSBlZGsyLXN0YWJsZTIwMjUwNQorRURLMl9WRVJTSU9OID0gZWRrMi1zdGFi
bGUyMDI1MDgKIEVESzJfU0lURSA9IGh0dHBzOi8vZ2l0aHViLmNvbS90aWFub2NvcmUvZWRrMgog
RURLMl9TSVRFX01FVEhPRCA9IGdpdAogRURLMl9MSUNFTlNFID0gQlNELTItQ2xhdXNlLVBhdGVu
dApkaWZmIC0tZ2l0IGEvcGFja2FnZS9lZGsyLXBsYXRmb3Jtcy9lZGsyLXBsYXRmb3Jtcy5oYXNo
IGIvcGFja2FnZS9lZGsyLXBsYXRmb3Jtcy9lZGsyLXBsYXRmb3Jtcy5oYXNoCmluZGV4IGY5OGZh
OGI2NDcuLmQwODhiY2MzNDIgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvZWRrMi1wbGF0Zm9ybXMvZWRr
Mi1wbGF0Zm9ybXMuaGFzaAorKysgYi9wYWNrYWdlL2VkazItcGxhdGZvcm1zL2VkazItcGxhdGZv
cm1zLmhhc2gKQEAgLTEsMyArMSwzIEBACiAjIExvY2FsbHkgY2FsY3VsYXRlZAotc2hhMjU2ICA0
MWNlNjMwN2ExNDc3ZTJjOWE4ZjgxZjNiOGY4NzZhNDhkZjhkNGZhNWExM2Y1OWVlZGI0NzY3MzIz
NDc1YTA3ICBlZGsyLXBsYXRmb3Jtcy05MmY3ZDY5ZThhYTMxZTBhZTA2ZDRkYWJiY2VlMTJmNGVi
ZGI3OGVkLnRhci5negorc2hhMjU2ICA0NDE3ZGI3OWJmYjhhOWJmNjAxZTk0ZTI5NWZlYzI3MGY5
OWVhYzM0NDdhNmQ0MThmZjI4ZWE3ZGQzNzRkOGQ2ICBlZGsyLXBsYXRmb3Jtcy1kMWIyOTdiMmFh
NjkzZmM3MjNhYzg4Mzg2NmM5MjVlOWQwNDI2MGM5LnRhci5negogc2hhMjU2ICA1MGNlMjBjOWNm
ZGIwZTE5ZWUzNGZlMGE1MWZjMGFmZTk2MWY3NDM2OTdiMDY4MzU5YWIyZjg2MmI0OTRkZjgwICBM
aWNlbnNlLnR4dApkaWZmIC0tZ2l0IGEvcGFja2FnZS9lZGsyLXBsYXRmb3Jtcy9lZGsyLXBsYXRm
b3Jtcy5tayBiL3BhY2thZ2UvZWRrMi1wbGF0Zm9ybXMvZWRrMi1wbGF0Zm9ybXMubWsKaW5kZXgg
N2M1MDk0ZmRkMy4uODZiOWZlYTk2MCAxMDA2NDQKLS0tIGEvcGFja2FnZS9lZGsyLXBsYXRmb3Jt
cy9lZGsyLXBsYXRmb3Jtcy5taworKysgYi9wYWNrYWdlL2VkazItcGxhdGZvcm1zL2VkazItcGxh
dGZvcm1zLm1rCkBAIC01LDcgKzUsNyBAQAogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAogIyBL
ZWVwIGluIHN5bmMgd2l0aCBsYXRlc3QgY29tbWl0IGFzIG9mIHRoZSByZWxlYXNlIGRhdGUgZm9y
IGJvb3QvZWRrMgotRURLMl9QTEFURk9STVNfVkVSU0lPTiA9IDkyZjdkNjllOGFhMzFlMGFlMDZk
NGRhYmJjZWUxMmY0ZWJkYjc4ZWQKK0VESzJfUExBVEZPUk1TX1ZFUlNJT04gPSBkMWIyOTdiMmFh
NjkzZmM3MjNhYzg4Mzg2NmM5MjVlOWQwNDI2MGM5CiBFREsyX1BMQVRGT1JNU19TSVRFID0gJChj
YWxsIGdpdGh1Yix0aWFub2NvcmUsZWRrMi1wbGF0Zm9ybXMsJChFREsyX1BMQVRGT1JNU19WRVJT
SU9OKSkKIEVESzJfUExBVEZPUk1TX0xJQ0VOU0UgPSBCU0QtMi1DbGF1c2UtUGF0ZW50CiBFREsy
X1BMQVRGT1JNU19MSUNFTlNFX0ZJTEVTID0gTGljZW5zZS50eHQKLS0gCjIuNTEuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
