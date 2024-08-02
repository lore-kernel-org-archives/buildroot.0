Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED4A3C3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  2 Aug 2024 17:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0E4880ADF;
	Fri,  2 Aug 2024 17:24:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gRsqO4PCwR3V; Fri,  2 Aug 2024 17:24:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FE0A80B17
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FE0A80B17;
	Fri,  2 Aug 2024 17:24:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 66F201BF387
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 17:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 542B04098D
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 17:24:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cGrcHOesDVln for <buildroot@lists.busybox.net>;
 Fri,  2 Aug 2024 17:24:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com;
 envelope-from=jcmvbkbc@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0E6A6403AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E6A6403AC
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0E6A6403AC
 for <buildroot@buildroot.org>; Fri,  2 Aug 2024 17:24:32 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-2cb63ceff6dso5772612a91.1
 for <buildroot@buildroot.org>; Fri, 02 Aug 2024 10:24:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722619472; x=1723224272;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YN9O7dJqO5jGKOf5KBxii27G9GaKMoY19c477cBT02Q=;
 b=vO6B/d/0F6ZO9PDpo5/s/m5bZ/GRO8mkANRYLheM5iTeC3oH50Fv44Qzz665PRcjUJ
 Uo4Qsd4RLurX4h8dO4rh431jjCD8I1frXEsfwr2en7LyTYovrxZOzD7VPKZtEZM97Bo+
 Vkt7J8QmkonZruUFPH23erLiqhDyIrxwXTP9DHq+bWQGg+j2SSjrn3hj2mAZlX/XUlev
 ap0cFKHGvG2EcS15UGPWBtmXKatuxVwgBD1St5/jpPvray2C4CYD2UmYuDhSAhj2l/7r
 O5itS+e1uU4xQUdFxqHvSPW5dVx6R9xmxf6Lskd0PzzFc1U5foFump3wGswfEhJkt3uv
 j4iQ==
X-Gm-Message-State: AOJu0YzrUE6HyFl9X8mUbF7l71jr8yVDpMIOLB6NNUNqjgYuhF652o3A
 0ecTSFg3ViBseJgxqn5wn1tHl3sU9I6kTYJXZJLjpyD6Dmq7LJkpuc8MJ3yGuCsIUBj5BobMM0+
 f+aB4PpZkbnxhHHSby4nG8338UR7w3w==
X-Google-Smtp-Source: AGHT+IEzR8lUwf63ghmqtMMU8nhpBbNp9nQEWzrd09c8eff4mTMub5zCNZXjX4LwOf8VAvFNQmVUUKuCPrmBbadzZe0=
X-Received: by 2002:a17:90a:b38d:b0:2c8:f3b4:425 with SMTP id
 98e67ed59e1d1-2cff9447153mr5040860a91.23.1722619472087; Fri, 02 Aug 2024
 10:24:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240802170713.2790A83B45@busybox.osuosl.org>
In-Reply-To: <20240802170713.2790A83B45@busybox.osuosl.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri, 2 Aug 2024 10:24:20 -0700
Message-ID: <CAMo8BfK7FSn8imzqjTW8BLS7mPk6HLTKvCM4aBFaJw93z-ZpmQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722619472; x=1723224272; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YN9O7dJqO5jGKOf5KBxii27G9GaKMoY19c477cBT02Q=;
 b=MeW+Yj7p97+8MRXFK+vyDjlu/nSuWwAkN92wV54umCrb7rdusdo+CZosnjq8kWcUmQ
 9JSFMMJOAJi+JjWbOy9JEjdOekBOK9xBxkhrRZEePiSe7QW4RiykH5Q4ZK+sptCFKrx+
 ClPG2g+MrbbrrIlTordijzj6wIYhbC455vDkKomL9rn5zrgLhRlL+ponnVcSyuClE/bn
 9/Er/w7wQFIcua6VMTmZiGHl4J0O3lbGrBXWE8phMe64JJduP+BkAs4FucwgyaVeww38
 xFxhiIpY+6qYjwqrnHZ+Yh0pRCVYaH+Hhq5yNH3y9y5AN4yi0u4JHwx1l3Qww7o8a8bG
 +BnQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=MeW+Yj7p
Subject: Re: [Buildroot] [git commit] package/chicken: move literals into
 text section for xtensa architecture
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

SGVsbG8sCgpPbiBGcmksIEF1ZyAyLCAyMDI0IGF0IDEwOjA34oCvQU0gVGhvbWFzIFBldGF6em9u
aSB2aWEgYnVpbGRyb290CjxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cj4KPiBjb21t
aXQ6IGh0dHBzOi8vZ2l0LmJ1aWxkcm9vdC5uZXQvYnVpbGRyb290L2NvbW1pdC8/aWQ9ODZlNTFm
ZDVmZTI4MTBiYmY4MzNiNDhjNDkxNGRjZDJkZTAxYmRiZQo+IGJyYW5jaDogaHR0cHM6Ly9naXQu
YnVpbGRyb290Lm5ldC9idWlsZHJvb3QvY29tbWl0Lz9pZD1yZWZzL2hlYWRzL21hc3Rlcgo+Cj4g
VGhpcyBzb2x2ZXMgYSBidWlsZCBwcm9ibGVtIC0tIGJ5IGRlZmF1bHQgeHRlbnNhLWdjYyBwdXRz
IGxpdGVyYWxzIGluIGEKPiBkaWZmZXJlbnQgc2VjdGlvbiBvZiBtZW1vcnkgdGhlbiB0aGUgcHJv
Z3JhbSB0ZXh0LCBhbmQgY2hpY2tlbiBpcyBhIHZlcnkKPiBsaXRlcmFsLWhlYXZ5IHByb2dyYW0s
IHNvIHRoZXkgZG9uJ3QgYWxsIGZpdCB0aGVyZS4gVGhpcyBhdm9pZHMgdGhhdCBwcm9ibGVtLgo+
Cj4gRml4ZXM6Cj4KPiAgIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzL2Nl
MzYxNzBkNjdjNDcwMmYzNGJlZTAyNWQ4YTQ2ZTUyNjljNDU3M2UvCj4KPiBTaWduZWQtb2ZmLWJ5
OiBXb29kcm93IERvdWdsYXNzIDx3ZG91Z2xhc3NAY2FybmVnaWVyb2JvdGljcy5jb20+Cj4gU2ln
bmVkLW9mZi1ieTogVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNv
bT4KPiAtLS0KPiAgLi4uLzAwMDEteHRlbnNhLXRleHQtc2VjdGlvbi1saXRlcmFscy5wYXRjaCAg
ICAgICAgfCAzMCArKysrKysrKysrKysrKysrKysrKysrCj4gIHBhY2thZ2UvY2hpY2tlbi9jaGlj
a2VuLm1rICAgICAgICAgICAgICAgICAgICAgICAgIHwgMTQgKysrKysrKystLQo+ICAyIGZpbGVz
IGNoYW5nZWQsIDQyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvcGFja2FnZS9jaGlja2VuLzAwMDEteHRlbnNhLXRleHQtc2VjdGlvbi1saXRlcmFscy5wYXRj
aCBiL3BhY2thZ2UvY2hpY2tlbi8wMDAxLXh0ZW5zYS10ZXh0LXNlY3Rpb24tbGl0ZXJhbHMucGF0
Y2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLmI5M2FhZjllMjEK
PiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9jaGlja2VuLzAwMDEteHRlbnNhLXRleHQt
c2VjdGlvbi1saXRlcmFscy5wYXRjaAo+IEBAIC0wLDAgKzEsMzAgQEAKPiArRnJvbSBlOGQxNzdm
NGQ0ZTFjNmJjNDE3ODdlYTE2MjFlMzIzZmY0YWQ0OTNlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQo+ICtGcm9tOiBXb29kcm93IERvdWdsYXNzIDx3ZG91Z2xhc3NAY2FybmVnaWVyb2JvdGljcy5j
b20+Cj4gK0RhdGU6IE1vbiwgMjIgSnVsIDIwMjQgMDg6NTA6MzcgLTA0MDAKPiArU3ViamVjdDog
W1BBVENIXSBNb3ZlIGxpdGVyYWxzIGludG8gdGV4dCBzZWN0aW9uIGZvciB4dGVuc2EgYXJjaGl0
ZWN0dXJlCj4gKwo+ICtVcHN0cmVhbTogaHR0cHM6Ly9idWdzLmNhbGwtY2Mub3JnL3RpY2tldC8x
ODQwCj4gK1NpZ25lZC1vZmYtYnk6IFdvb2Ryb3cgRG91Z2xhc3MgPHdkb3VnbGFzc0BjYXJuZWdp
ZXJvYm90aWNzLmNvbT4KPiArLS0tCj4gKyBNYWtlZmlsZS5saW51eCB8IDUgKysrKysKPiArIDEg
ZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPiArCj4gK2RpZmYgLS1naXQgYS9NYWtlZmls
ZS5saW51eCBiL01ha2VmaWxlLmxpbnV4Cj4gK2luZGV4IGI2MjhjZGE0Li5lOTdjMmI5NCAxMDA2
NDQKPiArLS0tIGEvTWFrZWZpbGUubGludXgKPiArKysrIGIvTWFrZWZpbGUubGludXgKPiArQEAg
LTUyLDYgKzUyLDExIEBAIFVTRVNfU09OQU1FID0geWVzCj4gKwo+ICsgIyBhcmNoaXRlY3R1cmVz
Cj4gKwo+ICsraWZlcSAoJChBUkNIKSx4dGVuc2EpCj4gKytDX0NPTVBJTEVSX09QVElPTlMgKz0g
LW10ZXh0LXNlY3Rpb24tbGl0ZXJhbHMKPiArK0xJTktFUl9PUFRJT05TICs9IC1tdGV4dC1zZWN0
aW9uLWxpdGVyYWxzCgpUaGVyZSdzIGEgc3Ryb25nZXIgdmVyc2lvbiBvZiB0aGlzIG9wdGlvbiwg
LW1hdXRvLWxpdHBvb2xzLCBpbiB0aGUgeHRlbnNhClRBUkdFVF9BQkkgYW5kIGl0IGlzIHBhc3Nl
ZCB0byB0aGUgVEFSR0VUX0NGTEFHUy4gV2h5IGRvZXMKdGhpcyBwYWNrYWdlIG5lZWQgc3BlY2lh
bCB0cmVhdG1lbnQ/Cgo+ICsrZW5kaWYKPiArKwo+ICsgaWZlcSAoJChBUkNIKSx4MzIpCj4gKyBD
X0NPTVBJTEVSX09QVElPTlMgKz0gLW14MzIKPiArIExJTktFUl9PUFRJT05TICs9IC1teDMyCj4g
Ky0tCj4gKzIuMzkuMgo+ICsKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9jaGlja2VuL2NoaWNrZW4u
bWsgYi9wYWNrYWdlL2NoaWNrZW4vY2hpY2tlbi5tawo+IGluZGV4IDI2NjdmNzgyM2QuLjA1MjAy
ODAxMzQgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9jaGlja2VuL2NoaWNrZW4ubWsKPiArKysgYi9w
YWNrYWdlL2NoaWNrZW4vY2hpY2tlbi5tawo+IEBAIC0xMSw5ICsxMSwxOSBAQCBDSElDS0VOX0xJ
Q0VOU0VfRklMRVMgPSBMSUNFTlNFCj4gIENISUNLRU5fQ1BFX0lEX1ZFTkRPUiA9IGNhbGwtY2MK
PiAgQ0hJQ0tFTl9JTlNUQUxMX1NUQUdJTkcgPSBZRVMKPgo+IC0jIElmIEFSQ0ggaXMgbm90IHNl
dCwgaXQgYXR0ZW1wdHMgdG8gYXV0b2Rpc2NvdmVyLiBCdXQgaXQgaXMgYW55d2F5IG5vdCB1c2Vk
Lgo+ICsjIENoaWNrZW4gb25seSB1c2VzIHRoZSAiYXJjaCIgdmFyaWFibGUgZm9yIHNvbWUgc3Bl
Y2lhbC1jYXNlIGNvbXBpbGUKPiArIyBhcmd1bWVudHMgSWYgaXQncyBlbXB0eSwgaXQgdHJpZXMg
dG8gZGV0ZWN0IHRoZSBhcmNoIGhvc3QgRmlsdGVyIG91dAo+ICsjIHZhbHVlcyB0aGF0IGhhdmUg
YW4gZWZmZWN0LCBvciBwYXNzICJ1bnVzZWQiIGhlcmUKPiAraWZlcSAoJChOT1JNQUxJWkVEX0FS
Q0gpLHg4Nl82NCkKPiArQ0hJQ0tFTl9BUkNIID0geDg2LTY0Cj4gK2Vsc2UgaWZlcSAoJChOT1JN
QUxJWkVEX0FSQ0gpLHh0ZW5zYSkKPiArQ0hJQ0tFTl9BUkNIID0geHRlbnNhCj4gK2Vsc2UKPiAr
Q0hJQ0tFTl9BUkNIID0gdW51c2VkCj4gK2VuZGlmCj4gKwo+ICBDSElDS0VOX01BS0VfT1BUUyA9
IFwKPiAtICAgICAgIEFSQ0g9dW51c2VkIFwKPiArICAgICAgIEFSQ0g9IiQoQ0hJQ0tFTl9BUkNI
KSIgXAo+ICAgICAgICAgQ19DT01QSUxFUj0iJChUQVJHRVRfQ0MpIiBcCj4gICAgICAgICBDWFhf
Q09NUElMRVI9IiQoVEFSR0VUX0NYWCkiIFwKPiAgICAgICAgIFBSRUZJWD0vdXNyIFwKCi0tIApU
aGFua3MuCi0tIE1heApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
