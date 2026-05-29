Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3748BCD6E4A
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 13:27:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D238D42142;
	Fri, 29 May 2026 13:27:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dyLmZXMPnhbm; Fri, 29 May 2026 13:27:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E49D042143
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780061275;
	bh=VxIDazFM8uj+870+kbnXQYE9pudAFWnpGRnoYoDCMUY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=omAK1QBEazisp86PPVp+mz/yuHc0zRIgKvIo9p07nHRrkLkICu0Lbtk6t6cLu5N3s
	 T540WxM1Qfx3t+zw/qZDvVg0/8mvGblTKl9z2fNaclam2EIIJtJCGKg29wLKocHJkx
	 kIfscLHMV7+T2s8/3puXku67dO20Axe1HMbaLxHLxKs85lllSOo0qtdgWzXGwi1wLY
	 GpY+lpoacge5ifheA3jSiPbE+qzzHpBdm3XjaqJ0wnd/B0U/e3rB/Hf5fUnfqKHwTw
	 0QSQcs+zWb67QpM+lb9CwF0fID/qDLoku5vkBIDveGBsK3QmPdOHTt2UwKF4fuEW81
	 KT33mtzpJ9LGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E49D042143;
	Fri, 29 May 2026 13:27:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 993C1288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 13:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71C0B41E66
 for <buildroot@buildroot.org>; Fri, 29 May 2026 13:27:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9I7PZBe5W15e for <buildroot@buildroot.org>;
 Fri, 29 May 2026 13:27:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4EF46403BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4EF46403BD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4EF46403BD
 for <buildroot@buildroot.org>; Fri, 29 May 2026 13:27:50 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a09fc.dip0.t-ipconnect.de [91.58.9.252])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1AFD1A4C234F
 for <buildroot@buildroot.org>; Fri, 29 May 2026 15:27:48 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50584)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wSxFb-000000006ii-15I7
 for buildroot@buildroot.org; Fri, 29 May 2026 13:27:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 15:27:44 +0200
Message-ID: <20260529132747.1269960-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780061268;
 bh=cjFoL5OEH/+eS8LDOmN6FzxXg3AQipWfgmpA/a+U/c8=;
 h=From:To:Subject:Date:From;
 b=KVEgc9f4oo1H9KFbFV15ssO4kmD9Sa1/rrpPmyd52Q4HZL5vij4wjQgM3xCyV0Q0V
 8tkOoiOCPvKJsRYUcZwtkm4CrYs5gPq1R7pKEGExI1L/RhhoX6LThPDusgAD/6LW93
 VD0arO7mcG487PhrlZ/Yb2q7Ra8QPegt/W7KaYAmAihuTCATG+hz0LhZVOzVjOjOKl
 V2ssYAdJA1DmrR/IXxIHihtlqL4UtYvpJP9yq7VB0NRitPIahu7acC2Z/36jEBsK1N
 NxTNimRXzqXM6djI/OWkoZqzCz5DOVULrSbjAyHoVpEKs/gclXRRlp+60WdmHlbTXD
 AkHIxABHCHdmw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=KVEgc9f4
Subject: [Buildroot] [PATCH 1/3] package/freeswitch: fix musl build
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rml4ZXM6Cmh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy9iMTQvYjE0NDgx
Njc0ZWYwZTI5MmM3Y2FmNWM3ZGI0NjJiYmJiOTk3ZmMzNC8KClNpZ25lZC1vZmYtYnk6IEJlcm5k
IEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+Ci0tLQpHaXRsYWIgcGlwZWxpbmUgcGFzc2VkOgpodHRw
czovL2dpdGxhYi5jb20vYmt1aGxzL2J1aWxkcm9vdC8tL3BpcGVsaW5lcy8yNTYxNzIwODYxCgog
Li4uL2ZyZWVzd2l0Y2gvMDAwOC1hcHItZml4LW11c2wtYnVpbGQucGF0Y2ggIHwgNjUgKysrKysr
KysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDY1IGluc2VydGlvbnMoKykKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBwYWNrYWdlL2ZyZWVzd2l0Y2gvMDAwOC1hcHItZml4LW11c2wtYnVpbGQucGF0
Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2ZyZWVzd2l0Y2gvMDAwOC1hcHItZml4LW11c2wtYnVp
bGQucGF0Y2ggYi9wYWNrYWdlL2ZyZWVzd2l0Y2gvMDAwOC1hcHItZml4LW11c2wtYnVpbGQucGF0
Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uMTI2YzUzOTk4MwotLS0g
L2Rldi9udWxsCisrKyBiL3BhY2thZ2UvZnJlZXN3aXRjaC8wMDA4LWFwci1maXgtbXVzbC1idWls
ZC5wYXRjaApAQCAtMCwwICsxLDY1IEBACitGcm9tIDgxYmJmMDU4MzhmYzI0YjIyMWRlYmZkZjc1
YWI4YTRjN2U3YjI2MGMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBCZXJuZCBLdWhs
cyA8YmVybmRAa3VobHMubmV0PgorRGF0ZTogRnJpLCAyOSBNYXkgMjAyNiAwODoxNDozMiArMDIw
MAorU3ViamVjdDogW1BBVENIXSBhcHI6IGZpeCBtdXNsIGJ1aWxkCitNSU1FLVZlcnNpb246IDEu
MAorQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CitDb250ZW50LVRyYW5z
ZmVyLUVuY29kaW5nOiA4Yml0CisKK3N0cmVycm9yX3Igb24gbXVzbCBhbHdheXMgcmV0dXJucyBh
biBpbnQgc2luY2UgaXRzIGFkZGl0aW9uIGJhY2sgaW4gMjAxMQord2l0aAoraHR0cHM6Ly9naXQu
bXVzbC1saWJjLm9yZy9jZ2l0L211c2wvY29tbWl0L3NyYy9zdHJpbmcvc3RyZXJyb3Jfci5jP2lk
PTBiNDRhMDMxNWI0N2RkOGVjZWQ5ZjNiN2YzMTU4MGNmMTRiYmZjMDEKKworQWRkIGRlZmluZXMg
Y3JlYXRlZCBieSBmcmVlc3dpdGNoIGNvbmZpZ3VyZSB0byBhcHIgc3VicHJvamVjdCB0byBmaXgg
dGhlCitidWlsZCBlcnJvcjoKKworbWlzYy91bml4L2Vycm9yY29kZXMuYzogSW4gZnVuY3Rpb24g
4oCYbmF0aXZlX3N0cmVycm9y4oCZOgorbWlzYy91bml4L2Vycm9yY29kZXMuYzozNTg6OTogZXJy
b3I6IGFzc2lnbm1lbnQgdG8g4oCYY29uc3QgY2hhciAq4oCZIGZyb20KKyDigJhpbnTigJkgbWFr
ZXMgcG9pbnRlciBmcm9tIGludGVnZXIgd2l0aG91dCBhIGNhc3QgWy1XaW50LWNvbnZlcnNpb25d
CisgIDM1OCB8ICAgICBtc2cgPSBzdHJlcnJvcl9yKHN0YXRjb2RlLCBidWYsIGJ1ZnNpemUpOwor
CitVcHN0cmVhbTogaHR0cHM6Ly9naXRodWIuY29tL3NpZ25hbHdpcmUvZnJlZXN3aXRjaC9wdWxs
LzMwNDYKKworU2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KKy0t
LQorIGxpYnMvYXByL21pc2MvdW5peC9lcnJvcmNvZGVzLmMgfCAxMSArKysrKysrKysrKworIDEg
ZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspCisKK2RpZmYgLS1naXQgYS9saWJzL2Fwci9t
aXNjL3VuaXgvZXJyb3Jjb2Rlcy5jIGIvbGlicy9hcHIvbWlzYy91bml4L2Vycm9yY29kZXMuYwor
aW5kZXggM2JlMGIyNWI5My4uOTNjNDI4ZGY2MiAxMDA2NDQKKy0tLSBhL2xpYnMvYXByL21pc2Mv
dW5peC9lcnJvcmNvZGVzLmMKKysrKyBiL2xpYnMvYXByL21pc2MvdW5peC9lcnJvcmNvZGVzLmMK
K0BAIC0yNSw2ICsyNSw5IEBACisgI2lmZGVmIEhBVkVfRExGQ05fSAorICNpbmNsdWRlIDxkbGZj
bi5oPgorICNlbmRpZgorKyNpZm5kZWYgV0lOMzIKKysjaW5jbHVkZSAiLi4vLi4vLi4vc3JjL2lu
Y2x1ZGUvc3dpdGNoX3ByaXZhdGUuaCIKKysjZW5kaWYKKyAKKyAvKgorICAqIHN0dWZmYnVmZmVy
IC0gbGlrZSBmc3ByX2NweXN0cm4oKSBidXQgcmV0dXJucyB0aGUgYWRkcmVzcyBvZiB0aGUKK0BA
IC0zNTIsMTIgKzM1NSwyMCBAQCBjb25zdCBjaGFyICpzdHJlcnJvcl9yKGZzcHJfc3RhdHVzX3Qs
IGNoYXIgKiwgZnNwcl9zaXplX3QpOworIHN0YXRpYyBjaGFyICpuYXRpdmVfc3RyZXJyb3IoZnNw
cl9zdGF0dXNfdCBzdGF0Y29kZSwgY2hhciAqYnVmLAorICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgZnNwcl9zaXplX3QgYnVmc2l6ZSkKKyB7CisrI2lmIGRlZmluZWQoU1RSRVJST1JfUl9D
SEFSX1ApCisgICAgIGNvbnN0IGNoYXIgKm1zZzsKKysjZWxzZQorKyAgICBpbnQgbXNnOworKyNl
bmRpZgorIAorICAgICBidWZbMF0gPSAnXDAnOworICAgICBtc2cgPSBzdHJlcnJvcl9yKHN0YXRj
b2RlLCBidWYsIGJ1ZnNpemUpOworICAgICBpZiAoYnVmWzBdID09ICdcMCcpIHsgLyogbGliYyBk
aWRuJ3QgdXNlIG91ciBidWZmZXIgKi8KKysjaWYgZGVmaW5lZChTVFJFUlJPUl9SX0NIQVJfUCkK
KyAgICAgICAgIHJldHVybiBzdHVmZmJ1ZmZlcihidWYsIGJ1ZnNpemUsIG1zZyk7CisrI2Vsc2UK
KysgICAgICAgIHJldHVybiBzdHVmZmJ1ZmZlcihidWYsIGJ1ZnNpemUsIChjb25zdCBjaGFyKilt
c2cpOworKyNlbmRpZgorICAgICB9CisgICAgIGVsc2UgeworICAgICAgICAgcmV0dXJuIGJ1ZjsK
Ky0tIAorMi40Ny4zCisKLS0gCjIuNDcuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
