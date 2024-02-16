Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1ADFC48BC3
	for <buildroot@archiver.kernel.org>; Tue, 20 Feb 2024 07:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4879660093;
	Tue, 20 Feb 2024 07:54:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kNjyFv2RCzWN; Tue, 20 Feb 2024 07:54:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48AE360592
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48AE360592;
	Tue, 20 Feb 2024 07:54:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8B2331BF317
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 07:54:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6DF4C60592
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 07:54:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lmAWvymVb-es for <buildroot@lists.busybox.net>;
 Tue, 20 Feb 2024 07:54:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C210160093
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C210160093
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C210160093
 for <buildroot@buildroot.org>; Tue, 20 Feb 2024 07:54:31 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4125e435b38so22970015e9.0
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 23:54:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708415669; x=1709020469;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JKSpmKpTG6vQVmCuYQjA50EHdKYV031m6Z3rjagUn5E=;
 b=mkMHqPA5L1I7EBBVOva57vEQAtFBHo6vlpwK+90xcgC43ZfHmwkyDp8IRRjcchOsBa
 v5WBJs38XqgDLqptBKlnhnKPoAY/X1dgOGjRKEu6M9S9o/pAUmxYZyMkIgBAylxmXvJo
 4hmhWjk27BS1m9MU0uC9tc0RgNEY1usb94mhYFd89mNymTYiiX9CPn5YPMg4u/oh69Qq
 K19BTCfuloKC8Y7Mhmqw2EMhlBhdonfczSQCwqLYKGiIznMQZrMedVxOFtrthhYC0NN/
 /u809M358158PfeH50NuQbPI7HgnCvxa2yi3ZqDXoFVNwAjMMINr4YXnMQHj5/cIPwbN
 EBZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUh71ZYbqJ9Sw/Ae8Gx+thNMy7SOTJZ1aKHsoN2d8RxE5G6Dl7MVfX4YGWKEzLShXE13z+AClrgu148xyENN1Oyt1egp73/xg==
X-Gm-Message-State: AOJu0YxfeRnyOgyQoS9P7SzLZN3RHSAHzQMaQKUAX8pdJuORxC98f7ge
 5yNr721BAuOc9elk3YKs52vmUdM96CJJWgxJd86xBjQyDUHMDqu1loxYozEQe04Z5NL6d0E3GS+
 w
X-Google-Smtp-Source: AGHT+IHbc+DePEb79/klCMHJEwyDBCXurtDV6tKl18ySYPbSyuQlxrLTdO8asv8koTcQtlX4Xig7TA==
X-Received: by 2002:a05:600c:218f:b0:411:f0c2:8877 with SMTP id
 e15-20020a05600c218f00b00411f0c28877mr9979934wme.38.1708415669027; 
 Mon, 19 Feb 2024 23:54:29 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 6-20020a05600c22c600b004120537210esm13626212wmg.46.2024.02.19.23.54.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 23:54:28 -0800 (PST)
Message-ID: <90a0135a-90ad-4379-8f76-8f23cc009176@mind.be>
Date: Fri, 16 Feb 2024 20:55:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org
References: <20240216131815.318315-1-buildroot@bubu1.eu>
 <10542b7e-f7d5-4197-ae19-ba94706c6595@bubu1.eu>
In-Reply-To: <10542b7e-f7d5-4197-ae19-ba94706c6595@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1708415669; x=1709020469; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JKSpmKpTG6vQVmCuYQjA50EHdKYV031m6Z3rjagUn5E=;
 b=TO53ZyBICTuAmvlFhTMnLI1CNXfEVJRuFBdG/8r4HeMJ3Ftxi8zoQqe8jS7G/iwnq/
 s2lIJ3zoaczGzLEI7X8aVccjy76AySkb6F71eaWaNhpuvkauLDy7cylUi8AQx7ArS2ET
 gjudXZBvNNkCah5wX476laBaGZ2GVatNKLNpKJqiRB/c1EMqYX0e+5tKVce4ZC2lSQb/
 vRucy1e9K96bbgy1FA5BjcISyeGLHfHR4l0a22eBobSYvgmFx5p40nuwjgitmSNLPBfM
 Adbh7XF9ty3mvgDTeDLmFimED64vPRJ0LUzVZQo+4ZqoTziH+e4OIYdgz7rJXnO4U8cI
 gTIA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=TO53ZyBI
Subject: Re: [Buildroot] [PATCH 1/2] support/testing: remove hardcoded sleep
 from python-django test
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxNi8wMi8yMDI0IDE0OjIzLCBNYXJjdXMgSG9mZm1hbm4gdmlhIGJ1aWxkcm9vdCB3cm90
ZToKPiBPbiAxNi4wMi4yNCAxNDoxOCwgTWFyY3VzIEhvZmZtYW5uIHZpYSBidWlsZHJvb3Qgd3Jv
dGU6Cj4+IEluc3RlYWQgb2Ygd2FpdGluZyBmb3IgYSBoYXJkY29kZWQgdGltZSBvZiAzMHMgd2Ug
Y2hlY2sgcGVyaW9kaWNhbGx5IGV2ZXJ5Cj4+IHNlY29uZCBpZiB0aGUgc2VydmVyIGlzIGFscmVh
ZHkgdXAuIElmIGl0IGlzbid0IHVwIGFmdGVyIHRoZSBmdWxsIHRpbWVvdXQKPj4gKHdoaWNoIGlz
IHRoZSBzYW1lIGFzIGJlZm9yZSkgZXhwaXJlZCB0aGUgdGVzdCBmYWlscy4KPj4KPj4gV2UgbmVl
ZCB0byByZWRpcmVjdCBhbGwgb3V0cHV0IG9mIHRoZSBiYWNrZ3JvdW5kIHN0YXJ0ZWQgdGFzayB0
bwo+PiAvZGV2L251bGwgbm93IGFzIGl0IG90aGVyd2lzZSBjb25mdXNlcyB0aGUgZW11bGF0b3Iu
cnVuKCkgZXhpdCBjb2RlCj4+IHBhcnNpbmcgbG9naWMgKGFzIGl0IGdldHMgb3V0IG9mIG9yZGVy
IG1lc3NhZ2VzIGZyb20gdGhlIGVtdWxhdG9yKS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogTWFyY3Vz
IEhvZmZtYW5uIDxidWlsZHJvb3RAYnVidTEuZXU+Cj4+IC0tLQo+PiDCoCAuLi4vdGVzdHMvcGFj
a2FnZS90ZXN0X3B5dGhvbl9kamFuZ28ucHnCoMKgwqDCoMKgwqDCoCB8IDE4ICsrKysrKysrKysr
Ky0tLS0tLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlv
bnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rl
c3RfcHl0aG9uX2RqYW5nby5weSAKPj4gYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90
ZXN0X3B5dGhvbl9kamFuZ28ucHkKPj4gaW5kZXggZTFjYTUwZjZkOC4uMDk3MzQ2N2EyYSAxMDA2
NDQKPj4gLS0tIGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob25fZGph
bmdvLnB5Cj4+ICsrKyBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0aG9u
X2RqYW5nby5weQo+PiBAQCAtMSwzICsxLDUgQEAKPj4gK2ltcG9ydCB0aW1lCj4+ICsKPj4gwqAg
ZnJvbSB0ZXN0cy5wYWNrYWdlLnRlc3RfcHl0aG9uIGltcG9ydCBUZXN0UHl0aG9uUGFja2FnZUJh
c2UKPj4gQEAgLTE2LDEzICsxOCwxNyBAQCBjbGFzcyBUZXN0UHl0aG9uRGphbmdvKFRlc3RQeXRo
b25QYWNrYWdlQmFzZSk6Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBzZWxmLmFzc2VydEluKCJPcGVy
YXRpb25zIHRvIHBlcmZvcm06Iiwgb3V0cHV0WzBdKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgc2Vs
Zi5hc3NlcnRFcXVhbChleGl0X2NvZGUsIDApCj4+IC3CoMKgwqDCoMKgwqDCoCBjbWQgPSAiY2Qg
L29wdC90ZXN0c2l0ZSAmJiAiICsgc2VsZi5pbnRlcnByZXRlciArICIgLi9tYW5hZ2UucHkgCj4+
IHJ1bnNlcnZlciAwLjAuMC4wOjEyMzQgJiAiCj4+IC3CoMKgwqDCoMKgwqDCoCAjIGdpdmUgc29t
ZSB0aW1lIHRvIHNldHVwIHRoZSBzZXJ2ZXIKPj4gLcKgwqDCoMKgwqDCoMKgIGNtZCArPSAic2xl
ZXAge30iLmZvcm1hdChzdHIoMzAgKiBzZWxmLmVtdWxhdG9yLnRpbWVvdXRfbXVsdGlwbGllcikp
Cj4+ICvCoMKgwqDCoMKgwqDCoCBjbWQgPSAiY2QgL29wdC90ZXN0c2l0ZSAmJiAiICsgc2VsZi5p
bnRlcnByZXRlciArICIgLi9tYW5hZ2UucHkgCj4+IHJ1bnNlcnZlciAwLjAuMC4wOjEyMzQgPiAv
ZGV2L251bGwgMj4mMSAmICIKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHNlbGYuYXNzZXJ0UnVuT2so
Y21kLCB0aW1lb3V0PXRpbWVvdXQpCj4+IC0KPj4gLcKgwqDCoMKgwqDCoMKgIGNtZCA9ICJuZXRz
dGF0IC1sdG4gMj4vZGV2L251bGwgfCBncmVwIDAuMC4wLjA6MTIzNCIKPj4gLcKgwqDCoMKgwqDC
oMKgIHNlbGYuYXNzZXJ0UnVuT2soY21kKQo+PiArwqDCoMKgwqDCoMKgwqAgIyBnaXZlIHNvbWUg
dGltZSB0byBzZXR1cCB0aGUgc2VydmVyCj4+ICvCoMKgwqDCoMKgwqDCoCBmb3IgYXR0ZW1wdCBp
biByYW5nZSgzMCAqIHNlbGYuZW11bGF0b3IudGltZW91dF9tdWx0aXBsaWVyKToKPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgdGltZS5zbGVlcCgxKQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBjbWQgPSAibmV0c3RhdCAtbHRuIDI+L2Rldi9udWxsIHwgZ3JlcCAwLjAuMC4wOjEyMzQiCj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF8sIGV4aXRfY29kZSA9IHNlbGYuZW11bGF0b3IucnVu
KGNtZCkKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgZXhpdF9jb2RlID09IDA6Cj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWsKPj4gK8KgwqDCoMKgwqDCoMKgIGVs
c2U6Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNlbGYuYXNzZXJ0VHJ1ZShGYWxzZSwgIlRp
bWVvdXQgd2hpbGUgd2FpdGluZyBmb3IgZGphbmdvIHNlcnZlciIpCj4+IMKgIGNsYXNzIFRlc3RQ
eXRob25QeTNEamFuZ28oVGVzdFB5dGhvbkRqYW5nbyk6Cj4gCj4gVGhlIGRqYW5nbyB0ZXN0IChh
bmQgdGhlIHdoaXRlbm9pc2UgdGVzdCBpbnRyb2R1Y2VkIGluIHRoZSBuZXh0IHBhdGNoKSBhY3R1
YWxseSAKPiBib3RoIGN1cnJlbnRseSBmYWlsIGJlY2F1c2Ugb2YgYSBwcm9ibGVtIHdpdGggZGph
bmdvIDUuMCBhbmQgLnB5YyBvbmx5IAo+IGluc3RhbGxhdGlvbnMuIFsxXQo+IAo+IFRoaXMgbm93
IGhhcyAicmVsZWFzZSBibG9ja2VyIiBwcmlvcml0eSBhdCBkamFuZ28gYW5kIGEgcHJvcG9zZWQg
cGF0Y2ggKHRoYXQgSSAKPiB0ZXN0ZWQgbG9jYWxseSBidXQgaGFzbid0IGJlZW4gb2ZmaWNpYWxs
eSBzdWJtaXR0ZWQgdG8gZGphbmdvIHlldCkgc28gaG9wZWZ1bGx5IAo+IHRoaXMgd2lsbCBiZSBm
aXhlZCB3aXRoIHRoZSBuZXh0IGRqYW5nbyBwb2ludCByZWxlYXNlIGluIGEgY291cGxlIG9mIHdl
ZWtzLgoKICBVZ2gsIGFuZCB3ZSdyZSBjdXR0aW5nIDIwMjQuMDItcmMxIHJpZ2h0IGFib3V0IG5v
dy4uLiBJIGd1ZXNzIHlvdSBjYW4gc3VibWl0IAp0aGF0IHBhdGNoIGRpcmVjdGx5IHRvIEJ1aWxk
cm9vdCB0aGVuPyBPciBpcyB0aGUgcG9pbnQgcmVsZWFzZSBnb2luZyB0byBiZSBhIAptaW5vciBv
bmUgdGhhdCB3ZSBjYW4gc3RpbGwgYXBwbHkgdG8gdGhlIG1hc3RlciBicmFuY2ggaW4gdGhlIHJj
IHBlcmlvZD8KCiAgUmVnYXJkcywKICBBcm5vdXQKCj4gCj4gWzFdIGh0dHBzOi8vY29kZS5kamFu
Z29wcm9qZWN0LmNvbS90aWNrZXQvMzUxODcKPiAKPiBNYXJjdXMKPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
