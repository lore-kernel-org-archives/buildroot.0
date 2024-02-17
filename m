Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D646C48BC3
	for <buildroot@archiver.kernel.org>; Sat, 17 Feb 2024 19:20:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 500F96064A;
	Sat, 17 Feb 2024 19:20:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6H_QRitkYgNj; Sat, 17 Feb 2024 19:19:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53C3A60782
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53C3A60782;
	Sat, 17 Feb 2024 19:19:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 77D2B1BF2C5
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 19:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71BFF40124
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 19:19:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lMcFVPvLnGkc for <buildroot@lists.busybox.net>;
 Sat, 17 Feb 2024 19:19:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EEF5A400B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EEF5A400B9
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EEF5A400B9
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 19:19:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8976B13F86E
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 20:19:51 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 17 Feb 2024 20:19:51 +0100
Date: Sat, 17 Feb 2024 20:19:51 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Message-ID: <ZdEG1-OAJvCMcJHH@landeda>
References: <20240217170840.3623044-1-yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240217170840.3623044-1-yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1708197592;
 bh=KVlcrH/VM/U+nvsX3zv7KvOc9ECEfDkjrn4L2mpNwmY=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=UGLm/noh0oWvHFffFCopgTNsJfLp9BSkIlujOhqBk+EoTEkC6mkrZ7EujPcRztdhI
 6VAqbAnNvJ1uznotYegIA4Crc01ZWK3c53iy9r9++z0TDa/MoWQN5YA4LoQXjue1Be
 s0EFn5KdJWhCQAYwAAEaSwqFQd+kHByCFSUMcq7Q/fdeSIg7l4bqRdItlfh6XqeOTT
 lVl2lgjJTLhUv/MqSIaDul7yflrxz5s9OYo1OLFoQFhi4ghAWXCLTRVIupEnD9ZUM2
 eDn7pMDVJ7SuWXPXf16sscEIxwz12fdCwAfbiFRHXCb0XXVKh6Ti0Me6QuiYm9m71R
 PfjSas1fzi2vw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UGLm/noh
Subject: Re: [Buildroot] [PATCH] package/sudo: fix build with uClibc
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

QWxsLAoKT24gMjAyNC0wMi0xNyAxODowOCArMDEwMCwgWWFubiBFLiBNT1JJTiBzcGFrZSB0aHVz
bHk6Cj4gdUNsaWJjIGxhY2tzIHByb2Nlc3Nfdm1fcmVhZHYoKSwgYW5kIHN1ZG8gZmFpbHMgdG8g
YnVpbGQ6Cj4gCj4gICAgIC4vZXhlY19wdHJhY2UuYzogSW4gZnVuY3Rpb24g4oCYcHRyYWNlX3dy
aXRlX3ZlY+KAmToKPiAgICAgLi9leGVjX3B0cmFjZS5jOjg5NTo5OiBlcnJvcjog4oCYbndyaXR0
ZW7igJkgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rpb24pOyBkaWQgeW91IG1l
YW4g4oCYcHdyaXRl4oCZPwo+ICAgICAgIDg5NSB8ICAgICAgICAgbndyaXR0ZW4gPSBwdHJhY2Vf
d3JpdGVfc3RyaW5nKHBpZCwgc3RydGFiLCB2ZWNbaV0pOwo+ICAgICAgICAgICB8ICAgICAgICAg
Xn5+fn5+fn4KPiAgICAgICAgICAgfCAgICAgICAgIHB3cml0ZQo+IAo+IFRoZSBmaXggaXMgcHJl
dHR5IHRyaXZpYWwsIGFuZCBoYXMgYmVlbiBzdWJtaXR0ZWQgdXBzdHJlYW0uCgpUaGUgcGF0Y2gg
aGFzIGJlZW4gYWNjZXB0ZWQgdXBzdHJlYW0gbm93LgoKPiBTaWduZWQtb2ZmLWJ5OiBZYW5uIEUu
IE1PUklOIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4KCkFwcGxpZWQgdG8gbWFzdGVyLCBhZnRl
ciB0d2Vha2luZyB0aGUgY29tbWl0IGxvZyBleHBsYWluaW5nIHNpbmNlIHdoZW4KdGhlIGlzc3Vl
IG9jY3VycywgYW5kIG1ha2luZyB0aGUgcGF0Y2ggYW4gYWN0dWFsIGJhY2twb3J0LCB0aGFua3Mu
CgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiAtLS0KPiAgLi4uZS1maXgtYnVpbGQtd2l0aG91
dC1wcmVjZXNzX3ZtX3JlYWR2LnBhdGNoIHwgNDEgKysrKysrKysrKysrKysrKysrKwo+ICAxIGZp
bGUgY2hhbmdlZCwgNDEgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2Fn
ZS9zdWRvLzAwMDEtc3JjLWV4ZWNfcHRyYWNlLWZpeC1idWlsZC13aXRob3V0LXByZWNlc3Nfdm1f
cmVhZHYucGF0Y2gKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9zdWRvLzAwMDEtc3JjLWV4ZWNf
cHRyYWNlLWZpeC1idWlsZC13aXRob3V0LXByZWNlc3Nfdm1fcmVhZHYucGF0Y2ggYi9wYWNrYWdl
L3N1ZG8vMDAwMS1zcmMtZXhlY19wdHJhY2UtZml4LWJ1aWxkLXdpdGhvdXQtcHJlY2Vzc192bV9y
ZWFkdi5wYXRjaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uYjFi
MThkNjEwYwo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL3N1ZG8vMDAwMS1zcmMtZXhl
Y19wdHJhY2UtZml4LWJ1aWxkLXdpdGhvdXQtcHJlY2Vzc192bV9yZWFkdi5wYXRjaAo+IEBAIC0w
LDAgKzEsNDEgQEAKPiArRnJvbSAzZTc2NWI2YzU5NzUwNzc3NThlN2IwYTJhOTU1ZGM3ZjdiMmI5
NGU3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+ICtGcm9tOiAiWWFubiBFLiBNT1JJTiIgPHlh
bm4ubW9yaW4uMTk5OEBmcmVlLmZyPgo+ICtEYXRlOiBTYXQsIDE3IEZlYiAyMDI0IDE3OjUyOjQ1
ICswMTAwCj4gK1N1YmplY3Q6IFtQQVRDSF0gc3JjL2V4ZWNfcHRyYWNlOiBmaXggYnVpbGQgd2l0
aG91dCBwcmVjZXNzX3ZtX3JlYWR2KCkKPiArCj4gK0NvbW1pdCAzMmY0Yjk4ZjZiNGEgKHN1ZG8g
ZnJvbnRlbmQ6IHNpbGVuY2UgbW9zdCAtV2NvbnZlcnNpb24gd2FybmluZ3MuKQo+ICticm9rZSB0
aGUgYnVpbGQgb24gQyBsaWJyYXJpZXMgdGhhdCBtaXNzIHByb2Nlc3Nfdm1fcmVhZHYoKSwgbGlr
ZQo+ICt1Q2xpYmMtbmcuCj4gKwo+ICtJbmRlZWQsIHRoZSBzc2l6ZV90IG53cml0dGVuIGlzIGRl
Y2xhcmVkIGd1YXJkZWQgYnkgSEFWRV9QUk9DRVNTX1ZNX1JFQURWLAo+ICtidXQgaXMgdGhlbiBy
ZS1hc3NpZ25lZCBhbmQgdXNlZCBhIGZldyBsaW5lcyBiZWxvdywgb3V0c2lkZSBhbnkgZ3VhcmQu
Cj4gKwo+ICtGaXggdGhhdCBieSBhbHdheXMgZGVjbGFyaW5nIHRoZSBvYmplY3QsIGFzIGl0IGlz
IGFsd2F5cyBuZWVkZWQuCj4gKwo+ICtTaWduZWQtb2ZmLWJ5OiBZYW5uIEUuIE1PUklOIDx5YW5u
Lm1vcmluLjE5OThAZnJlZS5mcj4KPiArVXBzdHJlYW06IGh0dHBzOi8vZ2l0aHViLmNvbS9zdWRv
LXByb2plY3Qvc3Vkby9wdWxsLzM1OQo+ICstLS0KPiArIHNyYy9leGVjX3B0cmFjZS5jIHwgMyAr
Ky0KPiArIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAr
Cj4gK2RpZmYgLS1naXQgYS9zcmMvZXhlY19wdHJhY2UuYyBiL3NyYy9leGVjX3B0cmFjZS5jCj4g
K2luZGV4IDlkZDM2YzI3NS4uM2Q0NGI4MmUyIDEwMDY0NAo+ICstLS0gYS9zcmMvZXhlY19wdHJh
Y2UuYwo+ICsrKysgYi9zcmMvZXhlY19wdHJhY2UuYwo+ICtAQCAtODc4LDExICs4NzgsMTIgQEAg
cHRyYWNlX3dyaXRlX3ZlYyhwaWRfdCBwaWQsIHN0cnVjdCBzdWRvX3B0cmFjZV9yZWdzICpyZWdz
LCBjaGFyICoqdmVjLAo+ICsgICAgIHVuc2lnbmVkIGxvbmcgYWRkciwgdW5zaWduZWQgbG9uZyBz
dHJ0YWIpCj4gKyB7Cj4gKyAgICAgY29uc3QgdW5zaWduZWQgbG9uZyBzdHJ0YWIwID0gc3RydGFi
Owo+ICsrICAgIHNzaXplX3QgbndyaXR0ZW47Cj4gKyAgICAgc2l6ZV90IGk7Cj4gKyAgICAgZGVi
dWdfZGVjbChwdHJhY2Vfd3JpdGVfdmVjLCBTVURPX0RFQlVHX0VYRUMpOwo+ICsKPiArICNpZmRl
ZiBIQVZFX1BST0NFU1NfVk1fUkVBRFYKPiArLSAgICBzc2l6ZV90IG53cml0dGVuID0gcHRyYWNl
X3dyaXRldl92ZWMocGlkLCByZWdzLCB2ZWMsIGFkZHIsIHN0cnRhYik7Cj4gKysgICAgbndyaXR0
ZW4gPSBwdHJhY2Vfd3JpdGV2X3ZlYyhwaWQsIHJlZ3MsIHZlYywgYWRkciwgc3RydGFiKTsKPiAr
ICAgICBpZiAobndyaXR0ZW4gIT0gLTEgfHwgZXJybm8gIT0gRU5PU1lTKQo+ICsgCWRlYnVnX3Jl
dHVybl9zc2l6ZV90KG53cml0dGVuKTsKPiArICNlbmRpZiAvKiBIQVZFX1BST0NFU1NfVk1fUkVB
RFYgKi8KPiArLS0KPiArMi40My4wCj4gKwo+IC0tIAo+IDIuNDMuMAo+IAoKLS0gCi4tLS0tLS0t
LS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0t
LS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwg
LyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2
IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAg
ICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlO
U1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsu
b3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8Cict
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1e
LS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
