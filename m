Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0EF7C0218D
	for <buildroot@archiver.kernel.org>; Wed, 29 Jan 2025 10:10:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40D0040564;
	Wed, 29 Jan 2025 10:10:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t0ZRdydrOLSK; Wed, 29 Jan 2025 10:10:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9F0640579
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9F0640579;
	Wed, 29 Jan 2025 10:10:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 07680942
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 10:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E948181E86
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 10:10:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sKHCMstnmMjd for <buildroot@buildroot.org>;
 Wed, 29 Jan 2025 10:10:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 83F7481E66
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83F7481E66
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 83F7481E66
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 10:10:35 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-543cc81ddebso5293826e87.1
 for <buildroot@buildroot.org>; Wed, 29 Jan 2025 02:10:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738145433; x=1738750233;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fTB66koQYhPcU67WX+NM1uOG9k9c6SAJWrkuE01xnSw=;
 b=Xm6yPbU6fRfIkrR8FZhGI9AytXFlaz6+kn7V6NpRj43YarK2kEQsRYtIwWym+fFkH3
 P5AM5FP5iHuSJJcOplc2QhVPPKZrdWlOi6Hv1Kkqv4IorIqxUFt7iAbonk9bKycg9fla
 hy9JDtJCx51Hq8VdQlzGjdJOvDjbWXpyMPhkqQ5s9wJ0jsAXanQnRYPvFaDHORfLklRX
 H/LF2+pZD9P8BqBV5VvyjALQOs0Damn/qGDVwjFk4FfTIDZB4T6my/NKgouyoNjpQ3IK
 Nlo/4tEIDpyLYaeOCcsD0FkPAUZmjWoUn/cNz6pgHEdS39qdbwdAM8LQBDPk04nGLnAb
 8udA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEwkElcUgFUGQKDTD2jDldeFTfLp2sSsR7twqGdoqIC4c3Oqsu/sCrQp/hJapL4wseuApsMXiWuCM=@buildroot.org
X-Gm-Message-State: AOJu0YxICxx6UtOAuD4Fu15warpzSM3ec8W5bqDIQNuEkE43VXz22ZYM
 qLMR4kNnpB4EU3BxbuIGtGE4kvjK14MgXK7nMGlF/GIYPWxW5rjAf03UvT1LN3445KIxup1HgRE
 x
X-Gm-Gg: ASbGncsdNgNZSCBcGS3YMRk7EGKjIqtKhAtqDjuGJz7jEpxAiuxO8T79UQxgB+J24Lm
 2eq1NOLIXKXtGhBczS4ZdwzJcE4Y4Bs/EUMmteL2ulOH/QkmhlcFLS1wQx8eRRXzvDX5nZFO7ji
 FOx9VGCsKSjFvu/IS6i4Yi19USUHj/nyQfvJr7zF1yag+FHSzf5YWCDMzyxT3LaWheCRrLS7LZk
 D79yyIQ2cRHLUK38Icbkq68Hf5+AZTeG+9R+OaESZenHb8dJ3FaubtOTIf59o5Bsv4ObzRapD/j
 YsVGV9ToamaqaQuDUd6wwnI/nJHYprYG8SfxOw8i/KufW1OUD67SBOlealnwFSx0Qes+dtVCmXY
 o75w=
X-Google-Smtp-Source: AGHT+IHPXBmrLX3jn7VGGeakxJpX6lDMgLdo3aeUEAU8d0M7x1nrXL+pkRVDL/rpzsqe8xJNjALrdA==
X-Received: by 2002:a05:6512:1383:b0:542:2192:3eb6 with SMTP id
 2adb3069b0e04-543e4c3ffc6mr683496e87.52.1738145432881; 
 Wed, 29 Jan 2025 02:10:32 -0800 (PST)
Received: from [10.5.90.34]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543c83682e9sm1911743e87.129.2025.01.29.02.10.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 02:10:32 -0800 (PST)
Message-ID: <d01683ed-cc7e-4c0d-a807-7a76ce7129ba@smile.fr>
Date: Wed, 29 Jan 2025 11:10:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, Edgar Bonet <bonet@grenoble.cnrs.fr>,
 Buildroot development <buildroot@buildroot.org>
Cc: Michael Walle <mwalle@kernel.org>, Chris Packham
 <judge.packham@gmail.com>, Sergey Matyukevich <geomatsi@gmail.com>
References: <035d6d78-0a31-4083-8fa1-65f5be5f74b5@grenoble.cnrs.fr>
 <3ea35c40-07d1-41d3-b4f9-08bbb0336d24@smile.fr>
 <4e691513-04a1-4f6f-ad3a-df18f653a6b7@grenoble.cnrs.fr>
 <f6d14b70-cf74-4a03-80fd-5e4fc4325a47@gmx.de>
Content-Language: en-US
In-Reply-To: <f6d14b70-cf74-4a03-80fd-5e4fc4325a47@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1738145433; x=1738750233; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fTB66koQYhPcU67WX+NM1uOG9k9c6SAJWrkuE01xnSw=;
 b=MBRlgUqO/4ZgaVK6LAyX+fSuQA2f/fDZWfpoW0J+Ec5PoLpPO8P4k9gb9340RaHAim
 aqPAiXpb/aWuuxPGly8J2B17TcIH1S++1Yl4bdQcp8DAsrKpfN6h+p5rqk8M0OEpcIe6
 Z4PTwGsMQbL7Yol46/ccfbOUrRR/KQKci2hMI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=MBRlgUqO
Subject: Re: [Buildroot] [PATCH v2 1/1] linux: make out-of-tree DTS work
 with newest kernels
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRmlvbmEsIEFsbCwKCkxlIDI4LzAxLzIwMjUgw6AgMTQ6MzMsIEZpb25hIEtsdXRlIGEg
w6ljcml0wqA6Cj4gQW0gMjQuMTIuMjQgdW0gMTM6MjIgc2NocmllYiBFZGdhciBCb25ldDoKPj4g
SGVsbG8hCj4+Cj4+IE9uIDIwMjQtMTItMTgsIFJvbWFpbiBOYW91ciB3cm90ZToKPj4+IEhlbGxv
IEVkZ2FyLAo+Pj4KPj4+IExlIDE3LzEyLzIwMjQgw6AgMTA6NTUsIEVkZ2FyIEJvbmV0IGEgw6lj
cml0wqA6Cj4+Pj4gU2luY2UgTGludXggNi4xMiAoY29tbWl0IGU3ZTI5NDEzMDBkMiwgImtidWls
ZDogc3BsaXQgZGV2aWNlIHRyZWUgYnVpbGQKPj4+PiBydWxlcyBpbnRvIHNjcmlwdHMvTWFrZWZp
bGUuZHRicyIpLCB0aGUga2VybmVsIGJ1aWxkIHByb2Nlc3MgZG9lcyBub3QKPj4+PiBidWlsZCB0
aGUgRFRCcyBmcm9tIHRoZSBzb3VyY2UgZmlsZXMgbGlzdGVkIGluCj4+Pj4gQlIyX0xJTlVYX0tF
Uk5FTF9DVVNUT01fRFRTX1BBVEguWzFdIFRoaXMgaXMgYmVjYXVzZSBpdCBleHBlY3RzIGFsbCB0
aGUKPj4+PiBEVFMgZmlsZXMgdG8gbGl2ZSBpbiB2ZW5kb3Itc3BlY2lmaWMgc3ViZGlyZWN0b3Jp
ZXMgb2YKPj4+PiBhcmNoLyRBUkNIL2Jvb3QvZHRzLyAsIHdoZXJlYXMgQnVpbGRyb290IGRyb3Bz
IHRoZW0gaW4gdGhlIHRvcCBkdHMKPj4+PiBkaXJlY3RvcnkuCj4+Pgo+Pj4gTWF5YmUgd2UgY291
bGQgYWRkIHNvbWUgYWRkaXRpb25hbCBleHBsYW5hdGlvbjoKPj4+Cj4+PiBCUjJfTElOVVhfS0VS
TkVMX0NVU1RPTV9EVFNfUEFUSCB3YXMgaW50cm9kdWNlZCBpbiBCdWlsZHJvb3QgMjAxMi4wOCBb
MV0gYXQgdGhlCj4+PiB0aW1lIHRoZSBrZXJuZWwgZGlkbid0IGhhdmUgYW55IHZlbmRvci1zcGVj
aWZpYyBzdWJkaXJlY3RvcnkgaW4KPj4+IGFyY2gvJEFSQ0gvYm9vdC9kdHMvLgo+Pj4KPj4+IHZl
bmRvci1zcGVjaWZpYyBzdWJkaXJlY3Rvcnkgd2FzIGludHJvZHVjZWQgaW4ga2VybmVsIHYzLjE5
IFsyXSBmb3IgQVJNNjQgYW5kIGluCj4+PiBrZXJuZWwgdjYuNSBmb3IgQVJNIFszXS4gTm90ZSwg
b3RoZXIgYXJjaCB0aGFuIEFSTSBhbmQgQVJNNjQgZG9lc24ndCBhY3R1YWxseQo+Pj4gdXNlIGEg
dmVuZG9yLXNwZWNpZmljIHN1YmRpcmVjdG9yeSAobm90IGV2ZW4gcG93ZXJwYykuCj4+Cj4+IEkg
aGFkbid0IG5vdGljZWQgdGhhdCB0aGlzIHZhcmllcyBhbW9uZyBhcmNocy4gTm93IHRoYXQgSSBs
b29rIGF0IGl0LCBpdAo+PiBhcHBlYXJzIG1pcHMgYW5kIHJpc2N2IGFsc28gdXNlIHZlbmRvci1z
cGVjaWZpYyBzdWJkaXJlY3Rvcmllcy4KPj4KPj4+IFlvdXIgY29tbWVudCBkb2Vzbid0IHNlZW1z
IHRvIGFwcGx5IGZvciBub24gQVJNeyw2NH0gYXJjaDoKPj4+ICJUaGlzIGlzIGJlY2F1c2UgaXQg
ZXhwZWN0cyBhbGwgdGhlIERUUyBmaWxlcyB0byBsaXZlIGluIHZlbmRvci1zcGVjaWZpYwo+Pj4g
c3ViZGlyZWN0b3JpZXMgb2YgYXJjaC8kQVJDSC9ib290L2R0cy8iCj4+Cj4+IEluZGVlZCwgaXQg
aXMgYXJjaGl0ZWN0dXJlLWRlcGVuZGVudC4KPj4KPj4+IFsxXQo+Pj4gaHR0cHM6Ly9naXRsYWIu
Y29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vCj4+PiBjb21taXQvNjlmYzQ5N2RmMGFlNTFi
Y2M4YTA2N2M4NDk0NDdhYmRlYjNjYjJiZQo+Pj4gWzJdCj4+PiBodHRwczovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9zdGFibGUvbGludXguZ2l0L2NvbW1pdC8/Cj4+
PiBpZD1jYTViMzQxMDBjNTcxNjU4ZTYwNWM1NTU0YWFjMzc0NjQ5NTkzMzI3Cj4+PiBbM10KPj4+
IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3N0YWJsZS9s
aW51eC5naXQvY29tbWl0Lz8KPj4+IGlkPTcyNGJhNjc1MTUzMjA1NWRiNzU5OTJmYzZhZTIxYzNl
MzIyZTk0YTcKPj4+Cj4+Pgo+Pj4+Cj4+Pj4gRnVsZmlsbGluZyB0aGlzIGtlcm5lbCBleHBlY3Rh
dGlvbiB3b3VsZCByZXF1aXJlIGEgbmV3IGNvbmZpZ3VyYXRpb24KPj4+PiBwYXJhbWV0ZXIgZm9y
IHRoZSBuYW1lIG9mIHRoZSBhcHByb3ByaWF0ZSB2ZW5kb3Igc3ViZGlyZWN0b3J5LiBJdCB3b3Vs
ZAo+Pj4+IGFsc28gcmVxdWlyZSBjaGFuZ2luZyB0aGUgcmVsYXRpdmUgcGF0aHMgdG8gaW5jbHVk
ZWQgLmR0c2kgZmlsZXMuCj4+Pj4KPj4+PiBMZXQncyBhZGQgaW5zdGVhZCBhIHJ1bGUgdG8gdGhl
IHRvcCBkdHMvTWFrZWZpbGUgZm9yIGVhY2ggRFRCIHdlIHdhbnQgdG8KPj4+PiBidWlsZC4gVGhp
cyBhdm9pZHMgYnJlYWtpbmcgdXNlcidzIG91dC1vZi10cmVlIGNvbmZpZ3VyYXRpb25zLgo+Pj4+
Cj4+Pj4gWzFdIGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9waXBlcm1haWwvYnVpbGRyb290
LzIwMjQtT2N0b2Jlci83NjU0NjMuaHRtbAo+Pj4KPj4+IE5vdGU6IFlvY3RvIGRvZXNuJ3QgcmVs
eSBvbiB0aGUga2VybmVsIGJ1aWxkIGluZnJhc3RydWN0dXJlIHRvIGJ1aWxkIHVzZXIKPj4+IHBy
b3ZpZGVkIGRldmljZXRyZWUgWzRdLgo+Pj4KPj4+IE1heWJlIHdlIHNob3VsZCBjb25zaWRlciBh
ZGRpbmcgYSBuZXcgcGFja2FnZSBpbmZyYXN0cnVjdHVyZSBsaWtlIGtlcm5lbC1tb2R1bGU/Cj4+
Cj4+IFRoaXMgc2VlbXMgbGlrZSBhbiBpbnRlcmVzdGluZyBvcHRpb24uIEl0IGlzLCBob3dldmVy
LCBiZXlvbmQgbXkKPj4gY2FwYWJpbGl0aWVzLgo+IAo+IEJpdCBsYXRlIHRvIHRoZSBwYXJ0eSwg
YnV0OiBJIGN1cnJlbnRseSBoYXZlIGEgcGFja2FnZSBpbiBhbiBleHRlcm5hbAo+IHRyZWUgdGhh
dCB0YWtlcyBhIGxpc3Qgb2YgLmR0cy8uZHRzbyBmaWxlcyBmcm9tIGNvbmZpZyBhbmQgY2FsbHMg
Y3BwICYKPiBkdGMgdG8gYnVpbGQgLmR0Yi8uZHRibyBmaWxlcywgd2l0aCBpbmNsdWRlIHBhdGhz
IGludG8gdGhlIExpbnV4IGJ1aWxkCj4gZGlyIGFkZGVkLiBUaGUgYnVpbGQgY29tbWFuZHMgYXJl
IG5hdHVyYWxseSBtb2RlbGVkIG9uIGhvdyB0aGUga2VybmVsCj4gYnVpbGQgYnVpbGRzIERUQnMs
IGJ1dCBpdCBkb2Vzbid0IHJlbHkgb24gdGhlIGtlcm5lbCBNYWtlZmlsZXMuCgpBRkFJSywgdGhl
IGN1cnJlbnQgQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fRFRTX1BBVEggb3B0aW9uIGRvZXNuJ3Qg
c2VlbXMgdG8gdGFrZQppbnRvIGFjY291bnQgYW55IGV4dGVybmFsIGRldmljZXRyZWUgb3Zlcmxh
eSBmaWxlcyAoZHRzbykuCgpJJ3ZlIHNlbmQgYSBuZXcgdmVyc2lvbiBvZiB0aGlzIHBhdGNoIChi
dXQgZHRzbyBhcmUgbm90IHN1cHBvcnRlZCk6CgpodHRwczovL2xvcmUua2VybmVsLm9yZy9idWls
ZHJvb3QvMjAyNTAxMjkwOTU3MTYuMjUxMTQzNC0xLXJvbWFpbi5uYW91ckBzbWlsZS5mci9ULyN0
Cgo+IAo+IFdvdWxkIHNvbWV0aGluZyBsaWtlIHRoYXQgYmUgaW50ZXJlc3RpbmcgZm9yIEJ1aWxk
cm9vdCwgd2hldGhlciBhcyBhCj4gZ2VuZXJpYyBEVEIgYnVpbGQgcGFja2FnZSBvciBpbmZyYXN0
cnVjdHVyZT8KCldoaWxlIHJldmlld2luZyB0aGlzIHBhdGNoLCBJIGhhZCB0byB0YWtlIGEgbG9v
ayBhdCBob3cgdG8gYnVpbGQgYSBkdGIgZmlsZQpvdXRzaWRlIG9mIHRoZSBrZXJuZWwgYnVpbGQg
aW5mcmFzdHJ1Y3R1cmUgKGxpa2UgWW9jdG8gZG9lcykgYnV0IGl0J3Mgbm90IGVhc3kuCkFjdHVh
bGx5IHdlIGFyZSBoYXBweSB0byBrZWVwIHRoaXMgYnVpbGQgcHJvY2VzcyBoaWRkZW4gaW4gdGhl
IGtlcm5lbCBNYWtlZmlsZXMuCgpTaW5jZSB0aGUgbmV4dCBCdWlsZHJvb3QgbWVldGluZyBpcyBu
ZXh0IHdlZWssIHRoaXMgaXMgcHJvYmFibHkgYSB0b3BpYyB3ZSBjYW4KZGlzY3Vzcy4gRmVlbCBm
cmVlIHRvIHNlbmQgYSBwYXRjaCAoZXZlbiBhIGRyYWZ0KS4KCkJlc3QgcmVnYXJkcywKUm9tYWlu
CgoKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gRmlvbmEKPiAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
