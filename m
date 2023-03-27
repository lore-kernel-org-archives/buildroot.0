Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B585C7619A
	for <buildroot@archiver.kernel.org>; Mon, 27 Mar 2023 09:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E69DC409AA;
	Mon, 27 Mar 2023 09:24:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E69DC409AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T5hMqb0HNVcj; Mon, 27 Mar 2023 09:24:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4F8341675;
	Mon, 27 Mar 2023 09:24:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4F8341675
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2D2631BF40A
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 09:24:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 069DF60FEA
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 09:24:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 069DF60FEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id owxZ-8oX6xN6 for <buildroot@lists.busybox.net>;
 Mon, 27 Mar 2023 09:24:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CBFD60FE4
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0CBFD60FE4
 for <buildroot@buildroot.org>; Mon, 27 Mar 2023 09:24:19 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id ew6so33084159edb.7
 for <buildroot@buildroot.org>; Mon, 27 Mar 2023 02:24:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679909058;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G0zdy9pVXiFOE/MTYBCBwWbmtdsgDJ9BbXqzpYfBFgw=;
 b=eZxjKGmX4i3EXRu7DlmJnOUoUChbuc5IxxkLvoG/qZVJKh77Htq5dxq7cV9KLF6Q2u
 3k/IMGFRRgGJ6HUzbGYnVIG/j5CzIZnMiIuUkxbJLfx6yrlF0LGYLk+UU6qlNKUqC2qS
 sYk6JCN6fx81M97O5oOgEnHjwGC1EQ3qzt2ZI7DYC8oxUH5VA6RZxTPBFgrIB2m8xyo5
 XjUhpe23rVPN5FV/MGzPBiR8Ff5MZVcHnbmEi8aeJFkg11SGkxsjrZQatuewdgdvTK4o
 MORQAq1rcRmAzfNykL3fgHBA+/KAbO9Xv2iGzC9MdUDOzm27Hy/ke7/BSRyMS9p+hJXu
 DZ5w==
X-Gm-Message-State: AAQBX9eaa488xwbHzxg5Wg/DtQZmbBIKyHzfF571g8IqpRK4hZwzGaJ0
 ywUATe3eXighGhWxBhxRKYGq8g==
X-Google-Smtp-Source: AKy350aForx74SPnUYjZrL7yqo+Ar9OgDHATwHedUaPDsCGbYJSqg6N1CRBzsMbZkso5BQEnHg90GA==
X-Received: by 2002:a17:906:53cf:b0:8b2:8876:2a11 with SMTP id
 p15-20020a17090653cf00b008b288762a11mr12529861ejo.28.1679909057902; 
 Mon, 27 Mar 2023 02:24:17 -0700 (PDT)
Received: from [10.1.0.169] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 n3-20020a170906088300b009327ed171f2sm13069424eje.129.2023.03.27.02.24.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 02:24:17 -0700 (PDT)
Message-ID: <7adbbb39-0838-a789-fd7a-f05d08aad343@mind.be>
Date: Mon, 27 Mar 2023 11:24:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Vincent Fazio <vfazio@gmail.com>
References: <20230221172205.2450111-1-vfazio@xes-inc.com>
 <20230221172205.2450111-9-vfazio@xes-inc.com>
 <c9c5ba89-9be1-1fea-6ff1-2ecfc8234470@mind.be>
 <CAOrEah5ZgUc+tkXEbCtuyR15ohOy+s9Jqi8-SiKpxz1a5oW8sw@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <CAOrEah5ZgUc+tkXEbCtuyR15ohOy+s9Jqi8-SiKpxz1a5oW8sw@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1679909058;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=G0zdy9pVXiFOE/MTYBCBwWbmtdsgDJ9BbXqzpYfBFgw=;
 b=K+9qgyGVClHOIBrszAJ5GYGS98e4uM8yv/ykymlxem7xkDJKTUb692zgdafd1bDcfy
 fLLcvU0frG3zPl8N73WDbjjQRrLWZsnQdjjOs2eCStapxvrxnq0ZztgA0fwAZZcL+9Y0
 TGKLjFFmnkg4FlvRcyhj4tnU0/8iIPsbcISa0L3p+8P439K7Rcd0QxugxNw6VpMrCxuC
 pXP0o/THRFTvs3PNVOwIUzz6YFWqt9W+FHDI4rQHIzY6bkCMDSSNsTV6b/taUbReMWzM
 +iHA7Rn3G2RvQzqx/aPzdYaeI8OKj3/4BXk5VkrB4Rfu3XK2uDc8ykWGw1xhDZkgzCwO
 m3qg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=K+9qgyGV
Subject: Re: [Buildroot] [PATCH 09/15] package/libuio: migrate to new
 autopoint flag
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Vincent Fazio <vfazio@xes-inc.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Joris Lijssens <joris.lijssens@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyNi8wMy8yMDIzIDAwOjQ0LCBWaW5jZW50IEZhemlvIHdyb3RlOgo+IEFybm91dCwKPiAK
PiAKPiBPbiBTYXQsIE1hciAyNSwgMjAyMyBhdCAzOjM34oCvUE0gQXJub3V0IFZhbmRlY2FwcGVs
bGUgPGFybm91dEBtaW5kLmJlIAo+IDxtYWlsdG86YXJub3V0QG1pbmQuYmU+PiB3cm90ZToKW3Nu
aXBdCj4gICAgICDCoCBUaGlzIGxvb2tzIGFic29sdXRlbHkgYXBwbGljYWJsZSB1cHN0cmVhbSwg
c28gcGxlYXNlIGNyZWF0ZSBhIFBSLgo+IAo+IAo+IFRoZXJlJ3MgYSBjb3VwbGUgb2YgcmVhc29u
cyBJIGRpZCBub3QgZG8gdGhpczoKPiAKPiAxLiBUaGUgdXBzdHJlYW0gcmVwbyBkb2VzIG5vdCBs
b29rIG1haW50YWluZWQgYW5kIGhhcyBtb3ZlZCBVUkxzIGZyb20gd2hhdCB3ZSAKPiBoYXZlIGlu
IHRoZSBtayBmaWxlIGh0dHBzOi8vZ2l0aHViLmNvbS9taXNzaW5nbGlua2VsZWN0cm9uaWNzL2xp
YnVpbyAKPiAoSSBtZWFudCB0byBmaXggdGhhdCkKCiAgSGFyZGx5IGEgZ29vZCByZWFzb24gbm90
IHRvIHNlbmQgaXQgdG8gdGhlIG5ldyBsb2NhdGlvbiA6LSkKCj4gMi4gSXQgZG9lcyBub3QgYXBw
bHkgdXBzdHJlYW0gc2luY2UgdGhlaXIgaW4tdHJlZSBgYXV0b2dlbi5zaGAgY3JlYXRlcyB0aGUg
Cj4gbWlzc2luZyBmaWxlLiBTZWUgCj4gaHR0cHM6Ly9naXRodWIuY29tL21pc3NpbmdsaW5rZWxl
Y3Ryb25pY3MvbGlidWlvL2Jsb2IvbWFzdGVyL2F1dG9nZW4uc2ggCj4gQWRkaW5nIGEgcGFja2Fn
ZSBzcGVjaWZpYyBjb25maWd1cmUgY29tbWFuZCB0byBydW4gYXV0b2dlbiBvciBtaW1pYyBpdHMg
YmVoYXZpb3IgCj4gc2VlbWVkIG92ZXJraWxsLCB0aGUgImZvcmVpZ24iIHBhdGNoIGxldmVyYWdp
bmcgYXV0b3Rvb2xzIGluZnJhIHNlZW1lZCB0aGUgCj4gY2xlYW5lc3Qgd2F5IHRvIGZpeCB0aGlz
CgogIFRoaXMgaXMgYSBnb29kIHJlYXNvbiB0aG91Z2guIEluIHRoZSBmdXR1cmUsIHBsZWFzZSBk
b2N1bWVudCBzdWNoIGNvbmNlcm5zIGluIAp0aGUgY29tbWl0IG1lc3NhZ2Ugb2YgdGhlIHBhdGNo
IGl0c2VsZi4KCiAgSSByZWFsbHkgdGhpbmsgd2Ugc2hvdWxkIGFkZCBhIGNoZWNrLXBhY2thZ2Ug
dGhpbmcgdG8gbWFrZSBzdXJlIHRoYXQgZXZlcnkgCnBhdGNoIGhhcyBhbiBVcHN0cmVhbTogbGlu
ZSwgbGlrZSB3ZSBhbHJlYWR5IGVuZm9yY2UgdGhlIFNvQi4KCiAgUmVnYXJkcywKICBBcm5vdXQK
Cgo+IAo+ICAgICAgwqAgUmVnYXJkcywKPiAgICAgIMKgIEFybm91dAo+IAo+IAo+IFRoYW5rcyBm
b3IgbG9va2luZyBhdCB0aGlzIHNlcmllcyEKPiAKPiAtVmluY2VudAo+IAo+ICAgICAgPiArCj4g
ICAgICA+ICsgQU1fQ09ORklHX0hFQURFUihjb25maWcuaCkKPiAgICAgID4gKwo+ICAgICAgPiAr
LS0KPiAgICAgID4gKzIuMjUuMQo+ICAgICAgPiArCj4gICAgICA+IGRpZmYgLS1naXQgYS9wYWNr
YWdlL2xpYnVpby9saWJ1aW8ubWsgPGh0dHA6Ly9saWJ1aW8ubWs+Cj4gICAgIGIvcGFja2FnZS9s
aWJ1aW8vbGlidWlvLm1rIDxodHRwOi8vbGlidWlvLm1rPgo+ICAgICAgPiBpbmRleCBhMDI4NTI3
N2FiLi5kNTAxOWFmNTk0IDEwMDY0NAo+ICAgICAgPiAtLS0gYS9wYWNrYWdlL2xpYnVpby9saWJ1
aW8ubWsgPGh0dHA6Ly9saWJ1aW8ubWs+Cj4gICAgICA+ICsrKyBiL3BhY2thZ2UvbGlidWlvL2xp
YnVpby5tayA8aHR0cDovL2xpYnVpby5taz4KPiAgICAgID4gQEAgLTE0LDcgKzE0LDcgQEAgTElC
VUlPX0xJQlMgPSAkKFRBUkdFVF9OTFNfTElCUykKPiAgICAgID7CoCDCoExJQlVJT19JTlNUQUxM
X1NUQUdJTkcgPSBZRVMKPiAgICAgID4KPiAgICAgID7CoCDCoCMgRmV0Y2hlZCBmcm9tIGdpdGh1
Yiwgbm8gcHJlLWdlbmVyYXRlZCBjb25maWd1cmUgc2NyaXB0IHByb3ZpZGVkCj4gICAgICA+IC1M
SUJVSU9fR0VUVEVYVElaRSA9IFlFUwo+ICAgICAgPiArTElCVUlPX0FVVE9QT0lOVCA9IFlFUwo+
ICAgICAgPsKgIMKgTElCVUlPX0FVVE9SRUNPTkYgPSBZRVMKPiAgICAgID4KPiAgICAgID7CoCDC
oCMgQXZvaWQgYnVpbGQgaXNzdWUgd2hlbiBtYWtlaW5mbyBpcyBtaXNzaW5nCj4gCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
