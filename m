Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B89EC8303C
	for <buildroot@archiver.kernel.org>; Sat,  5 Jul 2025 19:09:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A745C839E9;
	Sat,  5 Jul 2025 19:09:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IcPC8hm6MxJ1; Sat,  5 Jul 2025 19:09:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA28B83A83
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA28B83A83;
	Sat,  5 Jul 2025 19:09:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8991515F
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 19:09:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7021560F28
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 19:09:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BXrZ1UM1W-Xg for <buildroot@buildroot.org>;
 Sat,  5 Jul 2025 19:09:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 345DE60B4A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 345DE60B4A
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 345DE60B4A
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 19:09:17 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a507e88b0aso1486508f8f.1
 for <buildroot@buildroot.org>; Sat, 05 Jul 2025 12:09:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751742556; x=1752347356;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vdtm59PHUC/G9rRNbG8aBpNHhf8e/4+roIKcMrePx5s=;
 b=gXJoF+nytvrFU09g1yQVZG7QtBWOWF7t0ydpNuwxOJRtf8vJyHo3gH++3NJY9gPWAA
 WYPyP7AXD+LpHO6bxncRfTShz5pdfT2XXXxjL9f2FxOt5dDu0LlqsLg+Y6B3/OHnoMli
 BGfQ4dd1UCCWPwX+4XCz7LahQlsBznwUaI0C9uObKvUA7UYFz5JQt9aA9TDGSzvXp0aI
 gRMFzw3uP5MqlxwYUb9+r1y/wTviqbJabfihSoT1u8+VCkw9O1QxuG5ey0How58nPuaO
 HpfTFY5TZX3NpVs4xS6dUfC7ISW1Eu234SZxqtKTxvpTRLrF0wFcdVh3bcQatqU7f4Af
 dchw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9PU22tJZ04T5syrprUJMKvwPZhpuiegcR3pAWC+vELYadfQBIYfLpCT+Jt9Ncr3mbH6ooDvRTOZE=@buildroot.org
X-Gm-Message-State: AOJu0YwOiW9t06gpmKv57xEFyKrxuxHoZTVVDyTVCJF/6h9jR6fQN8sm
 aws0iVv9qpU9zNF/RE/s6/ZCwrUnQRCCwfMxXLTw7+b9NFbmQN4eseErKefKx53P8V0=
X-Gm-Gg: ASbGncvqmhDhO2MNVCedQIBHIK4687xq7nATj60KnldY2678ljjL/yPrJtRZGC5UIPf
 JlKWuHrsMIGHF9Qq/CaIMmpsLIz+L+/PoE+jnc0y9rKMMoy08y1x+JwDzaVZzgn/yi0WwiR7gQb
 0BQGmcjn4tIr3URcSKASFKmwSoZc4Sc6WSqzRtRvG9QIRg6opM39+xNrYfc29OwfyG3ReuFijO5
 tSu1HLgHh3txwGJWByC5tj9Srjup+UGQxHY9oxqgVNH40muFRoF3WUwb/btWu4sWW+RJr4ipmT2
 xLhUOLBEiLw6F7wnYV9vyIRF22kKijRQ+HruKY286l2y1bUWE6DPbKVP8mFV9IZnmLRWhR533EE
 +BtEY3ibEC6OmLNUdnPzltZdUzWd2j2Y32DMVRuv9JkAODA29bu/N7K0FvMu6bH1WABqydRlMFl
 vh07ZGeTP+CD2OzXCf28jnyqGx
X-Google-Smtp-Source: AGHT+IFEjETRHSW4InDPrMCuBBpQmhfA+abXU5CL0YXGw7pa0M4F5yVJIKAXu+WEGQp1UJALLMeIzw==
X-Received: by 2002:a05:6000:250d:b0:3b3:9cc4:21ce with SMTP id
 ffacd0b85a97d-3b4966265d5mr5406036f8f.50.1751742555875; 
 Sat, 05 Jul 2025 12:09:15 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454b1698f54sm61202545e9.33.2025.07.05.12.09.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Jul 2025 12:09:15 -0700 (PDT)
Message-ID: <62e082ee-feb3-40d0-a88e-32ee76db7a8e@smile.fr>
Date: Sat, 5 Jul 2025 21:09:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 buildroot@buildroot.org
Cc: Thomas Huth <huth@tuxfamily.org>, Cyril Bur <cyrilbur@gmail.com>
References: <20250619144837.1298990-1-alex.bennee@linaro.org>
 <20250619144837.1298990-3-alex.bennee@linaro.org>
Content-Language: fr, en-US
In-Reply-To: <20250619144837.1298990-3-alex.bennee@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1751742556; x=1752347356; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vdtm59PHUC/G9rRNbG8aBpNHhf8e/4+roIKcMrePx5s=;
 b=cJKoUD7F8fOYkOeo7R3SKZWQ4OHP/dBVo+7hIT328N3l1HhGOkZTx6miHQ0tsVhWPw
 aesS6jnUtxK0ZGGvO5erQa0sIYBOA3+QJH2sGJuWYmze2Oyll8AmnnEU5yO2rra5eEjg
 Fba0OLP5Vgd0Jl+3TBiRwBpjEdKP4Nvk6vGsA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=cJKoUD7F
Subject: Re: [Buildroot] [PATCH 2/3] package/kvm-unit-tests: add some
 missing deps
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

SGkgQWxleCwgQWxsLAoKTGUgMTkvMDYvMjAyNSDDoCAxNjo0OCwgQWxleCBCZW5uw6llIGEgw6lj
cml0wqA6Cj4gVG8gcnVuIHRoZSB0ZXN0cyB3ZSBuZWVkIGEgc3lzdGVtIFFFTVUsIHRpbWVvdXQs
IGdldGNvbmYgYW5kIG5tYXAtbmNhdAo+IHNvIHVwZGF0ZSB0aGUgZGVwZW5kcyBmb3IgdGhlbS4K
Ck9rIHNvLCB0aGV5IGFyZSBydW50aW1lIGRlcGVuZGVuY2llcyB0aGVuLgoKPiAKPiBTaWduZWQt
b2ZmLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+Cj4gLS0tCj4gVE9E
TzoKPiAgIC0gdGhlcmUgZG9lc24ndCBzZWVtIHRvIGJlIGEgd2F5IHRvIGRlcGVuZCBvbiB1dGls
cyBmb3IgZ2V0Y29uZgo+IC0tLQo+ICBwYWNrYWdlL2t2bS11bml0LXRlc3RzL0NvbmZpZy5pbiAg
ICAgICAgIHwgOCArKysrKysrLQo+ICBwYWNrYWdlL2t2bS11bml0LXRlc3RzL2t2bS11bml0LXRl
c3RzLm1rIHwgMSArCj4gIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uva3ZtLXVuaXQtdGVzdHMvQ29uZmlnLmlu
IGIvcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9Db25maWcuaW4KPiBpbmRleCAwMDBmNWRjZWNmLi4z
OTQ0YTIyNGYzIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uva3ZtLXVuaXQtdGVzdHMvQ29uZmlnLmlu
Cj4gKysrIGIvcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9Db25maWcuaW4KPiBAQCAtMTksNiArMTks
MTAgQEAgY29uZmlnIEJSMl9QQUNLQUdFX0tWTV9VTklUX1RFU1RTCj4gIAkjIHg4Ni02NCB3ZSB1
c2UgdGhlIGhvc3QgZ2NjIChzZWUgLm1rIGZpbGUgZm9yIGRldGFpbHMpCj4gIAlkZXBlbmRzIG9u
IEJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzRfNSB8fCAhQlIyX2kzODYKPiAgCWRlcGVuZHMg
b24gQlIyX0hPU1RBUkNIID0gIng4Nl82NCIgfHwgIUJSMl94ODZfNjQKPiArCWRlcGVuZHMgb24g
QlIyX1BBQ0tBR0VfUUVNVV9TWVNURU0gIyBmb3IgcWVtdS1zeXN0ZW0tJEFSQ0gKCldlIHVzZSAi
IyBydW50aW1lIiBhcyBrZXl3b3JkIHRvIHJlbWVtYmVyIHRoYXQncyBhIHJ1bnRpbWUgZGVwZW5k
ZW5jaWVzICh3ZSBjYW4Ka2VlcCAiZm9yIHFlbXUtc3lzdGVtLSRBUkNIIiBwYXJ0IGlmIHlvdSBw
cmVmZXIpCgpCdXQgInNlbGVjdCIga2V5d29yZCBzaG91bGQgYmUgdXNlZCBoZXJlIGluc3RlYWQg
b2YgImRlcGVuZHMgb24iLgprdm0tdW5pdC10ZXN0cyBuZWVkcyBxZW11LXN5c3RlbS0kQVJDSCB0
byB3b3JrIGJ1dCBpdCdzIG5vdCB5ZXQgYSAiYmlnIgpkZXBlbmRlbmN5IHRoYXQgdGhlIHVzZXIg
cmVhbGx5IG5lZWRzIHRvIGJlIGF3YXJlIG9mLgpCeSBzZWxlY3Rpbmcga3ZtLXVuaXQtdGVzdHMg
dGhlIHVzZXIgd2FudCBhbGwgcmVxdWlyZWQgcGFja2FnZXMgYmVpbmcgc2VsZWN0ZWQuCgpTZWUg
dGhlIG1hbnVhbDogMTguMi4zLiBDaG9vc2luZyBkZXBlbmRzIG9uIG9yIHNlbGVjdCBbMV0KCkFz
IGV4YW1wbGUsIGxpYnZpcnQgcGFja2FnZSBzZWxlY3QgQlIyX1BBQ0tBR0VfUUVNVV9TWVNURU0g
Zm9yIHRoZSBzYW1lIHJlYXNvbjoKCmNvbmZpZyBCUjJfUEFDS0FHRV9MSUJWSVJUX1FFTVUKCWJv
b2wgInFlbXUiCglkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0xJQlNFQ0NPTVBfQVJDSF9TVVBQT1JU
UyAjIGxpYnNlY2NvbXAKCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfUUVNVV9BUkNIX1NVUFBPUlRT
X1RBUkdFVAoJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF84ICMgcWVtdQou
Li4KCXNlbGVjdCBCUjJfUEFDS0FHRV9RRU1VCglzZWxlY3QgQlIyX1BBQ0tBR0VfUUVNVV9TWVNU
RU0KClsxXSBodHRwczovL2J1aWxkcm9vdC5vcmcvZG93bmxvYWRzL21hbnVhbC9tYW51YWwuaHRt
bCNfY29uZmlnX2ZpbGVzCgo+ICsJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9DT1JFVVRJTFMgIyBm
b3IgdGltZW91dAoKQWN0dWFsbHksIGJ1c3lib3ggZG9lcyBzdXBwb3J0IHRpbWVvdXQgY29tbWFu
ZCBidXQgdGhpcyBhcHBsZXQgaXMgbm90IGVuYWJsZWQgaW4Kb3VyIGRlZmF1bHQgYnVzeWJveCBk
ZWZjb25maWcuCgpDYW4geW91IHRyeSB0byBlbmFibGUgdGhlIHRpbWVvdXQgYXBwbGV0IGlmIGt2
bS11bml0LXRlc3RzIHBhY2thZ2UgaXMgZW5hYmxlZD8KClNlZSBob3cgbGVzcyBhcHBsZXQgaXMg
YWRkZWQgdG8gdGhlIGJ1c3lib3ggZGVmY29uZmlnIHdoZW4gc3lzdGVtZCBpcyB1c2VkOgpodHRw
czovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9ibG9iL21hc3Rlci9wYWNr
YWdlL2J1c3lib3gvYnVzeWJveC5taz9yZWZfdHlwZT1oZWFkcyNMMjYzCgo+ICsJZGVwZW5kcyBv
biAoQlIyX1BBQ0tBR0VfR0xJQkNfVVRJTFMgfHwgQlIyX1VDTElCQ19JTlNUQUxMX1VUSUxTKSAj
IGdldGNvbmYKCkJvdGggb3B0aW9ucyBpbXBseSBidWlsZGluZyBhIEJ1aWxkcm9vdCB0b29sY2hh
aW4gKGludGVybmFsIHRvb2xjaGFpbiBiYWNrZW5kKS4KV2l0aCB0aGF0LCB3ZSBjYW4gbm8gbG9u
Z2VyIGVuYWJsZSBrdm0tdW5pdC10ZXN0cyB3aXRoIGV4dGVybmFsIHRvb2xjaGFpbnMuCgpNYXli
ZSB3ZSBjb3VsZCBpbnN0YWxsIGdldGNvbmYgbGlrZSB3ZSBkbyBmb3IgbGRkIHRvb2wgWzJdIGJ1
dCB3aGF0IGlmIGdldGNvbmYKaXMgbWlzc2luZyBpbiB0aGUgdG9vbGNoYWluPyBJbmRlZWQgZ2V0
Y29uZiBoYW5kbGluZyBpcyBtaXNzaW5nLi4uCgpbMl0KaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxk
cm9vdC5vcmcvYnVpbGRyb290Ly0vYmxvYi9tYXN0ZXIvdG9vbGNoYWluL3Rvb2xjaGFpbi1leHRl
cm5hbC9wa2ctdG9vbGNoYWluLWV4dGVybmFsLm1rP3JlZl90eXBlPWhlYWRzI0w1NDIKCj4gKwlk
ZXBlbmRzIG9uIEJSMl9QQUNLQUdFX05NQVBfTkNBVCAjIGZvciBuY2F0CgpGb3IgbmNhdCBkZXBl
bmRlbmN5IHdlIHNob3VsZCB1c2Ugc2VsZWN0OgoJc2VsZWN0IEJSMl9QQUNLQUdFX05NQVAKCXNl
bGVjdCBCUjJfUEFDS0FHRV9OTUFQX05DQVQKCj4gIAlzZWxlY3QgQlIyX0hPU1RBUkNIX05FRURT
X0lBMzJfQ09NUElMRVIgaWYgQlIyX3g4Nl82NAo+ICAJaGVscAo+ICAJICBrdm0tdW5pdC10ZXN0
cyBpcyBhIHByb2plY3QgYXMgb2xkIGFzIEtWTS4gQXMgaXRzIG5hbWUKPiBAQCAtMzgsNiArNDIs
OCBAQCBjb25maWcgQlIyX1BBQ0tBR0VfS1ZNX1VOSVRfVEVTVFMKPiAgCj4gIAkgIGh0dHA6Ly93
d3cubGludXgta3ZtLm9yZy9wYWdlL0tWTS11bml0LXRlc3RzCj4gIAo+IC1jb21tZW50ICJrdm0t
dW5pdC10ZXN0cyBuZWVkcyBhIHRvb2xjaGFpbiB3LyBnY2MgPj0gNC41Igo+ICtjb21tZW50ICJr
dm0tdW5pdC10ZXN0cyBuZWVkcyBhIHRvb2xjaGFpbiB3LyBnY2MgPj0gNC41LCBxZW11LXN5c3Rl
bSwgdGltZW91dCwgZ2V0Y29uZiBhbmQgbmNhdCIKPiAgCWRlcGVuZHMgb24gQlIyX2kzODYKPiAg
CWRlcGVuZHMgb24gIUJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzRfNQo+ICsJZGVwZW5kcyBv
biAhKEJSMl9QQUNLQUdFX1FFTVVfU1lTVEVNICYmIEJSMl9QQUNLQUdFX0NPUkVVVElMUyAmJiBC
UjJfUEFDS0FHRV9OTUFQX05DQVQpCj4gKwlkZXBlbmRzIG9uICEoQlIyX1BBQ0tBR0VfR0xJQkNf
VVRJTFMgfHwgQlIyX1VDTElCQ19JTlNUQUxMX1VUSUxTKQo+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L2t2bS11bml0LXRlc3RzL2t2bS11bml0LXRlc3RzLm1rIGIvcGFja2FnZS9rdm0tdW5pdC10ZXN0
cy9rdm0tdW5pdC10ZXN0cy5tawo+IGluZGV4IDczZDIwZDZiMmUuLjYyMzRhOTk4NmMgMTAwNjQ0
Cj4gLS0tIGEvcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9rdm0tdW5pdC10ZXN0cy5tawo+ICsrKyBi
L3BhY2thZ2Uva3ZtLXVuaXQtdGVzdHMva3ZtLXVuaXQtdGVzdHMubWsKPiBAQCAtOSw2ICs5LDcg
QEAgS1ZNX1VOSVRfVEVTVFNfU09VUkNFID0ga3ZtLXVuaXQtdGVzdHMtdiQoS1ZNX1VOSVRfVEVT
VFNfVkVSU0lPTikudGFyLmJ6Mgo+ICBLVk1fVU5JVF9URVNUU19TSVRFID0gaHR0cHM6Ly9naXRs
YWIuY29tL2t2bS11bml0LXRlc3RzL2t2bS11bml0LXRlc3RzLy0vYXJjaGl2ZS92JChLVk1fVU5J
VF9URVNUU19WRVJTSU9OKQo+ICBLVk1fVU5JVF9URVNUU19MSUNFTlNFID0gR1BMLTIuMCwgTEdQ
TC0yLjAKPiAgS1ZNX1VOSVRfVEVTVFNfTElDRU5TRV9GSUxFUyA9IENPUFlSSUdIVCBMSUNFTlNF
Cj4gK0tWTV9VTklUX1RFU1RTX0RFUEVOREVOQ0lFUyA9IGNvcmV1dGlscyBubWFwLW5jYXQKCkZv
ciBydW50aW1lIGRlcGVuZGVuY2llcywgd2UgZG9uJ3QgbmVlZCB0byBhZGQgdGhlbSBpbiBfREVQ
RU5ERU5DSUVTIGFzIGJ1aWxkCnRpbWUgZGVwZW5kZW5jaWVzLgoKQmVzdCByZWdhcmRzLApSb21h
aW4KCgo+ICAKPiAgaWZlcSAoJChCUjJfYWFyY2g2NCkkKEJSMl9hYXJjaDY0X2JlKSx5KQo+ICBL
Vk1fVU5JVF9URVNUU19BUkNIID0gYWFyY2g2NAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
