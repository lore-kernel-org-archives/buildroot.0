Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E2F1E77188
	for <buildroot@archiver.kernel.org>; Mon, 30 Dec 2024 22:26:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC61140766;
	Mon, 30 Dec 2024 22:26:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mx8bJS9Xa_yx; Mon, 30 Dec 2024 22:26:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87A1B40765
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87A1B40765;
	Mon, 30 Dec 2024 22:26:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B3390968
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 22:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B21C4023C
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 22:26:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 15dlLK0HeK4N for <buildroot@buildroot.org>;
 Mon, 30 Dec 2024 22:26:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E89C340133
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E89C340133
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E89C340133
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 22:26:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 095AFC0002;
 Mon, 30 Dec 2024 22:26:16 +0000 (UTC)
Date: Mon, 30 Dec 2024 23:26:16 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Pierre-Jean Texier <texier.pj2@gmail.com>,
 linux-amarula@amarulasolutions.com
Message-ID: <20241230232616.0fb03092@windsurf>
In-Reply-To: <20241227174246.3905068-1-dario.binacchi@amarulasolutions.com>
References: <20241227174246.3905068-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735597577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X3yWza30JY3vS85rsWZnIP87CoY5Yl2v9xtZR8du4mQ=;
 b=U2f/dZNIPcFdc34IGkJJ44GTFPcMzYc5SOcrUeORmc/QJYWZz41yNd2gBoszzg03Zr0aak
 XISH7Vz6HDtOEhN4JYRtuE/Svxyum1lzo0id6H5ze0OZRe1lDZMUIDE0yDAIQ7R1LQJIIG
 iM6rGcUvnK/ThImIBY1TX23mjUVgojAwWccsVx+Qd7mwu7UO3M2Hku3CuyQ+OcU6IRBlZd
 WcGtuetBvJVLTPC6zFalNK8M0nzqvcizWipl4jN76+5NIRdJrcwlgo/nbf1SHgE0yBsa4W
 aoZ16NJenEHt5Y0kI3zoYUfZrwLheRiuQNys7cAQUFNiEapUjZtThrcCa69NZA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=U2f/dZNI
Subject: Re: [Buildroot] [PATCH v3 1/1] package/libxml2: fix compilation
 with uclibc
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

SGVsbG8gRGFyaW8sCgpPbiBGcmksIDI3IERlYyAyMDI0IDE4OjQyOjQ2ICswMTAwCkRhcmlvIEJp
bmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4gd3JvdGU6Cgo+IFRo
ZSBwYXRjaCBmaXhlcyB0aGUgZm9sbG93aW5nIGVycm9ycyBhbmQgd2FybmluZ3MgcmFpc2VkIGJ5
IHRoZQo+IGNvbXBpbGF0aW9uIG9mIHRoZSBsaWJyYXJ5IHdpdGggdUNsaWJjOgo+IAo+IGVuY29k
aW5nLmM6IEluIGZ1bmN0aW9uIOKAmHhtbEVuY0lucHV0Q2h1bmvigJk6Cj4gZW5jb2RpbmcuYzoy
MjA5OjMyOiB3YXJuaW5nOiBjb21wYXJpc29uIGJldHdlZW4gcG9pbnRlciBhbmQgaW50ZWdlcgo+
ICAyMjA5IHwgICAgIGVsc2UgaWYgKGhhbmRsZXItPmljb252X2luICE9IE5VTEwpIHsKPiAgICAg
ICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefgo+IGVuY29kaW5nLmM6IEluIGZ1
bmN0aW9uIOKAmHhtbEVuY091dHB1dENodW5r4oCZOgo+IGVuY29kaW5nLmM6MjI2OTozMzogd2Fy
bmluZzogY29tcGFyaXNvbiBiZXR3ZWVuIHBvaW50ZXIgYW5kIGludGVnZXIKPiAgMjI2OSB8ICAg
ICBlbHNlIGlmIChoYW5kbGVyLT5pY29udl9vdXQgIT0gTlVMTCkgewo+ICAgICAgIHwgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBefgo+IGVuY29kaW5nLmM6IEluIGZ1bmN0aW9uIOKA
mHhtbENoYXJFbmNDbG9zZUZ1bmPigJk6Cj4gZW5jb2RpbmcuYzoyNjgxOjI5OiB3YXJuaW5nOiBj
b21wYXJpc29uIGJldHdlZW4gcG9pbnRlciBhbmQgaW50ZWdlcgo+ICAyNjgxIHwgICAgIGlmICgo
aGFuZGxlci0+aWNvbnZfb3V0ICE9IE5VTEwpIHx8IChoYW5kbGVyLT5pY29udl9pbiAhPSBOVUxM
KSkgewo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+Cj4gZW5jb2Rpbmcu
YzoyNjgxOjYwOiB3YXJuaW5nOiBjb21wYXJpc29uIGJldHdlZW4gcG9pbnRlciBhbmQgaW50ZWdl
cgo+ICAyNjgxIHwgICAgIGlmICgoaGFuZGxlci0+aWNvbnZfb3V0ICE9IE5VTEwpIHx8IChoYW5k
bGVyLT5pY29udl9pbiAhPSBOVUxMKSkgewo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefgo+IGVuY29kaW5nLmM6MjY4
MzozMjogd2FybmluZzogY29tcGFyaXNvbiBiZXR3ZWVuIHBvaW50ZXIgYW5kIGludGVnZXIKPiAg
MjY4MyB8ICAgICAgICAgaWYgKGhhbmRsZXItPmljb252X291dCAhPSBOVUxMKSB7Cj4gICAgICAg
fCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn4KPiBlbmNvZGluZy5jOjI2ODY6MzI6
IGVycm9yOiBhc3NpZ25tZW50IHRvIOKAmGljb252X3TigJkge2FrYSDigJhsb25nIGludOKAmX0g
ZnJvbSDigJh2b2lkICrigJkgbWFrZXMgaW50ZWdlciBmcm9tIHBvaW50ZXIgd2l0aG91dCBhIGNh
c3QgWy1XaW50LWNvbnZlcnNpb25dCj4gIDI2ODYgfCAgICAgICAgICAgICBoYW5kbGVyLT5pY29u
dl9vdXQgPSBOVUxMOwo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4K
PiBlbmNvZGluZy5jOjI2ODg6MzE6IHdhcm5pbmc6IGNvbXBhcmlzb24gYmV0d2VlbiBwb2ludGVy
IGFuZCBpbnRlZ2VyCj4gIDI2ODggfCAgICAgICAgIGlmIChoYW5kbGVyLT5pY29udl9pbiAhPSBO
VUxMKSB7Cj4gICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefgo+IGVuY29k
aW5nLmM6MjY5MTozMTogZXJyb3I6IGFzc2lnbm1lbnQgdG8g4oCYaWNvbnZfdOKAmSB7YWthIOKA
mGxvbmcgaW504oCZfSBmcm9tIOKAmHZvaWQgKuKAmSBtYWtlcyBpbnRlZ2VyIGZyb20gcG9pbnRl
ciB3aXRob3V0IGEgY2FzdCBbLVdpbnQtY29udmVyc2lvbl0KPiAgMjY5MSB8ICAgICAgICAgICAg
IGhhbmRsZXItPmljb252X2luID0gTlVMTDsKPiAgICAgICB8ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIF4KPiBtYWtlWzRdOiAqKiogW01ha2VmaWxlOjExNDc6IGxpYnhtbDJfbGEtZW5j
b2RpbmcubG9dIEVycm9yIDEKPiAKPiBUaGUgcmVncmVzc2lvbiB3YXMgcGFydGlhbGx5IGludHJv
ZHVjZWQgaW4gdmVyc2lvbiAyLjEuMDoKPiA0OTZhMWNmNTkyODQgKCI0OTZhMWNmNTkyODQgcmV2
YW1wZWQgdGhlIGVuY29kaW5nIHN1cHBvcnQsIGFkZGVkIGljb252IHN1cHBvcnQsIHNvIG5vdyBs
aWJ4bWwgaWYiKQo+IGFuZCBwYXJ0aWFsbHkgaW4gdmVyc2lvbiAyLjIuMzoKPiA4N2I5NTM5NTcz
MDUgKCJMYXJnZSBzeW5jIGJldHdlZW4gbXkgVzNDIGJhc2UgYW5kIEdub21lJ3Mgb25lOiIpCj4g
Cj4gU28gdGhlIHJlZ3Jlc3Npb24gd2FzIGFscmVhZHkgcHJlc2VudCBpbiB0aGUgZmlyc3QgdmVy
c2lvbiBvZiBsaWJ4bWwyCj4gKDIuNi4yOSkgaW4gQnVpbGRyb290Lgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4K
PiAtLS0KClRoYW5rcyBmb3IgdGhlIHBhdGNoIGFuZCBpbnZlc3RpZ2F0aW9uLiBIb3dldmVyIHRo
ZSBleHBsYW5hdGlvbiB3YXMgbm90CnJlYWxseSBjb21wbGV0ZTogaXQgaXMgY2xlYXJseSBpbXBv
c3NpYmxlIHRoYXQgdGhpcyBidWlsZCBmYWlsdXJlCmV4aXN0ZWQgd2l0aCB1Q2xpYmMgc2luY2Ug
bGlieG1sMiB3YXMgaW50cm9kdWNlZCBpbiBCdWlsZHJvb3QuIEluZGVlZCwKdUNsaWJjIHVzZWQg
dG8gYmUgdGhlIG9ubHkgQyBsaWJyYXJ5IGluIEJ1aWxkcm9vdCwgaXQgaGFzIGJlZW4gdGhlCmRl
ZmF1bHQgZm9yIG1hbnkgeWVhcnMsIGV0Yy4KClNvIGluIGZhY3QsIHRoZSBpc3N1ZSBzdGFydGVk
IG9jY3VycmluZyBvbmx5IHNpbmNlIEdDQyAxNC54IHdhcwppbnRyb2R1Y2VkLiBJdCB1c2VkIHRv
IGJlIGEgd2FybmluZywgYW5kIEdDQyAxNC54IHR1cm5lZCBpdCBpbnRvIGEgaGFyZApidWlsZCBl
cnJvci4gQWxzbywgaXQgYXBwZWFycyBvbmx5IHdpdGggdUNsaWJjIGJlY2F1c2UgdUNsaWJjIGRl
ZmluZXMKaWNvbnZfdCBhcyAibG9uZyIsIHdoaWxlIGJvdGggZ2xpYmMgYW5kIG11c2wgZGVmaW5l
IGl0IGFzICJ2b2lkICoiLgoKSSBoYXZlIHVwZGF0ZWQgdGhlIGNvbW1pdCBsb2cgd2l0aCB0aG9z
ZSBkZXRhaWxzLCBJJ3ZlIGFkZGVkIGEKcmVmZXJlbmNlIHRvIHRoZSBhdXRvYnVpbGRlciBmYWls
dXJlIGJlaW5nIGZpeGVkIGluIHRoZSBjb21taXQgbG9nLCBhbmQKdXBkYXRlZCB0aGUgVXBzdHJl
YW06IGxpbmsgaW4gdGhlIHBhdGNoIHRvIHBvaW50IHRvIHRoZSB1cHN0cmVhbSBjb21taXQuCgpU
aGFua3MgZm9yIHRoaXMgZ3JlYXQgaW52ZXN0aWdhdGlvbiB3b3JrIQoKVGhvbWFzCi0tIApUaG9t
YXMgUGV0YXp6b25pLCBDVE8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdp
bmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
