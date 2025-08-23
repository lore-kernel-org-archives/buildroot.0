Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DFC9CA0EE4
	for <buildroot@archiver.kernel.org>; Sat, 23 Aug 2025 17:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54A7361086;
	Sat, 23 Aug 2025 17:58:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GEsu3tyPVt6O; Sat, 23 Aug 2025 17:58:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8114A60A88
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8114A60A88;
	Sat, 23 Aug 2025 17:58:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C6E4219C
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 17:58:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC40E81E4E
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 17:58:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JBlPgZ-xEhIC for <buildroot@buildroot.org>;
 Sat, 23 Aug 2025 17:58:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8CCD981A1C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CCD981A1C
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8CCD981A1C
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 17:58:12 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3c7ba6c2b2cso209089f8f.1
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 10:58:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755971890; x=1756576690;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q3r7rQaqpnCpmtbc40sR9AU3Upy8pxZ0vO9CWcW1iAc=;
 b=lj5MwyTVFA4oCGc5v9OOB6BBiF8AvtVjqj3v5d+6uFqZQHGyHXAaGdt9u8w0gOWAnS
 pMEW32CnsW5aZCFCTXEpBhTBP2VOGbZdkRUhIT2rF6taU2qmf21bErr8/sJv29nyKD9i
 GORhn6/jaL+2v0WL1m0Oa4nXStV8L3U/Z+VTq7AS8Ln757vzE+Scu3ELajzC0NEZ8jMH
 FMd/1ol4pgnY8Fma/khdyTN8shrt43qA9iO8d4+YUBvp7V4adv+3ajtwNdbYYe4ul447
 iI1zgu5Mu2euvS9/pLCk1rsZxMkpt2q05pW/eHoIiqkjQFq/jfzyD6918Xh+VJcolwBd
 IhIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXofYR/Xb1JqcrMroGnE3ERADjTFVhO2MNucIJiil02pUAeuUyKA0aEfbwyUGCLxioCYdf8cxGHDk=@buildroot.org
X-Gm-Message-State: AOJu0Yx4dYfXy5KO6g3P5sZ3NlvXFiR5Pv00XVsJeFcNUNX9wrNmgnIz
 SBOvdjHBGkinBvlt4MBTFaYGJNwFsUOiIjpDTzYEFy8YOA7rd4kmRnpkSLpJYr3K7p4=
X-Gm-Gg: ASbGnctSOjkhSMXLkN/ndoDVpn1HiOlkMSOeeBMJlG3G2yU+Hs7GokJDCJnpRRaSAKo
 DFtLjnF+8YXAIMicfX/nsg9wLoBlGTHqC9jOvuPblkUZZfSqPTF2q4i1tqeJYnJ8ijHPcXEmmR5
 VQrKAGistS5jfsWEBqLvaKRUcvQqK4ZriwrQt+830iewdlmye27JS8jzVXgKS0WbKWNvHWT5Fy/
 CjzlKUj01dXFpMhMLxksisRKbaj/YuOsXom/w71hBG6ROfRZSifdDpBEk0Mpf1BfuSr/DJ0FhcL
 0wNHw4Pw79nscSUCpU39/0lGo20Q47WRB9hk2K1On3MQxt2P56s4UDYXdRCtzDy7vVGrKSmyK1s
 p5HeH/PR4uDO3yMMK+NQxZP8XjH7jFM11bFmget1vyUbGr0FTbchhrRxHKnR+9OYfbLyS+RCBu2
 JQp3YsQoxZsguN+1kKff3dCA0W0d4wuZNRSEby5CUNoN9fep7hWxnET1EKMM5h
X-Google-Smtp-Source: AGHT+IE7t9StJ5Z9F+9LUqAlturM3otUvTzQvSu7hWCkXteUEqxm+D0w4cMdcgjtlmzupWfWe6mzVg==
X-Received: by 2002:a05:6000:2902:b0:3c7:c94f:6630 with SMTP id
 ffacd0b85a97d-3c7c94f6996mr1106165f8f.19.1755971890383; 
 Sat, 23 Aug 2025 10:58:10 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c711211b19sm4531708f8f.39.2025.08.23.10.58.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Aug 2025 10:58:10 -0700 (PDT)
Message-ID: <db36d740-9fe4-4fa0-8b8b-2a2c4bfb1778@smile.fr>
Date: Sat, 23 Aug 2025 19:58:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daniel Lang <dalang@gmx.at>, buildroot@buildroot.org
References: <20250823045814.256464-2-dalang@gmx.at>
Content-Language: fr, en-US
In-Reply-To: <20250823045814.256464-2-dalang@gmx.at>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1755971890; x=1756576690; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Q3r7rQaqpnCpmtbc40sR9AU3Upy8pxZ0vO9CWcW1iAc=;
 b=0KH5Qhu/YqdmJg4VMVBH7Otx0smj0x+/P0MzYLA6Glm0XCpQki3MyyUSt6rm5hZTfo
 StiO+ocuAQKRwAJMLgViT8Gl0Nge6csntdx0XgeMRbvg9ZD1CM3EPCsGKhnE2A4ZjLj8
 94lkQCtV1osnnPBJ69gA7wMoms7UcqGYPi/2k=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=0KH5Qhu/
Subject: Re: [Buildroot] [PATCH] support/scripts/cve.py: handle missing
 nodes in cpe configurations
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

SGVsbG8gRGFuaWVsLCBBbGwsCgpMZSAyMy8wOC8yMDI1IMOgIDA2OjU4LCBEYW5pZWwgTGFuZyB2
aWEgYnVpbGRyb290IGEgw6ljcml0wqA6Cj4gUmVjZW50IHVwZGF0ZXMgdG8gdGhlIENQRSBkYXRh
YmFzZSBtYWtlIHRoZSBzY3JpcHQgZmFpbCB3aXRoOgoKRG8geW91IGhhdmUgYW55IGluZm8gYWJv
dXQgdGhvc2UgdXBkYXRlcz8KClRob21hcyBub3RpY2VkIHRoYXQgd2UgZGlkbid0IHJlY2VpdmUg
YW55ICJEYWlseSByZXN1bHRzIiBlbWFpbCB0b2RheSAodGhlIGxhc3QKb25lIHdhcyB0aGUgMjIv
MDgvMjAyNSkuIEhlIGp1c3Qgc2VudCB0aGUgc2FtZSBwYXRjaCBbMV0gd2l0aCBhIHNsaWdodGx5
CmltcHJvdmVkIGNvbW1pdCBsb2cuCgpXZSBuZWVkIHRoaXMgZml4IHRvZGF5IGluIG9yZGVyIHRv
IHJlY2VpdmUgdGhlICJEYWlseSByZXN1bHRzIiBlbWFpbCB0b21vcnJvdy4KSSdsbCBtZXJnZSBU
aG9tYXMncyBwYXRjaCBub3csIGJ1dCB0aGFua3MgZm9yIHlvdXIgY29udHJpYnV0aW9uIQoKWzFd
Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2J1aWxkcm9vdC8yMDI1MDgyMzE0Mzg0My41MDAzNS0x
LXRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20vVC8jdQoKQmVzdCByZWdhcmRzLApSb21haW4K
Cgo+IAo+IEZpbGUgImJ1aWxkcm9vdC9zdXBwb3J0L3NjcmlwdHMvY3ZlLnB5IiwgbGluZSAxNzMs
IGluIGVhY2hfY3BlCj4gICAgIGZvciBub2RlIGluIG5vZGVzWydub2RlcyddOgo+ICAgICAgICAg
ICAgICAgICB+fn5+fl5eXl5eXl5eXgo+IEtleUVycm9yOiAnbm9kZXMnCj4gCj4gU2lnbmVkLW9m
Zi1ieTogRGFuaWVsIExhbmcgPGRhbGFuZ0BnbXguYXQ+Cj4gLS0tCj4gIHN1cHBvcnQvc2NyaXB0
cy9jdmUucHkgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9zdXBwb3J0L3NjcmlwdHMvY3ZlLnB5IGIvc3VwcG9y
dC9zY3JpcHRzL2N2ZS5weQo+IGluZGV4IDFjYmUyNGMwMmQuLmJhNDE3NjJmYTAgMTAwNzU1Cj4g
LS0tIGEvc3VwcG9ydC9zY3JpcHRzL2N2ZS5weQo+ICsrKyBiL3N1cHBvcnQvc2NyaXB0cy9jdmUu
cHkKPiBAQCAtMTcwLDcgKzE3MCw3IEBAIGNsYXNzIENWRToKPiAgCj4gICAgICBkZWYgZWFjaF9j
cGUoc2VsZik6Cj4gICAgICAgICAgZm9yIG5vZGVzIGluIHNlbGYubnZkX2N2ZS5nZXQoJ2NvbmZp
Z3VyYXRpb25zJywgW10pOgo+IC0gICAgICAgICAgICBmb3Igbm9kZSBpbiBub2Rlc1snbm9kZXMn
XToKPiArICAgICAgICAgICAgZm9yIG5vZGUgaW4gbm9kZXMuZ2V0KCdub2RlcycsIFtdKToKPiAg
ICAgICAgICAgICAgICAgIGZvciBjcGUgaW4gc2VsZi5wYXJzZV9ub2RlKG5vZGUpOgo+ICAgICAg
ICAgICAgICAgICAgICAgIHlpZWxkIGNwZQo+ICAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
