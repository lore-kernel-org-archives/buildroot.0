Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977A8D1D48A
	for <buildroot@archiver.kernel.org>; Thu,  8 Jan 2026 20:49:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6635240B8C;
	Thu,  8 Jan 2026 20:49:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oVs0qw_MAJqm; Thu,  8 Jan 2026 20:49:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E67B40B8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767905365;
	bh=WUbw6fMqNdITnQQ3nZ3USSMilBEH55VxB3kSyYWwSOc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pNyrM+l89P2vRl/ypVLwSLwHp02T7vCFdASay9uZR1da0DoJLhHDb1R5tglbJyjfS
	 xfL1FIXhW3uT4zQJAREdk0BrQMvzM3hPvHNLkJO4yzALIB8DXyGdE2PigFD92YNSMw
	 oQDDIQO2HEQSScADBv6J1yfmDEc91nQQwDhpKLnQBtSs8FrTlXaGsnLGXSnscTLKwJ
	 bOllGlyrskxIQ4XLdsD01cswz2PWcFDp1XmYdNR6E/cKXBU7nKqX9DnwyQQKPnms2T
	 19DrofEbcCgv1GYMWScm1vaK754yN5VCYGZVdGH7OSt+e2HYJD3OetcW0C+Nm5U60t
	 b0F0foKlOVYvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E67B40B8D;
	Thu,  8 Jan 2026 20:49:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C029308
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 20:49:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E203830E3
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 20:49:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5B1JnihCAIIN for <buildroot@buildroot.org>;
 Thu,  8 Jan 2026 20:49:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AF57382FA2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF57382FA2
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF57382FA2
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 20:49:22 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-42fbc544b09so2555977f8f.1
 for <buildroot@buildroot.org>; Thu, 08 Jan 2026 12:49:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767905360; x=1768510160;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lQW6G07UlyR5d4P6ndHp3YMoXrEXxeA7eXgXxTn3NOg=;
 b=iKzLEdshvdE9QdPDmDLwFoQmo97i92wz0PJNo4zCV4Ixl54rhlb8V+Cp/XEXmcvQbK
 ZaV0ooUY3OtnpZGeERdXre613b1PZx91TTZHr5x+YHUH4h5MN5VRKo5DmogulVKdCDhd
 OVNTj/UV4u65sK8Ti+XWyM+bbq9JMBHzm77Ow3rk5XYOSo/OYyrdu2D+UPoK0IOrb9l7
 igif1M2lIOqRXI82g6oLzOyOdY9I1sCLAptuJAX+8HhiFwX8kRj06Gne8S02x1nKfilR
 byLmWmAXNsdE9YO/8J/VwkZS/w/C97Uu6qyGF+bGAhmptFJLIBEqY46G9CKUpurazmgn
 rlAg==
X-Gm-Message-State: AOJu0YxQt4458yar2s7QZSzx+v1mNhmwU5vejrA6UTcGcZChsjvu5fi+
 hGVAIGkRvBljg5f/2febhR5PTM0KzRDBdeTM7425Z0PeBUBryC9RdTwvaKTTXRVgKr8=
X-Gm-Gg: AY/fxX4cwNc6q3um+/YUJcRESKTyQhCZix5ENza7dS/NRPH1zCOqUJXJXCtC0x+ZSX3
 b1CKXx2nNWUhGWi8IM/aeB9QJVtlXmdJS3DjWbVpsfvDrI3SGrwYMYcEnZlT4oIOuuoZ0WkVOL4
 bKzEuop8j1CEw8fDX8F6cmLcvrQQZOqgzOjN+DRt4RBV3V5Nl5MOXaRSGOsFhbwSvfsD6I3WWdq
 K2BbvckURQ6G8Pi3YCfkfU34GWwSZ4vwQsVxn0fqt6bqQNKM8H9n9ycQ26fpdtRSeWW4L6TcUZW
 r5vBg87liUVtL6kFxgw5vqZx8M1/W4aCC0snUO2Uaoq0s42/53BVJUW2i3H78PbMPlv6i77zyQD
 opw2iqlwC/Ulk5BYA/HFyJD2NJcwwik6Njs//kBXiT54HB4/GrBGxM7dyPDesJtTK8Y2OeAAKyO
 WMDWTOTRm3T7k7+2pzLJLRr814bD39YjblxzZ1kYZ0sonAJGxm
X-Google-Smtp-Source: AGHT+IEUSU28Fk6JaoTaXjQSkFWz4bU9QAmpQs/fneDrobR8rQm9wckdpbeEAXLASk1wlVuXUMBbRQ==
X-Received: by 2002:a5d:5192:0:b0:430:fbfc:ec77 with SMTP id
 ffacd0b85a97d-432c378a89fmr8020311f8f.12.1767905360298; 
 Thu, 08 Jan 2026 12:49:20 -0800 (PST)
Received: from [192.168.4.20] (94.105.116.200.dyn.edpnet.net. [94.105.116.200])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5edd51sm18425979f8f.29.2026.01.08.12.49.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jan 2026 12:49:19 -0800 (PST)
Message-ID: <d814f42f-3de5-42f4-bad7-f0d970a8f177@mind.be>
Date: Thu, 8 Jan 2026 21:49:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>,
 Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org
References: <20260103200229.246015-1-ju.o@free.fr>
 <d80dd170972ccef05fbb2a9dbd371581@free.fr>
Content-Language: en-US
In-Reply-To: <d80dd170972ccef05fbb2a9dbd371581@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1767905360; x=1768510160; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lQW6G07UlyR5d4P6ndHp3YMoXrEXxeA7eXgXxTn3NOg=;
 b=Tkz/smVeCMfWcfTuUFtOlLXHxnzy6cp+ysEH7/e+zuLc8HC/jVsSz95FRpJejXrX8C
 s1v+oRUR3nbLy3rsXAmoMudOGnjjOjwX2fE+JlMN4b0tB//uOtTuWRJwn7FO34/BsoTk
 pWjeYoVlbXmPxBOVMH/D806cYUle3eB+yEXXxnh2zO4GdDmMjX7XXLTQ6HtwxtRMuTHe
 HlSdTdYCaDv2SeTYHLXprffWZEAQuh3K7A73qglbWBexRBe8DeZ64S06czMsoSDsH/mH
 1xM5BDsrpoLP3DOcZYOrgP6QAHCjsDVyVXsSjapuAfxZSxJCQZ8bHa5nAJNARHvMbz8l
 7E5Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Tkz/smVe
Subject: Re: [Buildroot] [PATCH 1/1] package/gnupg2: bump to version 2.4.9
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSnVsaWVuLAoKVGhhbmtzIGZvciB5b3VyIG1lc3NhZ2UsIGl0J3Mgbm90ZWQuCgpQRVJBTEUg
VGhvbWFzCgpPbiAxLzgvMjYgOTozMSBQTSwgSnVsaWVuIE9saXZhaW4gd3JvdGU6Cj4gSGkgVGl0
b3VhbiwgVGhvbWFzLAo+Cj4gT24gMDMvMDEvMjAyNiAyMTowMiwgSnVsaWVuIE9saXZhaW4gdmlh
IGJ1aWxkcm9vdCB3cm90ZToKPj4gRm9yIHJlbGVhc2Ugbm90ZSwgc2VlOgo+PiBodHRwczovL2Rl
di5nbnVwZy5vcmcvVDgwMDEKPj4KPj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIE9saXZhaW4gPGp1
Lm9AZnJlZS5mcj4KPj4gLS0tCj4+IFBhdGNoIHRlc3RlZCBpbjoKPj4gaHR0cHM6Ly9naXRsYWIu
Y29tL2pvbGl2YWluL2J1aWxkcm9vdC8tL2pvYnMvMTI1OTU1OTgwNzEKPj4gLS0tCj4+IMKgcGFj
a2FnZS9nbnVwZzIvZ251cGcyLmhhc2ggfCA0ICsrLS0KPj4gwqBwYWNrYWdlL2dudXBnMi9nbnVw
ZzIubWvCoMKgIHwgMiArLQo+PiDCoDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9nbnVwZzIvZ251cGcyLmhh
c2ggYi9wYWNrYWdlL2dudXBnMi9nbnVwZzIuaGFzaAo+PiBpbmRleCAwMTA2MGY4OTdiLi5lZTM3
ZTZhM2FmIDEwMDY0NAo+PiAtLS0gYS9wYWNrYWdlL2dudXBnMi9nbnVwZzIuaGFzaAo+PiArKysg
Yi9wYWNrYWdlL2dudXBnMi9nbnVwZzIuaGFzaAo+PiBAQCAtMSw1ICsxLDUgQEAKPj4gwqAjIEZy
b20gaHR0cHM6Ly93d3cuZ251cGcub3JnL2Rvd25sb2FkL2ludGVncml0eV9jaGVjay5odG1sCj4+
IC1zaGExwqAgYzcwNDA4NWFhN2NjMTMxYTY3ZWRkMGI3YzBjOTBlNWMzNWVlNGFkYiBnbnVwZy0y
LjQuOC50YXIuYnoyCj4+IC1zaGEyNTYgCj4+IGI1OGM4MGQ3OWIwNGQzMjQzZmY0OWMxYzNmYzZi
NWY4MzEzOGViMzc4NDY4OTU2M2JjZGQwNjA1OTUzMTg2MTYgCj4+IGdudXBnLTIuNC44LnRhci5i
ejIKPj4gK3NoYTHCoCBkNGI3NmE4ZGU3ODYzMWI2NGI4YzZmMzcyNWVkMjhkZWRlNDBiZGI0IGdu
dXBnLTIuNC45LnRhci5iejIKPj4gK3NoYTI1NiAKPj4gZGQxN2FiMmU5YTA0ZmQ3OWQzOWQ4NTNm
NTk5Y2JjODUyMDYyZGRiOWFiNTJhNGRkZWI0MTc2ZmQ4YjMwMjk2NCAKPj4gZ251cGctMi40Ljku
dGFyLmJ6Mgo+PiDCoCMgTG9jYWxseSBjYWxjdWxhdGVkCj4+IMKgc2hhMjU2IAo+PiBiYzJkNjY2
NGY2Mjc2ZmEwYTcyZDU3NjMzYjNhZTY4ZGM3ZGNiNjc3YjcxMDE4YmYwOGM4ZTkzZTUwOWYxMzU3
IENPUFlJTkcKPj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZ251cGcyL2dudXBnMi5tayBiL3BhY2th
Z2UvZ251cGcyL2dudXBnMi5tawo+PiBpbmRleCBkZWJmMTVlZjYzLi5kMDgzZWE4NTBhIDEwMDY0
NAo+PiAtLS0gYS9wYWNrYWdlL2dudXBnMi9nbnVwZzIubWsKPj4gKysrIGIvcGFja2FnZS9nbnVw
ZzIvZ251cGcyLm1rCj4+IEBAIC00LDcgKzQsNyBAQAo+PiDCoCMKPj4KPj4gIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMgCj4+Cj4+Cj4+IC1HTlVQRzJfVkVSU0lPTiA9IDIuNC44Cj4+ICtHTlVQRzJf
VkVSU0lPTiA9IDIuNC45Cj4KPiBGb3IgeW91ciBpbmZvLCB0aGlzIHBhdGNoIGlzIGluIGZhY3Qg
YSBzZWN1cml0eSBidW1wLgo+Cj4gSXQgZml4ZXM6Cj4gaHR0cHM6Ly93d3cuY3ZlLm9yZy9DVkVS
ZWNvcmQ/aWQ9Q1ZFLTIwMjUtNjg5NzIKPiBodHRwczovL3d3dy5jdmUub3JnL0NWRVJlY29yZD9p
ZD1DVkUtMjAyNS02ODk3Mwo+Cj4gWW91IHNob3VsZCBjb25zaWRlciBpdCBmb3IgeW91ciBMVFMg
bWFpbnRlbmFuY2UuCj4KPiBJdCB3YXMgbm90IG1hcmtlZCBhdCB0aGUgdGltZSB0aGUgcGF0Y2gg
d2FzIGF1dGhvcmVkOgo+IGh0dHBzOi8vZGV2LmdudXBnLm9yZy9UNzkwNgo+Cj4+IMKgR05VUEcy
X1NPVVJDRSA9IGdudXBnLSQoR05VUEcyX1ZFUlNJT04pLnRhci5iejIKPj4gwqBHTlVQRzJfU0lU
RSA9IGh0dHBzOi8vZ251cGcub3JnL2Z0cC9nY3J5cHQvZ251cGcKPj4gwqBHTlVQRzJfTElDRU5T
RSA9IEdQTC0zLjArCj4+IC0tIAo+PiAyLjUyLjAKPgo+IEJlc3QgcmVnYXJkcywKPgo+IEp1bGll
bi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
