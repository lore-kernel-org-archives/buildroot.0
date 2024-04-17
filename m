Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58000C4345F
	for <buildroot@archiver.kernel.org>; Wed, 17 Apr 2024 18:41:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B9E140108;
	Wed, 17 Apr 2024 18:41:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n4_BcUelZyss; Wed, 17 Apr 2024 18:41:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F9114027D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F9114027D;
	Wed, 17 Apr 2024 18:41:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E5E5C1BF423
 for <buildroot@lists.busybox.net>; Wed, 17 Apr 2024 18:41:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D29AB80E8F
 for <buildroot@lists.busybox.net>; Wed, 17 Apr 2024 18:41:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QP5XODpN10zb for <buildroot@lists.busybox.net>;
 Wed, 17 Apr 2024 18:41:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=michael@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6A18C80E80
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A18C80E80
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6A18C80E80
 for <buildroot@buildroot.org>; Wed, 17 Apr 2024 18:41:46 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-56e346224bdso13491a12.1
 for <buildroot@buildroot.org>; Wed, 17 Apr 2024 11:41:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713379304; x=1713984104;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kQWyiuff8VWDcwPkI4vaisZrvzzjftkEFGU6/ohtC/E=;
 b=Dwm9aSfGsaEktyw5OzCvCrzl8ZZB1HbhbusaIz/Uhuya2vthqYPZjH4i9XlE4TlJE2
 f0W6L1iQZWIw3Xnj3BEmRzKcgWO9PbkiDvhp2MTpomtoImt5Bf4LGAqE/rO2sx+X+kzL
 J8iDHGrcqDcp+WjPjEuaEKNz3Q4V5ZRFHNuEsKGQUXIn84b8/l22QjQFgwr5eX0luUrM
 V3Oo6RNzYflVoGiftzGTKHK11AcPYEhao8KD8dpUfY8XX4Uf65P17Oaw5rPoH9+Yf9RD
 qjr5Aagzx5ChKpD6HAfG66Dk5kVjutrkGVm5Nh28YdRdDPhf7Ci7y2T1KefZDe+0nCmL
 WSYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVa9yePW0/D9srKCgR+1gqUcG14cks0xniGLQlG9ChbKSoGxz7yvNUpKC/0GxsNP7h4GA8pD64yJdsvwl2aTJ0IGyjTMjj3eA==
X-Gm-Message-State: AOJu0YwN3M3ZETiPFuK6d9m8Z6mh/KxiraxmbHn4w4j8RltTnnNzbXqq
 ThQ/GpHVgG0YBsnB/BQ7MQ1TmsWIlopob33p0kl5ycNZOt72pWkTcYOy1YHnyOz589VXxtI5YGD
 PaamBHZvK4jqJIOL9HvwQcwVEwTN93w4Rm4aj36bn6XRifflKBY4=
X-Google-Smtp-Source: AGHT+IHjXqusFanfh44Wu/gGZiqta7P4BEcRrvgWO1jKp3dO4dL+g9jn9K5itLYEOUPqBAH/lhZng62a29tlh7HYWY0=
X-Received: by 2002:a17:906:f1d7:b0:a52:33a1:7caf with SMTP id
 gx23-20020a170906f1d700b00a5233a17cafmr190404ejb.69.1713379304312; Wed, 17
 Apr 2024 11:41:44 -0700 (PDT)
MIME-Version: 1.0
References: <e2634bc6-2e68-4331-8354-49407b40f191.ref@yahoo.com>
 <e2634bc6-2e68-4331-8354-49407b40f191@yahoo.com>
 <6068206a-9a0c-4ef4-a5bb-9e6f35218297@benettiengineering.com>
 <d144cbba-9be6-477f-9a79-e72361487734@yahoo.com>
 <CAOf5uwmQBtHf9w7vjxyxDjFuaQj=uv4a0OpLHJ1MNg5V3PjNwQ@mail.gmail.com>
 <37ec60b9-d7db-440c-a8d4-2993ae9c6a16@yahoo.com>
 <CAOf5uwmOi0V7t7GmwNvrwy8qoKyVnaGJziwZhqPd2jCAZMK5EQ@mail.gmail.com>
 <CAOf5uwkmcuBvXSp0oHuCXQX+HqNP6O52QEvxTWm0hEnF=W2eNw@mail.gmail.com>
In-Reply-To: <CAOf5uwkmcuBvXSp0oHuCXQX+HqNP6O52QEvxTWm0hEnF=W2eNw@mail.gmail.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Wed, 17 Apr 2024 20:41:33 +0200
Message-ID: <CAOf5uwmnQPW=RXFTSH-VqUtfmeud0vHvwYwjB3b2W86fuqkR5Q@mail.gmail.com>
To: DTrustee <dterry_engineer@yahoo.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1713379304; x=1713984104;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kQWyiuff8VWDcwPkI4vaisZrvzzjftkEFGU6/ohtC/E=;
 b=Foi0Zq2MlyC/myl2QhIPOaf/RGEK/yhOx7N5Er6nIdqlpxWmvs71kK7Kft/aca0Vc+
 3jXADUPiUyEuXeECdd59PFsrswI2Hx3/kwd0gPTZxepZ71H73WUDPN/zNr8p3sAYzPS4
 zeZn2IDuWXgiCfNlnSyISD5jnl6MbKpl1LLFs=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Foi0Zq2M
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
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkKCk9uIFdlZCwgQXByIDE3LCAyMDI0IGF0IDg6NDDigK9QTSBNaWNoYWVsIE5henphcmVubyBU
cmltYXJjaGkKPG1pY2hhZWxAYW1hcnVsYXNvbHV0aW9ucy5jb20+IHdyb3RlOgo+Cj4gSGkKPgo+
IE9uIFdlZCwgQXByIDE3LCAyMDI0IGF0IDg6MznigK9QTSBNaWNoYWVsIE5henphcmVubyBUcmlt
YXJjaGkKPiA8bWljaGFlbEBhbWFydWxhc29sdXRpb25zLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGkK
PiA+Cj4gPiBPbiBXZWQsIEFwciAxNywgMjAyNCBhdCA4OjI24oCvUE0gRFRydXN0ZWUgPGR0ZXJy
eV9lbmdpbmVlckB5YWhvby5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBJIGFtIGJ1aWxkaW5nIGZv
ciB0aGUgQmVhZ2xlYm9uZSBCbGFjayB3aGljaCBpcyBjb252ZW5pZW50IGFzIHRoZQo+ID4gPiBC
b290bGluIHRyYWluaW5nIHVzZXMgdGhlIHdpcmVsZXNzIHZlcnNpb24gb2YgdGhhdCBib2FyZC4g
SSBob3BlIEkgYW0KPiA+ID4gZG9pbmcgdGhlIHJpZ2h0IHRoaW5nIGJ5IGluY2x1ZGluZyBldmVy
eW9uZSBvbiB0aGUgYWRkcmVzcyBsaXN0IG9mIHRoaXMKPiA+ID4gdGhyZWFkLCBkb24ndCB3YW50
IHRvIGZpbGwgdXAgcGVvcGxlJ3MgaW5ib3ggbmVlZGxlc3NseS4KPiA+ID4KPiA+Cj4gPiBQbGVh
c2UgcHJvdmlkZSB0aGUgc3RlcHMgaGVyZQo+Cj4gbWFrZSBiZWFnbGVib25lX2RlZmNvbmZpZwo+
CgpEaWQgeW91IGFkZCBhbnkgbG9jYWwubWsgdG8gb3ZlcnJpZGUgYW55dGhpbmc/Ck1pY2hhZWwK
PiBtYWtlCj4KPiBSaWdodD8KPiA+Cj4gPiBNaWNoYWVsCj4gPgo+ID4gPiBIYXZlIGEgQmxlc3Nl
ZCBkYXkhCj4gPiA+Cj4gPiA+IERvbgo+ID4gPgo+ID4gPiBPbiA0LzE3LzI0IDExOjI5IEFNLCBN
aWNoYWVsIE5henphcmVubyBUcmltYXJjaGkgd3JvdGU6Cj4gPiA+ID4gSGkKPiA+ID4gPgo+ID4g
PiA+IE9uIFdlZCwgQXByIDE3LCAyMDI0IGF0IDY6MjXigK9QTSBEVHJ1c3RlZSB2aWEgYnVpbGRy
b290Cj4gPiA+ID4gPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cm90ZToKPiA+ID4gPj4gSSBr
bm93IHlvdSBhcmUgYWxsIGJ1c3ksIGRvbid0IG1lYW4gdG8gYnVnIGFueW9uZSBidXQgSSBjYW5u
b3QgZ2V0Cj4gPiA+ID4+IGJ1aWxkcm9vdCB0byBtYWtlIHdpdGhvdXQgZXJyb3JzLiBJIGhhdmUg
bm8gaWRlYSB3aHkgIm9wZXJhdG9yICc8JyBoYXMKPiA+ID4gPj4gbm8gbGVmdCBvcGVyYW5kIiBp
cyBnZW5lcmF0ZWQgb3Igd2hpY2ggaW5jbHVkZSBmaWxlIGlzIHRoZSBjYXVzZS4gSQo+ID4gPiA+
PiB0cnVseSBhcHByZWNpYXRlIHlvdXIgaGVscC4gSXMgdGhlcmUgZG9jdW1lbnRhdGlvbiB0aGF0
IHdhbGtzIHRocm91Z2gKPiA+ID4gPj4gdGhlIGJ1aWxkIHByb2Nlc3M/IEkgaGF2ZSBsb29rZWQg
YXQgdGhlIEJvb3RsaW4gdHJhaW5pbmcgYnV0IGl0IGlzCj4gPiA+ID4+IHNldmVyYWwgeWVhcnMg
b2xkIG5vdyBhbmQgb3V0IG9mIGRhdGUuCj4gPiA+ID4gWW91IGFyZSB0cnlpbmcgdG8gYnVpbGQg
YSB1Ym9vdCBib2FyZCB0aGF0IGhhcyBub3QgaW5jbHVkZSBvZiB0aGUKPiA+ID4gPiBLY29uZmln
IG9mIGl0LiAgSSB0aGluayB0aGF0IHlvdQo+ID4gPiA+IGhhdmUganVzdCBhIGJyb2tlbiB1Ym9v
dC4gV2hhdCBjb25maWd1cmF0aW9uIG9yIGJvYXJkIGFyZSB5b3UgYnVpbGRpbmc/Cj4gPiA+ID4K
PiA+ID4gPiBNaWNoYWVsCj4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+PiBCdWlsZGxvZyBpcwo+ID4g
PiA+Pgo+ID4gPiA+PiBodHRwczovL3Bhc3RlYmluLmNvbS9FcXQ2emk5YQo+ID4gPiA+Pgo+ID4g
PiA+PiBjb25maWcgaXMKPiA+ID4gPj4KPiA+ID4gPj4gaHR0cHM6Ly9wYXN0ZWJpbi5jb20vOFAy
aEI5dVkKPiA+ID4gPj4KPiA+ID4gPj4gYnVpbGRyb290IDIwMjQuMDIuMQo+ID4gPiA+Pgo+ID4g
PiA+PiBIYXZlIGEgQmxlc3NlZCBkYXkhCj4gPiA+ID4+Cj4gPiA+ID4+IERvbgo+ID4gPiA+Pgo+
ID4gPiA+Pgo+ID4gPiA+Pgo+ID4gPiA+PiBPbiA0LzkvMjQgNDo1OSBQTSwgR2l1bGlvIEJlbmV0
dGkgd3JvdGU6Cj4gPiA+ID4+PiBIaSBEb24sCj4gPiA+ID4+Pgo+ID4gPiA+Pj4gT24gMDkvMDQv
MjQgMjM6MjMsIERvbiB2aWEgYnVpbGRyb290IHdyb3RlOgo+ID4gPiA+Pj4+IFRoaXMgaXMgbXkg
Zmlyc3QgdGltZSB1c2luZyBidWlsZHJvb3QuIEZvbGxvd2luZyB0aGUgaW5zdHJ1Y3Rpb25zIG9m
Cj4gPiA+ID4+Pj4gYm9vdGxpbi5jb20vZG9jL3RyYWluaW5nL2J1aWxkcm9vdC9idWlsZHJvb3Qt
bGFicy5wZGYsIGJ1aWxkaW5nIGZvcgo+ID4gPiA+Pj4+IEJlYWdsZWJvbmUgQmxhY2sgdGhvdWdo
IG5vdCB0aGUgd2lyZWxlc3Mgb2YgdGhlIHRyYWluaW5nIHBkZi4gVW5kZXIKPiA+ID4gPj4+PiBL
ZXJuZWwgLSBzZWxlY3RlZCBkZXZpY2UgdHJlZSBibG9iIGFuZCBpbi10cmVlIGRldmljZSB0cmVl
IG5hbWUgSSBwdXQKPiA+ID4gPj4+PiBhbTMzNXgtYm9uZWJsYWNrLiBIb3dldmVyIEkgZ2V0Cj4g
PiA+ID4+Pj4KPiA+ID4gPj4+PiBEZXZpY2UgVHJlZSBTb3VyY2UgKGFyY2gvYXJtL2R0cy9hbTMz
NXgtLmR0YikgaXMgbm90IGNvcnJlY3RseQo+ID4gPiA+Pj4+IHNwZWNpZmllZC4KPiA+ID4gPj4+
PiBQbGVhc2UgZGVmaW5lICdDT05GSUdfREVGQVVMVF9ERVZJQ0VfVFJFRScKPiA+ID4gPj4+PiBv
ciBidWlsZCB3aXRoICdERVZJQ0VfVFJFRT08ZGV2aWNlX3RyZWU+JyBhcmd1bWVudAo+ID4gPiA+
Pj4+Cj4gPiA+ID4+Pj4gV2hhdCBkb2VzIGl0IHdhbnQ/IFNvbWV0aGluZyBpcyBtaXNzaW5nIGJ1
dCBJIGRvbid0IGtub3cgd2hhdC4KPiA+ID4gPj4+IFN0YXJ0aW5nIGZyb20gIExpbnV4IHZlcnNp
b24gNi41WzBdIHlvdSBoYXZlIHRvIHNwZWNpZnkgdGhlCj4gPiA+ID4+PiBtYW51ZmFjdHVyZXIg
Zm9sZGVyIHRvbyBjb21wYXJlZCB0byBwcmV2aW91cyB2ZXJzaW9ucyhpLmUuIDYuNFsxXSkuIFNv
Cj4gPiA+ID4+PiBpZiB5b3UncmUgdXNpbmcgYSBrZXJuZWwgbmV3ZXIgdGhhbiA2LjUgeW91IGhh
dmUgdG8gc3BlY2lmeSBzb21ldGhpbmcKPiA+ID4gPj4+IGxpa2U6Cj4gPiA+ID4+PiBhcmNoL2Fy
bS9kdHMvdGkvb21hcC9hbTMzNXgtLmR0Ygo+ID4gPiA+Pj4KPiA+ID4gPj4+IEhvcGUgdGhpcyBo
ZWxwcy4KPiA+ID4gPj4+Cj4gPiA+ID4+PiBbMF06IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29t
L2xpbnV4L3Y2LjUtcmMxL3NvdXJjZS9hcmNoL2FybS9ib290L2R0cwo+ID4gPiA+Pj4gWzFdOiBo
dHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni40LjE2L3NvdXJjZS9hcmNoL2FybS9i
b290L2R0cwo+ID4gPiA+Pj4KPiA+ID4gPj4+IEJlc3QgcmVnYXJkcwo+ID4gPiA+PiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gPiA+PiBidWlsZHJv
b3QgbWFpbGluZyBsaXN0Cj4gPiA+ID4+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gPiA+ID4+
IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+
ID4gPiA+Cj4gPiA+ID4KPiA+Cj4gPgo+ID4KPiA+IC0tCj4gPiBNaWNoYWVsIE5henphcmVubyBU
cmltYXJjaGkKPiA+IENvLUZvdW5kZXIgJiBDaGllZiBFeGVjdXRpdmUgT2ZmaWNlcgo+ID4gTS4g
KzM5IDM0NyA5MTMgMjE3MAo+ID4gbWljaGFlbEBhbWFydWxhc29sdXRpb25zLmNvbQo+ID4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4KPiA+IEFtYXJ1bGEgU29sdXRpb25z
IEJWCj4gPiBKb29wIEdlZXNpbmt3ZWcgMTI1LCAxMTE0IEFCLCBBbXN0ZXJkYW0sIE5MCj4gPiBU
LiArMzEgKDApODUgMTExIDkxNzIKPiA+IGluZm9AYW1hcnVsYXNvbHV0aW9ucy5jb20KPiA+IHd3
dy5hbWFydWxhc29sdXRpb25zLmNvbQo+Cj4KPgo+IC0tCj4gTWljaGFlbCBOYXp6YXJlbm8gVHJp
bWFyY2hpCj4gQ28tRm91bmRlciAmIENoaWVmIEV4ZWN1dGl2ZSBPZmZpY2VyCj4gTS4gKzM5IDM0
NyA5MTMgMjE3MAo+IG1pY2hhZWxAYW1hcnVsYXNvbHV0aW9ucy5jb20KPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4KPiBBbWFydWxhIFNvbHV0aW9ucyBCVgo+IEpvb3AgR2Vl
c2lua3dlZyAxMjUsIDExMTQgQUIsIEFtc3RlcmRhbSwgTkwKPiBULiArMzEgKDApODUgMTExIDkx
NzIKPiBpbmZvQGFtYXJ1bGFzb2x1dGlvbnMuY29tCj4gd3d3LmFtYXJ1bGFzb2x1dGlvbnMuY29t
CgoKCi0tIApNaWNoYWVsIE5henphcmVubyBUcmltYXJjaGkKQ28tRm91bmRlciAmIENoaWVmIEV4
ZWN1dGl2ZSBPZmZpY2VyCk0uICszOSAzNDcgOTEzIDIxNzAKbWljaGFlbEBhbWFydWxhc29sdXRp
b25zLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCgpBbWFydWxhIFNvbHV0
aW9ucyBCVgpKb29wIEdlZXNpbmt3ZWcgMTI1LCAxMTE0IEFCLCBBbXN0ZXJkYW0sIE5MClQuICsz
MSAoMCk4NSAxMTEgOTE3MgppbmZvQGFtYXJ1bGFzb2x1dGlvbnMuY29tCnd3dy5hbWFydWxhc29s
dXRpb25zLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
