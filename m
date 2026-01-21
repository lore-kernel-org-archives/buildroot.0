Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3878CD262B2
	for <buildroot@archiver.kernel.org>; Wed, 21 Jan 2026 07:42:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1D8783DC5;
	Wed, 21 Jan 2026 07:42:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M0C0iXtreMBl; Wed, 21 Jan 2026 07:42:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFD2383DCC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768981347;
	bh=1B0Z9dOrsimy1lzx7Juxq4cI6kTis/+6nAP4gjv2AdM=;
	h=From:Date:References:Cc:In-Reply-To:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EAcpp41vqGxHlmj4XnyE0yZJZqO74Q/zaaKByWJc2AGNgz86wdq58o1NOFzjKbFCp
	 7gJsWoTHuTA7VaW411Hma4ZQAQ3didRiMhLZ4h0s9K9ya8qBKcY60YrosR6hgBPX3c
	 QAywvCHkVPK8TmvYyn4OYztFbu4/uwZXSS3K/VSEoeXonmyLrBXwbyGUx1Ymo+xo2d
	 LC9HBZ8LFCJZwamVYZaTlEaUgXOaH+woUjsZg9I5KqctJrzvqUVEkoytfm+i8vZRcx
	 VmfaCtKKnxDPy8cqgcRgSujdI3GRzBUTmcLtW4F4Q1sydgxogfY8S81QfNd1vzOM/X
	 Jy0EwBU3fovTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFD2383DCC;
	Wed, 21 Jan 2026 07:42:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 89E57160
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 07:42:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6613E60FE3
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 07:42:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wnt2bgtZItfD for <buildroot@buildroot.org>;
 Wed, 21 Jan 2026 07:42:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.133;
 helo=smtpdh18-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4E21260FE6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E21260FE6
Received: from smtpdh18-2.aruba.it (smtpdh18-2.aruba.it [62.149.155.133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4E21260FE6
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 07:42:22 +0000 (UTC)
Received: from smtpclient.apple ([84.33.84.190]) by Aruba SMTP with ESMTPSA
 id iSr5vD3IR5SteiSr6vOhtk; Wed, 21 Jan 2026 08:42:20 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Wed, 21 Jan 2026 08:42:19 +0100
Message-Id: <70549457-9F2A-412B-9756-3E45D724B853@benettiengineering.com>
References: <20260121011429.1442015-1-james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20260121011429.1442015-1-james.hilliard1@gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailer: iPhone Mail (23C55)
X-CMAE-Envelope: MS4xfLqnwFc611LAmTqvTgmMwyNaa1VVs/s6uDhfjRqgq8lbqmhzJj0qkbgdEVEW3lyKpqlhjGC1I9dO36VJA4rIhvt4SzYJxHYjE6MkUfmH0wg7OS4d7Zji
 vz7mrzqT/04x1GjNcF9eAaCNKJd08PEXbxPoc6+g2khAfVXKqVdkO3BRZGrx0mnx8KIdf7fF/NIu0Uk5SjQlicwlwKMf74sOO5QSjVY7hqgnoEdEgeAFRUIa
 VtQ/280qTmWsc+IaxHwjsw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1768981340; bh=QeKL6NVbQHBP9kRFM1Ju4xmWbtxg4TQLmL4CGc/xOWw=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=StN5Fsu6RveGqr0OMDXomA6Q6SIciHkBJMo5z1pVhE1bj0Mv1y08cwyurHwdE/kpk
 gtSvcLIRs8nbBHg/ARbcApPO5iKmdPI9xnm1c1Vc+BbOpqzc4f9xmLKIQg/UbJtnUa
 uC5VmKkcTcTiaF2qN0Chn7+GA61DJfFu0Bhrltzc7IyrvTLdS0PPsVwnE8Ih+ps+DC
 Aq8TGhqiugwEo0d4r9pn46w0Qfz5201UwdhRBa/wEZ260GGWv3lWymLHbE/TzdApru
 DrLOQbJCPVearp7KK3slPaXa0unk8qUPlSxhQYhkCJHy+EuVZak9QqO46ZN3rCwz8l
 ja8Op9OMp9sjw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=StN5Fsu6
Subject: Re: [Buildroot] [PATCH 1/1] package/swupdate: bump to version
 2025.12
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

SGkgSmFtZXMsCgpJIHdhcyB3b3JraW5nIG9uIGl0IHRvby4KQXMgaXMgdGhlIHBhdGNoIGRvZXNu
4oCZdCB3b3JrIG9uIG15IHNpZGUuCkl0IHNlZW1zIGxpa2UgYXQgbGVhc3Qgb25lIGNyeXB0byBp
cyBuZWVkZWQgd2l0aCB0aGlzIHZlcnNpb24sIHNvIEkgd2FzIGRlZmF1bHRpbmcgdG8gT3BlblNT
TCBhbmQgYWRkaW5nIGEgY2hvaWNlIGJldHdlZW4gaXQsIFdvbGZzc2wgZXRjLgoKQXJlIHlvdSBz
dXJlIGl0IGJ1aWxkcyBhcyBpcz8KT3RoZXJ3aXNlIGNhbiB5b3UgcGxlYXNlIGZpeCB0aGUgcGF0
Y2g/CgpUaGFuayB5b3UKR2l1bGlvCgo+IElsIGdpb3JubyAyMSBnZW4gMjAyNiwgYWxsZSBvcmUg
MDI6MTQsIEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPiBoYSBzY3Jp
dHRvOgo+IAo+IO+7v1NpZ25lZC1vZmYtYnk6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFy
ZDFAZ21haWwuY29tPgo+IC0tLQo+IHBhY2thZ2Uvc3d1cGRhdGUvc3d1cGRhdGUuaGFzaCB8IDIg
Ky0KPiBwYWNrYWdlL3N3dXBkYXRlL3N3dXBkYXRlLm1rICAgfCAyICstCj4gMiBmaWxlcyBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2Uvc3d1cGRhdGUvc3d1cGRhdGUuaGFzaCBiL3BhY2thZ2Uvc3d1cGRhdGUvc3d1cGRhdGUu
aGFzaAo+IGluZGV4IGJjOTExZDE4MjAuLmIzZjQzNjQ4ZjggMTAwNjQ0Cj4gLS0tIGEvcGFja2Fn
ZS9zd3VwZGF0ZS9zd3VwZGF0ZS5oYXNoCj4gKysrIGIvcGFja2FnZS9zd3VwZGF0ZS9zd3VwZGF0
ZS5oYXNoCj4gQEAgLTEsNSArMSw1IEBACj4gIyBMb2NhbGx5IGNhbGN1bGF0ZWQKPiAtc2hhMjU2
ICA2NzhiNDdmZDI0MTk3MjdjNGQwYWJmNWM5ZjNiYzBkYzRiNjdlOTU5NTExMzJiZDFjOGY1NjAz
ZTg4OTQ3Nzc5ICBzd3VwZGF0ZS0yMDI1LjA1LnRhci5nego+ICtzaGEyNTYgIDg1MTdmMzczMGVl
YjY2ZTIwZTY1MWI4ODFkZDRiOWMxMGNhOWFlMDVlMzg4M2RiNTliNWRmMThhYjFlYWE1MzMgIHN3
dXBkYXRlLTIwMjUuMTIudGFyLmd6Cj4gc2hhMjU2ICA0Y2YwNGVkMzRmZjBlYmJmNWM3MTM0NWI1
NmU2YWY1MDkzZmMxNzIwNjM2NGNjYTBlYmJhZTkyZWYzOTQwNjgzICBMSUNFTlNFUy9CU0QtMS1D
bGF1c2UudHh0Cj4gc2hhMjU2ICBlMjdhM2U4NzcwNmIzYWE1ZmYyZTUwZWFhZmUyZTZlZDUzOTdm
YmYyZDc2NzllYWY0NDRhNmQwMDA1MThhM2E2ICBMSUNFTlNFUy9CU0QtMy1DbGF1c2UudHh0Cj4g
c2hhMjU2ICAwNTU4MTAxOTg0NTUwZmE4NGQxZDEzYzJhZjExZDExNmMyMDA3OWQyYmU1ODcxMWU4
ZDk5Y2FkY2U3MDA5MTkyICBMSUNFTlNFUy9DQzAtMS4wLnR4dAo+IGRpZmYgLS1naXQgYS9wYWNr
YWdlL3N3dXBkYXRlL3N3dXBkYXRlLm1rIGIvcGFja2FnZS9zd3VwZGF0ZS9zd3VwZGF0ZS5tawo+
IGluZGV4IDA1MzI5ZDEzYjguLjg2NGM4NzZlNDAgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9zd3Vw
ZGF0ZS9zd3VwZGF0ZS5tawo+ICsrKyBiL3BhY2thZ2Uvc3d1cGRhdGUvc3d1cGRhdGUubWsKPiBA
QCAtNCw3ICs0LDcgQEAKPiAjCj4gIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAKPiAtU1dVUERB
VEVfVkVSU0lPTiA9IDIwMjUuMDUKPiArU1dVUERBVEVfVkVSU0lPTiA9IDIwMjUuMTIKPiBTV1VQ
REFURV9TSVRFID0gJChjYWxsIGdpdGh1YixzYmFiaWMsc3d1cGRhdGUsJChTV1VQREFURV9WRVJT
SU9OKSkKPiBTV1VQREFURV9MSUNFTlNFID0gR1BMLTIuMCwgR1BMLTIuMCssIExHUEwtMi4xKywg
TUlULCBJU0MsIEJTRC0xLUNsYXVzZSwgQlNELTMtQ2xhdXNlLCBDQzAtMS4wLCBDQy1CWS1TQS00
LjAsIE9GTC0xLjEKPiBTV1VQREFURV9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRVMvQlNELTEtQ2xh
dXNlLnR4dCBcCj4gLS0KPiAyLjQzLjAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
