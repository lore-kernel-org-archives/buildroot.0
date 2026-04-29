Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA772FF8867
	for <buildroot@archiver.kernel.org>; Wed, 29 Apr 2026 06:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6528C420E3;
	Wed, 29 Apr 2026 06:08:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pGdNWyNOeBIv; Wed, 29 Apr 2026 06:08:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E473420E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777442897;
	bh=FQJl2/B0vd1sOgJJKoPtapY9qWSHMSzRla+5W3O0co4=;
	h=Date:To:Cc:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jfve7lDw0mo4DNJpkFTI3AiUw/4OKIq0/VTgD+7r2+foX98nuT6Tn08Nc2BEDeSLI
	 /tz1p8DxQFlpz3uYt8b2p3P+XBN8kUm4OY1EnuYGXoV1ai6AzppkzrBJyW8GHNlpxE
	 xffyy/dEK4vCqJvFtmSk/tTd/VY6h85jBhMPVhxvmwZR4fk6O+R9ttV9cgLyddSyfd
	 M46R8lLdSEx+GDnz8uE81KP8LOwD5P8HkqxsWTWTIgi6IFqtY8QHN6pilrqKfKGgIb
	 wuSD3Dsvz4xnI+LB+S39zuiQc7MFE/3AzbkijUYXiqHKe1IA2O1qOEq9PSPOwnEoj6
	 vORfhwohqQJvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E473420E4;
	Wed, 29 Apr 2026 06:08:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E14F423D
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 06:08:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C432E840F9
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 06:08:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xfOije6rj5Do for <buildroot@buildroot.org>;
 Wed, 29 Apr 2026 06:08:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=jeanmichel.hautbois@yoseli.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3BC79840F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BC79840F7
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3BC79840F7
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 06:08:12 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id E3E85580774
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 05:55:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D76F3ED3E;
 Wed, 29 Apr 2026 05:55:00 +0000 (UTC)
Message-ID: <f3d5b359-cb59-4b66-acc8-b0934d47e1c1@yoseli.org>
Date: Wed, 29 Apr 2026 07:53:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Ismael Luceno <ismael@iodev.co.uk>, Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260424132326.825570-1-jeanmichel.hautbois@yoseli.org>
 <20260424132326.825570-8-jeanmichel.hautbois@yoseli.org>
 <87mrys30uc.fsf@tarshish>
Content-Language: fr-FR, en-US, en-GB
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
In-Reply-To: <87mrys30uc.fsf@tarshish>
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: dmFkZTEqzIa6LZyjbGRRGd9KSoYrmWaiekIaJ9y4y7FmgqTDIML+u2aUwogN2fVLGlwk0/yao7y/9/N3gkIqn4D8aK18Zm2NbzJkZJF/i3rSzoNPosy1iSlIUDYiEfeq4Yj9RhQgfGr+JcHeXBR+6dThv9LD0/LZqCyucm789x82N9kCdXkK29NY3Za7gMkOLFMJxo+ykRbDBqc4YOo2p5CzIslS0vyuA2zmLxysZVonN1PZn+e3WfPUaT6qgpUAOxklaTnvssBe2R9NYMhke2rhEtsICjmoIJ3sEyQERSVLngV9K2Syx/phebX4l/cmuwWmfFrNm3iDBNvlVDu5rR28CzPecwAqtfV+x6+WQk5svGlli9EwidsZtsL2+7g+ppgWopjxHYHiQdHu0u+46aRW4jSHOUbaV/DskZBXcgUtgILBzNPs8jdfyipeHclSvQj6JAEogugICfeDXyuXrBVyoT0UWJLS27hC+N7RnyZBnPj9gfJ5xjo+odl6rp81QuLi6XzCTsLVc77Os3MhZ6jgtTKl1VLEPcs7gl25EIwxTnKSUi3mS5zObAiyyXggBlkSQkzI3vXP8aaYkPvLtTiVwEI1FkrBI1lQaGSR+uQEJfdg/DndwpiaZLqyUzcjWy9bpCAWRiu4BPuxlYAlbSXnUw5//b0C+1h83ar0jvJRCqhPYA
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yoseli.org; s=gm1; t=1777442102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1+O/DPwf7KfnFxzgUHpt90YhXc/ZYli/jck779eDap8=;
 b=llc+vOzCE5CoQwckQBT+24QzqH+5l/8F+8yr4PT7DC4svWqHyQgzlPlXLHa9ubsBrNGRi1
 J1h6I4mTPsr6ojfH3KpVYXelwaQpz320H8NdI7Ur6nP7pcaaxBs/z1n4e/MFiAIklNZGHx
 hG8l+NkBe7SlBCxBzL5DscmQqLJu92vXCYfzhwH/x0Xn71WNZ1KwTqOUKCE9hDu4WumHHS
 Qf0DhQZFfhvN7YtJNFDs03mZwUM+LKlTeaPUH7KIyxyZDImFR++UMdYlvk7SPd3RFOiOEM
 TfRg8I1WpmDE38GVv3GZGwCHvXlm4TfcylpsKxeo1B4pHQw3Kd9cKMjrNs3z9w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=yoseli.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=yoseli.org header.i=@yoseli.org header.a=rsa-sha256
 header.s=gm1 header.b=llc+vOzC
Subject: Re: [Buildroot] [PATCH 07/11] package/dropbear: disable ML-KEM768
 on m68k
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQmFydWNoLAoKTGUgMjQvMDQvMjAyNiDDoCAxNjoxMSwgQmFydWNoIFNpYWNoIGEgw6ljcml0
wqA6Cj4gSGkgSmVhbi1NaWNoZWwsCj4gCj4gT24gRnJpLCBBcHIgMjQgMjAyNiwgSmVhbi1NaWNo
ZWwgSGF1dGJvaXMgd3JvdGU6Cj4+IE1MLUtFTTc2OCBwb3N0LXF1YW50dW0ga2V5IGV4Y2hhbmdl
IGNvZGUgKGluIHRoZSB2ZW5kb3JlZCBoZWFkZXIKPj4gc3JjL2xpYmNydXhfbWxrZW03Njhfc2hh
My5oKSB0cmlnZ2VycyBhIEdDQyBpbnRlcm5hbCBjb21waWxlciBlcnJvcgo+PiAoSUNFKSBpbiBj
c2VsaWJfcmVjb3JkX3NldCBkdXJpbmcgdGhlIHBvc3RyZWxvYWQgQ1NFIHBhc3Mgb24gbTY4ay4K
Pj4gUmVwcm9kdWNlZCBvbiBtNjhrLWJ1aWxkcm9vdC1saW51eC11Y2xpYmMgKGNmNTQ0MXgsIC1P
Mikgd2l0aCBib3RoCj4+IEdDQyAxNC4zLjAgKHRoZSBjdXJyZW50IEJ1aWxkcm9vdCBkZWZhdWx0
IGZvciBtNjhrKSBhbmQgR0NDIDE1LjIuMC4KPj4KPj4gVGhlIGZhaWxpbmcgcGFzcyBiYWNrdHJh
Y2UgaXM6Cj4+ICAgIHJlbG9hZF9jc2VfcmVnc18xCj4+ICAgIC0+IHBhc3NfcG9zdHJlbG9hZF9j
c2U6OmV4ZWN1dGUKPj4gICAgICAgLT4gY3NlbGliX3Byb2Nlc3NfaW5zbgo+PiAgICAgICAgICAt
PiBjc2VsaWJfcmVjb3JkX3NldHMKPj4gICAgICAgICAgICAgLT4gY3NlbGliX3JlY29yZF9zZXQg
IChjc2VsaWIuY2M6Mjg2OSBvbiBnY2MgMTUpCj4+Cj4+IERpc2FibGUgTUwtS0VNNzY4IHZpYSBs
b2NhbG9wdGlvbnMuaCBvbiBtNjhrIHVudGlsIHRoZSBHQ0MgYnVnIGlzCj4+IHJlc29sdmVkLiBT
dGFuZGFyZCBrZXkgZXhjaGFuZ2UgYWxnb3JpdGhtcyByZW1haW4gYXZhaWxhYmxlLgo+IAo+IENv
bW1vbiBwcmFjdGljZSBmb3IgR0NDIGJ1Z3MgaXMgdG8gYWRkIGEgQlIyX1RPT0xDSEFJTl9IQVNf
R0NDX0JVR19baWRdCj4gY29uZmlnIHN5bWJvbCB0byB0b29sY2hhaW4vQ29uZmlnLmluLCBhbmQg
dXNlIHRoYXQgc3ltYm9sIHRvIGFjdGl2YXRlCj4gYnVnIHNwZWNpZmljIHdvcmthcm91bmQuIFtp
ZF0gcmVmZXJzIHRvIEdDQyBCdWd6aWxsYSBidWcgSUQuIFRoaXMgbWFrZXMKPiBpdCBlYXNpZXIg
dG8gdHJhY2sgdGhlIEdDQyB2ZXJzaW9ucyB0aGlzIGJ1ZyBhZmZlY3RzLgoKVGhhbmtzIGZvciB0
aGUgcG9pbnRlciAhCkkganVzdCBmaWxlZCBhIGJ1ZzogaHR0cHM6Ly9nY2MuZ251Lm9yZy9idWd6
aWxsYS9zaG93X2J1Zy5jZ2k/aWQ9MTI1MDc4CgpJIHdpbGwgcHJlcGFyZSBhIHYyIGZvciB0aGlz
IHBhdGNoIHdpdGggYSBCUjJfVE9PTENIQUlOX0hBU19HQ0NfQlVHXzEyNTA3OAoKSSB3aWxsIHdh
aXQgYSBiaXQgYmVmb3JlIGEgdjIgYXMgbWF5YmUgb3RoZXIgcGF0Y2hlcyB3aWxsIGhhdmUgCnJl
bWFya3MvaXNzdWVzLgoKVGhhbmtzICEKSk0KCj4gYmFydWNoCj4gCj4+Cj4+IFNpZ25lZC1vZmYt
Ynk6IEplYW4tTWljaGVsIEhhdXRib2lzIDxqZWFubWljaGVsLmhhdXRib2lzQHlvc2VsaS5vcmc+
Cj4+IC0tLQo+PiAgIHBhY2thZ2UvZHJvcGJlYXIvZHJvcGJlYXIubWsgfCA3ICsrKysrKysKPj4g
ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9wYWNr
YWdlL2Ryb3BiZWFyL2Ryb3BiZWFyLm1rIGIvcGFja2FnZS9kcm9wYmVhci9kcm9wYmVhci5tawo+
PiBpbmRleCBlNGU0MmNmOTk0Li41MmJjMTVlMzQ2IDEwMDY0NAo+PiAtLS0gYS9wYWNrYWdlL2Ry
b3BiZWFyL2Ryb3BiZWFyLm1rCj4+ICsrKyBiL3BhY2thZ2UvZHJvcGJlYXIvZHJvcGJlYXIubWsK
Pj4gQEAgLTYyLDYgKzYyLDEzIEBAIGVuZGVmCj4+ICAgRFJPUEJFQVJfUE9TVF9FWFRSQUNUX0hP
T0tTICs9IERST1BCRUFSX1NWUl9QQVNTV09SRF9BVVRICj4+ICAgZW5kaWYKPj4gICAKPj4gK2lm
ZXEgKCQoQlIyX202OGspLHkpCj4+ICtkZWZpbmUgRFJPUEJFQVJfRElTQUJMRV9NTEtFTQo+PiAr
CWVjaG8gJyNkZWZpbmUgRFJPUEJFQVJfTUxLRU03NjggMCcgICAgICAgICAgICAgICA+PiAkKEBE
KS9sb2NhbG9wdGlvbnMuaAo+PiArZW5kZWYKPj4gK0RST1BCRUFSX1BPU1RfRVhUUkFDVF9IT09L
UyArPSBEUk9QQkVBUl9ESVNBQkxFX01MS0VNCj4+ICtlbmRpZgo+PiArCj4+ICAgaWZlcSAoJChC
UjJfUEFDS0FHRV9EUk9QQkVBUl9MRUdBQ1lfQ1JZUFRPKSx5KQo+PiAgIGRlZmluZSBEUk9QQkVB
Ul9FTkFCTEVfTEVHQUNZX0NSWVBUTwo+PiAgIAllY2hvICcjZGVmaW5lIERST1BCRUFSXzNERVMg
MScgICAgICAgICAgICAgICAgICA+PiAkKEBEKS9sb2NhbG9wdGlvbnMuaAo+IAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
