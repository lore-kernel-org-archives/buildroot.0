Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A00E6C5516F
	for <buildroot@archiver.kernel.org>; Sat,  1 Aug 2026 08:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 145E44083C;
	Sat,  1 Aug 2026 08:39:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s2BWw2qClTD1; Sat,  1 Aug 2026 08:39:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB19840844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785573590;
	bh=HE8OKCWz9PHN3rd3gMQL88efsUP5mXGYXo8JrIub5kU=;
	h=Date:To:Cc:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VxtWW98pvJs8yXY8774X4GY6MBCqCMycuPYWk0zAAy4/uGj7F0uVIKtPz3KG4uIvL
	 x9SAaY9nmoHY+sRGwpTuM8l7KPr93aZtGurU619U+DZXtcosJH1NJdoVi6vhTgraBb
	 jDNOLy+pBOJeKtZueFUquIZwE5YrSOaliR7Pqx8yP3Maw4ZMnNjwwihdrj+cPUEWYb
	 aKyB++QfKRTPHuE3nC6f5XE8bdSkVHYrgDX7AKP3Vliv3B0yNt55b1vbBU05/9EjuK
	 YgeRwew+gtvpw/VF3Z1ap9oqywQ/yaHFaicYWrMKUqindHr8dBBmIBMizEoFHGIKtJ
	 T7+qNOeZfAKSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB19840844;
	Sat,  1 Aug 2026 08:39:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 48256FE3
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 08:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 39FAE80DBD
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 08:39:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cyuvoy1Lpteq for <buildroot@buildroot.org>;
 Sat,  1 Aug 2026 08:39:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172;
 helo=foss.arm.com; envelope-from=laszlo.ersek@arm.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DF19980D83
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF19980D83
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF19980D83
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 08:39:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68DE6204C;
 Sat,  1 Aug 2026 01:39:41 -0700 (PDT)
Received: from [10.57.45.8] (unknown [10.57.45.8])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D45963F66F;
 Sat,  1 Aug 2026 01:39:44 -0700 (PDT)
Message-ID: <9cf644e0-d48c-4ca8-a605-ad6403044508@arm.com>
Date: Sat, 1 Aug 2026 10:39:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@rnout.be>
Cc: Oleg Lyovin <ovlevin@sberdevices.ru>, buildroot@buildroot.org
References: <20260730180627.1224385-1-laszlo.ersek@arm.com>
 <638ca326-29a3-499b-b8b0-57c9fc24ca1e@rnout.be>
 <2982b63d-ab0b-4649-9eff-7940bd053ef3@arm.com>
 <4c5ee80b-0abb-4482-9c9a-3036312b84dd@rnout.be>
Content-Language: en-US
From: Laszlo Ersek <laszlo.ersek@arm.com>
In-Reply-To: <4c5ee80b-0abb-4482-9c9a-3036312b84dd@rnout.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=arm.com; s=foss; 
 t=1785573585; bh=28leCtdpZFGzEyL6m72jbTOkDvarxVHHIjPtU/vnOuQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gpKIOTjxhLrtaxLoI4Wf7vn/q7Fi7tSMFM2H+kFDUxRQUk+Ggt+xPCy0dw1nFP40+
 rVxLaRC31N22i7d26LAEx93d1y3b8udmkJSVEvo+CxrwfBj4lwC8yWMJPNfrGq5Bzm
 FmUNjGEZ0qe+2Yzvt8bXeCnMgSd/I60TQIPUQN3w=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arm.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256
 header.s=foss header.b=gpKIOTjx
Subject: Re: [Buildroot] [PATCH] linux/linux.mk: forcibly (re)enable Make
 jobserver
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gNy8zMS8yNiAxMjowMiwgQXJub3V0IFZhbmRlY2FwcGVsbGUgd3JvdGU6Cj4gCj4gCj4gT24g
MzAvMDcvMjAyNiAyMjoxOCwgTGFzemxvIEVyc2VrIHdyb3RlOgo+PiBPbiA3LzMwLzI2IDIwOjE0
LCBBcm5vdXQgVmFuZGVjYXBwZWxsZSB3cm90ZToKPj4+Cj4+Pgo+Pj4gT24gMzAvMDcvMjAyNiAy
MDowNiwgTGFzemxvIEVyc2VrIHdyb3RlOgo+Pj4+IENvbW1pdCAwYjllZmM5OTFmOGEgKMKrbGlu
dXg6IHVzZSBCUjJfTUFLRcK7LCAyMDIzLTA0LTEwKSByZXBsYWNlZAo+Pj4+ICQoTUFLRSkgd2l0
aCAkKEJSMl9NQUtFKSBpbiBhIG51bWJlciBvZiByZWNpcGVzLiBBcyBhIGNvbnNlcXVlbmNlLAo+
Pj4+IHRoZSBjaGlsZCBtYWtlIGlzIHVuYWJsZSB0byBkaXNjb3ZlciB0aGUgam9iIHNlcnZlciwg
YW5kIHdlIGdldCBhCj4+Pj4gd2FybmluZyBzdWNoIGFzCj4+Pj4KPj4+Pj4gd2FybmluZzogam9i
c2VydmVyIHVuYXZhaWxhYmxlOiB1c2luZyAtajEuIEFkZCBgKycgdG8gcGFyZW50IG1ha2UgCj4+
Pj4+IHJ1bGUuCj4+Pj4KPj4+PiBodHRwczovL3d3dy5nbnUub3JnL3NvZnR3YXJlL21ha2UvbWFu
dWFsL2h0bWxfbm9kZS9FcnJvci1NZXNzYWdlcy5odG1sCj4+Pj4gaHR0cHM6Ly93d3cuZ251Lm9y
Zy9zb2Z0d2FyZS9tYWtlL21hbnVhbC9odG1sX25vZGUvTUFLRS1WYXJpYWJsZS5odG1sCj4+Pj4K
Pj4+PiBJbmZvcm0gdGhlIHBhcmVudCBNYWtlLCBieSBwcmVmaXhpbmcgdGhlIHJlY2lwZSB3aXRo
ICIrIiwgdGhhdAo+Pj4+ICQoQlIyX01BS0UpIGNhbiBkZWFsIHdpdGggdGhlIGpvYiBzZXJ2ZXIu
Cj4+Pj4KPj4+PiBDYzogQXJub3V0IFZhbmRlY2FwcGVsbGUgPGFybm91dEBtaW5kLmJlPgo+Pj4+
IENjOiBPbGVnIEx5b3ZpbiA8b3ZsZXZpbkBzYmVyZGV2aWNlcy5ydT4KPj4+PiBDYzogYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKPj4+PiBTaWduZWQtb2ZmLWJ5OiBMYXN6bG8gRXJzZWsgPGxhc3ps
by5lcnNla0Bhcm0uY29tPgo+Pj4+IC0tLQo+Pj4+Cj4+Pj4gTm90ZXM6Cj4+Pj4gwqDCoMKgwqAg
Q29tbWl0IDBiOWVmYzk5MWY4YSByZXBsYWNlcyBtdWx0aXBsZSBpbnN0YW5jZXMgb2YgJChNQUtF
KSB3aXRoCj4+Pj4gwqDCoMKgwqAgJChCUjJfTUFLRSk7IEknbSBvbmx5IHByZWZpeGluZyB0aGUg
b25lIHJlY2lwZSB3aXRoICIrIiB0aGF0Cj4+Pj4gwqDCoMKgwqAgc2VlbXMgdG8gY2F1c2UgdGhl
IG1vc3Qgbm90aWNlYWJsZSBzbG93ZG93biBmb3IgbWUgKGJ5IG1pc3NpbmcKPj4+PiDCoMKgwqDC
oCBvdXQgb24gYSBwYXJhbGxlbCBrZXJuZWwgYnVpbGQpLgo+Pj4KPj4+IMKgIEFyZSB5b3UgcmVh
bGx5IHN1cmUgdGhpcyBzcGVlZHMgdGhpbmdzIHVwPwo+Pgo+PiBZZXMuCj4gCj4gIMKgQWgsIEkg
anVzdCBzYXcgbm93IHRoYXQgX0JVSUxEX0NNRFMgYWxyZWFkeSBoYXMgYSArIGluIHBrZy1nZW5l
cmljLm1rLgoKQWggaW5kZWVkLCBmcm9tIGNvbW1pdCAwNjliMzNhMzBlNmQgKMKrcGFja2FnZTog
ZW5hYmxlIGpvYnNlcnZlciBmb3IgCnJlY3Vyc2l2ZSBtYWtlwrssIDIwMTQtMDItMTQpLiA6KQoK
KC4uLiBJIGNvdWxkbid0IHJlYWxseSBmaWd1cmUgb3V0IHRoZSBtYWNybyB0cmlja2VyeSB3aXRo
ICpfQlVJTERfQ01EUyAKLS0gSSB0aGluayBJIGRpZCBncmVwIGZvciBqdXN0IF9CVUlMRF9DTURT
LCBidXQgbXVzdCBoYXZlIHN1cmVseSBtaXNzZWQgCnRoaXMgaW5zdGFuY2UuKQoKPj4+IFRoZSBj
b3JlIG9mIHRoZSB3b3JrIHNob3VsZCBiZSBpbiB0aGUgYG1ha2UgYWxsYCBpbnZvY2F0aW9uIG9u
IGxpbmUKPj4+IDU0Ni4gQWxsIHRoZSBvdGhlciBpbnZvY2F0aW9ucyBzaG91bGQgYmUgcHJldHR5
IG11Y2ggc2VyaWFsLiBJbgo+Pj4gcGFydGljdWxhciB0aGUgcmVidWlsZC13aXRoLWluaXRyYW1m
cyBzaG91bGQgZG8gbm90aGluZyBtb3JlIHRoYW4KPj4+IHJlLWxpbmtpbmcgYW5kIHJlLWNvbXBy
ZXNzaW5nIHRoZSBrZXJuZWwgYmVjYXVzZSB0aGUgZXhhY3Qgc2FtZQo+Pj4gY29tbWFuZCB3YXMg
YWxyZWFkeSBkb25lIGluIHRoZSBidWlsZCBzdGVwLgo+Pgo+PiBJbiBteSBjYXNlLAo+Pgo+PiAt
IGJvdGggIkxJTlVYX0JVSUxEX0NNRFMiIC0tIHRoZSAiYWxsIiB0YXJnZXQgLS0sCj4+Cj4+IC0g
YW5kICJsaW51eC1yZWJ1aWxkLXdpdGgtaW5pdHJhbWZzIiAtLSB0aGUgJChMSU5VWF9UQVJHRVRf
TkFNRSksIGFrYQo+PiDCoMKgICJJbWFnZSIgdGFyZ2V0IC0tCj4+Cj4+IHNlZW0gdG8gcGVyZm9y
bSBhIHNpbWlsYXJseSBsYXJnZSBbMV0ga2VybmVsIGJ1aWxkLiBUaGUgZmlyc3Qgb25lIGJ1aWxk
cwo+PiBvYmplY3QgZmlsZXMgY29uY3VycmVudGx5IGFscmVhZHksIHRoZSBzZWNvbmQgb25lICh3
aXRob3V0IHRoaXMgcGF0Y2gpCj4+IGRvZXNuJ3QuCj4+Cj4+IFsxXSBUaGUgIkltYWdlIiBidWls
ZCAoZnJvbSAibGludXgtcmVidWlsZC13aXRoLWluaXRyYW1mcyIpIHNlZW1zIG5vdCB0bwo+PiBl
eGVjdXRlIHRoZSBmb2xsb3dpbmcgdHlwZXMgb2YgcmVjaXBlcyBmcm9tIHRoZSAiYWxsIiB0YXJn
ZXQgKGZyb20KPj4gIkxJTlVYX0JVSUxEX0NNRFMiKToKPj4KPj4gLSBDQyBbTV0KPj4gLSBMRCBb
TV0KPj4gLSBDSEtTSEExIG9uIHZhcmlvdXMgaGVhZGVycwo+PiAtIENPUFkgb24gdmFyaW91cyBo
ZWFkZXJzCj4+IC0gRFRDIG9uIHZhcmlvdXMgZGV2aWNlIHRyZWUgZmlsZXMKPj4gLSBHWklQIG9u
IEltYWdlLmd6Cj4+IC0gVVBEIGFuZCBXUkFQIG9uIHZhcmlvdXMgZ2VuZXJhdGVkIGhlYWRlciBm
aWxlcwo+Pgo+PiBJIHRoaW5rIHRoZXNlIGRpZmZlcmVuY2VzIGFyZSBleHBlY3RlZC4gSG93ZXZl
ciwgd2hpbGUKPj4gImxpbnV4LXJlYnVpbGQtd2l0aC1pbml0cmFtZnMiIHBlcmZvcm1zIGZld2Vy
IGJ1aWxkIHN0ZXBzLCBhY2NvcmRpbmcgdG8KPj4gdGhlIGFib3ZlLCBpdCBkb2VzIGJ1aWxkIGFs
bCB0aGUgYnVpbHQtaW4gb2JqZWN0IGZpbGVzIGFuZXcsIGFuZCB0aGF0Cj4gCj4gIMKgVGhhdCdz
IHdlaXJkIHRob3VnaC4gV2VsbCwgaXQncyBub3Qgd2VpcmQgdGhhdCBpdCBkb2Vzbid0IHJlLWRv
IHRoZSAKPiBtb2R1bGVzIGJlY2F1c2UgdGhlIExJTlVYX1RBUkdFVF9OQU1FIGdvYWwgZG9lc24n
dCBidWlsZCB0aGUgbW9kdWxlcy4gCj4gQnV0IGl0J3Mgd2VpcmQgdGhhdCBpdCByZWJ1aWxkcyB0
aGUgYnVpbHRpbiBvYmplY3QgZmlsZXMsIG5vdGhpbmcgc2hvdWxkIAo+IGhhdmUgY2hhbmdlZCBj
b21wYXJlZCB0byB0aGUgZWFybGllciBydW4gZXhjZXB0IGZvciB0aGUgc2luZ2xlIG9iamVjdCAK
PiBmaWxlIHRoYXQgY29udGFpbnMgdGhlIGluaXRyYW1mcyBjcGlvIGltYWdlLgo+IAo+ICDCoEl0
IHdvdWxkIGJlIG5pY2UgdG8gZml4IHRoYXQsIGJ1dCByZWdhcmRsZXNzLCBpdCdzIG5vdCBhIGJh
ZCBpZGVhIHRvIAo+IGFkZCB0aGUgKyB0byB0aGUgcmVidWlsZC13aXRoLWluaXRyYW1mcyBnb2Fs
IHNvIEknbGwgYXBwbHkgdGhpcyBwYXRjaC4KClRoYW5rIHlvdSEKTGFzemxvCgo+IAo+ICDCoFJl
Z2FyZHMsCj4gIMKgQXJub3V0Cj4gCj4gCj4+IGhhcHBlbnMgd2F5IG1vcmUgc2xvd2x5IHRoYW4g
aW4gIkxJTlVYX0JVSUxEX0NNRFMiLCBiZWNhdXNlCj4+ICJsaW51eC1yZWJ1aWxkLXdpdGgtaW5p
dHJhbWZzIiBkb2Vzbid0IGRvIGl0IGNvbmN1cnJlbnRseS4KPj4KPj4gKEZXSVcsIEknbSBiYXNl
ZCBvZmYgb2YgcmVsZWFzZSAyMDI1LjA1LikKPj4KPj4gTGFzemxvCj4gCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
