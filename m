Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F1A3D6392D
	for <buildroot@archiver.kernel.org>; Wed, 20 Nov 2024 11:22:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98F1442DF7;
	Wed, 20 Nov 2024 11:22:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hYRtejrfDnmg; Wed, 20 Nov 2024 11:22:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6008F42E26
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6008F42E26;
	Wed, 20 Nov 2024 11:22:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 084E7970
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 11:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7F1D40BF7
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 11:22:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sVk5k9gk49b0 for <buildroot@buildroot.org>;
 Wed, 20 Nov 2024 11:22:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=168.119.168.44;
 helo=mail.sinic.eu; envelope-from=simon@sinic.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6C554400E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C554400E7
Received: from mail.sinic.eu (mail.sinic.eu [168.119.168.44])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C554400E7
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 11:22:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 75C1E46253; Wed, 20 Nov 2024 12:22:42 +0100 (CET)
Message-ID: <57b1206c-8972-47f1-9255-e70b1185e6a1@sinic.eu>
Date: Wed, 20 Nov 2024 12:22:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: yann.morin@orange.com, Vincent Jardin <vjardin@free.fr>
Cc: buildroot@buildroot.org
References: <20241120073755.17583-1-simon@sinic.eu>
 <Zz2f6UeSKuyrpZuJ@yd-6wlzhs3>
Content-Language: en-US
In-Reply-To: <Zz2f6UeSKuyrpZuJ@yd-6wlzhs3>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sinic.eu; s=dkim; 
 t=1732101764; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=5MYxvi+qL7grVBHPbfrv/UEjYG5mK+4SVBNIYdlrn2w=;
 b=QbaZcu64g2jiuYuPgCml6eAAUDWzSoGEmrJD3Hu0psLpdM6cwZ0UnyMEFbTEf0g8mVJct4
 UouDAVOvf6i6YXnanTaxt2z/bqjUkO71EG9U55UU/Ji6rVPU5IjwcOUcK1zx/kFLdqJACY
 RsC2znmG5erpnBfQ4wYMOvb7FRzWbcncTA4hVr5nRTtn+QG4n1l6u+5RlHSlOriMba2Bwe
 wMGA0ano0aI8OcfA7G6E0MVvkw6FSnve/hN8vtKNZn+Hir04hQJA2pvQNL9j6L7HeuRH+6
 LCImzOqsgGpv4S4LgX5XHbZ/kRhq0JRGWkknaCq3t0r2p7XFQa1sSS7byNRpTw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=sinic.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=sinic.eu header.i=@sinic.eu header.a=rsa-sha256
 header.s=dkim header.b=QbaZcu64
Subject: Re: [Buildroot] [PATCH] package/pkg-generic.mk: add missing quotes
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
From: Simon Richter via buildroot <buildroot@buildroot.org>
Reply-To: Simon Richter <simon@sinic.eu>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgWWFubiwgaGkgVmluY2VudCwKCkFtIDIwLjExLjI0IHVtIDA5OjM4IHNjaHJpZWIgeWFubi5t
b3JpbkBvcmFuZ2UuY29tOgo+IFNpbW9uLCBBbGwsCj4KPiBPbiAyMDI0LTExLTIwIDA4OjM3ICsw
MTAwLCBTaW1vbiBSaWNodGVyIHZpYSBidWlsZHJvb3Qgc3Bha2UgdGh1c2x5Ogo+PiBUaGlzIGFs
bG93cyA8UEtHPl9TT1VSQ0UgdG8gY29udGFpbiBjaGFyYWN0ZXJzIGxpa2UgYCZgLgo+Pgo+PiBT
aWduZWQtb2ZmLWJ5OiBTaW1vbiBSaWNodGVyPHNpbW9uQHNpbmljLmV1Pgo+PiAtLS0KPj4gICBw
YWNrYWdlL3BrZy1nZW5lcmljLm1rIHwgMiArLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9wa2ctZ2Vu
ZXJpYy5tayBiL3BhY2thZ2UvcGtnLWdlbmVyaWMubWsKPj4gaW5kZXggOWVjODRkMGY0NS4uOTZj
YzVhMWQyNSAxMDA2NDQKPj4gLS0tIGEvcGFja2FnZS9wa2ctZ2VuZXJpYy5tawo+PiArKysgYi9w
YWNrYWdlL3BrZy1nZW5lcmljLm1rCj4+IEBAIC0xNzYsNyArMTc2LDcgQEAgJChCVUlMRF9ESVIp
LyUvLnN0YW1wX2Rvd25sb2FkZWQ6Cj4+ICAgCSQoY2FsbCBwcmVwYXJlLXBlci1wYWNrYWdlLWRp
cmVjdG9yeSwkKCQoUEtHKV9GSU5BTF9ET1dOTE9BRF9ERVBFTkRFTkNJRVMpKQo+PiAgIAkkKGZv
cmVhY2ggaG9vaywkKCQoUEtHKV9QUkVfRE9XTkxPQURfSE9PS1MpLCQoY2FsbCAkKGhvb2spKSQo
c2VwKSkKPj4gICAjIE9ubHkgc2hvdyB0aGUgZG93bmxvYWQgbWVzc2FnZSBpZiBpdCBpc24ndCBh
bHJlYWR5IGRvd25sb2FkZWQKPj4gLQkkKFEpZm9yIHAgaW4gJCgkKFBLRylfQUxMX0RPV05MT0FE
Uyk7IGRvIFwKPj4gKwkkKFEpZm9yIHAgaW4gIiQoJChQS0cpX0FMTF9ET1dOTE9BRFMpIjsgZG8g
XAo+IFdoYXQgdGhpcyBjaGFuZ2UgaXMgZG9pbmcgaXMgYmFzaWNhbGx5IG1ha2UgdGhlIGZvci1s
b29wIHVzZWxlc3MuCj4KPiAkKCQoUEtHKV9BTExfRE9XTkxPQURTKSBpcyBhIHNwYWNlLXNlcGFy
YXRlZCBsaXN0LCB0aGF0IG1heSBjb250YWluIG1vcmUKPiB0aGFuIG9uZSBpdGVtLCBzbyBpdCBt
dXN0IG5vdCBiZSBxdW90ZWQuCj4KPiBTZWUgZm9yIGV4YW1wbGUgdGhlIGN2cyBwYWNrYWdlOgo+
Cj4gICAgICAkIG1ha2UgZGVmY29uZmlnCj4gICAgICAkIG1ha2Ugc2hvdy12YXJzIDI+JjEgfGpx
IC5DVlNfQUxMX0RPV05MT0FEUwo+ICAgICAgewo+ICAgICAgICAiZXhwYW5kZWQiOiAiaHR0cCto
dHRwOi8vc25hcHNob3QuZGViaWFuLm9yZy9hcmNoaXZlL2RlYmlhbi8yMDE0MTAyM1QwNDMxMzJa
L3Bvb2wvbWFpbi9jL2N2cy9jdnNfMS4xMi4xMy5vcmlnLnRhci5neiBodHRwK2h0dHA6Ly9zbmFw
c2hvdC5kZWJpYW4ub3JnL2FyY2hpdmUvZGViaWFuLzIwMTQxMDIzVDA0MzEzMlovcG9vbC9tYWlu
L2MvY3ZzL2N2c18xLjEyLjEzLTEyK3NxdWVlemUxLmRpZmYuZ3oiLAo+ICAgICAgICAicmF3Ijog
IiQoQ1ZTX01BSU5fRE9XTkxPQUQpICQoQ1ZTX0FERElUSU9OQUxfRE9XTkxPQURTKSIKPiAgICAg
IH0KPgo+IFNvLCB0aGlzIGlzIG5vdCB0aGUgcHJvcGVyIHNvbHV0aW9uIHRvIHlvdXIgaXNzdWUu
ClRoYW5rcyBmb3IgdGhlIGV4cGxhbmF0aW9uLiBZb3UncmUgcmlnaHQgb2YgY291cnNlLCB3ZSBj
YW4ndCBhcHBseSB0aGUKcGF0Y2ggbGlrZSB0aGF0LCBJIHNob3VsZCBoYXZlIHNlZW4gdGhhdCB0
b28uCgo+IEluZGVlZCwgaGF2aW5nIGAmYCBpbiBhIGZpbGVuYW1lIGlzIHJlYWxseSBhc2tpbmcg
Zm9yIHRyb3VibGUgYWxsIGFsb25nCj4gdGhlIHdheSEgOi0vIEFzIHRoaXMgaXMgYSBkb3dubG9h
ZGVkIGZpbGUsIGhhdmUgeW91IHRyaWVkIFVSTC1lc2NhcGluZwo+IHRoZSBgJmAgd2l0aCAnJTI2
JyBpbnN0ZWFkPyBJZiBpdCB3b3JrcywgdGhhdCB3b3VsZCBnaXZlIGEgb25lLW9mZgo+IHNvbHV0
aW9uIGZvciB5b3VyIGNhc2UsIGJ1dCBtYXliZSB3ZSBuZWVkIHRvIGhhbmRsZSB0aGF0IGluIGEg
Z2VuZXJpYwo+IHdheSAoc29tZWhvdykuLi4KSSB0cmllZCB0byBlbmNvZGUgdGhlIFVSTCAodGhh
bmtzIEBWaW5jZW50KSwgYnV0IEF6dXJlIGRvZXNuJ3QgbGlrZSBpdDoKNDAwIFRoZSB2YWx1ZSBm
b3Igb25lIG9mIHRoZSBIVFRQIGhlYWRlcnMgaXMgbm90IGluIHRoZSBjb3JyZWN0IGZvcm1hdC4K
Ck91ciBjdXJyZW50IHNvbHV0aW9uIGlzIHRvIGFidXNlIDxQS0c+X0RMX09QVFMgYXMgd2UgZG9u
J3QgbmVlZCB0aGUKdmFyaWFibGUgKHdpdGggb3VyIHBhY2thZ2VzIHRvIGJlIGxvYWRlZCB2aWEg
QXp1cmUpLiBXZSBoYXZlIG91cgpvd24gZG93bmxvYWQgc2NyaXB0IChhIGN1c3RvbWl6ZWQgY29w
eSBvZiBzdXBwb3J0L2Rvd25sb2FkL3dnZXQpOgoKIMKgwqDCoCA8d2hpbGUgZ2V0b3B0cz4KIMKg
wqDCoCBzaGlmdCAkKChPUFRJTkQtMSkpCiDCoMKgwqAgc2FzPSIkMeKAnQogwqDCoMKgIHNoaWZ0
CiDCoMKgwqAgdXJsPSR7dXJsIyorKit9ICMgcmVtb3ZlIHRoZSAnYXpjb3B5KycgYmVmb3JlICdo
dHRwczovLy4uLicKIMKgwqDCoCBfd2dldCgpIHsKIMKgwqDCoMKgwqDCoMKgIGVjaG8gJHtXR0VU
fSDigJwke0B94oCdCiDCoMKgwqDCoMKgwqDCoCBldmFsICR7V0dFVH0g4oCcJHtAfeKAnQogwqDC
oMKgIH0KIMKgwqDCoCBfd2dldCAtTyDigJzigJgke291dHB1dH3igJnigJ0g4oCc4oCYJHt1cmx9
LyR7ZmlsZW5hbWV9JHtzYXN94oCZ4oCdCgoKSW4gbXkgb3BpbmlvbiB0aGlzIGlzIG1vcmUgb2Yg
YSBoYWNrIHRoYW4gYSBzb2x1dGlvbi4KCkRvIHlvdSBoYXZlIGFueSBpZGVhcyBvbiBob3cgd2Ug
Y291bGQgc29sdmUgdGhpcyBwcm9wZXJseSAoc28gdGhhdAp3ZSBjYW4gYnJpbmcgaXQgdXBzdHJl
YW0pPwoKClRoYW5rcyBhbmQgcmVnYXJkcywKU2ltb24KCgo+IFJlZ2FyZHMsCj4gWWFubiBFLiBN
T1JJTi4KPgo+PiAgIAkJaWYgdGVzdCAhIC1lICQoJChQS0cpX0RMX0RJUikvYGJhc2VuYW1lICQk
cGAgOyB0aGVuIFwKPj4gICAJCQkkKGNhbGwgTUVTU0FHRSwiRG93bmxvYWRpbmciKSA7IFwKPj4g
ICAJCQlicmVhayA7IFwKPj4gLS0gCj4+IDIuNDcuMAo+Pgo+PiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4+
IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
