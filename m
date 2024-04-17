Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D03BDC4345F
	for <buildroot@archiver.kernel.org>; Wed, 17 Apr 2024 19:06:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28AE5401C7;
	Wed, 17 Apr 2024 19:06:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q0j4l624RWxD; Wed, 17 Apr 2024 19:06:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A034D4066A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A034D4066A;
	Wed, 17 Apr 2024 19:06:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 071AD1BF2FE
 for <buildroot@lists.busybox.net>; Wed, 17 Apr 2024 19:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E701A606E5
 for <buildroot@lists.busybox.net>; Wed, 17 Apr 2024 19:06:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AG4d1Xe5BG-s for <buildroot@lists.busybox.net>;
 Wed, 17 Apr 2024 19:06:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=michael@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 81A5A606D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81A5A606D6
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 81A5A606D6
 for <buildroot@buildroot.org>; Wed, 17 Apr 2024 19:06:19 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-516cdb21b34so12644e87.1
 for <buildroot@buildroot.org>; Wed, 17 Apr 2024 12:06:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713380777; x=1713985577;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=COhgZjpXeOLRYMGqQ42LEDv8W4vGfBUft5fFt+gG/1E=;
 b=uZW8OfXJ8PHJCC8kKro0fWqAj9mRFDwdm62wAydXtujslC6VLZn/j7NX5hEXAVjqOI
 guuo2aodzmSQBkp5dzAuBAclbxbd2Yudpu396TrD0u3fpKPhSfzu5ypVymARBJcwgETs
 z8J3jbf6CK5I+ncWkpKYoWvwyldDluSpNewH8dLj354ulqTtnCZPKMcwjOgWMHcXverO
 dkFisWnJyHjYH4iclpNngewK1GoThGqJjydWOXn0ZVCEKbHyMa7bu69jK88xQ2s8YEGz
 SARA2BYGKdgHrdlaTc+X0f/rVJNgjbglyQtAWuGJ6+4jqlIOU5gk/T5vTcsFNzgYeueG
 UhPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+SOzlXHsvopVddCLJamHzasjCT9rS/8FDyY8BTuLSUWFFfVGQZTdK2c43FMrasLWe0r+6PU5WgB/VSCU1zWSnKAPDY9D1eQ==
X-Gm-Message-State: AOJu0YyDmU9HeCyvkAqvpTDnh4nwhcu8lvmou1NZCdpRRVeJQz2b3em1
 g4YKzy9YuTmYe60zZJd2eXmeTDnml0IAkAZib3kz/EuhFAK+Dy4BESyXAWUcVT9DFZqAqsCeG2l
 bPQn4xptwUL6tZOXmrwjHJMUWD0V+hHFQZDX741JWh0XOX2lLlMs=
X-Google-Smtp-Source: AGHT+IHWgNPAIjFJEViE5fovSlt8RLQXUz0KoQ/ffGr6Iao56S2A3fsVlWqcqvbpaJP7nniEzAQv6yfbOnujlAy2xSA=
X-Received: by 2002:a19:f012:0:b0:517:166d:2b93 with SMTP id
 p18-20020a19f012000000b00517166d2b93mr114313lfc.32.1713380776993; Wed, 17 Apr
 2024 12:06:16 -0700 (PDT)
MIME-Version: 1.0
References: <e2634bc6-2e68-4331-8354-49407b40f191.ref@yahoo.com>
 <e2634bc6-2e68-4331-8354-49407b40f191@yahoo.com>
 <6068206a-9a0c-4ef4-a5bb-9e6f35218297@benettiengineering.com>
 <d144cbba-9be6-477f-9a79-e72361487734@yahoo.com>
 <CAOf5uwmQBtHf9w7vjxyxDjFuaQj=uv4a0OpLHJ1MNg5V3PjNwQ@mail.gmail.com>
 <37ec60b9-d7db-440c-a8d4-2993ae9c6a16@yahoo.com>
 <CAOf5uwmOi0V7t7GmwNvrwy8qoKyVnaGJziwZhqPd2jCAZMK5EQ@mail.gmail.com>
 <CAOf5uwkmcuBvXSp0oHuCXQX+HqNP6O52QEvxTWm0hEnF=W2eNw@mail.gmail.com>
 <71a73a03-5b7c-425c-959c-8eb516ca565e@yahoo.com>
In-Reply-To: <71a73a03-5b7c-425c-959c-8eb516ca565e@yahoo.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Wed, 17 Apr 2024 21:06:05 +0200
Message-ID: <CAOf5uw=yTRm+A0SvtgtOcHu=BgYK2MtLX=WOxbUz0OM11JUwcA@mail.gmail.com>
To: DTrustee <dterry_engineer@yahoo.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1713380777; x=1713985577;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=COhgZjpXeOLRYMGqQ42LEDv8W4vGfBUft5fFt+gG/1E=;
 b=pruVZQwmnI/Q3ZRC//PlTDTyf1F1woWT1pmud1OMIiAJBWF7Gl4jQJOAlsPrvkfP6K
 2W5QjH8jySDG3GXz7RHs8UywUDoAf6a+ebmBcjiZOTXZhUm3icAHZf2EP1ZamsGjAZZ+
 lslMCx5Qa9osVRupajU98iM14L2Ez4rn2TDjU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=pruVZQwm
Subject: Re: [Buildroot] Problem with device tree
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
Cc: Andrea Calabrese <andrea.calabrese@amarulasolutions.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkKCk9uIFdlZCwgQXByIDE3LCAyMDI0IGF0IDg6NTnigK9QTSBEVHJ1c3RlZSA8ZHRlcnJ5X2Vu
Z2luZWVyQHlhaG9vLmNvbT4gd3JvdGU6Cj4KPiBJIHdhcyBmb2xsb3dpbmcgdGhlIHN0ZXBzIGlu
Cj4gaHR0cHM6Ly9ib290bGluLmNvbS9kb2MvdHJhaW5pbmcvYnVpbGRyb290L2J1aWxkcm9vdC1s
YWJzLnBkZiAsIHRoZXkKPiBjaGFuZ2VkIHRoZSBkZWZhdWx0IGNvbmZpZyB0byBzaG93IGhvdyBp
dCBpcyBkb25lIHJhdGhlciB0aGFuIHVzaW5nCj4gYmVhZ2xlYm9uZV9kZWZjb25maWcuIFNvIEkg
Y2hhbmdlZCBUYXJnZXQgT3B0aW9ucywgVG9vbGNoYWluLCBLZXJuZWwgYW5kCj4gQm9vdGxvYWRl
ciBtZW51cyBhcyB0aGUgdHV0b3JpYWwgc3VnZ2VzdGVkIGluIHNlY3Rpb24gQ29uZmlndXJpbmcK
PiBCdWlsZHJvb3QuIERpZCBub3QgYWRkIGFueSBsb2NhbCAubWsgLSBkbyBub3Qga25vdyB3aGF0
IHRoYXQgaXMsIHRoaXMgaXMKPiBteSBmaXJzdCBidWlsZCB3aXRoIGJ1aWxkcm9vdC4gTm9yIGRp
ZCBJIG92ZXJyaWRlIGFueXRoaW5nLgo+CgpTbyBJIHRoaW5rIHRoYXQgZmlyc3Qgb2YgYWxsIHlv
dSBzaG91bGQgc3RhcnQgdG8gYnVpbGQgYXMgaXQgaXMuIFRoZW4KeW91IGhhdmUgZGVmaW5pdGVs
eSBhIHByb2JsZW0Kb24geW91ciBjb25maWd1cmF0aW9uIGFuZCBpdCBicmVha3MgdWJvb3QgcHJv
YmFibHkuIEkgdGhpbmsgdGhhdCB0aGUKZG9jdW1lbnRhdGlvbiBpcyB3ZWxsIGRvbmUgYnV0Cm1h
eWJlIHlvdSBnZXQgYSB3cm9uZyBzdGVwIG9uIHRoaXMuIFRob21hcyBpcyB2ZXJ5IGJ1c3kgZm9y
IHRoZQpjb25mZXJlbmNlLCBJIGhhdmUgYWRkZWQgaGltIGluIENDCmJ1dCBJIHRoaW5rIHRoYXQg
dGhpcyBpcyBub3QgdGhlIHJpZ2h0IG1haWxpbmcgbGlzdCBmb3IgZGlzY3VzcyBhYm91dAp0aGUg
dHJhaW5pbmcuIEFueXdheSBJJ20gd2lsbGluZyB0byBoZWxwIHlvdQpzbyB0cnkgdG8gYnVpbGQg
dGhlIGRlZmNvbmZpZyBvZiBidWlsZHJvb3QgYW5kIHRyeSB0byBhcHBseSB0aGUgc3RlcHMKaW4g
dGhlIHRyYWluaW5nIGFzIHRoZXkgYXJlIHdlbGwgZGVzY3JpYmVkCgpNaWNoYWVsCgo+IEhhdmUg
YSBCbGVzc2VkIGRheSEKPgo+IERvbgo+Cj4KPiBPbiA0LzE3LzI0IDE6NDAgUE0sIE1pY2hhZWwg
TmF6emFyZW5vIFRyaW1hcmNoaSB3cm90ZToKPiA+IEhpdGhlCj4gPgo+ID4gT24gV2VkLCBBcHIg
MTcsIDIwMjQgYXQgODozOeKAr1BNIE1pY2hhZWwgTmF6emFyZW5vIFRyaW1hcmNoaQo+ID4gPG1p
Y2hhZWxAYW1hcnVsYXNvbHV0aW9ucy5jb20+IHdyb3RlOgo+ID4+IEhpCj4gPj4KPiA+PiBPbiBX
ZWQsIEFwciAxNywgMjAyNCBhdCA4OjI24oCvUE0gRFRydXN0ZWUgPGR0ZXJyeV9lbmdpbmVlckB5
YWhvby5jb20+IHdyb3RlOgo+ID4+PiBJIGFtIGJ1aWxkaW5nIGZvciB0aGUgQmVhZ2xlYm9uZSBC
bGFjayB3aGljaCBpcyBjb252ZW5pZW50IGFzIHRoZQo+ID4+PiBCb290bGluIHRyYWluaW5nIHVz
ZXMgdGhlIHdpcmVsZXNzIHZlcnNpb24gb2YgdGhhdCBib2FyZC4gSSBob3BlIEkgYW0KPiA+Pj4g
ZG9pbmcgdGhlIHJpZ2h0IHRoaW5nIGJ5IGluY2x1ZGluZyBldmVyeW9uZSBvbiB0aGUgYWRkcmVz
cyBsaXN0IG9mIHRoaXMKPiA+Pj4gdGhyZWFkLCBkb24ndCB3YW50IHRvIGZpbGwgdXAgcGVvcGxl
J3MgaW5ib3ggbmVlZGxlc3NseS4KPiA+Pj4KPiA+PiBQbGVhc2UgcHJvdmlkZSB0aGUgc3RlcHMg
aGVyZQo+ID4gbWFrZSBiZWFnbGVib25lX2RlZmNvbmZpZwo+ID4KPiA+IG1ha2UKPiA+Cj4gPiBS
aWdodD8KPiA+PiBNaWNoYWVsCj4gPj4KPiA+Pj4gSGF2ZSBhIEJsZXNzZWQgZGF5IQo+ID4+Pgo+
ID4+PiBEb24KPiA+Pj4KPiA+Pj4gT24gNC8xNy8yNCAxMToyOSBBTSwgTWljaGFlbCBOYXp6YXJl
bm8gVHJpbWFyY2hpIHdyb3RlOgo+ID4+Pj4gSGkKPiA+Pj4+Cj4gPj4+PiBPbiBXZWQsIEFwciAx
NywgMjAyNCBhdCA2OjI14oCvUE0gRFRydXN0ZWUgdmlhIGJ1aWxkcm9vdAo+ID4+Pj4gPGJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnPiB3cm90ZToKPiA+Pj4+PiBJIGtub3cgeW91IGFyZSBhbGwgYnVz
eSwgZG9uJ3QgbWVhbiB0byBidWcgYW55b25lIGJ1dCBJIGNhbm5vdCBnZXQKPiA+Pj4+PiBidWls
ZHJvb3QgdG8gbWFrZSB3aXRob3V0IGVycm9ycy4gSSBoYXZlIG5vIGlkZWEgd2h5ICJvcGVyYXRv
ciAnPCcgaGFzCj4gPj4+Pj4gbm8gbGVmdCBvcGVyYW5kIiBpcyBnZW5lcmF0ZWQgb3Igd2hpY2gg
aW5jbHVkZSBmaWxlIGlzIHRoZSBjYXVzZS4gSQo+ID4+Pj4+IHRydWx5IGFwcHJlY2lhdGUgeW91
ciBoZWxwLiBJcyB0aGVyZSBkb2N1bWVudGF0aW9uIHRoYXQgd2Fsa3MgdGhyb3VnaAo+ID4+Pj4+
IHRoZSBidWlsZCBwcm9jZXNzPyBJIGhhdmUgbG9va2VkIGF0IHRoZSBCb290bGluIHRyYWluaW5n
IGJ1dCBpdCBpcwo+ID4+Pj4+IHNldmVyYWwgeWVhcnMgb2xkIG5vdyBhbmQgb3V0IG9mIGRhdGUu
Cj4gPj4+PiBZb3UgYXJlIHRyeWluZyB0byBidWlsZCBhIHVib290IGJvYXJkIHRoYXQgaGFzIG5v
dCBpbmNsdWRlIG9mIHRoZQo+ID4+Pj4gS2NvbmZpZyBvZiBpdC4gIEkgdGhpbmsgdGhhdCB5b3UK
PiA+Pj4+IGhhdmUganVzdCBhIGJyb2tlbiB1Ym9vdC4gV2hhdCBjb25maWd1cmF0aW9uIG9yIGJv
YXJkIGFyZSB5b3UgYnVpbGRpbmc/Cj4gPj4+Pgo+ID4+Pj4gTWljaGFlbAo+ID4+Pj4KPiA+Pj4+
Cj4gPj4+Pj4gQnVpbGRsb2cgaXMKPiA+Pj4+Pgo+ID4+Pj4+IGh0dHBzOi8vcGFzdGViaW4uY29t
L0VxdDZ6aTlhCj4gPj4+Pj4KPiA+Pj4+PiBjb25maWcgaXMKPiA+Pj4+Pgo+ID4+Pj4+IGh0dHBz
Oi8vcGFzdGViaW4uY29tLzhQMmhCOXVZCj4gPj4+Pj4KPiA+Pj4+PiBidWlsZHJvb3QgMjAyNC4w
Mi4xCj4gPj4+Pj4KPiA+Pj4+PiBIYXZlIGEgQmxlc3NlZCBkYXkhCj4gPj4+Pj4KPiA+Pj4+PiBE
b24KPiA+Pj4+Pgo+ID4+Pj4+Cj4gPj4+Pj4KPiA+Pj4+PiBPbiA0LzkvMjQgNDo1OSBQTSwgR2l1
bGlvIEJlbmV0dGkgd3JvdGU6Cj4gPj4+Pj4+IEhpIERvbiwKPiA+Pj4+Pj4KPiA+Pj4+Pj4gT24g
MDkvMDQvMjQgMjM6MjMsIERvbiB2aWEgYnVpbGRyb290IHdyb3RlOgo+ID4+Pj4+Pj4gVGhpcyBp
cyBteSBmaXJzdCB0aW1lIHVzaW5nIGJ1aWxkcm9vdC4gRm9sbG93aW5nIHRoZSBpbnN0cnVjdGlv
bnMgb2YKPiA+Pj4+Pj4+IGJvb3RsaW4uY29tL2RvYy90cmFpbmluZy9idWlsZHJvb3QvYnVpbGRy
b290LWxhYnMucGRmLCBidWlsZGluZyBmb3IKPiA+Pj4+Pj4+IEJlYWdsZWJvbmUgQmxhY2sgdGhv
dWdoIG5vdCB0aGUgd2lyZWxlc3Mgb2YgdGhlIHRyYWluaW5nIHBkZi4gVW5kZXIKPiA+Pj4+Pj4+
IEtlcm5lbCAtIHNlbGVjdGVkIGRldmljZSB0cmVlIGJsb2IgYW5kIGluLXRyZWUgZGV2aWNlIHRy
ZWUgbmFtZSBJIHB1dAo+ID4+Pj4+Pj4gYW0zMzV4LWJvbmVibGFjay4gSG93ZXZlciBJIGdldAo+
ID4+Pj4+Pj4KPiA+Pj4+Pj4+IERldmljZSBUcmVlIFNvdXJjZSAoYXJjaC9hcm0vZHRzL2FtMzM1
eC0uZHRiKSBpcyBub3QgY29ycmVjdGx5Cj4gPj4+Pj4+PiBzcGVjaWZpZWQuCj4gPj4+Pj4+PiBQ
bGVhc2UgZGVmaW5lICdDT05GSUdfREVGQVVMVF9ERVZJQ0VfVFJFRScKPiA+Pj4+Pj4+IG9yIGJ1
aWxkIHdpdGggJ0RFVklDRV9UUkVFPTxkZXZpY2VfdHJlZT4nIGFyZ3VtZW50Cj4gPj4+Pj4+Pgo+
ID4+Pj4+Pj4gV2hhdCBkb2VzIGl0IHdhbnQ/IFNvbWV0aGluZyBpcyBtaXNzaW5nIGJ1dCBJIGRv
bid0IGtub3cgd2hhdC4KPiA+Pj4+Pj4gU3RhcnRpbmcgZnJvbSAgTGludXggdmVyc2lvbiA2LjVb
MF0geW91IGhhdmUgdG8gc3BlY2lmeSB0aGUKPiA+Pj4+Pj4gbWFudWZhY3R1cmVyIGZvbGRlciB0
b28gY29tcGFyZWQgdG8gcHJldmlvdXMgdmVyc2lvbnMoaS5lLiA2LjRbMV0pLiBTbwo+ID4+Pj4+
PiBpZiB5b3UncmUgdXNpbmcgYSBrZXJuZWwgbmV3ZXIgdGhhbiA2LjUgeW91IGhhdmUgdG8gc3Bl
Y2lmeSBzb21ldGhpbmcKPiA+Pj4+Pj4gbGlrZToKPiA+Pj4+Pj4gYXJjaC9hcm0vZHRzL3RpL29t
YXAvYW0zMzV4LS5kdGIKPiA+Pj4+Pj4KPiA+Pj4+Pj4gSG9wZSB0aGlzIGhlbHBzLgo+ID4+Pj4+
Pgo+ID4+Pj4+PiBbMF06IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjUtcmMx
L3NvdXJjZS9hcmNoL2FybS9ib290L2R0cwo+ID4+Pj4+PiBbMV06IGh0dHBzOi8vZWxpeGlyLmJv
b3RsaW4uY29tL2xpbnV4L3Y2LjQuMTYvc291cmNlL2FyY2gvYXJtL2Jvb3QvZHRzCj4gPj4+Pj4+
Cj4gPj4+Pj4+IEJlc3QgcmVnYXJkcwo+ID4+Pj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gPj4+Pj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+ID4+
Pj4+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gPj4+Pj4gaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4gPj4+Pgo+ID4+Cj4gPj4KPiA+PiAt
LQo+ID4+IE1pY2hhZWwgTmF6emFyZW5vIFRyaW1hcmNoaQo+ID4+IENvLUZvdW5kZXIgJiBDaGll
ZiBFeGVjdXRpdmUgT2ZmaWNlcgo+ID4+IE0uICszOSAzNDcgOTEzIDIxNzAKPiA+PiBtaWNoYWVs
QGFtYXJ1bGFzb2x1dGlvbnMuY29tCj4gPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+ID4+Cj4gPj4gQW1hcnVsYSBTb2x1dGlvbnMgQlYKPiA+PiBKb29wIEdlZXNpbmt3ZWcg
MTI1LCAxMTE0IEFCLCBBbXN0ZXJkYW0sIE5MCj4gPj4gVC4gKzMxICgwKTg1IDExMSA5MTcyCj4g
Pj4gaW5mb0BhbWFydWxhc29sdXRpb25zLmNvbQo+ID4+IHd3dy5hbWFydWxhc29sdXRpb25zLmNv
bQo+ID4KPiA+CgoKCi0tIApNaWNoYWVsIE5henphcmVubyBUcmltYXJjaGkKQ28tRm91bmRlciAm
IENoaWVmIEV4ZWN1dGl2ZSBPZmZpY2VyCk0uICszOSAzNDcgOTEzIDIxNzAKbWljaGFlbEBhbWFy
dWxhc29sdXRpb25zLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCgpBbWFy
dWxhIFNvbHV0aW9ucyBCVgpKb29wIEdlZXNpbmt3ZWcgMTI1LCAxMTE0IEFCLCBBbXN0ZXJkYW0s
IE5MClQuICszMSAoMCk4NSAxMTEgOTE3MgppbmZvQGFtYXJ1bGFzb2x1dGlvbnMuY29tCnd3dy5h
bWFydWxhc29sdXRpb25zLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
