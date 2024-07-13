Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B74C3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 19:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 775EE40498;
	Sat, 13 Jul 2024 19:52:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MRZOIL-nDNgd; Sat, 13 Jul 2024 19:52:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7ADC40148
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7ADC40148;
	Sat, 13 Jul 2024 19:52:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 357E31BF3F6
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 19:52:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E5E640740
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 19:52:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i67C2Fu6KbX6 for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 19:52:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3863D40720
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3863D40720
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3863D40720
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 19:52:27 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4266ed6c691so19067285e9.3
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 12:52:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720900346; x=1721505146;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WqgXGvukFNGcx4pZHUp21CsxRUPgRj7Eug5Y6YI8EvA=;
 b=HguAcsUOh0RVBQgk4pwPs14yWZT4gCKWAun2Mp7VnfPnbA/SooQdzRryFVocHYXpVe
 DpZsHZyHbWLifzHwZwAcXpwwju0UO55asO+IVzBGtHrByf3uGs5CGPFBewreg+qCMgEY
 9E5RYKl1fCL8pJFvGJWCapjqzmty+/ekj4/MtpAzpAQ4nQH7zL2a61lpzSsGjU52g2gF
 4qYmX4sz+EFwdyGz621bN1CTGHMgrzjnsOS5V7EbxWYqqXdk+UJVrHh0Kiv1jbArdBUH
 FtBQqvD7PgiONNvrVXtnlcNw/6ak/nFqfOUpQEmWwxpKQCQISwMTMllzuHwzjmbqv/8F
 rTbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNqq4BwRwpDV2pPtfa3nhyvMQCBO4Vh5u9OyQhFohbE3bWuX5mMunZukm7YnvK88F/LO8MAdMk8wZK2JYVi+1CVHYTiHxqJQ==
X-Gm-Message-State: AOJu0YzVD3trxhvWTBmyH55dojxLT+PaHMs+gMy7x9wGj0TNiXL+i0Q2
 0hzUDVDaRffy+pUFGj2pFwXnVxDFcAAt5mU0JAjbMbzvCRIIXvdbbId2Dj4jQwY=
X-Google-Smtp-Source: AGHT+IGAV7famfJhTkC9GT6YhE4Q2XsErsHGb5aQSq7yGOyxUGvZXewxj/IErWeLPBspC2j0MCh2TA==
X-Received: by 2002:a05:600c:245:b0:426:6099:6eaa with SMTP id
 5b1f17b1804b1-426708f2020mr94464545e9.26.1720900345964; 
 Sat, 13 Jul 2024 12:52:25 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:f9c8:f443:ffd:1bed?
 (2a01cb05949d5800f9c8f4430ffd1bed.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:f9c8:f443:ffd:1bed])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5edb489sm31603895e9.37.2024.07.13.12.52.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Jul 2024 12:52:25 -0700 (PDT)
Message-ID: <31049610-c55a-4ab4-98f2-a254700a8b86@smile.fr>
Date: Sat, 13 Jul 2024 21:52:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Brandon Maier <brandon.maier@collins.com>, buildroot@buildroot.org
References: <20240701-versal-xsa-support-prebuilt-v3-1-3d3e9318d181@collins.com>
 <7d46feba-19c0-4cb4-aeb9-898e863691a3@smile.fr>
 <D2OJRRC9Z5XN.3I6WU5HEIZB24@collins.com>
 <29dbb9d5-e35d-4ea5-bfda-cb4edac504d9@smile.fr>
Content-Language: fr
In-Reply-To: <29dbb9d5-e35d-4ea5-bfda-cb4edac504d9@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720900346; x=1721505146; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=WqgXGvukFNGcx4pZHUp21CsxRUPgRj7Eug5Y6YI8EvA=;
 b=04aQvBj9wCXH+B0zUbn8hw3M9XiwDi6Yup7fOrQftoiZuFqooI/BPN/QWCavDgj2mQ
 8MD9GdZHlLe9lWeLlXa9hNhmlzPfC3PzwLNnCYKDcY3/qu7KNRgFueYCLCa+LQS4f2KC
 1IY5BLpSIuBWO9HVw7E4P7TIQnDsINu4BaQ2Q=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=04aQvBj9
Subject: Re: [Buildroot] [PATCH v3] boot/xilinx-prebuilt: support custom
 boards using XSA
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQnJhbmRvbiwKCkxlIDEzLzA3LzIwMjQgw6AgMTg6NDYsIFJvbWFpbiBOYW91ciBhIMOp
Y3JpdMKgOgo+IEhlbGxvIEJyYW5kb24sCj4gCj4gTGUgMTMvMDcvMjAyNCDDoCAxODoyMSwgQnJh
bmRvbiBNYWllciBhIMOpY3JpdMKgOgo+PiBPbiBTYXQgSnVsIDEzLCAyMDI0IGF0IDQ6MDggUE0g
VVRDLCBSb21haW4gTmFvdXIgdmlhIGJ1aWxkcm9vdCB3cm90ZToKPj4+IEhlbGxvIEJyYW5kb24s
IEFsbCwKPj4+Cj4+PiBMZSAwMS8wNy8yMDI0IMOgIDE4OjQ4LCBCcmFuZG9uIE1haWVyIHZpYSBi
dWlsZHJvb3QgYSDDqWNyaXTCoDoKPj4+PiBUaGUgeGlsaW54LXByZWJ1aWx0IHBhY2thZ2Ugb25s
eSBzdXBwb3J0cyBkZXZlbG9wbWVudCBib2FyZHMgdGhhdCBYaWxpbngKPj4+PiBoYXMgcHVibGlz
aGVkIGZpcm13YXJlIGZvci4gQ3VzdG9tIGRlc2lnbnMgYmFzZWQgb24gdGhlIFhpbGlueCBwbGF0
Zm9ybQo+Pj4+IG11c3QgZ2VuZXJhdGUgdGhlaXIgb3duIGZpcm13YXJlIHVzaW5nIHRoZSBBTUQg
Vml2YWRvIERlc2lnbiBTdWl0ZS4KPj4+Pgo+Pj4+IFZpdmFkbyBwcm9kdWNlcyBhbiBYU0EgZmls
ZSwgd2hpY2ggaXMgYSBaaXAgZmlsZSBjb250YWluaW5nIGFsbCB0aGUKPj4+PiBmaXJtd2FyZSBu
ZWVkZWQgYnkgeGlsaW54LXByZWJ1aWx0LiBXZSBleHRlbmQgeGlsaW54LXByZWJ1aWx0IHRvCj4+
Pj4gZG93bmxvYWQgY3VzdG9tIFhTQSBmaWxlcyBhbmQgZXh0cmFjdCB0aGVpciBjb250ZW50cy4K
Pj4+Pgo+Pj4+IFJldmlld2VkLWJ5OiBOZWFsIEZyYWdlciA8bmVhbC5mcmFnZXJAYW1kLmNvbT4K
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBCcmFuZG9uIE1haWVyIDxicmFuZG9uLm1haWVyQGNvbGxpbnMu
Y29tPgo+Pj4+IC0tLQo+Pj4+IENoYW5nZXMgaW4gdjM6Cj4+Pj4gLSBSZWJhc2Ugb24gdXBzdHJl
YW0gY2hhbmdlcyB0byBib290L3hpbGlueC1wcmVidWlsdAo+Pj4+IC0gTGluayB0byB2MjogaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MDYyNi12ZXJzYWwteHNhLXN1cHBvcnQtcHJlYnVp
bHQtdjItMS03MjRiMDBjNDU5NmRAY29sbGlucy5jb20KPj4+Pgo+Pj4+IENoYW5nZXMgaW4gdjI6
Cj4+Pj4gLSBGaXggaGVscCB0ZXh0IHRvIHNheSBYU0EgaXMgY3JlYXRlZCBieSBWaXZhZG8gW05l
YWxdCj4+Pj4gLSBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQwNjI1
LXZlcnNhbC14c2Etc3VwcG9ydC1wcmVidWlsdC12MS0xLWY2NGE3YTM5NmEzNEBjb2xsaW5zLmNv
bQo+Pj4+IC0tLQo+Pj4+ICBib290L3hpbGlueC1wcmVidWlsdC9Db25maWcuaW4gICAgICAgICAg
fCAyNCArKysrKysrKysrKysrKysrKysrKysrKysKPj4+PiAgYm9vdC94aWxpbngtcHJlYnVpbHQv
eGlsaW54LXByZWJ1aWx0Lm1rIHwgMjcgKysrKysrKysrKysrKysrKysrKysrKysrLS0tCj4+Pj4g
IDIgZmlsZXMgY2hhbmdlZCwgNDggaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPj4+Pgo+
Pj4+IGRpZmYgLS1naXQgYS9ib290L3hpbGlueC1wcmVidWlsdC9Db25maWcuaW4gYi9ib290L3hp
bGlueC1wcmVidWlsdC9Db25maWcuaW4KPj4+PiBpbmRleCBkM2RmMWMwNmU3Li45NGVmM2RkMTEx
IDEwMDY0NAo+Pj4+IC0tLSBhL2Jvb3QveGlsaW54LXByZWJ1aWx0L0NvbmZpZy5pbgo+Pj4+ICsr
KyBiL2Jvb3QveGlsaW54LXByZWJ1aWx0L0NvbmZpZy5pbgo+Pj4+IEBAIC0zMSw2ICszMSwzMCBA
QCBjb25maWcgQlIyX1RBUkdFVF9YSUxJTlhfUFJFQlVJTFRfVkVSU0FMCj4+Pj4KPj4+PiAgZW5k
Y2hvaWNlCj4+Pj4KPj4+PiArY29uZmlnIEJSMl9UQVJHRVRfWElMSU5YX1BSRUJVSUxUX1ZFUlNB
TF9YU0EKPj4+PiArCWJvb2wgImRvd25sb2FkIGEgcHJlYnVpbHQgVmVyc2FsIFhTQSIKPj4+PiAr
CWRlcGVuZHMgb24gQlIyX1RBUkdFVF9YSUxJTlhfUFJFQlVJTFRfVkVSU0FMCj4+Pj4gKwloZWxw
Cj4+Pj4gKwkgIFRoZSBYaWxpbnggU3VwcG9ydCBBcmNoaXZlIChYU0EpIHByb3ZpZGVzIGN1c3Rv
bSBYaWxpbngKPj4+PiArCSAgZmlybXdhcmUgZmlsZXMgZ2VuZXJhdGVkIGJ5IHRoZSBBTUQgVml2
YWRvIERlc2lnbiBTdWl0ZS4KPj4+PiArCj4+Pj4gKwkgIGh0dHBzOi8vZG9jcy5hbWQuY29tL3Iv
ZW4tVVMvdWcxNDAwLXZpdGlzLWVtYmVkZGVkL0NyZWF0aW5nLWEtSGFyZHdhcmUtRGVzaWduLVhT
QS1GaWxlCj4+Pj4gKwo+Pj4+ICtpZiBCUjJfVEFSR0VUX1hJTElOWF9QUkVCVUlMVF9WRVJTQUxf
WFNBCj4+Pj4gKwo+Pj4+ICtjb25maWcgQlIyX1RBUkdFVF9YSUxJTlhfUFJFQlVJTFRfVkVSU0FM
X1hTQV9MT0NBVElPTgo+Pj4+ICsJc3RyaW5nICJVUkwgb2YgY3VzdG9tIFhTQSIKPj4+PiArCWhl
bHAKPj4+PiArCSAgVGhpcyBvcHRpb24gYWxsb3dzIHRvIHNwZWNpZnkgYSBVUkwgcG9pbnRpbmcg
dG8gYW4gWFNBIHNvdXJjZQo+Pj4+ICsJICBmaWxlLiBUaGlzIFVSTCBjYW4gdXNlIGFueSBwcm90
b2NvbCByZWNvZ25pemVkIGJ5IEJ1aWxkcm9vdCwKPj4+PiArCSAgbGlrZSBodHRwOi8vLCBmdHA6
Ly8sIGZpbGU6Ly8gb3Igc2NwOi8vLgo+Pj4+ICsKPj4+PiArCSAgV2hlbiBwb2ludGluZyB0byBh
IGxvY2FsIFhTQSB1c2luZyBmaWxlOi8vLCB5b3UgbWF5IHdhbnQgdG8KPj4+PiArCSAgdXNlIGEg
bWFrZSB2YXJpYWJsZSBsaWtlICQoVE9QRElSKSB0byByZWZlcmVuY2UgdGhlIHJvb3Qgb2YKPj4+
PiArCSAgdGhlIEJ1aWxkcm9vdCB0cmVlLgo+Pj4+ICsKPj4+PiArZW5kaWYgIyBCUjJfVEFSR0VU
X1hJTElOWF9QUkVCVUlMVF9WRVJTQUxfWFNBCj4+Pj4gKwo+Pj4+ICBjb25maWcgQlIyX1RBUkdF
VF9YSUxJTlhfUFJFQlVJTFRfRkFNSUxZCj4+Pj4gIAlzdHJpbmcKPj4+PiAgCWRlZmF1bHQgInp5
bnFtcCIgaWYgQlIyX1RBUkdFVF9YSUxJTlhfUFJFQlVJTFRfWllOUU1QCj4+Pj4gZGlmZiAtLWdp
dCBhL2Jvb3QveGlsaW54LXByZWJ1aWx0L3hpbGlueC1wcmVidWlsdC5tayBiL2Jvb3QveGlsaW54
LXByZWJ1aWx0L3hpbGlueC1wcmVidWlsdC5tawo+Pj4+IGluZGV4IGQwOWY0YjEzZTIuLmMzMDAw
YjdlNDUgMTAwNjQ0Cj4+Pj4gLS0tIGEvYm9vdC94aWxpbngtcHJlYnVpbHQveGlsaW54LXByZWJ1
aWx0Lm1rCj4+Pj4gKysrIGIvYm9vdC94aWxpbngtcHJlYnVpbHQveGlsaW54LXByZWJ1aWx0Lm1r
Cj4+Pj4gQEAgLTUsOSArNSwyMCBAQAo+Pj4+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+Pj4+
Cj4+Pj4gIFhJTElOWF9QUkVCVUlMVF9WRVJTSU9OID0gJChjYWxsIHFzdHJpcCwkKEJSMl9UQVJH
RVRfWElMSU5YX1BSRUJVSUxUX1ZFUlNJT04pKQo+Pj4+ICsKPj4+PiAraWZlcSAoJChCUjJfVEFS
R0VUX1hJTElOWF9QUkVCVUlMVF9WRVJTQUxfWFNBKSx5KQo+Pj4+ICtYSUxJTlhfUFJFQlVJTFRf
RklMRSA9ICQoY2FsbCBxc3RyaXAsJChCUjJfVEFSR0VUX1hJTElOWF9QUkVCVUlMVF9WRVJTQUxf
WFNBX0xPQ0FUSU9OKSkKPj4+PiArWElMSU5YX1BSRUJVSUxUX1NJVEUgPSAkKHBhdHN1YnN0ICUv
LCUsJChkaXIgJChYSUxJTlhfUFJFQlVJTFRfRklMRSkpKQo+Pj4+ICtYSUxJTlhfUFJFQlVJTFRf
U09VUkNFID0gJChub3RkaXIgJChYSUxJTlhfUFJFQlVJTFRfRklMRSkpCj4+Pj4gK2RlZmluZSBY
SUxJTlhfUFJFQlVJTFRfRVhUUkFDVF9DTURTCj4+Pj4gKwkkKFVOWklQKSAkKFhJTElOWF9QUkVC
VUlMVF9ETF9ESVIpLyQoWElMSU5YX1BSRUJVSUxUX1NPVVJDRSkgLWQgJChARCkKPj4+PiArZW5k
ZWYKPj4+PiArZWxzZSAjIEJSMl9UQVJHRVRfWElMSU5YX1BSRUJVSUxUX1ZFUlNBTF9YU0EKPj4+
PiAgWElMSU5YX1BSRUJVSUxUX1NJVEUgPSAkKGNhbGwgZ2l0aHViLFhpbGlueCxzb2MtcHJlYnVp
bHQtZmlybXdhcmUsJChYSUxJTlhfUFJFQlVJTFRfVkVSU0lPTikpCj4+Pj4gIFhJTElOWF9QUkVC
VUlMVF9MSUNFTlNFID0gTUlUCj4+Pj4gIFhJTElOWF9QUkVCVUlMVF9MSUNFTlNFX0ZJTEVTID0g
TElDRU5TRQo+Pj4+ICtlbmRpZiAjIEJSMl9UQVJHRVRfWElMSU5YX1BSRUJVSUxUX1ZFUlNBTF9Y
U0EKPj4+PiArCj4+Pj4gIFhJTElOWF9QUkVCVUlMVF9JTlNUQUxMX1RBUkdFVCA9IE5PCj4+Pj4g
IFhJTElOWF9QUkVCVUlMVF9JTlNUQUxMX0lNQUdFUyA9IFlFUwo+Pj4+Cj4+Pj4gQEAgLTIwLDEy
ICszMSwyMiBAQCBpZmVxICgkKEJSMl9UQVJHRVRfWElMSU5YX1BSRUJVSUxUX1ZFUlNBTCkseSkK
Pj4+PiAgIyBXZSBuZWVkIHRoZSAqLnBkaSBnbG9iLCBiZWNhdXNlIHRoZSBmaWxlIGhhcyBkaWZm
ZXJlbnQgbmFtZXMgZm9yIHRoZQo+Pj4+ICAjIGRpZmZlcmVudCBib2FyZHMsIGJ1dCB0aGVyZSBp
cyBvbmx5IG9uZSwgYW5kIGl0IGhhcyB0byBiZSBuYW1lZAo+Pj4+ICAjIHZwbF9nZW5fZml4ZWQu
cGRpIHdoZW4gaW5zdGFsbGVkLgo+Pj4+ICtpZmVxICgkKEJSMl9UQVJHRVRfWElMSU5YX1BSRUJV
SUxUX1ZFUlNBTF9YU0EpLHkpCj4+Pj4gK1hJTElOWF9QUkVCVUlMVF9QTE0gPSAkKEBEKS9wZGlf
ZmlsZXMvZ2VuX2ZpbGVzL3BsbS5lbGYKPj4+PiArWElMSU5YX1BSRUJVSUxUX1BTTUZXID0gJChA
RCkvcGRpX2ZpbGVzL3N0YXRpY19maWxlcy9wc21fZncuZWxmCj4+Pgo+Pj4gaXMgJ18nIGNoYXJh
Y3RlciBpbnRlbmRlZCBpbiAicHNtX2Z3LmVsZiIgZmlsZSBuYW1lIGluc3RlYWQgb2YgInBzbWZ3
LmVsZiIgYXMKPj4+IGZvciBYaWxpbnggZGV2IGJvYXJkcz8KPj4KPj4gSSBoYWQgbm90IG5vdGlj
ZWQgdGhhdC4gSSBkb3VibGUtY2hlY2tlZCBhbmQgdGhlIGZpbGUgZG9lcyBoYXZlICdfJwo+PiBp
bnNpZGUgdGhlIFhTQSwgYnV0IGRvZXMgbm90IGluIHRoZSBYaWxpbnggcHJlYnVpbHQgcmVwby4g
SXQgaXMgc3RyYW5nZSwKPj4gYnV0IHRoaXMgZG9lcyB3b3JrIGFzIGludGVuZGVkLgo+IAo+IE9r
LCB0aGF0IGlzIHN0cmFuZ2UgaW5kZWVkLgo+IAo+IE1heWJlIGEgY29tbWVudCBhYm91dCB0aGF0
IGluIHRoZSAubWsgd291bGQgYmUgdXNlZnVsPwoKSSBhZGRlZCB0aGlzIGNvbW1lbnQsIGFuZCBh
cHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+IEJl
c3QgcmVnYXJkcywKPiBSb21haW4KPiAKPj4KPj4gVGhhbmtzIGZvciBzcG90dGluZyB0aGF0LAo+
PiBCcmFuZG9uCj4+Cj4+Pgo+Pj4+ICtYSUxJTlhfUFJFQlVJTFRfUERJID0gJChARCkvKi5wZGkK
Pj4+PiArZWxzZSAjIEJSMl9UQVJHRVRfWElMSU5YX1BSRUJVSUxUX1ZFUlNBTF9YU0EKPj4+PiAr
WElMSU5YX1BSRUJVSUxUX1BMTSA9ICQoWElMSU5YX1BSRUJVSUxUX0JPQVJEX0RJUikvcGxtLmVs
Zgo+Pj4+ICtYSUxJTlhfUFJFQlVJTFRfUFNNRlcgPSAkKFhJTElOWF9QUkVCVUlMVF9CT0FSRF9E
SVIpL3BzbWZ3LmVsZgo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBeXl5eXl5eXl4KPj4+Cj4+PiBCZXN0IHJlZ2FyZHMsCj4+PiBSb21h
aW4KPj4+Cj4+Pgo+Pj4+ICtYSUxJTlhfUFJFQlVJTFRfUERJID0gJChYSUxJTlhfUFJFQlVJTFRf
Qk9BUkRfRElSKS8qLnBkaQo+Pj4+ICtlbmRpZiAjIEJSMl9UQVJHRVRfWElMSU5YX1BSRUJVSUxU
X1ZFUlNBTF9YU0EKPj4+PiArCj4+Pj4gIGRlZmluZSBYSUxJTlhfUFJFQlVJTFRfSU5TVEFMTAo+
Pj4+IC0JJChJTlNUQUxMKSAtRCAtbSAwNzU1ICQoWElMSU5YX1BSRUJVSUxUX0JPQVJEX0RJUikv
cGxtLmVsZiBcCj4+Pj4gKwkkKElOU1RBTEwpIC1EIC1tIDA3NTUgJChYSUxJTlhfUFJFQlVJTFRf
UExNKSBcCj4+Pj4gIAkJJChCSU5BUklFU19ESVIpL3BsbS5lbGYKPj4+PiAtCSQoSU5TVEFMTCkg
LUQgLW0gMDc1NSAkKFhJTElOWF9QUkVCVUlMVF9CT0FSRF9ESVIpL3BzbWZ3LmVsZiBcCj4+Pj4g
KwkkKElOU1RBTEwpIC1EIC1tIDA3NTUgJChYSUxJTlhfUFJFQlVJTFRfUFNNRlcpIFwKPj4+PiAg
CQkkKEJJTkFSSUVTX0RJUikvcHNtZncuZWxmCj4+Pj4gLQkkKElOU1RBTEwpIC1EIC1tIDA3NTUg
JChYSUxJTlhfUFJFQlVJTFRfQk9BUkRfRElSKS8qLnBkaSBcCj4+Pj4gKwkkKElOU1RBTEwpIC1E
IC1tIDA3NTUgJChYSUxJTlhfUFJFQlVJTFRfUERJKSBcCj4+Pj4gIAkJJChCSU5BUklFU19ESVIp
L3ZwbF9nZW5fZml4ZWQucGRpCj4+Pj4gIGVuZGVmCj4+Pj4gIGVsc2UgIyBCUjJfVEFSR0VUX1hJ
TElOWF9QUkVCVUlMVF9WRVJTQUwKPj4+Pgo+Pj4+IC0tLQo+Pj4+IGJhc2UtY29tbWl0OiA1NWM4
YzIzMjhlNzM3MjVlOWFiNDFjOGRjNTY2YjA5ZjQ5ZjJhYWQ1Cj4+Pj4gY2hhbmdlLWlkOiAyMDI0
MDYyMS12ZXJzYWwteHNhLXN1cHBvcnQtcHJlYnVpbHQtOWM1YWVkNWJlNjg3Cj4+Pj4KPj4+PiBC
ZXN0IHJlZ2FyZHMsCj4+Pgo+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPj4+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPj4+IGJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCj4+PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
