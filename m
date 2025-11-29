Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60752D116EA
	for <buildroot@archiver.kernel.org>; Sat, 29 Nov 2025 20:38:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE999606E8;
	Sat, 29 Nov 2025 20:38:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jXAaUg2ELjIg; Sat, 29 Nov 2025 20:38:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3AF4606D9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3AF4606D9;
	Sat, 29 Nov 2025 20:38:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DE31708
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 20:38:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0032640C06
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 20:38:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xherNVz2ZDfm for <buildroot@buildroot.org>;
 Sat, 29 Nov 2025 20:38:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e31; helo=mail-vs1-xe31.google.com;
 envelope-from=softwarej@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3CEEC40C01
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CEEC40C01
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com
 [IPv6:2607:f8b0:4864:20::e31])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3CEEC40C01
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 20:38:18 +0000 (UTC)
Received: by mail-vs1-xe31.google.com with SMTP id
 ada2fe7eead31-5dfd4a02638so807329137.2
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 12:38:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764448697; x=1765053497;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=t+vC2satUFf+KhoRb4FXCxNJ1uu1M5uYgpeOROvby2c=;
 b=bFKZMP7cD24/mz43r+nnfsd2k8keSFdeQ0kTAjW2T6+6Tk7BwgGx648WounrgNS0ou
 mIu5oq4LJR+VkgQ7ZtTbAo20hEhxoVLJdsHhEia8mgWy1Y2xn0FPa+kgnx6/VWNE7uQ5
 KXLb/eOG4u3mLAym/kDBTAiQhVbCAAL8eQwnJ9DzkibSe/ELoqdY57dYPmAeoE2rflDu
 WquQCCTQWnNVjzE4iSaOWWBeRpVzUvyZob7PhGNuX+47eHfSBIG1HnfAT1zC2GBhzkuh
 1ZkGsgRH4ma+/PYMBlfAUSReS3QZkrhhTJ3GBuhVQhrIeQn9CdjpZrT+YLDilnbIi+Bz
 HXQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhytIB10L5CCXRmpkEBmSfvOBz9yHUzgX8c2bzV4+WyqyTFN9QyN4d4OisvUMpklfQ6TyaFw92y0g=@buildroot.org
X-Gm-Message-State: AOJu0YwVUAkeToE9gm5MILnjByqdpUEz9G4Wf3dZhrK3ARry/QL+JUO3
 UYSk2oo4hGFJfGCk7fViNZLrVjxEsYFRSG8dk5ZPqGZBTLTnW4Q8UxkCfqqkAQLZitgUq8/2JOc
 E0NbVV37CwsslagA/HwlVdtAPNAiGpbQ=
X-Gm-Gg: ASbGncv4iKceRZSjF91sUn7ra3cKn84l7LlhtSMj9NbkGN11xJuWgmHH9DsMXqdtBtV
 sotg28d1grzh5Z53dcTqnaj3T5jgX7ZI0Jh4NJ4bnlcysa9uSa2Znj8FY/p98qKuaP07bdNosfS
 oBIe5ad1h3nhu9mo+A3izoSoMVkzcPa8MM/YMOzyzMkNmuwTKCKbE4arfME3ExLBSqoKAGDonqO
 ShH+uP7sqlnk0pa2oJF8nnZz7ym9f7DFjzDW22JtWd0HbmU3LpJdJt7zUFSgzB+rP25SMs=
X-Google-Smtp-Source: AGHT+IF0LIOqNaGY5S18Oo5mfwRKQPcmpEuJSOuD1/ALIwo0sJq8ZUwV0KOmMJ0/GwJIhTJAWRtXHa+uZr5rjFb45SM=
X-Received: by 2002:a05:6102:2914:b0:5d3:fecb:e4e8 with SMTP id
 ada2fe7eead31-5e1de13755dmr12357596137.5.1764448696613; Sat, 29 Nov 2025
 12:38:16 -0800 (PST)
MIME-Version: 1.0
References: <CAH+XeQYPBnXkXq4Fu0aBJ2UBR_U31ypza4z-1jf2Y78aWWiv-g@mail.gmail.com>
 <aSszM90msDWGlEaa@landeda>
 <9e510762-e34d-41d1-9ec8-11d24a60ed84@grenoble.cnrs.fr>
In-Reply-To: <9e510762-e34d-41d1-9ec8-11d24a60ed84@grenoble.cnrs.fr>
From: =?UTF-8?Q?Jos=C3=A9_Luis_Salvador_Rufo?= <salvador.joseluis@gmail.com>
Date: Sat, 29 Nov 2025 21:38:05 +0100
X-Gm-Features: AWmQ_bnCv8_3qaLzmO1X3nU9oMZEVv-6HrWgjS8ZA6MLpxdPHP7OlvA42lST2D4
Message-ID: <CAH+XeQY8z5i6jdpKZ40sqy_v5ehshtHHQCOLhN92SLwG5u4SgA@mail.gmail.com>
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764448697; x=1765053497; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t+vC2satUFf+KhoRb4FXCxNJ1uu1M5uYgpeOROvby2c=;
 b=LdXdqcHPJUMdj37aLU7C5Niovl/C0PYL8ksmQq6aCkOqwqV4/7zs2ZiWBDAqo8JVWm
 Spm0mhQdwd19f39Kp7J0QNGY1AVQtNkjnGgIMEvctN0LZ6u/4D0CQgAfKCZ6P3wxt+f2
 NQLCHRRcHFu0+J4c8UMakWP95Tcsn6RIEphUqhyc4aMjbWF4VIU3q32gd3EWwx2nZ4LN
 2H0XUE9Oyg2CJReNj8Rx4Uu7s61zWrDK+88Yla7uUfGKyG/2URzco4X7lS+vTplLoGdF
 YVI+uyf4ob1TBa0HfrTNdHjn4fNT3U5vPeJsAJKoZPZz1NrSaG+3p9onLWfOIKkkRyhD
 +kFA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=LdXdqcHP
Subject: Re: [Buildroot] Compilation Issue with Commit
 793ebd5d28095c8df45a0d183d273d8a84b3f0a4
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhhbmsgeW91LCBFZGdhciBCb25ldCwgZm9yIHlvdXIgZXhwbGFuYXRpb24uIEl0IG1ha2VzIGEg
bG90IG9mIHNlbnNlIG5vdy4KCkl0IHdhcyBub3QgbXkgaW50ZW50aW9uIHRvIHN1Ym1pdCBteSBw
cmV2aW91cyBtZXNzYWdlL2RpZmYgYXMgYSBwYXRjaDsKaXQgd2FzIG1vc3RseSBtZWFudCBhcyBh
ICJKdXN0IEZvciBZb3VyIEluZm9ybWF0aW9uIiBvciBhICJSZXF1ZXN0IGZvcgpDb21tZW50cy4i
IE15IGJhZCBmb3Igbm90IHNwZWNpZnlpbmcgdGhhdCBjb3JyZWN0bHkgaW4gdGhlIHN1YmplY3Qu
CkxldCBtZSBzZW5kIGEgcHJvcGVyIHBhdGNoIGluIG15IG5leHQgbWVzc2FnZS4gOy0pCgpHcmVl
dGluZ3MhCgpFbCBzw6FiLCAyOSBub3YgMjAyNSBhIGxhcyAyMDozNSwgRWRnYXIgQm9uZXQKKDxi
b25ldEBncmVub2JsZS5jbnJzLmZyPikgZXNjcmliacOzOgo+Cj4gSGVsbG8hCj4KPiBPbiAyMDI1
LTExLTI5LCBKb3PDqSBMdWlzIFNhbHZhZG9yIFJ1Zm8gd3JvdGU6Cj4gPiBUaGUgY29tbWl0IDc5
M2ViZDVkMjgwOTVjOGRmNDVhMGQxODNkMjczZDhhODRiM2YwYTQgYnJva2UgbXkgY29tcGlsYXRp
b24uCj4gPiBBbiBBSSBzdWdnZXN0ZWQgdGhhdCB0aGUgcHJvYmxlbSBpcyBiZWNhdXNlIHRoZSBz
Y3JpcHQKPiA+IGBzdXBwb3J0L3NjcmlwdHMvY2hlY2stbWVyZ2VkYCByZXF1aXJlcyB0aGUgZm9s
bG93aW5nIGNoYW5nZToKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC9zY3JpcHRzL2NoZWNr
LW1lcmdlZCBiL3N1cHBvcnQvc2NyaXB0cy9jaGVjay1tZXJnZWQKPiA+IGluZGV4IDQ0N2FiZmQ4
MTUuLjIzZmRhYWMyYzggMTAwNzU1Cj4gPiAtLS0gYS9zdXBwb3J0L3NjcmlwdHMvY2hlY2stbWVy
Z2VkCj4gPiArKysgYi9zdXBwb3J0L3NjcmlwdHMvY2hlY2stbWVyZ2VkCj4gPiBAQCAtNDcsNiAr
NDcsOCBAQCB3aGlsZSBnZXRvcHRzICJ0OnViIiBPUFQ7IGRvCj4gPiAgICAgICAgIGVzYWMKPiA+
ICBkb25lCj4gPgo+ID4gK3NoaWZ0ICQoKE9QVElORC0xKSkKPiA+ICsKPiA+ICBpZiBbICIke3R5
cGV9IiA9ICJza2VsZXRvbiIgXTsgdGhlbgo+ID4gICAgICAgICBzdHJpY3Q9dHJ1ZQo+ID4gIGVs
c2UKPiA+Cj4gPiBBZnRlciBhcHBseWluZyB0aGlzIGNoYW5nZSwgbXkgY29tcGlsYXRpb24gd29y
a3MgYWdhaW4sIGluIHRoZSBzYW1lCj4gPiB3YXkgYXMgcmV2ZXJ0aW5nIGNvbW1pdCA3OTNlYmQ1
ZDI4MDk1YzhkZjQ1YTBkMTgzZDI3M2Q4YTg0YjNmMGE0Lgo+ID4gSSBoYXZlbuKAmXQgY2hlY2tl
ZCB0aGUgcmVhc29uIGZvciB0aGlzIGBzaGlmdGAgbXlzZWxmLgo+Cj4gWWFubiBFLiBNb3JpbiBy
ZXBsaWVkOgo+ID4gRGlkIHlvdSB1bmRlcnN0YW5kIHdoeSB0aGUgc3VnZ2VzdGVkIGNoYW5nZSBp
cyBjb3JyZWN0Pwo+Cj4gSSB0b29rIGEgcXVpY2sgbG9vayBhdCB0aGUgY29tbWl0IGluIHF1ZXN0
aW9uICg3OTNlYmQ1ZDI4MDkKPiAic3VwcG9ydC9zY3JpcHRzL2NoZWNrLW1lcmdlZDogdXNlIGdl
dG9wdHMgaW5zdGVhZCBvZiBnZXRvcHQiKS4gTXkKPiB1bmRlcnN0YW5kaW5nIGlzIHRoYXQ6Cj4K
PiAgIOKAoiBCZWZvcmUgdGhhdCBjb21taXQsIHRoZSBvcHRpb25zLXBhcnNpbmcgbG9vcCAoYHdo
aWxlIDo7IGRvYCwgbGluZXMKPiAgICAgNDQgdGhyb3VnaCA2MykgY29uc3VtZWQgKHdpdGggYHNo
aWZ0YCkgdGhlIG9wdGlvbnMgYW5kIGxlZnQgdGhlCj4gICAgIG90aGVyIGFyZ3VtZW50cyBpbiAk
QC4gVGhvc2UgZXh0cmEgYXJndW1lbnRzICh0aGUgcm9vdCBkaXJlY3Rvcmllcwo+ICAgICB0byBj
aGVjaykgd2hlcmUgdGhlbiBjb25zdW1lZCBieSB0aGUgYGZvciByb290OyBkb2AgbG9vcCBsaW5l
cyAxMjUKPiAgICAgdGhyb3VnaCAxNDQuCj4KPiAgIOKAoiBTaW5jZSB0aGF0IGNvbW1pdCwgdGhl
IG9wdGlvbnMtcGFyc2luZyBsb29wIGRvZXMgbm90IGNvbnN1bWUgdGhlCj4gICAgIG9wdGlvbnMg
aXQgZmluZHMuIFRoZSBgZm9yIHJvb3Q7IGRvYCBsb29wIG92ZXIgdGhlIHJvb3QgZGlyZWN0b3Jp
ZXMsCj4gICAgIGhvd2V2ZXIsIGhhcyBub3QgYmVlbiBjaGFuZ2VkLiBUaGlzIGxvb3Agd2lsbCB0
aGVuIGludGVycHJldCB0aGUKPiAgICAgb3B0aW9ucyBhcyBleHRyYSByb290IGRpcmVjdG9yaWVz
IHRvIGNoZWNrLgo+Cj4gQEpvc8OpIEx1aXMgU2FsdmFkb3IgUnVmbzogSSBob3BlIHRoaXMgY2Fu
IGhlbHAgeW91IHdyaXRlIGEgbW9yZQo+IGFwcHJvcHJpYXRlIGNvbW1pdCBtZXNzYWdlLgo+Cj4g
UmVnYXJkcywKPgo+IEVkZ2FyLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
