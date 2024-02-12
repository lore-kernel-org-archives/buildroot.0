Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B26C48297
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 05:16:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1B8783E0D;
	Mon, 12 Feb 2024 05:16:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9jzy2L-IxgxV; Mon, 12 Feb 2024 05:16:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B809D83E0E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B809D83E0E;
	Mon, 12 Feb 2024 05:16:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0D6251BF2F7
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 05:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0875041BAF
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 05:16:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zL06tEDJ9xsa for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 05:16:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com;
 envelope-from=abiliojr@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AAE9F41BAE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AAE9F41BAE
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AAE9F41BAE
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 05:16:31 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2d09bdddfc9so35586701fa.2
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 21:16:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707714989; x=1708319789;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TLjBIVEZXxcQYrJsBzR9at7/B+5dthqU412knxTpCIc=;
 b=iyOGhMfKZfPujAStXHwpIjS9PZ6qrb4LM+XF0Wl8xO2G09zR1TDg1Djf0z8IXUbl9B
 k7kbDSiTVja9HGWrJxFYTfQLXRaZ0FnuXO7Oz2Y/NIw0P2oMlvxTH1CiiGp0wPTb51Zs
 4k0lZAdtvMn2GdtTH2/gGT2NRE53efbMNuWQUNh7URknqb1v0ev+EHDulS2jT6h3doQd
 l8Bie2k7b/6pGLc7CjLXV79z9hPw1JZRXRIhmJ0JnZbvxofgxOQdzcGairqmZfWYkA1k
 nw9ZpbnCsSNdUXwYUSYh9jw9ZgA159I+RIyWLTggAa+yhrUOwNwGjb8rn2QjwWsuGd4B
 Ab8w==
X-Gm-Message-State: AOJu0YycrVWqu/D+S+nFhNdZSA3DZrGBL1Udu5JMMxKkgbnMkzATtXmh
 AD0uirTTevNhqRdKl5W6W5CO7I2DxJvXGr9cL7hjt3uMEY9z7GOajEwQm0wbPfJaEBjTJ2o/J84
 SefNokbnYwwS7ZyimeLX5lY8wxRY=
X-Google-Smtp-Source: AGHT+IF02d9VD3z6ItRciqdPUV/O/oLn5ecQfKc5XfdK8Rfje1ITDaCPo3QDNh+rMncuP9ohQJB+dkHIOlvQyWvkf7A=
X-Received: by 2002:a2e:be9d:0:b0:2d0:f6c8:2335 with SMTP id
 a29-20020a2ebe9d000000b002d0f6c82335mr1852110ljr.24.1707714989022; Sun, 11
 Feb 2024 21:16:29 -0800 (PST)
MIME-Version: 1.0
References: <20240204062645.3616072-1-abiliojr@gmail.com>
 <ZcDhkvk_uO8wbQoz@landeda>
 <CAEWqYrVOgiBYqYad3RDX5BfRvqF2LJxSTvdqgwQ9aVA7SWfKEQ@mail.gmail.com>
 <ZckJ608XA98Pfo-Z@landeda>
In-Reply-To: <ZckJ608XA98Pfo-Z@landeda>
From: Abilio Marques <abiliojr@gmail.com>
Date: Sun, 11 Feb 2024 21:16:17 -0800
Message-ID: <CAEWqYrV+mEvwPawT+3kEDmCVXFPgHG6LZjwkj7MXpUJzPaLCwg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707714989; x=1708319789; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TLjBIVEZXxcQYrJsBzR9at7/B+5dthqU412knxTpCIc=;
 b=QB1wUhPUkWUXgSBNcMMN73OZQZyiVTslplsVP7zBFulL4KQhryrrl+6pO37VMl+jln
 zXgW7qIdH50WWdme7bpxeG6RPmdZAAytqYg6orNKP2V4ekbYc/Dx7ca5lNtIFVqC6mXS
 eSUsLKcRMF1n7K/Erhd+br3QaLlSnN3NhcpjMmF2r17lFjEBEpNTP0cwB6XfY2QrqR95
 yIspgp5hKPfRQpQHZ34bxaBJjtvYDCecQIwjGM7t4QKI0D6e9zl4fNgKJzffU+7mYgpV
 rP4Mjk0nEGWFQJ27zD327IL3E7JMJFmYKigNrlLBJCi58NZSFLq5BG3iRkvRS+wwyPKB
 2ynQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QB1wUhPU
Subject: Re: [Buildroot] [PATCH] package/micropython: add support for
 manifest.py in the configuration
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
Cc: Chris Packham <judge.packham@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCBGZWIgMTEsIDIwMjQgYXQgOTo1NOKAr0FNIFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9y
aW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPgo+IEFiaWxpbywgQWxsLAo+Cj4gW1BsZWFzZSwgZG9u
J3QgdG9wLXBvc3QsIGJ1dCByZXBseSBpbi1saW5lXQo+Cj4gT24gMjAyNC0wMi0xMSAwOToxNSAt
MDgwMCwgQWJpbGlvIE1hcnF1ZXMgc3Bha2UgdGh1c2x5Ogo+ID4gT25lIG9mIHRoZSB1c2VzIG9m
IG1hbmlmZXN0LnB5IGlzIHRvIHNwZWNpZnkgd2hpY2ggbW9kdWxlcyBvZgo+ID4gbWljcm9weXRo
b24tbGliIHNob3VsZCBiZSBmcm96ZW4gd2l0aGluIHRoZSBiaW5hcnkuICBGb3IgdGhvc2UgbW9k
dWxlcyB5b3UKPiA+IGRvbid0IG5lZWQgdG8gaW5jbHVkZSB0aGUgcGF0aC4gZS5nLiwKPiA+IHBh
Y2thZ2UoJ29zJykKPiA+Cj4gPiBUaGF0J3MgdGhlIGFwcGxpY2F0aW9uIEknbSBnb2luZyBmb3Iu
IEkga25vdyBpdCBzZWVtcyBsaW1pdGVkIGJ1dCBpdCdzCj4gPiByZWFsbHkgdXNlZnVsLAo+Cj4g
T0ssIHNvIG1heWJlIHRoaXMgY2FuIGJlIGV4cGxhaW5lZCBpbiB0aGUgaGVscCB0ZXh0IG9mIHRo
ZSBuZXcgb3B0aW9uLAo+IGxpa2U6Cj4KPiAgICAgTm90ZTogaW4gQnVpbGRyb290LCBvbmx5IG1v
ZHVsZXMgcHJvdmlkZWQgd2l0aCBtaWNyb3B5dGhvbi1saWIKPiAgICAgY2FuIGJlIGZyb3plbiB3
aXRoIGEgbWFuaWZlc3Q7IGZyZWV6aW5nIGFyYml0cmFyeSBmaWxlcyBpcyBub3QKPiAgICAgc3Vw
cG9ydGVkLgo+Cj4gYWxvbmcgd2l0aCBhIGxpdHRsZSBibHVyYiBpbiB0aGUgY29tbWl0IGxvZywg
c3RhdG5nIHNvbWV0aGluZyBsaWtlOwo+Cj4gICAgIFdlIG9ubHkgc3VwcG9ydCBmcmVlemluZyBv
ZiBtb2R1bGVzIGZyb20gbWljcm9weXRob24tbGliLiBGcmVlemluZwo+ICAgICBhcmJpdHJhcnkg
bW9kdWxlcyB3b3VsZCByZXF1aXJlIHNvbWUgaGFuZGxpbmcgb2YgYWJzb3VsdGUgcGF0aHMsIGFu
ZAo+ICAgICBhIGd1YXJhbnRlZSB0aGF0IHRoZSBmaWxlcyBiZSBhdmFpbGFibGUgYmVmb3JlIG1p
Y3JvcHl0aG9uIGlzIGJ1aWx0LAo+ICAgICB3aGljaCBpcyBjb25zaWRlcmVkIGEgYml0IHRvbyBj
b21wbGV4OyBhbiBpbnRlcmVzdGVkIHBhcnR5IGNhbgo+ICAgICBwcm92aWRlIHN1Y2ggc3VwcG9y
dCBpbiB0aGUgZnV0dXJlLgo+Cj4gQW5kIHRodXMsIHdvdWxkIGl0IGJlIHBvc3NpYmxlIHRvIHNh
bml0eS1jaGVjayB0aGUgbWFuaWZlc3QgdG8gZW5zdXJlCj4gdGhhdCBpdCBpbmRlZWQgb25seSBy
ZWZlcmVuY2VzIG1vZHVsZXMgZnJvbSBpY3JvcHl0aG9uLWxpYiwgc28gdGhhdAo+IHBlb3BsZSBk
byBub3QgZ2V0IHRoZSBpbXByZXNzaW9uIGl0IHdvcmtzIHdoZW4gaW4gZmFjdCBpdCBkb2VzIG5v
dD8KPgo+IExpa2UsIGdyZXAgdGhhdCBvbmx5IHJlcXVpcmUoLi4uKSBhcmUgdXNlZD8KCk5vdCBz
dXJlIGhvdyB0byBkbyBpdCBjb3JyZWN0bHkuIFRoZSBtYW5pZmVzdCBpcyBhIHJlZ3VsYXIgcHl0
aG9uIGZpbGUsIGFuZCBJJ20Kbm90IHN1cmUgaG93IHRvIGRvIGl0IGluIGEgd2F5IHRoYXQgZG9l
cyB0aGUgY29ycmVjdCB0aGUgdGhpbmcuIGUuZy4sCnRoZSB1c2VyIG1pZ2h0CndhbnQgdG8gYWRk
IGNvbW1lbnQgbGluZXMgb3IgYW4gaW5jbHVkZSB0byBhIHNlY29uZCBwYXJ0IG9mIHRoZSBtYW5p
ZmVzdC4KCj4KPiAoTm90ZTogeW91IG1lbnRpb25lZCBwYWNrYWdlKC4uLikgYnV0IHRoYXQgaXMg
bm90IGxpbWl0ZWQgdG8gZmlsZXMgZnJvbQo+IG1pY3JvcHl0aG9uLWxpYjsgcmVxdWlyZSguLi4p
IGhvd2V2ZXIgaXMuKQo+Cj4gPiBhbmQgcHJvYmFibHkgd2VsY29tZWQgYnkgb3RoZXIgcGVvcGxl
IHVzaW5nIE1pY3JvcHl0aG9uIGluCj4gPiB0aGUgbmV4dCByZWxlYXNlIG9mIEJ1aWxkcm9vdC4K
Pgo+IE9uZSBxdWVzdGlvbiBJIHdhcyB3b25kZXJpbmcgYWJvdXQ6IGlmIGEgbW9kdWxlIGlzIGZy
b3plbiBpbiB0aGUgYmluYXJ5LAo+IHRoZW4gaXQgaXMgbm8gbG9uZ2VyIG5lZWRlZCBpbiB0aGUg
ZmlsZXN5c3RlbSwgcmlnaHQ/IElmIHNvLCBzaG91bGQgd2UKPiBoYXZlIGEgd2F5IHRvIHJlbW92
ZSB0aGVtPwoKR29vZCBpZGVhLiBEbyB5b3UgbWluZCBpZiBJIGFkZCB0aGlzIGluIGEgc2VwYXJh
dGUgcGF0Y2g/Cgo+Cj4gPiBJIGhhdmUgaWRlYXMgb24gaG93IHRvIHNvbHZlIHRoZSBwYXRoIGFu
ZCBkZXBlbmRlbmN5IG9yZGVyIHByb2JsZW0gd2hpbGUKPiA+IHN0aWxsIHVzaW5nIHRoZSAib2Zm
aWNpYWwiIG1hbmlmZXN0LnB5IGNvbmNlcHQuIFRoZSBiaWdnZXN0IGNoYWxsZW5nZSBpcwo+ID4g
dGhhdCBjdXJyZW50bHkgdGhlcmUgYXJlIG5vIG90aGVyIDNyZCBwYXJ0eSBNaWNyb3B5dGhvbiBt
b2R1bGVzIGF2YWlsYWJsZQo+ID4gZm9yIEJ1aWxkcm9vdCwgc28gdGhhdCBtYWtlcyBpdCBhbGwg
dmVyeSB0aGVvcmV0aWNhbC4gQWxsIHNvbHV0aW9ucyByZXF1aXJlCj4gPiBhIGJpZ2dlciBhbW91
bnQgb2Ygd29yayB0aGFuIHRoZSBvbmUgbmVlZGVkIGZvciB0aGlzIHBhdGNoLiBBbHNvLCBJIHdv
dWxkCj4gPiBsaWtlIHRvIGRpc2N1c3MgdGhlbSBiZWZvcmUgYWN0dWFsbHkgcHJlc2VudGluZyBh
IHBhdGNoIHRoYXQgYWxsb3dzIDNyZAo+ID4gcGFydHkgbW9kdWxlcyB0byBiZSBmcm96ZW4uCj4K
PiBJbmRlZWQsIHdpdGhvdXQgYSBmZXcgYWN0dWFsIGV4YW1wbGVzLCBpdCdzIGdvaW5nIHRvIGJl
IGRpZmZpY3VsdCB0byBzZWUKPiBhIGNvbW1vbiBwYXR0ZXJuIGFuZCBhYnN0cmFjdCB0aGF0IGF3
YXkuIEFyZSB0aGVyZSBhbnkgcHVsaWNseQo+IGF2YWlsYWJsZT8KPgo+ID4gSSBhbHdheXMgdHJ5
IHRvIGdvIGZvciBhbiBpbmNyZW1lbnRhbCBhcHByb2FjaCwgd2hlcmUgSSBnZXQgdGhlIGJpZ2dl
ciBiYW5nCj4gPiBmb3IgdGhlIGJ1Y2suIEkgYmVsaWV2ZSB0aGF0IGFsbG93aW5nIHBlb3BsZSB0
byBmcmVlemUgdGhlIG9mZmljaWFsCj4gPiBNaWNyb3B5dGhvbiBtb2R1bGVzIGlzIGFscmVhZHkg
YSBiaWcgc3RlcCBmb3J3YXJkLiBCdXQgYXQgdGhlIHNhbWUgdGltZSwKPiA+IEknbSBuZXcgdG8g
dGhlIEJ1aWxkcm9vdCBwcm9qZWN0LCBzbyBwbGVhc2UgYWR2aWNlIG9uIHRoZSBhcHByb2FjaC4K
Pgo+IFRoZSBpbmNyZW1lbnRhbCBwYXRoIGlzIHRvdGFsbHkgT0s7IEkgZXZlbiBwcmVmZXIgaXQu
IE9mIGNvdXJzZSwgYW55Cj4gbGltaXRhdGlvbiAoc3VjaCBhcyB0aG9zZSB3ZSBhcmUgZGlzY3Vz
c2luZykgc2hvdWxkIGJlIGV4cGxhaW5lZCBpbiB0aGUKPiBjb21taXQgbG9nLgo+Cj4gR2l2ZW4g
YWxsIHRoZSBmZWVkYmFjayBpbiB0aGlzIHRocmVhZCwgY2FuIHlvdSByZXNwaW4gYSB2MiB0YWtp
bmcgdGhlCj4gY29tbWVudHMgaW50byBhY2NvdW50PwoKSSBkaWQsIGJ1dCBqdXN0IGZvdW5kIG91
dCB0aGF0IEkgc3VibWl0dGVkIGEgcGF0Y2ggd2l0aCBhIHdoaXRlc3BhY2UKcHJvYmxlbSwgaW4g
dGhpcyBsaW5lCiAgICAiY2FuIGJlIGZyb3plbiB3aXRoIGEgbWFuaWZlc3Q7IGZyZWV6aW5nIGFy
Yml0cmFyeSBmaWxlcyBpcyIKQ291bGQgeW91IHBsZWFzZSBjb3JyZWN0IGl0PwoKPgo+IEFzIGZv
ciB5b3VyIGlkZWFzIGZvciBsaWZ0aW5nIHRob3NlIGxpbWl0YXRpb25zLCB5b3UgY2FuIGp1c3Qg
ZXhwbGFpbgo+IHRoZW0gaW4gYSByZXBseSBpbiB0aGlzIHRocmVhZC4gVXN1YWxseSwgYSBwYXRj
aHNldCBkb2luZyB0aGUgam9iIGlzCj4gYWxzbyBhIGdvb2QgZmlyc3Qgc3RlcCB0byBzdGFydCB0
aGUgZGljc3Vzc2lvbi4KCldpbGwgdHJ5IGEgZmV3IHRoaW5ncyBhbmQgc3VibWl0IG9uZS4KCj4K
PiBSZWdhcmRzLAo+IFlhbm4gRS4gTU9SSU4uCj4KPiAtLQo+IC4tLS0tLS0tLS0tLS0tLS0tLS4t
LS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0t
LS0uCj4gfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkg
UklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKPiB8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3
YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAo+
IHwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAg
ICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8Cj4gfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcv
IHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKPiAnLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0t
LS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
