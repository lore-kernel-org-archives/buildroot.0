Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD7FFD88C6
	for <buildroot@archiver.kernel.org>; Tue, 10 Mar 2026 22:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97F3E40C92;
	Tue, 10 Mar 2026 22:44:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T76xhFYaTf2C; Tue, 10 Mar 2026 22:44:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 159CD40BC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773182656;
	bh=BwEb7ZEtNhnoK8sVWnT7ur8HLOr/d8tPm7X+RzWx8Mg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rvE1BtfGAaAZOjsVSrSwNJOERPQMIPVN2W5SS45FsXYj9kIp6r6ijA8gu7jdYgvem
	 x+UuhnwctM7SvF32loZvtSTeHk0XYI/qbTxAbPvNvUiflkObk5mQadvi0KC+G1z8yW
	 ZFostyPNFcEeJWWJ+wwNIl8pyw+hpB1zswbWkefFiFP42sPc65x0wvztHi5hfPx5tQ
	 udKRyd5buCPIWy9KqIU6bmUNyA8jJk/+myGK6wHKaryUNFL18/CV/iUWBk1l7WBZdH
	 q12FB1ynUFsM/mRv6rx2Zy5LPdx+vv1JTGnd15n92Eu/GsDY8C1/tZDarthD+Y+kX0
	 VzfU6SjLZbIuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 159CD40BC1;
	Tue, 10 Mar 2026 22:44:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AE98933A
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 22:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 94AD560EBB
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 22:44:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 32IXCkQ3VBXs for <buildroot@buildroot.org>;
 Tue, 10 Mar 2026 22:44:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A794660EBA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A794660EBA
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A794660EBA
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 22:44:13 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4852f73d0a3so32559925e9.3
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 15:44:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773182651; x=1773787451;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cborn501ALZBYz0mASKFRGzEKRsrnHjRuT1mUIqZnuo=;
 b=wbHnE28MGrstpRzAn7/X7WJuK+cU7L/AeTcHP6c66jiBF2773pglin+sz5VsNQc8Cx
 3R62oBBR7az+BqUsTFcNC7yDnrTZKtKoenxqZaufffgOK177nzh9D1uQG/YcS5dTYp1V
 h1q+IqTP4qw8l6+w9FXQidBhtVSLcIOhxqulfe/gCdngypYy3Efzo4beg+aO7SSXSIpP
 s9koXPpMn/8TxSRuSs7lFXlCuh0DUb/jrT4AUFJdVvNUjzrBnO4U1/yj6maEIcx7F/c3
 uqPDRnv+1mGqQFgftib78thfL5GiVVeunQecpYf8Zx7jyn5XbsQwzNdthNP0QZTcfoSl
 qnDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/OUQll/Tvs+WK67zMeJpmlODsAloqNV3aPwUXrc7ZRbEKFcCWPTof+IrEopDVv0cHCRJwwl88BdE=@buildroot.org
X-Gm-Message-State: AOJu0YxER0fBkp3GL1rpyAUqlKO55tptuYhcalgS47MDLRIQMskgs3rv
 kJmT+Uny6vH3qGD/1HjIWaNwI0jcrUUzImaNEFSwvqFRo8LGtcumST/RTmt96OkBE8YTRIav+re
 D8lqA
X-Gm-Gg: ATEYQzxB96y5z+GL8v78+3BSk9PpuylvBrkyOAjlY+3siN7jzp2snXC6N8P4xOZAwtX
 PAs69YXGsZtd3M/+bcty2TUpXYVE9qu+0EKwThAaS1SkuZUWEWcnkdeMcWKZaWEwJxCGo9lnVHR
 xo1Y3GsrscBuPB38TrPw3duf5WxeBL6C+t2gi3WPfIKjXShTcK7Kxsq3bvZKvsWzEQHBNL85bc7
 ssT28LKBP5QYZUAc4vL7ncU37BJcd33mKYMEGiT6UCBijmgTAEHUBCRDajLg1kkOyJdS13RMDER
 Zfbq5qCK2CeOptAWxyg87DduU6WF/LYDuO2UnQyV48Gb7CGatjbHDKxVFEjk5rao46oalmpTCQu
 spQiYXHB2i5vU3zTYK7CM71UEuvOl8WFYCoMIuFtKbRoPWSYpR5X5X/OMh9lUKAU3ugWCp7g76L
 MlD2rg5sYxWu6ipG2R3NoP36IV8YKHUc86Nz8jYnY+DyuYjLAR+JjqZ/HV0zfCvwr6q3KiJsWNv
 DVBVUYAyC3GtFRTguS4H6v8Xza9mlisHRP7Jgd6fQsGdN1cjyLn5F7nijjV5npfs4ZStizlCJ1H
X-Received: by 2002:a05:600c:6304:b0:485:2fe9:336f with SMTP id
 5b1f17b1804b1-4854b12ef51mr6794665e9.30.1773182651335; 
 Tue, 10 Mar 2026 15:44:11 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4854b5e912fsm16096795e9.2.2026.03.10.15.44.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Mar 2026 15:44:10 -0700 (PDT)
Message-ID: <c742a2ee-50a1-4477-8a66-3941d783b034@smile.fr>
Date: Tue, 10 Mar 2026 23:44:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 buildroot@buildroot.org
Cc: Thomas Huth <huth@tuxfamily.org>, Thomas Huth <th.huth+br@posteo.eu>,
 Cyril Bur <cyrilbur@gmail.com>
References: <20260225105537.1420002-1-alex.bennee@linaro.org>
 <20260225105537.1420002-7-alex.bennee@linaro.org>
Content-Language: fr, en-US
In-Reply-To: <20260225105537.1420002-7-alex.bennee@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1773182651; x=1773787451; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cborn501ALZBYz0mASKFRGzEKRsrnHjRuT1mUIqZnuo=;
 b=C5+IZnnYBhhYia/1YLZ76pZ283OQce2VnEp60/o7d4gR/zERBh1189FgSfbWEy1TIe
 dLkbSSu3ekMwTQhuyzlMRTskSo80bGhyTure6dPxTd3kMeAIXsNHyUIGUSH+4Z1y9mje
 bARgBUryMa+tkiFbxbEjXoJ7eMC//rIiUWCIs=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=C5+IZnnY
Subject: Re: [Buildroot] [PATCH v6 6/6] package/kvm-unit-tests: allow
 kvmtool to be used
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

SGVsbG8gQWxleCwgQWxsLAoKTGUgMjUvMDIvMjAyNiDDoCAxMTo1NSwgQWxleCBCZW5uw6llIGEg
w6ljcml0wqA6Cj4gRm9yIHNvbWUgdGFyZ2V0cyBsYXVuY2hpbmcgdGVzdHMgd2l0aCBrdm10b29s
IGlzIGFuIG9wdGlvbiB3aGljaCBtYWtlcwo+IGZvciBhbiBldmVuIHNtYWxsZXIgdGVzdCBpbWFn
ZS4gQ3JlYXRlIGEgbmV3IHN5bWJvbCB3aGljaCBjYW4gYmUKPiBleHBhbmRlZCB3aXRoIGFkZGl0
aW9uYWwgdGFyZ2V0cyB0aGF0IHdpbGwgYWxsb3cgdGhlIHNraXBwaW5nIG9mIHRoZQo+IHNlbGVj
dGlvbiBvZiBRRU1VIGlmIG5vdCBuZWVkZWQuCj4gCj4gUmV2aWV3ZWQtYnk6IFRob21hcyBIdXRo
IDxodXRoQHR1eGZhbWlseS5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogQWxleCBCZW5uw6llIDxhbGV4
LmJlbm5lZUBsaW5hcm8ub3JnPgo+IAo+IC0tLQo+IHYyCj4gICAtIGV4cGFuZCB0byBpbmNsdWRl
IHJpc2N2LCBkaWRuJ3QgYm90aGVyIHdpdGggMzIgYml0IGFybSBnaXZlbiBpdHMgZGVwcmVjYXRl
ZAo+ICAgLSBvbmx5IGV4cGFuZCB0YXJnZXQgd2hlbiBhcmNoIGNhbiBzdXBwb3J0IGl0Cj4gICAt
IHVwZGF0ZSBjb21tZW50IGRlcGVuZHMKPiAtLS0KPiAgcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9D
b25maWcuaW4gICAgICAgICB8IDEyICsrKysrKysrKy0tLQo+ICBwYWNrYWdlL2t2bS11bml0LXRl
c3RzL2t2bS11bml0LXRlc3RzLm1rIHwgMTEgKysrKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2Vk
LCAyMCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNr
YWdlL2t2bS11bml0LXRlc3RzL0NvbmZpZy5pbiBiL3BhY2thZ2Uva3ZtLXVuaXQtdGVzdHMvQ29u
ZmlnLmluCj4gaW5kZXggNzRjMzJmNDZlMC4uZjViNDE3NzEwNiAxMDA2NDQKPiAtLS0gYS9wYWNr
YWdlL2t2bS11bml0LXRlc3RzL0NvbmZpZy5pbgo+ICsrKyBiL3BhY2thZ2Uva3ZtLXVuaXQtdGVz
dHMvQ29uZmlnLmluCj4gQEAgLTEzLDYgKzEzLDExIEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9LVk1f
VU5JVF9URVNUU19BUkNIX1NVUFBPUlRTCj4gIAlkZWZhdWx0IHkgaWYgQlIyX3Bvd2VycGM2NCB8
fCBCUjJfcG93ZXJwYzY0bGUKPiAgCWRlZmF1bHQgeSBpZiBCUjJfczM5MHgKPiAgCj4gKyMgU29t
ZSBhcmNoaXRlY3R1cmVzIGNhbiB1c2Uga3ZtdG9vbCBpbnN0ZWFkIG9mIFFFTVUgdG8gbGF1bmNo
IHRoZSB0ZXN0cwo+ICtjb25maWcgQlIyX1BBQ0tBR0VfS1ZNX1VOSVRfVEVTVFNfQ0FOX1VTRV9L
Vk1UT09MCj4gKwlib29sCj4gKwlkZWZhdWx0IHkgaWYgKEJSMl9hYXJjaDY0IHx8IEJSMl9yaXNj
dikgJiYgQlIyX1BBQ0tBR0VfS1ZNVE9PTAoKU2luY2UgaXQncyBhIGNob2ljZSwgSXQgd291bGQg
YmUgYmV0dGVyIHRvIGxldCB0aGUgdXNlciBzZWxlY3QgaWYgS1ZNVE9PTCBvcgpRRU1VIHNob3Vs
ZCBiZSB1c2VkLgoKPiArCj4gIGNvbmZpZyBCUjJfUEFDS0FHRV9LVk1fVU5JVF9URVNUUwo+ICAJ
Ym9vbCAia3ZtLXVuaXQtdGVzdHMiCj4gIAlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0tWTV9VTklU
X1RFU1RTX0FSQ0hfU1VQUE9SVFMKPiBAQCAtMjQsOCArMjksOCBAQCBjb25maWcgQlIyX1BBQ0tB
R0VfS1ZNX1VOSVRfVEVTVFMKPiAgCWRlcGVuZHMgb24gKEJSMl9QQUNLQUdFX0dMSUJDX1VUSUxT
IHx8IFwKPiAgCQkgICAgQlIyX1VDTElCQ19JTlNUQUxMX1VUSUxTIHx8IFwKPiAgCQkgICAgQlIy
X1RPT0xDSEFJTl9FWFRFUk5BTF9MSUJDX1VUSUxTX0NPUFkpICMgcnVudGltZSBnZXRjb25mCj4g
LQlzZWxlY3QgQlIyX1BBQ0tBR0VfUUVNVQo+IC0Jc2VsZWN0IEJSMl9QQUNLQUdFX1FFTVVfU1lT
VEVNICMgcnVudGltZSBmb3IgcWVtdS1zeXN0ZW0tJEFSQ0gKPiArCXNlbGVjdCBCUjJfUEFDS0FH
RV9RRU1VIGlmICFCUjJfUEFDS0FHRV9LVk1fVU5JVF9URVNUU19DQU5fVVNFX0tWTVRPT0wKPiAr
CXNlbGVjdCBCUjJfUEFDS0FHRV9RRU1VX1NZU1RFTSBpZiAhQlIyX1BBQ0tBR0VfS1ZNX1VOSVRf
VEVTVFNfQ0FOX1VTRV9LVk1UT09MICMgcnVudGltZSBmb3IgcWVtdS1zeXN0ZW0tJEFSQ0gKPiAg
CXNlbGVjdCBCUjJfUEFDS0FHRV9DT1JFVVRJTFMgIyBydW50aW1lIGZvciB0aW1lb3V0Cj4gIAlz
ZWxlY3QgQlIyX1BBQ0tBR0VfQkFTSCAjIHJ1bnRpbWUKPiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9O
TUFQCj4gQEAgLTU1LDQgKzYwLDUgQEAgY29tbWVudCAia3ZtLXVuaXQtdGVzdHMgbmVlZHMgYSB0
b29sY2hhaW4gdy8gdXRpbHMsIGdjYyA+PSA4IGFuZCBxZW11IgoKV2hlbiBCUjJfUEFDS0FHRV9L
Vk1fVU5JVF9URVNUU19DQU5fVVNFX0tWTVRPT0wgaXMgc2V0LCB0aGUgY29tbWVudCBpcyBub3QK
YWNjdXJhdGUgc2luY2UgaXQgY29udGFpbnMgJ3FlbXUnLgoKPiAgCWRlcGVuZHMgb24gIShCUjJf
UEFDS0FHRV9HTElCQ19VVElMUyB8fCBcCj4gIAkJQlIyX1VDTElCQ19JTlNUQUxMX1VUSUxTIHx8
IFwKPiAgCQlCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0xJQkNfVVRJTFNfQ09QWSkKPiAtCWRlcGVu
ZHMgb24gIUJSMl9QQUNLQUdFX1FFTVVfQVJDSF9TVVBQT1JUU19UQVJHRVQKPiArCWRlcGVuZHMg
b24gIShCUjJfUEFDS0FHRV9RRU1VX0FSQ0hfU1VQUE9SVFNfVEFSR0VUIHx8IFwKPiArCQlCUjJf
UEFDS0FHRV9LVk1fVU5JVF9URVNUU19DQU5fVVNFX0tWTVRPT0wpCj4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2Uva3ZtLXVuaXQtdGVzdHMva3ZtLXVuaXQtdGVzdHMubWsgYi9wYWNrYWdlL2t2bS11bml0
LXRlc3RzL2t2bS11bml0LXRlc3RzLm1rCj4gaW5kZXggZWZjM2M4NTlhYS4uMDIxOTEyNzVhMiAx
MDA2NDQKPiAtLS0gYS9wYWNrYWdlL2t2bS11bml0LXRlc3RzL2t2bS11bml0LXRlc3RzLm1rCj4g
KysrIGIvcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9rdm0tdW5pdC10ZXN0cy5tawo+IEBAIC00MCw2
ICs0MCwxNyBAQCBLVk1fVU5JVF9URVNUU19DT05GX09QVFMgPVwKPiAgCS0tcHJvY2Vzc29yPSIk
KEdDQ19UQVJHRVRfQ1BVKSIgXAo+ICAJLS1lbmRpYW49IiQoS1ZNX1VOSVRfVEVTVFNfRU5ESUFO
KSIKPiAgCj4gKyMgVGhlIGRlZmF1bHQgcnVubmVyIGlzIFFFTVUgYnV0IGt2bXRvb2wgY2FuIGFs
c28gYmUgdXNlZCBvbiBzb21lCj4gKyMgYXJjaGl0ZWN0dXJlcy4gVGhlIGZsYWcgb25seSB3b3Jr
cyBmb3IgdGhvc2UgYXJjaGl0ZWN0dXJlcyB0aGF0IGNhbgo+ICsjIHN1cHBvcnQgYm90aC4KPiAr
aWZlcSAoJChCUjJfUEFDS0FHRV9LVk1fVU5JVF9URVNUU19DQU5fVVNFX0tWTVRPT0wpLCB5KQo+
ICtpZmVxICgkKEJSMl9QQUNLQUdFX1FFTVVfU1lTVEVNKSx5KQo+ICtLVk1fVU5JVF9URVNUU19D
T05GX09QVFMgKz0gLS10YXJnZXQ9cWVtdQo+ICtlbHNlIGlmZXEgKCQoQlIyX1BBQ0tBR0VfS1ZN
VE9PTCkseSkKPiArS1ZNX1VOSVRfVEVTVFNfQ09ORl9PUFRTICs9IC0tdGFyZ2V0PWt2bXRvb2wK
CldoYXQgaWYgQlIyX1BBQ0tBR0VfUUVNVV9TWVNURU0gYW5kIEJSMl9QQUNLQUdFX0tWTVRPT0wg
YXJlIGJvdGggZW5hYmxlZCBhbmQgdGhlCnVzZWQgd2FudCB0byBydW4gdGVzdHMgd2l0aCBrdm10
b29sID8KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiArZW5kaWYKPiArZW5kaWYKPiArCj4gIGlm
ZXEgKCQoQlIyX0FSTTY0X1BBR0VfU0laRV80SykseSkKPiAgS1ZNX1VOSVRfVEVTVFNfQ09ORl9P
UFRTICs9IC0tcGFnZS1zaXplPTRrCj4gIGVsc2UgaWZlcSAoJChCUjJfQVJNNjRfUEFHRV9TSVpF
XzE2SykseSkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
