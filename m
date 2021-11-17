Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23E03C433EF
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 20:29:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 408FB6138F
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 20:29:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 408FB6138F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC381405F9;
	Wed, 17 Nov 2021 20:29:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fOn5HksXi25r; Wed, 17 Nov 2021 20:29:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3784440570;
	Wed, 17 Nov 2021 20:29:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 761891BF842
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 20:29:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 728EF403DA
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 20:29:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CWw3nZLVGYJg for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 20:29:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F2D4B403D5
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 20:29:48 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id y12so16498552eda.12
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 12:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=gZuabET2lTzrQ3IY1gAX0U4AP0cA/AUuROoC9E+G2HY=;
 b=HgCIb/2VE/OndmS/zNc+GIYjiD9txTcynpVfcO23b3Rdq0UnvqI5yPwSb+OK7PTEcw
 fgGNSxRoLIpHZbZnidmwKUBi4uxNf0DCpMkHMj/anwVXC6OoeK9znM44VUFxddLnG5XU
 dnyP7V6HjhpBcXn/yaJ3gL1cy2lvBaWYYl5UGvoSmy/QhT0Hi4Bh4H/mltKPdG7WMVN2
 Ao95mPMxGQZD67cejbW8SuKFSrXMiwiGPbczTEg1nl6/Lh08PUBeCzIDvQZD8KdaPOod
 sT0moYDoov2Revf/1Qhy6EkzJhoYNSCCDyL8U5rltZcbbbqVLACEb4alkRkFm1PNaRWS
 ChNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=gZuabET2lTzrQ3IY1gAX0U4AP0cA/AUuROoC9E+G2HY=;
 b=mOeIc8mmpELczOlcbZCjL+gfqJaRRXhPZYLy6CmeIqeipNlxfcWJHDQ2axSOxdZD1d
 B+dC4Dxuc0WDgii06I3OTaqfCcV8nHrGQq6QwPzoGEXzGmzn0VnozHYgRUV7ZwIqN5U9
 ryggrcEQ/yLIjlWIUSCx/xFOp1c3V32EuI0+1O9o9FJtMUxTNb5Y+LojS4HiDMSORos3
 zWTiyp/zNNQzTFVgWAcJa673dBKhUaTquwwBprAsBUAAGdxNrW+85nVh55wHheg9PPfS
 qNolqPuXxkPZln2mdGoV2Raslq9Z2rmHU7QYZgGsNIDcEIK0ShgKu7lBj52/iAwzqi3X
 KoJg==
X-Gm-Message-State: AOAM533KQcuwffelcvoYSZ1RWlDdeFfyL6HhqHX8LnvgD1KJeCCzW/MT
 c1EKYaHvHIypbYqlhseZTnh09AGfEJ8Hjg==
X-Google-Smtp-Source: ABdhPJxxuiStwcKfX9saIaPuvCJxLwWr9dDYgRN+3lX1c6f5wOMgyGarO1KIwAl2bO15lmgEXIjhRg==
X-Received: by 2002:aa7:c301:: with SMTP id l1mr2442881edq.20.1637180987249;
 Wed, 17 Nov 2021 12:29:47 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id cs15sm409279ejc.31.2021.11.17.12.29.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 12:29:46 -0800 (PST)
Message-ID: <e058dfd3-ead4-d375-c088-90c891cecf24@mind.be>
Date: Wed, 17 Nov 2021 21:29:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: =?UTF-8?Q?Jos=c3=a9_Pekkarinen?= <jose.pekkarinen@unikie.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <CAJPV9MpFEQJk5otMfJkC0D2YNjLnanijNhHWSYT3ymtLYd2yeg@mail.gmail.com>
 <20211116152552.0a9e32da@windsurf>
 <CAJPV9MpMc6t5uty1VGHQm7KsABg7yKqRaXDQqGxyuFiG91DfLw@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CAJPV9MpMc6t5uty1VGHQm7KsABg7yKqRaXDQqGxyuFiG91DfLw@mail.gmail.com>
Subject: Re: [Buildroot] Running script after init
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
Cc: buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxNy8xMS8yMDIxIDEzOjQ4LCBKb3PDqSBQZWtrYXJpbmVuIHdyb3RlOgo+IAo+IAo+IE9u
IFR1ZSwgTm92IDE2LCAyMDIxIGF0IDQ6MjUgUE0gVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBl
dGF6em9uaUBib290bGluLmNvbSAKPiA8bWFpbHRvOnRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5j
b20+PiB3cm90ZToKPiAKPiAgICAgSGVsbG8gSm9zw6ksCj4gCj4gICAgIE9uIFR1ZSwgMTYgTm92
IDIwMjEgMTQ6MDg6MDIgKzAyMDAKPiAgICAgSm9zw6kgUGVra2FyaW5lbiA8am9zZS5wZWtrYXJp
bmVuQHVuaWtpZS5jb20KPiAgICAgPG1haWx0bzpqb3NlLnBla2thcmluZW5AdW5pa2llLmNvbT4+
IHdyb3RlOgo+IAo+ICAgICAgPiBBbnkgaGludCB3aGF0IHdvdWxkIGJlIHRoZSByaWdodCBwbGFj
ZSBpbiBidWlsZHJvb3QKPiAgICAgID4KPiAgICAgID4gdXNlcnNwYWNlIHRvIHB1dCBhbiBzY3Jp
cHQgYWZ0ZXIgdGhlIGluaXQgcHJvY2VzcyBpcyBvdmVyPwo+IAo+ICAgICBUaGUgaW5pdCBwcm9j
ZXNzIGJ5IGl0c2VsZiBpcyBuZXZlciBvdmVyLCBpdCBjb250aW51ZXMgdG8gcnVuIHVudGlsIHlv
dQo+ICAgICByZWJvb3QgeW91ciBzeXN0ZW0uCj4gCj4gICAgIENvdWxkIHlvdSBjbGFyaWZ5IHlv
dXIgcXVlc3Rpb24/IFlvdSB3YW50IGEgc2VydmljZSB0byBiZSBzdGFydGVkIGFmdGVyCj4gICAg
IGFsbCBvdGhlciBzZXJ2aWNlcz8KPiAKPiAKPiAgICAgSGksCj4gCj4gICAgIEkgd2FudCB0byBy
dW4gYSBzY3JpcHQgYWZ0ZXIgdGhlIFRUWXMgYXJlIHVwIGFuZCBydW5uaW5nLgo+IAo+IEN1cnJl
bnRseSBJIHJ1biB0aGUgc2NyaXB0IGFzIFM5OW15c2NyaXB0LCBhbmQgcHV0IGEgY2FsbCBpbiB0
aGUKPiBzdGFydCwgYW5kIGl0IGZhaWxzLiBJZiBJIGxhdGVyIGxvZ2dpbmcgYXMgcm9vdCBhbmQg
bWFudWFsbHkgcnVuIHRoZQo+IFM5OW15c2NyaXB0IHN0YXJ0LCBpdCBydW5zIHdlbGwuCgogIFRo
ZSB0dHlzIGFyZSBzdGFydGVkIGltbWVkaWF0ZWx5IGFmdGVyIHRoZSBsYXN0IHNjcmlwdCBpbiAv
ZXRjL2luaXQuZCBoYXMgCmZpbmlzaGVkLCBzbyBpdCdzIHVubGlrZWx5IGEgcHJvYmxlbSBkdWUg
dG8gc2VxdWVuY2luZy4gTW9yZSBsaWtlbHksIHRoZSAKZGlmZmVyZW5jZSB5b3Ugb2JzZXJ2ZSBp
cyBkdWUgdG8gdGhlIGRpZmZlcmVuY2UgaW4gZW52aXJvbm1lbnQgYmV0d2VlbiBhbiAKaW50ZXJh
Y3RpdmUgbG9naW4gYW5kIHdoZW4gdGhlIGluaXQgc2NyaXB0IGlzIGV4ZWN1dGVkIGRpcmVjdGx5
IGJ5IGluaXQuCgogIFRvIGRlYnVnIHlvdXIgaW5pdCBzY3JpcHQsIHlvdSBjYW4gc3RhcnQgaXQg
d2l0aAoKIyEgL2Jpbi9zaCAteAoKVGhpcyB3aWxsIGVjaG8gZWFjaCBjb21tYW5kIGJlZm9yZSBp
dCBpcyBleGVjdXRlZCwgd2hpY2ggd2lsbCBoZWxwIHRvIGRldGVybWluZSAKd2hlcmUgaXQgZmFp
bHMuCgoKICBSZWdhcmRzLAogIEFybm91dAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
