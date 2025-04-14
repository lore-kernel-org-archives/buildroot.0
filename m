Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F2B7C369A2
	for <buildroot@archiver.kernel.org>; Mon, 14 Apr 2025 18:12:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 995CD60BC6;
	Mon, 14 Apr 2025 18:12:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OJdg6krKNfvM; Mon, 14 Apr 2025 18:12:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B637760AC1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B637760AC1;
	Mon, 14 Apr 2025 18:12:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9023A108
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 18:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 757D08125D
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 18:12:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dk9eavXpFsoY for <buildroot@buildroot.org>;
 Mon, 14 Apr 2025 18:12:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=rgallaispou@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4DD2A80DBD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DD2A80DBD
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4DD2A80DBD
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 18:12:04 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43cf680d351so33101515e9.0
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 11:12:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744654322; x=1745259122;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=za+t5bI0MJXX2QcevBrN/WCx8FKct1Z92ieAU6yUAlk=;
 b=ZlhvzrNdhRP3a5yhhWylXgwhG2pMEgKqWPB8Mm9fiFOGcg34TrjNsPmNtD6+5jzpKh
 60sWQ8kj8R2nZCCinxAnfa3A6IJkD+sNfcaC3Pr18b14F9kplvdH0j2HkwpNj7+ZDQeH
 f5ID4T0d49kkikflz10sePrpTlhUGEpWYdx1sIb9eoizrn6E1T7lyzv7HtR9lNAmMESH
 fW07D8C6aMpdtZKqkRAYi8K3YU6G1Zk7xAnvwHT4dWrRieWcY8m5ss2xx3NoOG/+8jeS
 uuFFjA6DwA08aIaM4Wu6jBsHLCA7abNADABTdU46O3cnAlq4a7xs+dP2kvt1twnPbSQl
 Juwg==
X-Gm-Message-State: AOJu0YwxpZUP7QUIq7mWZpG6ey9ilSIltgZePcHyKebWL7D2H5FUFZds
 PXbdgkveZZxMU8BWIR4wclF/jHCEvr8ZlqqLmQgl3R13K0GYdXI+FSI6aw==
X-Gm-Gg: ASbGnctloEeIt2xIgNyRjulM5e98igp9CsvxpElIjtqZqXIMB0AiiwnkOnsd6yzwuDh
 amgym/sh4mSmL29bzHBMCoauust/a6xSj/yqskFUGtchVORQRVLKMz0yX45ohFilvDzwYCjYpHo
 P9qfJmudp7VASyeiiJzrpEpZN18aQLJcdlH5L0TvZRjl991KUkRwjFV8hmkQDTjMVTdOUo5ja+m
 ZVdvytz23cTeJbcBVNW2qMymtlri8R2o2cfWXrt7jpoGtLl6SoyjoyBodZ0lpM87Guk9HIy/C1b
 G8n0essjUn3B3bbCE+QuQUDCB7lxjtq4WRo4V8C9mrRyJEZMfDf9oO7t1a9zypG7nOhBBXEIWI7
 7ux1UnXz7Ew==
X-Google-Smtp-Source: AGHT+IFuErAJri6kHwakLY35m1+URrJ01UbMrdgQ/hKiN+9Za1fZcV1qLXsh6jnTXmfZPasBWV98sw==
X-Received: by 2002:a5d:5f55:0:b0:39c:1efb:f7c4 with SMTP id
 ffacd0b85a97d-39edc32fef0mr249806f8f.25.1744654321965; 
 Mon, 14 Apr 2025 11:12:01 -0700 (PDT)
Received: from ?IPV6:2001:861:3385:e20:6384:4cf:52c5:3194?
 ([2001:861:3385:e20:6384:4cf:52c5:3194])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f2338db88sm185987355e9.6.2025.04.14.11.12.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 11:12:01 -0700 (PDT)
Message-ID: <4e68748f-c153-46e4-b915-a332ef487be8@gmail.com>
Date: Mon, 14 Apr 2025 20:12:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Bartosz Bilas <b.bilas@grinn-global.com>,
 Marleen Vos <marleen.vos@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-amarula@amarulasolutions.com
References: <20250411085817.3269572-1-dario.binacchi@amarulasolutions.com>
 <b4f47833-1907-4270-96b3-9f32c223cdbd@gmail.com>
 <CABGWkvpnK4+bxAQGBRhFz1tnkRec0ar5GtuJJmf6Bc+3eZY==w@mail.gmail.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>
In-Reply-To: <CABGWkvpnK4+bxAQGBRhFz1tnkRec0ar5GtuJJmf6Bc+3eZY==w@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744654322; x=1745259122; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=za+t5bI0MJXX2QcevBrN/WCx8FKct1Z92ieAU6yUAlk=;
 b=Azwuohm7/HEVb3BdESFbJsJ4L2VrTW3/njM+klo0KMLlDKaa0pYNXHmTQZciWzu1ax
 OMTFzFTFZwguaWM5bQdLEbaLV92/JriB1kK1b9LyhXTuMur1qiexaAkZsP39pQoMZoT7
 t4dqAydIQrc6+SDHP3go3AirOlEoDn8mN+fV3P48WrXa3BEpkRmaqhXOUTcsbwWrHjMS
 tb2zDjxrljMn9hwqK0UevbXrFZ5kVdZA+sFIpboD6DFgXfOljJY2PNoV+hEdXyM8EfyZ
 b+X0Fbw+ciEWXdmaqoS3YF1NmHKhamGlZarceEUSqcTYDiPNXQJX66IXj8z+yTLcxrKU
 N3vg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Azwuohm7
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/stm32mp157*_dk*: bump TF-A
 to 2.10, Linux to 6.12.22 and U-Boot to 2025.04
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpMZSAxMy8wNC8yMDI1IMOgIDEyOjM3LCBEYXJpbyBCaW5hY2NoaSBhIMOpY3JpdMKgOgo+IEhl
bGxvIFJhcGhhZWwsCj4gCj4gT24gRnJpLCBBcHIgMTEsIDIwMjUgYXQgNDoxMuKAr1BNIFJhcGhh
w6tsIEdhbGxhaXMtUG91Cj4gPHJnYWxsYWlzcG91QGdtYWlsLmNvbT4gd3JvdGU6Cj4+Cj4+Cj4+
Cj4+IExlIDExLzA0LzIwMjUgw6AgMTA6NTgsIERhcmlvIEJpbmFjY2hpIGEgw6ljcml0IDoKPj4+
IFRoZSBwYXRjaCBidW1wcyBBcm0gVHJ1c3RlZCBGaXJtd2FyZSAoVEYtQSkgdG8gdmVyc2lvbiAy
LjEwIExUUyB0aGUgTGludXgKPj4+IGtlcm5lbCB0byB2ZXJzaW9uIDYuMTIuMjIgYW5kIFUtQm9v
dCB0byB2ZXJzaW9uIDIwMjUuMDQuCj4+PiBUaGUgbmV3IHZlcnNpb24gb2YgVS1Cb290IGhhcyBh
ZGRlZCBFRkkgQ2Fwc3VsZSBzdXBwb3J0LCB3aGljaCBkZXBlbmRzIG9uCj4+PiBHbnVUTFMsIHRo
dXMgcmVxdWlyaW5nIHRoZSBhY3RpdmF0aW9uIG9mIEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNfR05V
VExTLgo+Pj4KPj4+IFRlc3RlZCBvbiBTVE0zMk1QMTU3Qy1ESzIgRGlzY292ZXJ5IEJvYXJkLgo+
Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFy
dWxhc29sdXRpb25zLmNvbT4KPj4KPj4gSGkgRGFyaW8sCj4+Cj4+IFRoaXMgcGF0Y2ggdGVzdHMg
ZmluZSBvbiBTVE0zMk1QMTUuICBIb3dldmVyIGl0IGJyZWFrcyB0aGUgYnVpbGQgb24KPj4gU1RN
MzJNUDEzLgo+IAo+IEFzIGZhciBhcyBJIGtub3csIG15IHBhdGNoIGRvZXNuJ3QgYnJlYWsgdGhl
IFNUTTMyTVAxMyBjb25maWd1cmF0aW9uIGJ1aWxkLgo+IEluc3RlYWQsIEkgbm90aWNlZCB0aGF0
IHRoaXMgY29uZmlndXJhdGlvbiBzaG93cyBoYXNoIGVycm9ycyBmb3IgT1AtVEVFLgo+IEnigJl2
ZSBzZW50IGEgcGF0Y2ggZm9yIHRoYXQ6Cj4gCj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9y
Zy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDI1MDQxMzA5NTkwMC4xOTQwMzczLTEtZGFyaW8u
YmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20vCj4gCj4gQ291bGQgeW91IGxldCBtZSBrbm93
IHdoYXQga2luZCBvZiBlcnJvciB5b3Ugc2F3PwoKVGhpcyBpcyByZWxhdGVkIHRvIHRoZSAib3B0
ZWUtb3MiIGFuZCAib3B0ZWUtY2xpZW50IiBoYXNoIGVycm9ycy4KCkFjdHVhbGx5LCBhZnRlciBm
dXJ0aGVyIGRpZ2dpbmcsIHlvdXIgcGF0Y2ggaXMgbm90IGZhdWx0eSBhdCBhbGwuICBUaGUgCmJ1
ZyB3YXMgaW50cm9kdWNlZCB3aGVuIHVwc3RyZWFtaW5nIHRoZSBuZXcgZGVmY29uZmlnLiAgVGhp
cyBvcHRpb24gd2FzIAppbXBsZW1lbnRlZCBpbiBiZXR3ZWVuIHJldmlzaW9uIDIgYW5kIDMuICBB
dCB0aGUgdGltZSBvcHRlZSB3YXMgCmRvd25sb2FkZWQgdmlhIHRoZSB0YXJiYWxsLCBhbmQgdGhl
biBpdCB3YXMgY2hhbmdlZCB0byB0aGUgZ2l0IG1ldGhvZC4gCk5vdCBsb25nIGFmdGVyIHRoZSB2
NCwgdGhlIEJSMl9UQVJHRVRfT1BURUVfT1NfQ1VTVE9NX1ZFUlNJT04gb3B0aW9uIHdhcyAKYWRk
ZWQsIG9uIHdoaWNoIEkgcmViYXNlZCBmb3IgdGhlIHY1LCBhbmQgZm9yZ290IHRvIHVwZGF0ZSB0
aGUgaGFzaGVzLgoKSSBndWVzcyBpdCB3b3JrZWQgb24gbXkgbGFwdG9wIGV2ZW4gdGhvdWdoIHRo
ZSBjb25maWcgd2FzIGJyb2tlbiBiZWNhdXNlIApJIGRpZCBub3QgY2xlYW5lZCB0aGUgZGwvIGZv
bGRlci4gIExlc3NvbiBsZWFybmVkIGFzIGl0IHR1cm5zIG91dCBpdCAKd2FzLCBpbiBmYWN0LCBt
eSBtaXN0YWtlLgoKPiAKPj4gTm93IHRoYXQgU1RNMzJNUDE1IGFuZCBTVE0zMk1QMTMgaGF2ZSBi
ZWVuIHRpZWQgdGhyb3VnaCB0aGlzCj4+IHBhdGNoWzFdIGFuZCB0aGUgaW50cm9kdWN0aW9uIG9m
IHRoZSBsYXRlciBib2FyZCBbMl0sIExpbnV4IGFuZCBVLUJvb3QKPj4gY29tcG9uZW50cyBuZWVk
IHRvIGJlIHVwZGF0ZWQgb24gYm90aCBwbGF0Zm9ybXMgYXQgdGhlIHNhbWUgdGltZS4KPiAKPiBB
cyBmYXIgYXMgSSBrbm93LCBJIGRvbid0IHRoaW5rIGl0J3MgbmVjZXNzYXJ5Lgo+IERpZmZlcmVu
dCBzaGEyNTZzdW1zIGNhbiBiZSB1c2VkIHdpdGhpbiB0aGUgc2FtZSBmaWxlLgpJbmRlZWQgeW91
IGFyZSByaWdodC4gIEkgcmVhZCB0aGUgZG9jdW1lbnRhdGlvbiBtb3JlIHRob3JvdWdobHkgYW5k
IApCdWlsZHJvb3QgbG9va3MgZm9yICJvbmUgb3IgbW9yZSIgaGFzaGVzLiAgVGhlIGRvd25sb2Fk
ZWQgZmlsZXMgdGhhdCAKZG9lcyBub3QgbWF0Y2ggdGhlIGhhc2hlcyBnZXQgZGVsZXRlZC4gIFNv
IHRoaXMgbWVhbnMgdGhhdCBmb3IgYSBzaGFyZWQgCmhhc2ggZmlsZSBiZXR3ZWVuIG11bHRpcGxl
IGNvbmZpZ3MsIHNldmVyYWwgdmVyc2lvbnMgb2YgdGhlIHBhY2thZ2UgY2FuIApjb2V4aXN0LgoK
PiBBbnl3YXksIEnigJl2ZSBhbHNvIHVwZGF0ZWQgdGhlIFNUTTMyTVAxMyBjb25maWd1cmF0aW9u
IHJlZ2FyZGluZwo+IFUtQm9vdCBhbmQgTGludXggYXMgeW91IHJlcXVlc3RlZC4KPiAKPiBodHRw
czovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjUwNDEz
MDk1OTAwLjE5NDAzNzMtMi1kYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbS8KCk1h
bnkgdGhhbmtzLCBJIHdpbGwgcmV2aWV3IHRoZSBzZXJpZSBwcm9tcHRseS4KClJlZ2FyZHMsClJh
cGhhw6tsPgo+IFRoYW5rcyBhbmQgcmVnYXJkcywKPiBEYXJpbwo+IAo+Pgo+PiBCYXNlZCBvbiB5
b3VyIGNoYW5nZXMsIEkgdGVzdGVkIFRGLUEgMi4xMiArIFUtQm9vdCAyMDI1LjA0ICsgTGludXgK
Pj4gNi4xMi4yMiBvbiBTVE0zMk1QMTMgYW5kIGl0IGRpZCBhbHJpZ2h0Lgo+Pgo+PiBDYW4geW91
IHVwZGF0ZSB0aGUgU1RNMzJNUDEzIGNvbmZpZyA/IERvaW5nIHNvIHdpbGwgYWxzbyByZW1vdmUg
dGhlCj4+IHNlY29uZCBsaW51eC5oYXNoIGFuZCB1Ym9vdC5oYXNoLgo+IAo+Pgo+PiBUaGFua3Mg
OikKPj4KPj4gUmVnYXJkcywKPj4gUmFwaGHDq2wKPj4KPj4KPj4gWzFdCj4+IGh0dHBzOi8vZ2l0
LmJ1aWxkcm9vdC5uZXQvYnVpbGRyb290L2NvbW1pdC8/aWQ9ZjIxZGIyYmQ4M2JmMzA3M2E1MGI4
YmNkNzlhZjZlN2FlZDZmYjAwMAo+PiBbMl0KPj4gaHR0cHM6Ly9naXQuYnVpbGRyb290Lm5ldC9i
dWlsZHJvb3QvY29tbWl0Lz9pZD05ODAyZmEwYjViYWEwYjY4ZmJjNjdiYzA3YTJlNDIwNjAxMmY3
MzA2Cj4gCj4gCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
