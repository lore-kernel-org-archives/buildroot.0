Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 696BEC369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 20:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B5C260E82;
	Wed, 16 Apr 2025 20:56:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bsdy37zZC74w; Wed, 16 Apr 2025 20:56:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6021F6F4C2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6021F6F4C2;
	Wed, 16 Apr 2025 20:56:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1290CE83
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:56:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0CC84106B
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:56:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fzimRncNJKER for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 20:55:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C747F40C23
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C747F40C23
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C747F40C23
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 20:55:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 952061C00C0; Wed, 16 Apr 2025 22:55:56 +0200 (CEST)
Message-ID: <f7197f98-b7b9-4012-a590-fef0609e1523@rnout.be>
Date: Wed, 16 Apr 2025 22:55:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Niklas Cassel <Niklas.Cassel@wdc.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Damien Le Moal <dlemoal@kernel.org>, Florian Fainelli
 <f.fainelli@gmail.com>, "Yann E . MORIN" <yann.morin@orange.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Niklas Cassel <cassel@kernel.org>
References: <20250218104807.2329338-1-Niklas.Cassel@wdc.com>
Content-Language: en-GB
In-Reply-To: <20250218104807.2329338-1-Niklas.Cassel@wdc.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744836956; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=5M4/6gWSdohdIsk3c61mvFEvoIrGtOac1t7GKUdyMnU=;
 b=o4nojuK7AjC0A3SgiJIatPZDqAEkTw61wjWGyG0oc5snZgQbA1wUP7kDNat0NBPkE7rQE+
 +FfVYdcG0NbdawebUET/dahY6XJuSjzEqJq4Bc3fx91/J4Rirh5wIcbTs+QI1AhzXVVuNo
 4BY+DyEZH9gD62xXdIArjvMAm2zvyEjNVAQ/xXaZ6PJx/Q1rYfCajsFL6Imtl6VfepFb0u
 2zdyLTzNDhotLO/7h3WMSY0lEMMKP7anHu1p4uqSuoUBexaEJf+xFK2Qdsa3DaromUf+Xk
 dUJyOqtm1d2aYGD8y2QAgYO0SmIUOsLyIHbODvwW1R8L/7DDYr5rak5ngxtLFQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH 1/2] package/linux-tools: perf: Fix
 _BIN_ARCH_EXCLUDE
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

Ck9uIDE4LzAyLzIwMjUgMTE6NDgsIE5pa2xhcyBDYXNzZWwgdmlhIGJ1aWxkcm9vdCB3cm90ZToK
PiBGcm9tOiBOaWtsYXMgQ2Fzc2VsIDxjYXNzZWxAa2VybmVsLm9yZz4KPgo+IHN1cHBvcnQvc2Ny
aXB0cy9jaGVjay1iaW4tYXJjaCBoYXMgYW4gb3B0aW9uIC1pIHRvIGV4Y2x1ZGUgYSBwYXRoCj4g
KG9yIG1hbnkgcGF0aHMgYnkgdXNpbmcgLWkgbXVsdGlwbGUgdGltZXMpLgo+Cj4gVGhpcyB3YXMg
aW1wbGVtZW50ZWQgaW4gY29tbWl0IDAxZDkwZjBkMDkzZiAoInNwcG9ydC9jaGVjay1iaW4tYXJj
aDoKPiBhY2NlcHQgYXJiaXRyYXJ5IHBlci1wYWNrYWdlIGlnbm9yZSBwYXRocyIpLgo+Cj4gTG9v
a2luZyBhdCB0aGlzIGZlYXR1cmUgKHdoaWNoIGhhc24ndCBjaGFuZ2VkIHNpbmNlIGJlaW5nIGFk
ZGVkKSwKPiB3ZSBjYW4gc2VlIHRoYXQgY2hlY2stYmluLWFyY2ggYXV0b21hdGljYWxseSBhZGRz
IGEgdHJhaWxpbmcgc2xhc2gKPiB0byBhbGwgZW50cmllcyBzcGVjaWZpZWQgdXNpbmcgLWkuCj4K
PiBUaHVzLCBzcGVjaWZ5aW5nIGEgcGF0aCB0byBhIGZpbGUsIGUuZy4KPiAiL3Vzci9saWJleGVj
L3BlcmYtY29yZS90ZXN0cy9wZS1maWxlLmV4ZSIgd2lsbCBjYXVzZSBjaGVjay1iaW4tYXJjaAo+
IHRvIGFkZCAiL3Vzci9saWJleGVjL3BlcmYtY29yZS90ZXN0cy9wZS1maWxlLmV4ZS8iIHRvIHRo
ZSBJR05PUkVTIGFycmF5Lgo+Cj4gV2hlbiBydW5uaW5nIHRoZSBtYWluIGxvb3AsIHRoZSBmaWxl
Cj4gIi91c3IvbGliZXhlYy9wZXJmLWNvcmUvdGVzdHMvcGUtZmlsZS5leGUiIHdpbGwgdGh1cyBu
b3QgYmUgaWdub3JlZCwKPiBzaW5jZSBpdCB3aWxsIG5vdCB0cmlnZ2VyIGEgbWF0Y2ggdGhlIHBh
dHRlcm4gdGhhdCB3YXMgYWRkZWQgdG8gdGhlCj4gSUdOT1JFUyBhcnJheSAoIi91c3IvbGliZXhl
Yy9wZXJmLWNvcmUvdGVzdHMvcGUtZmlsZS5leGUvIikuCj4KPiBUaGlzIG1lYW5zIHRoYXQgdGhl
IC1pIG9wdGlvbiBpbiBjaGVjay1iaW4tYXJjaCBvbmx5IHN1cHBvcnRzIGRpcmVjdG9yaWVzCj4g
YW5kIG5vdCBmaWxlcy4KPgo+IEZpeCB0aGUgTElOVVhfVE9PTFNfQklOX0FSQ0hfRVhDTFVERSBp
bgo+IHBhY2thZ2UvbGludXgtdG9vbHMvbGludXgtdG9vbC1wZXJmLm1rLmluIHRvIHNwZWNpZnkg
YSBkaXJlY3RvcnksIGFzIHRoZQo+IGV4aXN0aW5nIExJTlVYX1RPT0xTX0JJTl9BUkNIX0VYQ0xV
REUgY2FuIG5ldmVyIGhhdmUgYWN0dWFsbHkgd29ya2VkLgo+Cj4gRml4ZXM6IGE3YWQ3ODE2MjYy
ZCAoInBhY2thZ2UvbGludXgtdG9vbHM6IEV4Y2x1ZGUgY2hlY2tpbmcgUEUgYmluYXJpZXMgZnJv
bSBwZXJmIHRlc3QiKQo+IFNpZ25lZC1vZmYtYnk6IE5pa2xhcyBDYXNzZWwgPGNhc3NlbEBrZXJu
ZWwub3JnPgoKIMKgQXBwbGllZCB0b8KgMjAyNS4wMi54LCAyMDI0LjExLnggYW5kIDIwMjQuMDIu
eCwgdGhhbmtzLgoKIMKgUmVnYXJkcywKIMKgQXJub3V0Cgo+IC0tLQo+ICAgcGFja2FnZS9saW51
eC10b29scy9saW51eC10b29sLXBlcmYubWsuaW4gfCAzICstLQo+ICAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
bGludXgtdG9vbHMvbGludXgtdG9vbC1wZXJmLm1rLmluIGIvcGFja2FnZS9saW51eC10b29scy9s
aW51eC10b29sLXBlcmYubWsuaW4KPiBpbmRleCBkZjMwMzA0MzllLi5kNjczMTg1NzFhIDEwMDY0
NAo+IC0tLSBhL3BhY2thZ2UvbGludXgtdG9vbHMvbGludXgtdG9vbC1wZXJmLm1rLmluCj4gKysr
IGIvcGFja2FnZS9saW51eC10b29scy9saW51eC10b29sLXBlcmYubWsuaW4KPiBAQCAtMTgwLDgg
KzE4MCw3IEBAIGRlZmluZSBQRVJGX0lOU1RBTExfUkVNT1ZFX1NDUklQVFMKPiAgIGVuZGVmCj4g
ICAKPiAgIExJTlVYX1RPT0xTX0JJTl9BUkNIX0VYQ0xVREUgKz0gXAo+IC0JL3Vzci9saWJleGVj
L3BlcmYtY29yZS90ZXN0cy9wZS1maWxlLmV4ZSBcCj4gLQkvdXNyL2xpYmV4ZWMvcGVyZi1jb3Jl
L3Rlc3RzL3BlLWZpbGUuZXhlLmRlYnVnCj4gKwkvdXNyL2xpYmV4ZWMvcGVyZi1jb3JlL3Rlc3Rz
Lwo+ICAgZW5kaWYKPiAgIAo+ICAgZGVmaW5lIFBFUkZfSU5TVEFMTF9UQVJHRVRfQ01EUwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
