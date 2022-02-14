Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F7AC433F5
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 20:13:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 620EF404FA;
	Mon, 14 Feb 2022 20:13:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yVAxBhZ9KqwF; Mon, 14 Feb 2022 20:13:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F0CB404D7;
	Mon, 14 Feb 2022 20:13:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BE2291BF348
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 20:13:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA55F4022D
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 20:13:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h_RaxeaVp58N for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 20:13:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AC9E540228
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 20:13:36 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id h6so28682360wrb.9
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 12:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=WjZ7mkv6kZ1/lllAZYu3FeiNkKgX1Xk1lL3QdfBmhQo=;
 b=UY7D1SAXqia09Ip4lnTev63Az4b0mpkhSfUUjCc40cgKxJjKs/Mi74vEhzQOz19Aa2
 48rz1Qu/Bd6Jrwewgw30fLwW/kQ1Drasctvbp/wpiPQnUl5oK1rJlqgUCUwTpigcTNCa
 8Mg6vKBHaLkf9nvsPbgXZGVA0GKvrGHJrhuMysb/umLx7DOk+JTaS9sRsPT8xSyF1o6i
 TYDhOyF5GJo9i21ytnPwp6oBXxnhkja688U/Ot5AO36vZXn9SQ6n5p5AVZdj9AYerHW7
 Cc/4kmOj95h6aMJMnKZr4LekCZqnZPVkaH7znY9ZUOZJhVfvlmZPPQZ6JRtXOC7z53vU
 t8OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=WjZ7mkv6kZ1/lllAZYu3FeiNkKgX1Xk1lL3QdfBmhQo=;
 b=syK6NxtK3JkLF/ACUl7c5YPXug6fwWhBWZFxxE09QOjCSv8XODgA0ncdrb0cCj5ME2
 54wjzv0E0D3T6R08Nai6SUm0HD48U6Dv8E3+ZDIzOwKOOqjsh7Lu8mTElF7NfOQDqPcm
 8V99u/ZYllN9pAdx5AYb3ipIleIwbrMMnIqZDNXNVywIH11V0SR8yxjPgE400koQFWy2
 vfLVJfJ1Ymzvn3cMwgT7aCtlH4CMgj1+aLY7wB0CL5U464kcjuFv5eRBTszgbaRYhAK9
 R/l5c+T7a7N/mu4p2HJRlQsGtfhieLmy1wt22llVFQDwE9KDmO8w8SZezof4AYKcmBGT
 aSsQ==
X-Gm-Message-State: AOAM5322r14qHTVkEh0kXeLscGCR+RM8k9zloq27Up69eSraRXnIiNin
 BJpERqAXEoBDZLwcJBg5DXl3hyq/Fk/0AA==
X-Google-Smtp-Source: ABdhPJwWmnBRj2Qb3QuAc6Sdx63cOubeyQGltsb7gNYBKBLNT8P9N1iH2qZ7dE6FMQqTBtIP6X6E8Q==
X-Received: by 2002:a5d:424f:: with SMTP id s15mr543741wrr.472.1644869614959; 
 Mon, 14 Feb 2022 12:13:34 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id r12sm7640038wmq.33.2022.02.14.12.13.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 12:13:34 -0800 (PST)
Message-ID: <6edcbc6d-c9bb-e802-48f1-d4866a698aa9@mind.be>
Date: Mon, 14 Feb 2022 21:13:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org, Peter Korsgaard <peter@korsgaard.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220202171035.1740791-1-giulio.benetti@benettiengineering.com>
 <20220202171035.1740791-2-giulio.benetti@benettiengineering.com>
 <c3a9cf08-fb79-580d-f1e6-79ef28b46263@mind.be>
 <cb93cb6a-c8ae-0975-6ae0-14ad369de9e2@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <cb93cb6a-c8ae-0975-6ae0-14ad369de9e2@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH] configs/roc_pc_rk3399_defconfig: expand
 rootfs size to 120M
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
Cc: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Danilo Bargen <mail@dbrgn.ch>, Suniel Mahesh <sunil@amarulasolutions.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxNC8wMi8yMDIyIDAxOjAzLCBHaXVsaW8gQmVuZXR0aSB3cm90ZToKPiBIaSBBcm5vdXQs
Cj4gCj4gT24gMTMvMDIvMjIgMTI6MzUsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+Pgo+
Pgo+PiBPbiAwMi8wMi8yMDIyIDE4OjEwLCBHaXVsaW8gQmVuZXR0aSB3cm90ZToKPj4+IERlZmF1
bHQgNjBNIGZvciByb290ZnMgYXJlIG5vdCBlbm91Z2ggYW5kIGdlbmVyYXRlIGEgYnVpbGQgZmFp
bHVyZSwgc28KPj4+IGxldCdzIGV4cGFuZCByb290ZnMgc2l6ZSB0byAxMjBNLgo+Pgo+PiDCoMKg
IERpZCB5b3UgZmluZCBvdXQgX3doeV8gNjRNIHdhc24ndCBlbm91Z2ggZm9yIGp1c3QgdGhlIGtl
cm5lbCBhbmQgYnVzeWJveD8gSXMKPj4gaXQgYmVjYXVzZSBvZiBhbGwgdGhlIHN0dXBpZCBtb2R1
bGVzIGluIHRoZSBkZWZhdWx0IGFybTY0IGRlZmNvbmZpZz8gQnV0IG1vc3QKPj4gb3RoZXIgYXJt
NjQgZGVmY29uZmlncyBkb24ndCBzZWVtIHRvIG5lZWQgdGhpcy4uLgo+IAo+IEl0IGlzIGJlY2F1
c2Ugb2YgbW9kdWxlcygzME0pIGFuZCBsaW51eCAiSW1hZ2UiLCBpdCdzIG5vdCBjb21wcmVzc2Vk
LCBzbyBpdCdzIAo+IDI1TS4gU28gb25seSBmb3IgTGludXgrbW9kdWxlcyA9PiA1NU0sIHBsdXMg
dGhlIGZldyBvdGhlciBzdHVmZihCdXN5Ym94K2xpYmMgCj4gZXRjLikxTQoKICBZZWFoIHRob3Nl
IGdpYW50IGFhcmNoNjQgZGVmYXVsdCBjb25maWdzIGFyZSBtaWdodGlseSBhbm5veWluZy4uLgoK
ICBJJ20gdGhpbmtpbmcsIHBlcmhhcHMgd2Ugc2hvdWxkIGp1c3QgYml0ZSB0aGUgYnVsbGV0IGFu
ZCBtb3ZlIHRoZSBkZWZhdWx0IGV4dDIgCnNpemUgdG8gMTIwTS4uLgoKICBQZXRlciwgWWFubiwg
d2hhdCBkbyB5b3UgdGhpbms/CgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+IAo+IEFsc28sIG5vdGhp
bmcgY2hhbmdlZCBzaW5jZSB0aGUgYmVnaW5uaW5nLCBzbyBJIGRvbid0IGtub3cgaG93IGNvdWxk
IHRoaXMgaGFwcGVuZWQ6Cj4gIyBnaXQgbG9nIC0tb25lbGluZSBjb25maWdzL3JvY19wY19yazMz
OTlfZGVmY29uZmlnCj4gZjUxY2JjMzNkOSBjb25maWdzL3JvY19wY19yazMzOTk6IGZpeCBVLUJv
b3QgZGVwZW5kZW5jaWVzCj4gODBhZTFhZWRjYiBjb25maWdzL3JvY19yazMzOTlfcGM6IG5ldyBk
ZWZjb25maWcKPiAjIGdpdCBsb2cgLS1vbmVsaW5lIHJvYy1yazMzOTktcGMvCj4gODBhZTFhZWRj
YiBjb25maWdzL3JvY19yazMzOTlfcGM6IG5ldyBkZWZjb25maWcKPiAKPiBVLUJvb3QgZGVwZW5k
ZW5jaWVzIGFyZSBob3N0IGRlcGVuZGVuY2llcywgc28gaXQgZG9lc24ndCBpbXBhY3QuCj4gCj4g
IyBnaXQgbG9nIC0tb25lbGluZSBmcy9leHQyOgo+IDVlY2U2YmU2MGIgZnMvZXh0MjogZmlyIChh
Z2FpbikgbmFtZXNwYWNlIGZvciB2YXJpYWJsZXMKPiBkYjdkNzg2MTQwIGZzL2V4dDI6IGZpeCBu
YW1lc3BhY2UgZm9yIHZhcmlhYmxlcwo+IDU2MzFjMzgwMjQgZnMvZXh0MjogcGFzcyBhIGRlZmF1
bHQgc3RyaW5nIHRvIGZpbGVzeXN0ZW0gbGFiZWwKPiAuLi4KPiBoZXJlIGJvYXJkIGhhcyBiZWVu
IGFkZGVkCj4gCj4gU28gaXQgZG9lc24ndCBzZWVtIGEgZXh0MiBwcm9ibGVtIHRvby4KPiBJIGNh
bid0IHVuZGVyc3RhbmQgaG93IGl0IGNvdWxkIGJlIGJ1aWxkaW5nIGluIHRoZSBiZWdpbm5pbmcu
Cj4gCj4gV2UgaGF2ZSAyIHNvbHV0aW9uczoKPiAtIGV4cGFuZCByb290ZnMKPiAtIHVzZSBhIGNv
bXByZXNzZWQgbGludXggSW1hZ2UuZ3ooMjVNID0+IDlNKSwgYnV0IG5lZWQgdGFyZ2V0IHRlc3Rp
bmcKPiAKPiBIb25lc3RseSBJIGRvbid0IHRoaW5rIHN5c3RlbXMgd2l0aCBTb0NzIGxpa2UgUksz
Mzk5IGhhdmUgcHJvYmxlbXMgd2l0aCA1Nk0gCj4gbW9yZSwgc28gSSB3b3VsZCBnbyB3aXRoIGV4
cGFuZGluZyByb290ZnMgdG8gMTIwTSBhbmQgaWYgbWFpbnRhaW5lciBpbiBDYyB3YW50cyAKPiB0
byBzaHJpbmsgTGludXggYW5kIHRhcmdldCB0ZXN0aW5nIGl0IGlzIHdlbGNvbWUgdG8gc2VuZCBh
IHBhdGNoLgo+IAo+IFdoYXQgZG8geW91IHRoaW5rPwo+IAo+IEJlc3QgcmVnYXJkcwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
