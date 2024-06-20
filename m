Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C81C27C79
	for <buildroot@archiver.kernel.org>; Thu, 20 Jun 2024 07:02:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D60C884665;
	Thu, 20 Jun 2024 07:02:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wG41kQcfMBZ7; Thu, 20 Jun 2024 07:02:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6EA584661
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6EA584661;
	Thu, 20 Jun 2024 07:02:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D08CD1BF2C4
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 07:02:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC60942E79
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 07:02:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RWrbp0fkhZ13 for <buildroot@lists.busybox.net>;
 Thu, 20 Jun 2024 07:02:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7083842E77
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7083842E77
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7083842E77
 for <buildroot@buildroot.org>; Thu, 20 Jun 2024 07:02:38 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a6ef8bf500dso44167266b.0
 for <buildroot@buildroot.org>; Thu, 20 Jun 2024 00:02:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718866957; x=1719471757;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wsyT8VvLGKOONqqLpjap0BEdyJu19Y1FaUEswpyL5YA=;
 b=G8U3eUZ1YjzpKT6HVt7fczklidiySx798+S384bHHn3PcY4PHZ6se5V/KYFM766VR/
 fJA4ClxxnMTtZ4oli0Fgab9LwO9SQRCok7rDHut7GswHa5O6Qxrk7TOtjXq0+jF3ChJW
 lCy0n9lgG0OLLC8li6UW7TIXzTI6FdMkLGtlMxzUMtMbshXm55a8HHKoNERMfIUqA7Li
 MwItveXc/pYCyrHqMGekv1J4n1mjtwhrRY/bi/lfrgv9PA574meMN+EI8cus9CKT5iTl
 /u3J/B8JIx2fLGkw/htDiFqvYZkb6NgeKewARtRdnXLvT4wPVFnVK13BJ4FCvNIcqvPs
 IvjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQK3sHzpcdl23kkyjyiWRKt9zZ4w4hG0Xs/4Q/cPEe3z78HhZalv4TtM20L+vOq0aSis7yjguJ3nF7kLQivzGmXCNgwtgRpg==
X-Gm-Message-State: AOJu0YzME4LRU3AzvYR5o2Ggs6tLbRMigPvqqxaMzi+z7mUiwSbSR9h6
 Ho2FRBe3+Pgy6PykYo5ic11VHBlKzGd7w6Ig73mtdT5S345PWppewMPCyQPkrTS640hOInpTnIV
 B
X-Google-Smtp-Source: AGHT+IHke4vTB4hfVE5Rusv3l2uRgXvj4k03z3JIFUetEbBLoRonloJ6uvsNg9lCBeyTgZdFV3bcfQ==
X-Received: by 2002:a17:907:808:b0:a6f:586b:6c1 with SMTP id
 a640c23a62f3a-a6fab7756d5mr339923566b.56.1718866956391; 
 Thu, 20 Jun 2024 00:02:36 -0700 (PDT)
Received: from ?IPV6:2a02:a020:5c2:8505:6afd:15b2:9c44:868b?
 ([2a02:a020:5c2:8505:6afd:15b2:9c44:868b])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56ed3590sm739422166b.98.2024.06.20.00.02.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jun 2024 00:02:35 -0700 (PDT)
Message-ID: <7f92b68e-882d-42ee-8ce9-66ba7b604941@mind.be>
Date: Thu, 20 Jun 2024 09:02:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Lance Fredrickson <lancethepants@gmail.com>, buildroot@buildroot.org
References: <20240605212001.1724218-1-lancethepants@gmail.com>
 <10907897-c3bc-48c9-9d11-b8966b58a612@mind.be>
 <3dff7ff6-86fa-4861-862e-5081f56e191b@gmail.com>
Content-Language: en-GB
In-Reply-To: <3dff7ff6-86fa-4861-862e-5081f56e191b@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1718866957; x=1719471757; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wsyT8VvLGKOONqqLpjap0BEdyJu19Y1FaUEswpyL5YA=;
 b=G7D3hfSeWhrsH4y1OEai0TVKxu5i6LCa3CM7InmuVE5DE2eJVRMobM274XOuLO/Bs7
 sLE/7Jm50vEy+HQ/SIViyxzjGDG1YlDF4dhRc6zTstic1Q+TiGF1AG4m4Bf23zhsP1Jj
 YEd8ota3QrM92dvV1lzn8UIvjn2OsTBy8SYGDYTv+Zo+fS3z6cZ/8dZcKTUzqBvaSvpf
 TUOn73iogQCShDiQLVIFwby0/2Geu9O1Lk+6Cco4myHJcFU9TvkUpCfzRfPKT21wbOLQ
 oS3PV7etD88LNCXKBZo/hnwfqT7qGVWrN2fUqdElfsDi87RmEMPPhq9j/tLNL/Q2q7Cl
 CjAQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=G7D3hfSe
Subject: Re: [Buildroot] [PATCH 1/1] boot/syslinux: fix build with GCC 14.x
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

CgpPbiAxOS8wNi8yMDI0IDIyOjQ1LCBMYW5jZSBGcmVkcmlja3NvbiB3cm90ZToKPiBJJ20gbm90
IHN1cmUgSSB1bmRlcnN0YW5kLiBUaGUgcGF0Y2ggd2hpY2ggeW91IGluY2x1ZGVkIGluIHlvdXIg
cmVwbHkgZG9lcyBoYXZlIAo+IGEgIlNpZ25lZC1vZmYtYnkiIGxpbmUgcHJlc2VudC4KCiAgV2l0
aCAidGhlIHBhdGNoIiBJIG1lYW50IDAwMjAtcHVsbC1pbi1zdGRpby1oLWZvci1nY2MxNC5wYXRj
aCwgaS5lLiB0aGUgcGF0Y2ggCmZpbGUgaW5jbHVkZWQgaW4gdGhlIHBhdGNoLiBDb25mdXNpbmcs
IEkga25vdy4uLgoKICBJdCBuZWVkcyBhIHNlcGFyYXRlIHNpZ25vZmYgYmVjYXVzZSB0aGUgbGlj
ZW5zaW5nIHNpdHVhdGlvbiBpcyBkaWZmZXJlbnQ6IApjaGFuZ2VzIHRvIEJ1aWxkcm9vdCBpdHNl
bGYgYXJlIGxpY2Vuc2VkIHVuZGVyIEJ1aWxkcm9vdCdzIGxpY2Vuc2UgKEdQTC0yLjApLCAKd2hp
bGUgcGF0Y2hlcyB0byBhIHBhY2thZ2UgYXJlIGxpY2Vuc2VkIHVuZGVyIHRoYXQgcGFja2FnZSdz
IGxpY2Vuc2UuCgoKPsKgIEFsc28sIHRoZSBsYXN0IHJlbGVhc2Ugb2Ygc3lzbGludXggd2FzIGlu
IDIwMTQsIAo+IGFuZCBidWlsZHJvb3Qgc2VlbXMgdG8gYmUgY2FycnlpbmcgbWFueSBwYXRjaGVz
IGFnYWluc3QgdGhhdCByZWxlYXNlLCBzbyBJIHdhcyAKPiB1bmRlciB0aGUgaW1wcmVzc2lvbiB1
cHN0cmVhbSBpcyBwcm9iYWJseSBub3QgYWNjZXB0aW5nIHBhdGNoZXMgYXQgdGhpcyBwb2ludC4K
CiAgWWVhaCBJIGRpZG4ndCBsb29rIGF0IHRoZSBkZXRhaWxzLiBZb3Ugc3RpbGwgbmVlZCBhbiBV
cHN0cmVhbTogdGFnIGluIHRoYXQgCmNhc2UsIHNvbWV0aGluZyBsaWtlOgoKVXBzdHJlYW06IGRl
YWQgKGxhc3QgcmVsZWFzZSBpbiAyMDE0KQoKPiBUaGUgIkZyb20iIHdoZW4gc2VuZGluZyB0aGlz
IHBhdGNoIGRvZXNuJ3QgbWF0Y2ggbXkgbmFtZSBpbiB0aGUgIlNpZ25lZC1vZmYtYnkiIAo+IGFz
IGFub3RoZXIgbWFpbnRhaW5lciBtZW50aW9uZWQgaW4gYW5vdGhlciBwYXRjaCBJIHNlbnQgaW4s
IGJ1dCB0aGlzIG9uZSB3YXMgCj4gYWxzbyBzZW50IGJlZm9yZSBJIHJlY2VpdmVkIHRoYXQgcmVw
bHkuCgogIFllcywgdGhpcyBoYXBwZW5zIGEgbG90LiBJIGZpeCB1cCB0aGUgYXV0aG9yIHdoZW4g
YXBwbHlpbmcgKHdoZW4gSSBub3RpY2UpLCBzbyAKZG9uJ3Qgd29ycnkgdG9vIG11Y2ggYWJvdXQg
dGhhdCBvbmUuIEl0IGxvb2tzIGxpa2Ugc2V0dGluZyB1cCBnaXQgc2VuZC1lbWFpbCBpcyAKY29t
cGxpY2F0ZWQgOi0pCgogIEdyb2V0ZW4sCiAgQXJub3V0Cgo+IAo+IExhbmNlCj4gCj4gT24gNi8x
OS8yMDI0IDI6MjUgUE0sIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+PiDCoEhpIExhbmNl
LAo+Pgo+PiBPbiAwNS8wNi8yMDI0IDIzOjIwLCBsYW5jZXRoZXBhbnRzIHdyb3RlOgo+Pj4gQWRk
IG1pc3Npbmcgc3RkaW8uaCBpbmNsdWRlLiBXaXRob3V0IGl0IHJlc3VsdHMgaW4gdGhlIGZvbGxv
d2luZyBlcnJvciB1bmRlciAKPj4+IEdDQyAxNC54Cj4+Pgo+Pj4gLi4vLi4vLi4vY29tMzIvbGli
L3N5c2xpbnV4L2RlYnVnLmM6IEluIGZ1bmN0aW9uIOKAmHN5c2xpbnV4X2RlYnVn4oCZOgo+Pj4g
Li4vLi4vLi4vY29tMzIvbGliL3N5c2xpbnV4L2RlYnVnLmM6OTE6NTogZXJyb3I6IGltcGxpY2l0
IGRlY2xhcmF0aW9uIG9mIAo+Pj4gZnVuY3Rpb24g4oCYcHJpbnRm4oCZIFstV2ltcGxpY2l0LWZ1
bmN0aW9uLWRlY2xhcmF0aW9uXQo+Pj4gwqDCoMKgIDkxIHzCoMKgwqDCoCBwcmludGYoIkR5bmFt
aWMgZGVidWcgdW5hdmFpbGFibGVcbiIpOwo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IExhbmNlIEZy
ZWRyaWNrc29uIDxsYW5jZXRoZXBhbnRzQGdtYWlsLmNvbT4KPj4+IC0tLQo+Pj4gwqAgLi4uLzAw
MjAtcHVsbC1pbi1zdGRpby1oLWZvci1nY2MxNC5wYXRjaMKgwqDCoMKgwqAgfCAyNSArKysrKysr
KysrKysrKysrKysrCj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKQo+Pj4g
wqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGJvb3Qvc3lzbGludXgvMDAyMC1wdWxsLWluLXN0ZGlvLWgt
Zm9yLWdjYzE0LnBhdGNoCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2Jvb3Qvc3lzbGludXgvMDAyMC1w
dWxsLWluLXN0ZGlvLWgtZm9yLWdjYzE0LnBhdGNoIAo+Pj4gYi9ib290L3N5c2xpbnV4LzAwMjAt
cHVsbC1pbi1zdGRpby1oLWZvci1nY2MxNC5wYXRjaAo+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQK
Pj4+IGluZGV4IDAwMDAwMDAwMDAuLjY3MTFjN2FhNzgKPj4+IC0tLSAvZGV2L251bGwKPj4+ICsr
KyBiL2Jvb3Qvc3lzbGludXgvMDAyMC1wdWxsLWluLXN0ZGlvLWgtZm9yLWdjYzE0LnBhdGNoCj4+
PiBAQCAtMCwwICsxLDI1IEBACj4+PiArRnJvbSBkZmEyNzA1MTAwYTg5M2JjMDE3ZDIzNDA2ZGFh
OWEzODNmYmMzYzk1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+Pj4gK0Zyb206IGxhbmNldGhl
cGFudHMgPGxhbmNldGhlcGFudHNAZ21haWwuY29tPgo+Pj4gK0RhdGU6IFdlZCwgNSBKdW4gMjAy
NCAxNDozMTozOCAtMDYwMAo+Pj4gK1N1YmplY3Q6IFtQQVRDSF0gY29tMzIvbGliL3N5c2xpbnV4
L2RlYnVnLmM6IGFkZCBtaXNzaW5nIHN0ZGlvLmggaW5jbHVkZS4KPj4+ICsKPj4+ICtGaXhlcyBi
dWlsZGluZyB3aXRoIEdDQyAxNC54Cj4+Cj4+IMKgQXMgY2hlY2stcGFja2FnZSByZXBvcnRzLCB0
aGUgcGF0Y2ggaXMgbWlzc2luZyBhIFNpZ25lZC1vZmYtYnkgKHRvIGluZGljYXRlIAo+PiB0aGF0
IHlvdSBhcmUgYWxsb3dlZCB0byBjb250cmlidXRlIGl0IHVuZGVyIHRoZSBzeXNsaW51eCBsaWNl
bnNlKSBhbmQgYW4gCj4+IFVwc3RyZWFtOiBpbmRpY2F0b3IuIFdlIGV4cGVjdCB5b3UgdG8gc3Vi
bWl0IHRoZSBwYXRjaCB1cHN0cmVhbSBiZWZvcmUgeW91IAo+PiBzdWJtaXQgaXQgdG8gYnVpbGRy
b290Lgo+Pgo+PiDCoFJlZ2FyZHMsCj4+IMKgQXJub3V0Cj4+Cj4+PiArLS0tCj4+PiArIGNvbTMy
L2xpYi9zeXNsaW51eC9kZWJ1Zy5jIHwgMSArCj4+PiArIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQo+Pj4gKwo+Pj4gK2RpZmYgLS1naXQgYS9jb20zMi9saWIvc3lzbGludXgvZGVidWcu
YyBiL2NvbTMyL2xpYi9zeXNsaW51eC9kZWJ1Zy5jCj4+PiAraW5kZXggZDlhYjg2M2YuLmU4ZjUz
ZDU3IDEwMDY0NAo+Pj4gKy0tLSBhL2NvbTMyL2xpYi9zeXNsaW51eC9kZWJ1Zy5jCj4+PiArKysr
IGIvY29tMzIvbGliL3N5c2xpbnV4L2RlYnVnLmMKPj4+ICtAQCAtMSw2ICsxLDcgQEAKPj4+ICsg
I2luY2x1ZGUgPGxpbnV4L2xpc3QuaD4KPj4+ICsgI2luY2x1ZGUgPHN0cmluZy5oPgo+Pj4gKyAj
aW5jbHVkZSA8c3RkYm9vbC5oPgo+Pj4gKysjaW5jbHVkZSA8c3RkaW8uaD4KPj4+ICsKPj4+ICsg
I2lmZGVmIERZTkFNSUNfREVCVUcKPj4+ICsKPj4+ICstLQo+Pj4gKzIuMzkuMgo+Pj4gKwo+IApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
