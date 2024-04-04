Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C27CD1284
	for <buildroot@archiver.kernel.org>; Thu,  4 Apr 2024 12:14:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BA54406FC;
	Thu,  4 Apr 2024 12:14:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R5vp0bsULnwQ; Thu,  4 Apr 2024 12:14:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8DA4407E8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8DA4407E8;
	Thu,  4 Apr 2024 12:14:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5D5D01BF3D8
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 12:14:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46B38407E8
 for <buildroot@lists.busybox.net>; Thu,  4 Apr 2024 12:14:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xkh1YcqfhwNr for <buildroot@lists.busybox.net>;
 Thu,  4 Apr 2024 12:14:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 29135406FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29135406FC
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 29135406FC
 for <buildroot@buildroot.org>; Thu,  4 Apr 2024 12:14:40 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4162ad25c23so3322835e9.2
 for <buildroot@buildroot.org>; Thu, 04 Apr 2024 05:14:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712232879; x=1712837679;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pGZ3H4Tc4RxqTJuilHw4vve5KCKBs0Pimx3Ej+mrYVE=;
 b=COWXq5iAdTHLmwlk68fb7w6PTt8FAW1ZveDqp3HTa9o5ZYcoTuRJL9n/NdBl4kpiY1
 yQAYr+dVAGcvuZYdOsVN7AVkHWpQbJvFKvpkTrb4IGGKxWPZGVuMwcOhBj9/3QkB0g0o
 sjdaUwM1A0fULdxVvYqrFSsZmTB2ntG9KrrktYRM62ybhC92uoHVRSUMaZOgQgLthrfG
 Jq9HYkqTDGZVl0qqEJtSnR6nrO+MCZOxpFkU0cspok8P2N1ZruuLUA+r7FBn3E52GR5Q
 YMp/1dDrhIyLupzfaSpCcnGL92CCj1Y9q4QHNfTVZCtplIaXb1RZ0rJEbOM6IBcF/hPv
 DeqQ==
X-Gm-Message-State: AOJu0YzfWRsc7+Z2Ibz/3bD/+Z+sljdssCY8K/7/l7IF6DClSXbL7dM/
 D2PLt1e/GIeoUyLVs86ePh1XIagPpi+maMqBOJ6rjwXtNvOlQmkmu+1FyqZ1myQ=
X-Google-Smtp-Source: AGHT+IFDS0r1er3VxDLzOLl8mS1eYpbGy65msO0Z4NFni6mIJuLHrG0SQxZzeaYKUlgcpMxre3hyDA==
X-Received: by 2002:a05:600c:48a4:b0:414:8c5:42ce with SMTP id
 j36-20020a05600c48a400b0041408c542cemr1985305wmp.19.1712232878658; 
 Thu, 04 Apr 2024 05:14:38 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 k4-20020a5d6e84000000b0033ea499c645sm20020952wrz.4.2024.04.04.05.14.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Apr 2024 05:14:38 -0700 (PDT)
Message-ID: <161774c5-0326-4baf-921a-7332c677f9fc@smile.fr>
Date: Thu, 4 Apr 2024 14:14:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Heiko Thiery <heiko.thiery@gmail.com>, Michael Walle <michael@walle.cc>
References: <20240403195403.1359007-1-romain.naour@smile.fr>
 <CAEyMn7YZB0q1p56F4ECOemAEbJReDUDLUuKBQyp6H016gCL7Fg@mail.gmail.com>
 <edac4a6e-c07a-48ce-9f9a-13928f8c898a@smile.fr>
 <D0BAEFA95U59.21GTZHTZRDS1A@walle.cc>
 <CAEyMn7Yoowh--mcB6Qn8rsGh+5AZphqmc-QNcp8oFJnb6g+HNg@mail.gmail.com>
Content-Language: fr, en-US
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <CAEyMn7Yoowh--mcB6Qn8rsGh+5AZphqmc-QNcp8oFJnb6g+HNg@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712232879; x=1712837679;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pGZ3H4Tc4RxqTJuilHw4vve5KCKBs0Pimx3Ej+mrYVE=;
 b=HDrsglcZzRsq3OynLV7hO9yezkRwMGB/wDjzOrZXSfQaSxax+vnFlmM4o2yX9vyoxi
 O95rOhvlrEBm98o64lhdolZHNoTPuVf+6McyQ85GhsjRKobYIJcU3vXDKVGQMkJeev8U
 /i3ziBvY2nKiUd4IXXtmJ3MwmRIljzUgG5e06GfmFWlKewct74WiZWPKj0kVRZIw5+Pf
 yTvE8PfOzjnCn+78X7h7gVEBXHsWcu2Cn9RXCbAlRuBBrJiWdOEQP7EjfTnwLIgn/P1i
 XRfQAusMg8aTpvR3RwcbNBXjlZf6s7BmmviPCJyEPHDrXmlaq576pBGc1Ma5E+1IM/PL
 BcYw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=HDrsglcZ
Subject: Re: [Buildroot] [PATCH v11 00/17] Add support for AM62x-SK HS-FS
 devices
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSGVpa28sIE1pY2hhZWwsIEFsbCwKCkxlIDA0LzA0LzIwMjQgw6AgMTM6NDYsIEhlaWtv
IFRoaWVyeSBhIMOpY3JpdMKgOgo+IEhpLAo+IAo+IEFtIERvLiwgNC4gQXByLiAyMDI0IHVtIDEz
OjA0IFVociBzY2hyaWViIE1pY2hhZWwgV2FsbGUgPG1pY2hhZWxAd2FsbGUuY2M+Ogo+Pgo+PiBI
aSBSb21haW4sCj4+Cj4+IHRoYW5rcyBmb3Igd29ya2luZyBvbiB0aGUgc2VyaWVzIQo+Pgo+Pj4+
IEkga25vdyB0aGVyZSBhcmUgc29tZSBkaXNjdXNzaW9ucyBvbmdvaW5nIGFib3V0IHRoZSBoYW5k
bGluZyBvZiB0aGUKPj4+PiBCUjJfUEFDS0FHRV9USV9LM19TRUNUWVBFX1ggYW5kIEJSMl9QQUNL
QUdFX1RJX0szX1NPQ19YLiBJIHNlZSB0aGF0Cj4+Pj4gdGhlc2UgdmFyaWFibGVzIGFyZSBvbmx5
IHVzZWQgZm9yIHNlbGVjdGluZyB0aGUgcmlnaHQgdmFsdWUgZm9yCj4+Pj4gQlIyX1RBUkdFVF9U
SV9LM19SNV9MT0FERVJfVElCT09UM19CSU4uICBTaW5jZSB3ZSBjYW4gc2V0IHRoaXMgdmFsdWUK
Pj4+PiBkaXJlY3RseSBmb3IgZWFjaCBkZWZjb25maWcgSSB0aGluayB3ZSBjYW4gZ2V0IHJpZCBv
ZiBhbGwgdGhpcyBzdHVmZi4KPj4+PiBOZXZlcnRoZWxlc3MgdGhlcmUgaXMgYSBwcm9ibGVtIHdp
dGggdGhlCj4+Pj4gQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfVElCT09UM19CSU4gc2luY2Ug
aXQgaXMgbm90IHBvc3NpYmxlIHRvCj4+Pj4gc2VsZWN0IGEgdmFsdWUgaW4gbWVudWNvbmZpZyBi
ZWNhdXNlIG9mIHRoZSBtaXNzaW5nIGhlbHAgdGV4dC4KPj4+Cj4+PiBJdCBzZWVtcyBlYXNpZXIg
dG8gc2VsZWN0IHRoZSBTb0MgdmFyaWFudCBhbmQgdGhlIFNlY3R5cGUgdXNpbmcgdHdvIGJvb2xl
YW4gdGhhbgo+Pj4gbGV0dGluZyB0aGUgdXNlciB0byBwcm92aWRlIHRoZSByaWdodCBmaWxlIG5h
bWUgaW4KPj4+IEJSMl9UQVJHRVRfVElfSzNfUjVfTE9BREVSX1RJQk9PVDNfQklOIGZyb20gdGhl
IGRlZmNvbmZpZy4KPj4KPj4gRG9lc24ndCBzZWVtIGVhc2llciB0byBtZSB0byB1cGRhdGUgdGhl
IHBhY2thZ2UgZWFjaCB0aW1lIGEgbmV3IFNvQwo+PiBpcyBpbnRyb2R1Y2VkLiBCZXNpZGVzLi4K
Pj4KPj4+IElzIGEgdXNlIGNhc2Ugd2hlcmUgdGhlIHdlIG11c3QgdXNlIGEgY3VzdG9tIHRpYm9v
dDMqLmJpbiBuYW1lID8KPj4KPj4gLi55b3UgYXJlIGxpdGVyYWxseSBlbmNvZGluZyB0aGUgYm9h
cmQgbmFtZSAiLWV2bSIgb2YgdGhlIFRJIEVWTQo+PiBpbnRvIHRoYXQgbmFtZS4gU28gaXQgaXMg
dW51c2FibGUgZm9yIGFueSBvdGhlciBib2FyZC4gRS5nLiAgdGhlcmUKPj4gaXMgYWxyZWFkeSB0
aGlzIGJvYXJkIHVwc3RyZWFtOgo+PiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS91LWJvb3Qv
djIwMjQuMDQvc291cmNlL2FyY2gvYXJtL2R0cy9rMy1hbTYyNS1waHljb3JlLXNvbS1iaW5tYW4u
ZHRzaSNMMTQKPj4KPj4gQXMgSSBzYWlkLCB0aGF0IGZpbGVuYW1lIGlzIGp1c3QgYSBmcmVlIGZv
cm0gdHlwZSBvZiBmaWxlbmFtZSBhbmQKPj4gdGhlIGR0c2kgYXV0aG9yIGlzIGZyZWUgdG8gY2hv
b3NlIGl0cyBuYW1pbmcuCj4+Cj4+IElNSE8gd2l0aCB0aGUgcmVtb3ZhbCBvZiB0aGUgaW1hZ2Ug
Z2VuIHBhY2thZ2UsIHRoZXJlIGlzIG5vIG5lZWQKPj4gZm9yIHRoZSBTT0MgYW5kIFNFQ1RZUEUg
Y2hvaWNlIGFueW1vcmUsIGFzIGl0IGlzIGp1c3QgdXNlZCB0bwo+PiBhc3NlbWJsZSB0aGUgYm9h
cmQgc3BlY2lmaWMgZmlsZW5hbWUgd2hpY2ggd2lsbCBlbmQgdXAgYmVpbmcgdGhlCj4+IHRpYm9v
dDMuYmluLiBCdXQgdS1ib290IGlzIGFscmVhZHkgY2hvb3NpbmcgdGhlIGRlZmF1bHQgdGlib290
My5iaW4KPj4gZm9yIHlvdToKPj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vdS1ib290L3Yy
MDI0LjA0L3NvdXJjZS9hcmNoL2FybS9kdHMvazMtYW02MjUtcGh5Y29yZS1zb20tYmlubWFuLmR0
c2kjTDYwCj4+Cj4+IFNvcnJ5IGZvciBiZWluZyBzbyBwZXJzaXN0ZW50LCBJIHJlYWxseSBkb24n
dCB0aGluayB0aGlzIGlzIHRoZQo+PiBjb3JyZWN0IGFwcHJvYWNoLiBKdXN0IGRlZmF1bHRpbmcg
dGhlIGJpbmFyeSBuYW1lIHRvIHRpYm9vdDMuYmluCj4+IHdpbGwgcHJvYmFibHkgaGFuZGxlIG1v
c3QgY2FzZXMgYW5kIGZvciB0aGUgb2RkYmFsbHMsIGp1c3Qgc2V0IHRoZQo+PiBmaWxlbmFtZSBp
biB0aGUgZGVmY29uZmlnLgo+IAo+IE1pY2hhZWwgaXMgcmlnaHQgYXQgdGhpcyBwb2ludC4gVGhp
cyBvcHRpb24gb25seSBjYW4gc2VsZWN0IHRoZSBUSSBldm0KPiBzcGVjaWZpYyB0aWJvb3QzIGZp
bGVzIGRlZmluZWQgaW4gdGhlIFUtQm9vdCBiaW5tYW4gZHRzaSBmaWxlcy4gSSBqdXN0Cj4gY2hl
Y2tlZCBhbmQgaW4gVS1Cb290IGFyZSAzIG90aGVyIGJvYXJkcyB0aGF0IHVzZSBkaWZmZXJlbnQg
bmFtZXMKPiB0aGFuIHRoZSBvbmUgdXNlZCBieSBUSS4gQW5kIGF0IGxlYXN0IG9uZSBvdGhlciB3
aWxsIGNvbWUgaW4gdGhlIG5lYXIgZnV0dXJlLgoKSW5kZWVkLCB5b3UncmUgcmlnaHQuCgpMYXN0
IHRpbWUgSSd2ZSBjaGVja2VkIC1ldm0gd2FzIHVzZWQgb24gbW9zdCAoSSB0aG91Z2h0IG9uIGFs
bCkgYm9hcmRzLgoKU2VlIHRoZSBmaWxlIGszLWo3MjFlLWJpbm1hbi5kdHNpIHNoYXJlZCBiZXR3
ZWVuIHRoZSByZWFsIFRJIEVWTSBhbmQgdGhlCnNrLXRkYTRWTSBib2FyZHMuCgpodHRwczovL2Vs
aXhpci5ib290bGluLmNvbS91LWJvb3QvbGF0ZXN0L3NvdXJjZS9hcmNoL2FybS9kdHMvazMtajcy
MWUtYmlubWFuLmR0c2kKCkV2ZW4gdGhlIGJlYXBsZXBsYXkgdXNlcyB0aGUgLWV2bSBzdWZmaXg6
CgpodHRwczovL2VsaXhpci5ib290bGluLmNvbS91LWJvb3QvbGF0ZXN0L3NvdXJjZS9hcmNoL2Fy
bS9kdHMvazMtYW02MjUtcjUtYmVhZ2xlcGxheS5kdHMjTDgxCgpJIG1pc3NlZCB0aGUgdmVyZGlu
IGV4YW1wbGVzOgpodHRwczovL2VsaXhpci5ib290bGluLmNvbS91LWJvb3QvbGF0ZXN0L3NvdXJj
ZS9hcmNoL2FybS9kdHMvazMtYW02MjUtdmVyZGluLXdpZmktZGV2LWJpbm1hbi5kdHNpI0wxMgoK
SW4gb3RoZXIgaGFuZCwgd2Ugc2hvdWxkIG5vdCByZWx5IG9uIHRoZSB0aWJvb3QzLmJpbiBzeW1s
aW5rIHNpbmNlIGl0IGxpbmtzIHRoZQotZ3AsIC1ocy1mcywgLWhzIHRpYm9vdDMgYmluYXJ5IGFj
Y29yZGluZyB0byB3aGVyZSAic3ltbGluayA9ICJ0aWJvb3QzLmJpbiI7IgpsaW5lIGlzIGxvY2F0
ZWQgaW4gazMtKmJpbm1hbi5kdHNpLgoKU28sIGluc3RlYWQgb2YgQlIyX1RBUkdFVF9USV9LM19S
NV9MT0FERVJfVElCT09UM19CSU4geW91IHN1Z2dlc3QgdG8gbGV0IHRoZQp1c2VyIHRvIGRlZmlu
ZSBhIGN1c3RvbSB0aWJvb3QzIGJpbmFyeSBuYW1lIG9yIGlmIGVtcHR5IHVzZSB0aGUgZGVmYXVs
dCBvbmUuCgpXZSBzaG91bGQgYWxzbyBkbyBzb21ldGhpbmcgc2ltaWxhciBmb3IgQlIyX1RBUkdF
VF9USV9LM19SNV9MT0FERVJfU1dTRldfSVRCCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gCj4+
Cj4+IC1taWNoYWVsCj4gCj4gCj4gLS0KPiBIZWlrbwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
