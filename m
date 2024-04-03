Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E0B3CD128A
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 13:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6061241731;
	Wed,  3 Apr 2024 13:50:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ypIZ8UqbEZY7; Wed,  3 Apr 2024 13:50:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E3CD41773
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E3CD41773;
	Wed,  3 Apr 2024 13:50:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3D3911BF3C5
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 13:50:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B0998211D
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 13:50:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O-Z61qE7VOxq for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 13:50:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=michael@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0D82982116
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D82982116
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D82982116
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 13:50:11 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a4e40fad4fdso557829666b.2
 for <buildroot@buildroot.org>; Wed, 03 Apr 2024 06:50:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712152210; x=1712757010;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c0jU2jTK27xBpXQrAKwMqDYV3zgeQHIw2fMBGKyvBY0=;
 b=XbPJEMTzi9PoGB/vnhv3S0j+LN4qR36GdqGyr7R50GHCZom57StS7o7eXCz1EnRvm0
 4hekvx/t2TU2AofD1rxvkzBID/B5f8kjxGOvAeUVadSl3b47MbSdBFVxBTOxkCMQuUz0
 DedyFR2x0QAFbhDET0jQshP420x5isrdwb0KX5ujIJjaSCtgu+9T3xAOS2Uptm0S7Eae
 56I9OojZMpLQqJOSA4FHYkzJGYx4/WWP6vuTC0QwPuJrxjCbCPDrUL8+VyTEYJytK4C2
 A3fCQRKOwvr9LGNZMI6fCD4UGZJTEeLoh6I/r04T/d+8LzuQ6p41QHH+Mvok07Cu/I2f
 TTew==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRJ4YuOr2LyBOkO+PZRH/sOKYmoPzgEplOV6rsVXCn6PSEHw0eBF9ZzWX7gXl4pscF463lZ2emTP70GLVNFbCww/TMWOVfrQ==
X-Gm-Message-State: AOJu0YwGyelypM+6/enXm7aGs4oVM3jeeMvQFi0NWhWJ7iq5BgKuZFbc
 pbyJZUo5rbeQhF6cTeWXXBoXlO+K9368AwgFHjTymCOIIJIZs3lzEkt5l2JaWocc3J83NHEOkja
 +sDkXLPLs1IQhmw6dXSuwI8FlfsSwCA5+jQhDuA4z42PJzHya8lA=
X-Google-Smtp-Source: AGHT+IFr+ZSPIESPzfytBMTf9RE5ocvMhv2f6GMuOblMAwWjiodfbeFzM4ga3rtEIkVYZx1SRtJM7aWUuql9AUl2Yqs=
X-Received: by 2002:a17:907:111b:b0:a4e:2b64:5a82 with SMTP id
 qu27-20020a170907111b00b00a4e2b645a82mr9487425ejb.24.1712152209603; Wed, 03
 Apr 2024 06:50:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240330160244.3214733-1-dario.binacchi@amarulasolutions.com>
 <20240330160244.3214733-7-dario.binacchi@amarulasolutions.com>
 <D0AICZ7BOW8A.2PLPZEPK1YG2E@kernel.org>
 <CAOf5uwnWwPdcLC8DRcd5qa_DGkGqXUbb8EO8CNcafi0RwNQhxg@mail.gmail.com>
 <D0AIR4402RGT.1B7XIPV29012@kernel.org>
In-Reply-To: <D0AIR4402RGT.1B7XIPV29012@kernel.org>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Wed, 3 Apr 2024 15:49:58 +0200
Message-ID: <CAOf5uwmQGEd6vCgNsUQvmv3pN-xmCSaAk4VVR3e-tc0xuSTbLg@mail.gmail.com>
To: Michael Walle <mwalle@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1712152210; x=1712757010;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c0jU2jTK27xBpXQrAKwMqDYV3zgeQHIw2fMBGKyvBY0=;
 b=evwXB5ykNozPGq6AybaHUrZUe4YVB+tIN0xP/0Js6j0F39XwGDoa/BwVT7TtCJA8O5
 IdpGp8M6bWeDwVWa5tf2N4HM60K2m/GtHRMlxiBe+Z8y6BwMWZI63rVQW5979jfKeiYC
 zQriCVIbxBL/NulefZbKJK8N8AUY2pkA/uU+M=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=evwXB5yk
Subject: Re: [Buildroot] [PATCH v10 06/12] boot/ti-k3/ti-k3-r5-loader:
 install tiboot3.bin
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
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Anand Gadiyar <gadiyar@ti.com>, heiko.thiery@gmail.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@smile.fr>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, "Yann E . Morin" <yann.morin.1998@free.fr>,
 bryce@redpinelabs.com, Andreas Dannenberg <dannenberg@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTWljaGFlbAoKT24gV2VkLCBBcHIgMywgMjAyNCBhdCAzOjI04oCvUE0gTWljaGFlbCBXYWxs
ZSA8bXdhbGxlQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gSGkgTWljaGFlbCwKPgo+ID4gPiA+ICtU
SV9LM19SNV9MT0FERVJfU0VDVFlQRSA9ICQoY2FsbCBxc3RyaXAsJChCUjJfUEFDS0FHRV9USV9L
M19TRUNUWVBFKSkKPiA+ID4gPiArVElfSzNfUjVfTE9BREVSX1NPQyA9ICQoY2FsbCBxc3RyaXAs
JChCUjJfUEFDS0FHRV9USV9LM19TT0MpKQo+ID4gPiA+ICsKPiA+ID4gPiAgZGVmaW5lIFRJX0sz
X1I1X0xPQURFUl9JTlNUQUxMX0lNQUdFU19DTURTCj4gPiA+ID4gICAgICAgY3AgJChARCkvc3Bs
L3UtYm9vdC1zcGwuYmluICQoQklOQVJJRVNfRElSKS9yNS11LWJvb3Qtc3BsLmJpbgo+ID4gPiA+
ICsgICAgIGNkICQoQEQpOyBmaW5kIC4vIC10eXBlIGYgLXJlZ2V4ICJcLlwvdGlib290My0kKFRJ
X0szX1I1X0xPQURFUl9TT0MpLSQoVElfSzNfUjVfTE9BREVSX1NFQ1RZUEUpLVteLV0qLi5iaW4i
IC1leGVjIGNwIHt9ICQoQklOQVJJRVNfRElSKS90aWJvb3QzLmJpbiBcOwo+ID4gPgo+ID4gPiBU
aGUgZmlsZW5hbWUgc2hvdWxkICpub3QqIGJlIGhhcmRjb2RlZCB0byBsb29rIGxpa2UKPiA+ID4g
PHNvYz4tPHNlY3R5cGU+LmJpbi4gVGhpcyBpcyBqdXN0IGFuIGFydGlmYWN0IGhvdyBUSSBpcyBu
YW1pbmcgdGhlaXIKPiA+ID4gZmlsZXMgaW4gKnRoZWlyKiB1LWJvb3QgYmlubWFuIGZpbGVzLiBJ
bnN0ZWFkIHRoaXMgc2hvdWxkIGp1c3QgYmUgYQo+ID4gPiBLY29uZmlnIHZhcmlhYmxlIChtYXli
ZSBLM19SNV9MT0FERVJfRklMRU5BTUU/KSB3aGljaCBjYW4gYmUgc2V0IGJ5Cj4gPiA+IHRoZSB1
c2VyL2JvYXJkIGNvbmZpZyBhbmQgd2hpY2ggZGVmYXVsdHMgdG8gInRpYm9vdDMuYmluIi4KPiA+
ID4gInRpYm9vdDMuYmluIiBpcyB0aGUgZmlsZW5hbWUgd2hpY2ggaXMgdXNlZCBieSB0aGUgUk9N
IGluIGZpbGVzeXN0ZW0KPiA+ID4gYm9vdCBtb2RlIGFuZCBmb3Igd2hpY2ggdS1ib290IGlzIGFs
cmVhZHkgY3JlYXRpbmcgYSBzeW1saW5rLgo+ID4gPiBTbyB0aGlzIHdpbGwgdGhlbiBqdXN0IGJl
IGFub3RoZXIgc2ltcGxlICJjcCIuCj4gPiA+Cj4gPiA+IE9uIGEgc2lkZSBub2RlLCB3ZSBhbHNv
IGZvdW5kIG91dCB0aGF0IHRoZSAiZmluZCAuIC1yZWdleCIgaXMgcmF0aGVyCj4gPiA+IGZyYWdp
bGUgaW4gdGhlIHNlbnNlIHRoYXQgaXQgbWlnaHQgbm90IGNvcHkgYW55dGhpbmcgYXQgYWxsIHdp
dGhvdXQKPiA+ID4gZ2VuZXJhdGluZyBhbiBlcnJvci4KPiA+ID4KPiA+Cj4gPiBUaGUgaWRlYSB3
YXMgdG8gbWVyZ2UgdGhpcyBzZXJpZXMgYmFzZWQgb24gdGhlIHNlcmllcyB0b3BpYy4gSSB3b3Vs
ZAo+ID4gbGlrZSB0byByZW1pbmQgeW91IHRoYXQKPiA+IHRoZSBjb2RlIGluIGJ1aWxkcm9vdCB3
YXMgbm90IHdvcmtpbmcgYW5kIHdlIHNlbnQgYSBmaXJzdCBzZXJpZXMgYmFjawo+ID4gaW4gTm92
ZW1iZXIgdGhhdCB3YXMgc3VwcG9zZQo+ID4gdG8gZml4IHNvbWV0aGluZyB0aGF0IHdhcyAibWVy
Z2VkIiBiZWZvcmUgYW5kIHVuZm9ydHVuYXRlbHkgYnJva2VuLgo+ID4gV2UgbGlrZSBhbGwgdGhl
IHN1Z2dlc3Rpb25zIGFuZCB3ZSB3b3VsZCBvZiBjb3Vyc2UgbG92ZQo+ID4gdG8gaW1wcm92ZSB0
aGUgc2VyaWVzIGJ1dCBpdCB3b3VsZCBiZSBuaWNlIHRvIGxpbWl0IHRoZSBzZXJpZXMgdG8gdGhl
Cj4gPiBzdWJqZWN0IGFuZCBub3QgY29udGludWUgdG8gYWRkIGEgbW9yZSBnZW5lcmFsaXN0IGFw
cHJvYWNoLgo+ID4gVGhpcyBpcyBmcm9tIHlvdSB0aGUgZmlyc3QgZW1haWwgYW5kIHRoYW5rIHlv
dSBmb3IgYWRkaW5nIHlvdXIKPiA+IGNvbnRyaWJ1dGlvbiBhbmQgd2VsY29tZSBvbiBib2FyZCB0
b28uCj4gPiBJIHRoaW5rIHRoYXQgd2Ugc2hvdWxkIG5vdyB3YWl0IGZvciBWMTEKPgo+IFNvcnJ5
LCBmb3IgYmVpbmcgdGhhdCBsYXRlLCBidXQgSSBkb24ndCB0aGluayBpdCBpcyB0aGUgd2F5IHRv
IGdvIHRvCj4gaW50cm9kdWNlIHNvbWV0aGluZyAiYnJva2VuIiAoZm9yIGEgbGFjayBvZiBhIGJl
dHRlciB3b3JkaW5nKSBhbmQKCkkganVzdCBzYWlkIHRoYXQgeW91ciBzdWdnZXN0aW9uIGlzIHdl
bGNvbWUgYnV0IHRoZSBjb2RlIHdlIGhhdmUKYWxyZWFkeSBoYXMgYmVlbiBicm9rZW4gZm9yCm1v
bnRocy4KCj4gdGhlbiBmaXggaXQgYWZ0ZXJ3YXJkcywgRXNwLiBiZWNhdXNlIGl0IG1lYW5zIHRv
dWNoaW5nIGFsbCB0aGUgYml0cwo+IGFuZCBkZWZjb25maWdzIGFnYWluLiBJT1csIHRoaXMgaXMg
bm90IGFuIGltcHJvdmVtZW50IGJ1dCByYXRoZXIgaG93Cj4gdG8gZG8gaXQgdGhlIGNvcnJlY3Qg
d2F5IChpbiBteSBvcGluaW9uLCBvdGhlcnMgbWlnaHQgZGlzYWdyZWUgb2YKPiBjb3Vyc2UpLgoK
VGhlIHByb3Bvc2FsIGlzIG5vdCBicm9rZW4gYnV0IGl0J3MgYmV0dGVyIHRvIHNheSBub3QgY29u
c2lzdGVudCB3aXRoCm5ld2VyIGJvYXJkcy9zb2MuIEFtIEkgd3Jvbmc/Cgo+IEFsc28sIEknbSBu
b3Qgc3VyZSBpZiB0aGUgVElfSzNfUjVfTE9BREVSX3tTT0MsU0VDVFlQRX0gaXMgdXNlZAo+IGVs
c2V3aGVyZSBvciBpZiBpdCBjYW4gYmUgZHJvcHBlZCBhbHRvZ2V0aGVyLgoKQ2xlYXIKCk1pY2hh
ZWwKCj4KPiAtbWljaGFlbAoKCgotLSAKTWljaGFlbCBOYXp6YXJlbm8gVHJpbWFyY2hpCkNvLUZv
dW5kZXIgJiBDaGllZiBFeGVjdXRpdmUgT2ZmaWNlcgpNLiArMzkgMzQ3IDkxMyAyMTcwCm1pY2hh
ZWxAYW1hcnVsYXNvbHV0aW9ucy5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwoKQW1hcnVsYSBTb2x1dGlvbnMgQlYKSm9vcCBHZWVzaW5rd2VnIDEyNSwgMTExNCBBQiwgQW1z
dGVyZGFtLCBOTApULiArMzEgKDApODUgMTExIDkxNzIKaW5mb0BhbWFydWxhc29sdXRpb25zLmNv
bQp3d3cuYW1hcnVsYXNvbHV0aW9ucy5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
