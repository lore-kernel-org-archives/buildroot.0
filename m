Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C36C83030
	for <buildroot@archiver.kernel.org>; Thu,  3 Jul 2025 11:16:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC2216088F;
	Thu,  3 Jul 2025 11:16:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id velnIBy3nXib; Thu,  3 Jul 2025 11:16:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFA71608CC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFA71608CC;
	Thu,  3 Jul 2025 11:16:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B5EE775
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 11:16:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C92560D78
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 11:16:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GQc5m_C5mhfG for <buildroot@buildroot.org>;
 Thu,  3 Jul 2025 11:16:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A8EF96088F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8EF96088F
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A8EF96088F
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 11:16:21 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-454aaade1fbso8665175e9.3
 for <buildroot@buildroot.org>; Thu, 03 Jul 2025 04:16:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751541380; x=1752146180;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+uI2X7GJOUm7vWhAuoN5FKM4XobB+Kst6TYr76bW3bs=;
 b=OdHG20GxYRD3L6e3OJn52w6tBIj9xRKfowcfVPcasbEgXC0Y3B6HaA31u0/Ho+lUQ5
 MsDlW74kvu+p9mopIqKK2SZgRisD5y7dt01+oEoSG+02/30mbK0gBdzcqQvINViIr+Jp
 gCcSasYePOZtupWofUn+qRYLw/1wu2XM4okCX/3RgEou8gTxZV+VLr1QhugPgZrsyo2m
 fQoPIvrmj0/qkl9sag6ExgyDFxtAc5ntcl7YgF3WWrp3do5a84wxlF+JWk/ZwtSRVOWu
 /8lfOCJw72oSSZskLdbp+N2UArQFl5pUJcY3cFwgBSTUjkZ5az5jsQiKVG5pXWNPLjuq
 +chQ==
X-Gm-Message-State: AOJu0YypqGPVY+X1JTJTWt9W/ThNDjicfMLYa+pBMczWt175fNNx8cUF
 FucovuC37lapb3mgqH529++bwIg4702OSoyPsfFPXNpm7d+tQdNf3fy4shBkfeiPLcc=
X-Gm-Gg: ASbGncuNlxLxl8rotiEp5ob3xM5kbFSvQe1DJ8dueAUtgoD0GqJu74rA79fwuGdGdSi
 doOASFJHUZElC68vdpA41cfpfFXYJ5dkhRXUPyg3lW+ko5+W5DlH30XAcUyoWwEj0p39MPjRuk7
 oZwiEUpf15VQuRNvPrXEU2iYWIbDrbu0g3LPSD7fs5PlS/ReSdZBvhB3V3o1a1i/CR/fpXapiBs
 Dnc2OtuA91no3hF5gsePAbWQ7lUmdYcEkAyxbx32CNgri6/eyNxu7R06/Nj+ylmHZhIczz0WmTV
 vmxdtZx4F+ZgZUFUXeT7qTBtN4AdsGW2jtHW+d2psVctrC8b0tYEyQ641YF9E7fkp/mxH9HVLGT
 /EuhsfNzqKavlNlaEmNtF7lbt5JrF+5iaw158uo6EgWp2DmeqscHFDlS9p7N5fwLkxh7/YW01hZ
 ls8IiZw9kkawK02kVrsHb+Scre
X-Google-Smtp-Source: AGHT+IFBvEXk9ZGTav22UqN2jFkzT6BpFNCZ1xYQ3jOhsqaU4D8lrhgA5xrTaiPr0m3RPvG5YVTJDA==
X-Received: by 2002:a05:600c:608a:b0:453:8f6:6383 with SMTP id
 5b1f17b1804b1-454a36e996cmr75445305e9.15.1751541379533; 
 Thu, 03 Jul 2025 04:16:19 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454a98ebe2asm24667595e9.0.2025.07.03.04.16.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jul 2025 04:16:19 -0700 (PDT)
Message-ID: <204c6146-2b48-43d0-94d4-78f030da1f28@smile.fr>
Date: Thu, 3 Jul 2025 13:16:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, Daniel Lang <dalang@gmx.at>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
References: <20250626111642.228223-1-alex.bennee@linaro.org>
 <20250626111642.228223-4-alex.bennee@linaro.org>
 <7ee26828-4b3d-4942-8c30-8293455c59fc@smile.fr>
 <87qzyxdb8v.fsf@draig.linaro.org>
 <6d55950e-280c-46dc-9e4c-c24cf2387eb3@smile.fr>
Content-Language: fr
In-Reply-To: <6d55950e-280c-46dc-9e4c-c24cf2387eb3@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1751541380; x=1752146180; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=+uI2X7GJOUm7vWhAuoN5FKM4XobB+Kst6TYr76bW3bs=;
 b=D+mhau2/kIPzm5XEvlVTFZceyksSV5v5Ns1LSAj0l+Jd89w7flZeUGZLcAe5LqQ5LI
 O+Mw1Z7SkeUhKWKJdhtvN7754wtX0MQlCY+0cjtvlLGaH7zkWLO6pDhYrn2R4hkcoZiB
 FPUx1Lybg5NyYK1SV6NfjfW7gLc1O6UFzJ/h0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=D+mhau2/
Subject: Re: [Buildroot] [RFC PATCH 3/3] package/llvm-project: reduce the
 build size of llvm
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

TGUgMDMvMDcvMjAyNSDDoCAxMzowOSwgUm9tYWluIE5hb3VyIGEgw6ljcml0wqA6Cj4gTGUgMDMv
MDcvMjAyNSDDoCAwODo0NCwgQWxleCBCZW5uw6llIGEgw6ljcml0wqA6Cj4+IFJvbWFpbiBOYW91
ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPiB3cml0ZXM6Cj4+Cj4+PiBIZWxsbyBBbGV4LCBBbGws
Cj4+Pgo+Pj4gTGUgMjYvMDYvMjAyNSDDoCAxMzoxNiwgQWxleCBCZW5uw6llIGEgw6ljcml0wqA6
Cj4+Pj4gQWx0aG91Z2ggd2UgcmVxdWVzdCBhIFJlbGVhc2UgYnVpbGQgdGhlIGRlZmF1bHQgQ01B
S0UgZmxhZ3MgaW4KPj4+PiB0b29sY2hhaW4uY21ha2UgaW5jbHVkZSAtT2cgLWczIHdoaWNoIGVu
YWJsZXMgZGVidWcgc3ltYm9scyBmb3IgdGhlCj4+Pj4gYnVpbGQgaW5mbGF0aW5nIHRoZSBvdmVy
YWxsIHNpemUgb2YgdGhpbmdzLgo+Pj4KPj4+IEJ5IGRlZmF1bHQsIC1PMiAtZzAgaXMgdXNlZCBi
eSBCdWlsZHJvb3QuIElmIHlvdSBoYXZlIC1PZyAtZzMgaW4gdG9vbGNoYWluLmNtYWtlCj4+PiBn
ZW5lcmF0ZWQgYnkgQnVpbGRyb290LCBpdCBtZWFucyB0aGF0IEJSMl9FTkFCTEVfREVCVUcsIEJS
Ml9ERUJVR18zIGFuZAo+Pj4gQlIyX09QVElNSVpFX0cgaGF2ZSBiZWVuIHNlbGVjdGVkIGluIHRo
ZSBCdWlsZHJvb3QgY29uZmlndXJhdGlvbiAoYnkKPj4+IHRoZSB1c2VyKS4KPj4KPj4gV2hlcmUg
aXMgdGhlIGxvZ2ljIHRoYXQgc2V0cyB0aGlzPyBCZWNhdXNlOgo+Pgo+PiAgIOKenCAgYWcgREVC
VUcgLmNvbmZpZwo+PiAgIDE3OTpCUjJfVE9PTENIQUlOX0hBU19USFJFQURTX0RFQlVHPXkKPj4g
ICAzMDY6IyBCUjJfRU5BQkxFX0RFQlVHIGlzIG5vdCBzZXQKPj4gICAzMDc6IyBCUjJfRU5BQkxF
X1JVTlRJTUVfREVCVUcgaXMgbm90IHNldAo+PiAgIDQxNDY6IyBCUjJfUEFDS0FHRV9PUEVOUE9X
RVJMSU5LX0RFQlVHX0xFVkVMIGlzIG5vdCBzZXQKPj4KPj4gQnV0Ogo+Pgo+PiAgIOKenCAgYWcg
IkJ1aWxkcm9vdCBDRkxBR1MiIC4vaG9zdC9zaGFyZS9idWlsZHJvb3QvdG9vbGNoYWluZmlsZS5j
bWFrZQo+PiAgIDU3OiAgc2V0KENNQUtFX0NfRkxBR1MgIi1EX0xBUkdFRklMRV9TT1VSQ0UgLURf
TEFSR0VGSUxFNjRfU09VUkNFIC1EX0ZJTEVfT0ZGU0VUX0JJVFM9NjQgLU9nIC1nMyAtRF9GT1JU
SUZZX1NPVVJDRT0xIiBDQUNIRSBTVFJJTkcgIkJ1aWxkcm9vdCBDRkxBR1MiKQo+IAo+IEl0J3Mg
d2VpcmQgaW5kZWVkLiBJIGhhZCB0byB1c2UgQlIyX0VOQUJMRV9ERUJVRywgQlIyX0RFQlVHXzMg
YW5kIEJSMl9PUFRJTUlaRV9HCj4gdG8gZ2V0IHRoZSBzYW1lIG9wdGltaXphdGlvbiBsZXZlbCB0
aGFuIHlvdS4gT3RoZXJ3aXNlIC1PMiAtZzAgaXMgdXNlZC4KPiAKPiBDYW4geW91IHNoYXJlIGEg
QnVpbGRyb290IGRlZmNvbmZpZyBhYmxlIHRvIHJlcHJvZHVjZSB0aGlzIGlzc3VlPwoKTm90ZToK
Li9ob3N0L3NoYXJlL2J1aWxkcm9vdC90b29sY2hhaW5maWxlLmNtYWtlIGlzIGdlbmVyYXRlZCBi
eSB0aGUgdG9vbGNoYWluIHBhY2thZ2UKYXMgcG9zdCBpbnN0YWxsIHN0YWdpbmcgaG9vazoKCnNl
ZToKVE9PTENIQUlOX1BPU1RfSU5TVEFMTF9TVEFHSU5HX0hPT0tTICs9IFRPT0xDSEFJTl9DTUFL
RV9JTlNUQUxMX0ZJTEVTCgpJZiB0aGUgdG9vbGNoYWluZmlsZS5jbWFrZSBmaWxlIHdhcyBnZW5l
cmF0ZWQgd2l0aCBCUjJfRU5BQkxFX0RFQlVHLCBCUjJfREVCVUdfMwphbmQgQlIyX09QVElNSVpF
X0cgc2V0IGJ1dCB0aGlzIHNldHRpbmcgd2FzIHVwZGF0ZWQgYWZ0ZXIsIGl0IG1lYW5zIHlvdSBo
YXZlIHRvCmRvIGEgbmV3IGJ1aWxkLiBCdWlsZHJvb3QgZG9lc24ndCBkZXRlY3Qgc3VjaCBjaGFu
Z2UgYW5kIGEgbmV3IGJ1aWxkIGZyb20Kc2NyYXRjaCBpcyBuZWVkZWQuCgpCZXN0IHJlZ2FyZHMs
ClJvbWFpbgoKCj4gCj4gQmVzdCByZWdhcmRzLAo+IFJvbWFpbgo+IAo+IAo+Pgo+Pj4KPj4+Pgo+
Pj4+IEZvciBub3cganVzdCBjb3B5IHRob3NlIGRlZmF1bHRzIGludG8gdGhlIHByb2plY3QgbWsg
ZmlsZSBhbmQgZHJvcCB0aGUKPj4+PiAtT2cgYW5kIC1nMyBsaW5lcy4gVGhpcyBkcm9wcyB0aGUg
c2l6ZSBvZiB0aGUgbGx2bSBidWlsZCBkaXJlY3Rvcnkgb24KPj4+PiBteSBhcm02NCBidWlsZCBm
cm9tIDE3R2IgdG8gYSBtb3JlIHJlYXNvbmFibGUgNC40R2IuCj4+Pj4KPj4+PiBTaWduZWQtb2Zm
LWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+Cj4+Pj4gLS0tCj4+Pj4g
IHBhY2thZ2UvbGx2bS1wcm9qZWN0L2xsdm0vbGx2bS5tayB8IDEwICsrKysrKysrKysKPj4+PiAg
MSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9w
YWNrYWdlL2xsdm0tcHJvamVjdC9sbHZtL2xsdm0ubWsgYi9wYWNrYWdlL2xsdm0tcHJvamVjdC9s
bHZtL2xsdm0ubWsKPj4+PiBpbmRleCA3OGFhNmZlNDY3Li4wMzY4NDA4NGM0IDEwMDY0NAo+Pj4+
IC0tLSBhL3BhY2thZ2UvbGx2bS1wcm9qZWN0L2xsdm0vbGx2bS5tawo+Pj4+ICsrKyBiL3BhY2th
Z2UvbGx2bS1wcm9qZWN0L2xsdm0vbGx2bS5tawo+Pj4+IEBAIC0xNjcsNiArMTY3LDE2IEBAIExM
Vk1fQ09ORl9PUFRTICs9IC1ETExWTV9IQVZFX1RGTElURT0iIgo+Pj4+ICBIT1NUX0xMVk1fQ09O
Rl9PUFRTICs9IC1EQ01BS0VfQlVJTERfVFlQRT1SZWxlYXNlIC1HIE5pbmphCj4+Pj4gIExMVk1f
Q09ORl9PUFRTICs9IC1EQ01BS0VfQlVJTERfVFlQRT1SZWxlYXNlIC1HIE5pbmphCj4+Pj4gIAo+
Pj4+ICsjIFJlZHVjZSB0aGUgb3Bwb3J0dW5pdHkgZm9yIGRlZmF1bHQgW0N8Q1hYXV9GTEFHUyB0
byBmYXR0ZW4gdGhlIGJ1aWxkCj4+Pj4gK0hPU1RfTExWTV9DT05GX09QVFMgKz0gLURMTFZNX0VO
QUJMRV9BU1NFUlRJT05TPU9GRgo+Pj4+ICtMTFZNX0NPTkZfT1BUUyArPSAtRExMVk1fRU5BQkxF
X0FTU0VSVElPTlM9T0ZGCj4+Pj4KPj4+IExMVk1fRU5BQkxFX0FTU0VSVElPTlMgaXMgT0ZGIGJ5
IGRlZmF1bHQgZXhlcHQgZm9yIGRlYnVnIGJ1aWxkcy4KPj4+Cj4+PiArCj4+Pj4gK0hPU1RfTExW
TV9DT05GX09QVFMgKz0gLURDTUFLRV9DX0ZMQUdTPSItRF9MQVJHRUZJTEVfU09VUkNFIC1EX0xB
UkdFRklMRTY0X1NPVVJDRSAtRF9GSUxFX09GRlNFVF9CSVRTPTY0IC1EX0ZPUlRJRllfU09VUkNF
PTEiCj4+Pj4gK0xMVk1fQ09ORl9PUFRTICs9IC1EQ01BS0VfQ19GTEFHUz0iLURfTEFSR0VGSUxF
X1NPVVJDRSAtRF9MQVJHRUZJTEU2NF9TT1VSQ0UgLURfRklMRV9PRkZTRVRfQklUUz02NCAtRF9G
T1JUSUZZX1NPVVJDRT0xIgo+Pj4+ICsKPj4+PiArSE9TVF9MTFZNX0NPTkZfT1BUUyArPSAtRENN
QUtFX0NYWF9GTEFHUz0iLURfTEFSR0VGSUxFX1NPVVJDRSAtRF9MQVJHRUZJTEU2NF9TT1VSQ0Ug
LURfRklMRV9PRkZTRVRfQklUUz02NCAtRF9GT1JUSUZZX1NPVVJDRT0xIgo+Pj4+ICtMTFZNX0NP
TkZfT1BUUyArPSAtRENNQUtFX0NYWF9GTEFHUz0iLURfTEFSR0VGSUxFX1NPVVJDRSAtRF9MQVJH
RUZJTEU2NF9TT1VSQ0UgLURfRklMRV9PRkZTRVRfQklUUz02NCAtRF9GT1JUSUZZX1NPVVJDRT0x
Igo+Pj4KPj4+IEknbSBub3Qgc3VyZSBhYm91dCB0aGlzIGNoYW5nZSwgc2luY2UgaXQgYWxzbyBj
aGFuZ2UgZm9yIG90aGVyIEJSMl9PUFRJTUlaRV94Cj4+PiBvcHRpb25zIGFuZCB3aGVuIEJSMl9F
TkFCTEVfREVCVUcgaXMgZGlzYWJsZWQuIFdlIHdhbnQgdG8ga2VlcCB0aGUgb3B0aW1pemF0aW9u
Cj4+PiBsZXZlbCBzZWxlY3RlZCBieSB0aGUgdXNlci4KPj4+Cj4+PiBXaGF0IGFib3V0IHNvbWV0
aGluZyBsaWtlIGtleGVjIHBhY2thZ2UgWzFdIHRvIGZvcmNlIHRoZSBvcHRpbWl6YXRpb24gbGV2
ZWwgdG8gYQo+Pj4gbWluaW11bT8KPj4+Cj4+PiBJIHJlbWVtYmVyIChiYWNrIGluIDIwMTgpIGxs
dm0gY3Jhc2hpbmcgd2l0aCBEZWJ1ZyBidWlsZCB0eXBlLCB0aGF0J3Mgd2h5IGl0J3MKPj4+IGZv
cmNlZCB0byBSZWxlYXNlIHR5cGUgYnV0IHRoZSBkZWZhdWx0IGJ1aWxkIG9wdGlvbnMgd2VyZSB1
c2VkICgtTzIgLWcwKS4KPj4+Cj4+PiBbMV0KPj4+IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJv
b3Qub3JnL2J1aWxkcm9vdC8tL2Jsb2IvbWFzdGVyL3BhY2thZ2Uva2V4ZWMva2V4ZWMubWs/cmVm
X3R5cGU9aGVhZHMjTDIzCj4+Pgo+Pj4gQmVzdCByZWdhcmRzLAo+Pj4gUm9tYWluCj4+Pgo+Pj4K
Pj4+PiArCj4+Pj4gICMgQ29tcGlsZSBsbHZtIHdpdGggdGhlIEMrKzE0IChJU08gQysrIDIwMTQg
c3RhbmRhcmQpLgo+Pj4+ICBIT1NUX0xMVk1fQ09ORl9PUFRTICs9IC1EQ01BS0VfQ1hYX1NUQU5E
QVJEPTE0Cj4+Pj4gIExMVk1fQ09ORl9PUFRTICs9IC1EQ01BS0VfQ1hYX1NUQU5EQVJEPTE0Cj4+
Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
