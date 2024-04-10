Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3DBACD128A
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 18:30:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A40A840133;
	Wed, 10 Apr 2024 18:30:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d4zNzycMCdPB; Wed, 10 Apr 2024 18:30:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C66940297
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C66940297;
	Wed, 10 Apr 2024 18:30:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 846C21BF5A2
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 18:30:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7130C82109
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 18:30:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1XLWoXq8DWX8 for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 18:30:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 26771820DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26771820DA
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 26771820DA
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 18:30:24 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-343cfe8cae1so4419938f8f.3
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 11:30:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712773823; x=1713378623;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LUOyOjWaOhJyI8/HAD+/yoXID5TBauhLYtfxRXAD8DE=;
 b=m+k7lWyPWw+pGpoMod1hLQP89o3CEDeYRoe5A1B9I4KMUv6hX4u1loE6hOlJ6YNpGI
 TpSBp2ZAAfFH23PMT/O6OVGIRxP+KgrrDCfGh1WelQNmPp9rGiisbIBHSK+4+h86as4i
 rNbULehd0k8ImwrKWs4SAgFeJig3a3ozx27ZdXGIcnoqG74H19Gec4C9SsjuKbklv0VQ
 KV/hS7ExKUvzNUHQdGPuWXbLfchSxx2sqZs+B36LklTj4Nac0ZJuQZopfrg1Gwqdm2dj
 gf+AjoQLjyYcVjN1tXlgnB2OUZjWOQm2ptVAMUfTJWjfhLj0PUqdrnBp16AwnoITfnZJ
 SN4g==
X-Gm-Message-State: AOJu0Ywg6viXhgSgAO/wJEcheRROuSIByfSzvM/qh6C9AlCxT5QKLdtu
 EiRtfUZj0qXmtTWVGIxs0i4CFpKye69hAsTAYlpUdP7PzI4S94PMeHZo+eaaQtk=
X-Google-Smtp-Source: AGHT+IHqVD4cRkIZ7xwEIUEZCcxi83+MoGGzJvJJ3M4Y6F4APDeHkk4jPUstu3oubqyDFnYeCAFJdw==
X-Received: by 2002:a05:6000:1101:b0:343:6ca4:97e4 with SMTP id
 z1-20020a056000110100b003436ca497e4mr2282178wrw.51.1712773822653; 
 Wed, 10 Apr 2024 11:30:22 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 cg13-20020a5d5ccd000000b00345920fcb45sm8884616wrb.13.2024.04.10.11.30.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Apr 2024 11:30:22 -0700 (PDT)
Message-ID: <081ad720-f9f0-4ec5-935f-d6e197afed25@mind.be>
Date: Wed, 10 Apr 2024 20:30:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
References: <20240409212758.380547-1-ju.o@free.fr>
 <20240409212758.380547-2-ju.o@free.fr>
 <e16166b5-9ca0-4d2e-9c69-80d74d5d7e07@mind.be>
 <af4421720e276e1e58b1319732a75891@free.fr>
Content-Language: en-GB
In-Reply-To: <af4421720e276e1e58b1319732a75891@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712773823; x=1713378623; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LUOyOjWaOhJyI8/HAD+/yoXID5TBauhLYtfxRXAD8DE=;
 b=CvuT0i5a/52LG7cW56vbwfxaqVfBiFVl8XnYmvHlyEIgfyblBlKAyP1ynz7vK7OdMn
 Q62YFAkLOC9gjHUcyKphZz9PEM5x9v65eKxpjXV93gPwLA0ovM/q5/8+FIvjUSlZOwXW
 OF6Cc/RFPP2zSvHWn5GfppOlcAmSLEDaUV0ci3EFoEHUs2EFbFrLPr6QUNZHciqIBSTn
 uK2QI+tcJGEM4PrllS8VzIhptHdVu3w0bDk9x9VVtf4xruy2HsxiiajNU4v26bWT6w+k
 MrLHl9vTSd0l/nEF5i9ep4CZF38LZ8w6z0eYPtCr8WOVK9+nIBUd0/fV6qEsM5n7hGvB
 zFnA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=CvuT0i5a
Subject: Re: [Buildroot] [PATCH v2 2/2] package/rdma-core: bump to version
 v51.0
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxMC8wNC8yMDI0IDIwOjIyLCBKdWxpZW4gT2xpdmFpbiB3cm90ZToKPiBIaSBBcm5vdXQs
Cj4gCj4gT24gMTAvMDQvMjAyNCAyMDowNCwgQXJub3V0IFZhbmRlY2FwcGVsbGUgd3JvdGU6Cj4+
IE9uIDA5LzA0LzIwMjQgMjM6MjcsIEp1bGllbiBPbGl2YWluIHdyb3RlOgo+Pj4gRm9yIGNoYW5n
ZSBsb2csIHNlZToKPj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9saW51eC1yZG1hL3JkbWEtY29yZS9y
ZWxlYXNlcy90YWcvdjUxLjAKPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gT2xpdmFpbiA8
anUub0BmcmVlLmZyPgo+Pj4gLS0tCj4+PiBDaGFuZ2VzIHYxIC0+IHYyOgo+Pj4gLSBpbnRyb2R1
Y2VkIHRoaXMgbmV3IHBhdGNoIGZvciB2NTEuMCBidW1wLgo+Pgo+PiDCoFdoeSBkaWQgeW91IGRv
IHRoaXMgaW4gdHdvIHNlcGFyYXRlIHBhdGNoZXMsIGluc3RlYWQgb2YgYSBzaW5nbGUgcGF0Y2gg
dGhhdCAKPj4gYnVtcHMgdG8gdjUxLjA/Cj4gCj4gV2VsbCwgdGhlIHY1MC4wIHBhdGNoIHdhcyB3
YWl0aW5nIGluIHBhdGNod29yayBmb3IgcXVpdGUgc29tZSB0aW1lLiBJdCBpcyBzdGlsbCAKPiB2
YWxpZCBhcy1pcy4KCiAgWW91IGFueXdheSBtYXJrZWQgdGhhdCBvbmUgYXMgU3VwZXJzZWRlZCwg
c28gaXQncyBub3QgcmVhbGx5IHJlbGV2YW50IHRoYXQgaXQgCndhcyBhbHJlYWR5IG9uIHBhdGNo
d29yay4KCj4gSSBqdXN0IHdyb3RlIHRoZSB2NTEuMCBvbiB0b3Agb2YgaXQgYW5kIHNlbnQgYm90
aCBhcyBhIHJlbWFpbmRlciB0aGF0IHY1MC4wIHdhcyAKPiBzdGlsbCB0aGVyZS4KPiAKPiBEbyB5
b3UgcHJlZmVyIEkgc2VuZCBhIHNxdWFzaGVkIHZlcnNpb24gb2YgdGhvc2UgaW4gYSB2Mz8KCiAg
WWVzISBXZWxsLCBpdCdzIG5vdCBzdXBlciBpbXBvcnRhbnQgbm93IGJlY2F1c2Ugd2UgY2FuIGFs
c28gZWFzaWx5IGRvIHRoYXQgCndoaWxlIGFwcGx5aW5nLCBidXQgaXQncyBsZXNzIHdvcmsgZm9y
IHVzIGlmIHlvdSBkbyBpdCA6LSkKCiAgSXQncyBqdXN0IHRoYXQgYmVjYXVzZSBpdCB3YXMgaW4g
dHdvIHNlcGFyYXRlIHBhdGNoZXMsIEkgdGhvdWdodCB0aGVyZSB3YXMgYSAKcmVhc29uIGZvciBp
dCAoZS5nLiB0aGF0IHRoZSB2NTAuMCBidW1wIHdhcyBhIHNlY3VyaXR5IGJ1bXAgYW5kIHNob3Vs
ZCBiZSAKYXBwbGllZCB0byAyMDI0LjAyLnggYXMgd2VsbCkuCgogIFJlZ2FyZHMsCiAgQXJub3V0
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
