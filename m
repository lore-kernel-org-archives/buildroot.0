Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61775CDB466
	for <buildroot@archiver.kernel.org>; Thu, 25 Jun 2026 08:03:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE98E60F57;
	Thu, 25 Jun 2026 08:03:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jTqdpqhiqRN7; Thu, 25 Jun 2026 08:03:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0CAA60F5C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782374637;
	bh=k+HEtMFX1+ZTukvMTGB+quYPBQa1o+JH6M719l41Gts=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=WioAzhiT0rEaWA3SekKqCR/XSHIxylO1+CKD8tVAbA/1zZD0wGpIZWnAi15tcrX8o
	 CBCoW2682CJq3eUv7y9PW8OlNvXppTgHb5Q+8+0PWlLdmOj57f2je47r+dcea9Fs+5
	 C93f5Ytq4fMrcGQrtihkbbZfXIhX+pzn/t+NkaopJlFSZ6xdr4iqVW6mc80q+QvwXV
	 ZEK6tCjvmOxzLJEqve1WdUAzv+Qn/8avnJrHLhaxfAf0KY1nMWyA4wxHb3ZImEaowJ
	 ZjleKI1/gh5qyavFBNabQwvH/w+h6iFpU1tHMkFCfyZ1BnL086cQl9GnK3Y2jscLIH
	 mHBJ7fxtdvHYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0CAA60F5C;
	Thu, 25 Jun 2026 08:03:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2ACBB2C7
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 08:03:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C19441052
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 08:03:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qTTp998nQbSe for <buildroot@buildroot.org>;
 Thu, 25 Jun 2026 08:03:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B34294104E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B34294104E
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B34294104E
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 08:03:54 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-46066e640easo1235604f8f.1
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 01:03:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782374632; x=1782979432;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UtW0GpGj1Ehrn/MZCVFQVt512IPv/fY3oUAgFUKWvrs=;
 b=JXuH89PQF6NHQMSFt+1RFQhAwYMn7JRUQJMw7KokkaAmXr/OizKHaggguPWnK5PBjV
 8Wul1trEW44pLr1kDJugxsZa7K5uu1ROMzsr5u98a66fEl3GCrUHOrUy5H4Sf9OhmeMj
 fYOS0otO0tlUx2ldCkyN5wP+hQXLhK15hsw7rAexz/zEQKY2FN166lqAyERC6U9s47eK
 QPH28QYr9wxMI2xig+lPMW5Q/2e69sk1uDAU2ByrZ3l0gVvUw9yq6htD8JA1c062dm8n
 RNxiuT0baPNqoz2FmIK4Xa9M5sdcQrcRCexxmDVWcMbqpguzGosTmapoo8xZfdYN8L0y
 b/NA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq1k0no8673ILV9t2KIQewDGsY/zgoj5Pcay9AsAuuX5O/OEb4MXht+jEORpVAo6pn/fAH1+wR+gjE=@buildroot.org
X-Gm-Message-State: AOJu0Yw4dGYU/aHjSi/McxQesliyE/V7Y/VdVO3TjlYK5Yjw8dfhVYDP
 lxpd/Mk4PE1H8uRZw27meQNoaXC0uP2+i2nSIMW9C32piWITmnyAdKHdbC3MCQDJagA=
X-Gm-Gg: AfdE7cnP/jxvVot0jxQNxMEVZBZVY/V7JyW83hXz39EBD6POsrs3M+W5Tx75oVggSyc
 J3OeXBOp0MDPbcADXsL2144bRXOInpzNKCSPlSP7mjCEwFdp4NBPGct1+R6F4/6FivZN5p7RR6+
 M06uVcIkmNN+WZLoqzoEREyQGHjzYU1yEmo8/qyeGeGUtYMp6asikXie1twi7uQegVH+v+mfyBp
 ggritDg8XgN59PwfsYvNJOdzwGeYbkhRP+tEdGmRN0iLxeyUTehtRSKcW13t1FpzhFJhwlK/Et3
 JKaHwLHqQ6xkzY3adGQ28KHd7hZx9GzEByUvKC0zqg1o4ofghw7u+cvJnyooWWORs9kU92kE7c+
 oJtU92VQIgU4QjGCjQahy2bMW07Hq/nyuCsHGM/n1QKq6LyQ9aL9y6bS1zYOCqJpkv9QWqor7OQ
 N/sz9Ir5XCQiQPcW3/sk3TfyNtuGvxgmS9AQEXm2K0H6fI/NW7MV/e1J3BFK92IywhHIFWbMxBt
 j2BdlLQRLUi6mYvsUkruyTABMHYVtN23GDDbHYkDpKY0WOXrzjXZxY=
X-Received: by 2002:a5d:5f8e:0:b0:45e:64b3:af44 with SMTP id
 ffacd0b85a97d-46dc18a4a8fmr1804644f8f.36.1782374632391; 
 Thu, 25 Jun 2026 01:03:52 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c1eef84d7sm15050220f8f.16.2026.06.25.01.03.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jun 2026 01:03:51 -0700 (PDT)
Message-ID: <46181ebc-cfd0-439a-abf2-befec4b04fb3@smile.fr>
Date: Thu, 25 Jun 2026 10:03:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
References: <20260624125154.1869177-1-romain.naour@smile.fr>
 <1de61d9e-316f-482a-a5ca-c3040f437f71@gmx.de>
Content-Language: fr
In-Reply-To: <1de61d9e-316f-482a-a5ca-c3040f437f71@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1782374632; x=1782979432; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UtW0GpGj1Ehrn/MZCVFQVt512IPv/fY3oUAgFUKWvrs=;
 b=0hOBN6mAmvBXftj72AgQ1PjODYEq1TIavXj24dP4PUrwBQFy/y1ThlCrwknzeZLqiE
 ujUTvYL3z63HBIjTiZYVXzv8Kw2x5MsJ7AMMfzjeAPhY3y8xh//a1EEd5M16FT09Wt5p
 BvySehD3RhuubOo16Ff1TehmS1ASpR7p5F/zU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=0hOBN6mA
Subject: Re: [Buildroot] [PATCHv2 1/3] package/iptables: improve kernel
 support for iptables-legacy and iptables-nft
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

SGVsbG8gRmlvbmEsIEFsbCwKCkxlIDI0LzA2LzIwMjYgw6AgMTk6MzYsIEZpb25hIEtsdXRlIGEg
w6ljcml0wqA6Cj4gSGkgUm9tYWluLAo+IAo+IG9uZSBzbWFsbCBxdWVzdGlvbiBiZWxvdy4KPiAK
PiBBbSAyNC4wNi4yNiB1bSAxNDo1MSBzY2hyaWViIFJvbWFpbiBOYW91ciB2aWEgYnVpbGRyb290
Ogo+PiBTaW5jZSBrZXJuZWxzIDYuMTcsIHN1cHBvcnQgZm9yIG5ldGZpbHRlciBsZWdhY3kgdGFi
bGVzIHdlcmUgZGlzYWJsZWQKPj4gYnkgZGVmYXVsdCBbMV0gYnV0IGlwdGFibGVzIHBhY2thZ2Ug
bmVlZHMgTmV0ZmlsdGVyIGxlZ2FjeSB0YWJsZXMKPj4gc3VwcG9ydCBlbmFibGVkIGluIHRoZSBr
ZXJuZWwgd2hlbiBuZnRhYmxlcyBjb21wYXQgaXMgbm90IGVuYWJsZWQuCj4+Cj4+IE1ha2Ugc3Vy
ZSB0byBlbmFibGUgQ09ORklHX0lQX05GX0lQVEFCTEVTX0xFR0FDWSBhbmQKPj4gQ09ORklHX05F
VEZJTFRFUl9YVEFCTEVTX0xFR0FDWSBmb3Iga2VybmVscyA+PSA2LjE3Lgo+Pgo+PiBGaXhlczoK
Pj4KPj4gwqDCoCBbQlJURVNUIyBpcHRhYmxlcyAtLWZsdXNoCj4+IMKgwqAgbW9kcHJvYmU6IG1v
ZHVsZSBpcF90YWJsZXMgbm90IGZvdW5kIGluIG1vZHVsZXMuZGVwCj4+IMKgwqAgaXB0YWJsZXMg
djEuOC4xMSAobGVnYWN5KTogY2FuJ3QgaW5pdGlhbGl6ZSBpcHRhYmxlcyB0YWJsZSBgZmlsdGVy
JzogVGFibGUKPj4gZG9lcyBub3QgZXhpc3QgKGRvIHlvdSBuZWVkIHRvIGluc21vZD8pCj4+IMKg
wqAgUGVyaGFwcyBpcHRhYmxlcyBvciB5b3VyIGtlcm5lbCBuZWVkcyB0byBiZSB1cGdyYWRlZC4K
Pj4KPj4gT24gdGhlIG90aGVyIGhhbmQsIHdoZW4gbmZ0YWJsZXMgY29tcGF0IChpcHRhYmxlcy1u
ZnQpIGlzIHVzZWQgYnkKPj4gZGVmYXVsdCAoQlIyX1BBQ0tBR0VfSVBUQUJMRVNfTkZUQUJMRVNf
REVGQVVMVD15KSB3ZSBoYXZlIHRvIGVuYWJsZQo+PiBuZnQgcHJvdG9jb2wgc3VwcG9ydCBpbiB0
aGUga2VybmVsLgo+Pgo+PiDCoMKgIGlwdGFibGVzIC0tdmVyc2lvbgo+PiDCoMKgIGlwdGFibGVz
OiBGYWlsZWQgdG8gaW5pdGlhbGl6ZSBuZnQ6IFByb3RvY29sIG5vdCBzdXBwb3J0ZWQKPj4KPj4g
RW5hYmxlIENPTkZJR19ORl9UQUJMRVMgYW5kIENPTkZJR19ORl9UQUJMRVNfSU5FVCBhcyBmb3IK
Pj4gTkZUQUJMRVNfTElOVVhfQ09ORklHX0ZJWFVQUyBhbmQgY29tcGxldGUgdGhlIGxpc3Qgd2l0
aAo+PiBDT05GSUdfTkZUX1NPQ0tFVCBuZWVkZWQgdG8gcGFzcyB0aGUgVGVzdElwdGFibGVzIHdp
dGgKPj4gbmZ0YWJsZXMgY29tcGF0IChpcHRhYmxlcy1uZnQpIGVuYWJsZWQuCj4+Cj4+IFdpdGhv
dXQgQ09ORklHX05GVF9TT0NLRVQ6Cj4+Cj4+IMKgwqAgaXB0YWJsZXMgLS1wb2xpY3kgSU5QVVQg
QUNDRVBUCj4+IMKgwqAgaXB0YWJsZXMgdjEuOC4xMSAobmZfdGFibGVzKTrCoCBUQUJMRV9BREQg
ZmFpbGVkIChPcGVyYXRpb24gbm90IHN1cHBvcnRlZCk6Cj4+IHRhYmxlIGZpbHRlcgo+Pgo+PiBT
bywgZGlzYWJsZSBpcHRhYmxlcy1sZWdhY3kgc3VwcG9ydCBvbmx5IHdoZW4gbmZ0YWJsZXMgY29t
cGF0IGlzIG5vdAo+PiBlbmFibGVkIGJ5IGRlZmF1bHQuIEVuYWJsZSBpcHRhYmxlcy1uZnQgc3Vw
cG9ydCB3aGVuIG5mdGFibGVzIGNvbXBhdCBpcwo+PiBlbmFibGVkLCBldmVuIGlmIG5vdCB1c2Vk
IGJ5IGRlZmF1bHQuCj4gCj4gSSBndWVzcyB0aGUgIm5vdCIgaW4gdGhlIGZpcnN0IHNlbnRlbmNl
IGlzIGEgdHlwbz8gIkRpc2FibGUgaXB0YWJsZXMtbGVnYWN5Cj4gc3VwcG9ydCBvbmx5IHdoZW4g
bmZ0YWJsZXMgY29tcGF0IGlzIGVuYWJsZWQgYnkgZGVmYXVsdCIgaXMgd2hhdCdzIGhhcHBlbmlu
Zy4gSQo+IGNhbiBmaXggdGhhdCB3aGVuIGFwcGx5aW5nLCBqdXN0IHdhbnQgdG8gYmUgc3VyZSBh
Ym91dCB5b3VyIGludGVudGlvbi4KCkluZGVlZCwgSSBnb3QgZGlzdHJhY3RlZCBzb21laG93IHdo
aWxlIHdyaXRpbmcgdGhpcyBjb21tZW50LgoKU2VlIHRoZSAoaG9wZWZ1bGx5IGNvcnJlY3QpIGNv
bW1lbnQgaW4gdGhlIC5tazoKIkVuYWJsZSBrZXJuZWwgc3VwcG9ydCBmb3IgaXB0YWJsZXMtbGVn
YWN5IG9ubHkgaWYgbmZ0YWJsZXMgY29tcGF0IGlzIG5vdAplbmFibGVkIGJ5IGRlZmF1bHQiCgo+
IAo+IE1heWJlIGF0IHNvbWUgcG9pbnQgd2Ugc2hvdWxkIG1lcmdlIEJSMl9QQUNLQUdFX0lQVEFC
TEVTX05GVEFCTEVTIGFuZAo+IEJSMl9QQUNLQUdFX0lQVEFCTEVTX05GVEFCTEVTX0RFRkFVTFQ/
IEkgY2FuJ3QgcmVhbGx5IHRoaW5rIG9mIGEgc2l0dWF0aW9uIHdoZXJlCj4gc29tZW9uZSB3b3Vs
ZCB3YW50IHRvIGVuYWJsZSB0aGUgbmZ0YWJsZXMgYmFja2VuZCBidXQgbm90IHVzZSBpdCBieSBk
ZWZhdWx0LAo+IG1peGluZyBsZWdhY3kgd2l0aCBuZnRhYmxlcyBpcyBhIHJlY2lwZSBmb3IgdHJv
dWJsZS4gQnV0IHRoYXQncyBhIHNlcGFyYXRlCj4gdGhpbmcuIDotKQoKSW5kZWVkLCB3aXRob3V0
IEJSMl9QQUNLQUdFX0lQVEFCTEVTX05GVEFCTEVTX0RFRkFVTFQgZW5hYmxlZCBpcHRhYmxlIC0t
dmVyc2lvbgpyZXR1cm4gIihsZWdhY3kpIiBub3QgIihuZl90YWJsZXMpIi4KCkl0IHNlZW1zIHRo
YXQgWW9jdG8gaXMgZG9pbmcgZXhhY3RseSB3aGF0IHlvdSBzdWdnZXN0OgoKIiMgaWYgbGlibmZ0
bmwgaXMgaW5jbHVkZWQsIG1ha2UgdGhlIGlwdGFibGVzIHN5bWxpbmsgcG9pbnQgdG8gdGhlIG5m
dC1iYXNlZApiaW5hcnkgYnkgZGVmYXVsdCIKCmh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuZW1iZWRk
ZWQvb3BlbmVtYmVkZGVkLWNvcmUvYmxvYi9kNTk1NjE1YzZhMDI3YjgwZDZmN2VhODBhYjI1ZTg1
ZTk3YjI0MzZmL21ldGEvcmVjaXBlcy1leHRlbmRlZC9pcHRhYmxlcy9pcHRhYmxlc18xLjguMTMu
YmIjTDcyCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gRmlvbmEK
PiAKPj4gWzFdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L3N0YWJsZS9saW51eC5naXQvY29tbWl0Lz8KPj4gaWQ9OWZjZTY2NTgzZjA2YzIxMmU5NWU0Yjc2
ZGQ2MWQ4NDMyZmZhNTZiNgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFp
bi5uYW91ckBzbWlsZS5mcj4KPj4gLS0tCj4+IHYyOgo+PiDCoCAtIEVuYWJsZSBrZXJuZWwgc3Vw
cG9ydCBmb3IgaXB0YWJsZXMtbmZ0IGV2ZW4gaWYgbmZ0YWJsZXMgY29tcGF0IGlzIG5vdAo+PiDC
oMKgwqAgZW5hYmxlZCBieSBkZWZhdWx0IChGaW9uYSBLbHV0ZSkuCj4+IMKgIC0gRW5hYmxlIGtl
cm5lbCBzdXBwb3J0IGZvciBpcHRhYmxlcy1sZWdhY3kgb25seSBpZiBuZnRhYmxlcyBjb21wYXQg
aXMgbm90Cj4+IMKgwqDCoCBlbmFibGVkIGJ5IGRlZmF1bHQgKEZpb25hIEtsdXRlKS4KPj4gLS0t
Cj4+IMKgIHBhY2thZ2UvaXB0YWJsZXMvaXB0YWJsZXMubWsgfCAyMiArKysrKysrKysrKysrKysr
KysrKysrCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYg
LS1naXQgYS9wYWNrYWdlL2lwdGFibGVzL2lwdGFibGVzLm1rIGIvcGFja2FnZS9pcHRhYmxlcy9p
cHRhYmxlcy5tawo+PiBpbmRleCBhOWQ5MTJmNmNjLi5iYjAxYzA3YTQzIDEwMDY0NAo+PiAtLS0g
YS9wYWNrYWdlL2lwdGFibGVzL2lwdGFibGVzLm1rCj4+ICsrKyBiL3BhY2thZ2UvaXB0YWJsZXMv
aXB0YWJsZXMubWsKPj4gQEAgLTQ5LDExICs0OSwzMyBAQCBlbHNlCj4+IMKgIElQVEFCTEVTX0NP
TkZfT1BUUyArPSAtLWRpc2FibGUtYnBmLWNvbXBpbGVyIC0tZGlzYWJsZS1uZnN5bnByb3h5Cj4+
IMKgIGVuZGlmCj4+IMKgICsjIEVuYWJsZSBrZXJuZWwgc3VwcG9ydCBmb3IgaXB0YWJsZXMtbmZ0
IGV2ZW4gaWYgbmZ0YWJsZXMgY29tcGF0IGlzIG5vdAo+PiArIyBlbmFibGVkIGJ5IGRlZmF1bHQu
Cj4+ICtpZmVxICgkKEJSMl9QQUNLQUdFX0lQVEFCTEVTX05GVEFCTEVTKSx5KQo+PiArZGVmaW5l
IElQVEFCTEVTX0xJTlVYX0NPTkZJR19GSVhVUFNfSVBUQUJMRVNfTkZUCj4+ICvCoMKgwqAgJChj
YWxsIEtDT05GSUdfRU5BQkxFX09QVCxDT05GSUdfTkZfVEFCTEVTKQo+PiArwqDCoMKgICQoY2Fs
bCBLQ09ORklHX0VOQUJMRV9PUFQsQ09ORklHX05GX1RBQkxFU19JTkVUKQo+PiArwqDCoMKgICQo
Y2FsbCBLQ09ORklHX0VOQUJMRV9PUFQsQ09ORklHX05GVF9TT0NLRVQpCj4+ICtlbmRlZgo+PiAr
ZW5kaWYKPj4gKwo+PiArIyBFbmFibGUga2VybmVsIHN1cHBvcnQgZm9yIGlwdGFibGVzLWxlZ2Fj
eSBvbmx5IGlmIG5mdGFibGVzIGNvbXBhdCBpcyBub3QKPj4gKyMgZW5hYmxlZCBieSBkZWZhdWx0
Lgo+PiAraWZlcSAoJChCUjJfUEFDS0FHRV9JUFRBQkxFU19ORlRBQkxFU19ERUZBVUxUKSwpCj4+
ICtkZWZpbmUgSVBUQUJMRVNfTElOVVhfQ09ORklHX0ZJWFVQU19JUFRBQkxFU19MRUdBQ1kKPj4g
K8KgwqDCoCAjIFtmb3IgTGludXgga2VybmVsIHZlcnNpb25zIDYuMTcgYW5kIGxhdGVyXQo+PiAr
wqDCoMKgICQoY2FsbCBLQ09ORklHX0VOQUJMRV9PUFQsQ09ORklHX0lQX05GX0lQVEFCTEVTX0xF
R0FDWSkKPj4gK8KgwqDCoCAkKGNhbGwgS0NPTkZJR19FTkFCTEVfT1BULENPTkZJR19ORVRGSUxU
RVJfWFRBQkxFU19MRUdBQ1kpCj4+ICtlbmRlZgo+PiArZW5kaWYKPj4gKwo+PiDCoCBkZWZpbmUg
SVBUQUJMRVNfTElOVVhfQ09ORklHX0ZJWFVQUwo+PiDCoMKgwqDCoMKgICQoY2FsbCBLQ09ORklH
X0VOQUJMRV9PUFQsQ09ORklHX0lQX05GX0lQVEFCTEVTKQo+PiDCoMKgwqDCoMKgICQoY2FsbCBL
Q09ORklHX0VOQUJMRV9PUFQsQ09ORklHX0lQX05GX0ZJTFRFUikKPj4gwqDCoMKgwqDCoCAkKGNh
bGwgS0NPTkZJR19FTkFCTEVfT1BULENPTkZJR19ORVRGSUxURVIpCj4+IMKgwqDCoMKgwqAgJChj
YWxsIEtDT05GSUdfRU5BQkxFX09QVCxDT05GSUdfTkVURklMVEVSX1hUQUJMRVMpCj4+ICvCoMKg
wqAgJChJUFRBQkxFU19MSU5VWF9DT05GSUdfRklYVVBTX0lQVEFCTEVTX0xFR0FDWSkKPj4gK8Kg
wqDCoCAkKElQVEFCTEVTX0xJTlVYX0NPTkZJR19GSVhVUFNfSVBUQUJMRVNfTkZUKQo+PiDCoCBl
bmRlZgo+PiDCoCDCoCBkZWZpbmUgSVBUQUJMRVNfSU5TVEFMTF9JTklUX1NZU1YKPiAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
