Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E77FDF436A0
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 13:23:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9415460DD5;
	Fri, 17 Apr 2026 13:23:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aTeCLL5Z4dH2; Fri, 17 Apr 2026 13:23:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A91C260DD9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776432193;
	bh=qHjSakC1Qn/Qo9h/hsIIFIkT65QKLhj9E5PJEcDMoVQ=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=g7ie5k5q71kgTg1FEOqaSnMQMmAuWnJ3ZweIMnXuE7Q7KlQlOv5fFFr+PCNz0SNFA
	 e9kjb8Sa6C2/Z94JoONZnNjVp2o5ix/0RAKVtFFs95LkXTrAtTozak7079TIyi2aMU
	 13FVcx0+NwRoFE2LpS+q1UsK9xM5F+Jyr9Z6hfrxhrdFEuPnq9MSzcV4eQBRNeYzLX
	 oItQ98FSPb6qqEr+7CXD372ccZlO70Sy9oaVPmNj9luIqQdFM3tdq7ob+Xlj3kgI1r
	 NrgPpb/9efxuBEBt1/sms22Ev/44gawFWqEZ9q026+cRoR2DeodnO+ldJVK6nV8Jmw
	 NXZ6jWVMqcH/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A91C260DD9;
	Fri, 17 Apr 2026 13:23:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 202F2270
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 13:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 024D28148A
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 13:23:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vv0m446kEgR0 for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 13:23:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 99E0281489
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99E0281489
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 99E0281489
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 13:23:10 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-488a88aeec9so10422385e9.2
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 06:23:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776432188; x=1777036988;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n5ys88ZICkmknjRuHvKT2muXvCaQR+/Xcy5gS/7pFoM=;
 b=IbQrhkwL4QEa04TaMS/RLDNB73kCPiFi5FN6C9Zu1r1PUNXTNq3tyysgFIWupSKZvr
 yIHvt/2cZ2aXDJbiWcO/a2q8WiemSXLEr8+3Y984ppQ1K1v62IOiXZosaoN1qbxrhGCm
 /4YfcyS8L0hA0q4Wi/tGUZsHQYRPt/Lb311JVMSIjDp9681IYDLzRDNTkoI6sdSNk2+o
 7NzAqJEM+I4OezqTPTrprQcP2muHv8rybaW60drRnSDnGx59nIfI7j7Rn3rWITOa8jaU
 Il2gR/tO0HZFhvZKencVnbd0Rgv+52t+7U0CteG8bvAzSYt3baUWlu9LMvLnpQvcHWKs
 lU0A==
X-Forwarded-Encrypted: i=1;
 AFNElJ833nOwZ5DeNe7s6eYmp2Mx+qel64M1X6NYl1FK1J5FPgIrs20n72aMbOPOPS9diU8C+4RL4ZMCthI=@buildroot.org
X-Gm-Message-State: AOJu0Yxr4E7X3pDS83F1hNhun1snvjtTaw+2tc77/lbnKl/rPSCOnp7C
 kh3GHL3XcQg3o4SR86prEiM58hc3M0jiOdRPsNqrC43ei0SzqsvSv3JChblhD0M2AppNz8G5MUR
 +YxpoV+s=
X-Gm-Gg: AeBDiesza/z2wOMkuuDoq5nX3XyHknFrtYSUEBLKVcxIc2vAzicx1KNHlqTIV16WEPQ
 UshwX5ChQqDmU/fHz8bLX/hjr0raxf37dPoTEMNAU1rEQpWoTLfDOL9gd27cANjqFqlIAGYFGrX
 cU1dF8+Tw6a8qDePdxc0ht92R51FK+m+r0gXNbv14a7eBvbxAZe69N+uyZdKTBRburTfYYVOKkI
 qqnb/xqStctssPiBU4g5y3vK5ReEXqqFGW9tUwMx1gt7AVmx7ClM6peoeh5wnM6/gHpaTLm/AvC
 r5UAL9RI6ZS1XOUuXAfHaVZ+c0nw8eUjM4dwsxjA7JOFUZeomhil2wQ0ly4dVrPQQlFFx3c2CwA
 cJi26wEbYLTbBj98izfCbxNdadfetjytMlSG91uiU3J5oMQJkgnmdrfwqOKssJx4NJa84uhjdWc
 imX2awsw5sxT9JJOW1TGtnizFN+rieQqLd0hBS++l5VUpma08dw5tt9ybZ6WYze/IDvBdWl8IfU
 kHDKOQm06G7aNatEPn0jPaRDxHn
X-Received: by 2002:a05:600c:c092:b0:485:303b:c50a with SMTP id
 5b1f17b1804b1-488fb750c15mr30226985e9.13.1776432188261; 
 Fri, 17 Apr 2026 06:23:08 -0700 (PDT)
Received: from [10.5.90.77]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc0f8193sm42806825e9.1.2026.04.17.06.23.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Apr 2026 06:23:07 -0700 (PDT)
Message-ID: <138441fb-788c-4cc9-81dd-b5677b6d036f@smile.fr>
Date: Fri, 17 Apr 2026 15:23:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dowan Gullient <dowan.gullient@smile.fr>, buildroot@buildroot.org
References: <20260417085936.200528-1-dowan.gullient@smile.fr>
 <20260417085936.200528-18-dowan.gullient@smile.fr>
Content-Language: en-US
In-Reply-To: <20260417085936.200528-18-dowan.gullient@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1776432188; x=1777036988; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=n5ys88ZICkmknjRuHvKT2muXvCaQR+/Xcy5gS/7pFoM=;
 b=fsGwRdHAuRe4Eo6JtuqaYrabboQaNf5lEKXf16EKOLS8q/GWFGeiUEE8+wey7yTIOK
 WDKo7b2wzt76fDzwsmaBP2el6Y8NKi87Bq3IsoxCU7QWHfJACLy19Zvz5pJz1hQxtffy
 F7QRlTyPFLNWek+WayXZysB8EautrhBHF5E/8=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=fsGwRdHA
Subject: Re: [Buildroot] [PATCH v1 17/21] support/testing : test_openjdk :
 Bump kernel version to last LTS (6.18)
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
From: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Reply-To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRG93YW4sIEhpIEFsbCwKCk9uIDQvMTcvMjYgMTA6NTksIERvd2FuIEd1bGxpZW50IHZpYSBi
dWlsZHJvb3Qgd3JvdGU6Cj4gVGhpcyBjb21taXQgYnVtcHMgTGludXgga2VybmVsIHZlcnNpb24g
dG8gNi4xOC4yMSBpbiB0aGUgdGVzdCBpbmZyYXN0cnVjdHVyZQo+IHRvIGVuc3VyZSBjb21wYXRp
YmlsaXR5IHdpdGggdGhlIGxhdGVzdCB0b29sY2hhaW4gZmVhdHVyZXMuCj4KPiBUaGlzIGFsc28g
VXBkYXRlIHRoZSBPcGVuSkRLIHBhY2thZ2UgZnJvbSAyMS4wLjQrNyB0byAyMS4wLjkrOCB0byBm
aXggdGhlCj4gJ3Vuc2lnbmVkIGludCB1YWJzKGludCknIHdhcyBkZWNsYXJlZCAnZXh0ZXJuJyBh
bmQgbGF0ZXIgJ3N0YXRpYycgZXJyb3IgZHVyaW5nCj4gY29tcGlsYXRpb24sIHNlZTogaHR0cHM6
Ly9naXRodWIuY29tL29wZW5qZGsvamRrMjF1L2NvbW1pdC8zNDQ1Yjk5YmVkZmJhNjU5ZGE0OWQ3
MmEzOTk3OTcwMzk2OWNmYzkxCj4gYmFja3BvcnRlZCBmcm9tIGh0dHBzOi8vYnVncy5vcGVuamRr
Lm9yZy9icm93c2UvSkRLLTgzNTQ5NDEKPiBUaGlzIGVycm9yIHdhcyBkdWUgdG8gdGhlIHVzZSBv
ZiBhIG5ldyBnbGliYyB2ZXJzaW9uIHVzZWQgaW4gdGhlIHVwZGF0ZWQgdG9vbGNoYWluLgo+Cj4g
VXBkYXRlIHRoZSBoYXNoIGZpbGUgdG8gbWF0Y2ggdGhlIG5ldyB0YXJiYWxsLgoKTWF5YmUgc3Bs
aXR0aW5nIHRoaXMgaW50byB0d28gY29tbWl0cyB3b3VsZCBiZQoKZWFzaWVyIHRvIHJldmlldy4K
Cj4KPiBGaXggT3BlbkpESyB0ZXN0IGNvbmZpZ3VyYXRpb246Cj4gICAgICAtIEFkZCBCUjJfUEFD
S0FHRV9YT1JHNyBhbmQgQlIyX1BBQ0tBR0VfWExJQl9MSUJYMTEgdG8gc2F0aXNmeQo+ICAgICAg
ICAgIGJ1aWxkLXRpbWUgZGVwZW5kZW5jaWVzIGZvciB0aGUgbm9uLWhlYWRsZXNzIHZhcmlhbnQu
Cj4gICAgICAtIEVuYWJsZSBCUjJfUEFDS0FHRV9PUEVOSkRLX1gxMSB0byBlbnN1cmUgdGhlIHBh
Y2thZ2UKPiAgICAgICAgICBjb3JyZWN0bHkgZGV0ZWN0cyBYMTEgc3VwcG9ydCBkdXJpbmcgdGhl
IGNvbmZpZ3VyZSBzdGFnZS4KPiAgICAgIC0gRW5hYmxlIEJSMl9TSEFSRURfTElCUyBhcyBCUjJf
UEFDS0FHRV9YT1JHNyByZXF1aXJlcyB0byBkaXNhYmxlIHN0YXRpYyBsaWJyYXJpZXMuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBEb3dhbiBHdWxsaWVudCA8ZG93YW4uZ3VsbGllbnRAc21pbGUuZnI+Cj4g
LS0tCj4gICBwYWNrYWdlL29wZW5qZGsvb3Blbmpkay5oYXNoICAgICAgICAgICAgICAgICAgfCAy
ICstCj4gICBwYWNrYWdlL29wZW5qZGsvb3Blbmpkay5tayAgICAgICAgICAgICAgICAgICAgfCA0
ICsrLS0KPiAgIHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3Rfb3Blbmpkay5weSB8
IDYgKysrKystCj4gICAzIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkKPgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL29wZW5qZGsvb3Blbmpkay5oYXNoIGIvcGFj
a2FnZS9vcGVuamRrL29wZW5qZGsuaGFzaAo+IGluZGV4IDIwOTAwNGEyOTIuLmMwZDdmOWE5MDUg
MTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9vcGVuamRrL29wZW5qZGsuaGFzaAo+ICsrKyBiL3BhY2th
Z2Uvb3Blbmpkay9vcGVuamRrLmhhc2gKPiBAQCAtMSw0ICsxLDQgQEAKPiAgICMgTG9jYWxseSBj
b21wdXRlZAo+IC1zaGEyNTYgIGI4YjM3ZmE2ZmNjMjg0ZDkxZTc0NThjNzAzY2E0Yzg5M2ExZGQ1
YTZlMGY2YjllMTk4ZTdkMTNjZDhlZmQyNGQgIG9wZW5qZGstMjEuMC40KzcudGFyLmd6Cj4gK3No
YTI1NiAgMWNkMzBiNjQ1MTA0YmJiZmZmMmJhZmM2ZTZjMjc2OTRhOTk5YjRmYmU4YTllOWEyZDJh
ZGM0YTlhMDQ0MTRiMSAgb3Blbmpkay0yMS4wLjkrOC50YXIuZ3oKPiAgIHNoYTI1NiAgY2NiN2Qz
N2MyNGY5ZjU4MDhmOWQyNTQxOWQ5MzY4MDU3MGRjNjAwZjI5MmU2ODk0NDAzMjMzOGNiNGIyYzUx
ZSAgb3Blbmpkay0xNy4wLjEyKzcudGFyLmd6Cj4gICBzaGEyNTYgIDRiOWFiZWJjNDMzODA0OGE3
YzJkYzE4NGU5ZjgwMGRlYjM0OTM2NmJkZjI4ZWIyM2MyNjc3YTc3YjRjODc3MjYgIExJQ0VOU0UK
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9vcGVuamRrL29wZW5qZGsubWsgYi9wYWNrYWdlL29wZW5q
ZGsvb3Blbmpkay5tawo+IGluZGV4IDU4YjI2NmM0ZTkuLjVhMDhlZDRmNDcgMTAwNjQ0Cj4gLS0t
IGEvcGFja2FnZS9vcGVuamRrL29wZW5qZGsubWsKPiArKysgYi9wYWNrYWdlL29wZW5qZGsvb3Bl
bmpkay5tawo+IEBAIC02LDggKzYsOCBAQAo+ICAgCj4gICBpZmVxICgkKEJSMl9QQUNLQUdFX09Q
RU5KREtfVkVSU0lPTl8yMSkseSkKPiAgIE9QRU5KREtfVkVSU0lPTl9NQUpPUiA9IDIxCj4gLU9Q
RU5KREtfVkVSU0lPTl9NSU5PUiA9IDAuNAo+IC1PUEVOSkRLX1ZFUlNJT05fQlVJTEQgPSA3Cj4g
K09QRU5KREtfVkVSU0lPTl9NSU5PUiA9IDAuOQo+ICtPUEVOSkRLX1ZFUlNJT05fQlVJTEQgPSA4
Cj4gICAKPiAgIGVsc2UKPiAgIE9QRU5KREtfVkVSU0lPTl9NQUpPUiA9IDE3CgpEbyB3ZSBrbm93
IHdoeSBleGFjdGx5IHdlIHNob3VsZCBidW1wIHRvIHRoaXMgdmVyc2lvbgoKYW5kIG5vdCBuZXdl
ciBvbmVzPwoKPiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVz
dF9vcGVuamRrLnB5IGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9vcGVuamRr
LnB5Cj4gaW5kZXggM2JmODlmOWVmZS4uODAwZWQzNjNlNyAxMDA2NDQKPiAtLS0gYS9zdXBwb3J0
L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X29wZW5qZGsucHkKPiArKysgYi9zdXBwb3J0L3Rl
c3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X29wZW5qZGsucHkKPiBAQCAtMTIsMTMgKzEyLDE3IEBA
IGNsYXNzIFRlc3RPcGVuSmRrKGluZnJhLmJhc2V0ZXN0LkJSVGVzdCk6Cj4gICAgICAgICAgIEJS
Ml9UQVJHRVRfR0VORVJJQ19HRVRUWV9QT1JUPSJ0dHlBTUEwIgo+ICAgICAgICAgICBCUjJfTElO
VVhfS0VSTkVMPXkKPiAgICAgICAgICAgQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTj15
Cj4gLSAgICAgICAgQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNS4xMC4z
NCIKPiArICAgICAgICBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI2LjE4
LjIxIgo+ICAgICAgICAgICBCUjJfTElOVVhfS0VSTkVMX1VTRV9DVVNUT01fQ09ORklHPXkKPiAg
ICAgICAgICAgQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fQ09ORklHX0ZJTEU9ImJvYXJkL3FlbXUv
YWFyY2g2NC12aXJ0L2xpbnV4LmNvbmZpZyIKPiAgICAgICAgICAgQlIyX0xJTlVYX0tFUk5FTF9O
RUVEU19IT1NUX09QRU5TU0w9eQo+ICAgICAgICAgICBCUjJfVEFSR0VUX1JPT1RGU19DUElPPXkK
PiAgICAgICAgICAgQlIyX1RBUkdFVF9ST09URlNfQ1BJT19HWklQPXkKPiAgICAgICAgICAgQlIy
X1BBQ0tBR0VfT1BFTkpESz15Cj4gKyAgICAgICAgQlIyX1NIQVJFRF9MSUJTPXkKPiArICAgICAg
ICBCUjJfUEFDS0FHRV9YT1JHNz15Cj4gKyAgICAgICAgQlIyX1BBQ0tBR0VfWExJQl9MSUJYMTE9
eQo+ICsgICAgICAgIEJSMl9QQUNLQUdFX09QRU5KREtfWDExPXkKCldlIGFscmVhZHkgaGF2ZSBz
b21lIHBhdGNoZXMgdG8gYWxsb3cgY29tcGlsaW5nIHdpdGhvdXQKClgxMSBzdXBwb3J0LsKgSXQg
c2VlbXMgdGhlIGJ1aWxkIGZhaWxlZCBiZWNhdXNlIHRoZSBleGlzdGluZwoKcGF0Y2hlcyB3ZXJl
IG5vdCBhcHBsaWVkLiBQbGVhc2UgY2hhbmdlIHRoZSBmb2xkZXIgbmFtZSAob3Blbmpkay8yMS4w
LjQrNykKCmludG8gdGhlwqBuZXcgdmVyc2lvbsKgdG8gYXBwbHkgdGhlIHBhdGNoZXMuCgpzZWUg
Cmh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2NvbW1pdC8zZGQ3
M2MzMGQzODdiMjM1NTg5Mjc1YmFkNzI5ZTY2NjE5ZDA2MmMzCgo+ICAgICAgICAgICBCUjJfUEFD
S0FHRV9PUEVOSkRLX0hFTExPX1dPUkxEPXkKPiAgICAgICAgICAgQlIyX1BBQ0tBR0VfT1BFTkpE
S19KTklfVEVTVD15Cj4gICAgICAgICAgICIiIgoKVGhhbmtzLAoKQmVzdCByZWdhcmRzLAoKRWwg
TWVoZGkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
