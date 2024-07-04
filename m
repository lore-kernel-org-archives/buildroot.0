Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F310C30653
	for <buildroot@archiver.kernel.org>; Thu,  4 Jul 2024 20:18:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A00A540488;
	Thu,  4 Jul 2024 20:18:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M4XbiN2bnBm1; Thu,  4 Jul 2024 20:18:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28437404C5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28437404C5;
	Thu,  4 Jul 2024 20:18:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BEFC61BF2C0
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 20:18:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA05A8404A
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 20:18:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NjGEmyeWw32J for <buildroot@lists.busybox.net>;
 Thu,  4 Jul 2024 20:18:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 965D6811B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 965D6811B3
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 965D6811B3
 for <buildroot@buildroot.org>; Thu,  4 Jul 2024 20:18:47 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3678aa359b7so1337817f8f.1
 for <buildroot@buildroot.org>; Thu, 04 Jul 2024 13:18:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720124325; x=1720729125;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MikoVUuOQDuGsafRrVvdJO1zDpOYukZc+k+CiHhZK/k=;
 b=U8u16hEJ6/tw1YOvkU1zjBfPrJuP0+VEA8O3dyhDy7U5m9BM8/efHty6HXe2SfveYG
 Kd+LynE/JUBhn0hJHvncT7aJC9KwaYgPdVTz+4VTxJ6z0JGBUEHwzyBQlQte9TrcCpgO
 ud3zukz+Xv3C8ThZ4h3Kn44JcNwxHCriH+Lq6ptqEiwLAa0pKnZVPgfbqFwSKS7Pew4e
 sQubxYicWIWnzjgaHBY2Pwxekgn/vnadeoyeoo+ERShpKK5maBeN7v1+U6CiZIyuzh5E
 GzIrD2bJKPXPAzXEClcJbtroY7qeLMx5bbReekfOXQJWjlNa9o+rXrWnX/6DD1/VKmU4
 Uh7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDSp/NZi+kzHZAT8ugfpv0OJuK5BgeBhDPZjwYPvTz1B9ZUcQO/f2kyk/k72rEZF4VwI6IRTbW17gT/1eZzQsGH635FDRW7g==
X-Gm-Message-State: AOJu0YyHmtCDE7ZMcZCbROt7q17sN7mNsRiK/EWaU1e/hFdcc3CcKWqm
 asCvRH1umlEhBHN38O1XcWnS1x1i+Zcbg9H7EQVE/j9qv3g7CTgzeigDIRx04aV5SBx/9OV/RhK
 d
X-Google-Smtp-Source: AGHT+IGkcJZm5aYGhAXeCK+786+aW7vui2GdI09wHMP8RRvKLQuaTxuG6nyJzxa1IQAUYxE2eQWbZw==
X-Received: by 2002:adf:e309:0:b0:362:23d5:3928 with SMTP id
 ffacd0b85a97d-3679f6fb56emr2276504f8f.17.1720124325470; 
 Thu, 04 Jul 2024 13:18:45 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367a18c2810sm1642392f8f.18.2024.07.04.13.18.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jul 2024 13:18:45 -0700 (PDT)
Message-ID: <e5dab416-8316-4691-8ef6-3bfa00dd626c@mind.be>
Date: Thu, 4 Jul 2024 22:18:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?SmFuIMSMZXJtw6Fr?= <sairon@sairon.cz>, buildroot@buildroot.org
References: <20240703082850.750420-1-sairon@sairon.cz>
 <20240703082850.750420-4-sairon@sairon.cz>
Content-Language: en-GB
In-Reply-To: <20240703082850.750420-4-sairon@sairon.cz>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720124325; x=1720729125; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MikoVUuOQDuGsafRrVvdJO1zDpOYukZc+k+CiHhZK/k=;
 b=EtVoo+l3vu+7S0wy8hvzy6dfEPabAhm5YZSDEVJmicnt6EM0UNWwDlNv5Zkx6Zqrfb
 qYA4ISoZKy4brNI7fLL/bVERsmS5GqEXSx+YwRzv0P9+cHYjrnhC72RH7nejLxXL1ei8
 t0lbJ9AgpbmwNMJgMNPkkUHC9y0QaT20KmeN978oQ40m0yMSmKlBkeStckkmE90SKXzY
 KHh+Ecjo5I976NEYlKsasJNT7AHNgw9UGmUk/LmmcO82oczm+vHjStOBRaj7aBmDayRz
 FBzREtl29Leg+ts2eYonspsENV29ye7wSh48usdtmiT5rV2sM2spu0a/z17sCq4XuC9M
 Ic5A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=EtVoo+l3
Subject: Re: [Buildroot] [PATCH 3/4] fs/erofs: add LZMA compression,
 allow configurable compression level
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Gao Xiang <hsiangkao@aol.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwMy8wNy8yMDI0IDEwOjI4LCBKYW4gxIxlcm3DoWsgd3JvdGU6Cj4gSW5zdGVhZCBvZiBo
YXZpbmcgYSBib29sIG9wdGlvbiBmb3IgZW5hYmxpbmcgdGhlIExaNEhDIGNvbXByZXNzaW9uLCBj
aGFuZ2UgdGhlCj4gS2NvbmZpZyBkZWZpbml0aW9uIHRvIGEgY2hvaWNlLCB3aGljaCBhbHNvIGFk
ZHMgbW9yZSBmbGV4aWJpbGl0eSBpbiB0aGUgZnV0dXJlCj4gKGUuZy4gZm9yIGVuYWJsaW5nIFpT
VEQgY29tcHJlc3Npb24pLiBUaGUgbmFtZSBvZiB0aGUgb2xkIG9wdGlvbiB3YXMgcHJlc2VydmVk
Cj4gc28gZGVmY29uZmlncyB1c2luZyBpdCB3b24ndCBiZSBhZmZlY3RlZC4KPiAKPiBUd28gbW9y
ZSBvcHRpb25zIGZvciBjb21wcmVzc2lvbiB3ZXJlIGFkZGVkLCB0aGUgc3RhbmRhcmQgTFo0IChp
LmUuIG5vbi1IQykKPiBjb21wcmVzc2lvbiBhbGdvcml0aG0gYW5kIExaTUEuCj4gCj4gQWxzbyBm
b3IgTFpNQSBhbmQgTFo0SEMsIGl0J3Mgbm93IHBvc3NpYmxlIHRvIGRlZmluZSBjb21wcmVzc2lv
biBsZXZlbC4KPiBQcmV2aW91c2x5IGl0IGRlZmF1bHRlZCB0byA5LCB3aGljaCBnZW5lcmF0ZXMg
aW1hZ2VzIGxhcmdlciB0aGFuIHNxdWFzaGZzIHdpdGgKPiBjb21wYXJhYmxlIHNldHRpbmdzICh3
aGljaCB1c2VzIGxldmVsIDEyIGJ5IGRlZmF1bHQpLiBGb3IgTFo0SEMgdGhlIGRlZmF1bHQgaWYK
PiB1bnNldCB3b3VsZCBiZSBzdGlsbCA5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbiDEjGVybcOh
ayA8c2Fpcm9uQHNhaXJvbi5jej4KPiAtLS0KPiAgIGZzL2Vyb2ZzL0NvbmZpZy5pbiB8IDQzICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0KPiAgIGZzL2Vyb2ZzL2Vy
b2ZzLm1rICB8ICA4ICsrKysrKy0tCj4gICAyIGZpbGVzIGNoYW5nZWQsIDQ3IGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2ZzL2Vyb2ZzL0NvbmZpZy5pbiBi
L2ZzL2Vyb2ZzL0NvbmZpZy5pbgo+IGluZGV4IGUxMTI1NzI2ODguLmQ1OTdkZTA5NDAgMTAwNjQ0
Cj4gLS0tIGEvZnMvZXJvZnMvQ29uZmlnLmluCj4gKysrIGIvZnMvZXJvZnMvQ29uZmlnLmluCj4g
QEAgLTYsMTAgKzYsNDkgQEAgY29uZmlnIEJSMl9UQVJHRVRfUk9PVEZTX0VST0ZTCj4gICAKPiAg
IGlmIEJSMl9UQVJHRVRfUk9PVEZTX0VST0ZTCj4gICAKPiArY2hvaWNlCj4gKwlwcm9tcHQgIkNv
bXByZXNzaW9uIGFsZ29yaXRobSIKPiArCWRlZmF1bHQgQlIyX1RBUkdFVF9ST09URlNfRVJPRlNf
TFo0SEMKPiArCWhlbHAKPiArCSAgU2VsZWN0IHRoZSBFUk9GUyBjb21wcmVzc2lvbiBhbGdvcml0
aG0gdG8gdXNlLgo+ICsKPiArY29uZmlnIEJSMl9UQVJHRVRfUk9PVEZTX0VST0ZTX05PTkUKPiAr
CWJvb2wgIm5vIGNvbXByZXNzaW9uIgo+ICsKPiArY29uZmlnIEJSMl9UQVJHRVRfUk9PVEZTX0VS
T0ZTX0xaNAo+ICsJYm9vbCAibHo0Igo+ICsKPiAgIGNvbmZpZyBCUjJfVEFSR0VUX1JPT1RGU19F
Uk9GU19MWjRIQwo+IC0JYm9vbCAibHo0aGMgY29tcHJlc3Npb24iCj4gKwlib29sICJsejRoYyIK
PiArCj4gK2NvbmZpZyBCUjJfVEFSR0VUX1JPT1RGU19FUk9GU19MWk1BCj4gKwlib29sICJsem1h
IgoKICBJdCB3b3VsZCBiZSB1c2VmdWwgdG8gaGF2ZSBoZWxwIHRleHQgZm9yIHRoZXNlIG9wdGlv
bnMsIGluIHBhcnRpY3VsYXIgCmV4cGxhaW5pbmcgYSBiaXQgYWJvdXQgdGhlIHNpemUvc3BlZWQg
dHJhZGVvZmZzLiBCYXNpY2FsbHkgc3R1ZmYgdGhhdCB5b3UgY2FuIApnZXQgZnJvbSBlcm9mcyBk
b2N1bWVudGF0aW9uLiBGb3Igc3VyZSwgdGhlIG9yaWdpbmFsIGhlbHAgdGV4dCAodGhhdCBleHBs
YWlucyAKdGhhdCBIQyBzdGFuZHMgZm9yIEhpZ2ggQ29tcHJlc3Npb24pIHNob3VsZG4ndCBiZSBy
ZW1vdmVkLgoKPiArCj4gK2VuZGNob2ljZQo+ICsKPiAraWYgQlIyX1RBUkdFVF9ST09URlNfRVJP
RlNfTFo0SEMKPiArCj4gK2NvbmZpZyBCUjJfVEFSR0VUX1JPT1RGU19FUk9GU19MWjRIQ19MRVZF
TAo+ICsJaW50ICJsejRoYyBjb21wcmVzc2lvbiBsZXZlbCIKPiArCWRlZmF1bHQgOQo+ICsJcmFu
Z2UgMSAxMgo+ICsJaGVscAo+ICsJICBTcGVjaWZ5IHRoZSBjb21wcmVzc2lvbiBsZXZlbCBmb3Ig
bHo0aGMgY29tcHJlc3Npb24uCgogIFRoaXMgc2hvdWxkIGV4cGxhaW4gYWxzbyB0aGF0IGhpZ2hl
ciB2YWx1ZXMgY29tcHJlc3MgbW9yZSBidXQgYXJlIHNsb3dlciAKKGFzc3VtaW5nIHRoYXQgdGhh
dCBpcyBjb3JyZWN0IDotKSApLgoKPiArCj4gK2VuZGlmICMgQlIyX1RBUkdFVF9ST09URlNfRVJP
RlNfTFo0SEMKPiArCj4gK2lmIEJSMl9UQVJHRVRfUk9PVEZTX0VST0ZTX0xaTUEKPiArCj4gK2Nv
bmZpZyBCUjJfVEFSR0VUX1JPT1RGU19FUk9GU19MWk1BX0xFVkVMCj4gKwlpbnQgImx6bWEgY29t
cHJlc3Npb24gbGV2ZWwiCj4gKwlkZWZhdWx0IDYKPiArCXJhbmdlIDAgMTA5CgogIEEgYml0IHNp
bGx5IHRvIHNwZWNpZnkgYSByYW5nZSBpZiB2YWx1ZXMgMTAtOTkgYXJlbid0IHZhbGlkIGFueXdh
eS4uLiBCdXQgT0ssIAppdCdzIGRpZmZpY3VsdCB0byBnZXQgYXJvdW5kIHRoYXQuCgo+ICAgCWhl
bHAKPiAtCSAgVXNlIGx6NCBoaWdoLWNvbXByZXNzaW9uIHRvIGNvbXByZXNzIGRhdGEgaW4gdGhl
IGZpbGVzeXN0ZW0uCj4gKwkgIFNwZWNpZnkgdGhlIGNvbXByZXNzaW9uIGxldmVsIGZvciBsem1h
IGNvbXByZXNzaW9uLgo+ICsJICBWYWx1ZXMgZnJvbSAwIHRvIDkgYXJlIHVzZWQgZm9yIHRoZSBz
dGFuZGFyZCBjb21wcmVzc2lvbiwKPiArCSAgdmFsdWVzIGZyb20gMTAwIHRvIDEwOSBhcmUgdXNl
ZCBmb3IgdGhlIGV4dHJlbWUgY29tcHJlc3Npb24uCj4gKwo+ICtlbmRpZiAjIEJSMl9UQVJHRVRf
Uk9PVEZTX0VST0ZTX0xaTUEKPiAgIAo+ICAgY29uZmlnIEJSMl9UQVJHRVRfUk9PVEZTX0VST0ZT
X1BDTFVTVEVSU0laRQo+ICAgCWludCAicGNsdXN0ZXIgc2l6ZSIKPiBkaWZmIC0tZ2l0IGEvZnMv
ZXJvZnMvZXJvZnMubWsgYi9mcy9lcm9mcy9lcm9mcy5tawo+IGluZGV4IGU0M2Q3NDkyN2IuLmYw
MGZiNzJjOTUgMTAwNjQ0Cj4gLS0tIGEvZnMvZXJvZnMvZXJvZnMubWsKPiArKysgYi9mcy9lcm9m
cy9lcm9mcy5tawo+IEBAIC02LDggKzYsMTIgQEAKPiAgIAo+ICAgUk9PVEZTX0VST0ZTX0RFUEVO
REVOQ0lFUyA9IGhvc3QtZXJvZnMtdXRpbHMKPiAgIAo+IC1pZmVxICgkKEJSMl9UQVJHRVRfUk9P
VEZTX0VST0ZTX0xaNEhDKSx5KQo+IC1ST09URlNfRVJPRlNfQVJHUyArPSAtemx6NGhjCj4gK2lm
ZXEgKCQoQlIyX1RBUkdFVF9ST09URlNfRVJPRlNfTFo0KSx5KQo+ICtST09URlNfRVJPRlNfQVJH
UyArPSAtemx6NAo+ICtlbHNlIGlmZXEgKCQoQlIyX1RBUkdFVF9ST09URlNfRVJPRlNfTFo0SEMp
LHkpCj4gK1JPT1RGU19FUk9GU19BUkdTICs9IC16bHo0aGMsJChzdHJpcCAkKEJSMl9UQVJHRVRf
Uk9PVEZTX0VST0ZTX0xaNEhDX0xFVkVMKSkKCiAgSSBkb24ndCB0aGluayBzdHJpcHBpbmcgaXMg
bmVlZGVkIGZvciBpbnQgb3B0aW9ucywgaXMgaXQ/CgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+ICtl
bHNlIGlmZXEgKCQoQlIyX1RBUkdFVF9ST09URlNfRVJPRlNfTFpNQSkseSkKPiArUk9PVEZTX0VS
T0ZTX0FSR1MgKz0gLXpsem1hLCQoc3RyaXAgJChCUjJfVEFSR0VUX1JPT1RGU19FUk9GU19MWk1B
X0xFVkVMKSkKPiAgIGVuZGlmCj4gICAKPiAgIGlmZXEgKCQoQlIyX1JFUFJPRFVDSUJMRSkseSkK
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
