Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C65C43458
	for <buildroot@archiver.kernel.org>; Mon,  6 Jul 2026 15:34:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFD7940A76;
	Mon,  6 Jul 2026 15:34:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QNxKYbqjucUD; Mon,  6 Jul 2026 15:34:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87D0140A69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783352088;
	bh=veI2zw7JY6XiPN3ZmkqOc6ANxEmE+ZoLsh35aXgkgCA=;
	h=Date:To:Cc:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Oq5jt9EHJd9QQ4ys7PvLYIx8tsbsrRRkrEoH4rZt7RtZLSEimkcNV8SQNNeAmM6vu
	 nSlOLf8/C+qn5xi7Sy3NNO4zpV8RFygzxbnEyUvJ0LYINomqSLhFFDfui5VeIvmjrO
	 2WWyniEivMfoZJPTEueElYEI0famJtgkOF+Y1krYEEFclRA3uc3DHELKVJ2b0zmS9e
	 VVZi1EFkYrsT5o2YwMXbxYb/UrK+ApTA9eiCBW5zAYz4S0gVmPVj1IH/p517PB9DM8
	 7YQ47ro2gRpg0h3Nwqxt/9LSRS5AX61KQY7ajiq7ebV8ZUKWPjbFMIGT5PeN2qQWOF
	 iMca2eMF5paBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87D0140A69;
	Mon,  6 Jul 2026 15:34:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EDDE72A8
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 15:34:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D3FA981259
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 15:34:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0dBXgkQiqSLb for <buildroot@buildroot.org>;
 Mon,  6 Jul 2026 15:34:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=rgallaispou@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B6BAB811EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6BAB811EF
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B6BAB811EF
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 15:34:45 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-493bab44440so17169645e9.0
 for <buildroot@buildroot.org>; Mon, 06 Jul 2026 08:34:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783352083; x=1783956883;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ooMurq0CPWyxM6T8L8a0d3C4VGvsTykkZJrq/ASmxMY=;
 b=ipX3T1nUxixbw9bKrYTERMel0VFQR5xMEPWWvcOXkhtYjnjanbq8ggzxvyKd0zBxu1
 rphp0wf+JLmYbJidDY2qM7jWTSxjfE/WO9al6f6rc+q81RgXobAkyzqOR3agcojKROTE
 4N9OwiD7PlAjdbeVJfYUu6ObjyUbLjcDGxaXsaD7O8O49OFxaqhhldkNFEwQeT9Rj7E6
 W65KlBsjq8416QklZ/c0Xy7mbFFnF/XTYWAFQyMhrB6FyDX8CiD/XNarMI8c/nt7+FCO
 FCbYgn9HJAr28epf5pk02jtI947HaXv75gp1PFrHaBXkcuzOzIvQnLH1jYsD5He/0tBR
 SITQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq9wcfVOEdV7ZgiUg10liBGzLATGYeCIOfkuToCmRi1n+HDFlNCDvAL7HbHRDI/av33nKX4cHK6Nkg=@buildroot.org
X-Gm-Message-State: AOJu0YyGK0LOx4eopkkNwJIl2vY+cpel0z5wjDsM/Wy2G+CAw3llJ5en
 01OHVnmytny8za0eSJFanGAtzHZ1omQrb5bhmD5HdNEUT74+H4A9w/Y1
X-Gm-Gg: AfdE7cm82hoqnTc3uGsubAWB2pAMlbVKptDI0Be2q+LQEdEpkVK/us9AkIhckhqAL5Y
 P7GV9vp80lMvxer10oPikz2eDX8/TbEBP551BRnRx2T2QvGNPYDANv6Wv9wxoQweANwXegi2fnU
 KM5IkxwR97m0CU4RCzJ32iMfPQz9FjRsDk2jWB2wqBBxpg/ITUC8pqxZCYKw8qTYS6Oa/3FL4iv
 aaUp9RX6kq8KFc4LCt44TfxzugUnvccw1Ayqxu4CQpUGnMehuoKJuB9OZMk6AiezgJewqzdVLCL
 iYs7AOaA/eUvssHJR5de04mFT06et0bfMYLMFODBykYIWfhqUAyyvRRobGuoOdbqlRCjYcVssrx
 TwprJJNhtFvvi9l//OEkt53N8XuGXEFlVBCMd1HqMXICFIEinUgWNGsNenonwl9xIu5y8Mpl8Ia
 smcYGMGupRUrw5xEWS/Wmh07WAAnD5SwlIncDTtoU5AnzDO05fPxntqxjOOFernwnga/qapTQ=
X-Received: by 2002:a05:600c:4351:b0:493:c566:7bd6 with SMTP id
 5b1f17b1804b1-493decf5b2amr9497895e9.18.1783352083248; 
 Mon, 06 Jul 2026 08:34:43 -0700 (PDT)
Received: from ?IPV6:2001:861:3385:e20:f99c:d6cf:27e6:2b03?
 ([2001:861:3385:e20:f99c:d6cf:27e6:2b03])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493c636e9e9sm362177075e9.2.2026.07.06.08.34.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jul 2026 08:34:42 -0700 (PDT)
Message-ID: <009fc076-444a-4da5-ad0b-c8d71ac99bac@gmail.com>
Date: Mon, 6 Jul 2026 17:34:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260527-master-v1-1-0d975f3b3f0d@gmail.com>
 <cbfb9495-35d2-447e-a9e1-22c834d07dc5@smile.fr>
Content-Language: en-US
From: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>
In-Reply-To: <cbfb9495-35d2-447e-a9e1-22c834d07dc5@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783352083; x=1783956883; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ooMurq0CPWyxM6T8L8a0d3C4VGvsTykkZJrq/ASmxMY=;
 b=mkWE7cOpC5+YXK9VaXU2vKh9tvguxl0dA6L/lYkfJUHYVh8L/ejYoz3W/pxMCEGzSM
 EyplFXlxMRG1Aq0onx5X7yYC/90OY07ssBcTzdw1h2jY9vtSFlMjsvFblTeSRplTuXPY
 B8fvNtJXPW26AYnGIiSd2d92txsHBKkVxDtGIRAF2wjCtDbKfhmXfp9Di5AQEpzPOTey
 Oa0jgGY8k5OxiLSkJNY7mASS5SLeORX7cL917mBmH5vkLy7iIFYfmWXK3Cf0hobM4qgA
 jgkgTWxbfdqy/D64u8rjTBqmU3NTvCpAyqRg/TEtl/ysBuf5arCJs+daIsesretbraFS
 KiFA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=mkWE7cOp
Subject: Re: [Buildroot] [PATCH] package/libxkbcommon: provide xkbregistry
 when libxml2 is enabled
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiA2LzI0LzI2IDE3OjUxLCBSb21haW4gTmFvdXIgd3JvdGU6Cj4gSGVsbG8gUmFwaGHDq2ws
CgpIaSwKCj4gCj4gTGUgMjcvMDUvMjAyNiDDoCAyMTo1MywgUmFwaGHDq2wgR2FsbGFpcy1Qb3Ug
YSDDqWNyaXTCoDoKPj4geGticmVnaXN0cnkgaXMgZGlzYWJsZWQgYnkgZGVmYXVsdC4gIFlldCwg
aXQgb25seSBuZWVkcyBsaWJ4bWwyIHRvIGJlCj4+IGJ1aWx0LCB3aGljaCBpcyBhbHJlYWR5IHN1
cHBvcnRlZC4KPj4KPj4gQWRkIHRoZSBjb21waWxlIGZsYWdzIHRvIGJ1aWxkIHhrYnJlZ2lzdHJ5
IHdoZW4gcG9zc2libGUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFJhcGhhw6tsIEdhbGxhaXMtUG91
IDxyZ2FsbGFpc3BvdUBnbWFpbC5jb20+Cj4+IC0tLQo+PiAgIHBhY2thZ2UvbGlieGtiY29tbW9u
L2xpYnhrYmNvbW1vbi5tayB8IDEwICsrKysrKysrLS0KPj4gICAxIGZpbGUgY2hhbmdlZCwgOCBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9s
aWJ4a2Jjb21tb24vbGlieGtiY29tbW9uLm1rIGIvcGFja2FnZS9saWJ4a2Jjb21tb24vbGlieGti
Y29tbW9uLm1rCj4+IGluZGV4IDIxYTJiOTM3ZWYwMi4uOTgxNTQzNjliNDE5IDEwMDY0NAo+PiAt
LS0gYS9wYWNrYWdlL2xpYnhrYmNvbW1vbi9saWJ4a2Jjb21tb24ubWsKPj4gKysrIGIvcGFja2Fn
ZS9saWJ4a2Jjb21tb24vbGlieGtiY29tbW9uLm1rCj4+IEBAIC0xMiw4ICsxMiw3IEBAIExJQlhL
QkNPTU1PTl9DUEVfSURfVkVORE9SID0geGtiY29tbW9uCj4+ICAgTElCWEtCQ09NTU9OX0lOU1RB
TExfU1RBR0lORyA9IFlFUwo+PiAgIExJQlhLQkNPTU1PTl9ERVBFTkRFTkNJRVMgPSBob3N0LWJp
c29uIGhvc3QtZmxleAo+PiAgIExJQlhLQkNPTU1PTl9DT05GX09QVFMgPSBcCj4+IC0JLURlbmFi
bGUtZG9jcz1mYWxzZSBcCj4+IC0JLURlbmFibGUteGticmVnaXN0cnk9ZmFsc2UKPiAKPiB4a2Jy
ZWdpc3RyeSBoYXMgYmVlbiBkaXNhYmxlZCBvbiBwdXJwb3NlIHdoZW4gbGlieGtiY29tbW9uIGhh
cyBiZWVuIHVwZGF0ZWQgdG8KPiAxLjAuMSBbMV0uCgpJbmRlZWQgSSBoYXZlbid0IHNlZSB0aGlz
LgoKPiAKPiBJdCBzZWVtcyB0byByZXF1aXJlcyB4a2V5Ym9hcmQtY29uZmlnIGF0IHJ1bnRpbWUg
WzJdLCBjYW4geW91IHZlcmlmeT8KClllczogbGlieGtiY29tbW9uIGRvZXMgbm90IHByb3ZpZGUg
ZGF0YXNldCwgd2hpY2ggaXMgd2hhdCAKeGtleWJvYXJkLWNvbmZpZyBpcy4KIEZyb20gWzJdOgpJ
dCBpcyBbcHJlZmVycmVkXSB0aGF0IGxpYnhrYnJlZ2lzdHJ5IGJlIHNwbGl0IGludG8gYSBzZXBh
cmF0ZSBwYWNrYWdlcyAKYXMgbW9zdApjbGllbnRzIHRoYXQgcmVxdWlyZSBsaWJ4a2Jjb21tb24g
ZG8gbm90IHJlcXVpcmUgbGlieGticmVnaXN0cnkgYW5kIGNsaWVudHMKcmVxdWlyaW5nIGxpYnhr
YnJlZ2lzdHJ5IG1heSBub3QgbmVlZCBsaWJ4a2Jjb21tb24uCgpEb2VzIHRoYXQgbWVhbiB0aGF0
IGEgbGlieGticmVnaXN0cnkgcGFja2FnZSBuZWVkcyB0byBiZSBjcmVhdGVkIHNpbmNlIAppdCBp
cyBpbmRlcGVuZGFudCBmcm9tIGxpYnhrYmNvbW1vbiA/CgpCZXN0IHJlZ2FyZHMsClJhcGhhw6ts
Cgo+IAo+IFsxXQo+IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8t
L2NvbW1pdC8xNzkxYmMzMGE1YjE5YmI1MjM2NjM3NWQwM2U2NjM0ODI0MmZmMjVhCj4gCj4gWzJd
Cj4gaHR0cHM6Ly9naXRodWIuY29tL3hrYmNvbW1vbi9saWJ4a2Jjb21tb24vYmxvYi8yYzI5NWIx
MGFhODdlOWJkOGMxMTk1NGFkY2Y3ZTkyYjAzMWI5MmY5L1BBQ0tBR0lORyNMNjEKPiAKPiBCZXN0
IHJlZ2FyZHMsCj4gUm9tYWluCj4gCj4+ICsJLURlbmFibGUtZG9jcz1mYWxzZQo+PiAgIAo+PiAg
IGlmZXEgKCQoQlIyX1BBQ0tBR0VfWE9SRzcpLHkpCj4+ICAgTElCWEtCQ09NTU9OX0NPTkZfT1BU
UyArPSAtRGVuYWJsZS14MTE9dHJ1ZQo+PiBAQCAtMjIsNiArMjEsMTMgQEAgZWxzZQo+PiAgIExJ
QlhLQkNPTU1PTl9DT05GX09QVFMgKz0gLURlbmFibGUteDExPWZhbHNlCj4+ICAgZW5kaWYKPj4g
ICAKPj4gK2lmZXEgKCQoQlIyX1BBQ0tBR0VfTElCWE1MMikseSkKPj4gK0xJQlhLQkNPTU1PTl9D
T05GX09QVFMgKz0gLURlbmFibGUteGticmVnaXN0cnk9dHJ1ZQo+PiArTElCWEtCQ09NTU9OX0RF
UEVOREVOQ0lFUyArPSBsaWJ4bWwyCj4+ICtlbHNlCj4+ICtMSUJYS0JDT01NT05fQ09ORl9PUFRT
ICs9IC1EZW5hYmxlLXhrYnJlZ2lzdHJ5PWZhbHNlCj4+ICtlbmRpZgo+PiArCj4+ICAgaWZlcSAo
JChCUjJfUEFDS0FHRV9MSUJYS0JDT01NT05fVE9PTFMpLHkpCj4+ICAgTElCWEtCQ09NTU9OX0NP
TkZfT1BUUyArPSAtRGVuYWJsZS10b29scz10cnVlCj4+ICAgZWxzZQo+Pgo+PiAtLS0KPj4gYmFz
ZS1jb21taXQ6IDA4ZjM3NTdiMGYyMTMzYjBlZDUwZTFlZjNkN2E1YTFkOWM4MGRlMWMKPj4gY2hh
bmdlLWlkOiAyMDI2MDUyNy1tYXN0ZXItMmU1Mjk5YWFhOGNhCj4+Cj4+IEJlc3QgcmVnYXJkcywK
Pj4gLS0KPj4gUmFwaGHDq2wgR2FsbGFpcy1Qb3UgPHJnYWxsYWlzcG91QGdtYWlsLmNvbT4KPj4K
Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gYnVp
bGRyb290IG1haWxpbmcgbGlzdAo+PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+PiBodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPiAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
