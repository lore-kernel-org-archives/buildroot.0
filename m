Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8937DE77170
	for <buildroot@archiver.kernel.org>; Wed,  4 Dec 2024 19:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2983C413C2;
	Wed,  4 Dec 2024 19:40:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bt67OHAhnM9k; Wed,  4 Dec 2024 19:40:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D51D5413C5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D51D5413C5;
	Wed,  4 Dec 2024 19:40:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AE8591DD9
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 19:40:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D78884552
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 19:40:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l3rE3ywaEo22 for <buildroot@buildroot.org>;
 Wed,  4 Dec 2024 19:40:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AA4518454D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA4518454D
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AA4518454D
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 19:40:21 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-385ed7f6605so79847f8f.3
 for <buildroot@buildroot.org>; Wed, 04 Dec 2024 11:40:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733341220; x=1733946020;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kAGenpAXCUBGDTRen8cLyhsipFSg3OUFcbMUBAwK8YQ=;
 b=hNm9kYui2NdNSndumLsrFUynLy/zfhPBKuCuU48OIv3jA4jvg5WKX34sza8ybkovUr
 2QnoVxG9Ngr6HlFv5vAfYqhAHTFiZb56Ew30567oAE/+WHXAXjkscfXIkolBm1B3sfAX
 7i84EIw71cMJJr0DsSKmfzH7oN/cKTK6MpISs1owNAN+UdwwHzJkE6X6q6iTW7uSHwZZ
 fp9HtNjKX5kvCLhI1aj1m/BbDyRzkHe2t/uX3b8n1fOCBtjVtRM4vAAERT8dVteOPx6D
 CWkQWm4zIbK5qLfQdU8eVl2VubJXC+FQ4mf4bb/3mU1sNGAAyaqPqBmklWVj2JMjnVsn
 cH2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfmG3vjil2pUPRaGSEqC1IiYnv0/vH3gltJR9RQRfyPgxELjeMIQJ5R8TrwjFbhxHRYDrbVpgzx30=@buildroot.org
X-Gm-Message-State: AOJu0YwXhV0wYE0xobPdqQ4IrEHjgSbOmuu2bGKFLXaENhMJQIgLI3Y5
 1c0qKCp+xIhgoEdd0OJ7XiRgstOw2BUkKgU+dSPR2vRLzLojCgS0+743cRfx0h2V3XJ8D4otRAm
 5
X-Gm-Gg: ASbGncsK4r/7+/CBpnoRVKAK4nE2mATeO+gX5dYOL36S7kcQnGWOPo9HJXLF3xw6S4d
 ghFC9bsnzT3NMrkd6k/GPIKzisTVmdv3kHc4n+4eWLo/ikqENP+bxTjAVIe/blW/ynMDzhMRwPq
 JGoI/HJs+EGG7BK0gTjqrCg+sDMfvk1AzVR8fl45DanhJZokXkwfWNn+ovVYEwDGUbV5LhPRbYJ
 ZuSi5dmG6Uer7zWLh73ZTngjQEuPZWiCN5dObWE7Kao/qZDLED3BA4kcXme2zVscOMVlGVcAo3s
 /iTgdvpRjUjM/RxIhnq1kFPrj4R/F3cI6BTbxps/JoGZiMR9C9rtA/ME3xi9Ugq3CduTa6DhcPJ
 k710l
X-Google-Smtp-Source: AGHT+IFxgoZcOHqkMw5jyeGAun9UQQd/OB9m7bc7xXEg/wbpzZDjeRz+YUYR5lXzJ6rWAbxl8Ell8g==
X-Received: by 2002:a5d:5f45:0:b0:385:e4a7:def9 with SMTP id
 ffacd0b85a97d-385fd532811mr5642326f8f.50.1733341219383; 
 Wed, 04 Dec 2024 11:40:19 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385d7f103e0sm17454912f8f.19.2024.12.04.11.40.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Dec 2024 11:40:18 -0800 (PST)
Message-ID: <b1ad8feb-56aa-49d0-a1d3-4e7941f6ce53@mind.be>
Date: Wed, 4 Dec 2024 20:40:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patricia Holden <pholden@nklabs.com>, buildroot@buildroot.org
References: <CAJ6EmCfeCT6uAJ-F9x4+MmWbiik2Jp162oWDiinb7urth5eO-A@mail.gmail.com>
Content-Language: en-GB
In-Reply-To: <CAJ6EmCfeCT6uAJ-F9x4+MmWbiik2Jp162oWDiinb7urth5eO-A@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1733341220; x=1733946020; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kAGenpAXCUBGDTRen8cLyhsipFSg3OUFcbMUBAwK8YQ=;
 b=Avu4IJe/JxXLTXBmSq/hyd4ouI8LZKUVUsjC5s4npFf0MYfZaM/V4+U4EDfQmJXL3W
 b+E0ePELCEKekc9hkNDQ7ZJBTgduARAkXtYjj+IKRhRlVb5EMF+6CJdp8mXAuBomff0g
 wSNwe3+y8324rBBd0gOVvaxsXoFpPLW/O1uc5+Gv5Dxux1q/rjmRJRnjB+Z8XBi6W4Dp
 oabphmxEdEHglxwaMyqq6XvLXcI0CflY2wiwPa5m8nWLn4RUU5TyK7Kw++Mn16NA/Zzt
 GXBn5lC3gSCA3qaLoNATiDG7W6CJ0YAfWCJI1nSf39pOIRvuD4m7aumdglAcr9KzDK9Z
 5E/Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Avu4IJe/
Subject: Re: [Buildroot] python-gevent package failing for me
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyMC8xMS8yMDI0IDIyOjI0LCBQYXRyaWNpYSBIb2xkZW4gd3JvdGU6Cj4gSSdtIHdvcmtp
bmcgd2l0aCB0aGUgbGF0ZXN0IGRyb3AsIDIwMjQuMTEtcmMxLsKgIEkgbmVlZCB0byBoYXZlIHB5
dGhvbi1nZXZlbnRzIAo+IHBhY2thZ2Ugc28gSSBhZGRlZCB0aGUgZm9sbG93aW5nOgo+IAo+IENv
bmZpZy5pbjoKPiAKPiBjb25maWcgQlIyX1BBQ0tBR0VfUFlUSE9OX0dFVkVOVAo+IGJvb2wgInB5
dGhvbi1nZXZlbnQiCj4gc2VsZWN0IEJSMl9QQUNLQUdFX1BZVEhPTl9HUkVFTkxFVAo+IGhlbHAK
PiAgwqBHRXZlbnQgZXZlbnQgbG9vcCBmb3IgcHl0aG9uMy4xMQo+IAo+IGh0dHBzOi8vcHlwaS5v
cmcvcHJvamVjdC9nZXZlbnQvIDxodHRwczovL3B5cGkub3JnL3Byb2plY3QvZ2V2ZW50Lz4KPiAK
PiBweXRob24tZ2V2ZW50cy5tayA8aHR0cDovL3B5dGhvbi1nZXZlbnRzLm1rPjoKPiAKPiAjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIwo+ICMKPiAjIHB5dGhvbi1nZXZlbnQKPiAjCj4gIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMKPiAKPiBQWVRIT05fR0VWRU5UX1ZFUlNJT04gPSAyNC4xMS4xCj4gUFlU
SE9OX0dFVkVOVF9TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2Vz
L2FiLzc1LyAKPiBhNTNmMWNiNzMyNDIwZjVlNWQ3OWIyNTYzZmMzNTA0ZDIyMTE1ZTdlY2ZlNzk2
NmU1Y2Y5YjM1ODJhZTcgPGh0dHBzOi8vIAo+IGZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2Fn
ZXMvYWIvNzUvIAo+IGE1M2YxY2I3MzI0MjBmNWU1ZDc5YjI1NjNmYzM1MDRkMjIxMTVlN2VjZmU3
OTY2ZTVjZjliMzU4MmFlNz4KPiBQWVRIT05fR0VWRU5UX1NPVVJDRSA9IGdldmVudC0kKFBZVEhP
Tl9HRVZFTlRfVkVSU0lPTikudGFyLmd6Cj4gUFlUSE9OX0dFVkVOVF9TRVRVUF9UWVBFID0gc2V0
dXB0b29scwo+IFBZVEhPTl9HRVZFTlRfTElDRU5TRSA9IE1JVAo+IFBZVEhPTl9HRVZFTlRfTElD
RU5TRV9GSUxFUyA9IExJQ0VOU0UKPiBQWVRIT05fR0VWRU5UX0VOViA9IEdFVkVOVFNFVFVQX0VN
QkVEX0xJQkVWPTAgR0VWRU5UU0VUVVBfRU1CRURfQ0FSRVM9MAo+IFBZVEhPTl9HRVZFTlRfREVQ
RU5ERU5DSUVTID0gbGliZXYgYy1hcmVzCj4gCj4gJChldmFsICQocHl0aG9uLXBhY2thZ2UpKQo+
IAo+IEkgYW0gZ2V0dGluZyB0aGUgZm9sbG93aW5nIGVycm9yIHdoZW4gYnVpbGRpbmcgd2l0aCB0
aGlzIHBhY2thZ2U6Cj4gCj4gCj4gRVJST1IgTWlzc2luZyBkZXBlbmRlbmNpZXM6Cj4gY2ZmaT49
MS4xNy4xOyBwbGF0Zm9ybV9weXRob25faW1wbGVtZW50YXRpb24gPT0gIkNQeXRob24iCj4gbWFr
ZVsxXTogKioqIFtwYWNrYWdlL3BrZy1nZW5lcmljLm1rOjI4OSA8aHR0cDovL3BrZy1nZW5lcmlj
Lm1rOjI4OT46IC9ob21lLyAKPiBwaG9sZGVuL1Byb2plY3RzL0JSMjAyNC0xMS9lZHZvdGVrLWVk
dm9jeWNsZXIzL2J1aWxkcm9vdC0yMDI0LjExLXJjMS9vdXRwdXQvIAo+IGJ1aWxkL3B5dGhvbi1n
ZXZlbnQtMjQuMTEuMS8uc3RhbXBfYnVpbHRdIEVycm9yIDEKPiBtYWtlOiAqKiogW01ha2VmaWxl
OjgzOiBfYWxsXSBFcnJvciAyCgogIEhhdmUgeW91IHRyaWVkIGFkZGluZyBweXRob24tY2ZmaSB0
byBQWVRIT05fR0VWRU5UX0RFUEVOREVOQ0lFUz8KCiAgUmVnYXJkcywKICBBcm5vdXQKCj4gCj4g
VGhlcmUgaXMgYSBjb21tZW50IGluIHRoZSBweXRob24tZ2V2ZW50cyBkZXNjcmlwdGlvbiBhYm91
dCB0aGlzIGVycm9yOgo+IAo+ICAgKiBJZiB5b3Ugc2VlIHxWYWx1ZUVycm9yOiAoIkV4cGVjdGVk
ICcsJyBvciBlbmQtb2YtbGlzdCBpbiIsICJjZmZpID49IDEuMTEuNSA7Cj4gICAgIHN5c19wbGF0
Zm9ybSA9PSAnd2luMzInIGFuZCBwbGF0Zm9ybV9weXRob25faW1wbGVtZW50YXRpb24gPT0gJ0NQ
eXRob24nIiwKPiAgICAgJ2F0JywgIiA7IHN5c19wbGF0Zm9ybSA9PSAnd2luMzInIGFuZCBwbGF0
Zm9ybV9weXRob25faW1wbGVtZW50YXRpb24gPT0KPiAgICAgJ0NQeXRob24nIil8LCB0aGUgdmVy
c2lvbiBvZiBzZXR1cHRvb2xzIGlzIHRvbyBvbGQuIEluc3RhbGwgYSBtb3JlIHJlY2VudAo+ICAg
ICB2ZXJzaW9uIG9mIHNldHVwdG9vbHMuCj4gCj4gCj4gCj4gSGF2ZSB5b3UgcnVuIGludG8gdGhp
cyBwcm9ibGVtP8KgIERvIHlvdSBoYXZlIGEgcGF0Y2ggZm9yIHB5dGhvbi1nZXZlbnRzIGZvciAK
PiBCUjIwMjQuMTEtcmMxPwo+IAo+IFRoYW5rcyEKPiAKPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
