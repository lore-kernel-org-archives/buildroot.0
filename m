Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB5C8C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 11:00:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86B5D415E3;
	Wed,  5 Feb 2025 11:00:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4oMFXp5FJUzT; Wed,  5 Feb 2025 11:00:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 258254161A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 258254161A;
	Wed,  5 Feb 2025 11:00:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E0BA312A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBC8240649
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:00:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qp6stEuUjpsz for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 11:00:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2C1B840181
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C1B840181
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2C1B840181
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:00:54 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-438a39e659cso45297315e9.2
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 03:00:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738753252; x=1739358052;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1UVldrLJhUh7EzIg5P0M30NRa+fEkhJdiXOBNf+y7uU=;
 b=WypMNNtPhUzNVWkjo8Z9/+1v8QtJnVIpCXFUbuE89G6L87vmaR8bNqO5OTyKiFNryS
 6Ib7BFF/ehz8q2v/+0QLy9tQQ0NET0ONPGu3BhJzarNUiSuxHJOftp/ybipoNvjrALvm
 mb5zJJMmrGrrSxvB/Uiz7Mft/uw1YWC1KFO9kWSYyJWpIfyKgk75JbX2569di2Pn7LZo
 PvGFAR7NAgUmhG3AB15poAAOhiEB77oUvPd4cmnwhB6jEwQ1h3+lrbYxSPvVPET4H8at
 6GiXgrNwE0O0+YW3guP3jFuTZmAD4cl70RfQ1u002OuVgIw2HOiB80WZ2CM7aKX6HfgE
 bUGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1ASunboe0YX9DeAvBmEmjDWpVt/k22JZt4nDsyVS1AcKph/5L8tRko7JAslBFHvgHXSVYdz9gwdY=@buildroot.org
X-Gm-Message-State: AOJu0YyQwCmhK1HGhIVzRNJqdAuPAG3cwjLGbc21eTQg74LgiH9BPzur
 2iIWpPLoeOIgFX7FI+F7JXnD1xNwzsUm/UBgMeRKfm2kow5sfW3sPUZBKgEjm/vc/H/sCWzbmQW
 jmQg=
X-Gm-Gg: ASbGncubPJMdT02T1ik9uROA97Bh5tf62n/sKk5TpIM8fufFnnJHyJCr7qY7ORHv2g7
 l1BXfQbQKrpE4OC1Y4eUbGmEiiz+OV4CVJi0ng0W1X6jMu61IdqRx2JO7ZwLWGeii6G2vYgmjxv
 3ool2c40aaJ9LAXNEaJ1sq+N8LIRrzW7hM9U2M9n5Ff7GgSqisYD+Kh8X3iqaGtwN4LV9EDrSlN
 pju8eEFOj+X88y6fPV8osjuqt0hw693fIqvfJqyNo9J6gnnvUeUK0D5H4vAxrExouK0598Nv5Ny
 nkQGyXboooI3MY6wP1S7YKfpFV0muEh9xGKzlKvCpeyReRCXwgFIhzLT
X-Google-Smtp-Source: AGHT+IEUztNY+BB8Mf5DsZqjdBVNTdxaTe625vkIcYKwulMDzgDF7+6rsKNJozuFxcWzkRaOLG1MvQ==
X-Received: by 2002:a05:600c:a01:b0:434:a802:e99a with SMTP id
 5b1f17b1804b1-4390d430732mr16662275e9.4.1738753251016; 
 Wed, 05 Feb 2025 03:00:51 -0800 (PST)
Received: from [172.16.2.119] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390d933523sm17707825e9.1.2025.02.05.03.00.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 03:00:50 -0800 (PST)
Message-ID: <86a392f8-3376-4dec-a2a9-eb013589710e@smile.fr>
Date: Wed, 5 Feb 2025 12:00:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alexander Shirokov <shirokovalexs@gmail.com>, buildroot@buildroot.org
References: <20241208134004.143901-1-shirokovalexs@gmail.com>
Content-Language: en-US
In-Reply-To: <20241208134004.143901-1-shirokovalexs@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1738753252; x=1739358052; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1UVldrLJhUh7EzIg5P0M30NRa+fEkhJdiXOBNf+y7uU=;
 b=XyeHEzpVW85l3vWmwAZ6qdhPv1p7WSfXl3LpKWaHIw27fCMSGdkjsAQHf2Qd4BinGl
 YgQ8HoA1rnBciZpKBYT2mQBOEIXhLNwpXJnONy6mWcLC/fIv1qEvm5Ub/HQ79PG2Xo1E
 kgJyNgT69NFDHtu+W2zCs20ECVmWGJNl4DVuE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=XyeHEzpV
Subject: Re: [Buildroot] [PATCH 1/1] package/rust-coreutils:new package
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

SGVsbG8gQWxleGFuZGVyLAoKTGUgMDgvMTIvMjAyNCDDoCAxNDo0MCwgQWxleGFuZGVyIFNoaXJv
a292IGEgw6ljcml0wqA6Cj4gVGhlIFJ1c3QgdmVyc2lvbiBhaW1zIHRvIGJlIGEgZHJvcC1pbiBy
ZXBsYWNlbWVudCBmb3IgR05VIGNvcmV1dGlscywKPiBkZXNpZ25lZCB0byB3b3JrIGFjcm9zcyBh
IHdpZGUgcmFuZ2Ugb2YgcGxhdGZvcm1zLiBBZGRpbmcgaXQgdG8KPiBCdWlsZHJvb3QgY2FuIGhl
bHAgbWFrZSBpdCBhdmFpbGFibGUgb24gZW1iZWRkZWQgZGV2aWNlcy4KPiAKPiBUaGlzIGlzIHRo
ZSBpbml0aWFsIHZlcnNpb24gb2YgdGhlIHBhY2thZ2UsIHN1cHBvcnRpbmcgb25seSB0aGUKPiBt
dWx0aWNhbGwgdmVyc2lvbiAoc2luZ2xlIGJpbmFyeSkuIEl0IGFsbG93cyBzdGFydGluZyB0byB3
b3JrIHdpdGggdGhlCj4gdXRpbGl0aWVzIHdoaWxlIGF2b2lkaW5nIGNvbXBsZXggY29uZmlndXJh
dGlvbnMgYW5kIGNvbmZsaWN0cyB3aXRoCj4gZXhpc3RpbmcgdG9vbHMuCgpUaGVyZSB3YXMgYSBw
cmV2aW91cyBhdHRlbXB0IGxhc3QgeWVhciB0byBpbnRyb2R1Y2UgdXV0aWxzLWNvcmV1dGlscyBw
YWNrYWdlIGJ1dApUaG9tYXMgcmVwb3J0ZWQgc29tZSBpc3N1ZXMgb24gQVJNIHRhcmdldHMgWzFd
LiBDYW4geW91IGNoZWNrIGlmIHRoZXkgd2VyZSBmaXhlZApzaW5jZSB0aGVuPwoKVW5saWtlbHkg
U2ViYXN0aWFuIChteSBmb3JtZXIgaW50ZXJuKSB3YXMgbm90IGFibGUgdG8gcmVzZW5kIGFuIHVw
ZGF0ZWQgdmVyc2lvbi4KCk5vdGU6IFdlIHRyeSB0byBrZWVwIHRoZSB1cHN0cmVhbSBwcm9qZWN0
IG5hbWUgdG8gbmFtZSB0aGUgQnVpbGRyb290IHBhY2thZ2UuIEluCnRoaXMgY2FzZSBpdCBzaG91
bGQgYmUgdXV0aWxzLWNvcmV1dGlscyBub3QgcnVzdC1jb3JldXRpbHMuCgpBbHNvIHdlIHNob3Vs
ZCB0YWtlIGNhcmUgd2hlbiBzZXZlcmFsICJjb3JldXRpbHMiIHByb3ZpZGVyIGlzIHNlbGVjdGVk
IHRvIGF2b2lkCmFueSBiaW5hcmllcyBvdmVycmlkZS4KCkNhbiB5b3UgYWRvcHQgdGhlIHBhdGNo
IFsxXSBhbmQgYWRkcmVzcyB0aGUgcmVtYWluaW5nIGlzc3Vlcz8KQWxzbyBoYXZpbmcgYSBydW50
aW1lIHRlc3Qgd291bGQgYmUgZ3JlYXQuCgpUaGFua3MhCgpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvYnVpbGRyb290LzIwMjMwOTMwMjE1OTQwLjc2NDRlOTNjQHdpbmRzdXJmLwoKQmVzdCBy
ZWdhcmRzLApSb21haW4KCgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBTaGlyb2tvdiA8
c2hpcm9rb3ZhbGV4c0BnbWFpbC5jb20+Cj4gLS0tCj4gIHBhY2thZ2UvQ29uZmlnLmluICAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAxICsKPiAgcGFja2FnZS9ydXN0LWNvcmV1dGlscy9Db25m
aWcuaW4gICAgICAgICAgIHwgMTIgKysrKysrKysrKysrCj4gIHBhY2thZ2UvcnVzdC1jb3JldXRp
bHMvcnVzdC1jb3JldXRpbHMuaGFzaCB8ICAzICsrKwo+ICBwYWNrYWdlL3J1c3QtY29yZXV0aWxz
L3J1c3QtY29yZXV0aWxzLm1rICAgfCAxMyArKysrKysrKysrKysrCj4gIDQgZmlsZXMgY2hhbmdl
ZCwgMjkgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9ydXN0LWNv
cmV1dGlscy9Db25maWcuaW4KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcnVzdC1jb3Jl
dXRpbHMvcnVzdC1jb3JldXRpbHMuaGFzaAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9y
dXN0LWNvcmV1dGlscy9ydXN0LWNvcmV1dGlscy5tawo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L0NvbmZpZy5pbiBiL3BhY2thZ2UvQ29uZmlnLmluCj4gaW5kZXggNjBjZGIxNzlhMy4uNDhiMWQ5
NmI0ZSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL0NvbmZpZy5pbgo+ICsrKyBiL3BhY2thZ2UvQ29u
ZmlnLmluCj4gQEAgLTI4NzQsNiArMjg3NCw3IEBAIG1lbnUgIlN5c3RlbSB0b29scyIKPiAgCXNv
dXJjZSAicGFja2FnZS9yYXVjLWhhd2tiaXQtdXBkYXRlci9Db25maWcuaW4iCj4gIAlzb3VyY2Ug
InBhY2thZ2UvcnN5c2xvZy9Db25maWcuaW4iCj4gIAlzb3VyY2UgInBhY2thZ2UvcnVuYy9Db25m
aWcuaW4iCj4gKwlzb3VyY2UgInBhY2thZ2UvcnVzdC1jb3JldXRpbHMvQ29uZmlnLmluIgo+ICAJ
c291cmNlICJwYWNrYWdlL3MzOTAtdG9vbHMvQ29uZmlnLmluIgo+ICAJc291cmNlICJwYWNrYWdl
L3M2L0NvbmZpZy5pbiIKPiAgCXNvdXJjZSAicGFja2FnZS9zNi1saW51eC1pbml0L0NvbmZpZy5p
biIKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9ydXN0LWNvcmV1dGlscy9Db25maWcuaW4gYi9wYWNr
YWdlL3J1c3QtY29yZXV0aWxzL0NvbmZpZy5pbgo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5k
ZXggMDAwMDAwMDAwMC4uMDM3MTgwNTkyNQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdl
L3J1c3QtY29yZXV0aWxzL0NvbmZpZy5pbgo+IEBAIC0wLDAgKzEsMTIgQEAKPiArY29uZmlnIEJS
Ml9QQUNLQUdFX1JVU1RfQ09SRVVUSUxTCj4gKwlib29sICJydXN0LWNvcmV1dGlscyIKPiArCWRl
cGVuZHMgb24gQlIyX1BBQ0tBR0VfSE9TVF9SVVNUQ19UQVJHRVRfQVJDSF9TVVBQT1JUUwo+ICsJ
c2VsZWN0IEJSMl9QQUNLQUdFX0hPU1RfUlVTVEMKPiArCWhlbHAKPiArCSAgUnVzdCBjb3JldXRp
bHMgaXMgYSBjcm9zcy1wbGF0Zm9ybSByZWltcGxlbWVudGF0aW9uIG9mIHRoZSBHTlUKPiArCSAg
Y29yZXV0aWxzLCBhaW1pbmcgdG8gYmUgYSBkcm9wLWluIHJlcGxhY2VtZW50Lgo+ICsKPiArCSAg
U2VsZWN0IHRoaXMgb3B0aW9uIHRvIGJ1aWxkIGEgbXVsdGljYWxsIGJpbmFyeSwgbmFtZWQKPiAr
CSAgJ2NvcmV1dGlscycuCj4gKwo+ICsJICBodHRwczovL2dpdGh1Yi5jb20vdXV0aWxzL2NvcmV1
dGlscwo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3J1c3QtY29yZXV0aWxzL3J1c3QtY29yZXV0aWxz
Lmhhc2ggYi9wYWNrYWdlL3J1c3QtY29yZXV0aWxzL3J1c3QtY29yZXV0aWxzLmhhc2gKPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLmJiOGU0YWM2Y2EKPiAtLS0gL2Rl
di9udWxsCj4gKysrIGIvcGFja2FnZS9ydXN0LWNvcmV1dGlscy9ydXN0LWNvcmV1dGlscy5oYXNo
Cj4gQEAgLTAsMCArMSwzIEBACj4gKyMgTG9jYWxseSBjYWxjdWxhdGVkCj4gK3NoYTI1NiAgMjhl
N2M3OWU2MDg5ODlhZjMzMWZmYWNlMjA0ZmQ5MjJlZWMyYTIyYzRhYTJjNDNhOTFkY2VkODg0YjZk
ZThkMiAgcnVzdC1jb3JldXRpbHMtMC4wLjI4LWNhcmdvMi50YXIuZ3oKPiArc2hhMjU2ICAyOTk1
MzQwNWVhYTNkY2M0MWMzN2QxNjIxZDU1YjZhNDdlZWU5M2UwNTYxM2U0MzllNzMyOTUwMjk3NDBi
MTBjICBMSUNFTlNFCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcnVzdC1jb3JldXRpbHMvcnVzdC1j
b3JldXRpbHMubWsgYi9wYWNrYWdlL3J1c3QtY29yZXV0aWxzL3J1c3QtY29yZXV0aWxzLm1rCj4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi5jYTQxZjcxMDFhCj4gLS0t
IC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvcnVzdC1jb3JldXRpbHMvcnVzdC1jb3JldXRpbHMu
bWsKPiBAQCAtMCwwICsxLDEzIEBACj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gKyMKPiAr
IyBydXN0LWNvcmV1dGlscwo+ICsjCj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gKwo+ICtS
VVNUX0NPUkVVVElMU19WRVJTSU9OID0gMC4wLjI4Cj4gK1JVU1RfQ09SRVVUSUxTX1NJVEUgPSAk
KGNhbGwgZ2l0aHViLHV1dGlscyxjb3JldXRpbHMsJChSVVNUX0NPUkVVVElMU19WRVJTSU9OKSkK
PiArUlVTVF9DT1JFVVRJTFNfTElDRU5TRSA9IE1JVAo+ICtSVVNUX0NPUkVVVElMU19MSUNFTlNF
X0ZJTEVTID0gTElDRU5TRQo+ICtSVVNUX0NPUkVVVElMU19DUEVfSURfVkFMSUQgPSBZRVMKPiAr
Cj4gKyQoZXZhbCAkKGNhcmdvLXBhY2thZ2UpKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
