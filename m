Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09369C61DA4
	for <buildroot@archiver.kernel.org>; Sat, 11 Feb 2023 10:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8895340323;
	Sat, 11 Feb 2023 10:10:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8895340323
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ImbWx-qGaOGp; Sat, 11 Feb 2023 10:10:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ADF484037E;
	Sat, 11 Feb 2023 10:10:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADF484037E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ADEFF1BF59A
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 10:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 85CE141987
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 10:10:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85CE141987
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X25PxyUUywbL for <buildroot@lists.busybox.net>;
 Sat, 11 Feb 2023 10:10:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3224D4197C
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3224D4197C
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 10:10:52 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id z13so5543597wmp.2
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 02:10:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3ZOi66PnVYDw9s/35I3IlJwxU/Xq4E/f1YnHoTyL8Pc=;
 b=eQsHIG1YtQWPgewRUZsjnyt1Ts8XilyKHSMTrbnkcVxO6dOEB/IwAKBd0HiOhUI6fB
 K1qZUENc5TO7E+kpDu21UjI0t4wcxQHRl6FtjCxWgxni++DM2fVlOocmLUpRTU8MCmP/
 vi+yuGW5qRVo5IUp8CqpOZT5f3mqQf06Q/w0XpB+i4aL39qrTEINLZF1gp5INqcSG5r3
 7k0sogZIugcBvWElSo0mk8Wy2CRl6Jl0eYqinuxxQJhCFi3Z8/VlLbqEzV3LP9mzzyOi
 K/Lz2+JT1nhWHo2gpSTUpbhgSMI8U79EBRyXqwpBuCS/jeIo/Aji/A3/1wCDH2IvNNI/
 jJPw==
X-Gm-Message-State: AO0yUKX+RNTvKhMvc8t6POf1ngcqn8n4JarSG+rXVi+/vBRuZWbqJJKH
 c+d0pi9RAO7LsuLJHL/V8BdsX1Kn1Okm4+uo
X-Google-Smtp-Source: AK7set8FU1trviMETVIzlGSz8y3KzX3hLAuTCjSFPRjJfSLHceJIJbWf7ca7AVx5M7yWClfPaGbCFw==
X-Received: by 2002:a05:600c:130f:b0:3e0:c5e:ad52 with SMTP id
 j15-20020a05600c130f00b003e00c5ead52mr15043519wmf.6.1676110250340; 
 Sat, 11 Feb 2023 02:10:50 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 j40-20020a05600c1c2800b003dc4480df80sm12382411wms.34.2023.02.11.02.10.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Feb 2023 02:10:49 -0800 (PST)
Message-ID: <7bbd1030-488a-9876-7c69-0ac6ae15653e@smile.fr>
Date: Sat, 11 Feb 2023 11:10:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>
References: <20230210233658.3763549-1-romain.naour@gmail.com>
 <20230211104934.4c34267c@windsurf>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20230211104934.4c34267c@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3ZOi66PnVYDw9s/35I3IlJwxU/Xq4E/f1YnHoTyL8Pc=;
 b=Z87lbzNXW6Ms65OkmhsRXhhgfBn97JNG0TjYO5OM5a6fGJUGnJxDkGgKACZmVFjrDb
 8Dc28Z7YeXtAc97hSj7uwKV5RFy7QhkCw9Y8D7G4BL3MwWDTZeG8SCb7iMQzWAAjlIoG
 OTtMUKW1fKkHiVA3aaGJZQCSiuMOY7hjHCl10t5SSNkYytRLabLwEw1NnvvN8LlgDl/d
 91t4w9TP6dAxlZEmFIqPiFwdf+s9R8Ke2i4OAbXxouHXqM9+ynXDYN9xH3Yu3kQb2/xD
 woD+aw6dpBaf33Ia9BrAkyiO/4pn9Cq0QZ3a8tdqufng2qiJHh9af5QLrU8kXVLieIeE
 gWGQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=Z87lbzNX
Subject: Re: [Buildroot] [PATCH] package/busybox: disable stack optimization
 for i386 target
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKTGUgMTEvMDIvMjAyMyDDoCAxMDo0OSwgVGhvbWFzIFBldGF6em9uaSB2
aWEgYnVpbGRyb290IGEgw6ljcml0wqA6Cj4gT24gU2F0LCAxMSBGZWIgMjAyMyAwMDozNjo1OCAr
MDEwMAo+IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4gd3JvdGU6Cj4gCj4+
IFRoZSB0b29sY2hhaW4tYnVpbGRlciBwcm9qZWN0IHJlcG9ydGVkIGFuIGlzc3VlIHdpdGggUWVt
dSA3LjIuMCBmb3IKPj4geDg2LWNvcmUyLS1nbGliYy0tYmxlZWRpbmctZWRnZSB0b29sY2hhaW4g
WzFdOgo+Pgo+PiAgIFJ1biAvc2Jpbi9pbml0IGFzIGluaXQgcHJvY2Vzcwo+PiAgIHJhbmRvbTog
ZmFzdCBpbml0IGRvbmUKPj4gICBFWFQ0LWZzICh2ZGEpOiB3YXJuaW5nOiBtb3VudGluZyB1bmNo
ZWNrZWQgZnMsIHJ1bm5pbmcgZTJmc2NrIGlzIHJlY29tbWVuZGVkCj4+ICAgRVhUNC1mcyAodmRh
KTogcmUtbW91bnRlZC4gT3B0czogKG51bGwpLiBRdW90YSBtb2RlOiBkaXNhYmxlZC4KPj4gICBT
dGFydGluZyBzeXNsb2dkOiBPSwo+PiAgIHRyYXBzOiBzeXNsb2dkWzUyXSBnZW5lcmFsIHByb3Rl
Y3Rpb24gZmF1bHQgaXA6YjdlMjE0NjUgc3A6YmZlNTllNmMgZXJyb3I6MCBpbiBsaWJjLnNvLjZb
YjdkOWIwMDArMTIzMDAwXQo+PiAgIFN0YXJ0aW5nIGtsb2dkOiBPSwo+PiAgIHRyYXBzOiBrbG9n
ZFs1Nl0gZ2VuZXJhbCBwcm90ZWN0aW9uIGZhdWx0IGlwOmI3ZTk0NDY1IHNwOmJmOGYwNjljIGVy
cm9yOjAgaW4gbGliYy5zby42W2I3ZTBlMDAwKzEyMzAwMF0KPj4gICBSdW5uaW5nIHN5c2N0bDog
dHJhcHM6IGxvZ2dlcls2Ml0gZ2VuZXJhbCBwcm90ZWN0aW9uIGZhdWx0IGlwOmI3ZTQ4YjZjIHNw
OmJmZDdkMTk0IGVycm9yOjAgaW4gbGliYy5zby42W2I3ZTA1MDAwKzEyMzAwMF0KPj4gICBTZWdt
ZW50YXRpb24gZmF1bHQKPj4gICB0cmFwczogbG9nZ2VyWzY0XSBnZW5lcmFsIHByb3RlY3Rpb24g
ZmF1bHQgaXA6YjdkZDNiNmMgc3A6YmY5Yjg2MDQgZXJyb3I6MCBpbiBsaWJjLnNvLjZbYjdkOTAw
MDArMTIzMDAwXQo+PiAgIFNlZ21lbnRhdGlvbiBmYXVsdAo+Pgo+PiAgIChGb2xsb3dlZCBieSBh
IGtlcm5lbCBwYW5pYy4pCj4+Cj4+IFRlc3Rpbmcgd2l0aCB0aGUgcGV2aW91cyBRZW11IHJlbGVh
c2UgKDcuMS4wKSBhbGxvd3MgdG8gYm9vdCB0aGUgc3lzdGVtIHdpdGhvdXQgYW55IHByb2JsZW0u
Cj4+Cj4+IEJ1aWxkaW5nIHFlbXUgc291cmNlcyBiZXR3ZWVuIDcuMS4wIGFuZCA3LjIuMCBhbGxv
d3MgdG8gaWRlbnRpZnkgdGhlIGZpcnN0ICJiYWQiIGNvbW1pdCBbMl0gYW5kCj4+IHJlcG9ydCB0
byB0aGUgUWVtdSBwcm9qZWN0IFszXS4KPj4KPj4gVGhhbmtzIHRvIFFlbXUgbWFpbnRhaW5lcnMg
cmV2aWV3LCBzZXZlcmFsIGlzc3VlcyB3YXMgbm90aWNlZDoKPj4KPj4gICAiVGhlIGRlZmF1bHQg
aTM4NiBidXN5Ym94IGJ1aWxkIGNvbmZpZyBkb2VzIG5vdCByZXNwZWN0IGdsaWJjJ3MgcmVxdWly
ZW1lbnRzIGFyb3VuZCBzdGFjayBhbGlnbm1lbnQKPj4gICAoc2VlIFs0XSBmb3IgcHJldmlvdXMg
ZGlzY3Vzc2lvbnMgYW5kIGEgd29ya2Fyb3VuZCkuIgo+Pgo+PiBEaXNhYmxpbmcgQ09ORklHX1NU
QUNLX09QVElNSVpBVElPTl8zODYgb3B0aW9uIChhcyBzdWdnZXN0ZWQgaW4gdGhlIEdlbnRvbyBi
dWcgcmVwb3J0KSBmaXhlZCB0aGUgaXNzdWUhCj4+Cj4+IFRoaXMgb3B0aW9uIGhhcyBiZWVuIGFk
ZGVkIGFuZCBlbmFibGVkIGJ5IGRlZmF1bHQgaW4gYnV4eWJveCAxXzI5XzAsIHNvIGl0IHdhcyB1
c2VkIHNpbmNlIHRoZW4gdGhlIGZvcgo+PiBCdWlsZHJvb3QncyBxZW11IGRlZmNvbmZpZy4KPj4K
Pj4gTm90ZTogVGhlIHg4Ni1pNjg2LS1nbGliYy0tYmxlZWRpbmctZWRnZSAoZ2VuZXJpYyB4ODYp
IGRvZXNuJ3QgdHJpZ2dlciB0aGUgaXNzdWUgd2l0aAo+PiBDT05GSUdfU1RBQ0tfT1BUSU1JWkFU
SU9OXzM4NiBlbmFibGVkLgo+Pgo+PiBGaXhlczoKPj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxk
cm9vdC5vcmcvdG9vbGNoYWlucy1idWlsZGVyLy0vam9icy8zNzMxNjgzMzM3Cj4+Cj4+IFsxXSBo
dHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy90b29sY2hhaW5zLWJ1aWxkZXIvLS9qb2Jz
LzM3MzE2ODMzMzcKPj4gWzJdIGh0dHBzOi8vZ2l0bGFiLmNvbS9xZW11LXByb2plY3QvcWVtdS8t
L2NvbW1pdC85NThlMWRkMTMwMGYzN2YxOGIyMTYxZGZiNGViODA2ZmM4YzE5YjQ0Cj4+IFszXSBo
dHRwczovL2dpdGxhYi5jb20vcWVtdS1wcm9qZWN0L3FlbXUvLS9pc3N1ZXMvMTQ3OAo+PiBbNF0g
aHR0cHM6Ly9idWdzLmdlbnRvby5vcmcvNzI1Njc0Cj4gCj4gVGhhbmtzIGEgbG8gZm9yIHRoZSBn
cmVhdCBpbnZlc3RpZ2F0aW9uLiBEbyB3ZSB1bmRlcnN0YW5kIHByZWNpc2VseQo+IHdoYXQgaXMg
aGFwcGVuaW5nPyBUaGUgbGluayBhdCBbNF0gZG9lcyBub3QgcmVhbGx5IGhhdmUgYW4gZXhwbGFu
YXRpb24sCj4gaXQgb25seSBoYXMgZXhwZXJpbWVudGFsIG9ic2VydmF0aW9ucyB0aGF0IGxlYWQg
dG8gdGhlIGNvbmNsdXNpb24gdGhhdAo+IGRpc2FibGluZyBDT05GSUdfU1RBQ0tfT1BUSU1JWkFU
SU9OXzM4NiBpcyBhIHdvcmstYXJvdW5kLCBidXQgaXQgZG9lcwo+IG5vdCByZWFsbHkgZXhwbGFp
biB3aGF0IGlzIGhhcHBlbmluZy4KCkFjdHVhbGx5IHRoZXJlIGFyZSB0d28gZGlmZmVyZW50IGlz
c3VlcyB0aGF0IGNvbnRyaWJ1dGUgdG8gdGhpcyBpc3N1ZToKCjEpIEFuIGV4aXN0aW5nIGxhdGVu
dCBCdXN5Ym94IGJ1ZyBvbiBpMzg2IChidXN5Ym94IGNvbXBpbGVkIHdpdGgKLW1wcmVmZXJyZWQt
c3RhY2stYm91bmRhcnk9MikKCmh0dHBzOi8vbGlzdHMuZGViaWFuLm9yZy9kZWJpYW4tYm9vdC8y
MDE4LzAxL21zZzAwMzUyLmh0bWwKCjIpIEEgUWVtdSBpbXByb3ZlbWVudCB0aGF0IHRyaWdnZXIg
YW4gZXhjZXB0aW9uIG9uIHVuYWxpZ25lZCBtZW1vcnkgYWNjZXNzZXMKdGhhdCByZXF1aXJlIDE2
LWJ5dGUgYWxpZ25tZW50LgoKaHR0cHM6Ly9naXRsYWIuY29tL3FlbXUtcHJvamVjdC9xZW11Ly0v
Y29tbWl0Lzk1OGUxZGQxMzAwZjM3ZjE4YjIxNjFkZmI0ZWI4MDZmYzhjMTliNDQKCkkgZGlkbid0
IGRpZ2dpbmcgZnVydGhlciB0aGUgcm9vdCBjYXVzZSBvZiB0aGUgaXNzdWUuCgpCZXN0IHJlZ2Fy
ZHMsClJvbWFpbgoKCj4gCj4gVGhvbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
