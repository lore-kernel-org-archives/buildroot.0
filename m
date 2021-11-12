Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82682C433F5
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 18:50:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3DC360F93
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 18:50:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F3DC360F93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0EB9405F8;
	Fri, 12 Nov 2021 18:50:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T74op8dlI8aU; Fri, 12 Nov 2021 18:50:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B596405D5;
	Fri, 12 Nov 2021 18:50:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 179731BF289
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 18:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 06FF0405D5
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 18:50:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U9oEhYXP_0wW for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 18:50:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0147D405BE
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 18:50:22 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id i12so7684279wmq.4
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 10:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=H3jXM1axwOIjdMhrY/G6XKvOy4u1NyzBTFbbpQizZ4M=;
 b=Uw0nG6yDhyxaYsTUah2SmWVe8AvsgyhjvZlGa2H/JaBwwk8aM2jErK6i8IzA4LVX/2
 1F22gVQJO5Ay87rrKSX+LhioCY0cDZEb8IqCUiZg8hKara3mUyDdIkCkXFt2GkWhSis3
 mv4XjwbpvIH1KvNz5msxq5Y2ZaLOK8xh8o7ackLz9wSxgsXAbCazPK34jX+tvyPZmG95
 U+cGshgyszVGafVRRx2irfiBEaqr41IfuhHQXjZ+CixrepeveMiSc/ABlg7L2FmGYmlN
 UQ4c4CaI1381w9HFQP50xIqaGCEARLTVnD14Dl1RS/uoXHk+LyzS8hXuBDAEB5UbpT4V
 kyNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=H3jXM1axwOIjdMhrY/G6XKvOy4u1NyzBTFbbpQizZ4M=;
 b=qoa6y7i7q2KxMawk935Qwtb13j+ZpEaiFgpZ69UsvAHL6CC8mWHJ04Ewzru6GRyebE
 COrDqieyujk02/qmnaIILSBqijbxMlm2WnHnopkf+0JONCg9w2NCYQNP/ofRp5i1dUIt
 AqhkIoD77z918dk4wwqJT3vhRbhfj3D7r1cvnkMwCQbjMUQivA5CyAxy8lrzen8DsGCO
 4Mr3PZDZUw+45xGCeaZNqzgJ6CGq1NJ1NkgdxlK/7IeRTrLKtPuqT5uYJ6oevF/wM/c6
 hbf1Q4Z6K49T2hIliUotCkoNaFbuWPoKlYkd9Hp69MCV0ypi8drazqAXEH7EehlYfpfk
 AmLA==
X-Gm-Message-State: AOAM533K/0bpbCg2aV7x+GHKNlKIoQ3Utgbp5YGsTv5k063aN+FKyQEU
 FONtgBpAbbrP4TL4998lKP3Pjdv3bfc=
X-Google-Smtp-Source: ABdhPJwLM1UfzAjgA2npYUZwNqaOs9gKQVH6ugV7T5WwGcMznuDk78zVSuNm9ujbSDSg3c4fFmBivA==
X-Received: by 2002:a1c:4d15:: with SMTP id o21mr36546540wmh.171.1636743021256; 
 Fri, 12 Nov 2021 10:50:21 -0800 (PST)
Received: from [192.168.1.39] (arennes-651-1-314-16.w2-12.abo.wanadoo.fr.
 [2.12.73.16])
 by smtp.gmail.com with ESMTPSA id o2sm6718602wrg.1.2021.11.12.10.50.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Nov 2021 10:50:20 -0800 (PST)
Message-ID: <2532ae99-27a2-7f6e-ec45-09c42e41bf62@gmail.com>
Date: Fri, 12 Nov 2021 19:50:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20211112110007.787836-1-romain.naour@gmail.com>
 <20211112110007.787836-2-romain.naour@gmail.com>
 <20211112130742.GL2609@scaer>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20211112130742.GL2609@scaer>
Subject: Re: [Buildroot] [PATCH 1/6] package/luvi: don't use LUAJIT_VERSION
 for the luajit installation path
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
Cc: =?UTF-8?Q?J=c3=b6rg_Krause?= <joerg.krause@embedded.rocks>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

WWFubiwKCkxlIDEyLzExLzIwMjEgw6AgMTQ6MDcsIFlhbm4gRS4gTU9SSU4gYSDDqWNyaXTCoDoK
PiBSb21haW4sIEFsbCwKPiAKPiBJIGFnYWluIGhvdCAic2VuZCIgdG9vIGZhc3Q7IHNlZSBhIGNv
bXBsZW1lbnQgYmVsb3cuLi4KPiAKPiBPbiAyMDIxLTExLTEyIDEyOjAwICswMTAwLCBSb21haW4g
TmFvdXIgc3Bha2UgdGh1c2x5Ogo+PiBMdWFqaXQgcGFja2FnZSBoYXMgYmVlbiByZWNlbnRseSB1
cGRhdGVkIHRvIHRoZSBsYXRlc3QgY29tbWl0IGluIHRoZQo+PiBtYXN0ZXIgYnJhbmNoIFsxXS4g
U2luY2UgdGhlbiBMVUFKSVRfVkVSU0lPTiBkb2Vzbid0IGNvbnRhaW4gdGhlIGx1YWppdAo+PiB2
ZXJzaW9uIGFueW1vcmUgYnV0IGEgY29tbWl0IGhhc2g6Cj4+Cj4+IExVQUpJVF9WRVJTSU9OID0g
MDVmMTk4NGUxYTg2MmU0YjNkM2MzYjM3MGM3NzM0OTJlMmVkZjg0YQo+Pgo+PiBVc2UgcGtnLWNv
bmZpZyAtLXZhcmlhYmxlPXZlcnNpb24gbHVhaml0IGluIGx1dmkgcGFja2FnZSB0byBzZXQKPj4g
TFVBX1BBVEggY29ycmVjdGx5Lgo+Pgo+PiBGaXhlczoKPj4gbHVhaml0OiB1bmtub3duIGx1YUpJ
VCBjb21tYW5kIG9yIGppdC4qIG1vZHVsZXMgbm90IGluc3RhbGxlZAo+Pgo+PiBodHRwczovL2dp
dGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzE3MTA1NTI2MDUKPj4KPj4g
WzFdIDk0NTBiNTNjOGUwNmYxYjVhNzU4NDBiODJjMGY0NjYzYTVkNzVjNDUKPj4KPj4gU2lnbmVk
LW9mZi1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPgo+PiBDYzogSsO2
cmcgS3JhdXNlIDxqb2VyZy5rcmF1c2VAZW1iZWRkZWQucm9ja3M+Cj4+IFRlc3RlZC1ieTogSsO2
cmcgS3JhdXNlIDxqb2VyZy5rcmF1c2VAZW1iZWRkZWQucm9ja3M+Cj4+IEFja2VkLWJ5OiBGcmFu
Y29pcyBQZXJyYWQgPGZyYW5jb2lzLnBlcnJhZEBnYWR6Lm9yZz4KPj4gLS0tCj4+IFRoZSBUZXN0
THV2aSBkb2Vzbid0IHdvcmsgeWV0IGR1ZSB0byBtaXNzaW5nIHJuZyBzdXBwb3J0IG9uIFFlbXUg
YXJtdjcgdGFyZ2V0Cj4+IHVzZWQgdG8gcnVuIHRoZSB0ZXN0LiBsdXZpIC12IGlzIHN0dWNrIGR1
ZSB0byBnZXRyYW5kb20oKS4KPj4gLS0tCj4+ICBwYWNrYWdlL2x1dmkvbHV2aS5tayB8IDggKysr
KysrLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
Cj4+Cj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2x1dmkvbHV2aS5tayBiL3BhY2thZ2UvbHV2aS9s
dXZpLm1rCj4+IGluZGV4IDM4NmRhYWZjMzEuLmVmNTc3N2NhYzggMTAwNjQ0Cj4+IC0tLSBhL3Bh
Y2thZ2UvbHV2aS9sdXZpLm1rCj4+ICsrKyBiL3BhY2thZ2UvbHV2aS9sdXZpLm1rCj4+IEBAIC05
LDcgKzksNyBAQCBMVVZJX1NPVVJDRSA9IGx1dmktc3JjLXYkKExVVklfVkVSU0lPTikudGFyLmd6
Cj4+ICBMVVZJX1NJVEUgPSBodHRwczovL2dpdGh1Yi5jb20vbHV2aXQvbHV2aS9yZWxlYXNlcy9k
b3dubG9hZC92JChMVVZJX1ZFUlNJT04pCj4+ICBMVVZJX0xJQ0VOU0UgPSBBcGFjaGUtMi4wCj4+
ICBMVVZJX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFLnR4dAo+PiAtTFVWSV9ERVBFTkRFTkNJRVMg
PSBsaWJ1diBsdWFqaXQgbHV2IGhvc3QtbHVhaml0Cj4+ICtMVVZJX0RFUEVOREVOQ0lFUyA9IGxp
YnV2IGx1YWppdCBsdXYgaG9zdC1sdWFqaXQgaG9zdC1wa2djb25mCj4+ICAKPj4gICMgRGlzcGF0
Y2ggYWxsIGFyY2hpdGVjdHVyZXMgb2YgTHVhSklUCj4+ICBpZmVxICgkKEJSMl9pMzg2KSx5KQo+
PiBAQCAtMzAsMTIgKzMwLDE2IEBAIGVsc2UKPj4gIExVVklfVEFSR0VUX0FSQ0ggPSAkKEJSMl9B
UkNIKQo+PiAgZW5kaWYKPj4gIAo+PiArIyBMVUFKSVRfVkVSU0lPTiBhbmQgdGhlIGx1YWppdCBp
bnN0YWxsYXRpb24gcGF0aCBtYXkgbm90IHVzZSB0aGUKPj4gKyMgc2FtZSB2YWx1ZS4gVXNlIHRo
ZSB2YWx1ZSBmcm9tIGx1YWppdC5wYyBmaWxlLgo+PiArTFVWSV9MVUFKSVRfVkVSU0lPTiA9ICQo
c2hlbGwgJChQS0dfQ09ORklHX0hPU1RfQklOQVJZKSAtLXZhcmlhYmxlPXZlcnNpb24gbHVhaml0
KQo+IAo+IFNob3VsZG4ndCB0aGF0IHZhcmlhYmxlIGJlIHNldCBpbiBsdWFqaXQubWssIGFuZCB0
aGF0IGFsbCBwYWNrYWdlcyB0aGF0Cj4gbmVlZCBpdCB1c2UgaXQ/Cj4gCj4gSW5kZWVkIHRoZSBs
dWFqaXQgdmVyc2lvbiBzdHJnaW4gaXMgc2VtYW50aWNhbGx5IHRoZSByZXNwb25zaWJpbGl0eSBv
Zgo+IGx1YWppdCwgc28gaXQgc2hvdWxkIGJlIHNldCBpbiB0aGVyZS4KCkknbSBub3Qgc3VyZSwg
YmVjYXVzZSB3ZSBuZWVkIExVVklfTFVBSklUX1ZFUlNJT04gaGVyZSBiZWNhdXNlIHRoZSBsdXZp
IGJ1aWxkCnN5c3RlbSBpcyBub3QgYWJsZSB0byByZXRyaWV2ZSB0aGUgbHVhaml0IHZlcnNpb24g
ZnJvbSBwa2ctY29uZmlnLgoKSSdtIG5vdCBhd2FyZSBvZiBhbnkgb3RoZXIgcGFja2FnZSB0aGF0
IHByb3ZpZGUgdHdvIHZlcnNpb25zLgpTb21ldGhpbmcgbGlrZSA/CgpMVUFKSVRfVkVSU0lPTiA9
IDA1ZjE5ODRlMWE4NjJlNGIzZDNjM2IzNzBjNzczNDkyZTJlZGY4NGEKCkxVQUpJVF9SRUFMX1ZF
UlNJT04gPSAyLjEuMC1iZXRhMwoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+IFJlZ2FyZHMs
Cj4gWWFubiBFLiBNT1JJTi4KPiAKPj4gICMgQnVuZGxlZCBsdWEgYmluZGluZ3MgaGF2ZSB0byBi
ZSBsaW5rZWQgc3RhdGljYWxseSBpbnRvIHRoZSBsdXZpIGV4ZWN1dGFibGUKPj4gIExVVklfQ09O
Rl9PUFRTID0gXAo+PiAgCS1EQlVJTERfU0hBUkVEX0xJQlM9T0ZGIFwKPj4gIAktRFdpdGhTaGFy
ZWRMaWJsdXY9T04gXAo+PiAgCS1EVEFSR0VUX0FSQ0g9JChMVVZJX1RBUkdFVF9BUkNIKSBcCj4+
IC0JLURMVUFfUEFUSD0kKEhPU1RfRElSKS9zaGFyZS9sdWFqaXQtJChMVUFKSVRfVkVSU0lPTikv
Py5sdWEKPj4gKwktRExVQV9QQVRIPSQoSE9TVF9ESVIpL3NoYXJlL2x1YWppdC0kKExVVklfTFVB
SklUX1ZFUlNJT04pLz8ubHVhCj4+ICAKPj4gICMgQWRkICJyZXgiIG1vZHVsZSAoUENSRSB2aWEg
YnVuZGxlZCBscmV4bGliKQo+PiAgaWZlcSAoJChCUjJfUEFDS0FHRV9QQ1JFKSx5KQo+PiAtLSAK
Pj4gMi4zMS4xCj4+Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPj4gYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKPj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
