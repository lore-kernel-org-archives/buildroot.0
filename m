Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 364FAC433EF
	for <buildroot@archiver.kernel.org>; Sat, 30 Apr 2022 15:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD07281289;
	Sat, 30 Apr 2022 15:46:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OGaAj2SSgXR4; Sat, 30 Apr 2022 15:46:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6DFF80F48;
	Sat, 30 Apr 2022 15:46:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3BCDF1BF94B
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 15:46:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 29FE460A7D
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 15:46:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bIIXQwSA0b88 for <buildroot@lists.busybox.net>;
 Sat, 30 Apr 2022 15:46:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 153C96076A
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 15:46:18 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id gh6so20645999ejb.0
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 08:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=VQXsZ9NIL3BII6LtkzS9n0xqTgrAMI5AiJ5kZiulcO8=;
 b=WtsaXL+2cPB6waFP7mcgzJ6G0m5ZgE7kxy52+yrQU+15BzoBrUiOBZLjotnFrs1zmc
 4HihVWcL+M1VXHH3jWEVdCNld7FrE0WunrkiWf3P1vO9j6ZQY00R/IAML3X0PqYMpRav
 SVTsWm6EkwPMyN6FMsAqNkxLpiW37K5IKBIpDRg7pPmpLte5Yea48f/t5V2abPvvrcvg
 4K1O+KFemsr3h3X8WwQzC1QWxo9YRJFFmucyKeleVJ/v9ySsW9SvQJ3QpyXuSlihCzXL
 SHywuJGuyQQvVpIuqWvrj8uZRxSNYRaDc0XEWvC+SZ7bYwIhOxQI5rIsjU+AB7GcG5EH
 zvfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=VQXsZ9NIL3BII6LtkzS9n0xqTgrAMI5AiJ5kZiulcO8=;
 b=uQlVKZLH8MgQbSr3E8AODutHIK8wyQ0BsuSHO5K3zdjJpWqWcBwd27N5kLSy0EJ4pF
 h6m3Fskz0RiP8NiCI2MuddkNsLQcDL/KIb23OpkqcEvWcEvClb/Gj/7+b2PJBWrg/F09
 YCXxL8/jz33sEkGLd39Ba3vmRWIyv4jtZS2AujqhopMF7VRJ3d3syatWXg6aM7jot2xb
 7Z4TCYvF1coqhU44C0VX5WH1X0jvQErdZd+GS1OdNNsz429ERS7Hmw1E0IvFBqTSoD3V
 Fy4tZtAy6e/IpF96vWsGbPw4pFamxBAUh5SzW5H01TL7mnMO/4Mi1pxfLz9wk4aVi2+c
 mH3A==
X-Gm-Message-State: AOAM531AsH4KrjPw2TWJjQ9sf2gPC965KPbt+pTKOPhdMUCyusJIPd27
 rhvFxT+5lo4zamBV96Q/EkgZvA==
X-Google-Smtp-Source: ABdhPJzEmMzRniPlxKcOJ+8DhIlWRKPWvx/eQ8UHBoUQjOzyhvHRcYS51fhYfch6EDNirl1mujJCwA==
X-Received: by 2002:a17:907:962a:b0:6f3:b0f5:5db9 with SMTP id
 gb42-20020a170907962a00b006f3b0f55db9mr4350347ejc.644.1651333577061; 
 Sat, 30 Apr 2022 08:46:17 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 jy6-20020a170907762600b006f3ef214e51sm1674293ejc.183.2022.04.30.08.46.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 08:46:16 -0700 (PDT)
Message-ID: <4284a369-c87f-ae6c-af32-d338da99feb3@mind.be>
Date: Sat, 30 Apr 2022 17:46:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Francis Laniel <flaniel@linux.microsoft.com>, buildroot@buildroot.org
References: <20220422181612.51246-1-flaniel@linux.microsoft.com>
 <20220422181612.51246-2-flaniel@linux.microsoft.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220422181612.51246-2-flaniel@linux.microsoft.com>
Subject: Re: [Buildroot] [RFC PATCH v1 1/2] package/libbpf: build for host
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyMi8wNC8yMDIyIDIwOjE2LCBGcmFuY2lzIExhbmllbCB3cm90ZToKPiBTaWduZWQtb2Zm
LWJ5OiBGcmFuY2lzIExhbmllbCA8ZmxhbmllbEBsaW51eC5taWNyb3NvZnQuY29tPgo+IC0tLQo+
ICAgcGFja2FnZS9saWJicGYvbGliYnBmLm1rIHwgMjUgKysrKysrKysrKysrKysrKysrKysrKysr
Kwo+ICAgMSBmaWxlIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS9saWJicGYvbGliYnBmLm1rIGIvcGFja2FnZS9saWJicGYvbGliYnBmLm1rCj4gaW5k
ZXggZDY5MTQ3NTdkNy4uNzA5Mjc3ZmFjNCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2xpYmJwZi9s
aWJicGYubWsKPiArKysgYi9wYWNrYWdlL2xpYmJwZi9saWJicGYubWsKPiBAQCAtMTAsNiArMTAs
NyBAQCBMSUJCUEZfTElDRU5TRSA9IEdQTC0yLjAsIExHUEwtMi4xLCBCU0QtMi1DbGF1c2UKPiAg
IExJQkJQRl9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRSBMSUNFTlNFLkJTRC0yLUNsYXVzZSBMSUNF
TlNFLkxHUEwtMi4xCj4gICBMSUJCUEZfQ1BFX0lEX1ZFTkRPUiA9IGxpYmJwZl9wcm9qZWN0Cj4g
ICBMSUJCUEZfREVQRU5ERU5DSUVTID0gaG9zdC1iaXNvbiBob3N0LWZsZXggaG9zdC1wa2djb25m
IGVsZnV0aWxzIHpsaWIKPiArSE9TVF9MSUJCUEZfREVQRU5ERU5DSUVTID0gaG9zdC1iaXNvbiBo
b3N0LWZsZXggaG9zdC1wa2djb25mIGhvc3QtZWxmdXRpbHMgaG9zdC16bGliCj4gICBMSUJCUEZf
SU5TVEFMTF9TVEFHSU5HID0gWUVTCj4gICAKPiAgIGRlZmluZSBMSUJCUEZfQlVJTERfQ01EUwo+
IEBAIC0zOCw0ICszOSwyOCBAQCBkZWZpbmUgTElCQlBGX0lOU1RBTExfVEFSR0VUX0NNRFMKPiAg
IAkJLUMgJChARCkvc3JjIGluc3RhbGwgREVTVERJUj0kKFRBUkdFVF9ESVIpCj4gICBlbmRlZgo+
ICAgCj4gK2RlZmluZSBIT1NUX0xJQkJQRl9JTlNUQUxMX0NNRFMKPiArCSQoSE9TVF9NQUtFX0VO
VikgJChIT1NUX0NPTkZJR1VSRV9PUFRTKSAkKE1BS0UpIFwKPiArCQktQyAkKEBEKS9zcmMgaW5z
dGFsbCBpbnN0YWxsX3VhcGlfaGVhZGVycyBERVNURElSPSQoSE9TVF9ESVIpCj4gKwo+ICsJIyBX
ZSBuZWVkIHRvIGluc3RhbGxfdWFwaV9oZWFkZXJzIHNvIHdlIGhhdmUgYnRmLmggdG8gY29tcGls
ZQo+ICsJIyBob3N0LXBhaG9sZS4KPiArCSMgTm9uZXRoZWxlc3MsIHRoaXMgdGFyZ2V0IGFkZHMg
YnBmLmggd2hpY2ggZ2VuZXJhdGVzIGEgY29uZmxpY3Qgd2hlbgo+ICsJIyBidWlsZGluZyB0aGUg
a2VybmVsOgo+ICsJIyBJbiBmaWxlIGluY2x1ZGVkIGZyb20gbGliYnBmX2ludGVybmFsLmg6MTc6
MCwgZnJvbSBzdHJzZXQuYzo5Ogo+ICsJIyByZWxvX2NvcmUuaDoxMDo2OiBlcnJvcjogbmVzdGVk
IHJlZGVmaW5pdGlvbiBvZiDigJhlbnVtIGJwZl9jb3JlX3JlbG9fa2luZOKAmQo+ICsJIyBlbnVt
IGJwZl9jb3JlX3JlbG9fa2luZCB7Cj4gKwkjIF5+fn5+fn5+fn5+fn5+fn5+fgo+ICsJIyByZWxv
X2NvcmUuaDoxMDo2OiBlcnJvcjogcmVkZWNsYXJhdGlvbiBvZiDigJhlbnVtIGJwZl9jb3JlX3Jl
bG9fa2luZOKAmQo+ICsJIyBJbiBmaWxlIGluY2x1ZGVkIGZyb20gbGliYnBmX2xlZ2FjeS5oOjEz
OjAsCj4gKwkjIAkJZnJvbSBsaWJicGZfaW50ZXJuYWwuaDoxNiwKPiArCSMgCQlmcm9tIHN0cnNl
dC5jOjk6Cj4gKwkjIC9ob21lL2ZyYW5jaXMvYnVpbGRyb290L291dHB1dC9ob3N0L2luY2x1ZGUv
bGludXgvYnBmLmg6NjQ5Nzo2OiBub3RlOiBvcmlnaW5hbGx5IGRlZmluZWQgaGVyZQo+ICsJIyBl
bnVtIGJwZl9jb3JlX3JlbG9fa2luZCB7Cj4gKwkjIFNvLCBiZXR0ZXIgdG8gcmVtb3ZlIHJlbW92
ZSBpdCBub3cgc2luY2Ugd2UgZG8gbm90IG5lZWQgaXQgdG8gYnVpbGQKPiArCSMgaG9zdC1wYWhv
bGUuCgogIFRoaXMgZW50aXJlIGNvbW1lbnQgc2hvd3MgdXAgaW4gdGhlIGJ1aWxkIGxvZyBiZWNh
dXNlIG1ha2UgZWNob2VzIGNvbW1hbmRzIGFuZCAKdGhlc2UgYXJlIGNvbW1hbmRzLiBTbyBJIG1v
dmVkIGl0IG91dHNpZGUgb2YgdGhlIGRlZmluZS4KCgogIEFwcGxpZWQgYm90aCB0byBtYXN0ZXIs
IHRoYW5rcy4gSW4gdGhlIHNlY29uZCBjb21taXQsIEkgYWxzbyByZXdvcmRlZCB0aGUgCmNvbW1p
dCBtZXNzYWdlIGEgYml0LgoKICBSZWdhcmRzLAogIEFybm91dAoKCj4gKwlybSAkKEhPU1RfRElS
KS9pbmNsdWRlL2xpbnV4L2JwZi5oCj4gK2VuZGVmCj4gKwo+ICAgJChldmFsICQoZ2VuZXJpYy1w
YWNrYWdlKSkKPiArJChldmFsICQoaG9zdC1nZW5lcmljLXBhY2thZ2UpKQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
