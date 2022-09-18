Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B174C32771
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 12:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D10260E40;
	Sun, 18 Sep 2022 12:50:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D10260E40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b8IPoD71qMpe; Sun, 18 Sep 2022 12:50:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41F0760E3A;
	Sun, 18 Sep 2022 12:50:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41F0760E3A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 102281BF228
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 12:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DFB5D60E3A
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 12:50:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFB5D60E3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F4gKtQm5LZpl for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 12:50:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA5E660D71
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DA5E660D71
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 12:50:16 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 r3-20020a05600c35c300b003b4b5f6c6bdso2608378wmq.2
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 05:50:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=JLDPedr8nxQMzmWpBb/9hYU0oxN5/sRIiQrR7q4ygq0=;
 b=7cT7KVEZo1DNJ6dDOmWpAu0vaJeXA7vccP6OaTnmrfFuLJxruORuhaqbVjNipeQ/cx
 cs2Q8xB0/ODrOO7pVBdtbv9S8HkMX/KAJd8T5YSbv7/nwM8Jq6NuEPVaJpd2LJ7yXMdh
 ubkOsmfGwh1FxiT6T9sd9epdXzpq6lqR6TguRs/mHOjW00p5OihBhm9JWsXijHtKVLif
 g6OhBt8ls7b+SdRtfo8GgdDZ5Z0RENGBQ4y0edOy6YEdxETQ8y4k4PrLsSLW5UwpF7SJ
 MY4drwe+jVWQXxZ4IOngX+uvbUDCWyoUGFZ0bbG3w2ktX/AsumKBniFzGEcFn/+/lzUV
 ZjQQ==
X-Gm-Message-State: ACgBeo35f5ZOhcRUcVBAMW+/vJY0VEGdOjQslm9jvlUZ6QuzN1AU51Du
 ceg+NJ+HLcJxk3eQJHYniECy4Q==
X-Google-Smtp-Source: AA6agR4W96NcdMolNehnjPPTUD9n/q4GF5w8g0xnLxJoB/mgASOegL5HJCydkNv72qsLf91mRMwNGw==
X-Received: by 2002:a05:600c:1694:b0:3b4:6205:1f95 with SMTP id
 k20-20020a05600c169400b003b462051f95mr16673533wmn.151.1663505415113; 
 Sun, 18 Sep 2022 05:50:15 -0700 (PDT)
Received: from [172.23.97.104] ([79.140.217.34])
 by smtp.gmail.com with ESMTPSA id
 25-20020a05600c021900b003b332a7b898sm9489704wmi.45.2022.09.18.05.50.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Sep 2022 05:50:14 -0700 (PDT)
Message-ID: <f7cf7f1e-797d-e83e-1c2a-6e66357bfcb6@mind.be>
Date: Sun, 18 Sep 2022 14:50:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: en-GB
From: Arnout Vandecappelle <arnout@mind.be>
To: Christian Stewart <christian@paral.in>
References: <20220720125707.1899437-1-festevam@gmail.com>
 <20220720183856.742c4a09@windsurf>
 <8CF2C8F5-F7EA-43C2-80BA-1D4122D22A66@withsecure.com>
 <20220720222430.7eb519f6@windsurf>
 <7202d505-f0fa-9fba-b21b-8dc8cb44b01b@mind.be>
 <20220722231518.1536cd2f@windsurf>
 <65b22e0d-1a50-54e9-3ad2-92e3d804ebbb@mind.be>
 <CA+h8R2oX11-6vwu8SsqKQqKKZ8OsMDRzOcNThC9PPnYb+sXE=A@mail.gmail.com>
 <989b969f-6450-bfad-c2ad-340a799c3dea@mind.be>
In-Reply-To: <989b969f-6450-bfad-c2ad-340a799c3dea@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=JLDPedr8nxQMzmWpBb/9hYU0oxN5/sRIiQrR7q4ygq0=;
 b=hcXvq0yZeDCNncxjDF0cKnfr9IDEXFXMFtb37ZYlA6LptemHb9F/qaqcO64prFWes1
 X+sWIVvvnQBhrFW0C0I+swyFhRBQ2Z511dbqo2KKBe5u7wpzpdT4K0eZXxsLeNSlNDQ1
 QxU94KkdePIDL+rT4brpOcGu7NQ/BPv04CtmWtb5OgHXN010MEjqKdVqVNnnktY8TvTw
 KQXrJle4zzdKEgmHFDLY5Hb8ggtkCEx+wPMaxjwbcJmrwweuW2HXKKaI8iwMFufRmzZE
 X1jiyQwBlSVFnhr/OVy1bOWK/UAe0YMyNhuCSZFhlCk5RfalRJyaIcjfLnHwwZ8ikotb
 puKQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hcXvq0yZ
Subject: Re: [Buildroot] [PATCH] package/crucible: Pass 'osusergo netgo' tags
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
Cc: "Barisani, Andrea" <andrea.barisani@withsecure.com>,
 Fabio Estevam <festevam@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDIzLzA3LzIwMjIgMTA6NTQsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+Cj4KPiBP
biAyMy8wNy8yMDIyIDAyOjQxLCBDaHJpc3RpYW4gU3Rld2FydCB3cm90ZToKPj4gSGkgYWxsLAo+
Pgo+Pgo+PiBPbiBGcmksIEp1bCAyMiwgMjAyMiBhdCAzOjAzIFBNIEFybm91dCBWYW5kZWNhcHBl
bGxlIDxhcm5vdXRAbWluZC5iZT4gd3JvdGU6Cj4+PiDCoMKgIEknZCBhY3R1YWxseSBleHBlY3Qg
dGhhdCB0aGUgcGFja2FnZSBpdHNlbGYgd291bGQgc3BlY2lmeSB3aGV0aGVyIGl0IAo+Pj4gbmVl
ZHMgY2dvCj4+PiBvciBub3QuIENhbiB3ZSB0ZXN0IGEgYnVpbGQgb2YgYSBwYWNrYWdlIHRoYXQg
YWN0dWFsbHkgdXNlcyBjZ28gdG8gdmVyaWZ5IGlmIHdlCj4+PiByZWFsbHkgbmVlZCB0byBzZXQg
aXQgaW4gSE9TVF9HT19DT01NT05fRU5WPwo+Pgo+PiAiQ0dPX0VOQUJMRUQiIGluZm9ybXMgdGhl
IGNvbXBpbGVyIHRoYXQgaXQncyBPSyB0byB1c2UgQ2dvLgo+Pgo+PiBJdCBzaG91bGQgc3RpbGwg
YmUgc2V0IHRvIDEgZXZlbiBpZiB0aGUgcGFja2FnZSBkb2Vzbid0IHVzZSBjZ28gYXQgYWxsLgo+
Pgo+Pj4gwqDCoCBSZWdhcmRsZXNzLCB3ZSAqd2lsbCogbmVlZCB0byBzZXQgdGhlICdvc3VzZXJn
byBuZXRnbycgdGFncyBmb3IgYWxsIAo+Pj4gY2dvLXVzaW5nCj4+PiBwYWNrYWdlcyB3aGVuIHRo
ZXkgZG8gdXNlIGNnbyAtIHNvIGVpdGhlciB3ZSBzdGlsbCBuZWVkIGEgcGVyLXBhY2thZ2UgImVu
YWJsZQo+Pj4gY2dvIiBvcHRpb24sIG9yIHdlIHNob3VsZCBqdXN0IGFsd2F5cyBhZGQgdGhvc2Ug
dGFncyBpZiBjZ28gaXMgZW5hYmxlZCBhbmQgCj4+PiB3ZSdyZQo+Pj4gZG9pbmcgc3RhdGljIGxp
bmtpbmcuCj4+Pgo+Pj4gwqDCoCBJcyB0aGVyZSBhbnkgcmVhc29uIHdoeSB0aGlzIHByb2JsZW0g
aXMgb25seSBvYnNlcnZlZCBmb3IgdGhlIGNydWNpYmxlIAo+Pj4gcGFja2FnZT8KPj4KPj4gU28s
IHRoaXMgZG9lc24ndCB3b3JrPwo+Pgo+PiBGT09fR09fRU5WICs9IENHT19FTkFCTEVEPTAKPj4K
Pj4gLi4gYmVjYXVzZSB0aGUgcGFja2FnZSBuZWVkcyB0YWdzIGVuYWJsZWQgY29uZGl0aW9uYWxs
eSBpZiBjZ28gaXMKPj4gYXZhaWxhYmxlIG9yIG5vdD8KPj4KPj4gSSBkb24ndCB1bmRlcnN0YW5k
IHdoeSB0aGlzIHNwZWNpZmljIHBhY2thZ2UgY2FuJ3QganVzdCBjaGVjawo+PiBIT1NUX0dPX0NH
T19FTkFCTEVEIGFuZCBjb25kaXRpb25hbGx5IGFkZCB0aGUgdGFncz8KPgo+IMKgWWVzIGl0IGNh
bi4gSG93ZXZlciwgQW5kcmVhIHdyb3RlOgo+Cj4+IFRoZXNlIGZsYWdzIGFyZSBub3QgY3J1Y2li
bGUgc3BlY2lmaWMgYnV0IHRoZXkgYXJlIG5lY2Vzc2FyeSB3aGVuCj4+IGNvbXBpbGluZyBzdGF0
aWMgR28gYmluYXJpZXMgd2l0aCBDR08gZW5hYmxlZCAod2hpY2ggY3J1Y2libGUgZG9lcwo+PiBu
b3QgcmVxdWlyZSBieSB0aGUgd2F5KSB0byBlbnN1cmUgcG9ydGFiaWxpdHkgYXMgY2dvIHZlcnNp
b25zIG9mIG5ldAo+PiBhbmQgb3MvdXNlcnMgYXJlIG5vdCBwb3J0YWJsZS4gCj4KPiBhbmQgd2Ug
YXJlIHdvbmRlcmluZyB3aHkgb25seSBjcnVjaWJsZSBuZWVkcyB0aG9zZSB0YWdzLCBhbmQgb3Ro
ZXIgR28gcGFja2FnZXMgCj4gZG9uJ3QuIEFuZCB3aGF0IGlzIGVzcGVjaWFsbHkgd2VpcmQgaXMg
dGhlIHBhcnQgIndoaWNoIGNydWNpYmxlIGRvZXMgbm90IAo+IHJlcXVpcmUiIHdoaWNoIG1ha2Vz
IGl0IHNvdW5kIGFzIGlmIGNydWNpYmxlIGlzbid0IHVzaW5nIGNnbyBhdCBhbGwuLi4KCiDCoEl0
IHR1cm5zIG91dCB0aGF0IG90aGVyIHBhY2thZ2VzIGFsc28gZG8gbmVlZCBpdCwgZS5nLiBjb250
YWluZXJkIGFuZCBkZWx2ZS4KCiDCoFNvIEkgbW92ZWQgdGhpcyB0byB0aGUgcGtnLWdvbGFuZyBp
bmZyYSBbMV0sIGFuZCBtYXJrZWQgdGhpcyBwYXRjaCBhcyBTdXBlcnNlZGVkLgoKCiDCoFJlZ2Fy
ZHMsCiDCoEFybm91dAoKWzFdIApodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3Qv
YnVpbGRyb290L3BhdGNoLzIwMjIwOTE4MTIyMjM5LjE4OTE0Ny0xLWFybm91dEBtaW5kLmJlLwoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
