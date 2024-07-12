Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF02C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 19:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4590847B1;
	Fri, 12 Jul 2024 19:37:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rSe_0sc2yMwi; Fri, 12 Jul 2024 19:37:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9ECEB84792
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9ECEB84792;
	Fri, 12 Jul 2024 19:37:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 08DE41BF279
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:37:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 020CF4011D
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:37:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OvxMiqTDwVCl for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 19:37:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5796B4000B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5796B4000B
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5796B4000B
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 19:37:45 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4266fd395eeso16163765e9.3
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 12:37:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720813063; x=1721417863;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H+dYZFLHkRAu2EURoH28xKLL+j9cAgfAlX9fWK6mK0s=;
 b=tyJBHdu6jojJJ2Tli1Z9Ak5xS3WDxcjMlOpP2fwIPggt81XLLBOIxu2C1/HBGG9hzC
 J/69hs2UfHrN4jIQWR9iBahSTLr8Y++HQLrwIrZevrm6z1YhCrnS1EEq7HODKGxV0NZw
 6wpu4zDSqHDWFHDhsJJbkHmvZzl6GwECUxyFi2TLtMV9NTjMakZM23AFrJ9OQql9PYpW
 YmGzXoh6zklmNByNhf3+jqamcRDbLgwovuWs00PII79damDwJsi5GofWjTn27Dp+1HdM
 0h0bhDtCcLX/wwFL7azy67r6h+NEopFIta09UnbRr+dQ/B3rLPr1o2ObejdkSSAa37lD
 1VQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVa6M0C3adHaiBafuBZ7zQhmMOWRkruXlHcFq27r0jLtbdKzbsWxAviEFJH+Mqmr32jd4tgTdkMR8okohKxOJHeOz+3lTV5lA==
X-Gm-Message-State: AOJu0Yx85iaINPxY1S48HbvypkKQ/HeZlqBP82NYedg+mhI6NFojsteR
 39Q4/uurKRIccbMfeaI5qRxlkdCpi7WmaN8pSk/3KRSD622MfBaTXNc6D38tjYjrBCGg3iQ6XJN
 q
X-Google-Smtp-Source: AGHT+IHNb27fp+UClihNTtlOTAZZKR8baaW4shHMRQ4vwua+VkYDlh0y/BcpkSk5F786rxJkrtZuIA==
X-Received: by 2002:adf:a79a:0:b0:367:951e:595c with SMTP id
 ffacd0b85a97d-367cea7386dmr8426804f8f.19.1720813063314; 
 Fri, 12 Jul 2024 12:37:43 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:f9c8:f443:ffd:1bed?
 (2a01cb05949d5800f9c8f4430ffd1bed.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:f9c8:f443:ffd:1bed])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cdfa0666sm10860810f8f.73.2024.07.12.12.37.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 12:37:43 -0700 (PDT)
Message-ID: <69f8bf8d-7bf9-4941-987e-9fc59ba40a7a@smile.fr>
Date: Fri, 12 Jul 2024 21:37:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Rush, David" <david.rush2@hpe.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <DM4PR84MB1664512ACED9F33EDD096ADEB6DA2@DM4PR84MB1664.NAMPRD84.PROD.OUTLOOK.COM>
Content-Language: en-US
In-Reply-To: <DM4PR84MB1664512ACED9F33EDD096ADEB6DA2@DM4PR84MB1664.NAMPRD84.PROD.OUTLOOK.COM>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720813063; x=1721417863; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=H+dYZFLHkRAu2EURoH28xKLL+j9cAgfAlX9fWK6mK0s=;
 b=TQ3swUG9kjSNMkK7xk7tSDvoiT9a7/4OmuMsj8zCHHaU2Hd7IzU/4HAsK9qzWZQHy5
 sGYMR53+ePe//ijFaXWMQtXnZdc8dtU+G/eDmKqsZsfgmZ2UeKuUgIaXxnxjNkEiHPWk
 nUwVXmmUQDdRYOJ8nt8APmkiKzJKkrShbtNaw=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=TQ3swUG9
Subject: Re: [Buildroot] bare metal toolchain tuning options
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRGF2aWQsIEFsbCwKCkxlIDA4LzA3LzIwMjQgw6AgMTk6NTgsIFJ1c2gsIERhdmlkIGEg
w6ljcml0wqA6Cj4gSGksCj4gCj4gSGF2aW5nIHRoZSBvcHRpb24gdG8gYnVpbGQgYSBiYXJlIG1l
dGFsIHRvb2xjaGFpbiBhbG9uZ3NpZGUgdGhlIExpbnV4IGJpdHMgaXMgZmFudGFzdGljLiBBcyB0
aGluZ3MgYXJlIG5vdyBvbmx5IHRoZSBhcmNoIHR1cGxlIGlzIGNvbmZpZ3VyYWJsZSB0aG91Z2gg
dGhlIGRlZmNvbmZpZywgd2hpY2ggbWF5IG5vdCBhbHdheXMgZ2V0IHRvIHRoZSBkZXNpcmVkIHJl
c3VsdC4gSGFzIGFueW9uZSBsb29rZWQgYXQgYWRkaW5nIGNvbmZpZ3VyZSBvcHRpb25zIGZvciB0
dW5pbmcgdGhlIGJhcmUgbWV0YWwgdG9vbGNoYWluIHBhY2thZ2U/IEZvciBleGFtcGxlLCB3aGVu
IGV4cGVyaW1lbnRpbmcgd2l0aCBhbiBhcm0gY29ydGV4IG00IG1pY3JvY29udHJvbGxlciB3aXRo
IGEgJ25hbm8nIG5ld2xpYiBjb25maWd1cmF0aW9uLCB0aGUgZm9sbG93aW5nIGNoYW5nZXMgdG8g
Z2NjIGFuZCBuZXdsaWIncyBjb25maWd1cmUgY29tbWFuZCBnb3QgbWUgYSB3b3JraW5nIHRvb2xj
aGFpbjoKClRoZSBCUjJfVE9PTENIQUlOX0JBUkVfTUVUQUxfQlVJTERST09UIG9wdGlvbiBpcyBz
b21ldGhpbmcgbmV3IGluIEJ1aWxkcm9vdAooYWRkZWQgaW4gSmFudWFyeSAyMDI0KSBhbmQgaW5p
dGlhbGx5IGludGVuZGVkIHRvIGJ1aWxkIHp5bnFtcC1maXJtd2FyZSAoeGlsaW54KQpyZXF1aXJl
ZCB0byBib290IHRoZSBib2FyZC4KCkkgZG9uJ3QgdGhpbmsgaXQncyBtZWFudCBmb3IgYW5vdGhl
ciBwdXJwb3NlLiBGb3IgZXhhbXBsZSwgYnVpbGRpbmcgYSByZW1vdGVjb3JlCm00IGJhc2VkIGZp
cm13YXJlIGV0Yy4uLgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+IC0tLSBhL3BhY2thZ2Uv
Z2NjLWJhcmUtbWV0YWwvZ2NjLWJhcmUtbWV0YWwubWsKPiArKysgYi9wYWNrYWdlL2djYy1iYXJl
LW1ldGFsL2djYy1iYXJlLW1ldGFsLm1rCj4gQEAgLTU3LDYgKzU3LDEwIEBAIEhPU1RfR0NDX0JB
UkVfTUVUQUxfQ09ORl9PUFRTID0gXAo+ICAgICAgICAgLS13aXRoLW1wZnI9JChIT1NUX0RJUikg
XAo+ICAgICAgICAgLS13aXRoLWlzbD0kKEhPU1RfRElSKSBcCj4gICAgICAgICAtLXdpdGgtc3lz
cm9vdD0kKFRPT0xDSEFJTl9CQVJFX01FVEFMX0JVSUxEUk9PVF9TWVNST09UKSBcCj4gKyAgICAg
ICAtLXdpdGgtY3B1PWNvcnRleC1tNCBcCj4gKyAgICAgICAtLXdpdGgtZnB1PWZwdjQtc3AtZDE2
IFwKPiArICAgICAgIC0td2l0aC1tb2RlPXRodW1iIFwKPiArICAgICAgIC0td2l0aC1mbG9hdD1o
YXJkIFwKPiAgICAgICAgIEFSX0ZPUl9UQVJHRVQ9JChIT1NUX0RJUikvYmluLyQoVE9PTENIQUlO
X0JBUkVfTUVUQUxfQlVJTERST09UX0FSQ0hfVFVQTEUpLWFyIFwKPiAgICAgICAgIFJBTkxJQl9G
T1JfVEFSR0VUPSQoSE9TVF9ESVIpL2Jpbi8kKFRPT0xDSEFJTl9CQVJFX01FVEFMX0JVSUxEUk9P
VF9BUkNIX1RVUExFKS1yYW5saWIKPiAgCj4gCj4gLS0tIGEvcGFja2FnZS9uZXdsaWItYmFyZS1t
ZXRhbC9uZXdsaWItYmFyZS1tZXRhbC5tawo+ICsrKyBiL3BhY2thZ2UvbmV3bGliLWJhcmUtbWV0
YWwvbmV3bGliLWJhcmUtbWV0YWwubWsKPiBAQCAtMjgsMTEgKzI4LDE5IEBAIGRlZmluZSBORVdM
SUJfQkFSRV9NRVRBTF9DT05GSUdVUkVfQ01EUwo+ICAgICAgICAgICAgICAgICAuL2NvbmZpZ3Vy
ZSBcCj4gICAgICAgICAgICAgICAgICAgICAgICAgLS10YXJnZXQ9JChUT09MQ0hBSU5fQkFSRV9N
RVRBTF9CVUlMRFJPT1RfQVJDSF9UVVBMRSkgXAo+ICAgICAgICAgICAgICAgICAgICAgICAgIC0t
cHJlZml4PS91c3IgXAo+IC0gICAgICAgICAgICAgICAgICAgICAgIC0tZW5hYmxlLW5ld2xpYi1p
by1jOTktZm9ybWF0cyBcCj4gLSAgICAgICAgICAgICAgICAgICAgICAgLS1lbmFibGUtbmV3bGli
LWlvLWxvbmctbG9uZyBcCj4gLSAgICAgICAgICAgICAgICAgICAgICAgLS1lbmFibGUtbmV3bGli
LWlvLWZsb2F0IFwKPiAtICAgICAgICAgICAgICAgICAgICAgICAtLWVuYWJsZS1uZXdsaWItaW8t
bG9uZy1kb3VibGUgXAo+ICAgICAgICAgICAgICAgICAgICAgICAgIC0tZGlzYWJsZS1tdWx0aWxp
YiBcCj4gKyAgICAgICAgICAgICAgICAgICAgICAgLS1kaXNhYmxlLW5ld2xpYi1mc2Vlay1vcHRp
bWl6YXRpb24gXAo+ICsgICAgICAgICAgICAgICAgICAgICAgIC0tZGlzYWJsZS1uZXdsaWItZnZ3
cml0ZS1pbi1zdHJlYW1pbyBcCj4gKyAgICAgICAgICAgICAgICAgICAgICAgLS1kaXNhYmxlLW5l
d2xpYi1zdXBwbGllZC1zeXNjYWxscyBcCj4gKyAgICAgICAgICAgICAgICAgICAgICAgLS1kaXNh
YmxlLW5ld2xpYi11bmJ1Zi1zdHJlYW0tb3B0IFwKPiArICAgICAgICAgICAgICAgICAgICAgICAt
LWRpc2FibGUtbmV3bGliLXdpZGUtb3JpZW50IFwKPiArICAgICAgICAgICAgICAgICAgICAgICAt
LWVuYWJsZS1saXRlLWV4aXQgXAo+ICsgICAgICAgICAgICAgICAgICAgICAgIC0tZW5hYmxlLW5l
d2xpYi1nbG9iYWwtYXRleGl0IFwKPiArICAgICAgICAgICAgICAgICAgICAgICAtLWVuYWJsZS1u
ZXdsaWItbmFuby1mb3JtYXR0ZWQtaW8gXAo+ICsgICAgICAgICAgICAgICAgICAgICAgIC0tZW5h
YmxlLW5ld2xpYi1uYW5vLW1hbGxvYyBcCj4gKyAgICAgICAgICAgICAgICAgICAgICAgLS1lbmFi
bGUtbmV3bGliLXJlZW50LWNoZWNrLXZlcmlmeSBcCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
LS1lbmFibGUtbmV3bGliLXJlZW50LXNtYWxsIFwKPiArICAgICAgICAgICAgICAgICAgICAgICAt
LWVuYWJsZS1uZXdsaWItcmV0YXJnZXRhYmxlLWxvY2tpbmcgXAo+ICAgICAgICAgKQo+ICBlbmRl
Zgo+IAo+IAo+IEknbSBub3QgbG9va2luZyBmb3IgYW55b25lIHRvIGRvIHRoaXMgZm9yIG1lLCBq
dXN0IHdvbmRlcmluZyBpZiBhbnlvbmUgaXMgYWN0aXZlbHkgd29ya2luZyBpbiB0aGlzIGFyZWEu
IElmIG5vdCwgYXJlIHRoZXJlIGFueSBzdWdnZXN0aW9ucyBvciBhIHByZWZlcnJlZCBzdHJhdGVn
eSBmb3IgZGVhbGluZyB3aXRoIGEgcG90ZW50aWFsbHkgbGFyZ2UgbnVtYmVyIG9mIGNvbmZpZ3Vy
ZSBvcHRpb25zIGxpa2UgdGhpcz8KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
