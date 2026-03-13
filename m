Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 429AA107BCE8
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 22:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC5FF40F10;
	Fri, 13 Mar 2026 22:50:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4mb8nZhEjvBo; Fri, 13 Mar 2026 22:50:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E496440F0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773442246;
	bh=H1ZipnQobrBJx31ZVLbDoMwzIYaOxZWd36ZCdWHpFQI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DXiw1j+e48py/Tx/NZZvc5CQb+n6NQAfzbdIfr+CD7IoZMvTzGDPkUGH2UvpQFwQh
	 gbHWlnsf40t1OumI3O2FfegVx5kQv1CyDzl7LfDhq3Mfaz5x0vV1JtqlxG/LM+lVZB
	 2IOcr0mh3xkqRLK677tLOHHUk32XAmG992wACxcdLdmOe5nCUV7sQ8CYTZ8WpyqSE7
	 htQ4GU6aTHhH5xDXHdz1h9JjOiqAGCDKMr9be8pCkv3BJN3zlH4H24oplhAjjFu6d6
	 KJIvlk4QK5PNkON65UlmwHinypVjzi28H+d9Y9W2YSo9i1jz6GFXE+9CmyJnMCBtbD
	 ksBcxTH2qQcug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E496440F0A;
	Fri, 13 Mar 2026 22:50:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B5951B4
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 22:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E592481E58
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 22:50:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gzo88Oz2U8qU for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 22:50:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C586A81D34
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C586A81D34
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C586A81D34
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 22:50:43 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-439b7a87fb5so2052745f8f.3
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 15:50:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773442241; x=1774047041;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1ui9ijkAGAVAyClQ7Zra5/dyI1ORN9H/zHBQ3Y5uEMo=;
 b=FlpsW9QU2iX062upqz6V0lTKUHcIJXoYj5UPHyT8Xi8NSWYza0aW32acry8hc2/Ul4
 JZ/YcXWeYCUFBUx9CyHncNIltt5bAFgYNEQWKFLYW4WvBNsMSlbwVYdcj8wFH/piRFEP
 1Om0yl56JCXU1lPQjPVNq+78h/fej+Od41uOIBdWLX/4UNctpVSvgszGCa60eIuOuc99
 8uUaYdOSfgXexG4RJP9YYUKBUR23qI8Nd8ckoDOVD8L7SXvUVgK7s7N9fqU4dCM+hqkz
 t5YSHHRCxB3nmlnJwobD19vsUGOZ91Z8vW85uvte5tSK75zJqW6AzwGwuxGNB2XKJhRM
 cmxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAACgS8bPBB+g7BH/C8duPdgGHQALnsa5hDIm4IkSZT3gfZzwdGcDc0x7Nvab17ymhp044Hb5XL/A=@buildroot.org
X-Gm-Message-State: AOJu0YyGnkqUV8I4forsFe4Jnf1Exuq+dgyG67dsUS0djSndqg6r3yzC
 mJ9NTSczhzfjk81aqSExa3NZCTz2V7rL+bBvepcLAIe6IQ7BnuVmojWdm+FVqxq6Hhg=
X-Gm-Gg: ATEYQzxO/tddUu0yVfprFnYMMgFDeerkJrkETS3SzPnNZrbNbApn1UxjYXChor5ZsgM
 GWQLoZKrg+wBBodERAc+Uuct+HdBV1pfBQ8P7j6iZJjmyljFdvRDvvU8nF2bpvfM8adz549yXvc
 oPgIT6nChOscd+sX8uMO8chIqhcKu52Ts/Tk6s2K/9K0cRe97SxyGvHFcMi7pPpjSREZN08Q6bg
 jmYjyPqB5gEKIopHWfaARPWUe99eEn1dHtSnog8OtLbLLpKHlMXKTyuM5ahloaKWJAvhSrrT/ue
 IWnL+LI56P3bMk797AMKru8gPZOIqCvTSQcpnAoHFfdAgjgT2nyG49RsH90MqFNNCUz85yMc8/z
 y6fkx9TXKrmDYBcSpGhoJ9jOQ+Kv10z/YHFudOtReek9n7JLyc5/gKOQlZ8i0pwLv2qnc/BHxM4
 0wnkj4it2sC6IxKT1mxoqEWFC5FSDsm5ZKacIgMGZYwczmbHixLPUHJTYauTflH2OqsUDa+aBOJ
 nEYEGR9FHaHb4WI0ow0dSvAwmt5BDCIPfsajXp6XemuRGroVxtZpk9Co7nPTRS9bEp1N6X2/TKM
X-Received: by 2002:a05:6000:2885:b0:439:a958:4342 with SMTP id
 ffacd0b85a97d-43a04da835dmr10069604f8f.34.1773442241451; 
 Fri, 13 Mar 2026 15:50:41 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439fe2273e8sm22090358f8f.33.2026.03.13.15.50.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Mar 2026 15:50:41 -0700 (PDT)
Message-ID: <12932194-3267-4818-8e6c-a7275deb79a8@smile.fr>
Date: Fri, 13 Mar 2026 23:50:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Philippe Proulx <eeppeliteloop@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260313215044.2406044-1-ju.o@free.fr>
Content-Language: fr
In-Reply-To: <20260313215044.2406044-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1773442241; x=1774047041; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1ui9ijkAGAVAyClQ7Zra5/dyI1ORN9H/zHBQ3Y5uEMo=;
 b=rPAqb55m9Lj4P8/BbOQQwgk6vOvntGFWX29y5HdCB0BDTTV4opGE2Kb8nDktw0mjL4
 gVHle7yhrqANhXIWJzEKX9uzq5u10C0tzTvFZYTzj41w9Mn18UxY8ruIE2JTFPE7UoWR
 gi0RhezfFoFS419G5a9JhUW6NChik2fyOKJ0o=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=rPAqb55m
Subject: Re: [Buildroot] [PATCH v2 1/7] support/testing: test_xfsprogs: use
 bootlin toolchain, update kernel
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSnVsaWVuLCBBbGwsCgpMZSAxMy8wMy8yMDI2IMOgIDIyOjUwLCBKdWxpZW4gT2xpdmFp
biB2aWEgYnVpbGRyb290IGEgw6ljcml0wqA6Cj4gVGhpcyBjb21taXQgdXBkYXRlcyB0aGUgdGVz
dCBjb25maWd1cmF0aW9uIHRvIHN3aXRjaCB0byBhIEJvb3RsaW4KPiBleHRlcm5hbCB0b29sY2hh
aW4uIFRoaXMgaXMgbmVlZGVkIHRvIGdldCBuZXdlciB0b29sY2hhaW4ga2VybmVsCj4gaGVhZGVy
cyByZXF1aXJlZCBieSBuZXdlciB4ZnNwcm9ncyB2ZXJzaW9ucy4KPiAKPiB4ZnNwcm9ncyB1cHN0
cmVhbSBjb21taXQgWzFdIChpbmNsdWRlZCBpbiB2Ni4xNSkgaW50cm9kdWNlZCBhIHVzYWdlCj4g
b2YgdGhlICJjYXBhY2l0eSIgZmllbGQgb2Ygem9uZWQgYmxvY2sgZGV2aWNlcywgaW50cm9kdWNl
ZCBpbiBLZXJuZWwKPiBjb21taXQgWzJdLCBmaXJzdCBpbmNsdWRlZCBpbiB2NS45Lgo+IAo+IFRo
aXMgY29tbWl0IGFsc28gdXBkYXRlcyB0aGUgcnVudGltZSB0ZXN0IEtlcm5lbCB2ZXJzaW9uCj4g
dG8gdGhlIExUUyA2LjE4LjE4LiBUaGlzIGlzIGJlY2F1c2UgdGhlIGRlZmF1bHQgZmlsZXN5c3Rl
bSBvcHRpb25zCj4gb2YgbWtmcy54ZnMgd2VyZSB1cGRhdGVkIGluIHVwc3RyZWFtIGNvbW1pdCBb
M10gdG8gaW5jbHVkZSBuZXcKPiBmZWF0dXJlcyBzdXBwb3J0ZWQgaW4gdGhlIG5ldyBLZXJuZWwg
Ni4xOC55IExUUyBzZXJpZXMuIFRoZSBjb21taXQgWzNdCj4gaXMgaW5jbHVkZWQgaW4geGZzcHJv
Z3MgdjYuMTguCj4gCj4gWzFdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9mcy94ZnMv
eGZzcHJvZ3MtZGV2LmdpdC9jb21taXQvP2lkPTQ4Y2NjMjQ1OTAzOTMwOWNmYmFmMzU4ZmViZWE1
M2E4NmYwNzgyN2MKPiBbMl0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tl
cm5lbC9naXQvc3RhYmxlL2xpbnV4LmdpdC9jb21taXQvP2lkPTgyMzk0ZGI3MzgzZDMzNjQxZjNm
NTY1YmQ3OTc5MmZiNDFiMTc0MWYKPiBbM10gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2Nt
L2ZzL3hmcy94ZnNwcm9ncy1kZXYuZ2l0L2NvbW1pdC8/aWQ9NTRhYWQxNmI0YjliOTIzNDQyYjQw
NDJhZmFiYTQ0MzhjYTFhYTg2OAo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBPbGl2YWluIDxq
dS5vQGZyZWUuZnI+CgpTZXJpZXMgYXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCkJlc3QgcmVn
YXJkcywKUm9tYWluCgoKPiAtLS0KPiBDaGFuZ2VzOgo+IHYxLT4gdjI6Cj4gLSBuZXcgcGF0Y2gs
IHNlcGFyYXRlZCBmcm9tIHRoZSB4ZnNwcm9ncyBidW1wIGluIHYxCj4gLSBrZXJuZWwgdXBkYXRl
ZCBmcm9tIDYuMTguOSB0byA2LjE4LjE4Cj4gLS0tCj4gIHN1cHBvcnQvdGVzdGluZy90ZXN0cy9w
YWNrYWdlL3Rlc3RfeGZzcHJvZ3MucHkgfCAzICsrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3N1cHBvcnQvdGVzdGlu
Zy90ZXN0cy9wYWNrYWdlL3Rlc3RfeGZzcHJvZ3MucHkgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMv
cGFja2FnZS90ZXN0X3hmc3Byb2dzLnB5Cj4gaW5kZXggYTNhNGJkMjdkOC4uMDMxOTFhYTIyYiAx
MDA2NDQKPiAtLS0gYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3hmc3Byb2dz
LnB5Cj4gKysrIGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF94ZnNwcm9ncy5w
eQo+IEBAIC0xMiwxMCArMTIsMTEgQEAgY2xhc3MgVGVzdFhmc1Byb2dzKGluZnJhLmJhc2V0ZXN0
LkJSVGVzdCk6Cj4gICAgICAgICAgZiIiIgo+ICAgICAgICAgIEJSMl9hYXJjaDY0PXkKPiAgICAg
ICAgICBCUjJfVE9PTENIQUlOX0VYVEVSTkFMPXkKPiArICAgICAgICBCUjJfVE9PTENIQUlOX0VY
VEVSTkFMX0JPT1RMSU49eQo+ICAgICAgICAgIEJSMl9UQVJHRVRfR0VORVJJQ19HRVRUWV9QT1JU
PSJ0dHlBTUEwIgo+ICAgICAgICAgIEJSMl9MSU5VWF9LRVJORUw9eQo+ICAgICAgICAgIEJSMl9M
SU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT049eQo+IC0gICAgICAgIEJSMl9MSU5VWF9LRVJORUxf
Q1VTVE9NX1ZFUlNJT05fVkFMVUU9IjYuNi4zNyIKPiArICAgICAgICBCUjJfTElOVVhfS0VSTkVM
X0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI2LjE4LjE4Igo+ICAgICAgICAgIEJSMl9MSU5VWF9LRVJO
RUxfVVNFX0NVU1RPTV9DT05GSUc9eQo+ICAgICAgICAgIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9N
X0NPTkZJR19GSUxFPSJib2FyZC9xZW11L2FhcmNoNjQtdmlydC9saW51eC5jb25maWciCj4gICAg
ICAgICAgQlIyX0xJTlVYX0tFUk5FTF9DT05GSUdfRlJBR01FTlRfRklMRVM9IntrZXJuX2ZyYWd9
IgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
