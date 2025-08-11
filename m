Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA59C87FDB
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 15:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 355C1613C9;
	Mon, 11 Aug 2025 15:11:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2rr-7Or04TOA; Mon, 11 Aug 2025 15:11:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C65861405
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C65861405;
	Mon, 11 Aug 2025 15:11:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A5A73154
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 15:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8970B61405
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 15:11:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YW9YJ6Rys8_N for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 15:11:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 615C5613C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 615C5613C9
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 615C5613C9
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 15:11:26 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-af96524c5a9so586478666b.1
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 08:11:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754925084; x=1755529884;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xhwLQIh3adC8QrRQRt98GpVU8sJfFUjGFxPg6WfBpVo=;
 b=q1aFrNu5JHvrXEKL+vFBtQIWtBzNW8OA6hI7fH0vtEFKWyZ/vsU/+AlgZWyuV+6Xu4
 pqPEXer9L0RWk1ua7GQOPYebAg+h11NfdRiSAUO2rN9q73SmFy3OTpGanSH0Liz7vBuF
 mgtyWLfut+sFIL5dyRqCPMKVUT2j9ve5VWtmQjqN8SX0sXltOp0m+Fq+x/zC5koErojJ
 55IupgWnZwBLbFdafjWDzuuKjZ4Yr06nAQd8vExFXbQbtxfVQ6JVvHqGxwn987pXyCQ0
 k4LNhOd6g9oxdGwavq9yKDsksiIxjZrGkmXCRyakckBaekF78s3qkDjHW8Pz0GRZfO9f
 PgNA==
X-Gm-Message-State: AOJu0YzOF63Ct/QHKT9YdDoTnLAmjkDz7rNMYNdz+HgqxdUfOitlKb6P
 algMrNC3Nd0ZSWLeUThKoEf2Q302vQw4oDBWVegYYuLZ8jw/iBoh5iGDT85Quo+YD6o=
X-Gm-Gg: ASbGnctwxO1m56YYx5uwS9DxkZqKMm4Ylwh2iiCfLJwyJ/YICCVAlKynpJtVb4rlJot
 V6ikKFFr+ZNHvrAOevP+x1olA0sh8glKHrn+bba9mzbZ8Zk1pVxl9S45cfpfj7FJr/CadFCFf3n
 bl4HHcgqGzYM/2pFBAU6VUfHRG54DuQCdHu5++BVyXcrgDKkx+G9dUTS9qz4Db/iX021VvGUWOG
 UvdfhZiK1RR4h8JpLfQJpWI5Ue0ShLn32JSfZ/YGReINKk56GsclotlKq+IL2SIiHr4RAcUpkIK
 jqlocWz4cp1Iq6NOLxVYIfenYiwzvgGSwO4Um+8Xm0wx+sINXzpC8rUrC/FHBdwEB44EVpW7NF8
 cDve8m2mbguVjXySg716mAzoEvmP/LCi5wgrWawvtkUWTJrPKR1kns8dwqtCWCJ/i/AUEuEVRvP
 55BQUYFU8=
X-Google-Smtp-Source: AGHT+IFSx17NkDhhPxPZbd4pWqVO7lsZ9Y250GuXzeq5M7i5ag2RTg5vnJrecetwXRsJN7wbH56ojg==
X-Received: by 2002:a17:907:9281:b0:af8:fa64:917f with SMTP id
 a640c23a62f3a-af9c650abc2mr1271365766b.48.1754925084006; 
 Mon, 11 Aug 2025 08:11:24 -0700 (PDT)
Received: from [10.5.0.176] (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0766d1sm2044468666b.18.2025.08.11.08.11.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 08:11:23 -0700 (PDT)
Message-ID: <db83c7e2-9f08-48e0-bdef-92e6ceceb89e@mind.be>
Date: Mon, 11 Aug 2025 17:11:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Daniel Price <daniel.price@gmail.com>
References: <20250811090700.20714-1-titouan.christophe@mind.be>
 <6ae17cd572cb689f27a1c1d959969c18@free.fr>
Content-Language: en-US
In-Reply-To: <6ae17cd572cb689f27a1c1d959969c18@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754925084; x=1755529884; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xhwLQIh3adC8QrRQRt98GpVU8sJfFUjGFxPg6WfBpVo=;
 b=e60x9Om9tFyntuDsoLOVdMpQnHY0xb9HfLuLY4ysRHAGmc/F7SOYg7EG28r/6/Ye3m
 HFlSlQH7qq52FXEsiD5CB+c1lmZlAfbqPLGyKm9H9mXUSjIHKDYnm3eHB0z8lMfIt/qu
 /MHSZp4fh+zCvRtpN9FyMGIxZc8p7FAyy/eo9VQ+e1V4qlWksmwOMoGMe9U27tQmc511
 EiJgACiMgszDcHJ37dwtu4FtTE0Dl7JJvN3o/LzpcGFG3GkXH83EZMoX0FuWwnRMfn6h
 SCLXJWOdWiN5OBcxXNhbKnOtHMZNyE6MIGFvo1uYZsMpooxVL/4ycbnH0IwMoQ49vZD/
 AkrA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=e60x9Om9
Subject: Re: [Buildroot] [PATCH] package/redis: bump to v8.2.0
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSnVsaWVuLAoKT24gMTEvMDgvMjUgMTY6NTEsIEp1bGllbiBPbGl2YWluIHdyb3RlOgo+
IEhpIFRpdG91YW4sCj4KPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KPgo+IE9uIDExLzA4LzIw
MjUgMTE6MDcsIFRpdG91YW4gQ2hyaXN0b3BoZSB2aWEgYnVpbGRyb290IHdyb3RlOgo+PiBGcm9t
IHRoZSByZWxlYXNlIG5vdGVzOgo+PiAoaHR0cHM6Ly9naXRodWIuY29tL3JlZGlzL3JlZGlzL2Js
b2IvOC4yLjAvMDAtUkVMRUFTRU5PVEVTKQo+Pgo+PiA9PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+PiA4LjIgR0EgKHY4LjIuMCnCoMKg
wqAgUmVsZWFzZWQgTW9uIDQgQXVnIDIwMjUgMTU6MDA6MDAgSVNUCj4+ID09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09IAo+Cj4gVGhpcyBp
cyBhIHNob3J0IHN1bW1hcnkgZm9yIHRoZSA4LjIuMCByZWxlYXNlLiBMb29raW5nIGF0IHRoZSBm
dWxsCj4gcmVsZWFzZSBub3RlOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9yZWRpcy9yZWRpcy9ibG9i
LzguMi4wLzAwLVJFTEVBU0VOT1RFUwo+Cj4gV2Ugc2VlIHRoZSBjaGFuZ2VzIGZyb20gOC4wLjMg
dG8gOC4yLjAgaW5jbHVkZXMgdGhyZWUgc2VjdXJpdHkgZml4ZXM6Cj4gLSAoQ1ZFLTIwMjUtMzIw
MjMpIEZpeCBvdXQtb2YtYm91bmRzIHdyaXRlIGluIGBIeXBlckxvZ0xvZ2AgY29tbWFuZHMKPiAt
IChDVkUtMjAyNS00ODM2NykgUmV0cnkgYWNjZXB0aW5nIG90aGVyIGNvbm5lY3Rpb25zIGV2ZW4g
aWYgdGhlIAo+IGFjY2VwdGVkIGNvbm5lY3Rpb24gcmVwb3J0cyBhbiBlcnJvcgo+IC0gKENWRS0y
MDI1LTI3MTUxKSByZWRpcy1jaGVjay1hb2YgbWF5IGxlYWQgdG8gc3RhY2sgb3ZlcmZsb3cgYW5k
IAo+IHBvdGVudGlhbCBSQ0UKPgo+IFNvIEkgYmVsaWV2ZSB0aGlzIHBhdGNoIHNob3VsZCBiZSBt
YXJrZWQgYXMgInNlY3VyaXR5IGJ1bXAiICh3aXRoIHRoZQo+IGNvcnJlc3BvbmRpbmcgaW5mbyBp
biB0aGUgY29tbWl0IGxvZykuCgpJIHRoaW5rIHRoYXQgdGhlIHJlbGVhc2Ugbm90ZXMgYXJlIHNs
aWdodGx5IG1pc2xlYWRpbmcuIFRoZSBtZW50aW9uZWQgCkNWRSBmaXhlcyBhcmUgaW4gYSBzZWN0
aW9uIGVudGl0bGVkICJTZWN1cml0eSBmaXhlcyAoY29tcGFyZWQgdG8gCjguMi1SQzEpIi4gSWYg
d2UgbG9vayBhdCBgZ2l0IGxvZyBwYWNrYWdlL3JlZGlzYCBpbiBCdWlsZHJvb3QsIHdlIHNlZSAK
dGhhdCB0aGUgbGFzdCAyIGNvbW1pdHMgYXJlOgoKLSBjODdkZGQ2ZWU0NzFkOGIzYTI2YTY4NDcx
MmE0NTI5ZWM1NzU1ZTA0IGJ1bXAgdG8gdjguMC4zCiDCoCDCoCBmaXhlczogQ1ZFLTIwMjUtMzIw
MjMsIENWRS0yMDI1LTQ4MzY3CgotIDNjODc0ZTFhOTQ5MjViNDZhNzNhMzk0ODI1YzY1Y2EyZTA0
YzJhY2UgYnVtcCB0byB2OC4wLjIKIMKgIMKgIGZpeGVzOiBDVkUtMjAyNS0yNzE1MQoKVG8gdGhl
IGJlc3Qgb2YgbXkgdW5kZXJzdGFuZGluZywgaXQgbG9va3MgbGlrZSBSZWRpcyA4LjIgd2FzIGlu
IHRoZSAKd29ya2luZyBmb3IgcXVpdGUgc29tZSB0aW1lLiBUaGUgQ1ZFcyB3ZXJlIGZpeGVkIGNv
bmN1cnJlbnRseSBvbiB0aGUgCnByZXZpb3VzIGJyYW5jaGVzLCBhbmQgd2VyZSB0aGVuIHBvcnRl
ZCBvbnRvIDguMiBiZWZvcmUgdGhlIEdlbmVyYWwgCkF2YWlsYWJpbGl0eSByZWxlYXNlLgoKVGhl
cmVmb3JlIGFsbCBzZWN1cml0eSBpc3N1ZXMgaGF2ZSBiZWVuIGFkZHJlc3NlZCBhbHJlYWR5IGlu
IEJ1aWxkcm9vdCwgCmFuZCB0aGlzIHZlcnNpb24gYnVtcCBjb250YWlucyBvbmx5IG5ldyBmZWF0
dXJlcy4KCj4KPiBDb3VsZCB5b3Ugc2VuZCBhbiB1cGRhdGVkIHBhdGNoLCBwbGVhc2U/CgpDb25z
ZXF1ZW50bHksIEkgZG9uJ3QgdGhpbmsgYSBuZXcgcGF0Y2ggcmV2aXNpb24gaXMgbmVlZGVkLgo+
Cj4gQmVzdCByZWdhZWRzLAo+Cj4gSnVsaWVuLgoKVGhhbmsgeW91IGZvciB5b3VyIHRob3JvdWdo
IHJldmlldywgYXMgdXN1YWwgIQoKS2luZCByZWdhcmRzLApUaXRvdWFuCgooUFM6IHNvcnJ5IGZv
ciB0aGUgZG91YmxlIGVtYWlsICEgSSB1bmludGVudGlvbmFsbHkgcmVwbGllZCB0byBKdWxpZW4g
Cm9ubHksIGFuZCB0aGlzIHNob3VsZCBub3cgYmUgZ29pbmcgdG8gdGhlIG1haWxpbmcgbGlzdCkK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
