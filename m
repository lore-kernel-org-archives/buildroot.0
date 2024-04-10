Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BCDECD11C2
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 21:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D47860EA9;
	Wed, 10 Apr 2024 21:58:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id InY7RN6-wExl; Wed, 10 Apr 2024 21:58:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FE5D60EAA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FE5D60EAA;
	Wed, 10 Apr 2024 21:58:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2EE8A1BF4D6
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:58:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1AE874154B
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 21:58:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MeUvITS5-vMi for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 21:58:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7D33B41528
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D33B41528
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7D33B41528
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 21:58:08 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-417d58cc845so501695e9.1
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 14:58:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712786287; x=1713391087;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/y1C1a0BJPBLhcvJsbUoI6oa9If89jgHr8ViVKccQqo=;
 b=PfP8riB9BycguwGQy6500h4crYK6D7n8IckhQXYDvhMT8AzjtJ53rMKJzWct6Q+vYn
 7OuBYUAtXmiO7gasubt4IEl4rAKXxN7gJMGd6C+MpXnKNsbcSsZHI6zPVYFqX0DoNZU8
 v97Kmb//4lt3j9XcpoWaQ+15tcHyObNPZTAAspk00eqflLIf/dX+Os6VWWdXu9rbL5YS
 NgbF7kenfiiUNoPf+O/MdvjteZW8hSBHVf0K8tikAPk31cEo17zfn7XtYfA/H0ChwY2+
 m9CpmuM6Kgrj868+m7uMqQzEKWQu5eH50dseD0/u2pd7peoashgIFu9khMcO6fDXybwF
 wkxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFuGtnm2WJCpk0J70rXhf8L43y2efGEcwgIo+WvaS9sZxIbZQ7P11r7eWeR2lKbY1ro2jc5/v0cDIzx/S+Gan0yVle1uRNXA==
X-Gm-Message-State: AOJu0YxsRxkOHKYB3RMWPS0eanqpEDDRz065wLbp0gzJBjeJeuz1n27P
 Q1CJPU+hI8oZz3UW4tjP2n4yb7Y1etJmbjrI5CMvSQs53/OhpTFyTWWN0eHxoyg=
X-Google-Smtp-Source: AGHT+IESCeOIOIIpUs+IPFUJIykp7ZMNyF6H4HOJLocwo5jvRZMIHACoRX1NadTXuVdMNeOcyL3zPw==
X-Received: by 2002:a05:600c:6544:b0:413:fea7:bd19 with SMTP id
 dn4-20020a05600c654400b00413fea7bd19mr2580965wmb.15.1712786286738; 
 Wed, 10 Apr 2024 14:58:06 -0700 (PDT)
Received: from [192.168.1.45] (lfbn-nan-1-335-137.w82-120.abo.wanadoo.fr.
 [82.120.169.137]) by smtp.gmail.com with ESMTPSA id
 t20-20020a05600c199400b0041691379a84sm4126277wmq.1.2024.04.10.14.58.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Apr 2024 14:58:06 -0700 (PDT)
Message-ID: <175783f5-a44c-47ae-b261-c9ddd8cb9291@smile.fr>
Date: Wed, 10 Apr 2024 23:58:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Heiko Thiery <heiko.thiery@gmail.com>, buildroot@buildroot.org
References: <20240404081714.1190807-1-heiko.thiery@gmail.com>
Content-Language: fr, en-US
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240404081714.1190807-1-heiko.thiery@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712786287; x=1713391087;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/y1C1a0BJPBLhcvJsbUoI6oa9If89jgHr8ViVKccQqo=;
 b=KPeOnNmhaLzY0h70V7YkjXxRiVDVnFdge6cbAOFPlzoeDog8VgevvJrfvti57dwWe1
 bZn3XSofU7U5wepd9fUCgPsDj3becCkOCnwsIdPm4z64hdlZ2q7WRvtWuAJwSeoUobku
 ULDEkfpc6vXfFpnYKsUOtjOqzRliQhgnn/4i1Y9DQ7HZzUsv3eXyz6figu9s1eoCcg1f
 oh//nNefQcevoFL1adlk7ojqAiefxI6S+/x5odvIMiiNng0YNucCcMYnmm1eshDn1QeR
 R6QgjdIeXyfWvpE8qj0ybr3pxl7BZ1W+rwz8Rl7TrOG77liRfXFlwhO0x4OHhDW+uPc9
 BGyg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=KPeOnNmh
Subject: Re: [Buildroot] [PATCH v2 1/3] package/python-yamllint: new package
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
Cc: michael@amarulasolutions.com, Michael Walle <michael@walle.cc>,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Andreas Dannenberg <dannenberg@ti.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSGVpa28sCgpMZSAwNC8wNC8yMDI0IMOgIDEwOjE3LCBIZWlrbyBUaGllcnkgYSDDqWNy
aXTCoDoKPiBUaGlzIGhvc3QgcGFja2FnZSBpcyBuZWVkZWQgc2luY2UgdS1ib290IDIwMjQuMDQg
Zm9yIGJ1aWxkaW5nIHRpIGRlZmNvbmZpZ3MuCj4gCj4gVGhpcyBpcyBhbiByZXF1aXJlbWVudCBm
b3IgdXNpbmcgYnVpbGRtYW4vYmlubWFuIFsxXS4KPiAKPiBbMV0gaHR0cHM6Ly9zb3VyY2UuZGVu
eC5kZS91LWJvb3QvdS1ib290Ly0vYmxvYi92MjAyNC4wNC90b29scy9idWlsZG1hbi9yZXF1aXJl
bWVudHMudHh0P3JlZl90eXBlPXRhZ3MjTDMKPiAKPiBTaWduZWQtb2ZmLWJ5OiBIZWlrbyBUaGll
cnkgPGhlaWtvLnRoaWVyeUBnbWFpbC5jb20+Cj4gLS0tCj4gIHBhY2thZ2UvQ29uZmlnLmluICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+ICBwYWNrYWdlL3B5dGhvbi15YW1sbGlu
dC9Db25maWcuaW4gICAgICAgICAgICB8ICA2ICsrKysrKwo+ICBwYWNrYWdlL3B5dGhvbi15YW1s
bGludC9weXRob24teWFtbGxpbnQuaGFzaCB8ICAzICsrKwo+ICBwYWNrYWdlL3B5dGhvbi15YW1s
bGludC9weXRob24teWFtbGxpbnQubWsgICB8IDE1ICsrKysrKysrKysrKysrKwo+ICA0IGZpbGVz
IGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uv
cHl0aG9uLXlhbWxsaW50L0NvbmZpZy5pbgo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9w
eXRob24teWFtbGxpbnQvcHl0aG9uLXlhbWxsaW50Lmhhc2gKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IHBhY2thZ2UvcHl0aG9uLXlhbWxsaW50L3B5dGhvbi15YW1sbGludC5tawo+IAo+IGRpZmYgLS1n
aXQgYS9wYWNrYWdlL0NvbmZpZy5pbiBiL3BhY2thZ2UvQ29uZmlnLmluCj4gaW5kZXggODc3Njc5
OTNhMi4uYTAyMzcwYTJhZCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL0NvbmZpZy5pbgo+ICsrKyBi
L3BhY2thZ2UvQ29uZmlnLmluCj4gQEAgLTE0MzcsNiArMTQzNyw3IEBAIG1lbnUgIkV4dGVybmFs
IHB5dGhvbiBtb2R1bGVzIgo+ICAJc291cmNlICJwYWNrYWdlL3B5dGhvbi14bWxqc29uL0NvbmZp
Zy5pbiIKPiAgCXNvdXJjZSAicGFja2FnZS9weXRob24teG1sdG9kaWN0L0NvbmZpZy5pbiIKPiAg
CXNvdXJjZSAicGFja2FnZS9weXRob24teG1vZGVtL0NvbmZpZy5pbiIKPiArCXNvdXJjZSAicGFj
a2FnZS9weXRob24teWFtbGxpbnQvQ29uZmlnLmluIgo+ICAJc291cmNlICJwYWNrYWdlL3B5dGhv
bi15YXJsL0NvbmZpZy5pbiIKPiAgCXNvdXJjZSAicGFja2FnZS9weXRob24teWF0bC9Db25maWcu
aW4iCj4gIAlzb3VyY2UgInBhY2thZ2UvcHl0aG9uLXpjLWxvY2tmaWxlL0NvbmZpZy5pbiIKPiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24teWFtbGxpbnQvQ29uZmlnLmluIGIvcGFja2FnZS9w
eXRob24teWFtbGxpbnQvQ29uZmlnLmluCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAw
MDAwMDAwMDAwLi5jYjY3YjM1NWMzCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvcHl0
aG9uLXlhbWxsaW50L0NvbmZpZy5pbgo+IEBAIC0wLDAgKzEsNiBAQAo+ICtjb25maWcgQlIyX1BB
Q0tBR0VfUFlUSE9OX1lBTUxMSU5UCj4gKwlib29sICJweXRob24teWFtbGxpbnQiCgpZb3UgYXJl
IGFkZGluZyB0aGUgdGFyZ2V0IHZhcmlhbnQgaGVyZSBidXQgcHl0aG9uLXB5eWFtbCBhbmQgcHl0
aG9uLXBhdGhzcGVjCnJ1bnRpbWUgZGVwZW5kZW5jaWVzIGFyZSBtaXNzaW5nOgoKaHR0cHM6Ly9n
aXRodWIuY29tL2FkcmllbnZlcmdlL3lhbWxsaW50L2Jsb2IvbWFzdGVyL3B5cHJvamVjdC50b21s
I0wyMAoKU2luY2UgcHl0aG9uIHBhY2thZ2UgZWFzaWx5IGJyZWFrIGF0IHJ1bnRpbWUsIGl0IHdv
dWxkIGJlIGdyZWF0IGlmIHlvdSBjYW4gYWRkIGEKcnVudGltZSB0ZXN0LgoKSSB0ZXN0ZWQgdGhl
IGhvc3QgdmFyaWFudCB0byBidWlsZCB1Ym9vdCAyMDI0LjA0IGZvciB0aGUgU0stVERBNFZNIGJv
YXJkLgoKVGVzdGVkLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4KCkJl
c3QgcmVnYXJkcywKUm9tYWluCgoKPiArCWhlbHAKPiArCSAgQSBsaW50ZXIgZm9yIFlBTUwgZmls
ZXMuCj4gKwo+ICsJICBodHRwczovL2dpdGh1Yi5jb20vYWRyaWVudmVyZ2UveWFtbGxpbnQKPiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24teWFtbGxpbnQvcHl0aG9uLXlhbWxsaW50Lmhhc2gg
Yi9wYWNrYWdlL3B5dGhvbi15YW1sbGludC9weXRob24teWFtbGxpbnQuaGFzaAo+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uZDgwZTBmZGY0Mgo+IC0tLSAvZGV2L251
bGwKPiArKysgYi9wYWNrYWdlL3B5dGhvbi15YW1sbGludC9weXRob24teWFtbGxpbnQuaGFzaAo+
IEBAIC0wLDAgKzEsMyBAQAo+ICsjIExvY2FsbHkgY29tcHV0ZWQgc2hhMjU2IGNoZWNrc3Vtcwo+
ICtzaGEyNTYgIDdhMDAzODA5Zjg4MzI0ZmQyYzg3NzczNGYyZDU3NWVlNzg4MWRkOTA0MzM2MDY1
N2NjODA0OWM4MDllYmE2Y2QgIHlhbWxsaW50LTEuMzUuMS50YXIuZ3oKPiArc2hhMjU2ICAzOTcy
ZGM5NzQ0ZjY0OTlmMGY5YjJkYmY3NjY5NmYyYWU3YWQ4YWY5YjIzZGRlNjZkNmFmODZjOWRmYjM2
OTg2ICBMSUNFTlNFCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLXlhbWxsaW50L3B5dGhv
bi15YW1sbGludC5tayBiL3BhY2thZ2UvcHl0aG9uLXlhbWxsaW50L3B5dGhvbi15YW1sbGludC5t
awo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uY2VhY2EzYjBiOAo+
IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL3B5dGhvbi15YW1sbGludC9weXRob24teWFt
bGxpbnQubWsKPiBAQCAtMCwwICsxLDE1IEBACj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4g
KyMKPiArIyBweXRob24teWFtbGxpbnQKPiArIwo+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+
ICsKPiArUFlUSE9OX1lBTUxMSU5UX1ZFUlNJT04gPSAxLjM1LjEKPiArUFlUSE9OX1lBTUxMSU5U
X1NPVVJDRSA9IHlhbWxsaW50LSQoUFlUSE9OX1lBTUxMSU5UX1ZFUlNJT04pLnRhci5nego+ICtQ
WVRIT05fWUFNTExJTlRfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNr
YWdlcy9kYS8wNi9kOGNlZTVjM2RmZDU1MGNjMGE0NjZlYWQ4YjMyMTEzODE5ODQ4NWQxMDM0MTMw
YWMxMzkzY2M0OWQ2M2UKPiArUFlUSE9OX1lBTUxMSU5UX1NFVFVQX1RZUEUgPSBwZXA1MTcKPiAr
UFlUSE9OX1lBTUxMSU5UX0xJQ0VOU0UgPSBHUEwtMy4wCj4gK1BZVEhPTl9ZQU1MTElOVF9MSUNF
TlNFX0ZJTEVTID0gTElDRU5TRQo+ICsKPiArJChldmFsICQocHl0aG9uLXBhY2thZ2UpKQo+ICsk
KGV2YWwgJChob3N0LXB5dGhvbi1wYWNrYWdlKSkKPiAtLQo+IDIuMzkuMgo+IAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
