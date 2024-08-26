Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC6A4C5472E
	for <buildroot@archiver.kernel.org>; Mon, 26 Aug 2024 18:29:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79484405D6;
	Mon, 26 Aug 2024 18:29:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8F5I2QpVuYQB; Mon, 26 Aug 2024 18:29:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB23240520
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB23240520;
	Mon, 26 Aug 2024 18:29:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 056441BF2AB
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 18:29:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E601F40257
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 18:29:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pe5ho5dksp4o for <buildroot@lists.busybox.net>;
 Mon, 26 Aug 2024 18:29:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=rgallaispou@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2414340239
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2414340239
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2414340239
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 18:29:44 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3718ca50fd7so2818494f8f.1
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 11:29:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724696983; x=1725301783;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qb1yFifiP5cC+DjlTad4v5a2e4jTUDKwWWB5f4Q3dzs=;
 b=C0ubWiVCed1VyK8sdko7i7ljCIPtqYQsybzG9C4BDMG3aiz9oHbhzahhNTGht2f+zl
 gTDvpDX3Cy60jf0/wgPwwdoWqisCI3IME5+/PXvFO2MXL2JL6BujBFHaJKPlazsY0yK1
 78lZKTrqSQqn2rz4zGtplyKUW/EUV+uIGopC31rVHH8X6c183fK3p9k03Kr8KCRzE8zN
 U7tra8Hes4VNmcAllZPjUiJrWA8lWlMeCRitdDkuB52nETkBiIYzYT9cx+QfRWHqM8yF
 ywGq5KEYuyqzmABKa/bfnO3aqzpwwiGYgCyYk/p9wcCqpNlzGeekbzi9xYOLKQc+VEF+
 JfXQ==
X-Gm-Message-State: AOJu0YwP0eExyfolE3yCSWrxt1XHWA827ZLiqjH12KlF//6tXjUs9nxE
 coEBdY7gMU6IQTcgmD4YEv1Q8UYdmDTyScf2BeLLmQ1hq9ho7sQJ
X-Google-Smtp-Source: AGHT+IEjkN0zvCfMWsJSz6l/o8JbR2CZUXzwyYfQYockpbgadx8BZasprWAkSQ4rRxLivKCGirBTvw==
X-Received: by 2002:a5d:590a:0:b0:367:9881:7d66 with SMTP id
 ffacd0b85a97d-3748c817d84mr337859f8f.41.1724696982304; 
 Mon, 26 Aug 2024 11:29:42 -0700 (PDT)
Received: from ?IPV6:2001:861:3385:e20:6384:4cf:52c5:3194?
 ([2001:861:3385:e20:6384:4cf:52c5:3194])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3730813c3d2sm11291853f8f.26.2024.08.26.11.29.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Aug 2024 11:29:41 -0700 (PDT)
Message-ID: <a1edf2c5-7e39-4f1a-95b2-089b528dfc27@gmail.com>
Date: Mon, 26 Aug 2024 20:29:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240814-master-v1-0-7834f3deddcb@gmail.com>
 <20240814-master-v1-2-7834f3deddcb@gmail.com>
 <20240815105603.1a752184@windsurf>
 <b9b52c88-a352-4ff2-856e-430cb65185ed@gmail.com>
 <20240817144800.5a2a813b@windsurf>
 <ff629108-f410-48f7-b95b-2e7d5761c295@gmail.com>
Content-Language: en-US, fr
In-Reply-To: <ff629108-f410-48f7-b95b-2e7d5761c295@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724696983; x=1725301783; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=qb1yFifiP5cC+DjlTad4v5a2e4jTUDKwWWB5f4Q3dzs=;
 b=ENGugBvfVElUJquC4qfE2MbRZFHBwq3aT9XEha7KLA5B1hkSIaA0A7IWgWn2LBRRKu
 DyiqHMf9btf3/JrUyfFuVKtKq9TV8DTD8iMQHz4wITcoZN+96UXxWU7jPXcuHVrT6Qh/
 B9COCWiJPTLzZ96dqDuNvsV9NKhyM/ZmHArDitO8PhiQbGGP3isxezQUL3fzGl/eaM26
 IINZZnB6hLLliS0oQ/fEKQ+VAP+kBNOiCbxH3I9t0i5ASGSlKmEOf/M2t6DsEtlNcRh5
 sfHPq+YPVio3BdUnlqojketeZlZwVKErsRnMTlMk1ovFloZcVqM+2jeHJxCA9pYlV+d5
 7/0w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ENGugBvf
Subject: Re: [Buildroot] [PATCH RESEND 2/2] configs/stm32mp135f-dk: new
 defconfig
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
Cc: Bartosz Bilas <b.bilas@grinn-global.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Marleen Vos <marleen.vos@mind.be>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpMZSAxNy8wOC8yMDI0IMOgIDE2OjMzLCBSYXBoYcOrbCBHYWxsYWlzLVBvdSBhIMOpY3JpdMKg
Ogo+IAo+IAo+IExlIDE3LzA4LzIwMjQgw6AgMTQ6NDgsIFRob21hcyBQZXRhenpvbmkgYSDDqWNy
aXTCoDoKPj4gSGVsbG8gUmFwaGFlbCwKPj4KPj4gT24gU2F0LCAxNyBBdWcgMjAyNCAxMjo1NTo0
NyArMDIwMAo+PiBSYXBoYcOrbCBHYWxsYWlzLVBvdSA8cmdhbGxhaXNwb3VAZ21haWwuY29tPiB3
cm90ZToKPj4KPj4+PiBUaGFua3MgZm9yIHRoZSByZXNlbmQsIGJ1dCB0aGVyZSB3YXMgbm8gbmVl
ZCB0byByZXNlbmQ6IHlvdXIgcHJldmlvdXMKPj4+PiBwYXRjaCB3YXMgc3RpbGwgaW4gb3VyIHF1
ZXVlIG9mIHBhdGNoZXMgdG8gcmV2aWV3L21lcmdlLiBJIGhhdmUgYQo+Pj4+IG51bWJlciBvZiBj
b21tZW50cyBiZWxvdy4KPj4+Cj4+PiBTb3JyeSBmb3IgdGhlIGluY29udmVuaWVuY2UuIEkgaGFk
IG5vIG5ld3Mgb2YgdGhlIHBhdGNoc2V0IHdoaWNoIGxlZCBtZQo+Pj4gdG8gcmVzZW5kIGl0LiBU
aGFua3MgZm9yIHRha2luZyB0aGUgdGltZSB0byByZXZpZXcgdGhpcyBvbmUgYW5kIG1lcmdlCj4+
PiB0aGUgcHJldmlldy4KPj4KPj4gUGF0Y2hlcyBhcmUgbmV2ZXIgZm9yZ290dGVuOiB0aGV5IGFy
ZSB0cmFja2VkIHVuZGVyIHBhdGNod29yayBhcyBzb29uCj4+IGFzIHRoZXkgYXJlIHBvc3RlZCBv
biB0aGUgbWFpbGluZyBsaXN0LiBJZiB5b3UgaGF2ZSBubyBuZXdzLCB5b3UgY2FuCj4+IHBpbmcg
b24gdGhlIHBhdGNoIHNlcmllcyBpZiB5b3Ugd2FudCwgYnV0IHJlc2VuZGluZyB3aXRob3V0IGFu
eSBjaGFuZ2VzCj4+IGlzbid0IHZlcnkgdXNlZnVsLgo+IAo+IFVuZGVyc3Rvb2QuIEkgd2lsbCBw
aW5nIGlmIEkgZW5jb3VudGVyIHRoaXMgc2l0dWF0aW9uIGFnYWluLiBUaGFuayB5b3UgCj4gZm9y
IHlvdXIgY2xhcmlmaWNhdGlvbi4KPiAKPj4KPj4+PiBGaXJzdCBvZiBhbGwsIHlvdSBuZWVkIHRv
IGVuYWJsZSBCUjJfRE9XTkxPQURfRk9SQ0VfQ0hFQ0tfSEFTSEVTPXksCj4+Pj4gd2hpY2ggcmVx
dWlyZXMgYWRkaW5nOgo+Pj4+Cj4+Pj4gQlIyX0dMT0JBTF9QQVRDSF9ESVI9ImJvYXJkL3N0bWlj
cm9lbGVjdHJvbmljcy9zdG0zMm1wMTM1Zi1kay9wYXRjaGVzLyIKPj4+Pgo+Pj4+IGFuZCB0aGVu
IHJ1biAuL3V0aWxzL2FkZC1jdXN0b20taGFzaGVzLCB3aGljaCB3aWxsIGF1dG9tYXRpY2FsbHkK
Pj4+PiBwb3B1bGF0ZSB0aGlzIGZvbGRlci4KPj4+Cj4+PiBGb3IgdGhpcyBvbmUgSSB0aGluayB0
aGF0IGl0IHdpbGwgYmUgYmV0dGVyIHRvIHNldCB0aGUgZGlyZWN0b3J5IGFzIHRoZQo+Pj4gc2Ft
ZSBvZiB0aGUgY29tbW9uIGRpcmVjdG9yeSwgZWcuCj4+PiAiYm9hcmQvc3RtaWNyb2VsZWN0cm9u
aWNzL2NvbW1vbi9zdG0zMm1wMXh4L3BhdGNoZXMvIi4gU28gdGhhdCB0aGUKPj4+IHZlcnNpb25z
IGJldHdlZW4gVEYtQS9VLUJvb3QsIHRoZSBMaW51eCBrZXJuZWwgYXMgd2VsbCBhcyBPUC1URUUs
IGlmIGl0Cj4+PiBpcyBhY3RpdmF0ZWQgaW4gdGhlIGZ1dHVyZSBmb3IgdGhlIG90aGVyIHBsYXRm
b3Jtcywgd2lsbCBiZSBzeW5jZWQKPj4+IGJldHdlZW4gYWxsIHN0bTMybXAxKiBwbGF0Zm9ybXMu
Cj4+Cj4+IEJ1dCB0aGVuIGl0IG1lYW5zIHRoYXQgYWxsIHRoZSBzdG0zMm1wMSBkZWZjb25maWdz
IG11c3QgYmUgdXBkYXRlZCBpbgo+PiBzeW5jIHdoZW5ldmVyIExpbnV4LCBVLUJvb3QsIFRGLUEg
b3IgT1AtVEVFIGFyZSBidW1wZWQuCj4gCj4gWWVzLCBpbmRlZWQuCj4gCj4gU2luY2Ugc3RtMzJt
cDE1N2MtZGsyLCBzdG0zMm1wMTU3YS1kazEgYW5kIHN0bTMybXAxMzVmLWRrIGFyZSBwcmV0dHkg
Cj4gbXVjaCB0aGUgc2FtZSBwcm9kdWN0IGxpbmUsIEkgZmlndXJlZCB0aGF0IHdvdWxkIGJlIGVh
c2llciB0byB0aWUgdGhlaXIgCj4gY29tcG9uZW50IHZlcnNpb25zIHRvZ2V0aGVyLiBUaGF0IHdv
dWxkIGJlIGVhc2llciB0byBtYWludGFpbiBJTUhPLgo+IAo+Pgo+Pgo+Pj4+IEkgc2VlIG9uIFNU
TTMyTVAxNTcsIHdlJ3JlIHVzaW5nIHNvbWUgY3VzdG9tIGtlcm5lbCBjb25maWd1cmF0aW9uCj4+
Pj4gZmlsZXMsIHdpdGggcHJlc3VtYWJseSBhIG1vcmUgIm9wdGltaXplZCIgY29uZmlndXJhdGlv
biB0aGFuIG11bHRpX3Y3Lgo+Pj4+IFNob3VsZCB3ZSBkbyB0aGUgc2FtZSBoZXJlPwo+Pj4KPj4+
IEVmZmVjdGl2ZWx5IHRoaXMgcmVkdWNlcyB0aGUgb3ZlcmFsbCBrZXJuZWwgc2l6ZS4gTXkgdGhv
dWdodCBvbiB0aGlzCj4+PiB3b3VsZCBiZSB0byBzZXQgdGhlIGdlbmVyYWwgbXVsdGlfdjcga2Vy
bmVsIGRlZmNvbmZpZyBvbiB0aGUgaW5pdGlhbAo+Pj4gc3RtMzJtcDEzIHN1cHBvcnQsIGFuZCBm
aW5lIHR1bmUgYWZ0ZXIuIEJlY2F1c2UgdGhlcmUgaXMgbWFueSBoYXJkd2FyZQo+Pj4gZGlmZmVy
ZW5jZXMgYmV0d2VlbiBzdG0zMm1wMTUgYW5kIHN0bTMybXAxMyBwbGF0Zm9ybXMgKGZvciBleGFt
cGxlIHRoZXJlCj4+PiBpcyBubyBhdWRpbyBqYWNrIGluIG15IGtub3dsZWRnZSksIEkgZmVlbCBs
aWtlIHRoaXMgd291bGQgdGFrZSBxdWl0ZQo+Pj4gc29tZSB0aW1lIGZvciBtZSB0byBzb3J0IGV2
ZXJ5IGRyaXZlcnMuCj4+Pgo+Pj4gV2hhdCBkbyB5b3UgdGhpbmsgYWJvdXQgdGhpcyBwcm9jZXNz
ID8KPj4KPj4gV2h5IG5vdCwgYnV0IHNpbmNlIHdlJ2xsIGhhdmUgYSBzaW5nbGUgY29tbW9uIGtl
cm5lbCBjb25maWcgZm9yIGFsbCwKPj4gdGhpcyBzdG9yeSBvZiAibm90IGhhdmluZyBhdWRpbyBq
YWNrIG9uIFNUTTMyTVAxMyIgaXMgbm90IHZlcnkKPj4gcmVsZXZhbnQuIEkuZSwgd2hhdCBub3Qg
anVzdCB1c2UgdGhlIGV4aXN0aW5nIGtlcm5lbCBjb25maWd1cmF0aW9uIHVzZWQKPj4gZm9yIE1Q
MTUgYWxzbyBmb3IgTVAxMywgYW5kIGp1c3QgYWRkIHdoYXQncyBtaXNzaW5nIGluIHRoaXMgY29t
bW9uCj4+IGNvbmZpZ3VyYXRpb24/IFdlJ3JlIGFsc28gbm90IHRyeWluZyB0byBtYWtlIHRoZSBz
dXBlciBzdXBlciBvcHRpbWl6ZWQKPj4ga2VybmVsIGNvbmZpZ3VyYXRpb24gd2l0aCBvbmx5IHN0
cmljdGx5IHdoYXQncyBuZWVkZWQuIEJ1dCBtdWx0aV92NyBpcwo+PiBtYXNzaXZlbHkgYmxvYXRl
ZC4KPiAKPiBJIGFic29sdXRlbHkgYWdyZWUuIEkgd2lsbCB1c2UgdGhlIG1wMTUgdGhlbiwgYW5k
IGRvIHNvbWUgY2hlY2tpbmcgd2l0aCAKPiBtcDEzLiBJZiBzb21lIGRyaXZlcnMgd2VyZSBtaXNz
ZWQsIHRoZXkgd2lsbCBiZSBhZGRlZCBhcyB3ZSBnbyBhbG9uZy4KPiAKPj4KPj4+PiBQbGVhc2Ug
dXNlIHRoZSAiY3VzdG9tIiB2ZXJzaW9uIG1lY2hhbmlzbSB0byBzcGVjaWZ5IHRoZSBleGFjdCB2
ZXJzaW9uCj4+Pj4gb2YgT1AtVEVFIHRvIGJlIHVzZWQsIGxpa2UgeW91IGRpZCBmb3IgVEYtQSwg
TGludXggYW5kIFUtQm9vdC4KPj4+Cj4+PiBBY2ssIGZvcmdvdCBhYm91dCB0aGF0IG9uZS4gSSBz
YXcgdGhhdCB0aGVyZSB3YXMgbm8gImN1c3RvbSB2ZXJzaW9uIgo+Pj4gb3B0aW9uLCBsaWtlIHRo
ZXJlIGlzIGZvciBVLUJvb3QgYW5kIHRoZSBLZXJuZWwuIEFuZCBncmVwaW5nIHRocm91Z2ggdGhl
Cj4+PiBvdGhlciBkZWZjb25maWcgdGhlcmUgaXMgbm8gaGFyZGNvZGVkIHZlcnNpb25zLiBNYXli
ZSB0aGlzIGNhbiBiZSBhIGlkZWEKPj4+IGZvciB0aGUgZnV0dXJlLiBGb3Igbm93IEkgd2lsbCBz
ZXQgYSBjdXN0b20gdGFyYmFsbCBwb2ludGluZyB0byB0aGUKPj4+IG9mZmljaWFsIDQuMy4wIHRh
cmJhbGwuIFdvdWxkIHRoaXMgYmUgb2theSA/Cj4+Pgo+Pj4gY2YuIGh0dHBzOi8vZ2l0aHViLmNv
bS9PUC1URUUvb3B0ZWVfb3MvYXJjaGl2ZS9yZWZzL3RhZ3MvNC4zLjAudGFyLmd6Cj4+Cj4+IFdl
bGwsIHRoZXJlIGlzIGRlZmluaXRlbHkgYSBjdXN0b20gdmVyc2lvbiBmb3IgT1AtVEVFLCBsaWtl
IHRoZXJlIGlzCj4+IGZvciBMaW51eCBhbmQgVS1Cb290Ogo+Pgo+PiBjaG9pY2UKPj4gwqDCoMKg
wqDCoMKgwqDCoCBwcm9tcHQgIk9QLVRFRSBPUyB2ZXJzaW9uIgo+PiDCoMKgwqDCoMKgwqDCoMKg
IGRlZmF1bHQgQlIyX1RBUkdFVF9PUFRFRV9PU19MQVRFU1QgaWYgCj4+IEJSMl9QQUNLQUdFX0hP
U1RfUlVTVENfQVJDSF9TVVBQT1JUUwo+PiDCoMKgwqDCoMKgwqDCoMKgIGhlbHAKPj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqAgU2VsZWN0IHRoZSB2ZXJzaW9uIG9mIE9QLVRFRSBPUyB5b3Ugd2FudCB0
byB1c2UKPj4KPj4gY29uZmlnIEJSMl9UQVJHRVRfT1BURUVfT1NfTEFURVNUCj4+IMKgwqDCoMKg
wqDCoMKgwqAgYm9vbCAiNC4zLjAiCj4+IMKgwqDCoMKgwqDCoMKgwqAgZGVwZW5kcyBvbiBCUjJf
UEFDS0FHRV9IT1NUX1JVU1RDX0FSQ0hfU1VQUE9SVFMKPj4gwqDCoMKgwqDCoMKgwqDCoCBzZWxl
Y3QgQlIyX1RBUkdFVF9PUFRFRV9PU19ORUVEU19QWVRIT05fQ1JZUFRPR1JBUEhZCj4+IMKgwqDC
oMKgwqDCoMKgwqAgaGVscAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBVc2UgdGhlIGxhdGVzdCBy
ZWxlYXNlIHRhZyBmcm9tIHRoZSBPUC1URUUgT1Mgb2ZmaWNpYWwgR2l0Cj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHJlcG9zaXRvcnkuCj4+Cj4+IGNvbmZpZyBCUjJfVEFSR0VUX09QVEVFX09TX0NV
U1RPTV9UQVJCQUxMCj4+IMKgwqDCoMKgwqDCoMKgwqAgYm9vbCAiQ3VzdG9tIHRhcmJhbGwiCj4+
IMKgwqDCoMKgwqDCoMKgwqAgaGVscAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBUaGlzIG9wdGlv
biBhbGxvd3MgdG8gc3BlY2lmeSBhIFVSTCBwb2ludGluZyB0byBhbiBPUC1URUUgT1MKPj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqAgc291cmNlIHRhcmJhbGwuIFRoaXMgVVJMIGNhbiB1c2UgYW55IHBy
b3RvY29sIHJlY29nbml6ZWQgYnkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgQnVpbGRyb290LCBs
aWtlIGh0dHA6Ly8sIGZ0cDovLywgZmlsZTovLyBvciBzY3A6Ly8uCj4+Cj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgIFdoZW4gcG9pbnRpbmcgdG8gYSBsb2NhbCB0YXJiYWxsIHVzaW5nIGZpbGU6Ly8s
IHlvdSBtYXkgd2FudAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0byB1c2UgYSBtYWtlIHZhcmlh
YmxlIGxpa2UgJChUT1BESVIpIHRvIHJlZmVyZW5jZSB0aGUgcm9vdCBvZgo+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB0aGUgQnVpbGRyb290IHRyZWUuCj4+Cj4+IGNvbmZpZyBCUjJfVEFSR0VUX09Q
VEVFX09TX0NVU1RPTV9HSVQKPj4gwqDCoMKgwqDCoMKgwqDCoCBib29sICJDdXN0b20gR2l0IHJl
cG9zaXRvcnkiCj4+IMKgwqDCoMKgwqDCoMKgwqAgaGVscAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBVc2UgYSBjdXN0b20gdmVyc2lvbiBmZXRjaGVkIGZyb20gYSBHaXQgcmVwb3NpdG9yeS4KPj4K
Pj4gZW5kY2hvaWNlCj4+Cj4+IFNvIGRvIHRoZSBzYW1lIGFzIHdoYXQgeW91IGRvIGZvciBMaW51
eCBhbmQgVS1Cb290IDotKQo+IAo+IFNvcnJ5LCBJIGFtIGNvbmZ1c2VkLiBUaGUgb3B0aW9uIHNl
dCB0byBoYXJkY29kZSB0aGUgdmVyc2lvbnMgZm9yIExpbnV4IAo+IGFuZCBVLUJvb3Qgb24gc3Rt
MzJtcDE1KiBpcyBzb21ldGhpbmcgbGlrZSBCUjJfWFhYX0NVU1RPTV9WRVJTSU9OX1ZBTFVFLgo+
IFRoaXMgZG9lcyBub3QgYXBwZWFyIGZvciBPUC1URUUgaW4gdGhlIGNvZGUgc2hvd24gYWJvdmUs
IHdoaWNoIGxlYXZlIHVzIAo+IHdpdGggZWl0aGVyIHRoZSBjdXN0b20gdGFyYmFsbCBvciBjdXN0
b20gZ2l0IHJlcG9zaXRvcnkgbWV0aG9kcy4KPiAKPiBBbSBJIG1pc3Npbmcgc29tZXRoaW5nID8K
SGkgVGhvbWFzLAoKR2VudGxlIHBpbmcgb24gdGhpcywgc28gSSBjYW4gc2VuZCBhIHYyLgpJIGdl
bnVpbmVseSBkb24ndCB1bmRlcnN0YW5kIHdoYXQgSSBzaG91bGQgZG8gaGVyZS4KClRoYW5rcyBp
biBhZHZhbmNlIGZvciB5b3VyIHBhdGllbmNlIGFuZCBleHBsYW5hdGlvbnMgOi0pCgpSZWdhcmRz
LApSYXBoYcOrbAoKPiAKPiBSZWdhcmRzLAo+IFJhcGhhw6tsCj4gCj4gCj4+Cj4+Pj4gUGxlYXNl
IGRyb3AsIHdlIGRvbid0IGVuYWJsZSBibWFwLXRvb2xzIGluIG91ciBkZWZjb25maWdzLCB3ZSBs
ZWF2ZQo+Pj4+IHRoYXQgY2hvaWNlIHVwIHRvIHRoZSB1c2VyLgo+Pj4KPj4+IEFjay4gTWluZCB0
aGF0IEkgd2lsbCBsZWF2ZSB0aGUgQlIyX1BBQ0tBR0VfSE9TVF9HRU5JTUFHRT15IG9wdGlvbiBz
aW5jZQo+Pj4gaXQgaXMgbWFuZGF0b3J5IGZvciBidWlsZGluZyB0aGUgaW1hZ2UuCj4+Cj4+IEFi
c29sdXRlbHkhCj4+Cj4+IFRoYW5rcyBhIGxvdCEKPj4KPj4gVGhvbWFzCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
