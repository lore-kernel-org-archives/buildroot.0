Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78964C433EF
	for <buildroot@archiver.kernel.org>; Fri,  8 Jul 2022 12:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDAFC41695;
	Fri,  8 Jul 2022 12:17:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DDAFC41695
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cl5i_vLmTDfO; Fri,  8 Jul 2022 12:17:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B6BD41299;
	Fri,  8 Jul 2022 12:17:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B6BD41299
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E3B0E1BF32A
 for <buildroot@lists.busybox.net>; Fri,  8 Jul 2022 12:17:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD75061398
 for <buildroot@lists.busybox.net>; Fri,  8 Jul 2022 12:17:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD75061398
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oXG-aQvX24bf for <buildroot@lists.busybox.net>;
 Fri,  8 Jul 2022 12:17:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD0E161391
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DD0E161391
 for <buildroot@buildroot.org>; Fri,  8 Jul 2022 12:17:38 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 187-20020a1c02c4000000b003a2cc290135so154728wmc.2
 for <buildroot@buildroot.org>; Fri, 08 Jul 2022 05:17:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=G9/HydccUHxs79LcWjaZTv6SI+Rme8yy0FCBC/kddBo=;
 b=3AbIdOnvGlH8HPUPrMV+43nqi9PMmZGe/8FIDPtZFiguEa8BOR5QmyXazDB3K9Kdj2
 oVBergZemlmA7enYuhHIxkoefywJCEE3paJNve6z4KQGX2HrAoZulswjaLjQIS8tiF7/
 d5lzs5oAs4KnL7xISJye6UtZSv9+cCN9rn5y8X0sf03MsKGHGGkQ1ps8vyJJgEj3tVYs
 xX2Tse/jLJjYMEOBj8GX6dqZyifmvcDMnTHJ+yV2qWw7X1NP8gK5VV3hDgL8DpOa7A/Y
 ctRd2d+G3Vi12DArcgKgXWWxqzwyeEvBwTcGjF7mTMAgJNDGar3sQkJu3cy2SyR6PMBa
 Hpvg==
X-Gm-Message-State: AJIora+pxq8AMYemb6/Ip3YrN7tLjn/rHLa4bz6A6slRMsmA1Nwz+nO/
 zrCFdIVpJcJVE8GJNypcxex+rw==
X-Google-Smtp-Source: AGRyM1uZIl7xGo6qVkq9Ik0kuncNjBYiYVunPQM0TXMZpzz4Q5Kg5mZDNG0GsP6/AAu2f2hZ+onPrA==
X-Received: by 2002:a1c:f716:0:b0:3a1:8f0e:66b4 with SMTP id
 v22-20020a1cf716000000b003a18f0e66b4mr3406951wmh.140.1657282656872; 
 Fri, 08 Jul 2022 05:17:36 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id
 z9-20020a5d4409000000b0021d86796294sm4105309wrq.59.2022.07.08.05.17.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jul 2022 05:17:36 -0700 (PDT)
Message-ID: <d6bc094d-463e-db7f-6895-2e807112a475@smile.fr>
Date: Fri, 8 Jul 2022 14:17:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Federico Pellegrin <fede@evolware.org>, buildroot@buildroot.org,
 jugurtha.belkalem@smile.fr, romain.naour@gmail.com
References: <CAM6O0ZiSwpyathbf+xVQnddT3frF7ik_SWzgy1DAo5COTefJxw@mail.gmail.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <CAM6O0ZiSwpyathbf+xVQnddT3frF7ik_SWzgy1DAo5COTefJxw@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=G9/HydccUHxs79LcWjaZTv6SI+Rme8yy0FCBC/kddBo=;
 b=VRj67OSyw6QNewToLx4HITEmpTEQYAxmJOInzopGZqBk7TawN5qumudmDFOXPaa7Mw
 qd602Xugl37Af/sMiqM2wcP/JLBt/cb3BjYZ9dMmRmB5NyeQ8v1vrhYQjmZrM9LVRXyj
 H5c3oRqc6lds0UdFo5dIROzVQXQy3zHHOCOPQrC00v//5cgv1nnKEpnSyoIDEyZ+fZFP
 jwXcTJqoWMWjdCStVztsXqM3T0Jy89hx4H8FSXGYPqCeaiPq+78w7WUhis5jr1pPyEO1
 mybj9eWwcQI0Xw+CcWnO1nIOJrAbr+KXmYg1rsBSwp1s1hmEDOATtgef2uXT0U+7g/Gr
 hgXA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=VRj67OSy
Subject: Re: [Buildroot] package/bcc in buildroot ?
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRmVkZXJpY28sCgpMZSAwNS8wNy8yMDIyIMOgIDEwOjQxLCBGZWRlcmljbyBQZWxsZWdy
aW4gYSDDqWNyaXTCoDoKPiAKPiBIZWxsbywKPiBMYXRlbHkgSSB3YXMgbG9va2luZyBhdCB0aGUg
bmVjZXNzaXR5IHRvIGludGVncmF0ZSBiY2MgaW4gYnVpbGRyb290IGZvciBvbmUgb2YKPiBvdXIg
cHJvamVjdHMuCj4gSSd2ZSBzZWVuIHRoYXQgaW4gdGhlIG5vdCB0b28gZmFyIHBhc3QgdGhlcmUg
d2FzIGEgZmV3IGF0dGVtcHRzIHRvIGludGVncmF0ZQo+IHRoaXMsIG5hbWVseSB0aGlzIHNob3Vs
ZCBiZSB0aGUgbGF0ZXN0IHBhdGNoOgo+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJv
amVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyMDEyMjAxNTEyMDMuMjIwNjc0Ny0yLXJvbWFpbi5uYW91
ckBnbWFpbC5jb20vCj4gPGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWls
ZHJvb3QvcGF0Y2gvMjAyMDEyMjAxNTEyMDMuMjIwNjc0Ny0yLXJvbWFpbi5uYW91ckBnbWFpbC5j
b20vPgo+IAo+IEkndmUgZm9yIHRoZSB0aW1lIGJlaW5nIHRlc3RlZCB0aGF0IHBhdGNoIGFnYWlu
c3QgYnVpbGRyb290IG1hc3RlciBhbmQgaXQgd29ya3MuCj4gSSBhbHNvIGJ1bXBlZCB0aGUgYmNj
IHZlcnNpb24gdG8gdGhlIGxhdGVzdHMgYXZhaWxhYmxlICgwLjI0LjApIGFuZCBiZXNpZGVzIHZl
cnkKPiBsaXR0bGUgY2hhbmdlcyAodG8gb25lIG9mIHRoZSB0d28gcGF0Y2hlcykgaXQgYWxzbyBi
dWlsdCBzdWNjZXNzZnVsbHkuCj4gCj4gSSB3YXMgd29uZGVyaW5nIGlmIHRoZXJlIHdhcyBzdGls
bCBpbnRlcmVzdCB0byBhZGQgdGhpcyBhcyBhIHN0YW5kYXJkIHBhY2thZ2UgYXMKPiBpdCB3b3Vs
ZCB0aGVuIGJlIG1vcmUgdXNlZnVsIHRvIGV2ZXJ5b25lIGFuZCBlYXNpZXIgdG8gbWFpbnRhaW4u
IEkgY291bGQgZ2l2ZSBhCj4gaGFuZCBvZiBjb3Vyc2UgdG8gdHJ5IHRvIGRvIHRoaXMgaWYgcG9z
c2libGUuCj4gCj4gUmV2aWV3aW5nIHRoZSBvcGVuIHBvaW50cyBmb3IgdGhlIHBhdGNoOgo+IC0p
IFRoZSB0d28gcGF0Y2hlcyBhcmUgc3RpbGwgbm90IHVwc3RyZWFtZWQgKG5vdCBzdXJlIGlmIHRo
ZXJlIHdhcyBhbiBhdHRlbXB0IHRvCj4gdXBzdHJlYW0gb3Igbm90KQo+IC0pIEkgZ3Vlc3Mgc29t
ZSB3b3JrIHdvdWxkIGJlIG5lZWRlZCBhcm91bmQgdGhlIGRlcGVuZGVuY2llcyBhcyBzdWdnZXN0
ZWQgaW4gdGhlCj4gcmV2aWV3LCBidXQgaG9wZWZ1bGx5IHRoZXJlIGlzIG5vIGJpZyBzaG93c3Rv
cHBlci4KCkZlZWwgZnJlZSB0byBzZW5kIGFuIHVwZGF0ZWQgdmVyc2lvbiBvZiB0aGlzIHBhdGNo
IHNlcmllcy4KCldlIGhhZCBzb21lIGhlbHAgYW5kIHJldmlldyBmcm9tIFFhaXMgWW91c2VmLCBJ
IHN1Z2dlc3QgdG8gYWRkIGhpbSBpbiBDYy4KCkFsc28geW91IG1heSBiZSBpbnRlcmVzdGVkIGJ5
IHBseSBpbnN0ZWFkIChhbHJlYWR5IGluIEJ1aWxkcm9vdCk6CgpodHRwczovL2Zvc2RlbS5vcmcv
MjAyMi9zY2hlZHVsZS9ldmVudC9wbHlfZWJwZi8KCkJlc3QgcmVnYXJkcywKUm9tYWluCgo+IAo+
IE1hbnkgdGhhbmtzLAo+IEZlZGVyaWNvCj4gCj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
