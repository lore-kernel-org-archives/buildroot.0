Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADCBC54E41
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 13:43:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 571D441845;
	Thu, 29 Feb 2024 13:43:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nFvJv8ihFYSs; Thu, 29 Feb 2024 13:43:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52B1341846
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52B1341846;
	Thu, 29 Feb 2024 13:43:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7980B1BF33A
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 13:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7303F8229F
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 13:43:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id klCr4bSGiWO3 for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 13:43:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::230; helo=mail-lj1-x230.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0BFBF8225E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BFBF8225E
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0BFBF8225E
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 13:43:50 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2d28e465655so12225351fa.0
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 05:43:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709214228; x=1709819028;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kEl6B2XMGgbGxyIqKJGrjTujOnSNbpUNR5HG4WXNEO8=;
 b=FeNjEWIFKvnbSC8zWkcPn7dFMw0QmzBPCVms42GCGPVd0uAWzwQU5NKnq3ep0RdN0U
 0fySCqrETfLmMMiJ9yh4Przyy1mDP6po5Tlh4S9ZAqbt584UlNonhyWMR4dQGI4sZqUl
 7OrHdDnaiDabYNDFHAZVl0MyvnNcVNx8EARF7p5aLjKPr+YWBWpsbhjlleU00FjwwzB5
 Vt+uZWlXgM/CjxviZ7rQnbCoMNoXiaPnF6Mckk6Jz+QiW+lHMLJb8qmJr/zcLzpu19er
 tccHxVmusST0As6UOqg/bbzoBrT/WuBuzG/1pnaZSCjLhwJdvfUlVeLmr+h+oUDKTFOQ
 ldVg==
X-Gm-Message-State: AOJu0YySO393d+2p02rWLhIXe9nYDVkgH5Ht2uMulKpUmowdWWb3yGbJ
 8YqKpgO1kmjXMnmj76nok+M0zS7yXez1Y9Hzjpdv+BABQF4LtwEZ+7EX1TMKLNA=
X-Google-Smtp-Source: AGHT+IFzi/mOfzXw/UzdaoFkDU8lkgJAtEi065zctLJ6CPqaIBIvNHOT6Gg41OAA6apf2gKmSKit9w==
X-Received: by 2002:a05:6512:2216:b0:512:b6b4:73a4 with SMTP id
 h22-20020a056512221600b00512b6b473a4mr1877004lfu.9.1709214228230; 
 Thu, 29 Feb 2024 05:43:48 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 h3-20020adfa4c3000000b0033dd2a7167fsm1817702wrb.29.2024.02.29.05.43.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 05:43:47 -0800 (PST)
Message-ID: <a8fa2870-4d82-48df-b8ef-03c61a1ba81c@smile.fr>
Date: Thu, 29 Feb 2024 14:43:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: yann.morin@orange.com
References: <20240229131108.363533-1-romain.naour@smile.fr>
 <ZeCIDJkn+SbXgndh@tl-lnx-nyma7486-2>
Content-Language: en-US
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <ZeCIDJkn+SbXgndh@tl-lnx-nyma7486-2>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1709214228; x=1709819028;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kEl6B2XMGgbGxyIqKJGrjTujOnSNbpUNR5HG4WXNEO8=;
 b=P8faeG5z9+i3wGY3oOnkGnJUaaOKf5/JuwfrPeQ9JKCjaBYSvbBkzGntYRv+IpCntB
 luf2ghoD74evTI1Qp5wE+ymDe1Ssi3nYqj536GRtZyvxYWR48HwKAs94uhZ4ePfQJ+EH
 ycxtC34qbzQS0NqoSv4wa8lUKIJCNcNq7zFxezLCIvVZrgdhTJmRzBej3NYEzIQ4ekbs
 NZgV5W2biehGgBkK6lSDjxTuPd7E/qt3iegt0mPc0PFOlWbI+BNiXz7Ee89pZfF9agZq
 9wiM90yWSRgWiONLDnEHYtM7CIMCiHj5x8CgWCE20bM9x3+sNoyjdM988EwJw4ds4Sfh
 IBig==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=P8faeG5z
Subject: Re: [Buildroot] [PATCH 1/2] package/rust: use host libraries from
 HOST_DIR
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMjkvMDIvMjAyNCDDoCAxNDozNSwgeWFubi5tb3JpbkBvcmFuZ2UuY29tIGEgw6ljcml0wqA6
Cj4gcm9tYWluLCBBbGwsCj4gCj4gT24gMjAyNC0wMi0yOSAxNDoxMSArMDEwMCwgUm9tYWluIE5h
b3VyIHNwYWtlIHRodXNseToKPj4gaG9zdC1ydXN0IHBhY2thZ2UgZGVwZW5kcyBvbiBzZXZlcmFs
IGhvc3QgcGFja2FnZXMgdG8gcHJvdmlkZSB0b29scyBhbmQKPj4gbGlicmFyaWVzIGJ1dCBpdCBk
b2Vzbid0IHRha2UgaW50byBhY2NvdW50IEhPU1RfRElSIHdoaWxlIGJ1aWxkaW5nIHJ1c3RjCj4+
IGNvbXBpbGVyLiBJbmRlZWQsIHJ1c3RjIG5lZWRzIHpsaWIgYW5kIGZhaWwgdG8gbGluayBpZiB6
bGliIGlzIG5vdAo+PiBpbnN0YWxsZWQgb24gdGhlIGhvc3QuCj4+Cj4+ICAgZXJyb3I6IGNvdWxk
IG5vdCBjb21waWxlIGBydXN0Y19kcml2ZXJgIChsaWIpIGR1ZSB0byBwcmV2aW91cyBlcnJvcgo+
Pgo+PiBJZiB6bGliIGlzIGluc3RhbGxlZCBvbiB0aGUgaG9zdCwgd2UgY2FuIG5vdGljZSBpdCB3
aXRoIGxkZCB0b29sICh3aGlsZQo+PiBpdCBzaG91bGQgYmUgbGlua2VkIHdpdGggdGhlIG9uZSBw
cm92aWRlZCBieSBCdWlsZHJvb3QgaG9zdC16bGliKS4KPj4KPj4gICBsZGQgWy4uLl1UZXN0UnVz
dC9ob3N0L2Jpbi9ydXN0Ywo+PiAgIGxpYnouc28uMSA9PiAvbGliNjQvbGliei5zby4xCj4+Cj4+
IFByb3ZpZGUgSE9TVF9MREZMQUdTIHVzaW5nIGxsdm0ubGRmbGFncyBpbiBjb25maWcudG9tbC4K
Pj4gKEhPU1RfTERGTEFHUyBwcm92aWRlIC1MJChIT1NUX0RJUikvbGliIC1XbCwtcnBhdGgsJChI
T1NUX0RJUikvbGliKQo+Pgo+PiBXaXRoIHRoYXQgZml4ZWQsIHJ1c3RjX2RyaXZlciBsaW5rIHdp
dGggbGlieiBmcm9tIEhPU1RfRElSIGJ1dCB0aGUKPj4gaG9zdC1ydXN0IGJ1aWxkIHN0aWxsIGZh
aWwgbGF0ZXIgZHVlIHRvIGFub3RoZXIgaXNzdWUuCj4+Cj4+ICAgZXJyb3I6IGNvdWxkIG5vdCBj
b21waWxlIGBydXN0ZG9jLXRvb2xgIChiaW4gInJ1c3Rkb2NfdG9vbF9iaW5hcnkiKSBkdWUgdG8g
cHJldmlvdXMgZXJyb3IKPj4KPj4gRml4ZXM6Cj4+IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJv
b3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvNjI1Njg4MTU0NQo+PiBodHRwOi8vYXV0b2J1aWxkLmJ1
aWxkcm9vdC5vcmcvcmVzdWx0cy9hNmIvYTZiMjg3ODNmMjllNmI3Mjk4MjRiZjQyNjc5YTYyZjcy
YWQ1YmVlMAo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBz
bWlsZS5mcj4KPj4gLS0tCj4+ICBwYWNrYWdlL3J1c3QvcnVzdC5tayB8IDEgKwo+PiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3J1c3Qv
cnVzdC5tayBiL3BhY2thZ2UvcnVzdC9ydXN0Lm1rCj4+IGluZGV4IGY3YTVjMGZjZDUuLmM0NjRl
NzdmNGYgMTAwNjQ0Cj4+IC0tLSBhL3BhY2thZ2UvcnVzdC9ydXN0Lm1rCj4+ICsrKyBiL3BhY2th
Z2UvcnVzdC9ydXN0Lm1rCj4+IEBAIC02NCw2ICs2NCw3IEBAIGRlZmluZSBIT1NUX1JVU1RfQ09O
RklHVVJFX0NNRFMKPj4gIAkJZWNobyAnY2MgPSAiJChUQVJHRVRfQ1JPU1MpZ2NjIic7IFwKPj4g
IAkJZWNobyAnW2xsdm1dJzsgXAo+PiAgCQllY2hvICduaW5qYSA9IGZhbHNlJzsgXAo+PiArCQll
Y2hvICdsZGZsYWdzID0gIiQoSE9TVF9MREZMQUdTKSInOyBcCj4gCj4gQnV0IHRoZW4sIHdlIHdv
dWxkIGFsc28gbmVlZCB0byBhZGQgaG9zdC16bGliIHRvCj4gSE9TVF9SVVNUX0RFUEVOREVOQ0lF
Uywgbm8/CgpJbmRlZWQgYnV0IGluIHByYWN0aWNlIGhvc3QtemxpYiBpcyBhbHJlYWR5IGFuICJp
bmRpcmVjdCIgZGVwZW5kZW5jeSBvZgpob3N0LXJ1c3QgZHVlIHRvIGhvc3Qtb3BlbnNzbCAoaG9z
dC1saWJvcGVuc3NsKSBkZXBlbmRlbmN5LgoKICBIT1NUX0xJQk9QRU5TU0xfREVQRU5ERU5DSUVT
ID0gaG9zdC16bGliCgpJIG5vdGljZWQgdGhlIG1pc3NpbmcgZGVwZW5kZW5jeSBidXQgZm9yZ290
IHRvIGFkZCBpdCBpbiBIT1NUX1JVU1RfREVQRU5ERU5DSUVTLgoKQmVzdCByZWdhcmRzLApSb21h
aW4KCgo+IAo+IFJlZ2FyZHMsCj4gWWFubiBFLiBNT1JJTi4KPiAKPj4gIAkpID4gJChARCkvY29u
ZmlnLnRvbWwKPj4gIGVuZGVmCj4+ICAKPj4gLS0gCj4+IDIuNDMuMgo+Pgo+PiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0Cj4+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4+IGh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+IAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
