Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B49FCA0EED
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 20:27:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2027D81210;
	Thu, 28 Aug 2025 20:27:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GD90l15LA5PK; Thu, 28 Aug 2025 20:27:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FAA183EC7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FAA183EC7;
	Thu, 28 Aug 2025 20:27:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 745F2928
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 20:27:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 650F383EC7
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 20:27:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HYGUVBsTNGgI for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 20:27:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6987D81210
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6987D81210
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6987D81210
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 20:27:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F3F2CB978306; Thu, 28 Aug 2025 22:27:49 +0200 (CEST)
Message-ID: <0f6eab32-2aa6-4a34-8a35-9bbd93e4991c@rnout.be>
Date: Thu, 28 Aug 2025 22:27:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Romain Naour <romain.naour@smile.fr>, Florian Larysch <fl@n621.de>,
 buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250822212816.15241-1-fl@n621.de>
 <87d20357-7f5d-422d-9893-6ac6466f64ed@smile.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <87d20357-7f5d-422d-9893-6ac6466f64ed@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1756412870; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=XgipVg1R7fJbuwGns7QFMTsfc3wKDyy7hf6pHD7Hy+Q=;
 b=m62pC0fhn3EXd31VeKuuQrhHBxMz69mroazEp57nPwuTcPE8sJ56hVspMmhxTQGmjea7FG
 hXy2lCYWpj7XfB5YYBKFDiVDK1jwbtNIw8xD4UwfxK1jK5n++Gvz5N6FlzRSdh3O32dXmO
 F9Mp4cek5/8DQL9C6ayU7ayZUY7MBDYme8v7M8BCWb2UjQ0XcStwH/4Ef2EIYVYThuVkzH
 wYz7K5zgjoeaJAH/hvc3bPHNN8ZZF4bqCCHqGGgeG1yweYgiUDkRfjvRglSrNcHXUj0pPe
 fQcQhvFdDWlRaewUmW9+INRUzqsqEusCE6zgZHzsTUK5iZuq9RxHfCuU6NcaHg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=m62pC0fh
Subject: Re: [Buildroot] [PATCH 1/1] docs/manual: mention checkpackageignore
 file
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

CgpPbiAyMy8wOC8yMDI1IDIzOjU0LCBSb21haW4gTmFvdXIgdmlhIGJ1aWxkcm9vdCB3cm90ZToK
PiBIZWxsbyBGbG9yaWFuLCBBbGwsCj4gCj4gTGUgMjIvMDgvMjAyNSDDoCAyMzoyNywgRmxvcmlh
biBMYXJ5c2NoIGEgw6ljcml0wqA6Cj4+IEN1cnJlbnRseSwgdGhlIG1hbnVhbCBkb2Vzbid0IG1l
bnRpb24gdGhlIGNoZWNrcGFja2FnZWlnbm9yZSBmaWxlIGF0Cj4+IGFsbCwgbGVhdmluZyB0aGUg
dXNlciB1bmRlciB0aGUgYXNzdW1wdGlvbiB0aGF0IHJ1bm5pbmcgIm1ha2UKPj4gY2hlY2stcGFj
a2FnZSIgYW5kIHJ1bm5pbmcgdXRpbHMvY2hlY2stcGFja2FnZSBkaXJlY3RseSBvbiB0aGUgcGFj
a2FnZQo+PiB0aGV5IGhhdmUgdG91Y2hlZCB3b3VsZCBiZSBlcXVpdmFsZW50LCB3aGVuIHRoZSBm
b3JtZXIgZXZhbHVhdGVzIHRoZQo+PiBjaGVja3BhY2thZ2VpZ25vcmUgZmlsZSB3aGlsZSB0aGUg
bGF0dGVyIGRvZXMgbm90LiBUaGlzIGNvdWxkIGNhdXNlIHRoZW0KPj4gdG8gZm9yZ2V0IHRvIHJl
bW92ZSBzdGFsZSBlbnRyaWVzIGZyb20gdGhhdCBmaWxlLgo+Pgo+PiBQb2ludCBvdXQgdGhpcyBk
aWZmZXJlbmNlIGluIGJlaGF2aW9yLgo+IAo+IEFjdHVhbGx5IC5jaGVja3BhY2thZ2VpZ25vcmUg
ZmlsZSBtdXN0IGJlIHJlbW92ZWQgYXMgc29vbiBhcyBwb3NzaWJsZSEgKEknbSBub3QKPiB1c2Ug
d2UgcmVhbGx5IHdhbnQgdG8gYWRkIGl0IHRvIHRoZSBtYW51YWwpCj4gT3ZlciB0aGUgdGltZSwg
dGhlIG51bWJlciBvZiBpZ25vcmVkIHdhcm5pbmdzIGlzIHJlZHVjZWQuCgogIFdlbGwsIEkgdGhp
bmsgdGhpcyBwYXRjaCBhZGRyZXNzZXMgdGhhdCBieSBtYWtpbmcgaXQgZXhwbGljaXQgdGhhdCBs
aW5lcyAKc2hvdWxkIGJlIHJlbW92ZWQgZnJvbSB0aGF0IGZpbGUuCgpbc25pcF0KPiBBbHNvLCBy
dW5uaW5nIHV0aWxzL2NoZWNrLXBhY2thZ2UgZGlyZWN0bHkgb24geW91ciBob3N0IHdpdGhvdXQg
dXNpbmcKPiB1dGlscy9kb2NrZXItcnVuIG1heSBnaXZlIGEgZGlmZmVyZW50IHJlc3VsdCBkdWUg
dG8gdGhlIFNoZWxsY2hlY2sgYW5kIGZsYWtlOAo+IHZlcnNpb24uCj4gVGhhdCdzIHdoeSwgaXQn
cyBhY3R1YWxseSBiZXR0ZXIgdXNpbmcgY2hlY2stcGFja2FnZSBmcm9tIERvY2tlciBlbnZpcm9u
bWVudAo+ICh1dGlscy9kb2NrZXItcnVuKS4KCiAgVGhhdCdzIGluZGVlZCB3aGF0IHRoZSBleGFt
cGxlIGNvZGUgZG9lcy4KCj4gVXNpbmcgdXRpbHMvY2hlY2stcGFja2FnZSBkaXJlY3RseSBpcyB1
c2VmdWwgd2hlbiBhZGRpbmcgYSBuZXcgcGFja2FnZSAobm8KPiAuY2hlY2twYWNrYWdlaWdub3Jl
IGVudHJ5IGV4aXN0KSBvciBjaGVja2luZyBwYWNrYWdlcyBmcm9tIGEgQlIyX0VYVEVSTkFMIFsy
XS4KCiAgWWVzLCB0aGUgdGV4dCBhbHJlYWR5IGhhcyBhIHJlZmVyZW5jZSB0byB0aGF0IHNlY3Rp
b24uIEluIHRoYXQgc2VjdGlvbiwgCnRob3VnaCwgdGhlIGNoZWNrcGFja2FnZWlnbm9yZSBmaWxl
IGlzIG5vdCByZWxldmFudCBiZWNhdXNlIHlvdSBzaG91bGQgbmV2ZXIgYWRkIAp0byBpdC4KCiAg
U28gSSB0aGluayB0aGlzIHBhdGNoIGFjY3VyYXRlbHkgYWRkcmVzc2VzIGEgc2hvcnRjb21pbmcg
aW4gdGhlIG1hbnVhbCBhbmQgCkkndmUgYXBwbGllZCBpdC4KCiAgUmVnYXJkcywKICBBcm5vdXQK
Cj4gCj4gWzFdCj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0v
Y29tbWl0LzFlZDA3NTIxMzIyZDVkMGVjMjYyODgzMTY5NDQzYWY5MTJkYjMwZjMKPiAKPiBbMl0K
PiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9ibG9iL21hc3Rl
ci9kb2NzL21hbnVhbC9hZGRpbmctcGFja2FnZXMtdGlwcy5hZG9jP3JlZl90eXBlPWhlYWRzI2No
ZWNrLXBhY2thZ2UKPiAKPj4KPj4gU2lnbmVkLW9mZi1ieTogRmxvcmlhbiBMYXJ5c2NoIDxmbEBu
NjIxLmRlPgo+PiAtLS0KPj4gICBkb2NzL21hbnVhbC9jb250cmlidXRlLmFkb2MgfCA2ICsrKyst
LQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+
Cj4+IGRpZmYgLS1naXQgYS9kb2NzL21hbnVhbC9jb250cmlidXRlLmFkb2MgYi9kb2NzL21hbnVh
bC9jb250cmlidXRlLmFkb2MKPj4gaW5kZXggZmZhZmY2Zjg1Ny4uYjQ4NGY4YjUyNCAxMDA2NDQK
Pj4gLS0tIGEvZG9jcy9tYW51YWwvY29udHJpYnV0ZS5hZG9jCj4+ICsrKyBiL2RvY3MvbWFudWFs
L2NvbnRyaWJ1dGUuYWRvYwo+PiBAQCAtMzIxLDkgKzMyMSwxMSBAQCBOb3cgY2hlY2sgdGhlIGNv
ZGluZyBzdHlsZSBmb3IgdGhlIGNoYW5nZXMgeW91IGNvbW1pdHRlZDoKPj4gICAkIHV0aWxzL2Rv
Y2tlci1ydW4gbWFrZSBjaGVjay1wYWNrYWdlCj4+ICAgLS0tLQo+PiAgIAo+PiAtTm93LCB5b3Ug
YXJlIHJlYWR5IHRvIGdlbmVyYXRlIHRoZW4gc3VibWl0IHlvdXIgcGF0Y2ggc2V0Lgo+PiArVGhp
cyBjb21tYW5kICh1bmxpa2UgY2FsbGluZyArdXRpbHMvY2hlY2stcGFja2FnZSsgZGlyZWN0bHkp
IHdpbGwgYWxzbyB3YXJuCj4+ICthYm91dCBhbnkgc3RhbGUgZW50cmllcyBpbiB0aGUgKy5jaGVj
a3BhY2thZ2VpZ25vcmUrIGZpbGUgdGhhdCB5b3VyIHBhdGNoZXMKPj4gK21pZ2h0IGhhdmUgcmVz
b2x2ZWQuCj4gCj4gQnV0IGluZGVlZCwgdXNpbmcgdXRpbHMvY2hlY2stcGFja2FnZSBkaXJlY3Rs
eSBmb3IgaW4gdHJlZSBwYWNrYWdlcyAodmVyc2lvbgo+IGJ1bXApIHdlIG1heSBmb3JnZXQgdG8g
cmVtb3ZlIGFuIC5jaGVja3BhY2thZ2VpZ25vcmUgZW50cnkuCj4gCj4+ICAgCj4+IC1UbyBnZW5l
cmF0ZSBpdCwgcnVuOgo+PiArTm93LCB5b3UgYXJlIHJlYWR5IHRvIGdlbmVyYXRlIHRoZW4gc3Vi
bWl0IHlvdXIgcGF0Y2ggc2V0LiBUbyBnZW5lcmF0ZSBpdCwgcnVuOgo+IAo+IFdoeSBtb3Zpbmcg
dGhlIG5ldyBsaW5lIGhlcmU/Cj4gCj4gQmVzdCByZWdhcmRzLAo+IFJvbWFpbgo+IAo+PiAgIAo+
PiAgIC0tLS0KPj4gICAkIGdpdCBmb3JtYXQtcGF0Y2ggLU0gLW4gLXMgLW8gb3V0Z29pbmcgb3Jp
Z2luL21hc3Rlcgo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
