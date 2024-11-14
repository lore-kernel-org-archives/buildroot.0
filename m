Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA66D65C7B
	for <buildroot@archiver.kernel.org>; Thu, 14 Nov 2024 11:34:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9039080B6D;
	Thu, 14 Nov 2024 11:34:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Pvi33vVM8rA; Thu, 14 Nov 2024 11:34:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB88880BA6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB88880BA6;
	Thu, 14 Nov 2024 11:34:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D4EEB6C
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 11:34:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2D6780BA6
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 11:34:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1x56LB6L4FyF for <buildroot@buildroot.org>;
 Thu, 14 Nov 2024 11:34:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com;
 envelope-from=rgallaispou@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D8D4380B6D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8D4380B6D
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D8D4380B6D
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 11:34:49 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-53da5a27771so505404e87.2
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 03:34:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731584088; x=1732188888;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HiV1EpGTQbg3P5ov5GAmbzGTAwomisOOFlEPKb3Bnzk=;
 b=oa69hr2ph8e6D7s14VLedav6Xtn0Xg9yjqKxzionlHY9ww2pYp7zMw1UP3Auq7LCPJ
 3ZxQE72aYxlTEqmbrqlFbfRc5YVwvRyT0MxtPPoGqWfmjFUYkCNr505mmG4KW3hOlKqc
 Ivutw7sopBO/aYM8BKjAaK2Qs3Nz9+13jOcRqqU4UIs0B/2Qz3X+QZxs6/baE//ynO8S
 LRHltj7yRJc7IJzB0C5ehQm8ZnL6uzQzcaCdeDoLjyLZKCFQLxPX/F5RW/n63hYp1KN9
 z/WSUQxRUdrphLZTMLuTSzv/URkmGWRzp95uYtkZgrpKVjBOOXp1iBCCEepx1EuBRkKW
 c42w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWm81ehzCCa/Os9rBgLq0pEo44hMgRLNxFOjO6L0dBc2wrVqi0hjnxT3Rdc3+aDmFKYiQE8P6WjGuU=@buildroot.org
X-Gm-Message-State: AOJu0YwNBIxmb/F2q6+R8Nl1ydgvtxGHlocZ9OxCQFrK0enX5WLr5qcK
 oHBUYdK5HwkowMyEQwkNN63Uc518y1aYIaJyFR5j60LSX3rByb3w
X-Google-Smtp-Source: AGHT+IEF3u27p/FFbA8rjcYvQ8yw2kRso64CRLKnasCtVaa6bfbkXfuX1lu0hnew3TD/8OFFXoD8ug==
X-Received: by 2002:a05:6512:3b9b:b0:539:8bde:eb90 with SMTP id
 2adb3069b0e04-53da5c4dfadmr1039450e87.32.1731584087274; 
 Thu, 14 Nov 2024 03:34:47 -0800 (PST)
Received: from ?IPV6:2001:861:3385:e20:2acd:89a8:83d9:4be5?
 ([2001:861:3385:e20:2acd:89a8:83d9:4be5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432da27f4f8sm20439885e9.18.2024.11.14.03.34.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2024 03:34:46 -0800 (PST)
Message-ID: <8f243297-4555-4415-8b60-13767b66553c@gmail.com>
Date: Thu, 14 Nov 2024 12:34:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
Cc: Bartosz Bilas <b.bilas@grinn-global.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Marleen Vos <marleen.vos@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241017-master-v2-1-7cf8d42d5d81@gmail.com>
 <11cb561c-1f5b-4608-9726-3ffc48625d60@mind.be>
 <b87764f0-788b-4071-a5b9-a968f8711a88@gmail.com>
 <dc544d97-8474-4b93-9c02-875d348bf2ca@mind.be>
Content-Language: en-US, fr
From: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>
In-Reply-To: <dc544d97-8474-4b93-9c02-875d348bf2ca@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731584088; x=1732188888; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HiV1EpGTQbg3P5ov5GAmbzGTAwomisOOFlEPKb3Bnzk=;
 b=hxMxx3cmIW9whiUNpptcikFey6vaAw+oGpghROIcXJocrA0doCPswf9JQD/XgRMoVK
 lEtuCUoglfK+eTtbd7c4FuNIo+ZaQK8fut7Pdw+4EPCtByjV1gqCtj4u0+3SklH0ThB3
 ppKwYWIDEvQtR+E+yzb28V2zAClQ5rgE0bDMcgkNSxJDMROT90+wDyP45xw+cQ0jpkuy
 ZzyKyYjoO5qptQ++lZQzoNUt0d9Rze9ZaDoWhHksxHwfnAfigYZieqNeF4pZUbun4li8
 hHA6XrwtIGlkQFPfTpoeMdVFk9H+Z8my2/4nmpxOXdECGID9XooKHcx0F7CLLv9xYG73
 pmAA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=hxMxx3cm
Subject: Re: [Buildroot] [PATCH v2] configs/stm32mp135f-dk: new defconfig
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

CgpMZSAxNC8xMS8yMDI0IMOgIDExOjQ5LCBBcm5vdXQgVmFuZGVjYXBwZWxsZSBhIMOpY3JpdMKg
Ogo+IAo+ICDCoFRoZSBpZGVhIGlzIHRoYXQgd2UgaGF2ZSB0d28gb3B0aW9ucyBmb3IgdGhlIGtl
cm5lbCBjb25maWcgaW4gQnVpbGRyb290Ogo+IAo+IC0gVXNlIGFuIHVwc3RyZWFtIGRlZmNvbmZp
ZyBmcm9tIHRoZSBrZXJuZWwgaXRzZWxmLiBUaGF0IGRlZmNvbmZpZyAKPiBzaG91bGQgYmUgYXMg
c3BlY2lmaWMgYXMgcG9zc2libGUsIGJ1dCBub3dhZGF5cyB0aGUgb25seSB1cHN0cmVhbSBvcHRp
b24gCj4gaXMgbXVsdGlfdjcgZm9yIDMyLWJpdCBhbmQgYXJtNjQgZm9yIDY0LWJpdC4KPiAtIFVz
ZSBhIHNwZWNpZmljIGRlZmNvbmZpZyBpbiBCdWlsZHJvb3QsIHRvIHJlbW92ZSB0aGUgImZhdCIg
YW5kIAo+IHRoZXJlZm9yZSBzaXplIGFuZCBidWlsZCB0aW1lLiBJbiB0aGlzIGNhc2UsIHdlIHdh
bnQgZXZlcnl0aGluZyB0aGF0IGlzIAo+IGFsd2F5cyB0aGVyZSBidWlsdCBpbiAoImFsd2F5cyB0
aGVyZSIgbWVhbnMgdGhhdCBpdCdzIG5vdCBob3QtcGx1Z2dhYmxlLCAKPiBhbmQgZW5hYmxlZCBp
biBkZXZpY2UgdHJlZSksIGJlY2F1c2UgdGhhdCBzdGlsbCByZWR1Y2VzIHRvdGFsIHNpemUgKGEg
Cj4gbW9kdWxlIGlzIGJpZ2dlciB0aGFuIGlmIGl0J3MgbGlua2VkIGluIHRoZSBrZXJuZWwpLgo+
IAo+ICDCoElmIHRoZXNlIHR3byBwZXJpcGhlcmFscyBhcmUgZW5hYmxlZCBpbiBkZXZpY2UgdHJl
ZSwgdGhlbiB0aGVpciAKPiBtb2R1bGVzIHdpbGwgYW55d2F5IGdldCBsb2FkZWQgKGlmIG1vZHVs
ZSBhdXRvbG9hZGluZyBpcyBlbmFibGVkKSwgc28gCj4gcHV0dGluZyB0aGVtIGluIG1vZHVsZXMg
ZG9lc24ndCBkZWNyZWFzZSB0aGUgc2l6ZSBpbiBhbnkgbWVhbmluZ2Z1bCB3YXkuCj4gCgpUaGFu
a3MgZm9yIHRoZSBjbGFyaWZpY2F0aW9uLiBUaGlzIGlzIGNsZWFyZXIgOikKClNvIEkgd2lsbCBz
ZW50IGEgdjMgcHJvbXB0bHkgd2l0aCB0aGUgU1RNMzJfe0xQfVRJTUVSX0NOVCBzZXQgYXMgYnVp
bHRpbiAKZHJpdmVycy4KClJlZ2FyZHMsClJhcGhhw6tsCj4gIMKgUmVnYXJkcywKPiAgwqBBcm5v
dXQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
