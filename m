Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F12D6E2D8
	for <buildroot@archiver.kernel.org>; Wed, 20 Nov 2024 08:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 040D84B23B;
	Wed, 20 Nov 2024 08:32:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hGwrLWFgTdsx; Wed, 20 Nov 2024 08:32:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C97254B33B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C97254B33B;
	Wed, 20 Nov 2024 08:32:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0833E5A2E
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 08:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F05688537D
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 08:32:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xYNj_0aVa116 for <buildroot@buildroot.org>;
 Wed, 20 Nov 2024 08:32:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=168.119.168.44;
 helo=mail.sinic.eu; envelope-from=simon@sinic.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F205985382
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F205985382
Received: from mail.sinic.eu (mail.sinic.eu [168.119.168.44])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F205985382
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 08:32:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2241346265; Wed, 20 Nov 2024 09:32:04 +0100 (CET)
Message-ID: <4f503f92-b1a4-4b6b-96e0-89352680105e@sinic.eu>
Date: Wed, 20 Nov 2024 09:32:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Vincent Jardin <vjardin@free.fr>
Cc: buildroot@buildroot.org
References: <20241120073755.17583-1-simon@sinic.eu>
 <sy4c2ptgmdeb2ww3p2ofjtq3emcfx2shpsgqi7vwgalq6lonvo@ocnuadjhz6te>
Content-Language: en-US
In-Reply-To: <sy4c2ptgmdeb2ww3p2ofjtq3emcfx2shpsgqi7vwgalq6lonvo@ocnuadjhz6te>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sinic.eu; s=dkim; 
 t=1732091524; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=Up+EWp5SusQ4WAf8SLzV2I1xlf7Cla/vp3PyvpqwvrQ=;
 b=HR+ipjjjVNMLAAHmuOhSGT53X/5BIxgoCHTmmyViZf3RM1acvZUeUf2ElVcA3njRA5aBVo
 PcUQjWV/feEh3j/Q3iZOvMgb87MegAWhhw76+QvOPM65MRXpEq9qYEY3Rig2BWXgu6b8T1
 0HlUmaKSbfySy7lfH7jFs0FQDJImcqj3xfnWvrjh5Suv1WSgQlW4br4hWQ1A5Ehkpwr2hq
 TQbsqAJFu+1m3Ps34yKJXGG/ENRLSC2jYB1YhtYXD//Dht6XXTwIfwNI/x/Zwtz5ZpTk5W
 Jc+56x3e65o8s7t82luaMBQJ1xOn12BOtLFMLOu34eiMKJRukR57vMRuF17ZRA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=sinic.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=sinic.eu header.i=@sinic.eu header.a=rsa-sha256
 header.s=dkim header.b=HR+ipjjj
Subject: Re: [Buildroot] [PATCH] package/pkg-generic.mk: add missing quotes
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
From: Simon Richter via buildroot <buildroot@buildroot.org>
Reply-To: Simon Richter <simon@sinic.eu>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CkFtIDIwLjExLjI0IHVtIDA5OjAzIHNjaHJpZWIgVmluY2VudCBKYXJkaW46Cj4gT24gV2VkLCBO
b3YgMjAsIDIwMjQgYXQgMDg6Mzc6NTVBTSBVVEMsIFNpbW9uIFJpY2h0ZXIgdmlhIGJ1aWxkcm9v
dCB3cm90ZToKPj4gVGhpcyBhbGxvd3MgPFBLRz5fU09VUkNFIHRvIGNvbnRhaW4gY2hhcmFjdGVy
cyBsaWtlIGAmYC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogU2ltb24gUmljaHRlciA8c2ltb25Ac2lu
aWMuZXU+Cj4gSXQgaXMgYSBiYWQgaWRlYSB0byBoYXZlIHN1Y2ggbmFtZSwgYnV0IGl0IG1ha2Vz
IHNlbnNlLgoKSSBhZ3JlZS4gSSBhbSB0cnlpbmcgdG8gZG93bmxvYWQgYSBmaWxlIGZyb20gYSBw
cml2YXRlIGZpbGUgc2hhcmUgaW4gCkF6dXJlIERldk9wcy4KCkZvciBhdXRoZW50aWNhdGlvbiwg
SSBuZWVkIHRvIGFkZCBzb21lIGRhdGEgdG8gdGhlIFVSTCwgc2VwYXJhdGVkIGJ5ICc/JyAKb3Ig
JyYnOgoKIMKgwqDCoCA8UEtHPl9TT1VSQ0UgPSA8RklMRT4/Zm9vJmJhciZiYXomYmxhaAoKSWYg
dGhlcmUgaXMgYSBiZXR0ZXIgd2F5IHRvIHNvbHZlIHRoaXMsIEkgd2lsbCBiZSBoYXBweSB0byBp
bXBsZW1lbnQgaXQuCgoKUmVnYXJkcywKClNpbW9uCgoKPgo+IExHVE0KPgo+IFJldmlld2VkLWJ5
OiBWaW5jZW50IEphcmRpbiA8dmphcmRpbkBmcmVlLmZyPgo+PiAtLS0KPj4gICBwYWNrYWdlL3Br
Zy1nZW5lcmljLm1rIHwgMiArLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9wa2ctZ2VuZXJpYy5tayBi
L3BhY2thZ2UvcGtnLWdlbmVyaWMubWsKPj4gaW5kZXggOWVjODRkMGY0NS4uOTZjYzVhMWQyNSAx
MDA2NDQKPj4gLS0tIGEvcGFja2FnZS9wa2ctZ2VuZXJpYy5tawo+PiArKysgYi9wYWNrYWdlL3Br
Zy1nZW5lcmljLm1rCj4+IEBAIC0xNzYsNyArMTc2LDcgQEAgJChCVUlMRF9ESVIpLyUvLnN0YW1w
X2Rvd25sb2FkZWQ6Cj4+ICAgCSQoY2FsbCBwcmVwYXJlLXBlci1wYWNrYWdlLWRpcmVjdG9yeSwk
KCQoUEtHKV9GSU5BTF9ET1dOTE9BRF9ERVBFTkRFTkNJRVMpKQo+PiAgIAkkKGZvcmVhY2ggaG9v
aywkKCQoUEtHKV9QUkVfRE9XTkxPQURfSE9PS1MpLCQoY2FsbCAkKGhvb2spKSQoc2VwKSkKPj4g
ICAjIE9ubHkgc2hvdyB0aGUgZG93bmxvYWQgbWVzc2FnZSBpZiBpdCBpc24ndCBhbHJlYWR5IGRv
d25sb2FkZWQKPj4gLQkkKFEpZm9yIHAgaW4gJCgkKFBLRylfQUxMX0RPV05MT0FEUyk7IGRvIFwK
Pj4gKwkkKFEpZm9yIHAgaW4gIiQoJChQS0cpX0FMTF9ET1dOTE9BRFMpIjsgZG8gXAo+PiAgIAkJ
aWYgdGVzdCAhIC1lICQoJChQS0cpX0RMX0RJUikvYGJhc2VuYW1lICQkcGAgOyB0aGVuIFwKPj4g
ICAJCQkkKGNhbGwgTUVTU0FHRSwiRG93bmxvYWRpbmciKSA7IFwKPj4gICAJCQlicmVhayA7IFwK
Pj4gLS0gCj4+IDIuNDcuMAo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4+IGJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCj4+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4g
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
