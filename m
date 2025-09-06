Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE987CA1012
	for <buildroot@archiver.kernel.org>; Sat,  6 Sep 2025 16:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3081E83F1E;
	Sat,  6 Sep 2025 16:21:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LUQ9Z-E6awUi; Sat,  6 Sep 2025 16:21:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2798383F15
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2798383F15;
	Sat,  6 Sep 2025 16:21:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A5DCECA
 for <buildroot@buildroot.org>; Sat,  6 Sep 2025 16:21:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8BE1C60BD5
 for <buildroot@buildroot.org>; Sat,  6 Sep 2025 16:21:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cl2EMaiQA3PY for <buildroot@buildroot.org>;
 Sat,  6 Sep 2025 16:21:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::342; helo=mail-wm1-x342.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3E3CD60D95
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E3CD60D95
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3E3CD60D95
 for <buildroot@buildroot.org>; Sat,  6 Sep 2025 16:21:04 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-45cb5e1adf7so25278565e9.0
 for <buildroot@buildroot.org>; Sat, 06 Sep 2025 09:21:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757175663; x=1757780463;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gH0709geSFuUefc95EhdmE12iovMAETCjS+6GWT9mZ8=;
 b=LMKCBGTij0PcSm7/hnHc8iZC06vCcsz6cZkDgucYjqtZExzZLda0higBtN9vbcIbMV
 4X0bqOoC/EVvRLqA5x/b0HMoyrVRlrUNxus4kA4FBxW3zjvmtQ7tkZ6m37euiRBdn98p
 pzfzTvOz6oBNrE4Sb9NrMmPCUSyzB3kD6NwuEJ7E2xHeJEBr0jcq55c5ARVBAbfW3nwu
 Oopc/1FIdg6rpesWtFC2gD/cn/1hVX9pYZyWePOqzPZ7GG/7rey7n10y3u2ws3Twv2mx
 i7tlj/Tdqy9QKDFeKS5yCPz6lHPRUg2YetRcBe7ft1sP9n9PChthWos8NIttpQq1yhD/
 xfTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXW0lD6tSLkcz77RuQ5Uv6AcjDHovENTFSknwTihYBWb5P72/XJMLcRSpDZ37BMY3ifIRD9mfVAis=@buildroot.org
X-Gm-Message-State: AOJu0Ywg+PJwZPumwjT+95AdMdoys0+0mgk/G5BAkoRpV1jiX8Cqsm1/
 OwbtcA8PWbNBjW3bN7QKOiyQziS87wLm2eBkU3oNnBMHx94PuLiFuVVTbRdESNNAKJowNSFChQL
 3uyxyE7JBRw==
X-Gm-Gg: ASbGncv6GB4v8qAHTCPa2ml25IvO21xQ5NU2RNZmDmiRtXaiwV9TvDOSewNBv8u2Xsv
 TQq26krinYxBPE0FBEG/AB6ls+BCQ5ngcxpYbWmqTUIc/7Mb8BW4VY6i5f7hZ4D7H4mgXqA4gSp
 2+LEATBGJfo5uyqzIAU1MF7HEWlKRybQD4ET2A5s0tRWQKpA8/UQ9R9wTZBRvmIDkb43QjSUQcj
 uUaHHc5QqE4VHwrNWBKK08giwvRpDm7CsnsdVyLFLpoS3V0UL5vgEUJMiFNXwTKDrYuf3SMoU22
 gscJ5PmMDEX0Ul4iV7FfUOmWXLE6lLchscA3TufJ6d9aPyagNqu+FSW6JERw1wggEdfC3T/nZe2
 w+n6lIZhldTyXQjPJaSM5+A0vcKPR3P1toonn2dDu07ZavnNZMkoBgvEcKTx4cmUS9sDBNSHVFi
 AqEIl2fEW7w6qzgW0SvYOiT84gvCburHfDvSbrGqre1SfldRfYHSRKjXFBanddMjG1bxt1+/E=
X-Google-Smtp-Source: AGHT+IF8UxgsWaM/mtCUgjXfxWzfH+eBRPuMB5NIuMfAoY46dv67WbjTeqzYxm/jA7KI8NvPeMLGtA==
X-Received: by 2002:a05:6000:401f:b0:3cf:3fe7:21f6 with SMTP id
 ffacd0b85a97d-3e64c1c2a05mr2120309f8f.44.1757175662921; 
 Sat, 06 Sep 2025 09:21:02 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3cf34491a65sm34584389f8f.56.2025.09.06.09.21.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 06 Sep 2025 09:21:02 -0700 (PDT)
Message-ID: <43f04497-9836-4d00-9607-91b33c4ea4d7@smile.fr>
Date: Sat, 6 Sep 2025 18:21:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20250829152440.2183374-1-thomas.petazzoni@bootlin.com>
Content-Language: fr
In-Reply-To: <20250829152440.2183374-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1757175663; x=1757780463; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gH0709geSFuUefc95EhdmE12iovMAETCjS+6GWT9mZ8=;
 b=jsn9GeOZM8TAlC0wgjnBHq3l9pCsWlmFy6sI5fEo6OG6SKLGUT22pSuQtMVg1ZNdOQ
 fdEUZJhS/YuUc2aKTl8KfSABchWxsZD0MA3or1EAYyWHFLtXpkvURTp5dWDUsggf/ko/
 wwnlV48c0f6aRlw4Ubn8KFopnLL9Ck1I7kiYA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=jsn9GeOZ
Subject: Re: [Buildroot] [PATCH v2] package/gdb: really fix build with GCC
 15.x by using external readline
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLCBBbGwsCgpMZSAyOS8wOC8yMDI1IMOgIDE3OjI0LCBUaG9tYXMgUGV0YXp6
b25pIHZpYSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKPiBUaGUgY29weSBvZiByZWFkbGluZSBidW5k
bGVkIHdpdGggZ2RiIHZlcnNpb25zIGVhcmxpZXIgdGhhbiAxNi54IGRvZXMKPiBub3QgYnVpbGQg
d2l0aCBHQ0MgMTUueCwgZGVzcGl0ZSBvdXIKPiAwMDEwLXJlYWRsaW5lLXRjYXAuaC1VcGRhdGUt
ZGVmaW5pdGlvbnMtZm9yLUMyMy5wYXRjaC4gSW4gR0RCIDE2LngsCj4gcmVhZGxpbmUgaGFzIGJl
ZW4gdXBkYXRlZCB0byA4LjIsIHdoaWNoIGZpeGVzIHRoZSBpc3N1ZSwgYnV0Cj4gYmFja3BvcnRp
bmcgdGhpcyB0byBvbGRlciBHREIgdmVyc2lvbnMgcmVzdWx0cyBpbiBhIH40NTAgS0IuCj4gCj4g
U28gbGV0J3MgdGFrZSB0aGUgYXBwcm9hY2ggd2Ugc2hvdWxkIGhhdmUgcHJvYmFibHkgdGFrZW4g
ZnJvbSB0aGUKPiBncm91bmQgdXA6IHVzZSBhbiBleHRlcm5hbCByZWFkbGluZSwgaW5zdGVhZCBv
ZiB0aGUgYnVuZGxlZCBvbmUuIFRoaXMKPiBpcyBleGFjdGx5IHdoYXQgdGhpcyBwYXRjaCBkb2Vz
LiBJbnN0ZWFkIG9mIGhhdmluZyBnZGIgZGVwZW5kIG9uCj4gbmN1cnNlcyBhbmQgaG9zdC1nZGIg
ZGVwZW5kIG9uIGhvc3QtbmN1cnNlcywgd2UgbWFrZSBpdCBkZXBlbmQgb24KPiByZWFkbGluZS9o
b3N0LXJlYWRsaW5lICh3aGljaCBpbiB0dXJuIGFscmVhZHkgaGFzIGEgZGVwZW5kZW5jeSBvbgo+
IG5jdXJzZXMpLiBJbiBmYWN0LCBnZGIgZG9lcyBub3QgbmVlZCBuY3Vyc2VzIGl0c2VsZiwgaXQg
cmVhbGx5IG5lZWRzCj4gb25seSByZWFkbGluZS4KPiAKPiBTaW5jZSB0aGUgR0RCIFRVSSBpdHNl
bGYgbmVlZHMgbmN1cnNlcywgd2UgbW92ZSB0aGUgbmN1cnNlcwo+IHNlbGVjdC9kZXBlbmRlbmN5
IGRvd24gdG8gdGhlIEdEQiBUVUkgb3B0aW9uLiBUaGlzIHdhcyBwb2ludGVkIG91dCBieQo+IFJv
bWFpbiBOYW91ci4KPiAKPiBGaXhlczoKPiAKPiAgIGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9v
dC5uZXQvcmVzdWx0cy8zYjBjZTVjZmFjODFlMTUwODE2MDI3ZmMxMjU5NjAwZWUwMmYwZjFmLyAo
aG9zdCBnZGIgMTQueCkKPiAgIGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0
cy9lNjRlM2NkN2FhNWU3MzE1NDY0ZTM4MDk4MmY3ZmViYWZmNWRmOTA4LyAoaG9zdCBnZGIgMTUu
eCkKPiAgIGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy8yZjI2MTZhNGFj
N2Q5Y2JjMDZiYTc3NzVlYjU3YmRkMmEwNDE5Y2I1LyAoaG9zdCBhcmMgZ2RiKQoKQWN0dWFsbHkg
aXQgZml4ZXMgdHdvIG1vcmUgaXNzdWVzIG9uIEdpdGxhYi1DSToKICAgICAgaHR0cHM6Ly9naXRs
YWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy8xMTE3Njc3NDM0OQooVGVzdEdk
YkZ1bGxUYXJnZXQpCiAgICAgIGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxk
cm9vdC8tL2pvYnMvMTExNzY3NzQzNDggKFRlc3RHZGJBcmMpCgpCdXQgdGhlIGxhc3Qgb25lIHN0
aWxsIGZhaWw6Cmh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pv
YnMvMTExNzY3NzQzNTUgKFRlc3RHZGJzZXJ2ZXJPbmx5KQoKc2VlIGJlbG93LgoKPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29t
Pgo+IC0tLQo+IHYxIC0+IHYyOiBzZWxlY3QgbmN1cnNlcyBmb3IgR0RCIFRVSQo+IC0tLQo+ICAu
Li5uZS10Y2FwLmgtVXBkYXRlLWRlZmluaXRpb25zLWZvci1DMjMucGF0Y2ggfCA1MiAtLS0tLS0t
LS0tLS0tLS0tLS0tCj4gIC4uLm5lLXRjYXAuaC1VcGRhdGUtZGVmaW5pdGlvbnMtZm9yLUMyMy5w
YXRjaCB8IDUyIC0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgLi4ubmUtdGNhcC5oLVVwZGF0ZS1kZWZp
bml0aW9ucy1mb3ItQzIzLnBhdGNoIHwgNTIgLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICBwYWNrYWdl
L2dkYi9Db25maWcuaW4gICAgICAgICAgICAgICAgICAgICAgICAgfCAgMyArLQo+ICAuLi5uZS10
Y2FwLmgtVXBkYXRlLWRlZmluaXRpb25zLWZvci1DMjMucGF0Y2ggfCA1MiAtLS0tLS0tLS0tLS0t
LS0tLS0tCj4gIHBhY2thZ2UvZ2RiL2dkYi5tayAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICA4ICsrLQo+ICA2IGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMjExIGRlbGV0aW9u
cygtKQo+ICBkZWxldGUgbW9kZSAxMDA2NDQgcGFja2FnZS9nZGIvMTQuMi8wMDEwLXJlYWRsaW5l
LXRjYXAuaC1VcGRhdGUtZGVmaW5pdGlvbnMtZm9yLUMyMy5wYXRjaAo+ICBkZWxldGUgbW9kZSAx
MDA2NDQgcGFja2FnZS9nZGIvMTUuMi8wMDEwLXJlYWRsaW5lLXRjYXAuaC1VcGRhdGUtZGVmaW5p
dGlvbnMtZm9yLUMyMy5wYXRjaAo+ICBkZWxldGUgbW9kZSAxMDA2NDQgcGFja2FnZS9nZGIvMTYu
My8wMDEwLXJlYWRsaW5lLXRjYXAuaC1VcGRhdGUtZGVmaW5pdGlvbnMtZm9yLUMyMy5wYXRjaAo+
ICBkZWxldGUgbW9kZSAxMDA2NDQgcGFja2FnZS9nZGIvYXJjLTIwMjQuMTItcmVsZWFzZS1nZGIv
MDAwMS1yZWFkbGluZS10Y2FwLmgtVXBkYXRlLWRlZmluaXRpb25zLWZvci1DMjMucGF0Y2gKPiAK
ClsuLi5dCgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2dkYi9Db25maWcuaW4gYi9wYWNrYWdlL2dk
Yi9Db25maWcuaW4KPiBpbmRleCBiMTY3OGUwZDYzLi5mZjdhZmI4ZjEzIDEwMDY0NAo+IC0tLSBh
L3BhY2thZ2UvZ2RiL0NvbmZpZy5pbgo+ICsrKyBiL3BhY2thZ2UvZ2RiL0NvbmZpZy5pbgo+IEBA
IC02MCw3ICs2MCw3IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9HREJfREVCVUdHRVIKPiAgCWRlcGVu
ZHMgb24gIUJSMl9zaAo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX0dNUAo+ICAJc2VsZWN0IEJSMl9Q
QUNLQUdFX01QRlIKPiAtCXNlbGVjdCBCUjJfUEFDS0FHRV9OQ1VSU0VTCj4gKwlzZWxlY3QgQlIy
X1BBQ0tBR0VfUkVBRExJTkUKPiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9aTElCCj4gIAo+ICBjb21t
ZW50ICJmdWxsIGdkYiBvbiB0YXJnZXQgbmVlZHMgYSB0b29sY2hhaW4gdy8gd2NoYXIiCj4gQEAg
LTcxLDYgKzcxLDcgQEAgaWYgQlIyX1BBQ0tBR0VfR0RCX0RFQlVHR0VSCj4gIAo+ICBjb25maWcg
QlIyX1BBQ0tBR0VfR0RCX1RVSQo+ICAJYm9vbCAiVFVJIHN1cHBvcnQiCj4gKwlzZWxlY3QgQlIy
X1BBQ0tBR0VfTkNVUlNFUwo+ICAJaGVscAo+ICAJICBUaGlzIG9wdGlvbiBlbmFibGVzIHRlcm1p
bmFsIHVzZXIgaW50ZXJmYWNlIChUVUkpIGZvciBnZGIKPiAgCgpbLi4uXQoKPiBkaWZmIC0tZ2l0
IGEvcGFja2FnZS9nZGIvZ2RiLm1rIGIvcGFja2FnZS9nZGIvZ2RiLm1rCj4gaW5kZXggY2E5YzZk
NzRkNS4uYzNjNTU3Mzk3MyAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2dkYi9nZGIubWsKPiArKysg
Yi9wYWNrYWdlL2dkYi9nZGIubWsKPiBAQCAtMzAsNyArMzAsNyBAQCBHREJfUFJFX0NPTkZJR1VS
RV9IT09LUyArPSBHREJfQ09ORklHVVJFX1NZTUxJTksKPiAgIyBGb3IgdGhlIGhvc3QgdmFyaWFu
dCwgd2UgcmVhbGx5IHdhbnQgdG8gYnVpbGQgd2l0aCBYTUwgc3VwcG9ydCwKPiAgIyB3aGljaCBp
cyBuZWVkZWQgdG8gcmVhZCBYTUwgZGVzY3JpcHRpb25zIG9mIHRhcmdldCBhcmNoaXRlY3R1cmVz
LiBXZQo+ICAjIGFsc28gbmVlZCBuY3Vyc2VzLgo+IC1IT1NUX0dEQl9ERVBFTkRFTkNJRVMgPSBo
b3N0LWV4cGF0IGhvc3QtbmN1cnNlcyBob3N0LXpsaWIKPiArSE9TVF9HREJfREVQRU5ERU5DSUVT
ID0gaG9zdC1leHBhdCBob3N0LXJlYWRsaW5lIGhvc3QtemxpYgo+ICAKPiAgIyBEaXNhYmxlIGJ1
aWxkaW5nIGRvY3VtZW50YXRpb24KPiAgR0RCX01BS0VfT1BUUyArPSBNQUtFSU5GTz10cnVlCj4g
QEAgLTEzNiw5ICsxMzYsMTAgQEAgaWZlcSAoJChCUjJfUEFDS0FHRV9HREJfREVCVUdHRVIpLHkp
Cj4gIEdEQl9ERVBFTkRFTkNJRVMgKz0gemxpYgo+ICBHREJfQ09ORl9PUFRTICs9IFwKPiAgCS0t
ZW5hYmxlLWdkYiBcCj4gKwktLXdpdGgtc3lzdGVtLXJlYWRsaW5lIFwKPiAgCS0td2l0aC1jdXJz
ZXMgXAo+ICAJLS13aXRoLXN5c3RlbS16bGliCj4gLUdEQl9ERVBFTkRFTkNJRVMgKz0gbmN1cnNl
cyBcCj4gK0dEQl9ERVBFTkRFTkNJRVMgKz0gcmVhZGxpbmUgXAoKQWN0dWFsbHkgZ2Ric2VydmVy
IGFsc28gZGVwZW5kcyBvbiByZWFkbGluZSBidXQgdGhpcyBwYXJ0IGlzIG9ubHkgdXNlZCB3aGVu
CkJSMl9QQUNLQUdFX0dEQl9ERUJVR0dFUiBpcyBlbmFibGVkLgoKV2hlbiBvbmx5IEJSMl9QQUNL
QUdFX0dEQl9TRVJWRVIgaXMgZW5hYmxlZCwgdGhlIHJlYWRsaW5lIGRlcGVuZGVuY3kgaXMgbWlz
c2luZy4KCldpdGggdGhhdCBmaXhlZCwgdGhlIFRlc3RHZGJzZXJ2ZXJPbmx5IHBhc3MgbG9jYWxs
eS4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAgCSQoaWYgJChCUjJfUEFDS0FHRV9MSUJJQ09O
ViksbGliaWNvbnYpCj4gIGVsc2UKPiAgIyBXaGVuIG9ubHkgYnVpbGRpbmcgZ2Ric2VydmVyLCB3
ZSBkb24ndCBuZWVkIHpsaWIuIEJ1dCB3ZSBoYXZlIG5vIHdheSB0bwo+IEBAIC0xODcsNiArMTg4
LDcgQEAgR0RCX0NPTkZfT1BUUyArPSAtLWRpc2FibGUtaW5wcm9jZXNzLWFnZW50Cj4gIGVuZGlm
Cj4gIAo+ICBpZmVxICgkKEJSMl9QQUNLQUdFX0dEQl9UVUkpLHkpCj4gK0dEQl9ERVBFTkRFTkNJ
RVMgKz0gbmN1cnNlcwo+ICBHREJfQ09ORl9PUFRTICs9IC0tZW5hYmxlLXR1aQo+ICBlbHNlCj4g
IEdEQl9DT05GX09QVFMgKz0gLS1kaXNhYmxlLXR1aQo+IEBAIC0yNjIsMTAgKzI2NCwxMiBAQCBI
T1NUX0dEQl9DT05GX09QVFMgPSBcCj4gIAktLXdpdGgtc3lzdGVtLXpsaWIgXAo+ICAJLS13aXRo
LWN1cnNlcyBcCj4gIAktLWRpc2FibGUtc291cmNlLWhpZ2hsaWdodCBcCj4gKwktLXdpdGgtc3lz
dGVtLXJlYWRsaW5lIFwKPiAgCSQoR0RCX0RJU0FCTEVfQklOVVRJTFNfQ09ORl9PUFRTKSBcCj4g
IAktLXdpdGgtbXBmcj0kKEhPU1RfRElSKQo+ICAKPiAgaWZlcSAoJChCUjJfUEFDS0FHRV9IT1NU
X0dEQl9UVUkpLHkpCj4gK0hPU1RfR0RCX0RFUEVOREVOQ0lFUyArPSBob3N0LW5jdXJzZXMKPiAg
SE9TVF9HREJfQ09ORl9PUFRTICs9IC0tZW5hYmxlLXR1aQo+ICBlbHNlCj4gIEhPU1RfR0RCX0NP
TkZfT1BUUyArPSAtLWRpc2FibGUtdHVpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
