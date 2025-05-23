Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D613C54ED0
	for <buildroot@archiver.kernel.org>; Fri, 23 May 2025 20:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 109B383BBC;
	Fri, 23 May 2025 20:42:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0-Aqe-4rS9pU; Fri, 23 May 2025 20:42:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C329283BA5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C329283BA5;
	Fri, 23 May 2025 20:42:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AE931119
 for <buildroot@buildroot.org>; Fri, 23 May 2025 20:42:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A07A4405B9
 for <buildroot@buildroot.org>; Fri, 23 May 2025 20:42:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 04DkKShQj0HI for <buildroot@buildroot.org>;
 Fri, 23 May 2025 20:42:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5E92C40582
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E92C40582
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5E92C40582
 for <buildroot@buildroot.org>; Fri, 23 May 2025 20:42:20 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-442eb5d143eso1681095e9.0
 for <buildroot@buildroot.org>; Fri, 23 May 2025 13:42:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748032938; x=1748637738;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R5GmoIffaiOmN6+NDSBm5ctTkyUUMLHKS7OwY18lzUg=;
 b=kR12fwJ9YZBCOAQHAuVGpSaQ9OgRSjmiYzzxIN8BIidqqyriaaI9edJDTeTSksmG9v
 F/93e2B0rbzJmrx+aqnqp+Q120l92NxRjaBkRmk+6NqfHXFnnRVTYYWLd4+mTzk1s2Tj
 zwamHG3erDlloLMRgQvsrosccRjCcY5RQ7bHAFU1Fbvp8jrDN3CKvINqMxqJHNkJ6qYh
 Apa8+oWax5i7fQ3TvoZ9onPH3Us6KklDD2DRRAG/jDrd1ycH3qncVBBC5jyV/W61EJ0A
 Md7wW5BvcvsOX1+lNnFjPzhr0OY0LRTsHCGgh8/Y9ZNYTPi57vnII6vEDZr8Xe2oJS34
 Brtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVAnGdwcacvbLihaiqCx0cvnm+QM1wp4ZHwPTObIHWTvZ9knPj0DM514Zq2jBSkf6pxv01QZ5det8=@buildroot.org
X-Gm-Message-State: AOJu0YytwXtw4KYHd6LczOGcre4OIqoL0TJ4GwjCFFlBAwrrGdnDeras
 MOjLvoDUclnde6o2J0TOYnIvdZG/LZWXNSTr4o6LAZDCmPU+BYNPeGEzNNAiLVHQxyQ=
X-Gm-Gg: ASbGncsmPXKDlYSTTuwV2C+mZfge0Mta4siVQXwC4SYzAKEesmnwSPtT8DxB/orIKX3
 GxTB0ldFRZ8UGoILSfQBgYox+xH8R1vSfmR3k7gb4ezcqsJRnFYKzmId11VFPgG/x8kufm/BheX
 9cJftYKkPyEdum8E8ap2DazBDbZMvRSJs12m4gwv7GWETd2jPUbIXPneQUE1CSvu1WcnV8XRx+r
 w5jiMsd6JR9w5xtADkCQY1GTpiTqcxWSXTc6+GldZbMCpJ8XrxYX5nmJrEKniaFYzJZp5hMF7RN
 2OTo9bfcMFyzoi6/sfFFmIge1jpCsxoaNKJWLjuE/sYmLT4LEv+SmJiuxDHdvAWwyBF6IktBs8R
 2QcpjnTrbBj/tSqYH7B0veAqsth3fx65Zq4hji2X3nYEKP29zf9r88PJyqqy3sXkJ3RzDvTCr1G
 8owkhhf0osH7A9zIA3d0tesNo4
X-Google-Smtp-Source: AGHT+IEejYt5u/WzsKuPXxmuYm0/eiuFJ6fVn0zEcgoo3YhnFHNvneyS1LlcCdXjMUOiVLY+NPLEvw==
X-Received: by 2002:a05:600c:4e0a:b0:43c:f895:cb4e with SMTP id
 5b1f17b1804b1-44c91dd158bmr4426045e9.17.1748032938513; 
 Fri, 23 May 2025 13:42:18 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:83fd:2592:1c9c:7a4f?
 (2a01cb05949d580083fd25921c9c7a4f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:83fd:2592:1c9c:7a4f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4c5360a13sm2221252f8f.96.2025.05.23.13.42.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 May 2025 13:42:18 -0700 (PDT)
Message-ID: <193c4536-e25a-4ca5-a544-bbd5ade9f9ba@smile.fr>
Date: Fri, 23 May 2025 22:42:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@laposte.net>,
 buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250523174313.7056-1-vincent.stehle@laposte.net>
 <20250523174313.7056-2-vincent.stehle@laposte.net>
Content-Language: fr
In-Reply-To: <20250523174313.7056-2-vincent.stehle@laposte.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1748032938; x=1748637738; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=R5GmoIffaiOmN6+NDSBm5ctTkyUUMLHKS7OwY18lzUg=;
 b=yyBoYCfXzeRIixmMvLvOp1fC9ZDI6bMkVW5cJp9qCNpubgmb6tWLk/sDRXONQeIpjq
 +17gpVi5Aqdk1YTr9PP92ei6FtBCL3Xdbz8IknYRtWFNe4GxnFXmUxOxvzHuO5k7ktcg
 lWFRIkQFZkx53VcpDKKFFhWSJ0dfLSRCt/fcE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=yyBoYCfX
Subject: Re: [Buildroot] [PATCH 1/5] hppa: Add new architecture
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

SGVsbG8gVmluY2VudCwgQWxsLAoKTGUgMjMvMDUvMjAyNSDDoCAxOTo0MywgVmluY2VudCBTdGVo
bMOpIHZpYSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKPiBBZGQgc3VwcG9ydCBmb3IgdGhlIFByZWNp
c2lvbiBBcmNoaXRlY3R1cmUgKGEuay5hLiBQQS1SSVNDKSwKPiBhIDMyLWJpdCBhcmNoaXRlY3R1
cmUgZGV2ZWxvcGVkIGJ5IEhld2xldHQgUGFja2FyZC4KPiAKPiBXaGlsZSBhdCBpdCwgYWRkIG15
c2VsZiBpbiBERVZFTE9QRVJTLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFZpbmNlbnQgU3RlaGzDqSA8
dmluY2VudC5zdGVobGVAbGFwb3N0ZS5uZXQ+Cj4gLS0tCj4gIERFVkVMT1BFUlMgICAgICAgICAg
fCAgMiArKwo+ICBhcmNoL0NvbmZpZy5pbiAgICAgIHwgMTIgKysrKysrKysrKysrCj4gIGFyY2gv
Q29uZmlnLmluLmhwcGEgfCAyMiArKysrKysrKysrKysrKysrKysrKysrCj4gIGFyY2gvYXJjaC5t
ay5ocHBhICAgfCAxMyArKysrKysrKysrKysrCj4gIDQgZmlsZXMgY2hhbmdlZCwgNDkgaW5zZXJ0
aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9Db25maWcuaW4uaHBwYQo+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgYXJjaC9hcmNoLm1rLmhwcGEKPiAKPiBkaWZmIC0tZ2l0IGEvREVWRUxP
UEVSUyBiL0RFVkVMT1BFUlMKPiBpbmRleCBkNDcxYjlhYjZmLi40N2YzZTAzMGU1IDEwMDY0NAo+
IC0tLSBhL0RFVkVMT1BFUlMKPiArKysgYi9ERVZFTE9QRVJTCj4gQEAgLTMzODEsNiArMzM4MSw4
IEBAIEY6CXBhY2thZ2UvZWRrMi1ub24tb3NpLwo+ICBGOglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMv
Ym9vdC90ZXN0X2VkazIucHkKPiAgCj4gIE46CVZpbmNlbnQgU3RlaGzDqSA8dmluY2VudC5zdGVo
bGVAbGFwb3N0ZS5uZXQ+Cj4gK0Y6CWFyY2gvQ29uZmlnLmluLmhwcGEKPiArRjoJYXJjaC9hcmNo
Lm1rLmhwcGEKPiAgRjoJYm9hcmQvYXJtL2ZvdW5kYXRpb24tdjgvCj4gIEY6CWJvYXJkL2JhbmFu
YXBpL2JhbmFuYXBpLW0yLXplcm8vCj4gIEY6CWNvbmZpZ3MvYXJtX2ZvdW5kYXRpb252OF9kZWZj
b25maWcKPiBkaWZmIC0tZ2l0IGEvYXJjaC9Db25maWcuaW4gYi9hcmNoL0NvbmZpZy5pbgo+IGlu
ZGV4IDZiNTRjNjVkZjkuLmI5NGFlNGRlZjYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9Db25maWcuaW4K
PiArKysgYi9hcmNoL0NvbmZpZy5pbgo+IEBAIC03Myw2ICs3MywxNCBAQCBjb25maWcgQlIyX2Fh
cmNoNjRfYmUKPiAgCSAgaHR0cDovL3d3dy5hcm0uY29tL3Byb2R1Y3RzL3Byb2Nlc3NvcnMvaW5z
dHJ1Y3Rpb24tc2V0LWFyY2hpdGVjdHVyZXMvYXJtdjgtYXJjaGl0ZWN0dXJlLnBocAo+ICAJICBo
dHRwOi8vZW4ud2lraXBlZGlhLm9yZy93aWtpL0FSTQo+ICAKPiArY29uZmlnIEJSMl9ocHBhCj4g
Kwlib29sICJIUFBBIgo+ICsJc2VsZWN0IEJSMl9VU0VfTU1VCgpTZWxlY3QgQlIyX0FSQ0hfSEFT
X05PX1RPT0xDSEFJTl9CVUlMRFJPT1Qgc2luY2Ugb3VyIGludGVybmFsCnRvb2xjaGFpbiBiYWNr
ZW5kIGRvbid0IHN1cHBvcnQgeWV0IHRoaXMgYXJjaGl0ZWN0dXJlLgoKPiArCWhlbHAKPiArCSAg
UHJlY2lzaW9uIEFyY2hpdGVjdHVyZSAoYS5rLmEuIFBBLVJJU0MpIGlzIGEgMzItYml0Cj4gKwkg
IGFyY2hpdGVjdHVyZSBkZXZlbG9wZWQgYnkgSGV3bGV0dCBQYWNrYXJkLgo+ICsJICBodHRwczov
L2VuLndpa2lwZWRpYS5vcmcvd2lraS9QQS1SSVNDCj4gKwo+ICBjb25maWcgQlIyX2kzODYKPiAg
CWJvb2wgImkzODYiCj4gIAlzZWxlY3QgQlIyX1VTRV9NTVUKPiBAQCAtMzczLDYgKzM4MSwxMCBA
QCBpZiBCUjJfYXJtIHx8IEJSMl9hcm1lYiB8fCBCUjJfYWFyY2g2NCB8fCBCUjJfYWFyY2g2NF9i
ZQo+ICBzb3VyY2UgImFyY2gvQ29uZmlnLmluLmFybSIKPiAgZW5kaWYKPiAgCj4gK2lmIEJSMl9o
cHBhCj4gK3NvdXJjZSAiYXJjaC9Db25maWcuaW4uaHBwYSIKPiArZW5kaWYKPiArCj4gIGlmIEJS
Ml9tNjhrCj4gIHNvdXJjZSAiYXJjaC9Db25maWcuaW4ubTY4ayIKPiAgZW5kaWYKPiBkaWZmIC0t
Z2l0IGEvYXJjaC9Db25maWcuaW4uaHBwYSBiL2FyY2gvQ29uZmlnLmluLmhwcGEKPiBuZXcgZmls
ZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjc4NTlhOGEyM2EKPiAtLS0gL2Rldi9u
dWxsCj4gKysrIGIvYXJjaC9Db25maWcuaW4uaHBwYQo+IEBAIC0wLDAgKzEsMjIgQEAKPiArY2hv
aWNlCj4gKwlwcm9tcHQgIlRhcmdldCBBcmNoaXRlY3R1cmUgVHlwZSIKPiArCWhlbHAKPiArCSAg
QXJjaGl0ZWN0dXJlIHR5cGUgKG9yIHZlcnNpb24pIHRvIHVzZS4KPiArCj4gK2NvbmZpZyBCUjJf
cGFyaXNjMTAKPiArCWJvb2wgIlBBLVJJU0MgMS4wIgoKSXMgdGhpcyBvbmUgcmVhbGx5IHN1cHBv
cnRlZCBieSBxZW11PwoKVGhlIHFlbXUgZGVmY29uZmlnIGFkZGVkIGluIHRoZSBlbmQgb2YgdGhl
IHNlcmllcyAocWVtdV9ocHBhX2IxNjBsX2RlZmNvbmZpZykKb25seSB0ZXN0ICJQQS1SSVNDIDEu
MSIuCgo+ICtjb25maWcgQlIyX3BhcmlzYzExCj4gKwlib29sICJQQS1SSVNDIDEuMSIKPiArZW5k
Y2hvaWNlCj4gKwo+ICtjb25maWcgQlIyX0FSQ0gKPiArCWRlZmF1bHQgImhwcGEiCj4gKwo+ICtj
b25maWcgQlIyX05PUk1BTElaRURfQVJDSAo+ICsJZGVmYXVsdCAicGFyaXNjIgo+ICsKPiArY29u
ZmlnIEJSMl9FTkRJQU4KPiArCWRlZmF1bHQgIkxJVFRMRSIKCkhQUEEgaXMgYmlnLWVuZGlhbi4K
CiJIUFBBIG5vdGFibHkgaGFzIGFuIHVudXN1YWwgc3RhY2sgZGlyZWN0aW9uIChpdCBncm93cyB1
cHdhcmRzISkiCgpodHRwczovL3dpa2kuZ2VudG9vLm9yZy93aWtpL1Byb2plY3Q6SFBQQQoKQmVz
dCByZWdhcmRzLApSb21haW4KCgo+ICsKPiArY29uZmlnIEJSMl9SRUFERUxGX0FSQ0hfTkFNRQo+
ICsJZGVmYXVsdCAiSFBQQSIKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcmNoLm1rLmhwcGEgYi9hcmNo
L2FyY2gubWsuaHBwYQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4u
OWQyMmU0MzcxZgo+IC0tLSAvZGV2L251bGwKPiArKysgYi9hcmNoL2FyY2gubWsuaHBwYQo+IEBA
IC0wLDAgKzEsMTMgQEAKPiArIwo+ICsjIENvbmZpZ3VyZSB0aGUgR0NDX1RBUkdFVF9BUkNIIHZh
cmlhYmxlLgo+ICsjCj4gKwo+ICtpZmVxICgkKEJSMl9ocHBhKSx5KQo+ICsKPiAraWZlcSAoJChC
UjJfcGFyaXNjMTApLHkpCj4gK0dDQ19UQVJHRVRfQVJDSCA6PSAxLjAKPiArZWxzZSBpZmVxICgk
KEJSMl9wYXJpc2MxMSkseSkKPiArR0NDX1RBUkdFVF9BUkNIIDo9IDEuMQo+ICtlbmRpZgo+ICsK
PiArZW5kaWYKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
