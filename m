Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC56C48BC3
	for <buildroot@archiver.kernel.org>; Sat, 17 Feb 2024 20:44:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B498D80B78;
	Sat, 17 Feb 2024 20:44:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jsJykQNhziFx; Sat, 17 Feb 2024 20:44:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4B0580B97
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4B0580B97;
	Sat, 17 Feb 2024 20:44:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C2F7B1BF59E
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 20:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF94740179
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 20:44:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 86ioQcEFs60o for <buildroot@lists.busybox.net>;
 Sat, 17 Feb 2024 20:44:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=alexander.sverdlin@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3C57240114
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C57240114
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3C57240114
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 20:44:27 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-410ca9e851bso24115815e9.3
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 12:44:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708202665; x=1708807465;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gbInFmfT52k1I9Hd9RxoliW1OBGT4H4s/Xc1rnEGdH8=;
 b=j638h52GMCtloYebspBHV0PLZDbRe7OVQGSh6q39+3yrRMyteTMB0tNbS74yUfQSVn
 V/kphc01MQ9+J4YSbMi9gaH/1y6299htoNOycAqlEb7njnBk57+T4GNXbFnV8iZpQDtE
 Jc6OB/e9l15bIOvNEuG/iU6RgDrnr1FxzBTazxxehMspwoi61amk1oeKunSo2QhqfLVx
 wi7W+zgq3GRI+3F5WRsz8eFkyOQQmK6L9Rq3iKxFrhcbnd6GtGgGRA0T1QaPLWFJBNzT
 LaAtTyfDYKN1NZrWZdvheEBDhVeJ9er+I/bu/R8ozUmQ2pXQc2VsOeuWZsyFS/CKHiXU
 jViQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX87G5401dpsJ8U2SqSPBHOhiJAmHUxPCMt8qoB9Eg1pd/x/yN/NETMxrebIafyRkUAdHJVKQP+E8sMRx7cCg4megXcl6ZTkQ==
X-Gm-Message-State: AOJu0YyTuhFXTWjksXLhOdfQjZv7HKRI/QhdCEuoUcMPJ5aeEkq71hMY
 NnK7x5uIoumMNrAXA8UoK78rqHTV6VQGbOZvy1mM5KuObttr7MIq
X-Google-Smtp-Source: AGHT+IHfDc7qVfvWYAv4JHSpHjfpqIKYxohoHjRq7fi//o/yeqm3S+OrQAD56dluN9u/0JNOLYMbcA==
X-Received: by 2002:a05:600c:4749:b0:412:6058:c2d1 with SMTP id
 w9-20020a05600c474900b004126058c2d1mr435065wmo.32.1708202665069; 
 Sat, 17 Feb 2024 12:44:25 -0800 (PST)
Received: from giga-mm-1.home ([2a02:1210:8690:9300:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 m17-20020a5d4a11000000b0033cf4e47496sm5673562wrq.51.2024.02.17.12.44.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Feb 2024 12:44:24 -0800 (PST)
Message-ID: <95a8a71f608575339cd61ba5ed09b93d8714c01c.camel@gmail.com>
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 buildroot@buildroot.org
Date: Sat, 17 Feb 2024 21:44:29 +0100
In-Reply-To: <20240217160244.1320482-15-dario.binacchi@amarulasolutions.com>
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
 <20240217160244.1320482-15-dario.binacchi@amarulasolutions.com>
Autocrypt: addr=alexander.sverdlin@gmail.com; prefer-encrypt=mutual;
 keydata=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
User-Agent: Evolution 3.50.4 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708202665; x=1708807465; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=gbInFmfT52k1I9Hd9RxoliW1OBGT4H4s/Xc1rnEGdH8=;
 b=APPo6BcKDhcHLqJLkxfu09t9yKPfZBAhWTG3qxIDxMBbBmBvix3Pv9FgsPwDljBCGw
 WJTC11D/kh8wAfxpyx7C6v0wXAbs1rYMKHRK0JUiRyE83pVnJx1imeUW3jaTAYEz/E9Z
 mIlvqXG8SKSh1hFjQnSpsU/YuH4NPz9tLZJn018AWEUhuRoJUwXCd52XWtlQnlqS1dyF
 KJAav3mBHdabXVI23lMs18bdePOTxSMcLPunmFcXzjcVRoj8D9kJDyAN35d+qxsbkYPZ
 kVDTXb3mOszxfRfhBBM5ZYRuFtBPfVhw8dzZ5O29KNyEfp3ZJlgBvYn6zaH/AhK1H8zT
 FEqw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=APPo6BcK
Subject: Re: [Buildroot] [PATCH v4 14/20] boot/uboot: set BINMAN_INDIRS for
 TI K3 DM
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
Cc: michael@amarulasolutions.com, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>, Andreas Dannenberg <dannenberg@ti.com>,
 linux-amarula@amarulasolutions.com, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRGFyaW8sCgpPbiBTYXQsIDIwMjQtMDItMTcgYXQgMTc6MDIgKzAxMDAsIERhcmlvIEJpbmFj
Y2hpIHdyb3RlOgo+IEFzIGV4cGxhaW5lZCBpbiBbMV0sIGFkZGluZyBzdXBwb3J0IGZvciBBTTYy
eCBMUCBTSyBpbiBVLUJvb3QsIHJlcXVpcmVzCj4gYmlubWFuIGZvciBidWlsZGluZyBib290bG9h
ZGVyIGltYWdlcy4gVGhlIEJJTk1BTl9JTkRJUlMgZW52aXJvbm1lbnQKPiB2YXJpYWJsZSBpcyB1
c2VkIHRvIHByb3ZpZGUgYSBzcGFjZS1zZXBhcmF0ZWQgbGlzdCBvZiBkaXJlY3RvcmllcyB0bwo+
IHNlYXJjaCBmb3IgYmluYXJ5IGJsb2JzLgo+IAo+IFsxXSBodHRwczovL3BhdGNod29yay5vemxh
YnMub3JnL3Byb2plY3QvdWJvb3QvcGF0Y2gvMjAyMzEwMzAxMTAxMzguMTM0NzYwMy0zLW4teWFk
YXZAdGkuY29tLwo+IFNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2No
aUBhbWFydWxhc29sdXRpb25zLmNvbT4KPiAKPiAtLS0KPiAKPiBubyBjaGFuZ2VzIHNpbmNlIHYx
Ogo+IAo+IFNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFy
dWxhc29sdXRpb25zLmNvbT4KPiAtLS0KPiDCoGJvb3QvdWJvb3QvdWJvb3QubWsgfCAzICsrLQo+
IMKgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRp
ZmYgLS1naXQgYS9ib290L3Vib290L3Vib290Lm1rIGIvYm9vdC91Ym9vdC91Ym9vdC5tawo+IGlu
ZGV4IGRkYTYwNmE4ODA1OS4uY2Y3MGY4NmE0MTMyIDEwMDY0NAo+IC0tLSBhL2Jvb3QvdWJvb3Qv
dWJvb3QubWsKPiArKysgYi9ib290L3Vib290L3Vib290Lm1rCj4gQEAgLTE4OSw3ICsxODksOCBA
QCBlbmRpZgo+IMKgaWZlcSAoJChCUjJfVEFSR0VUX1VCT09UX05FRURTX1RJX0szX0RNKSx5KQo+
IMKgVUJPT1RfVElfSzNfRE1fU09DTkFNRSA9ICQoY2FsbCBxc3RyaXAsJChCUjJfVEFSR0VUX1VC
T09UX1RJX0szX0RNX1NPQ05BTUUpKQo+IMKgVUJPT1RfREVQRU5ERU5DSUVTICs9IHRpLWszLWJv
b3QtZmlybXdhcmUKPiAtVUJPT1RfTUFLRV9PUFRTICs9IERNPSQoQklOQVJJRVNfRElSKS90aS1k
bS8kKFVCT09UX1RJX0szX0RNX1NPQ05BTUUpL2lwY19lY2hvX3Rlc3RiX21jdTFfMF9yZWxlYXNl
X3N0cmlwLnhlcjVmCj4gK1VCT09UX01BS0VfT1BUUyArPSBETT0kKEJJTkFSSUVTX0RJUikvdGkt
ZG0vJChVQk9PVF9USV9LM19ETV9TT0NOQU1FKS9pcGNfZWNob190ZXN0Yl9tY3UxXzBfcmVsZWFz
ZV9zdHJpcC54ZXI1ZiBcCgpJcyB0aGUgYWJvdmUgYWN0dWFsbHkgc3RpbGwgcmVxdWlyZWQgd2l0
aCBiaW5tYW4/ClRoZSBuYW1lcyBhcmUgaGFyZGNvZGVkIGluIFUtQm9vdCBpbiBhcmNoL2FybS9k
dHMvazMtYW02MjUtc2stYmlubWFuLmR0c2kKCj4gKwlCSU5NQU5fSU5ESVJTPSQoQklOQVJJRVNf
RElSKQoKVGhpcyBzZWVtcyB0byBiZSB0aGUgb25seSByZXF1aXJlZCBwYXJ0LgoKPiDCoGVuZGlm
Cj4gwqAKPiDCoGlmZXEgKCQoQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19PUEVOU0JJKSx5KQoKLS0g
CkFsZXhhbmRlciBTdmVyZGxpbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
