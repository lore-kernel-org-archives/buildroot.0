Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 826BCC02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 14:37:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EEC180BD9;
	Wed,  5 Feb 2025 14:37:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9QqWVYBJ4TDn; Wed,  5 Feb 2025 14:37:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F83080CAB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F83080CAB;
	Wed,  5 Feb 2025 14:37:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 59202CD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 14:37:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4840480E4F
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 14:37:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dxB482ohaWyl for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 14:37:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 18B6480BD9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18B6480BD9
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 18B6480BD9
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 14:37:18 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4361b0ec57aso69338555e9.0
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 06:37:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738766237; x=1739371037;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EnocDAi9SkxamzUObM/KUZXSeRYzivis8/Dn2gL+XzE=;
 b=O6MuwlHzhUqPpHfcQCjYE65Cote2tcHX0gFWX6H9w5d/kGKEAtWE5rKK8KihmJfOKr
 IMzmxEALC/ioO0UeVfoklh4NiTe994hepiSD47Nx5c0x/oWfHTUUvEGTNBjVSudDTu3Z
 k2YzwLIZ9nNu2i/CzzXUhkarAfYCqi4SIh/z51BVTzcAus0Z/yGAUtgC8Z7/OQzrHSLo
 zsVUKjGcUE7pJYhqCOvyo8SMNFzMQvcQAeOj0CK2/E20Vyg0zFcgK0HzfQmauemMGx3p
 dFsNgR5hh0qMBppNX6mFvgQCiZilkEFjCHs723V5+XpYESUecnK4HlXaeJWfoIXTXpig
 DkNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVU0kT7RcQ6JRhK1orKmNA8DuPnyKy/UtReF8Pa9tH+pu0Oh6uWbmb1EX6qvy5OAkALjFnhY0/m5bc=@buildroot.org
X-Gm-Message-State: AOJu0Yy+sqokMgjdIJtL+DeyJGhyVBC/zrTYjA/lt39nErMbJmq0TC3d
 eizyQyBTjhasufpHSSLAuuVVAVi5OeU7Mm0St3YP6Ymw1V85Eih+/i5CmUjHc4g=
X-Gm-Gg: ASbGncvVLl4hlPniQsBIl2mG+69HjLNpTLWznO+x2D8XAqQNS8aXVrHi/jzskRBWt9t
 FlDodzkos4h+od+9w1SmSLp1sv1c8T8Xjfyyi8yGuK19JKh3gg4lrJodup8ZsADI+ZjhaUeldRU
 YFAEtAQs/xqwzbl5apEB2PnSRyZ5ANMAgN6z+7/L5T8lvlD8A3OdJv7genz90AQy7VEPQP1XScq
 AlWXT1HUV8CHbEKHTaz+WYoXQIrPaT5P5lOrTcQl//QPXJxnBVpEHJnPs4LpvsHcJnXUAAGm0nd
 zUdTapm35BthzrG2Rz2grX+eXhiRkhmVqNDsjnpbv9msOWoMqQDDvVIs
X-Google-Smtp-Source: AGHT+IGf6WRb972NyWDykcBRpsRJ23KFKz+rheGAKZ1hjcpHorqcPzCuB9Vr2EA2xp4fxEuQPDBZBg==
X-Received: by 2002:a5d:5987:0:b0:386:2d40:a192 with SMTP id
 ffacd0b85a97d-38db493e813mr1860567f8f.34.1738766236912; 
 Wed, 05 Feb 2025 06:37:16 -0800 (PST)
Received: from [172.16.2.119] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390db10b17sm22610215e9.34.2025.02.05.06.37.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 06:37:16 -0800 (PST)
Message-ID: <1e37e958-0635-4535-a9b8-650387797234@smile.fr>
Date: Wed, 5 Feb 2025 15:37:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Vladimir Oltean <olteanv@gmail.com>, buildroot@buildroot.org
Cc: Brandon Maier <Brandon.Maier@collins.com>,
 Rabeeh Khoury <rabeeh@solid-run.com>, Josua Mayer <josua@solid-run.com>,
 Ioana Ciornei <ciorneiioana@gmail.com>
References: <20241208143802.1048266-1-olteanv@gmail.com>
 <20241208143802.1048266-3-olteanv@gmail.com>
Content-Language: fr
In-Reply-To: <20241208143802.1048266-3-olteanv@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1738766237; x=1739371037; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EnocDAi9SkxamzUObM/KUZXSeRYzivis8/Dn2gL+XzE=;
 b=lywTuY6yETKeyHnn+LPKvodNVcIrXh2ZyI5bbUAF3GtynG4b+2bJEclan0j5XVahO8
 tdzhRCJdmOj9x6x+RhlMTbdDS4O7EH9OpoqgSduHOcfNRjeW8+r+nv8EFLnat5e25kkv
 b953qRSekZGxA7Gpojy8ciwD9fqqpJkRvmaUU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=lywTuY6y
Subject: Re: [Buildroot] [PATCH v2 02/11] package/qoriq-ddr-phy-binary: new
 package
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

SGVsbG8sCgpMZSAwOC8xMi8yMDI0IMOgIDE1OjM3LCBWbGFkaW1pciBPbHRlYW4gYSDDqWNyaXTC
oDoKPiBUaGUgRERSIFBIWSBvbiB0aGUgTlhQIExYMjE2MEEgU29DIG5lZWRzIGZpcm13YXJlLiBU
aGlzIGlzIGRpc3RyaWJ1dGVkCj4gYXMgcHJlYnVpbHQgYmluYXJpZXMgYnkgTlhQIHRocm91Z2gg
R2l0SHViLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFZsYWRpbWlyIE9sdGVhbiA8b2x0ZWFudkBnbWFp
bC5jb20+CgpSZXZpZXdlZC1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+
CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gLS0tCj4gdjEtPnYyOiBub25lCj4gCj4gIERFVkVM
T1BFUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMyArKysKPiAgcGFj
a2FnZS9Db25maWcuaW4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKPiAgcGFj
a2FnZS9xb3JpcS1kZHItcGh5LWJpbmFyeS9Db25maWcuaW4gICAgICAgICB8ICA2ICsrKysrKwo+
ICAuLi4vcW9yaXEtZGRyLXBoeS1iaW5hcnkuaGFzaCAgICAgICAgICAgICAgICAgIHwgIDMgKysr
Cj4gIC4uLi9xb3JpcS1kZHItcGh5LWJpbmFyeS5tayAgICAgICAgICAgICAgICAgICAgfCAxOCAr
KysrKysrKysrKysrKysrKysKPiAgNSBmaWxlcyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspCj4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3FvcmlxLWRkci1waHktYmluYXJ5L0NvbmZpZy5p
bgo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9xb3JpcS1kZHItcGh5LWJpbmFyeS9xb3Jp
cS1kZHItcGh5LWJpbmFyeS5oYXNoCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3Fvcmlx
LWRkci1waHktYmluYXJ5L3FvcmlxLWRkci1waHktYmluYXJ5Lm1rCj4gCj4gZGlmZiAtLWdpdCBh
L0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJTCj4gaW5kZXggYWVkZDczNjc3MjU3Li4wMjYwZmM1MmU0
ZTMgMTAwNjQ0Cj4gLS0tIGEvREVWRUxPUEVSUwo+ICsrKyBiL0RFVkVMT1BFUlMKPiBAQCAtMzMw
MSw2ICszMzAxLDkgQEAgTjoJVml2aWVuIERpZGVsb3QgPHZpdmllbi5kaWRlbG90QGdtYWlsLmNv
bT4KPiAgRjoJYm9hcmQvdGVjaG5vbG9naWMvdHM1NTAwLwo+ICBGOgljb25maWdzL3RzNTUwMF9k
ZWZjb25maWcKPiAgCj4gK046CVZsYWRpbWlyIE9sdGVhbiA8b2x0ZWFudkBnbWFpbC5jb20+Cj4g
K0Y6CXBhY2thZ2UvcW9yaXEtZGRyLXBoeS1iaW5hcnkvCj4gKwo+ICBOOglWb2xrb3YgVmlhY2hl
c2xhdiA8c3Y5OUBpbmJveC5ydT4KPiAgRjoJcGFja2FnZS92NGwyZ3JhYi8KPiAgRjoJcGFja2Fn
ZS96YmFyLwo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL0NvbmZpZy5pbiBiL3BhY2thZ2UvQ29uZmln
LmluCj4gaW5kZXggMWViNWUxZTAyMDhmLi41M2UzMTcwZWEwZjYgMTAwNjQ0Cj4gLS0tIGEvcGFj
a2FnZS9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL0NvbmZpZy5pbgo+IEBAIC00NTQsNiArNDU0
LDcgQEAgbWVudSAiRmlybXdhcmUiCj4gIAlzb3VyY2UgInBhY2thZ2UvbXVyYXRhLWN5dy1mdy9D
b25maWcuaW4iCj4gIAlzb3VyY2UgInBhY2thZ2Uvb2Ryb2lkYzItZmlybXdhcmUvQ29uZmlnLmlu
Igo+ICAJc291cmNlICJwYWNrYWdlL3Fjb20tZGI0MTBjLWZpcm13YXJlL0NvbmZpZy5pbiIKPiAr
CXNvdXJjZSAicGFja2FnZS9xb3JpcS1kZHItcGh5LWJpbmFyeS9Db25maWcuaW4iCj4gIAlzb3Vy
Y2UgInBhY2thZ2UvcW9yaXEtZm0tdWNvZGUvQ29uZmlnLmluIgo+ICAJc291cmNlICJwYWNrYWdl
L3Jjdy1zbWFyYy1zYWwyOC9Db25maWcuaW4iCj4gIAlzb3VyY2UgInBhY2thZ2UvcnBpLWZpcm13
YXJlL0NvbmZpZy5pbiIKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9xb3JpcS1kZHItcGh5LWJpbmFy
eS9Db25maWcuaW4gYi9wYWNrYWdlL3FvcmlxLWRkci1waHktYmluYXJ5L0NvbmZpZy5pbgo+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi4zMDFhMmMxOTc0MjEKPiAt
LS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9xb3JpcS1kZHItcGh5LWJpbmFyeS9Db25maWcu
aW4KPiBAQCAtMCwwICsxLDYgQEAKPiArY29uZmlnIEJSMl9QQUNLQUdFX1FPUklRX0REUl9QSFlf
QklOQVJZCj4gKwlib29sICJxb3JpcS1kZHItcGh5LWJpbmFyeSIKPiArCWhlbHAKPiArCSAgRmly
bXdhcmUgYmluYXJ5IGZvciBERFIgUEhZIG9mIE5YUCBMWDIxNjBBIGZhbWlseSBvZiBTb0NzLgo+
ICsKPiArCSAgaHR0cHM6Ly9naXRodWIuY29tL254cC1xb3JpcS9kZHItcGh5LWJpbmFyeQo+IGRp
ZmYgLS1naXQgYS9wYWNrYWdlL3FvcmlxLWRkci1waHktYmluYXJ5L3FvcmlxLWRkci1waHktYmlu
YXJ5Lmhhc2ggYi9wYWNrYWdlL3FvcmlxLWRkci1waHktYmluYXJ5L3FvcmlxLWRkci1waHktYmlu
YXJ5Lmhhc2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uNzM1
N2U3NDFmY2ZhCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvcW9yaXEtZGRyLXBoeS1i
aW5hcnkvcW9yaXEtZGRyLXBoeS1iaW5hcnkuaGFzaAo+IEBAIC0wLDAgKzEsMyBAQAo+ICsjIExv
Y2FsbHkgY2FsY3VsYXRlZAo+ICtzaGEyNTYgIGI0OWNiMzRmOTQxZjdlNTM0ZWMzMWQzZDE0ZDE4
ZDRlNTY1ZTQ4NzViNjkwZWNiMGQ3ZTI5OTJiNzJjNjRkYzcgIHFvcmlxLWRkci1waHktYmluYXJ5
LWxmLTYuNi4zNi0yLjEuMC50YXIuZ3oKPiArc2hhMjU2ICA3YTIyMzAzMWQ3NjMzOWRmMGU0ZTVh
OTRkMTkzYTI3MGZiOTk2M2Q0MmI1NzdhYTQyZmUxMzBhNDY1N2YzZTE3ICBOWFAtQmluYXJ5LUVV
TEEudHh0Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcW9yaXEtZGRyLXBoeS1iaW5hcnkvcW9yaXEt
ZGRyLXBoeS1iaW5hcnkubWsgYi9wYWNrYWdlL3FvcmlxLWRkci1waHktYmluYXJ5L3FvcmlxLWRk
ci1waHktYmluYXJ5Lm1rCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAw
MDAuLmFiMjVmZjU0MWQ5Ywo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL3FvcmlxLWRk
ci1waHktYmluYXJ5L3FvcmlxLWRkci1waHktYmluYXJ5Lm1rCj4gQEAgLTAsMCArMSwxOCBAQAo+
ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICsjCj4gKyMgcW9yaXEtZGRyLXBoeS1iaW5hcnkK
PiArIwo+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICsKPiArUU9SSVFfRERSX1BIWV9CSU5B
UllfVkVSU0lPTiA9IGxmLTYuNi4zNi0yLjEuMAo+ICtRT1JJUV9ERFJfUEhZX0JJTkFSWV9TSVRF
ID0gJChjYWxsIGdpdGh1YixueHAtcW9yaXEsZGRyLXBoeS1iaW5hcnksJChRT1JJUV9ERFJfUEhZ
X0JJTkFSWV9WRVJTSU9OKSkKPiArUU9SSVFfRERSX1BIWV9CSU5BUllfTElDRU5TRSA9IE5YUCBC
aW5hcnkgRVVMQQo+ICtRT1JJUV9ERFJfUEhZX0JJTkFSWV9MSUNFTlNFX0ZJTEVTID0gTlhQLUJp
bmFyeS1FVUxBLnR4dAo+ICtRT1JJUV9ERFJfUEhZX0JJTkFSWV9JTlNUQUxMX0lNQUdFUyA9IFlF
Uwo+ICtRT1JJUV9ERFJfUEhZX0JJTkFSWV9JTlNUQUxMX1RBUkdFVCA9IE5PCj4gKwo+ICtkZWZp
bmUgUU9SSVFfRERSX1BIWV9CSU5BUllfSU5TVEFMTF9JTUFHRVNfQ01EUwo+ICsJJChJTlNUQUxM
KSAtRCAkKEBEKS9seDIxNjBhL2ZpcF9kZHIuYmluICQoQklOQVJJRVNfRElSKS9maXBfZGRyLmJp
bgo+ICtlbmRlZgo+ICsKPiArJChldmFsICQoZ2VuZXJpYy1wYWNrYWdlKSkKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
