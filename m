Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A18FCC433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 08:43:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D14761BF3;
	Sat, 11 Dec 2021 08:43:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uuL3CqDy9Kue; Sat, 11 Dec 2021 08:43:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7894C61CD3;
	Sat, 11 Dec 2021 08:43:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9C3CF1BF471
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 08:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 852B441BDF
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 08:43:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kQHsGjuJiK84 for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 08:43:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C4F79404B8
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 08:43:13 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id r11so36194345edd.9
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 00:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=J/fTQWXBwwG7uOkljbG1hhYqvpRhIGGod9qfEZlbgsM=;
 b=VLzfJcPx7+thEU68PqJsPfIhmeSrdqKKu0ObG8mmi9dwcU73JyavrPE8FIWVsSNMcX
 n3Mkch9XZSq8dcp8AwsCTNnOZBJcpnmADqF7netL/Hu7KEUqsIWSpytGkq2TiRufXDkJ
 6Ij+WqLWjvX0fJVg/LFEBuNf23pTKlwk4XqMZCO4ttCn8uFFOnVFVqlc0cQerX/V4x5h
 dxffj8KTsGzf7NboxkXF17d1xihFCpgjyEKRA4kBPX3k42y9Zq9V8qgMvr8OjNLDcjwb
 Zd7bBLO56SpOzgfnESAnRVRNOCKEWuehrE/zSJXx3X/PM9R9SLngGSQqkny/8sQLFcw5
 15gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=J/fTQWXBwwG7uOkljbG1hhYqvpRhIGGod9qfEZlbgsM=;
 b=rHwF3GOUZ/VNlVjfyHGKTQLGExwpLxByXEHKcHnHldNiGBx3nhFkUzAoKg1fJw58MK
 QEYY8GzFBgv/bFbxEaGisqfnWwWxg5HN7X1yvhfG8bdu0q2Z5SgSEbbtDpI1KLotSReD
 z+YBY97hUMCPJVb93zEGUdeWBuwA1eXNUXvaytcyQD2BxJPdLmWFqYjmlPhTh4hpWIvy
 FJ0N+PMtq7OfRNQ0dhsmcZ5KueG6mCxlfVxT4O6G38bQWBEAXNy/acaCkNBLj8HuIRG5
 X4QHX+FY7VHAJuKpXWRTN1nM/2MIgRQZaWm29Y89kG/QCi40ssCghkyReaYlQMnAGO/w
 YLXg==
X-Gm-Message-State: AOAM532HcaM1kK7xDx1xVFbtr//FgTfz6r8INvcFosvne51HgQA0XVYA
 5PbzZkWJblVKbn+dzpqgG15wsQ==
X-Google-Smtp-Source: ABdhPJx1bXNQhQ5WF2fxyccxKd/s+JvvfZzm6A1tnLJM+9Z30+Temf0fhafEHMfi1pX2DPE5H3jtkA==
X-Received: by 2002:a50:c3c8:: with SMTP id i8mr44939953edf.350.1639212191901; 
 Sat, 11 Dec 2021 00:43:11 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id qz24sm2665940ejc.29.2021.12.11.00.43.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Dec 2021 00:43:11 -0800 (PST)
Message-ID: <8186e105-a959-e35a-4506-1553b8d6c06e@mind.be>
Date: Sat, 11 Dec 2021 09:43:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 =?UTF-8?Q?Jos=c3=a9_Pekkarinen?= <jose.pekkarinen@unikie.com>
References: <20211210141209.1812043-1-jose.pekkarinen@unikie.com>
 <20211210141209.1812043-5-jose.pekkarinen@unikie.com>
 <20211210201130.GL2603@scaer>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211210201130.GL2603@scaer>
Subject: Re: [Buildroot] [PATCH 5/7] package/aexpect: new package
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxMC8xMi8yMDIxIDIxOjExLCBZYW5uIEUuIE1PUklOIHdyb3RlOgo+IEpvc8OpLCBBbGws
Cj4gCj4gT24gMjAyMS0xMi0xMCAxNjoxMiArMDIwMCwgSm9zw6kgUGVra2FyaW5lbiBzcGFrZSB0
aHVzbHk6Cj4+IEFkZCBwYWNrYWdlIHRvIGF2b2NhZG8gZnJhbWV3b3JrJ3MgYWV4cGVjdC4KPj4K
Pj4gU2lnbmVkLW9mZi1ieTogSm9zw6kgUGVra2FyaW5lbiA8am9zZS5wZWtrYXJpbmVuQHVuaWtp
ZS5jb20+Cj4gWy0tU05JUC0tXQo+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9hZXhwZWN0L0NvbmZp
Zy5pbiBiL3BhY2thZ2UvYWV4cGVjdC9Db25maWcuaW4KPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQK
Pj4gaW5kZXggMDAwMDAwMDAwMC4uZWZhMmJlOGI5MQo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBi
L3BhY2thZ2UvYWV4cGVjdC9Db25maWcuaW4KPj4gQEAgLTAsMCArMSwxMiBAQAo+PiArY29uZmln
IEJSMl9QQUNLQUdFX0FFWFBFQ1QKPj4gKwlib29sICJhZXhwZWN0Igo+PiArCWRlcGVuZHMgb24g
IUJSMl9TVEFUSUNfTElCUyAjIGRsb3BlbigpCj4+ICsJc2VsZWN0IEJSMl9QQUNLQUdFX1BZVEhP
Tgo+IAo+IERvIG5vdCBzZWxlY3QgcHl0aG9uLCBkZXBlbmQgb24gaXQuCgogIFdoeSBub3Q/IEN1
cnJlbnRseSB3ZSBoYXZlIHRoZSBmb2xsb3dpbmcgcGFja2FnZXMgdGhhdCBzZWxlY3QgcHl0aG9u
KDMpOiAKY2lmcy11dGlscywgZG9ja2VyLWNvbXBvc2UsIGRzdGF0LCBnbHNsc2FuZGJveC1wbGF5
ZXIsIGdwc2QsIGphY2syLCAKbGlic2lncm9rZGVjb2RlLCBtaWRvcmksIG9wa2ctdXRpbHMsIHJh
bmdlci4KCiAgQWN0dWFsbHksIHJhbmdlciBpcyBhIGdyZWF0IGV4YW1wbGU6IGl0J3MgYWxzbyBh
IHRvb2wgdGhhdCBpcyBqdXN0IGEgdG9vbCBhbmQgCmp1c3QgaGFwcGVucyB0byBiZSBpbXBsZW1l
bnRlZCBpbiBweXRob24uIFNvIHNlbGVjdCBpcyBhcHByb3ByaWF0ZSwgbGlrZSB3ZSBkbyAKZm9y
IGFueSB0b29sIHRoYXQgaGFwcGVucyB0byBiZSBpbXBsZW1lbnRlZCBpbiBHbywgUnVzdCwgLi4u
CgogIEhvd2V2ZXIsIG5vdGUgdGhhdCB5b3UgbmVlZCBlaXRoZXIKCglzZWxlY3QgQlIyX1BBQ0tB
R0VfUFlUSE9OMyBpZiAhQlIyX1BBQ0tBR0VfUFlUSE9OCgpvcgoKCWRlcGVuZHMgb24gIUJSMl9Q
QUNLQUdFX1BZVEhPTgoJc2VsZWN0IEJSMl9QQUNLQUdFX1BZVEhPTjMKCgogIFJlZ2FyZHMsCiAg
QXJub3V0Cgo+IEFsc28gcHl0aG9uIGluIEJ1aWxkcm9vdCBpcyBweXRob24gMi4gV2UgYXJlIHRy
eWluZyB0byBnZXQgcmlkIG9mIGl0Lgo+IElzIGFleHBlY3QgcmVhbGx5IG9ubHkgc3VwcG9ydGlu
ZyBweXRob24yPyBJZiBzbywgdGhpcyBpcyBhIGJpdAo+IHVuZm9ydHVhbnRlLi4uCj4gCj4gQnV0
IHNpbmNlIGl0IHJlcXVpcmUgMnRvNiwgbWF5YmUgaXQgd29ya3Mgd2l0aCBweXRob24zIHRvbz8K
PiAKPiBSZWdhcmRzLAo+IFlhbm4gRS4gTU9SSU4uCj4gCj4+ICsJaGVscAo+PiArCSAgVGhpcyBt
b2R1bGUgcHJvdmlkZXMgc2VydmljZXMgc2ltaWxhciB0bwo+PiArCSAgdGhlIHBleHBlY3QgcHl0
aG9uIGxpYnJhcnksIHNvIHRvIHNwZWFrLAo+PiArCSAgc3Bhd24gYW5kIGNvbnRyb2wgaW50ZXJh
Y3RpdmUgYXBwbGljYXRpb25zLAo+PiArCSAgc3VjaCBhcyBzc2gsIHNmdHAgYW5kIG90aGVycy4K
Pj4gKwo+PiArY29tbWVudCAiYWV4cGVjdCBuZWVkcyBhIHRvb2xjaGFpbiB3aXRoIGR5bmFtaWMg
bGlicmFyeSBzdXBwb3J0Igo+PiArCWRlcGVuZHMgb24gQlIyX1NUQVRJQ19MSUJTCj4+IGRpZmYg
LS1naXQgYS9wYWNrYWdlL2FleHBlY3QvYWV4cGVjdC5oYXNoIGIvcGFja2FnZS9hZXhwZWN0L2Fl
eHBlY3QuaGFzaAo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAwMDAwMDAwMDAwLi40
YTQ3ZGE0MTIxCj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIvcGFja2FnZS9hZXhwZWN0L2FleHBl
Y3QuaGFzaAo+PiBAQCAtMCwwICsxLDQgQEAKPj4gKyMgRnJvbSBodHRwczovL2ZpbGVzLnB5dGhv
bmhvc3RlZC5vcmcvcGFja2FnZXMvZDAvZmEvNWJhMTZjYTE3YTcwOTgwYzdjMDllYTFjOGQ3NDhh
YWNlMWVlODc3MmQwMzJjNDgzYWRkMGUxN2QwY2Y2Cj4+ICtzaGEyNTYgIDU0YWJhZTMxZTdkM2I3
YWZiZmI3YTAxOTc1NjkwN2E4MWQ0MGJlNDQyMjc4OGJjY2YyMGQyZTgyYWQ2ZWY4YzggIGFleHBl
Y3QtMS42LjMudGFyLmd6Cj4+ICsjIExvY2FsbHkgY29tcHV0ZWQKPj4gK3NoYTI1NiAgN2JlMjZh
YmYzNWU1MzFhMjI2ZGM3NDJkMjM3OWQ0MmQzNzJjYjYxZjAyN2E2ZTI2NDc3YzBlMmYxYTAzYmZj
YiAgTElDRU5TRQo+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9hZXhwZWN0L2FleHBlY3QubWsgYi9w
YWNrYWdlL2FleHBlY3QvYWV4cGVjdC5tawo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRl
eCAwMDAwMDAwMDAwLi5jYTIwOTczMjhhCj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIvcGFja2Fn
ZS9hZXhwZWN0L2FleHBlY3QubWsKPj4gQEAgLTAsMCArMSwxMyBAQAo+PiArIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMKPj4gKyMKPj4gKyMgYWV4cGVjdAo+PiArIwo+PiArIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMKPj4gKwo+PiArQUVYUEVDVF9WRVJTSU9OID0gMS42LjMKPj4gK0FFWFBFQ1RfU0lU
RSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy9kMC9mYS81YmExNmNh
MTdhNzA5ODBjN2MwOWVhMWM4ZDc0OGFhY2UxZWU4NzcyZDAzMmM0ODNhZGQwZTE3ZDBjZjYKPj4g
K0FFWFBFQ1RfU0VUVVBfVFlQRSA9IHNldHVwdG9vbHMKPj4gK0FFWFBFQ1RfTElDRU5TRSA9IEdQ
TC0yLjAKPj4gK0FFWFBFQ1RfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKPj4gKwo+PiArJChldmFs
ICQocHl0aG9uLXBhY2thZ2UpKQo+PiAtLSAKPj4gMi4zMC4yCj4+Cj4+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKPj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4gCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
