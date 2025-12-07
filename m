Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E776D2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 17:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 950DA60BA4;
	Sun,  7 Dec 2025 17:07:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jw_R9rxaZDTD; Sun,  7 Dec 2025 17:07:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 069FE606BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765127253;
	bh=gQPLiOXe5yEOZWLujmk1o1dbsskdceCkIRNTxPBjNZY=;
	h=Date:To:Cc:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zp3YzGLqqOp7vYyV4lAmy+LWcp4gdtcqgs628AsOlFhU6pzne3uYLLTWQo/kenH4Q
	 laMZ2ua1mNombuC6SveVVieJrvp2a2XcfBKbpi8q7Wv62kgWGLRV/ZV/EPQswuifYs
	 BuFUsKuNUEMAAbaGiaGOQCguG1Whe2On/zTIJhQqSXXD5EqlVsv/h/PyIR/SJIYWi7
	 tyaBfvO3RP4pTbW5QkdGPJ01KUrWBWInISQfXsGrDbbfyL1e4tz53XlkaH82fSdbJ4
	 lHYEIrDkpz+P4TNzAaXBfFEbOvSsEaUkgXHC/gvlR8SkKy3FhNg1t7gYRnaxBDegUt
	 3KlCJvwAeyT9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 069FE606BA;
	Sun,  7 Dec 2025 17:07:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A447AE7
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:07:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95E2981EA8
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:07:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cuGHVykfMHuI for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 17:07:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=raphael.pavlidis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7F5DC81EA6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F5DC81EA6
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7F5DC81EA6
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:07:30 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b79af62d36bso605059466b.3
 for <buildroot@buildroot.org>; Sun, 07 Dec 2025 09:07:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765127248; x=1765732048;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mQgGmOEH5c9XZJC7ob79zSBNu6suxPRNCI+kKDw3hkY=;
 b=uIU1b8+ASIKGkJNWucxUmC4dkvUYij4t7dP5BHorBh5xKNzyzWAHcnQcMUNTG0xGF2
 ysN5DEqU8pcB15k70aJGGucZWnStVdDNFMvn5pfjgLeFOhTWO27/zWqagd0lPL3IefLt
 3gOPVm+Jle08FDAmtl+zWuos+ORZ6wjkKOT6+c4GssRZJFEl+kJC56tlkPvurIB+1ivB
 qTaPnzMbSJ2YgQm83BsUsgpZ1Bk7VFznKpRNPWw/F1dvcsGUAYB25vBPB0WxYQpogaFP
 /m5GcV7vDIFNJ7Xc+slONeNmFz1++fSqN7fDlhRS4NLPDxrg/cGDicrKT3CeEZYzIE0/
 w04Q==
X-Gm-Message-State: AOJu0YwRpYIqdydMtcpzEYdKzU52mJmTHCBXr8TbZURVVR2E8nXoiT7d
 a/jj7LkK8s0p+jkYG1d4b2nCwRKhpsAxa2IGMLCnHs5oKHUCYGSFubox0BfxA3qD
X-Gm-Gg: ASbGncsTjAD5g26SrCHd3dsFk5u0gRD4HVbhLThoFDPTrhEgkKOcDZS0SlBixA7gL2X
 VXIP+vjuWjnBBHgS2YzdA9rrqRD0DrZxCut5CVcAUTrekUso6KmjZCOHXzvUpQs8VxRXLvrMc0T
 K9jafg4Z+IC7DLYlG8FooUoQagsNLY9OGUDF29//1lpQJcCzD1UWxs2NowvHtUw3mlAdX3eF4Lx
 yVpAJSp3EYJ401fZccUoYqsysX9V0d+ouC+3geVkW2IPcyvGqyMEbPuGOeNZEuiVCansicFCOBO
 xjRH0+J7Ptw9X8K0w5m/Onrd6fgY71ojvt7msFkx5i5/EwfJhw72HPDGpcDz6/+DMAySezwiAhP
 pqSr/xDA95yZoHUxc3vMQxqWPIxvVzbUghHsyscrSSZBmrUULNPqOmLZvbLONiXSeY4ArNLllHF
 YVd5WdZ29SYAfN7OZNBTVfxEgwFhmSZdrrwg==
X-Google-Smtp-Source: AGHT+IEn7YdgHCizNuFhm0/7YAJCQ3G/TTZrkkw94LUhxTaFZM/DgIEtr4OjyO6/WQpOs/KuXX8Aew==
X-Received: by 2002:a17:907:1c1e:b0:b77:1166:7d63 with SMTP id
 a640c23a62f3a-b7a2476f996mr618662066b.40.1765127248169; 
 Sun, 07 Dec 2025 09:07:28 -0800 (PST)
Received: from ?IPV6:2a02:8070:2483:7e00::771c? ([2a02:8070:2483:7e00::771c])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b79f49d24a6sm870613366b.54.2025.12.07.09.07.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Dec 2025 09:07:27 -0800 (PST)
Message-ID: <9f498cf8-1b73-430f-81cf-de59cc4dd049@gmail.com>
Date: Sun, 7 Dec 2025 18:07:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <20251003135120.1221002-1-raphael.pavlidis@gmail.com>
 <20251207153517.1a3388bf@windsurf>
 <5b26839a-11ff-4649-a96b-b90c2c535d8f@gmail.com>
 <20251207175718.12f46be9@windsurf>
Content-Language: en-US
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
In-Reply-To: <20251207175718.12f46be9@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765127248; x=1765732048; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mQgGmOEH5c9XZJC7ob79zSBNu6suxPRNCI+kKDw3hkY=;
 b=NcJ65LZAyufJv76zkHqCHm6DvEcsiwfiTMz1Eg64eOsw+8UzWmhp0UaKzbU0TwY+zE
 L++HGgOJ5wBsTTpoQM55dUJtvoqpz1rmKC29/I0GNRUPZqbCewKGhgi0p+zBpcUtz/jk
 nvHLTwOvAc2GzIbDqZJdpqoVOtXGpMjuhRy1riAd3E6o4hW5ScD9eVtT8I19lhfAhTss
 IS2GzIvBO9poCFjuxuTPfNiOfOBZ+XMhVD6nqQFUb33KRZ3aOurefGFE1qN71c0i4YD/
 kdKNcr0PlYq1nictobWPPCeifNGGTGeDNpWKRV4TMeKY6WlJ3nM1vemeaLw/z3vQFGuS
 4oAQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NcJ65LZA
Subject: Re: [Buildroot] [PATCH v1 1/2] package/wayland: make libdrm and
 xlib_libxshemfence optional
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

SGVsbG8gVGhvbWFzLAoKT24gMTIvNy8yNSAxNzo1NywgVGhvbWFzIFBldGF6em9uaSB3cm90ZToK
W1NOSVBdCj4gCj4gSXQgd2FzIHN0aWxsIGluIHRoZSAiTmV3IiBzdGF0ZSBpbiBwYXRjaHdvcmss
IHdoaWNoIGlzIGhvdyBJIG5vdGljZWQuCgpJIGRvdWJsZS1jaGVjayBpdCwgYW5kIHlvdSB3ZXJl
IHJpZ2h0LiBJIGNoYW5nZWQgaXQuCgo+IAo+PiBJ4oCZdmUgYWxzbyByZWFsaXplZCB0aGF0IGl0
IGRvZXNu4oCZdCB3b3JrIHRvIG1ha2UgdGhlbSBvcHRpb25hbDsgZXZlbgo+PiB0aG91Z2ggdGhl
eSBhcmUgZGVjbGFyZWQgYXMgb3B0aW9uYWwgZGVwZW5kZW5jaWVzIGluIHRoZSBtZXNvbiBmaWxl
cywKPj4gdGhlIHNvdXJjZSBjb2RlIHN0aWxsIGluY2x1ZGVzIHRob3NlIGxpYnJhcmllcyB1bmNv
bmRpdGlvbmFsbHksIGV2ZW4KPj4gd2hlbiB0aGV5IGFyZW7igJl0IHVzZWQgKGF0IGxlYXN0IG9u
IHRoZSBsYXRlc3QgdmVyc2lvbikuCj4gCj4gT0shIFRoZW4sIHRoZXJlIGlzIGFuIHVwc3RyZWFt
IGJ1ZzogZWl0aGVyIG1lc29uIGZpbGUgaXMgaW5jb3JyZWN0LCBvcgo+IHRoZSBjb2RlIGlzIGlu
Y29ycmVjdC4gRGlkIHlvdSByZXBvcnQgdGhlIGlzc3VlIHVwc3RyZWFtPwoKSSB0aGluayB0aGUg
Y29kZSBpcyBpbmNvcnJlY3QuIERpZCBub3QgaGF2ZSB0aW1lIHRvIHJlcG9ydCB0aGUgYnVnLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
