Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A3DC5479D
	for <buildroot@archiver.kernel.org>; Wed, 11 Jan 2023 14:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 824E9418A2;
	Wed, 11 Jan 2023 14:47:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 824E9418A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IqJJ3mzuEoIC; Wed, 11 Jan 2023 14:47:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 768894194B;
	Wed, 11 Jan 2023 14:47:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 768894194B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6D1AF1BF2A0
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 14:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47F8C40516
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 14:47:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47F8C40516
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rWVdLdBhVkhJ for <buildroot@lists.busybox.net>;
 Wed, 11 Jan 2023 14:47:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4A5F403E5
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B4A5F403E5
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 14:47:53 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id w1so15275236wrt.8
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 06:47:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MBUNiN06v69Mub62UKjfPWF6CfAzMfsz4LY3Isdtip8=;
 b=pCEfZmxGCuCO1JZWvH48/Fe+IwvYasttMy7d8nuh6Y7R0FzooCN2aL9skZlS7pIi2c
 8N3RR5ItQdxpewDiMmIxyXBP/rvC+O4x5gSzZ20+QnacAqBOIHn8l69EAxl/RF0X9CUx
 quEyY1HxvZ56mFboDWFdJnWRLv1smKmzHmG44YL3Z676uwVUHx/5DR1+89Kpt4e93Hbw
 oWLlJ+kXqYPSwRiQbvjYlbcwXju7209vL0ewXeFq0fiWQeWcvJ4T9RqvllR0Vi9UZB3c
 xwKJK+a4HvXMul9a0ooMuH9NPfzsokraaDZjP/1isOraziq1A6pZC6P5SYoFmNNwTVxR
 ogiA==
X-Gm-Message-State: AFqh2kq7oFpNj79Kny3BVWAH2bFAhOo4dQMe/uxizvANJNmcQKjByos5
 hjKIY2wyFKlEzvhbF+v2DqZfcg==
X-Google-Smtp-Source: AMrXdXumbEhgus5O66muS/izClstPDnMvrxBbMUJD05gvKndMo4K5qwh6mJH+b+MX5hmMjc7Xyv1Fg==
X-Received: by 2002:a05:6000:884:b0:2a3:ac90:dda3 with SMTP id
 ca4-20020a056000088400b002a3ac90dda3mr19671820wrb.35.1673448471844; 
 Wed, 11 Jan 2023 06:47:51 -0800 (PST)
Received: from [10.5.3.94]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a5d608a000000b0027cfd9463d7sm14038759wrt.110.2023.01.11.06.47.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 06:47:51 -0800 (PST)
Message-ID: <a0e36432-a05a-6e7f-53c0-2d8f1055d26a@smile.fr>
Date: Wed, 11 Jan 2023 15:47:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Markus Mayer <mmayer@broadcom.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
References: <20220624221901.514921-1-mmayer@broadcom.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20220624221901.514921-1-mmayer@broadcom.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MBUNiN06v69Mub62UKjfPWF6CfAzMfsz4LY3Isdtip8=;
 b=lYk6RP4WCUF6SmXMYvFOyfpsJGvfIvyqh+zj+8937a0yPeVavwZOeOGZiOiLLLo9IF
 cHq3d1pbY5u8M5ZNn2hTK+x3blKGsxKVcKOPq94zeLFKe2+Rnb521+AcaxqKBr3zvBL4
 NvhwDeTBgdTEtL5T4cwvk+KMZC1AUfUZu5TSqNrWnoJNUocPWn3Wsuw5xLsctTStYLhp
 xAXBqZ+zbCBB5/GSOrWSDg54NPZzKIQG4l5xnjahdwayJ7TU8xDL3LdDz48hd3lrUjOW
 wRH/V/81BBdaK9zq0ExBRp8UMr5euWwv40cgzTsleQ7gL578CBCuI6gsCfne7umCmFZ/
 O+Tg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=lYk6RP4W
Subject: Re: [Buildroot] [PATCH] toolchain-external: handle case of dangling
 symlink
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

SGVsbG8gTWFya3VzLAoKTGUgMjUvMDYvMjAyMiDDoCAwMDoxOSwgTWFya3VzIE1heWVyIHZpYSBi
dWlsZHJvb3QgYSDDqWNyaXTCoDoKPiBjb3B5X3Rvb2xjaGFpbl9saWJfcm9vdCB3YXMgbm90IGhh
bmRsaW5nIHRoZSBjYXNlIG9mICJyZWFkbGluayIKPiByZXR1cm5pbmcgbm90aGluZywgd2hpY2gg
d2lsbCBoYXBwZW4gaWYgdGhlIHN5bWxpbmsgaXQgaXMgdHJ5aW5nIHRvCj4gcmVzb2x2ZSBkb2Vz
IG5vdCBwb2ludCB0byBhIHZhbGlkIGZpbGUgb24gdGhlIGJ1aWxkIGhvc3QuIFRoaXMKPiBzaG91
bGRuJ3QgaGFwcGVuLCBidXQgaXQgY2FuLgoKSW5kZWVkLgoKSXQgY291bGQgaGFwcGVuIGlmIHRo
ZSB1c2VyIHByb3ZpZGUgc3VjaCBzeW1saW5rIGluIEJSMl9UT09MQ0hBSU5fRVhUUkFfTElCUy4K
Cj4gCj4gVGhlIGVuZCByZXN1bHQgb2YgdGhpcyBzaXR1YXRpb24gd291bGQgYmUgYW4gZW5kbGVz
cyBsb29wIG9mIGVycm9yCj4gbWVzc2FnZXMgdGhhdCB3b3VsZCBvbmx5IGVuZCBpZiBhYm9ydGVk
IG1hbnVhbGx5Lgo+IAo+ICAgICBbLi4uXQo+ICAgICBjcDogbWlzc2luZyBkZXN0aW5hdGlvbiBm
aWxlIG9wZXJhbmQgYWZ0ZXIKPiAgICAgJy9sb2NhbC91c2Vycy9tbWF5ZXIvYnVpbGRyb290L291
dHB1dC9hcm02NC90YXJnZXQvLycKPiAgICAgVHJ5ICdjcCAtLWhlbHAnIGZvciBtb3JlIGluZm9y
bWF0aW9uLgo+ICAgICByZWFkbGluazogbWlzc2luZyBvcGVyYW5kCj4gICAgIFRyeSAncmVhZGxp
bmsgLS1oZWxwJyBmb3IgbW9yZSBpbmZvcm1hdGlvbi4KPiAgICAgYmFzZW5hbWU6IG1pc3Npbmcg
b3BlcmFuZAo+ICAgICBUcnkgJ2Jhc2VuYW1lIC0taGVscCcgZm9yIG1vcmUgaW5mb3JtYXRpb24u
Cj4gICAgIGRpcm5hbWU6IG1pc3Npbmcgb3BlcmFuZAo+ICAgICBUcnkgJ2Rpcm5hbWUgLS1oZWxw
JyBmb3IgbW9yZSBpbmZvcm1hdGlvbi4KPiAgICAgXkMKPiAgICAgbWFrZVsxXTogKioqIFtwYWNr
YWdlL3BrZy1nZW5lcmljLm1rOjM4NDoKPiAKPiBJbnN0ZWFkIG9mIGxvb3BpbmcgZW5kbGVzc2x5
IHdpdGhvdXQgZXhwbGFuYXRpb24sIGxldCdzIGFib3J0IGFuZAo+IGluZm9ybSB0aGUgdXNlciB0
aGF0IHNvbWV0aGluZyBzZWVtcyBhbWlzcyB3aXRoIHRoZWlyIHNldHVwLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IE1hcmt1cyBNYXllciA8bW1heWVyQGJyb2FkY29tLmNvbT4KPiAtLS0KPiAgdG9vbGNo
YWluL2hlbHBlcnMubWsgfCA1ICsrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMo
KykKPiAKPiBkaWZmIC0tZ2l0IGEvdG9vbGNoYWluL2hlbHBlcnMubWsgYi90b29sY2hhaW4vaGVs
cGVycy5tawo+IGluZGV4IDA1YWE0N2EwZGQ4Yi4uNzg4ZjVlZjY3MWNlIDEwMDY0NAo+IC0tLSBh
L3Rvb2xjaGFpbi9oZWxwZXJzLm1rCj4gKysrIGIvdG9vbGNoYWluL2hlbHBlcnMubWsKPiBAQCAt
MTksNyArMTksMTIgQEAgY29weV90b29sY2hhaW5fbGliX3Jvb3QgPSBcCj4gIAkJCXJtIC1mciAk
KFRBUkdFVF9ESVIpLyQke0RFU1RESVJ9LyQke0xJQk5BTUV9OyBcCj4gIAkJCWlmIHRlc3QgLWgg
JCR7TElCUEFUSH0gOyB0aGVuIFwKPiAgCQkJCWNwIC1kICQke0xJQlBBVEh9ICQoVEFSR0VUX0RJ
UikvJCR7REVTVERJUn0vJCR7TElCTkFNRX07IFwKPiArCQkJCU9MRF9MSUJQQVRIPSIkJHtMSUJQ
QVRIfSI7IFwKPiAgCQkJCUxJQlBBVEg9ImByZWFkbGluayAtZiAkJHtMSUJQQVRIfWAiOyBcCj4g
KwkJCQlpZiBbICIkJHtMSUJQQVRIfSIgPSAiIiBdOyB0aGVuIFwKPiArCQkJCQllY2hvICJMSUJQ
QVRIIGVtcHR5IGFmdGVyIHRyeWluZyB0byByZXNvbHZlIHN5bWxpbmsgJCR7T0xEX0xJQlBBVEh9
IiAxPiYyOyBcCj4gKwkJCQkJZXhpdCAxOyBcCj4gKwkJCQlmaTsgXAoKSSdtIG5vdCBzdXJlIGl0
J3Mgb2sgdG8gZmFpbCBoZXJlIG9uIGEgZGFuZ2xpbmcgc3ltbGluay4KTWF5YmUgYWRkIGEgY2hl
Y2sgYW5kIGlnbm9yZSBzdWNoIGRhbmdsaW5nIHN5bWxpbmsgd2l0aCBhIHdhcm5pbmcgZm9yIHRo
ZSB1c2VyLgoKSXQncyB1bmxpa2VseSB0aGF0IHN1Y2ggZGFuZ2xpbmcgc3ltbGluayBwcm92aWRl
ZCBieSB0aGUgdG9vbGNoYWluIHdpbGwgYmUgdXNlZnVsLgoKQmVzdCByZWdhcmRzLApSb21haW4K
Cgo+ICAJCQllbGlmIHRlc3QgLWYgJCR7TElCUEFUSH07IHRoZW4gXAo+ICAJCQkJJChJTlNUQUxM
KSAtRCAtbTA3NTUgJCR7TElCUEFUSH0gJChUQVJHRVRfRElSKS8kJHtERVNURElSfS8kJHtMSUJO
QU1FfTsgXAo+ICAJCQkJYnJlYWsgOyBcCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
