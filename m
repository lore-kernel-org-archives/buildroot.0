Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A3ACC3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 10:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F02A80DF7;
	Mon,  8 Jul 2024 10:56:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ngzk2q9BEQwr; Mon,  8 Jul 2024 10:56:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F292180F06
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F292180F06;
	Mon,  8 Jul 2024 10:56:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BD7CE1BF470
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 10:56:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A930D40337
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 10:56:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hTjqbhV7NkSA for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 10:56:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=sairon@sairon.cz; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 60B77402EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60B77402EE
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 60B77402EE
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 10:56:35 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a77cbb5e987so304227866b.3
 for <buildroot@buildroot.org>; Mon, 08 Jul 2024 03:56:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720436193; x=1721040993;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8kd+gwrD86DH7ImZpvEbrrdLE+rb44lePtqCLjvYNzs=;
 b=DfOF9Ow769XiRHbh5ioBZ1bLnbKnAZ3l4NpjTbwBVY2+h2SQEoFndTejAsacPm8xZG
 aM0skWfx8tAtRzXmmjuJvG+oc8Us7l7K45WM+cvh2AeUZulRqPSFhoTuEr757QoK5iES
 nSiVBnnjNI2DfmyzTyFGFiUdoNPjdO8C/x8M3vqxDB6orJ+Rm539Ycqe/QSZqeDu1W0W
 QcAvAlKZ7HXKAZCv81zO21u+dqBxSpVoTWgT6wKB8PLR5+H5q3LbZzcHyKhbnFkI8m9W
 qZ+fPxH2/z2ePzi7KZsZCSJbgIqo5U6N9iEZvTnm3VnCLdW9FL22hCpTGUJRX0EZPsjh
 Y0aQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU310dniCGE6r8T6WH+qu3mh0mKePKUB5SUB3zpUS83hGAwbq9RQweGbSHTLjZ0buEKY3ZHFC3jiKgI/eQwWXkN93dnsML0Sw==
X-Gm-Message-State: AOJu0Yzkt7paFPdyUVkRd7MRI9fQHIZLyJLZ6Y8HlvIypYwLenXUzd96
 RTO8E91Y6cADwtqvYvx9c3PMv2XFQpBuQgyZ2ikJTHBR7ZtCVAy57JSXgw81cFdMtkIN4YfhbMm
 H
X-Google-Smtp-Source: AGHT+IGvYlGzpehlczkJxlHX7ONHpeswUeb1xH6SzsQRCvB5hgyIWQTqTkwng3iXmy79f2VRY/nZ5Q==
X-Received: by 2002:a17:907:97c8:b0:a77:b516:3023 with SMTP id
 a640c23a62f3a-a77ba44cb81mr1073066066b.4.1720436192826; 
 Mon, 08 Jul 2024 03:56:32 -0700 (PDT)
Received: from [192.168.127.42] (ip-89-103-66-201.bb.vodafone.cz.
 [89.103.66.201]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a77c54d96f3sm322577066b.189.2024.07.08.03.56.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jul 2024 03:56:32 -0700 (PDT)
Message-ID: <339f64fe-2d7f-4442-9058-cecdf1d918b9@sairon.cz>
Date: Mon, 8 Jul 2024 12:56:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20240703082850.750420-1-sairon@sairon.cz>
 <20240703082850.750420-4-sairon@sairon.cz>
 <e5dab416-8316-4691-8ef6-3bfa00dd626c@mind.be>
Content-Language: en-US
From: =?UTF-8?B?SmFuIMSMZXJtw6Fr?= <sairon@sairon.cz>
In-Reply-To: <e5dab416-8316-4691-8ef6-3bfa00dd626c@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sairon.cz; s=google; t=1720436193; x=1721040993; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8kd+gwrD86DH7ImZpvEbrrdLE+rb44lePtqCLjvYNzs=;
 b=eZo8hr0B3n8UUwRHHXIxhNvNZTW79Qcd2ZxD1i1HnJ8IBjcmAhbqIS0GIKF7uKeAmy
 hV+KkOqfj+lVpsKU8Q0J4b1M1EKP4a3sJsLfzN+eCPojNT1ta7T1BdubEtzKkzV6BDb+
 S5h6QXdv4DiqrUWA/W3hcZ+Qmlc5FUJU8ok9DEE2JAhA5VBG3mqTp1F7yW8GNQ5DAVVT
 rgdeJOf/lV9nmI73UdYwlkLtEZzckvUoCurAuAFkAT4XJ2EkYAhmvTiqFgaB8Spq61BB
 VUxn3jk6qJ2QTdSMunbYVbEYKbMxhwR2ds+y7+yHaoQLReCo9cs3ZMEg6/cGmk1BIByW
 NYnw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=sairon.cz
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=sairon.cz header.i=@sairon.cz header.a=rsa-sha256
 header.s=google header.b=eZo8hr0B
Subject: Re: [Buildroot] [PATCH 3/4] fs/erofs: add LZMA compression,
 allow configurable compression level
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
Cc: Gao Xiang <hsiangkao@aol.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQXJub3V0LAoKT24gMDQuIDA3LiAyNCAyMjoxOCwgQXJub3V0IFZhbmRlY2FwcGVsbGUgd3Jv
dGU6Cj4gCj4gIMKgSXQgd291bGQgYmUgdXNlZnVsIHRvIGhhdmUgaGVscCB0ZXh0IGZvciB0aGVz
ZSBvcHRpb25zLCBpbiBwYXJ0aWN1bGFyIAo+IGV4cGxhaW5pbmcgYSBiaXQgYWJvdXQgdGhlIHNp
emUvc3BlZWQgdHJhZGVvZmZzLiBCYXNpY2FsbHkgc3R1ZmYgdGhhdCAKPiB5b3UgY2FuIGdldCBm
cm9tIGVyb2ZzIGRvY3VtZW50YXRpb24uIEZvciBzdXJlLCB0aGUgb3JpZ2luYWwgaGVscCB0ZXh0
IAo+ICh0aGF0IGV4cGxhaW5zIHRoYXQgSEMgc3RhbmRzIGZvciBIaWdoIENvbXByZXNzaW9uKSBz
aG91bGRuJ3QgYmUgcmVtb3ZlZC4KPiAKCkkgZG9uJ3Qgd2FudCB0byBhcmd1ZSBidXQgSSdtIG5v
dCBzdXJlIGlmIHdlIHNob3VsZCBnbyB0b28gZGVlcCBoZXJlLiAKVGhlcmUncyBhbHNvIG5vIGVs
YWJvcmF0ZSBleHBsYW5hdGlvbiBvZiBvcHRpb25zIHRoYXQgYXJlIGF2YWlsYWJsZSBmb3IgCm90
aGVyIGZpbGVzeXN0ZW1zIGFuZCB0aGUgcGVyZm9ybWFuY2UgbWF5IGRlcGVuZCBvbiB2YXJpb3Vz
IGZhY3RvcnMsIAppbmNsdWRpbmcgdGhlIGhhcmR3YXJlIHRoZSBzeXN0ZW0gaXMgcnVubmluZyBv
bi4gU28gbWF5YmUganVzdCBzb21ldGhpbmcgCmxpa2UgYSBhIHNob3J0IG1lbnRpb24gdGhhdCBM
Wk1BIGlzIG11Y2ggc2xvd2VyIGJvdGggZm9yIGNvbXByZXNzaW9uIGFuZCAKZGVjb21wcmVzc2lv
biBidXQgZ2l2ZXMgYmV0dGVyIGNvbXByZXNzaW9uIHJhdGlvcz8KCj4+ICsKPj4gK2VuZGNob2lj
ZQo+PiArCj4+ICtpZiBCUjJfVEFSR0VUX1JPT1RGU19FUk9GU19MWjRIQwo+PiArCj4+ICtjb25m
aWcgQlIyX1RBUkdFVF9ST09URlNfRVJPRlNfTFo0SENfTEVWRUwKPj4gK8KgwqDCoCBpbnQgImx6
NGhjIGNvbXByZXNzaW9uIGxldmVsIgo+PiArwqDCoMKgIGRlZmF1bHQgOQo+PiArwqDCoMKgIHJh
bmdlIDEgMTIKPj4gK8KgwqDCoCBoZWxwCj4+ICvCoMKgwqDCoMKgIFNwZWNpZnkgdGhlIGNvbXBy
ZXNzaW9uIGxldmVsIGZvciBsejRoYyBjb21wcmVzc2lvbi4KPiAKPiAgwqBUaGlzIHNob3VsZCBl
eHBsYWluIGFsc28gdGhhdCBoaWdoZXIgdmFsdWVzIGNvbXByZXNzIG1vcmUgYnV0IGFyZSAKPiBz
bG93ZXIgKGFzc3VtaW5nIHRoYXQgdGhhdCBpcyBjb3JyZWN0IDotKSApLgo+IAoKVGhhdCBzaG91
bGQgYmUgY29ycmVjdC4gT3IgdG8gYmUgbW9yZSBwcmVjaXNlLCBtYWlubHkgdGhlIGNvbXByZXNz
aW9uIApzcGVlZCBkZWNyZWFzZXMgd2l0aCBoaWdoZXIgbGV2ZWwsIEFGQUlLIGRlY29tcHJlc3Np
b24gc3BlZWQgc2hvdWxkIGJlIApmYWlybHkgc3RhYmxlIChzYW1lIGdvZXMgZm9yIExaTUEpLgoK
Pj4gKwo+PiArZW5kaWYgIyBCUjJfVEFSR0VUX1JPT1RGU19FUk9GU19MWjRIQwo+PiArCj4+ICtp
ZiBCUjJfVEFSR0VUX1JPT1RGU19FUk9GU19MWk1BCj4+ICsKPj4gK2NvbmZpZyBCUjJfVEFSR0VU
X1JPT1RGU19FUk9GU19MWk1BX0xFVkVMCj4+ICvCoMKgwqAgaW50ICJsem1hIGNvbXByZXNzaW9u
IGxldmVsIgo+PiArwqDCoMKgIGRlZmF1bHQgNgo+PiArwqDCoMKgIHJhbmdlIDAgMTA5Cj4gCj4g
IMKgQSBiaXQgc2lsbHkgdG8gc3BlY2lmeSBhIHJhbmdlIGlmIHZhbHVlcyAxMC05OSBhcmVuJ3Qg
dmFsaWQgYW55d2F5Li4uIAo+IEJ1dCBPSywgaXQncyBkaWZmaWN1bHQgdG8gZ2V0IGFyb3VuZCB0
aGF0Lgo+IAoKSW5kZWVkIGl0IGlzLCBidXQgaXQncyB3aGF0IG1rZnMuZXJvZnMgZG9lcy4gQWx0
ZXJuYXRpdmUgd291bGQgYmUgdG8gCnNwbGl0IGl0IHRvIHR3byBvcHRpb25zIC0gdGhlIGNvbXBy
ZXNzaW9uIGxldmVsIGFuZCBhIGZsYWcgZm9yIGV4dHJlbWUgCmNvbXByZXNzaW9uLCBhbmQgdGhl
biAiY2FsY3VsYXRlIiB0aGUgdmFsdWUgaW4gdGhlIG1ha2VmaWxlLiBCdXQgSSdtIG5vdCAKc3Vy
ZSBpZiBpdCdzIGJldHRlciB0byBkbyBpdCBsaWtlIHRoaXMgKHRvIGF2b2lkIGluY29ycmVjdCB2
YWx1ZXMgdG8gYmUgCnNldCksIG9yIHRvIHByb3ZpZGUgcmF0aGVyIHRyYW5zcGFyZW50IGNvbmZp
Z3VyYXRpb24gb3B0aW9ucyBmb3IgdGhlIAp1bmRlcmx5aW5nIG1rZnMgdG9vbC4gV0RZVD8KCj4g
IMKgSSBkb24ndCB0aGluayBzdHJpcHBpbmcgaXMgbmVlZGVkIGZvciBpbnQgb3B0aW9ucywgaXMg
aXQ/CgpJIGRvbid0IHRoaW5rIHNvIGVpdGhlciwgaXQncyBhIGxlZnRvdmVyIG9mIGEgZGlmZmVy
ZW50IHdheSBJIGhhbmRsZWQgaXQgCmluIG15IHByb3RvdHlwZSB3aGljaCBJIHRoZW4gYmxpbmRs
eSBjb3B5LXBhc3RlZC4gSSdsbCBmaXggaXQgaW4gdGhlIApuZXh0IHNlcmllcy4KClJlZ2FyZHMs
CkphbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
