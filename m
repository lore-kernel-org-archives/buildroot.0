Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 535E9C4345F
	for <buildroot@archiver.kernel.org>; Tue, 30 Apr 2024 22:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3734E407B0;
	Tue, 30 Apr 2024 22:51:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zl0x6sWOYXht; Tue, 30 Apr 2024 22:51:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCCE3407B1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCCE3407B1;
	Tue, 30 Apr 2024 22:51:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0214E1BF3EB
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 22:51:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E007681FD2
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 22:51:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1LHsawjYYkU9 for <buildroot@lists.busybox.net>;
 Tue, 30 Apr 2024 22:51:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8FCD681FD1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FCD681FD1
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8FCD681FD1
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 22:51:44 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2df848f9325so50772941fa.1
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 15:51:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714517502; x=1715122302;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dwZ1lOMzhRMsPSm17B9tSZe6zs597ktuwnCQrv11FX4=;
 b=dPFzvv+CuzNnc9lM2bz53VQUIM266e7yTRwYICU38Zu1ltQEqo629d1vyOawhZZSpR
 S8JulKW+a+jvjD+bFwNYCQ+GN8Et5AcWIranP+O7LRBytyKMh2S098jkBdzRHwBT5HW5
 7Ms3R4YwHbpl7AJatLRG59/tsIBTJ7b0ILt9cZWgqqSEZEK62qn/y5lMQZ1xDBqrHcVu
 V7i+bAE80gHq9azqPJVlWchJN0GqhSsRD1QOOQ7RBxeNNmGk/J8psvTu2+wHusduNVOQ
 hiogiPFZTZQmcn8sJMEOrjoyzlgka6B1nlya9qggFhYWQwlJNzasFARyYhDJgur26M5l
 V+dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoFrQ/zrgyUUqMhJCH5OT7bmdAITuIY16D0dqiABxv0EOwFIxPtPDrAoksJgoA3c45eg7rw/XKQEwmo2IJykUsPy7Vf8rnbQ==
X-Gm-Message-State: AOJu0YwvrH+mgeprJK60EnrCF3MoLKwpIAYhA/NEG4IiUNHWcZePjzHG
 6h8S1T+5ClKcq1mE4Nuwrj51jj5hzkpwFZDPOSmMEI7My0snRgQFf92Ew5Mx4ek=
X-Google-Smtp-Source: AGHT+IFP9KO+Xsr8TBZXJZddx3naLkN1bQ3+F6DeNUiRMDWchLECAaPha+68sCQ7//cZ9PGNCkVw4w==
X-Received: by 2002:a2e:6817:0:b0:2dc:b467:cb32 with SMTP id
 c23-20020a2e6817000000b002dcb467cb32mr759956lja.14.1714517501925; 
 Tue, 30 Apr 2024 15:51:41 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a05600c358800b0041a1fee2854sm300342wmq.17.2024.04.30.15.51.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Apr 2024 15:51:41 -0700 (PDT)
Message-ID: <6fdefe92-405d-4ef6-94fd-888af74f5035@smile.fr>
Date: Wed, 1 May 2024 00:51:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20240309212346.1642309-1-ju.o@free.fr>
Content-Language: fr
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240309212346.1642309-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1714517502; x=1715122302;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dwZ1lOMzhRMsPSm17B9tSZe6zs597ktuwnCQrv11FX4=;
 b=K3nszAKw6AMbsvJ0YBNjVUS2FRoRa0KhLnav79KY4yCBq7s8Z4pdu7nwnUCr18zm+G
 QAPMUD7iieq2V2wQC5iDZdM0RJVhUhVtxKADJBMqeUGqN233x8O8kJ5b21wwD6Nl8lJb
 CpJ48FWtybdXJsxJgz2+o0+rONviAr0HA3a9duOv84rdeqF+gavSoTeGskcciwK7Wb6x
 J17l52p7nprnK8wPUUCc2JDOFCN15yu6TDLnDJZkGxPX9wtd1lrYVHa+EDPR8curJlnq
 swqi3OD40MgeVD3+sLxnCfWJoJ9dS9nvW6OM9jtLfUJd2CtU8xFIuGxDiNuIrSiektQf
 g1UA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=K3nszAKw
Subject: Re: [Buildroot] [PATCH 1/1] configs/imx23evk: bump Linux and U-Boot
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
Cc: Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSnVsaWVuLAoKTGUgMDkvMDMvMjAyNCDDoCAyMjoyMywgSnVsaWVuIE9saXZhaW4gYSDD
qWNyaXTCoDoKPiBUaGUgaW14MjNldmtfZGVmY29uZmlnIGZhaWwgdG8gYnVpbGQgdGhlIEtlcm5l
bCB3aXRoIG1lc3NhZ2U6Cj4gCj4gICAgIGFyY2gvYXJtL21tL3Byb2MtYXJtOTI2LlM6IEFzc2Vt
YmxlciBtZXNzYWdlczoKPiAgICAgYXJjaC9hcm0vbW0vcHJvYy1hcm05MjYuUzo0Nzc6IEVycm9y
OiBqdW5rIGF0IGVuZCBvZiBsaW5lLCBmaXJzdCB1bnJlY29nbml6ZWQgY2hhcmFjdGVyIGlzICcj
Jwo+IAo+IFRoZSB1cHN0cmVhbSBmaXggaXMgWzFdIGludHJvZHVjZWQgaW4gS2VybmVsIHY1LjUu
Cj4gCj4gVGhpcyBjb21taXQgZml4ZXMgdGhpcyBpc3N1ZSBieSB1cGRhdGluZyB0aGUgS2VybmVs
LiBXaGlsZSBhdCBpdCwKPiBVLUJvb3QgaXMgYWxzbyB1cGRhdGVkLiBUaGUgS2VybmVsIERUUyBu
YW1lIGlzIGFsc28gdXBkYXRlZCwgdG8gZm9sbG93Cj4gdGhlIHJlb3JnYW5pemF0aW9uIGluIFsy
XSwgZmlyc3QgaW5jbHVkZWQgaW4gdjYuNS4KPiAKPiBGaXhlczoKPiAtIGh0dHBzOi8vZ2l0bGFi
LmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvNjMzODA3OTIwNAo+IAo+IFsxXSBo
dHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9zdGFibGUvbGlu
dXguZ2l0L2NvbW1pdC8/aWQ9NzkwNzU2YzdlMDIyOWRlZGM4M2JmMDU4YWM2OTYzMzA0NWIxMDAw
ZQo+IFsyXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9z
dGFibGUvbGludXguZ2l0L2NvbW1pdC8/aWQ9NzI0YmE2NzUxNTMyMDU1ZGI3NTk5MmZjNmFlMjFj
M2UzMjJlOTRhNwoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCldlIG5vdyB3YW50IGhhc2hl
cyBmb3IgdGhlIGN1c3RvbSBrZXJuZWwgYW5kIGJvb3Rsb2FkZXIgdGhhdCBhcmUgdXNlZCBpbiB0
aGUKZGVmY29uZmlncy4gU2VlIGZvciBleGFtcGxlIGNvbW1pdCA5OWEzNjk4NzI5ZGFkMTRmZjc1
Zjk5MTRkZDg1NTViYjczZDJkYTAyCndoaWNoIGFkZGVkIHRoZW0gZm9yIHRoZSBuZXpoYV9kZWZj
b25maWcuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVu
IE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4KPiAtLS0KPiAgY29uZmlncy9pbXgyM2V2a19kZWZjb25m
aWcgfCAxMCArKysrKy0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2NvbmZpZ3MvaW14MjNldmtfZGVmY29uZmln
IGIvY29uZmlncy9pbXgyM2V2a19kZWZjb25maWcKPiBpbmRleCA5NGQxNTljZjllNS4uYjU0YWY0
MThlYjEgMTAwNjQ0Cj4gLS0tIGEvY29uZmlncy9pbXgyM2V2a19kZWZjb25maWcKPiArKysgYi9j
b25maWdzL2lteDIzZXZrX2RlZmNvbmZpZwo+IEBAIC0yLDggKzIsOCBAQAo+ICBCUjJfYXJtPXkK
PiAgQlIyX2FybTkyNnQ9eQo+ICAKPiAtIyBMaW51eCBoZWFkZXJzIHNhbWUgYXMga2VybmVsLCBh
IDQuOCBzZXJpZXMKPiAtQlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV80Xzg9
eQo+ICsjIExpbnV4IGhlYWRlcnMgc2FtZSBhcyBrZXJuZWwsIGEgNi42IHNlcmllcwo+ICtCUjJf
UEFDS0FHRV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9NXzZfNj15Cj4gIAo+ICAjIHN5c3RlbQo+
ICBCUjJfVEFSR0VUX0dFTkVSSUNfR0VUVFlfUE9SVD0idHR5QU1BMCIKPiBAQCAtMTEsMTYgKzEx
LDE2IEBAIEJSMl9UQVJHRVRfR0VORVJJQ19HRVRUWV9QT1JUPSJ0dHlBTUEwIgo+ICAjIGtlcm5l
bAo+ICBCUjJfTElOVVhfS0VSTkVMPXkKPiAgQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lP
Tj15Cj4gLUJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjQuOC42Igo+ICtC
UjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI2LjYuMjEiCj4gIEJSMl9MSU5V
WF9LRVJORUxfREVGQ09ORklHPSJteHMiCj4gIEJSMl9MSU5VWF9LRVJORUxfRFRTX1NVUFBPUlQ9
eQo+IC1CUjJfTElOVVhfS0VSTkVMX0lOVFJFRV9EVFNfTkFNRT0iaW14MjMtZXZrIgo+ICtCUjJf
TElOVVhfS0VSTkVMX0lOVFJFRV9EVFNfTkFNRT0ibnhwL214cy9pbXgyMy1ldmsiCj4gIAo+ICAj
IGJvb3Rsb2FkZXIKPiAgQlIyX1RBUkdFVF9VQk9PVD15Cj4gIEJSMl9UQVJHRVRfVUJPT1RfQk9B
UkROQU1FPSJteDIzZXZrIgo+ICBCUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9WRVJTSU9OPXkKPiAt
QlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iMjAyMS4xMCIKPiArQlIyX1RB
UkdFVF9VQk9PVF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iMjAyNC4wMSIKPiAgQlIyX1RBUkdFVF9V
Qk9PVF9GT1JNQVRfU0Q9eQo+ICAKPiAgIyBGaWxlc3lzdGVtCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
