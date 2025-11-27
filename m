Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D071D111A8
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 20:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E815F413ED;
	Thu, 27 Nov 2025 20:04:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 65O9XJTWRyuq; Thu, 27 Nov 2025 20:04:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CB3D4061D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CB3D4061D;
	Thu, 27 Nov 2025 20:04:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A1902A9
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:03:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FE2661024
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:03:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ie9URoBNLr8n for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 20:03:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0B3A960DBB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B3A960DBB
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0B3A960DBB
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:03:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1174CB979CA9; Thu, 27 Nov 2025 21:03:56 +0100 (CET)
Message-ID: <1992417b-81bb-454f-946c-041c3f0ea5ad@rnout.be>
Date: Thu, 27 Nov 2025 21:03:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Scott Fan <fancp2007@gmail.com>, buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>
References: <20250925014217.1562831-1-fancp2007@gmail.com>
 <20250925014217.1562831-2-fancp2007@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250925014217.1562831-2-fancp2007@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1764273836; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=Dg/N3BHcaWfbkFzBJ6Cq+2c3wrazoV2BN6XMb+6QdCg=;
 b=dqjHrGhdCyi6scRbaj7Nz7D3vD99vFeuzVTjPt6ScfoVXpFONvi4XHAGZoRRbcNYQvayVA
 q3OmtysO7KDjZZne0Wt69HCs8UqiuXJm7UOk0SpcH+sJfCvtsnzlaGFAHC9/cuSZYz+xPt
 MkfT33DEeZeARQvB0bPJuii0slrY+bDQVnFan+rJAIxICkmik0qrZig9BJgGZX8XtITjCS
 V6hCSlHFlccLXtdacspTBh+z7b9H51bGMPNNGJl/AExUK7fh/j1hDPefDyGnl0SRo3AP4X
 pv0zhUhTOHPOwcjBK8/IJiirW7lx4YRQH7MJ6YZpv+53VuJnrX6xcnoLBqMlRA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=dqjHrGhd
Subject: Re: [Buildroot] [PATCH 2/2] package/openvpn: bump version to 2.6.15
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyNS8wOS8yMDI1IDAzOjQyLCBTY290dCBGYW4gd3JvdGU6Cj4gUmVsZWFzZSBub3RlczoK
PiBodHRwczovL3NvdXJjZWZvcmdlLm5ldC9wL29wZW52cG4vbWFpbG1hbi9tZXNzYWdlLzU5MjM4
MjMzLwo+IAo+IENoYW5nZWxvZzoKPiBodHRwczovL2dpdGh1Yi5jb20vT3BlblZQTi9vcGVudnBu
L2Jsb2IvcmVsZWFzZS8yLjYvQ2hhbmdlTG9nCj4gaHR0cHM6Ly9naXRodWIuY29tL09wZW5WUE4v
b3BlbnZwbi9ibG9iL3JlbGVhc2UvMi42L0NoYW5nZXMucnN0Cj4gCj4gVGhlIOKAjkNPUFlSSUdI
VC5HUEwgd2FzIHVwZGF0ZWQgdG8gbGF0ZXN0IHZlcnNpb24gZnJvbSBGU0YuCj4gCj4gU2lnbmVk
LW9mZi1ieTogU2NvdHQgRmFuIDxmYW5jcDIwMDdAZ21haWwuY29tPgoKICBBcHBsaWVkIHRvIDIw
MjUuMDIueCBhbmQgMjAyNS4wOC54LCB0aGFua3MuCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+IC0t
LQo+ICAgcGFja2FnZS9vcGVudnBuL29wZW52cG4uaGFzaCB8IDQgKystLQo+ICAgcGFja2FnZS9v
cGVudnBuL29wZW52cG4ubWsgICB8IDIgKy0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL29wZW52cG4v
b3BlbnZwbi5oYXNoIGIvcGFja2FnZS9vcGVudnBuL29wZW52cG4uaGFzaAo+IGluZGV4IDQzMmIx
YzJhZmIuLjM1M2U4YTgwNTEgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9vcGVudnBuL29wZW52cG4u
aGFzaAo+ICsrKyBiL3BhY2thZ2Uvb3BlbnZwbi9vcGVudnBuLmhhc2gKPiBAQCAtMSwzICsxLDMg
QEAKPiAgICMgTG9jYWxseSBjYWxjdWxhdGVkIGFmdGVyIGNoZWNraW5nIHNpZ25hdHVyZQo+IC1z
aGEyNTYgIDllYjZhNjYxODM1MmY5ZTdiNzcxYTlkMzhhZTE2MzFiNWVkZmVlZDZkNDAyMzNlMjQz
ZTYwMmRkZjIxOTVlN2EgIG9wZW52cG4tMi42LjE0LnRhci5nego+IC1zaGEyNTYgIDFmY2I3OGQ3
ZTQ3OGJiOGE5NDA4MDEwYmRjOTFiMzZlMjEzYjFmYWNmYWQwOTNkZjNmN2NlN2UyOGFmMTkwNDMg
IENPUFlSSUdIVC5HUEwKPiArc2hhMjU2ICBlMzU1MTNlZTE1OTk1ZTNjNzFhZGZkODg5MWI5ZjMz
NTIyODk2YzcwYjNiYWEyZWQ5YTIzYzdhNDJjNGQ3YmRlICBvcGVudnBuLTIuNi4xNS50YXIuZ3oK
PiArc2hhMjU2ICBlZGFlZjYzMmNiYjY0M2U0ZTdhMjIxNzE3YTZjNDQxYTRjMWE3YzkxOGU2ZTRk
NTZkZWJjM2Q4NzM5YjIzM2Y2ICBDT1BZUklHSFQuR1BMCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
b3BlbnZwbi9vcGVudnBuLm1rIGIvcGFja2FnZS9vcGVudnBuL29wZW52cG4ubWsKPiBpbmRleCBj
ZTkxNmRiYTA0Li4yNjU1OGMzZDE2IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uvb3BlbnZwbi9vcGVu
dnBuLm1rCj4gKysrIGIvcGFja2FnZS9vcGVudnBuL29wZW52cG4ubWsKPiBAQCAtNCw3ICs0LDcg
QEAKPiAgICMKPiAgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gICAKPiAtT1BFTlZQTl9WRVJT
SU9OID0gMi42LjE0Cj4gK09QRU5WUE5fVkVSU0lPTiA9IDIuNi4xNQo+ICAgT1BFTlZQTl9TSVRF
ID0gaHR0cHM6Ly9zd3VwZGF0ZS5vcGVudnBuLm5ldC9jb21tdW5pdHkvcmVsZWFzZXMKPiAgIE9Q
RU5WUE5fREVQRU5ERU5DSUVTID0gaG9zdC1wa2djb25mIGxpYmNhcC1uZwo+ICAgT1BFTlZQTl9M
SUNFTlNFID0gR1BMLTIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
