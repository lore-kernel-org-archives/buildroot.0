Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA79C2BA1A
	for <buildroot@archiver.kernel.org>; Wed, 19 Jun 2024 20:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6939941580;
	Wed, 19 Jun 2024 20:09:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gSxfSejoB5Xa; Wed, 19 Jun 2024 20:09:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D478C40A70
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D478C40A70;
	Wed, 19 Jun 2024 20:09:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3311E1BF846
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 20:09:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2DDAB605FA
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 20:09:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rhQAK4521wAW for <buildroot@lists.busybox.net>;
 Wed, 19 Jun 2024 20:09:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1C6CB605C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C6CB605C0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1C6CB605C0
 for <buildroot@buildroot.org>; Wed, 19 Jun 2024 20:09:49 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4217990f997so1455065e9.2
 for <buildroot@buildroot.org>; Wed, 19 Jun 2024 13:09:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718827788; x=1719432588;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DZ0olJKOsoi0a4uH9UJSW2PfJrKuFMz2OOVcjaX/oc4=;
 b=v9IR+POt2JYCqEFP6T7GYrwG+Pqqc5OWS/sxeMkoZRJ/BgmyMNgHISfbLCmjSGstPh
 QZUxts31fzvBHYi59AvX6RyXuWrC9Tk6P6iK2/u19mE3/+qAeAQRKd8DpF6tdzY90B8S
 l8xwBGGOD/5WyOqS/ndj/rUG9/ZISfSRH4gaGmsJR+I8btZrCmqcRPfD4rASLhzoGZmE
 aMFXNZqE338nOntLrQ9GjGmOurpx5W4VeXYP7i3Buwgeh8e7EjJRuDZU7LOmbvKrggql
 CJWSbJn006SK62JezifTNtGWVKxS3tHrOyQpORtqveCZ9YbZoDfYKiniY+E1Om0Tk+HN
 D3JQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIzaoyfG75p4suZl6aWjq/qtWi8RcCZZCxViMG6ClF1Ijw1NhM1aJxHEawYPSvouiBOtOstnfzQjRV31gvYywZ7cVNJyyk/A==
X-Gm-Message-State: AOJu0Yy+B+dCzrAcWU1Fevdp+aLKeFkKu7lC1//82Wzu870mmYYjJ78E
 NGQJFeN1Nsnz3Wq3+gjejEeztLX4smOO5yMkEIQ4L8J7cq8vhnSByrvNqozfdxU=
X-Google-Smtp-Source: AGHT+IHhaIfruEg1u7Ai+8ftO+1PuwwOK1trBYMMrn0j/akHpu33PPKtGunEZvzJyeYuxnSjdCw+eg==
X-Received: by 2002:a05:600c:2252:b0:424:798a:f7f2 with SMTP id
 5b1f17b1804b1-424798afd71mr15973385e9.3.1718827787306; 
 Wed, 19 Jun 2024 13:09:47 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4247d0b63b5sm1236615e9.7.2024.06.19.13.09.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jun 2024 13:09:46 -0700 (PDT)
Message-ID: <502a1682-9d4e-4856-8a57-53ee20f89c7d@mind.be>
Date: Wed, 19 Jun 2024 22:09:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Jon_Henrik_Bj=C3=B8rnstad?= <jonhenrik@qbee.io>,
 buildroot@buildroot.org
References: <20240612110944.458745-1-jonhenrik@qbee.io>
Content-Language: en-GB
In-Reply-To: <20240612110944.458745-1-jonhenrik@qbee.io>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1718827788; x=1719432588; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DZ0olJKOsoi0a4uH9UJSW2PfJrKuFMz2OOVcjaX/oc4=;
 b=EwmJiWhm05gsJML6dGw0bgfMPFkwQapbITGWVFHYU8+4kk1WhGzI0QlkaHY9yZYzD1
 GK2jniOuOcwfgn6Lf/56a/bLN2h4+pyk4kIjAdFBiYkdyje+k4lXsG050AXcJl/Kcwbd
 JJFDzkBqjCkWAw9shY9juWk+hE0NARKnhDHjPvGLrTmxrdC+en+u5g2PZiOmkRoGTvA5
 4Gf4rnExqGFbm3u9tTRyo6tykUb9bXCtc3lu6VfpquuCn5iG4IIIWVi/S/shuDd1d4AB
 SzKYpbTfag/a97TFGxzaUrXAbeWuC0oQlLSohPUB1jR97X38dWgnZamr+yIMz8N/7Ydg
 As0g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=EwmJiWhm
Subject: Re: [Buildroot] [PATCH 1/1] package/qbee-agent: bump version to
 2024.23
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxMi8wNi8yMDI0IDEzOjA5LCBKb24gSGVucmlrIEJqw7hybnN0YWQgdmlhIGJ1aWxkcm9v
dCB3cm90ZToKPiBTaWduZWQtb2ZmLWJ5OiBKb24gSGVucmlrIEJqw7hybnN0YWQgPGpvbmhlbnJp
a0BxYmVlLmlvPgoKICBBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKICBXaGlsZSB0ZXN0aW5n
IHRoaXMgcGF0Y2gsIEkgbm90aWNlZCB0aGF0IHRoZSByZWNlbnQgZ28tc3JjIHJld29yayBmb3Jn
b3QgdG8gCnNlbGVjdCBCUjJfUEFDS0FHRV9IT1NUX0dPIGZvciBxYmVlLWFnZW50LCBzbyBJIHB1
c2hlZCBhIHBhdGNoIGZpeGluZyB0aGF0IGFzIHdlbGwuCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+
IC0tLQo+ICAgcGFja2FnZS9xYmVlLWFnZW50L3FiZWUtYWdlbnQuaGFzaCB8IDIgKy0KPiAgIHBh
Y2thZ2UvcWJlZS1hZ2VudC9xYmVlLWFnZW50Lm1rICAgfCA0ICsrLS0KPiAgIDIgZmlsZXMgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9w
YWNrYWdlL3FiZWUtYWdlbnQvcWJlZS1hZ2VudC5oYXNoIGIvcGFja2FnZS9xYmVlLWFnZW50L3Fi
ZWUtYWdlbnQuaGFzaAo+IGluZGV4IDhlOWU3MjMwZWEuLjliZTY0MmVmNmYgMTAwNjQ0Cj4gLS0t
IGEvcGFja2FnZS9xYmVlLWFnZW50L3FiZWUtYWdlbnQuaGFzaAo+ICsrKyBiL3BhY2thZ2UvcWJl
ZS1hZ2VudC9xYmVlLWFnZW50Lmhhc2gKPiBAQCAtMSwzICsxLDMgQEAKPiAgICMgTG9jYWxseSBj
YWxjdWxhdGVkCj4gLXNoYTI1NiAgZDMyOWQ2ZDFjODg1ZWM0ZDQxMGFiOGM1ZjkzMzIwYWI2MDNj
ZWY4NjAzMTFhNmIzOTJlZGQ1YjkwMzAzOWE4MSAgcWJlZS1hZ2VudC0yMDI0LjA5LWdvMi50YXIu
Z3oKPiArc2hhMjU2ICAxZjc3NDQyMTg2ZjI5ZmE3YTBiZGYxMzgyMzM0Y2IwNWY0OGFmM2YxYjYw
NmU2MmIzMTZmMGE5OTYxOGI1YTlmICBxYmVlLWFnZW50LTIwMjQuMjMtZ28yLnRhci5nego+ICAg
c2hhMjU2ICAwMmQwN2Q5NmJlOTllYjA0MmIwMWJhNjUwMDc5YTQ0MGNlMjZhNzhjNWUwZTFlODA2
MGMzM2E4YzllMjAwNDA0ICBMSUNFTlNFCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcWJlZS1hZ2Vu
dC9xYmVlLWFnZW50Lm1rIGIvcGFja2FnZS9xYmVlLWFnZW50L3FiZWUtYWdlbnQubWsKPiBpbmRl
eCAzMDIxOWVlYmRjLi5hYmE5ZWRiODI0IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcWJlZS1hZ2Vu
dC9xYmVlLWFnZW50Lm1rCj4gKysrIGIvcGFja2FnZS9xYmVlLWFnZW50L3FiZWUtYWdlbnQubWsK
PiBAQCAtNSwxMiArNSwxMiBAQAo+ICAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAgIAo+ICAg
IyBrZWVwIFFCRUVfQUdFTlRfQ09NTUlUX0lEIGluIHN5bmMgd2hlbiB1cGRhdGluZwo+IC1RQkVF
X0FHRU5UX1ZFUlNJT04gPSAyMDI0LjA5Cj4gK1FCRUVfQUdFTlRfVkVSU0lPTiA9IDIwMjQuMjMK
PiAgIFFCRUVfQUdFTlRfU0lURSA9ICQoY2FsbCBnaXRodWIscWJlZS1pbyxxYmVlLWFnZW50LCQo
UUJFRV9BR0VOVF9WRVJTSU9OKSkKPiAgIFFCRUVfQUdFTlRfTElDRU5TRSA9IEFwYWNoZS0yLjAK
PiAgIFFCRUVfQUdFTlRfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKPiAgIAo+IC1RQkVFX0FHRU5U
X0NPTU1JVF9JRCA9IGMzMGQ0M2I4ZTY0Y2ZlZjk2MGNlZTk0NzViNThhZTA4M2U0YWQyNDYKPiAr
UUJFRV9BR0VOVF9DT01NSVRfSUQgPSAzMjE5YzE3NzMwZWFiNGM4MDU5ODQ5NDczMmI0YmVkNGM0
YzE4YjUxCj4gICAKPiAgIFFCRUVfQUdFTlRfR09NT0QgPSBnby5xYmVlLmlvL2FnZW50Cj4gICAK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
