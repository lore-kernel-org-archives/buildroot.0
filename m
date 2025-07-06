Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB01C83F03
	for <buildroot@archiver.kernel.org>; Sun,  6 Jul 2025 14:23:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3F1340BAB;
	Sun,  6 Jul 2025 14:23:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D-5WR-eSexHA; Sun,  6 Jul 2025 14:23:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01B2A40B51
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01B2A40B51;
	Sun,  6 Jul 2025 14:23:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D0B8D12E
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 14:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B737A40B50
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 14:23:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jG8Zoo9cqnXA for <buildroot@buildroot.org>;
 Sun,  6 Jul 2025 14:23:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BCBAB40B51
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCBAB40B51
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BCBAB40B51
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 14:23:10 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-451d3f72391so23242555e9.3
 for <buildroot@buildroot.org>; Sun, 06 Jul 2025 07:23:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751811789; x=1752416589;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KI/Z5QnCE9sCPKos47rPKsS9RjHv5Cj8+wKa4KjPUc4=;
 b=cUtahr7OTNmD5+WuURh1e/UsmwempN1YVP5yMKuISdyxaCRkUSdxOZM5uWp9k54cVk
 kksks2uGl6OmnEchyaZO+nYjE12YdC9AtFqp9maQFhkydWNHKcd9YUlIvmLR2yZulA86
 J4kCS2SCmDV/EdB/PutR10QE3zYDzxdhftRy1alxUxnWTCiHr90I0rnhdtbsYtLSuc6h
 1PdAY/fyop4tZvcKc4kufMzzN8L2jII/Av3QhPWM3D9GhlEM1ogSYA2oS/d5YWhtTqVY
 FeKswTLBwiNvSC+w94ChDytz4RCgmFEBuCcA9PJdVouLpqap3v/FtLzjvAQi+dhbyt00
 7IdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzCNMnwIXgpeHxS1cNDhm3q2ndsWnF0JHm8a/U6gmaE/UM1E80rorUptHhRh2ersCNh0/VcllyUdE=@buildroot.org
X-Gm-Message-State: AOJu0YwUPHfoRkrBmjIu/lzbWVBdYENAcKLNUr4T+vSi+IhUOqkgCkNZ
 l7OWx1OzSuOp86B9Re//VgEjuVEzF0lpztIPF8A7pVSQZbSb0cnCXmmxxMyBECZPadg=
X-Gm-Gg: ASbGncs5Rx7KxJM8t46JMCicZh3aE2ORJj3HzZONQFDQKqMpeSgR77Dcc9PxCTW1wwe
 rVEzNvGYKrLxHHNLSvZANCq8dRcyxhhoSWQ5SARQkYa9GkQaWbNtxTzm41FFDwnf+KbBYBovEdL
 CJ0SGkBa5uip58/1kysrpkvFTD5KCW7rRPx+LJvit7Zsyi5WFQgQ2D86eIvLk833JL8o3cjSoFL
 Y94jFGOlLK5S19oCKnzU70kmpRgAeV0vTSRWe5+cLqOHF2dPD08oShZMokrHHq8/1x2+Y8uMOhm
 +zIPvuMS9MC6tQ3cP+SNw64QwxgQ0N/eVz94io6u4droo7kdD0TvxuT5TQu3+08hfr7Ioavkjsx
 n77LBLS+ml7imZHSlKPSbVKZbl0NmOhs4oa/+2boae2yib9WB57KLN2MlUs0IMJ36hhR4lree7X
 Y6/dmKQj/Hsu/+sBY0yP6uoqRG
X-Google-Smtp-Source: AGHT+IHCvYhuTaCL+Z5TYwMw97mCxBlCSJAdCJcK72FZWlghQfrnlXFklB9bsDx+nE1/0iLZw6EyzQ==
X-Received: by 2002:a05:600c:6488:b0:441:d437:e3b8 with SMTP id
 5b1f17b1804b1-454b30fd93dmr80855965e9.23.1751811788584; 
 Sun, 06 Jul 2025 07:23:08 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454c2bf5a86sm17918405e9.3.2025.07.06.07.23.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Jul 2025 07:23:08 -0700 (PDT)
Message-ID: <3048d9be-1e8b-4b79-b592-c66eb4c3f3c8@smile.fr>
Date: Sun, 6 Jul 2025 16:23:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Gilles Talis <gilles.talis@gmail.com>
References: <20250704195740.1576078-1-ju.o@free.fr>
Content-Language: fr
In-Reply-To: <20250704195740.1576078-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1751811789; x=1752416589; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KI/Z5QnCE9sCPKos47rPKsS9RjHv5Cj8+wKa4KjPUc4=;
 b=kuEuk6WNKlhD8XHM0Y/CxaLgSFgUYfhWeweV3OequgiO9ZVTkzs5QHhVDfR73/3jyn
 J98y+sRRWtwebk+XbhBJSY82zSs/udR4Eb7dCcA/776wKUgujjRQD3G2/dwKLJRYPOub
 nyyCopninLgHK7STG6jMx9nS2Iwjozu5p2nAM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=kuEuk6WN
Subject: Re: [Buildroot] [PATCH 1/1] package/clpeak: bump version to 1.1.5
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

SGVsbG8gSnVsaWVuLCBBbGwsCgpMZSAwNC8wNy8yMDI1IMOgIDIxOjU3LCBKdWxpZW4gT2xpdmFp
biB2aWEgYnVpbGRyb290IGEgw6ljcml0wqA6Cj4gRm9yIHJlbGVhc2Ugbm90ZXMgc2luY2UgMS4x
LjIsIHNlZToKPiBodHRwczovL2dpdGh1Yi5jb20va3JyaXNobmFycmFqL2NscGVhay9yZWxlYXNl
cy90YWcvMS4xLjMKPiBodHRwczovL2dpdGh1Yi5jb20va3JyaXNobmFycmFqL2NscGVhay9yZWxl
YXNlcy90YWcvMS4xLjQKPiBodHRwczovL2dpdGh1Yi5jb20va3JyaXNobmFycmFqL2NscGVhay9y
ZWxlYXNlcy90YWcvMS4xLjUKPiAKPiBUaGUgcGFja2FnZSBsaWNlbnNlIGNoYW5nZWQgZnJvbSBV
bmxpY2Vuc2VkIHRvIEFwYWNoZS0yLjAgaW4gdXBzdHJlYW0KPiBjb21taXQgWzFdLiBUaGlzIGNv
bW1pdCB1cGRhdGVzIF9MSUNFTlNFIGFuZCB0aGUgbGljZW5zZSBmaWxlIGhhc2gKPiBhY2NvcmRp
bmdseS4KPiAKPiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL2tycmlzaG5hcnJhai9jbHBlYWsvY29t
bWl0LzY1ZTU3MjQ1MTMzMGI0NjczNzEyZGZlYzM1Mjg0MmYzMTIzYTkyNTgKCkFwcGxpZWQgdG8g
bWFzdGVyLCB0aGFua3MuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gCj4gU2lnbmVkLW9mZi1i
eTogSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4KPiAtLS0KPiAgcGFja2FnZS9jbHBlYWsv
Y2xwZWFrLmhhc2ggfCA0ICsrLS0KPiAgcGFja2FnZS9jbHBlYWsvY2xwZWFrLm1rICAgfCA0ICsr
LS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvY2xwZWFrL2NscGVhay5oYXNoIGIvcGFja2FnZS9jbHBl
YWsvY2xwZWFrLmhhc2gKPiBpbmRleCAzZGIyYTJjYTZiLi4wZWYzMGM1YTY4IDEwMDY0NAo+IC0t
LSBhL3BhY2thZ2UvY2xwZWFrL2NscGVhay5oYXNoCj4gKysrIGIvcGFja2FnZS9jbHBlYWsvY2xw
ZWFrLmhhc2gKPiBAQCAtMSwzICsxLDMgQEAKPiAgIyBMb2NhbGx5IGNvbXB1dGVkCj4gLXNoYTI1
NiAgN2JjN2JlYmE2YjMzMDcyOTA2NTBhYmM0ZjEzZmU5Mzg5YjI3MWMxYTY0NjAxZmEzMzM0NjE1
MTY5NTBkNzQ1YiAgY2xwZWFrLTEuMS4yLnRhci5nego+IC1zaGEyNTYgIDg4ZDliNGViNjA1Nzlj
MTkxZWMzOTFjYTA0YzE2MTMwNTcyZDdlZWRjNGE4NmRhYTU4YmYyOGM2ZTE0YzliY2QgIExJQ0VO
U0UKPiArc2hhMjU2ICAzMTYyMGVmMjg4NDgxMDhmNjg2OGU1N2UxMDA0MTJhYTAwOTM5OWJhMmNk
MDIxYWZkM2I2NDU2MzcxMWZhNDlmICBjbHBlYWstMS4xLjUudGFyLmd6Cj4gK3NoYTI1NiAgYzcx
ZDIzOWRmOTE3MjZmYzUxOWM2ZWI3MmQzMThlYzY1ODIwNjI3MjMyYjJmNzk2MjE5ZTg3ZGNmMzVk
MGFiNCAgTElDRU5TRQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2NscGVhay9jbHBlYWsubWsgYi9w
YWNrYWdlL2NscGVhay9jbHBlYWsubWsKPiBpbmRleCA2MTZhMDJjMGI0Li43NzU2MzQ1YmU2IDEw
MDY0NAo+IC0tLSBhL3BhY2thZ2UvY2xwZWFrL2NscGVhay5tawo+ICsrKyBiL3BhY2thZ2UvY2xw
ZWFrL2NscGVhay5tawo+IEBAIC00LDkgKzQsOSBAQAo+ICAjCj4gICMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjCj4gIAo+IC1DTFBFQUtfVkVSU0lPTiA9IDEuMS4yCj4gK0NMUEVBS19WRVJTSU9OID0g
MS4xLjUKPiAgQ0xQRUFLX1NJVEUgPSAkKGNhbGwgZ2l0aHViLGtycmlzaG5hcnJhaixjbHBlYWss
JChDTFBFQUtfVkVSU0lPTikpCj4gLUNMUEVBS19MSUNFTlNFID0gVW5saWNlbnNlCj4gK0NMUEVB
S19MSUNFTlNFID0gQXBhY2hlLTIuMAo+ICBDTFBFQUtfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UK
PiAgQ0xQRUFLX0RFUEVOREVOQ0lFUyA9IGxpYm9wZW5jbCBvcGVuY2wtY2xocHAKPiAgCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
