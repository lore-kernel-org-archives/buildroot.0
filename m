Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B517C71141
	for <buildroot@archiver.kernel.org>; Sat, 14 Jun 2025 13:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4617581062;
	Sat, 14 Jun 2025 13:11:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oJ6fspvdIJmJ; Sat, 14 Jun 2025 13:11:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66E9E8101C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66E9E8101C;
	Sat, 14 Jun 2025 13:11:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E0BA71A4
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 13:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C743840AD8
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 13:11:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fHpXlgHhaZQh for <buildroot@buildroot.org>;
 Sat, 14 Jun 2025 13:11:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A1F0340022
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1F0340022
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A1F0340022
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 13:11:16 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a51481a598so1760551f8f.3
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 06:11:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749906674; x=1750511474;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/39ijy38YbE6iOMdaqoiu0tITkm+4Vr89pvNbvIBwh0=;
 b=wiFzdvmweU8qduQfoAryBXLrzOr/CX8337aAIWcWWiM62CEvP11Q0QpopIvivz/vKn
 uUdetMhC7hHYsma29tD9sMJEk18E6C2nFoPXrzidU0ENwBhSLEc/kbv8L0XSQgwW9PG3
 FTae76LObHM94qj6WNEJSGoZL6h18+Mx10WgMTKeRQ7DsMSPLUKTANN4cH+WpIbtsNNm
 rNCW+yhF0fuN6xppFdCl61OgamjUzkeUciOg7ii4lrnizPx+Vk9bFyXF4h9leaBcyVul
 za9yvOJfk2FzVW570KDYjkR2iv4DRzTg+O0lcQX15zWhhNZ5fLwalj1PqHxv5f8mK8Xo
 /wlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqF5ghqw6C4/aOK5tdkQAVf535bHwSgKXl55I2D2Iw04mrJH9bjbj6UhwmijOX7WhSFdYms68tBus=@buildroot.org
X-Gm-Message-State: AOJu0YwAbZrMCcNFnbtv2FavtT6CksikNVzMza1fv9+KqrLKSsPCqjma
 HYn4G73xuVxH+xR1FLUueFb6zYoOn0PsYBeEgp2ftMiTc8vH3GwU31/TVxIYtSdy1I0qhMKm/NT
 IVRPE
X-Gm-Gg: ASbGncuLH7RAMJlGJ69duxBKi79Ri9pdRzcCRLo65zaZK+lH3Brb6vRxf407mb5LsFS
 fAelRee3AN4hT2a/ua6GCXgJ04vQFKKP24tnacOye65GvyfpDSTZeb8acf/Gkwjmgj0qLe0HljD
 EnuiAK+Y41sW7KzgePcUrw/p+0TC7A/wxJgv/k0c0WgO5s8ly7ywPY9DaIjSiQPslAygILeXEj6
 sL2WrRtxABdGPsQ9M3I4kEoKT4LJX1Ra+28Gz+mwZy7ruFzxPe05LIp1eYwTOpWGvsDIXc1DtNN
 oyT1oHTunrUq+vm/bFmo6CjlWu23wzyzeSkurRvuG+SuK46nTVfg1Q4S1J98VMUOAdW5jyE/kn0
 0YSB5JH9IAsEniuZaR4T5ZsFJYnMT/TujhN7k5erKz4PzAcR52SSHpYwL291Jb/iiZsdB4yUx1o
 DKqDMsb5cfTVStiQMTYLSdykg0
X-Google-Smtp-Source: AGHT+IHx9pBR9/hPUy8q8FzYPAKSqGhh2/uLyYxTGgQj2y7L8DLA6q/d9hWOhPlahAnHWm3lDheO/A==
X-Received: by 2002:a5d:584a:0:b0:3a5:39e9:928d with SMTP id
 ffacd0b85a97d-3a571897337mr3291137f8f.0.1749906674393; 
 Sat, 14 Jun 2025 06:11:14 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4532de8c4e8sm81819695e9.3.2025.06.14.06.11.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Jun 2025 06:11:14 -0700 (PDT)
Message-ID: <4bd7e50f-b41d-4023-a9c1-04107006b0b6@smile.fr>
Date: Sat, 14 Jun 2025 15:11:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Dick Olsson <hi@senzilla.io>
References: <20250607-loongarch-v2-0-90bc4fda9080@flygoat.com>
 <20250607-loongarch-v2-5-90bc4fda9080@flygoat.com>
Content-Language: en-US
In-Reply-To: <20250607-loongarch-v2-5-90bc4fda9080@flygoat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1749906674; x=1750511474; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/39ijy38YbE6iOMdaqoiu0tITkm+4Vr89pvNbvIBwh0=;
 b=arZnGl43me3YvrtNCWSnhFGQCBJMSAWt5/8EvmqFX6zALqVvOF0SlnF2J34NVt+cya
 iOEJUumjprcXs9gVBKa2DbD78FPNzE6CXJn+zmcteb9w3wJXfmewYoZL0yHSXm30Sem8
 KyjHwVyVOVif38+OBlbF2WxhVzHr06C+MK4zA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=arZnGl43
Subject: Re: [Buildroot] [PATCH v2 5/9] linux: Introduce {vmlinux,
 vmlinuz}.efi kernel binary format
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

SGVsbG8gSmlheHVuLCBBbGwsCgpMZSAwNy8wNi8yMDI1IMOgIDIwOjEyLCBKaWF4dW4gWWFuZyBh
IMOpY3JpdMKgOgo+IHZtbGludXguZWZpIGFuZCB2bWxpbnV6LmVmaSBhcmUgc3RhbmRhcmQgZmls
ZSBuYW1lcyBmb3IgTG9vbmdBcmNoCj4gRUZJU1RVQiBrZXJuZWwuCj4gCj4gSW50cm9kdWNlIHRo
ZW0gdG8gYnVpbGQgc3lzdGVtLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEppYXh1biBZYW5nIDxqaWF4
dW4ueWFuZ0BmbHlnb2F0LmNvbT4KPiAtLS0KPiAgbGludXgvQ29uZmlnLmluIHwgOCArKysrKysr
Kwo+ICBsaW51eC9saW51eC5tayAgfCA0ICsrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNl
cnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2xpbnV4L0NvbmZpZy5pbiBiL2xpbnV4L0NvbmZp
Zy5pbgo+IGluZGV4IGRkZDY1MTU0NDY0Zjk5NDkxNjFjMDRjMDdhMjVkNTAzNTQwN2U0ZjEuLjk3
MGNjM2I2M2YxY2M5NWEyZjU2YzZhYmMzMGY2ZmY3NTcxYWY0MWIgMTAwNjQ0Cj4gLS0tIGEvbGlu
dXgvQ29uZmlnLmluCj4gKysrIGIvbGludXgvQ29uZmlnLmluCj4gQEAgLTI5NCw2ICsyOTQsMTAg
QEAgY29uZmlnIEJSMl9MSU5VWF9LRVJORUxfVk1MSU5VWF9CSU4KPiAgCWJvb2wgInZtbGludXgu
YmluIgo+ICAJZGVwZW5kcyBvbiBCUjJfbWlwcyB8fCBCUjJfbWlwc2VsIHx8IEJSMl9zaAo+ICAK
PiArY29uZmlnIEJSMl9MSU5VWF9LRVJORUxfVk1MSU5VWF9FRkkKPiArCWJvb2wgInZtbGludXgu
ZWZpIgo+ICsJZGVwZW5kcyBvbiBCUjJfbG9vbmdhcmNoNjQKCk5vdGU6IHZtbGludXguZWZpIGlz
IG5vdCBzcGVjaWZpYyB0byBsb29uZ2FyY2gsIGl0J3MgYWxzbyBzdXBwb3J0ZWQgYnkgYWFyY2g2
NAphbmQgcmlzY3Ygc2luY2Uga2VybmVsIDYuMToKCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L3N0YWJsZS9saW51eC5naXQvY29tbWl0Lz9pZD1jMzdiODMw
ZmVmMTM5NmY5ZjJhZDc5YTY1NzAwZTE1MmVjMzYyNTQzCgpodHRwczovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9zdGFibGUvbGludXguZ2l0L2NvbW1pdC8/aWQ9ZjU1
NzkzNDAzYzUzZmZhYWFjYTQzOTQ4NDk4ZWQyYjg4OTZkOTYxNQoKWW91ciBwYXRjaCBpcyBmaW5l
IGFzIGlzLCBvdGhlciBhcmNoaXRlY3R1cmVzIGNhbiBiZSBhZGRlZCBsYXRlciBieSBmb2xsb3d1
cApwYXRjaGVzLgoKUmV2aWV3ZWQtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxl
LmZyPgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+ICsKPiAgY29uZmlnIEJSMl9MSU5VWF9LRVJO
RUxfVk1MSU5VWAo+ICAJYm9vbCAidm1saW51eCIKPiAgCj4gQEAgLTMwNSw2ICszMDksMTAgQEAg
Y29uZmlnIEJSMl9MSU5VWF9LRVJORUxfVk1MSU5VWl9CSU4KPiAgCWJvb2wgInZtbGludXouYmlu
Igo+ICAJZGVwZW5kcyBvbiBCUjJfbWlwcyB8fCBCUjJfbWlwc2VsCj4gIAo+ICtjb25maWcgQlIy
X0xJTlVYX0tFUk5FTF9WTUxJTlVaX0VGSQo+ICsJYm9vbCAidm1saW51ei5lZmkiCj4gKwlkZXBl
bmRzIG9uIEJSMl9sb29uZ2FyY2g2NAo+ICsKPiAgY29uZmlnIEJSMl9MSU5VWF9LRVJORUxfSU1B
R0VfVEFSR0VUX0NVU1RPTQo+ICAJYm9vbCAiY3VzdG9tIHRhcmdldCIKPiAgCWhlbHAKPiBkaWZm
IC0tZ2l0IGEvbGludXgvbGludXgubWsgYi9saW51eC9saW51eC5tawo+IGluZGV4IDE2NzYyYWMy
ZTYzYTk1MTBkY2NjMmY2MjZiNzUxNTY5NGUxMTMyNTYuLjA1MjAzOTQ5MzFjZTc5NTBhNzUwZDRm
NTdkYWI0NTEzNzc4ODY2MTIgMTAwNjQ0Cj4gLS0tIGEvbGludXgvbGludXgubWsKPiArKysgYi9s
aW51eC9saW51eC5tawo+IEBAIC0yNjIsMTIgKzI2MiwxNiBAQCBlbHNlIGlmZXEgKCQoQlIyX0xJ
TlVYX0tFUk5FTF9MSU5VWF9CSU4pLHkpCj4gIExJTlVYX0lNQUdFX05BTUUgPSBsaW51eC5iaW4K
PiAgZWxzZSBpZmVxICgkKEJSMl9MSU5VWF9LRVJORUxfVk1MSU5VWF9CSU4pLHkpCj4gIExJTlVY
X0lNQUdFX05BTUUgPSB2bWxpbnV4LmJpbgo+ICtlbHNlIGlmZXEgKCQoQlIyX0xJTlVYX0tFUk5F
TF9WTUxJTlVYX0VGSSkseSkKPiArTElOVVhfSU1BR0VfTkFNRSA9IHZtbGludXguZWZpCj4gIGVs
c2UgaWZlcSAoJChCUjJfTElOVVhfS0VSTkVMX1ZNTElOVVgpLHkpCj4gIExJTlVYX0lNQUdFX05B
TUUgPSB2bWxpbnV4Cj4gIGVsc2UgaWZlcSAoJChCUjJfTElOVVhfS0VSTkVMX1ZNTElOVVopLHkp
Cj4gIExJTlVYX0lNQUdFX05BTUUgPSB2bWxpbnV6Cj4gIGVsc2UgaWZlcSAoJChCUjJfTElOVVhf
S0VSTkVMX1ZNTElOVVpfQklOKSx5KQo+ICBMSU5VWF9JTUFHRV9OQU1FID0gdm1saW51ei5iaW4K
PiArZWxzZSBpZmVxICgkKEJSMl9MSU5VWF9LRVJORUxfVk1MSU5VWl9FRkkpLHkpCj4gK0xJTlVY
X0lNQUdFX05BTUUgPSB2bWxpbnV6LmVmaQo+ICBlbmRpZgo+ICAjIFRoZSBpZi1lbHNlIGJsb2Nr
cyBhYm92ZSBhcmUgYWxsIHRoZSBpbWFnZSB0eXBlcyB3ZSBrbm93IG9mLCBhbmQgYWxsCj4gICMg
Y29tZSBmcm9tIGEgS2NvbmZpZyBjaG9pY2UsIHNvIHdlIGtub3cgd2UgaGF2ZSBMSU5VWF9JTUFH
RV9OQU1FIHNldAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
