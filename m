Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5300AC02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 08:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E508A82ADD;
	Wed,  5 Feb 2025 08:44:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZiQbrCivQapO; Wed,  5 Feb 2025 08:44:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5FF482B94
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5FF482B94;
	Wed,  5 Feb 2025 08:44:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C3616CD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 08:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BDC484148C
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 08:44:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m2c0PK0ktNiS for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 08:44:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 12B31415D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12B31415D0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 12B31415D0
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 08:44:08 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-38da72cc47bso1210805f8f.2
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 00:44:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738745047; x=1739349847;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K+48HwtIoGsELDKaAWDIqdN/gfGQSQo40WTGT2RhxiY=;
 b=ala66ao8pDR4y1JNL/Ggb9/lgQ4yQqLlIa9sUk6UAo6cUFF9qqSDC15sD44Louk+dj
 QxIWP3yM1cqYfobFhY8wm+P0kBd+Os85GKeBlGJwgC3tqosPUorAz9RFJEnz1ijmaoVy
 O/Ixie9rcBjErNFggFhm5m3ek1USqgp/08KRZ2gqkwvVL9vXXN0umGCP8gnN4C5bJQ07
 hqDNejUNp4lMtwyXhiRfLiDBsxJJRnoN3hGhwJ/5pMRDenKBZ4nz/Ynkh0pgFoOuXDHo
 Kh1yEbDjrLp9j1RgS080Fg25k7jmcehYHbxl3arRtLq9eC4cSwkETl9md6Kd+lmHeN+K
 aJIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8877Nl2F/D1g6v8XS1LeNXzoyNA6S6awQ/YEsn0g44jab8pppsmesf1+u8oCNYYJZb1PRoM8zIC0=@buildroot.org
X-Gm-Message-State: AOJu0Yw1a1BThFpdjP24RMcAyjk5fBjyG/g2INPdYk9/8zObOthvSKpq
 AfTOg3rcaFdUwsGmiFEdxQWWIvaPapgFwjn3VbtmHPgYQeJ02qZ6vu3wRPyCsGk=
X-Gm-Gg: ASbGncvcr1v9+eCFSU10GLUMTqxaj7hSP5CkLF8eC2H13CKxaVxevox7GtybJCE2u2o
 7eo8oobn5azXhrZLdkXdwtYKZvv6Ceeeye+5YfROcVOHmY+9gcCxLRelmIzySLnMOSpvitwKyG5
 VjeIjlaK7sQQLD0JNZsQyNERWSxzCG+tk5echyf//JonxH9BIyFYl0pUsow/8nhfRCwWcKe2D/3
 kRz7EVUxWbLg33slkc2lm1PGb1Pkh6m1Ub6GyGPDXvp9Aj2TlwYER7o7v2Ml5A3J1wKZ2gWCN7W
 Cg7mLYnFLN+QFs7jDkdQ/q/Z68XG1VZiRF4PGo53g5Gc2eNFAAmLVEtr
X-Google-Smtp-Source: AGHT+IGUuPp/FB1c5luXYPEwUjcDI53xtKgcRGJd3hSgEr+NQN/sb9WcmAoxjY8EE5H/IkLvJLafqQ==
X-Received: by 2002:a5d:47a8:0:b0:38a:3732:444d with SMTP id
 ffacd0b85a97d-38db48d17c6mr1156449f8f.23.1738745046973; 
 Wed, 05 Feb 2025 00:44:06 -0800 (PST)
Received: from [172.16.2.119] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38daf999747sm3451395f8f.19.2025.02.05.00.44.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 00:44:06 -0800 (PST)
Message-ID: <27cfddc7-d417-49e3-8344-1be16b5e2f9e@smile.fr>
Date: Wed, 5 Feb 2025 09:44:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay+rtone@gmail.com>,
 buildroot@buildroot.org
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Olivier Benjamin <olivier.benjamin@bootlin.com>
References: <20250204173456.201056-1-gael.portay+rtone@gmail.com>
 <20250204173456.201056-2-gael.portay+rtone@gmail.com>
Content-Language: en-US
In-Reply-To: <20250204173456.201056-2-gael.portay+rtone@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1738745047; x=1739349847; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K+48HwtIoGsELDKaAWDIqdN/gfGQSQo40WTGT2RhxiY=;
 b=cHg1AePD8fbGtDJzR31gikdqP1edkfhMS7tnhJj6hP8bdMbWtRoHX0UckcYs1SWjq/
 9Vy9XG8hqxWNOj0EaAFzMsxY3zVP5WLw9bIC7CtoC8UqsPI9AgK/3wEV1oFwpt1rRJYQ
 xxJ6j2qGTMT99zE3AKHPkqGogACRg1kESVclc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=cHg1AePD
Subject: Re: [Buildroot] [PATCH v4 1/2] package/rpi-utils: new package
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

SGVsbG8gR2HDq2wsIEFsbCwKCkxlIDA0LzAyLzIwMjUgw6AgMTg6MzQsIEdhw6tsIFBPUlRBWSBh
IMOpY3JpdMKgOgo+IFRoZSBwYWNrYWdlIHJwaS11c2VybGFuZCBoYXMgYmVlbiBtYXJrZWQgYXMg
YW5jaWVudCBhbmQgZGVwcmVjYXRlZFsxXS4KPiAKPiBUaGUgdXNlZnVsIHRvb2xzIChkdG92ZXJs
YXksIGR0bWVyZ2UsIHZjbWFpbGJveCwgdmNnZW5jbWQpIHdlcmUgbW92ZWQgdG8KPiB0aGUgcmVw
b3NpdG9yeSBycGktdXRpbHMgc2luY2UgdGhlbi4KPiAKPiBUaGlzIGFkZHMgdGhlIG5ldyBwYWNr
YWdlIHJwaS11dGlscyBhdCBsYXRlc3QgY29tbWl0IGFzIHRoZXJlIGlzIG5vCj4gdGFnZ2VkIGNv
bW1pdC4KCkJSMl9QQUNLQUdFX1JQSV9VU0VSTEFORCBpcyB1c2VkIGluIHNldmVyYWwgcGFja2Fn
ZXMuIFNpbmNlIHJwaS11dGlscyBzaG91bGQKcmVwbGFjZSBycGktdXNlcmxhbmQgbWF5YmUgaXQn
cyB0aW1lIHRvIGFsc28gdXBkYXRlIHRoZXNlcyBwYWNrYWdlcz8KCkRpZCB5b3UgY29uc2lkZXIg
bm90IG9ubHkgZGVwcmVjYXRpbmcgcnBpLXVzZXJsYW5kIGJ1dCBhIGNvbXBsZXRlIHJlcGxhY2Vt
ZW50PwoKPiAKPiBbMV06IGh0dHBzOi8vZ2l0aHViLmNvbS9yYXNwYmVycnlwaS91c2VybGFuZC9j
b21taXQvOTZhNzMzNGFlOWQ1ZmM5ZGI3YWM5MmU1OTg1MjM3N2RmNjNmMTg0OAo+IAo+IFRlc3Rl
ZC1ieTogT2xpdmllciBCZW5qYW1pbiA8b2xpdmllci5iZW5qYW1pbkBib290bGluLmNvbT4KPiBT
aWduZWQtb2ZmLWJ5OiBHYcOrbCBQT1JUQVkgPGdhZWwucG9ydGF5K3J0b25lQGdtYWlsLmNvbT4K
PiAtLS0KCldoYXQgaGFwcGVuZWQgc2luY2UgdjM/Cgo+ICBERVZFTE9QRVJTICAgICAgICAgICAg
ICAgICAgICAgICB8ICAxICsKPiAgcGFja2FnZS9Db25maWcuaW4gICAgICAgICAgICAgICAgfCAg
MSArCj4gIHBhY2thZ2UvcnBpLXV0aWxzL0NvbmZpZy5pbiAgICAgIHwgMTIgKysrKysrKysrKysr
Cj4gIHBhY2thZ2UvcnBpLXV0aWxzL3JwaS11dGlscy5oYXNoIHwgIDMgKysrCj4gIHBhY2thZ2Uv
cnBpLXV0aWxzL3JwaS11dGlscy5tayAgIHwgMTggKysrKysrKysrKysrKysrKysrCj4gIDUgZmls
ZXMgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2Fn
ZS9ycGktdXRpbHMvQ29uZmlnLmluCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3JwaS11
dGlscy9ycGktdXRpbHMuaGFzaAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9ycGktdXRp
bHMvcnBpLXV0aWxzLm1rCj4gCj4gZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJT
Cj4gaW5kZXggMmRhNWQxNzhiMi4uZmMxYmEyYWIyNyAxMDA2NDQKPiAtLS0gYS9ERVZFTE9QRVJT
Cj4gKysrIGIvREVWRUxPUEVSUwo+IEBAIC0xMjAzLDYgKzEyMDMsNyBAQCBGOglwYWNrYWdlL25n
aW54LW1vZHNlY3VyaXR5Lwo+ICBOOglHYcOrbCBQT1JUQVkgPGdhZWwucG9ydGF5K3J0b25lQGdt
YWlsLmNvbT4KPiAgRjoJYm9hcmQvcmFzcGJlcnJ5cGkvCj4gIEY6CWNvbmZpZ3MvcmFzcGJlcnJ5
cGkqCj4gK0Y6CXBhY2thZ2UvcnBpLXV0aWxzLwo+ICAKPiAgTjoJR2FvIFhpYW5nIDxoc2lhbmdr
YW9AYW9sLmNvbT4KPiAgRjoJcGFja2FnZS9lcm9mcy11dGlscy8KPiBkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9Db25maWcuaW4gYi9wYWNrYWdlL0NvbmZpZy5pbgo+IGluZGV4IGU5Yzc4OWNmZjIuLmYw
MmZlNTJmMzUgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9Db25maWcuaW4KPiArKysgYi9wYWNrYWdl
L0NvbmZpZy5pbgo+IEBAIC00NTQsNiArNDU0LDcgQEAgbWVudSAiRmlybXdhcmUiCj4gIAlzb3Vy
Y2UgInBhY2thZ2UvcW9yaXEtZm0tdWNvZGUvQ29uZmlnLmluIgo+ICAJc291cmNlICJwYWNrYWdl
L3Jjdy1zbWFyYy1zYWwyOC9Db25maWcuaW4iCj4gIAlzb3VyY2UgInBhY2thZ2UvcnBpLWZpcm13
YXJlL0NvbmZpZy5pbiIKPiArCXNvdXJjZSAicGFja2FnZS9ycGktdXRpbHMvQ29uZmlnLmluIgo+
ICAJc291cmNlICJwYWNrYWdlL3N1bnhpLWJvYXJkcy9Db25maWcuaW4iCj4gIAlzb3VyY2UgInBh
Y2thZ2UvdHM0OTAwLWZwZ2EvQ29uZmlnLmluIgo+ICAJc291cmNlICJwYWNrYWdlL3V4NTAwLWZp
cm13YXJlL0NvbmZpZy5pbiIKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9ycGktdXRpbHMvQ29uZmln
LmluIGIvcGFja2FnZS9ycGktdXRpbHMvQ29uZmlnLmluCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQK
PiBpbmRleCAwMDAwMDAwMDAwLi5hMjcyOTE2N2FhCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3Bh
Y2thZ2UvcnBpLXV0aWxzL0NvbmZpZy5pbgo+IEBAIC0wLDAgKzEsMTIgQEAKPiArY29uZmlnIEJS
Ml9QQUNLQUdFX1JQSV9VVElMUwo+ICsJYm9vbCAicnBpLXV0aWxzIgoKU2luY2UgaXQncyBvbmx5
IHVzZWZ1bGwgZm9yIHJwaSB0YXJnZXRzLCB5b3Ugc2hvdWxkIGtlZXAgdGhlIGFyY2hpdGVjdHVy
ZQpkZXBlbmRlbmNpZXMgKGF0IGxlYXN0KToKCglkZXBlbmRzIG9uIEJSMl9hcm0gfHwgQlIyX2Fh
cmNoNjQKCk90aGVyd2lzZSwgaXQgbG9va3Mgb2suCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4g
KwlkZXBlbmRzIG9uICFCUjJfU1RBVElDX0xJQlMgIyBkdGMKPiArCXNlbGVjdCBCUjJfUEFDS0FH
RV9EVEMKPiArCWhlbHAKPiArCSAgQSBjb2xsZWN0aW9uIG9mIHNjcmlwdHMgYW5kIHNpbXBsZSBh
cHBsaWNhdGlvbnMgZm9yIHRoZQo+ICsJICBSYXNwYmVycnkgUGkuCj4gKwo+ICsJICBodHRwczov
L2dpdGh1Yi5jb20vcmFzcGJlcnJ5cGkvdXRpbHMvCj4gKwo+ICtjb21tZW50ICJycGktdXRpbHMg
bmVlZHMgYSB0b29sY2hhaW4gdy8gZHluYW1pYyBsaWJyYXJ5Igo+ICsJZGVwZW5kcyBvbiBCUjJf
U1RBVElDX0xJQlMKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9ycGktdXRpbHMvcnBpLXV0aWxzLmhh
c2ggYi9wYWNrYWdlL3JwaS11dGlscy9ycGktdXRpbHMuaGFzaAo+IG5ldyBmaWxlIG1vZGUgMTAw
NjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uYTY2MTIzNzNiMAo+IC0tLSAvZGV2L251bGwKPiArKysg
Yi9wYWNrYWdlL3JwaS11dGlscy9ycGktdXRpbHMuaGFzaAo+IEBAIC0wLDAgKzEsMyBAQAo+ICsj
IExvY2FsbHkgY29tcHV0ZWQKPiArc2hhMjU2ICBjMzU5MzJlNTAxYjQzZTVmYjQ4Y2ZjNDg4YWFk
YzRhOGJiY2ViMGU5ZTZkYWZkZjZjN2NkMjA2NmI1OGFjZDYxICBycGktdXRpbHMtYTFkNTIyZjBm
MWI1MDg1OGE0NGZhYzgwNTIzYTJiZDgwMDk4ZTc4OS50YXIuZ3oKPiArc2hhMjU2ICA3MzFkYTk1
NjQzMWQxYTdjNTA3M2U3ZWU1ZWJlMDFmNTRlMzU5YzUzMzkzMTBiMzJmMDg5M2M2ZmU2NTA3ZDVh
ICBMSUNFTkNFCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcnBpLXV0aWxzL3JwaS11dGlscy5tayBi
L3BhY2thZ2UvcnBpLXV0aWxzL3JwaS11dGlscy5tawo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4g
aW5kZXggMDAwMDAwMDAwMC4uNDlkYjNhZWY5Zgo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNr
YWdlL3JwaS11dGlscy9ycGktdXRpbHMubWsKPiBAQCAtMCwwICsxLDE4IEBACj4gKyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjCj4gKyMKPiArIyBycGktdXRpbHMKPiArIwo+ICsjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIwo+ICsKPiArUlBJX1VUSUxTX1ZFUlNJT04gPSBhMWQ1MjJmMGYxYjUwODU4YTQ0
ZmFjODA1MjNhMmJkODAwOThlNzg5Cj4gK1JQSV9VVElMU19TSVRFID0gJChjYWxsIGdpdGh1Yixy
YXNwYmVycnlwaSx1dGlscywkKFJQSV9VVElMU19WRVJTSU9OKSkKPiArUlBJX1VUSUxTX0xJQ0VO
U0UgPSBCU0QtMy1DbGF1c2UKPiArUlBJX1VUSUxTX0xJQ0VOU0VfRklMRVMgPSBMSUNFTkNFCj4g
K1JQSV9VVElMU19JTlNUQUxMX1NUQUdJTkcgPSBZRVMKPiArUlBJX1VUSUxTX0RFUEVOREVOQ0lF
UyA9IGR0Ywo+ICsKPiArIyBFbnN1cmUgdGhlIGludGVybmFsIGR0b3ZsIHJlbWFpbnMgYW4gYXJj
aGl2ZSBvYmplY3QgYW5kIGl0IGlzIG5vdCBidWlsdCBhcyBhCj4gKyMgZHluYW1pYyBsaWJyYXJ5
IHRoYXQgaXMgbGlua2VkIGJ5IG90aGVyIHV0aWxpdGllczsgYXMgaXQgaXMgbm90IGluc3RhbGxl
ZC4KPiArUlBJX1VUSUxTX0NPTkZfT1BUUyA9IC1EU1RBVElDPVNUQVRJQwo+ICsKPiArJChldmFs
ICQoY21ha2UtcGFja2FnZSkpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
