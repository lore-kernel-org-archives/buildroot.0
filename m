Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE002C02182
	for <buildroot@archiver.kernel.org>; Wed, 22 Jan 2025 10:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4965984EF7;
	Wed, 22 Jan 2025 10:40:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V3IVt84Cy_AC; Wed, 22 Jan 2025 10:40:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7696084EBF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7696084EBF;
	Wed, 22 Jan 2025 10:40:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EF9831DA8
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 10:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BCB8884ED0
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 10:40:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yNvnzutjpAQQ for <buildroot@buildroot.org>;
 Wed, 22 Jan 2025 10:40:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3A1C084DD2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A1C084DD2
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A1C084DD2
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 10:40:49 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43618283d48so48129465e9.1
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 02:40:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737542447; x=1738147247;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fsM48+yOXY5GJ0siziKMy2DM4KYt2PL/K+7QjN+HVKY=;
 b=AO0KtzlVPGNPT7RA0HD51UCQqVwwpaokfIJzW0UGo1K0yaHQCSgc7jZO+7tp3eM7MA
 o5+fkrlDZorpnk78B6quHL8i2nNd8wjSmkrNlhWQA1AzWufE6hxa5FNnNTGzi6vRy7Fm
 +3vlD9kx9DjozvgHj4ojQtT+3/CJ+efzvdWDUZNPlnMQSpDwRpiXk5fYFd5oNJ2dRziu
 LTZdRulsf6wOdXIn3rd1uufI8PWT5xQdmOjR9YIU6v9CUMsBP808rGjdL/Mk8k6Rhep3
 30wr5HyaKlgHvLs8KxLbrnDfZipsujh5bdKZ6lBZ4B75eK66P/yBuj+PS4oPSZgXzneh
 KXiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfWm4STK42Y9mJObs+VZHY3+KaUz5AYJUWN/eIZwj6vNYNqmJ2DzYxqEHIgX19tMdoYlc04utWY/I=@buildroot.org
X-Gm-Message-State: AOJu0Yx6k2p469veqkfguBcZ6LN8vWx7T5UcZ1BZpXNV276dnfFnMiRG
 PwB9tQLAxJ9DaxmfvgBcBsUb6tSnTDwRV+zbzpiI+/kE0E7ZeHkCvQn+T5OYLJk=
X-Gm-Gg: ASbGncvJZb+U81lU8c4BNp+xpZc3yP39KdlDrZ2ZWUigFaLyVZq4hxJymBwVlXGufP2
 q5y7Ak93A0LNT5pLKYEvaZ1NwxGp4L7eBMlYkIFmEIqURfrSQjXNv/7NcZEZYlMUTsrxCS587nG
 G2hfe7AylTBXDG0vSHqo9DBS/oWKZOxEB/ZPNgJ7eoCoJaP937gn0ssFrVeXVn7ULmEk7EpWPR9
 FAHWki7hYfvh1+etUENHiASXw/UmFrr1xIxHwW7erAX5CzRvDPdfvpU/av++La7NY5kThchcdMd
 X7LAGFY5VrBphaFvfLE2yZX5rv6Lr/9KsZuE8VxB8tirWzuB20GZLsL7AA==
X-Google-Smtp-Source: AGHT+IEkUqOMyBVIEHGrgi7HP39FzJbp0QyJESaoS48YcZnGxVWwY4ckBF0J+nYHSqLT62DLJvbw2g==
X-Received: by 2002:a05:600c:1e8b:b0:434:f609:1af7 with SMTP id
 5b1f17b1804b1-438913bf885mr204796785e9.4.1737542447528; 
 Wed, 22 Jan 2025 02:40:47 -0800 (PST)
Received: from [10.5.90.34]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438b31a0f47sm19114005e9.15.2025.01.22.02.40.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jan 2025 02:40:47 -0800 (PST)
Message-ID: <5576c173-c1a6-4c85-91dc-b8a6b0a54ba6@smile.fr>
Date: Wed, 22 Jan 2025 11:40:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Michael Walle <mwalle@kernel.org>, Edgar Bonet <bonet@grenoble.cnrs.fr>,
 Buildroot development <buildroot@buildroot.org>
References: <93f83afb-6987-441c-8e06-dab4d43b828f@grenoble.cnrs.fr>
 <D6UG5Z1HUN9N.GWVHB4L823ZC@kernel.org>
Content-Language: en-US
In-Reply-To: <D6UG5Z1HUN9N.GWVHB4L823ZC@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1737542447; x=1738147247; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fsM48+yOXY5GJ0siziKMy2DM4KYt2PL/K+7QjN+HVKY=;
 b=FX8C/dgm7FCwTwLb83X/OQzf4ke+7c9TdD9sszL9zl9GEmAAbdta7v/pf2NyEdsmi9
 dvVAC6U5/qfVLBuoW+DCHtGTssC+maLKFtiQV1i9T059yc4Xmt8RZdyTJv+la69j5jO0
 G0PsCghZVTQANHaUfMuatdsUIZko0Dm4mOmvE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=FX8C/dgm
Subject: Re: [Buildroot] [PATCH v3 1/1] linux: make out-of-tree DTS work
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
Cc: Chris Packham <judge.packham@gmail.com>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRWRnYXIsIE1pY2hhZWwsIEFsbCwKCkxlIDA1LzAxLzIwMjUgw6AgMjI6MTEsIE1pY2hh
ZWwgV2FsbGUgYSDDqWNyaXTCoDoKPiBIaSwKPiAKPj4gRnVsZmlsbGluZyB0aGlzIGtlcm5lbCBl
eHBlY3RhdGlvbiB3b3VsZCByZXF1aXJlIGEgbmV3Cj4+IGNvbmZpZ3VyYXRpb24gcGFyYW1ldGVy
IGZvciB0aGUgbmFtZSBvZiB0aGUgYXBwcm9wcmlhdGUgdmVuZG9yCj4+IHN1YmRpcmVjdG9yeS4K
PiAKPiBObywgdGhhdCBkb2Vzbid0IHdvcmsuIFRoZSB2ZW5kb3IgcGFydCAqaGFzKiB0byBiZSBp
bmNsdWRlZCBpbiB0aGlzCj4gY29uZmlnIG9wdGlvbiBhcyBpdCBtYXkgY29udGFpbiBkaWZmZXJl
bnQgZGV2aWNlIHRyZWUgKGZpbGUgbmFtZXMpLgo+IERvbid0IGFzc3VtZSB0aGUgdmVuZG9yIHBh
cnQgd2lsbCBhbHdheXMgYmUgdGhlIHNhbWUgZm9yIGRpZmZlcmVudAo+IGRldmljZSB0cmVlcy4K
PiAKPiBTb21laG93IHdlIGhhdmUgdG8gc3BsaXQgdGhlIHNvdXJjZSBkaXJlY3Rvcnkgb2YgdGhl
IE9PVCBkZXZpY2UKPiB0cmVlcyBhbmQgdGhlIChyZWxhdGl2ZSkgZGVzdGluYXRpb24gd2l0aGlu
IHRoZSBrZXJuZWwgdHJlZSAoZWcuCj4gJ2ZyZWVzY2FsZS9mc2wtbHMxMDI4YS1teS1kZXZpY2Ut
dHJlZS5kdHMnLCBvciBqdXN0Cj4gJ215LWRldmljZS10cmVlLmR0cycpLiBQbGVhc2Uga2VlcCBp
biBtaW5kIHRoYXQgdGhlIGRldmljZSB0cmVlcwo+IG1pZ2h0IGFsc28gZW5kIHVwIGluIHRoZSB0
YXJnZXQgZmlsZXN5c3RlbSBpbiAvYm9vdCBhbmQgdGhlc2UgbWlnaHQKPiBhbHNvIG5lZWQgdGhl
IHZlbmRvciBwcmVmaXggKHNlZSBCUjJfTElOVVhfS0VSTkVMX0RUQl9LRUVQX0RJUk5BTUUpLgo+
IAo+PiBJdCB3b3VsZCBhbHNvIHJlcXVpcmUgY2hhbmdpbmcgdGhlIHJlbGF0aXZlIHBhdGhzIHRv
IGluY2x1ZGVkCj4+IC5kdHNpIGZpbGVzLgo+IAo+IFllcywgYnV0IEknZCBhcmd1ZSwgdGhhdCB0
aGUgY3VycmVudCBzb2x1dGlvbiBpcyBicm9rZW4gaW4gdGhpcwo+IHJlZ2FyZC4gWWVzIHdlIHNo
b3VsZG4ndCBicmVhayB0aGluZ3MsIGJ1dCBuZXdlciBPT1QgZGV2aWNlIHRyZWVzCj4gc2hvdWxk
IHVzZSB0aGUgc2FtZSAjaW5jbHVkZSBkaXJlY3RpdmVzIGFzIHRoZSBpbi10cmVlIGRldmljZSB0
cmVlcwo+IHRvIGVhc2Ugc2hhcmluZyB0aGUgZmlsZXMgYmV0d2VlbiB1LWJvb3QsIGxpbnV4IGFu
ZCBPT1QgZXh0ZXJuYWwKPiB0cmVlcy4gQXMgb2YgdG9kYXksIGl0J3Mgbm90IChhbHdheXMpIHBv
c3NpYmxlIHRvIHVzZSB0aGUgc2FtZQo+IChPT1QpIGRldmljZSB0cmVlIGZvciB1LWJvb3QgYW5k
IGxpbnV4IGluIGJ1aWxkcm9vdCwgaS5lLiBpZiB0aGUKPiBhcmNoIGhhcyBzdWJkaXJzIGFuZCBv
bmUgdXNlIHRoZSBPRl9VUFNUUkVBTSBjb25maWd1cmF0aW9uIG9wdGlvbiBpbgo+IHUtYm9vdC4K
CkluZGVlZCwgdGhlICNpbmNsdWRlIGRpcmVjdGl2ZSBzaG91bGQgYmUgdGhlIHNhbWUgYXMgZm9y
IHRoZSBpbi10cmVlIGRldmljZQp0cmVlcy4gVGhlIGFjbWVzeXN0ZW1zX2FjcXVhX2E1XyogT09U
IGR0cyAjaW5jbHVkZSBwYXRoIHdhcyB1cGRhdGVkIHRvIHVzZSB0aGUKdmVuZG9yIHByZWZpeCB3
aGlsZSBidW1waW5nIHRvIExpbnV4IDYuNi4xMiBbMV0sIHNvIGl0IHdhcyBwcm9iYWJseSBhCiJ3
b3JrYXJvdW5kIiBvZiB0aGUgQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fRFRTX1BBVEggbGltaXRh
dGlvbi4uLgoKVGhlIHByb2JsZW0gaXMgdGhhdCB3ZSBkZWZpbmUgdGhlIHBhdGggdG8gdGhlIE9P
VCBkdHMgZmlsZSBsaWtlIHRoaXM6CgpCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9EVFNfUEFUSD0i
Ym9hcmQvYWNtZXN5c3RlbXMvYWNxdWEtYTUvYXQ5MS1zYW1hNWQzX2FjcXVhLmR0cyIKClNvIHdl
IGNhbid0IGV4dHJhY3QgdGhlIHZlbmRvciBwcmVmaXggZnJvbSBpdCBldmVuIGlmIGl0IHdvdWxk
IGxvb2sgbGlrZSB0aGlzOgoKQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fRFRTX1BBVEg9ImJvYXJk
L2FjbWVzeXN0ZW1zL2FjcXVhLWE1L2R0cy9taWNyb2NoaXAvYXQ5MS1zYW1hNWQzX2FjcXVhLmR0
cyIKCk5vdGU6IHRoZSB2ZW5kb3IgcHJlZml4IGlzIG5vdCBhbHdheXMgb25lIHN1Yi1kaXJlY3Rv
cnk6CgogIGFyY2gvYXJtL2Jvb3QvZHRzL3RpL29tYXAvZHJhNy5kdHNpCiAgYXJjaC9hcm02NC9i
b290L2R0cy9leHlub3MvZ29vZ2xlL2dzMTAxLmR0c2kKCldlIHByb2JhYmx5IG5lZWQgYSBuZXcg
b3B0aW9uIHRvIHByb3ZpZGUgc29tZXRoaW5nIGxpa2UgYSBkdHMgIm92ZXJsYXkiCkJSMl9MSU5V
WF9LRVJORUxfQ1VTVE9NX0RUU19PVkVSTEFZIChzaW1pbGFyIHRvIEJSMl9ST09URlNfT1ZFUkxB
WSkgdG8gY29weSBhCmR0cyBkaXJlY3RvcnkgZGlyZWN0bHkgdG8gJChMSU5VWF9BUkNIX1BBVEgp
L2Jvb3QvZHRzLwoKICBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9EVFNfT1ZFUkxBWT0iYm9hcmQv
YWNtZXN5c3RlbXMvYWNxdWEtYTUvZHRzIgoKICBib2FyZC9hY21lc3lzdGVtcy9hY3F1YS1hNS9k
dHMvCiAg4pSU4pSA4pSAIG1pY3JvY2hpcAogICAgICDilJTilIDilIAgYXQ5MS1zYW1hNWQzX2Fj
cXVhLmR0cwoKRG9pbmcgc28sIHRoZSBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9EVFNfUEFUSCBz
aG91bGQgYmUgZGVwcmVjYXRlZC4KClRob3VnaHRzPwoKWzFdCmh0dHBzOi8vZ2l0bGFiLmNvbS9i
dWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2NvbW1pdC84ZmI1MjA5ODg1OWZhNWNmN2VjZjRkYjMw
ZmY4ZTAyNzY2ODc4MzJmCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gCj4gLW1pY2hhZWwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
