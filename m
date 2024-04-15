Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E6CC4345F
	for <buildroot@archiver.kernel.org>; Mon, 15 Apr 2024 12:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8035740558;
	Mon, 15 Apr 2024 12:59:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6eHipG9y41i7; Mon, 15 Apr 2024 12:59:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B51F40798
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B51F40798;
	Mon, 15 Apr 2024 12:59:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 42DF61BF284
 for <buildroot@lists.busybox.net>; Mon, 15 Apr 2024 12:59:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2FF7B60793
 for <buildroot@lists.busybox.net>; Mon, 15 Apr 2024 12:59:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PNj8J5fAv-6z for <buildroot@lists.busybox.net>;
 Mon, 15 Apr 2024 12:59:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 98A6F606BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98A6F606BE
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 98A6F606BE
 for <buildroot@buildroot.org>; Mon, 15 Apr 2024 12:59:43 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-346f4266e59so2405976f8f.3
 for <buildroot@buildroot.org>; Mon, 15 Apr 2024 05:59:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713185981; x=1713790781;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o/7DDiNbiKFZQ4n68YJd8diyTiL3IU/1+bd5gDsmyw8=;
 b=U6AjoMFy8zHvwhzv7DKF8aKWU9J52xVfJ/1uwl3EfXgfGV2srefUX1s6qONt5cEmio
 lM4kJ9Hk3Lwb/prK2/eWRURuVMiZSTc1QX2MEAL5EqHqYj5OtkZ5nc4+qTjsx+GCaHv1
 tA9Tgdg6GwaNRx8CUcqbaoHAMHwy2Qg7Xur77E7RCoHdW6cTQJ14tAz1Lv96aSe2cV9D
 HinhCSb0hU4nieK0RwV1/u0wkthFshnubdZ4jdjkPxe8qg+HjU4epM422eGzWP1GfE90
 +b6XH50E/6l3F9mk0QD9fJzUFD5pmdt0t2zxxrKlUySAhBy6OSZkE6K4fg4dUP5WiAGj
 uEnw==
X-Gm-Message-State: AOJu0Yzu56EIE0Pu6iS6LnmR8zQ7OHlVncuvG3pSLRtiynlhYgqZbRY6
 js752jrQB61qbmY5w++ZwGhCg2aOLnml7lIu+QJqbxVVKchLmc+WsIWYg4XtJxo=
X-Google-Smtp-Source: AGHT+IEnEP+oraX6QIWQd067Ujbmguz8Fs83VqDZrCRUJ7fFoNu4eRnR8dXZ4KDMg9VAu+yFMYDFrQ==
X-Received: by 2002:a05:6000:18d1:b0:346:92f2:af8 with SMTP id
 w17-20020a05600018d100b0034692f20af8mr6362925wrq.1.1713185981183; 
 Mon, 15 Apr 2024 05:59:41 -0700 (PDT)
Received: from [192.168.1.124] ([79.132.235.33])
 by smtp.gmail.com with ESMTPSA id
 q10-20020adffeca000000b0033dd2a7167fsm12097071wrs.29.2024.04.15.05.59.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Apr 2024 05:59:40 -0700 (PDT)
Message-ID: <e06d0987-ec5f-470b-a26f-f13d3a5ae949@essensium.com>
Date: Mon, 15 Apr 2024 14:59:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240412132659.1168317-1-thomas.perale@mind.be>
 <20240412132659.1168317-4-thomas.perale@mind.be> <ZhmS9kRYj2AuqBln@landeda>
Content-Language: en-US
In-Reply-To: <ZhmS9kRYj2AuqBln@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1713185981; x=1713790781; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o/7DDiNbiKFZQ4n68YJd8diyTiL3IU/1+bd5gDsmyw8=;
 b=ONJvmeWcSh8nfqqTsP1ie7d6YOVUDnUrimmQgofoj87nx+xwnYx2vZ9bzfvSQ9w0fH
 0rvJURuf0Fj2L0YnojVYR6QZyeXdDZl4RE7V08qtlU5xhtKxQoFoz6mwLZUMKbeADndM
 rnMsW+BTM2Hf8wO3Vf4Dkq6nvpm+Uo1wbQ3DvPZZLfzD2/8SCsDU2Dfc8ApELjQZKufH
 NVY71v18OSbr5zVHup8hSXtDRuUyJlaKr4vFtyj2/c4VSxQhtm357XyuA317yj+n68fi
 oMOgUi5T9mXJT3yulEB6i+6lkl+FbQoV3D99WoqzsID5shZuuAjyHSh5fAFzUNvaKhnS
 hwzA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=essensium.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=ONJvmeWc
Subject: Re: [Buildroot] [PATCH 3/6] package/go: make host package a virtual
 package
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@essensium.com>
Cc: Arnout Vandecappelle <arnout.vandecappelle@essensium.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Geoff Levand <geoff@infradead.org>, Anisse Astier <anisse@astier.eu>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Christian Stewart <christian@aperture.us>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Thomas Perale <thomas.perale@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

WWFubiwgQ2hyaXN0aWFuLAoKVGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzIEkgd2lsbCBzb29uIHNl
bmQgYSBWMiBvZiB0aGUgcGF0Y2guCgo+IE5vdCByZWxhdGVkIHRvIHRoaXMgcGF0Y2gsIGJ1dCBz
dGlsbCByZWxldmFudCB0byB0aGUgZGlzY3Vzc2lvbjogaXQKPiB3b3VsZCBiZSBldmVuIGJldHRl
ciBpZiB3ZSBjb3VsZCBhbHNvIGhhdmUgdGhlIHBvc3NpYmlsaXR5IHRoYXQgdGhlCj4gc3RhZ2Ut
MyBoYXMgdGhlIG9wdGlvbiBvZiBiZWluZyBhIHByZWJ1aWx0IGdvLgo+Cj4gSW5kZWVkLCBpdCB3
b3VsZCBzdGlsbCBiZSBpbnRlcmVzdGluZyB0byBiZSBhYmxlIHRvIGJ1aWxkIHRoZSBmaW5hbCBn
bwo+IGZyb20gc291cmNlLCBidXQgdXNlIGEgcHJlYnVpbGQgYm9vdHN0cmFwLgpUaGlzIGlzIGEg
Z29vZCBzdWdnZXN0aW9uLCBJIHdpbGwgYWRkIHRoaXMgdG8gbXkgVE9ETyBsaXN0IGFuZCBpbnRy
b2R1Y2UgCml0IGluIGEgZnV0dXJlIHBhdGNoIHNlcmllcy4KCj4gQWxzbywgSSBzZWUgdGhhdCB5
b3UgbW9kZWxlZCB0aGUgc29sdXRpb24gYWZ0ZXIgdGhlIHJ1c3Qgb25lLCBhbmQgdGhpcwo+IGlz
IGdvb2QuCkRvIHlvdSB0aGluayBpdCdzIHdvcnRoIG1vdmluZyBydXN0IHBhY2thZ2VzIHRvIGEg
c3ViZGlyZWN0b3J5IHN0cnVjdHVyZSAKaW4gdGhlIGZ1dHVyZSA/CgpBbHNvLCBhbm90aGVyIHBv
aW50IG9mIHRoZSBidWlsZHJvb3QgVE9ETyBsaXN0IGlzIHRvIGFkZCBzdXBwb3J0IGZvciAKcHJl
YnVpbHQgbm9kZWpzLiBJZiBJIGdldCB0aW1lIHRvIHdvcmsgb24gdGhhdCBwYXRjaCBzZXJpZXMg
aXQgd2lsbCAKcHJvYmFibHkgZm9sbG93IHRoZSBzYW1lIHN1YmRpciBzdHJ1Y3R1cmUuCgpSZWdh
cmRzLApQRVJBTEUgVGhvbWFzCgpPbiA0LzEyLzI0IDEwOjAwIFBNLCBZYW5uIEUuIE1PUklOIHdy
b3RlOgo+IFRob21hcywgQWxsLAo+Cj4gVGhhbmtzIGZvciB0aGlzIHNlcmllcywgaXQgcmVhbGx5
IGxvb2tzIGdvb2QhIDotKQo+Cj4gSSBhbnl3YXkgaGF2ZSBhIGZldyBjb21tZW50cyBhbmQgcXVl
c3Rpb25zLCBwbGVhc2Ugc2VlIGJlbG93Lgo+Cj4gT24gMjAyNC0wNC0xMiAxNToyNiArMDIwMCwg
VGhvbWFzIFBlcmFsZSB2aWEgYnVpbGRyb290IHNwYWtlIHRodXNseToKPj4gVHVybnMgaG9zdC1n
byBpbnRvIGEgdmlydHVhbCBwYWNrYWdlLCB3aGljaCBoYXMgdHdvIHByb3ZpZGVyczoKPiBXaXRo
IHRoaXMgcGF0Y2gsIHRoZXJlIGlzIGEgc2luZ2xlIHByb3ZpZGVyLCBzbyB0aGUgY29tbWl0IGxv
ZyBpcyBub3QKPiBjb3JyZWN0LiBJbnN0ZWFkLCBpdCBzaG91bGQgc3RhdGUgc29tZXRoaW5nIGxp
a2U6Cj4KPiAgICAgIFR1cm4gaG9zdC1nbyBpbnRvIGEgdmlydHVhbCBwYWNrYWdlLCB3aGljaCBj
dXJyZW50bHkgaGFzIGEgc2luZ2xlCj4gICAgICBwcm92aWRlciwgdGhlIGV4aXN0aW5nIGhvc3Qt
Z28gcGFja2FnZS4gSW4gbGF0ZXIgY29tbWl0cywgd2UnbGwKPiAgICAgIGFkZCBhIHByZWJ1aWx0
LCBiaW5hcnkgaG9zdCBnbyBjb21waWxlciBhcyBhbm90aGVyIHByb3ZpZGVyLgo+Cj4+ICAgLSBo
b3N0LWdvLXNyYywgd2hpY2ggYnVpbGRzIGhvc3QtZ28gZnJvbSBzb3VyY2UgYmFzZWQgb24gdGhl
IHNhbWUgbG9naWMKPj4gICAgIHRoYXQgd2FzIHByZXZpb3VzbHkgdXNlZCBpbiBwYWNrYWdlL2dv
L2dvL2dvLm1rLCBub3cgbW92ZWQgdG8KPj4gICAgIHBhY2thZ2UvZ28vZ28tc3JjL2dvLXNyYy5t
ayB0byByZW1vdmUgYW55IGFtYmlndWl0eSBvbiB0aGUgcm9sZSBvZgo+PiAgICAgdGhlIHBhY2th
Z2UuCj4+Cj4+ICAgLSBob3N0LWdvLWJpbiwgd2hpY2ggd2lsbCBiZSBpbnRyb2R1Y2VkIGluIHRo
ZSBuZXh0IGNvbW1pdCBhbmQgaW5zdGFsbHMKPj4gICAgIGEgcHJlLWJ1aWx0IEdvIGNvbXBpbGVy
Lgo+Pgo+PiBUaGUgdXNhZ2Ugb2YgYSB2aXJ0dWFsIHBhY2thZ2UgZW5hYmxlcyBzdXBwb3J0IGZv
ciBwcmUtYnVpbHQgR28KPiBzL3VzYWdlL3VzZS8KPgo+PiBjb21waWxlciwgd2hpY2ggcmVkdWNl
cyB0aGUgYnVpbGQgdGltZSBmb3Igb2YgaG9zdC1nby4KPj4gQSBzaW1pbGFyIHNvbHV0aW9uIGlz
IHByb3Bvc2VkIGZvciBob3N0LXJ1c3QuCj4+Cj4+IEJ5IGRlZmF1bHQsIGhvc3QtZ28gaXMgYnVp
bHQgZnJvbSBzb3VyY2VzIHRvIGtlZXAgdGhlIHNhbWUgYmVoYXZpb3IgYXMKPj4gdGhlIGZvcm1l
ciB2ZXJzaW9uLgo+IFNpbmNlIHRoaXMgY29tbWl0IG9ubHkgaW50cm9kdWNlcyBhIHNpbmdsZSBw
cm92aWRlciwgdGhpcyBjb21tZW50IGRvZXMKPiBub3QgbWFrZSBzZW5zZSwgYW5kIGJlbG9uZ3Mg
dG8gdGhlIGNvbW1pdCB0aGF0IGFkZHMgdGhlIHByZWJ1aWx0IGdvLgo+Cj4gTm90IHJlbGF0ZWQg
dG8gdGhpcyBwYXRjaCwgYnV0IHN0aWxsIHJlbGV2YW50IHRvIHRoZSBkaXNjdXNzaW9uOiBpdAo+
IHdvdWxkIGJlIGV2ZW4gYmV0dGVyIGlmIHdlIGNvdWxkIGFsc28gaGF2ZSB0aGUgcG9zc2liaWxp
dHkgdGhhdCB0aGUKPiBzdGFnZS0zIGhhcyB0aGUgb3B0aW9uIG9mIGJlaW5nIGEgcHJlYnVpbHQg
Z28uCj4KPiBJbmRlZWQsIGl0IHdvdWxkIHN0aWxsIGJlIGludGVyZXN0aW5nIHRvIGJlIGFibGUg
dG8gYnVpbGQgdGhlIGZpbmFsIGdvCj4gZnJvbSBzb3VyY2UsIGJ1dCB1c2UgYSBwcmVidWlsZCBi
b290c3RyYXAuCj4KPiBTbyB0aGF0IHdvdWxkIGFsbG93IGZvciB0aHJlZSBzaXR1YXRpb25zOgo+
Cj4gICAgLSBmdWxsIHNvdXJjZTogc3RhZ2UtMSwgc3RhZ2UtMiwgc3RhZ2UtMywgYW5kIGZpbmFs
IGdvLCBhbGwgYnVpbHQgZnJvbQo+ICAgICAgc291cmNlczsKPgo+ICAgIC0gcHJlYnVpbHQgc3Rh
Z2UtMyAoc28gbm90IHN0YWdlLTEgYW5kIG5vIHN0YWdlLTIpLCBidXQgZmluYWwgYnVpbHQKPiAg
ICAgIGZyb20gc291cmNlczsKPgo+ICAgIC0gbm8gYm9vdHN0cmFwIGF0IGFsbCwgYW5kIHByZWJ1
aWx0IGZpbmFsIGdvLgo+Cj4gT2YgY291cnNlLCB0aGlzIGlzIF9ub3RfIHJlcXVpcmVkIGZvciB0
aGlzIHNlcmllcyB0byBwcm9ncmVzcy4KPgo+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGVyYWxl
IDx0aG9tYXMucGVyYWxlQG1pbmQuYmU+Cj4+IC0tLQo+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9n
by9Db25maWcuaW4uaG9zdCBiL3BhY2thZ2UvZ28vQ29uZmlnLmluLmhvc3QKPj4gaW5kZXggN2Vk
ZjQ1ODUwZC4uYTIxM2VlOTRiZiAxMDA2NDQKPj4gLS0tIGEvcGFja2FnZS9nby9Db25maWcuaW4u
aG9zdAo+PiArKysgYi9wYWNrYWdlL2dvL0NvbmZpZy5pbi5ob3N0Cj4+IEBAIC0zMiw2ICszMiwz
OCBAQCBjb25maWcgQlIyX1BBQ0tBR0VfSE9TVF9HT19IT1NUX0FSQ0hfU1VQUE9SVFMKPj4gICAJ
ZGVmYXVsdCB5Cj4+ICAgCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfSE9TVF9HT19CT09UU1RSQVBf
U1RBR0UzX0FSQ0hfU1VQUE9SVFMKPj4gICAKPj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9IT1NUX0dP
Cj4gU28gbm93LCBhbGwgZ28gcGFja2FnZXMgYXJlIGJyb2tlbiwgYmVjYXVzZSBub25lIHNlbGVj
dHMKPiBCUjJfUEFDS0FHRV9IT1NUX0dPLCB3aGljaCBpcyByZXF1aXJlZCBmb3IgdGhlIHZpcnR1
YWwtcGFjbGFnZSBpbmZyYS4KPgo+IFRvICJmaXgiIHRoYXQgaXNzdWUsIHRoZXJlIGFyZSB0d28g
b3B0aW9uczoKPgo+ICAgIC0gZml4IGFsbCBwYWNrYWdlIGluIHRoaXMgdmVyeSBwYXRjaCwgYnV0
IGl0IGlzIGEgYml0IGh1Z2UsIG9yCj4KPiAgICAtIGludHJvZHVjZSBCUjJfUEFDS0FHRV9IT1NU
X0dPIGZpcnN0IGFuZCBoYXZlIHBhY2thZ2VzIHNlbGVjdCBpdDsKPiAgICAgIGJhc2ljYWxseSB0
aGF0J3MgeW91ciBuZXh0IHBhdGNoLCBidXQgaXQgc2hvdWxkIGNvbWUgZmlyc3Q6Cj4KPiAgICAg
ICAgICBjb25maWcgQlIyX1BBQ0tBR0VfSE9TVF9HTwo+ICAgICAgICAgICAgICBib29sCj4gICAg
ICAgICAgICAgIGRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfSE9TVF9HT19CT09UU1RSQVBfU1RBR0Uz
X0FSQ0hfU1VQUE9SVFMKPgo+ICAgICAgICAgIGNvbmZpZyBCUjJfUEFDS0FHRV9CQUxFTkFfRU5H
SU5FCj4gICAgICAgICAgICAgIGRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfSE9TVF9HT19CT09UU1RS
QVBfU1RBR0UzX0FSQ0hfU1VQUE9SVFMKPiAgICAgICAgICAgICAgc2VsZWN0IEJSMl9QQUNLQUdF
X0hPU1RfR08KPgo+ICAgICAgYW5kIHRoZW4gdGhpcyBwYXRjaCBjb21lcyBpbiB0byBpbnRyb2R1
Y2UgdGhlIGhvc3QgdmFyaWFudC4KPgo+IFRoaXMgd2F5LCB3ZSBoYXZlIGEgc2VyaWVzIHRoYXQg
aXMgYmlzZWN0YWJsZS4KPgo+IEFsc28sIEkgc2VlIHRoYXQgeW91IG1vZGVsZWQgdGhlIHNvbHV0
aW9uIGFmdGVyIHRoZSBydXN0IG9uZSwgYW5kIHRoaXMKPiBpcyBnb29kLgo+Cj4gSG93ZXZlciwg
SSBkb24ndCB0aGluayB0aGVyZSBpcyBhIG5lZWQgZm9yIGEgcHJvbXB0IGZvcgo+IEJSMl9QQUNL
QUdFX0hPU1RfR08uIEl0IGNhbiB2ZXJ5IHdlbGwgYmUgYSBwcm9tcHQtbGVzcyBzeW1ib2wsIGFz
Cj4gcGFja2FnZXMgbmVlZCB0byBzZWxlY3QgaXQgYW55d2F5Lgo+Cj4gQWxzbywgdGhlcmUgaXMg
KEkgdGhpbmspIG5vIHJlYXNvbiB0byBlbmFibGUgQlIyX1BBQ0tBR0VfSE9TVF9HTyB3aGVuIG5v
Cj4gcGFja2FnZSBuZWVkcyBpdC4gUG9zdC1idWlsZC9mYWtlcm9vdC9pbWFnZSBzY3JpcHRzIHNo
b3VsZCBub3QgbmVlZCB0aGUKPiBnbyBjb21waWxlciBlaXRoZXIsIHNvIEkgZG9uO3QgdGhpbmsg
dGhlcmUgaXMgYW4gYWN0dWFsIG5lZWQgZm9yIGEKPiBwcm9tcHQuLi4KPgo+IFstLVNOSVAtLV0K
Pj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZ28vZ28vZ28ubWsgYi9wYWNrYWdlL2dvL2dvLXNyYy9n
by1zcmMubWsKPj4gc2ltaWxhcml0eSBpbmRleCA2OCUKPj4gcmVuYW1lIGZyb20gcGFja2FnZS9n
by9nby9nby5tawo+PiByZW5hbWUgdG8gcGFja2FnZS9nby9nby1zcmMvZ28tc3JjLm1rCj4+IGlu
ZGV4IGMzYzQwOTIyZjQuLjlkNzNjN2M2OTIgMTAwNjQ0Cj4+IC0tLSBhL3BhY2thZ2UvZ28vZ28v
Z28ubWsKPj4gKysrIGIvcGFja2FnZS9nby9nby1zcmMvZ28tc3JjLm1rCj4+IEBAIC0xLDIxICsx
LDIyIEBACj4+ICAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPj4gICAjCj4+IC0jIGdvCj4+ICsj
IGdvLXNyYwo+IEkgaGF2ZW4ndCByZXZpZXdlZCB0aGUgcy9HTy9HT19TUkMvIHRyYW5zaXRpb247
IHRoYXQncyBtb3N0bHkKPiBtZWNoYW5pY2FsLCBzbyBJIGRvbjt0IGV4cGVjdCB0b28gbXVjaCBz
dXJwcmlzZS4KPgo+IEV4Y2VwdCBvbmUgcG9pbnQ6aWYgYW55IG9mIHRob3NlIHN5bWJvbCBpcyB1
c2VkIGVsc2V3aGVyZSwgdGhleSBuZWVkIHRvCj4gYmUgZml4ZWQgYXMgd2VsbC4uLiBCdXQgdW5s
aWtlIHJ1c3QsIHRoZXJlIGRvZXMgbm90IHNlZW0gbGlrZSB0aGVyZSBhcmUKPiBwYWNrYWdlcyB0
aGF0IGJ1aWxkIGdvIHN0dWZmIGFzIHBhcnQgb2YgYW5vdGhlciBlY29zeXN0ZW0gKMOgLWxhCj4g
cHl0aG9uK3J1c3QpLgo+Cj4gSG1tLi4uIEhPU1RfR09fQ09NTU9OX0VOViBpcyB1c2VkIGluIHRo
ZSBwa2ctZ29sYW5nIGluZnJhLCBidXQgSSBjb3VsZAo+IG5vdCBzcG90IGFueXRoaW5nIGVsc2Ug
b24gYSBjdXJzb3J5IGxvb2suICJJdCBzaG91bGQgYmUgZmluZSEiCj4KPiBSZWdhcmRzLAo+IFlh
bm4gRS4gTU9SSU4uCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
