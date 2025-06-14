Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF98C71141
	for <buildroot@archiver.kernel.org>; Sat, 14 Jun 2025 12:47:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AAD781069;
	Sat, 14 Jun 2025 12:47:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0sn4-FaLzRHz; Sat, 14 Jun 2025 12:47:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A4188107D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A4188107D;
	Sat, 14 Jun 2025 12:47:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4ED781A4
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 12:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32217606BD
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 12:47:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3QSKqb3iJR4Y for <buildroot@buildroot.org>;
 Sat, 14 Jun 2025 12:47:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E86C8605B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E86C8605B1
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E86C8605B1
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 12:47:24 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a575a988f9so315090f8f.0
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 05:47:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749905243; x=1750510043;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bNp/TrAe4yk9QmzonB6Z4br3WhHl8UoxlYTePaVXfcU=;
 b=YzOi2CN3AHYVPKwG9eIoXn4VTa5k5ZmyapvSG7dbtqX1CWRR4H3kt54z5cy0lHNPn3
 v0M/X1XIGXxBvdgGmWjzJ2vOZPC0KwkxWzrhXdXjwOqQzlle0tqNR2Q3e8qKQ75k8i+o
 DXgpRYATFMgvMMnJ59pyLOqWy/14Emp59k5olg5yfQhzYdyAJuXn0Dj+XVS/LZ1IiFR6
 cbP6eoXMkg+Ra2qhEY1DsN+8vBgcD6jsfeUy9nWyjUOAOAsykjIdeLFa46iHZE9YTCxa
 a+/VpcK7VW/B5slevgURK7piZhB528id/3CvKman9iw4GX0zOL4O+yzOrHnbZFL6sr2Y
 dQlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUV8Bu9A/GDKvkBREJJLWdJY5tLHkK30DsXtYojQ2QLlozrALLbqL5XZGOD9penWo5359TP9oAfHOM=@buildroot.org
X-Gm-Message-State: AOJu0YxIB6oE6vlfvKzLm3N7Lpr3vTaVSCPBCoa/aEg6SwBwk3k7gPt6
 bYWbeNvsrO+ZglddAuSJ1DGLqyvCK7g4wcxVvclefrT2dxDu+xMmfYfoD4W5lVLsBa4=
X-Gm-Gg: ASbGncsKyAaLY4TattU9hbjlkaO+DSN1li2C7/tX9iekUA5mPpziNgBmrvnsGUfyEGb
 x2l1W6gVJn0My3Qe4cf8ZX5ci+H7pi6BEhKQ8bn2P8W0Cpu6Nn6WvGsN4K7huMkNUb2RzePnW82
 62WWnnUu36i4OlTFXSIONRpXvSqCod2DXhSgpImIh0cX+c+SNYIkODAOwI8HBjP2p1xYxp7k3Ry
 xiEsXCZIZ4DmyGqUW954CRtdnkdvbEnajVH41+op+0foyn0m9RIZCNBByJFag4AioYCJvfcWOCU
 iOrH27XKE2gcFRhbOmnCZROT59m8p76rPycet9OzzMgD04pg0q+UiU0X3h5hXd7Yrho1FKKLNGp
 7OcIFUNZ33yobmYiYFGPNa0nOFNU6FhXuobtBCacZXDbLPDfa7VaCHfGh94VgxP8NjlPRnldbPc
 7S8Bnb24Od0XEFofsGY3oR3i2D
X-Google-Smtp-Source: AGHT+IHcw8zEdPKeEyD8+7GClyoLz+HSLlUHnB1rLBowdaA5dnJmOT/8CRd1Z8gbMzjh7Y0tgNvUNA==
X-Received: by 2002:a05:6000:2486:b0:3a5:2465:c0c8 with SMTP id
 ffacd0b85a97d-3a5723978aamr2735111f8f.7.1749905242710; 
 Sat, 14 Jun 2025 05:47:22 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568b1eb9bsm5136211f8f.69.2025.06.14.05.47.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Jun 2025 05:47:22 -0700 (PDT)
Message-ID: <9de6b23e-d4bb-4e94-9dae-b1224357a040@smile.fr>
Date: Sat, 14 Jun 2025 14:47:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Dick Olsson <hi@senzilla.io>
References: <20250607-loongarch-v2-0-90bc4fda9080@flygoat.com>
 <20250607-loongarch-v2-1-90bc4fda9080@flygoat.com>
Content-Language: fr
In-Reply-To: <20250607-loongarch-v2-1-90bc4fda9080@flygoat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1749905243; x=1750510043; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bNp/TrAe4yk9QmzonB6Z4br3WhHl8UoxlYTePaVXfcU=;
 b=iJb9g0Bq6JW/DK33NVVI6zkOBqEhBiMUnhHdxSagODXwdTqtG3WF5DNVpdio9aGkst
 vJ3g8g1erh7P6RZemVkpYkBfQSpcij4Ca5Js+bSGRAYnAJ/kyqccT44AL+fT33cuMSQO
 pT8sj+YenEMfEPih00cNRi2klbmB8yyVZ1fEo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=iJb9g0Bq
Subject: Re: [Buildroot] [PATCH v2 1/9] package/gcc: Introduce
 BR2_GCC_TARGET_SIMD option
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
IMOpY3JpdMKgOgo+IEludHJvZHVjZSBCUjJfR0NDX1RBUkdFVF9TSU1EIGZvciBnY2MgdG8gaGFu
ZGxlIC0td2l0aC1zaW1kLy1tc2ltZAo+IHByZXNlbnQgYXQgbG9vbmdhcmNoJ3MgZ2NjIG9wdGlv
bnMuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmlheHVuIFlhbmcgPGppYXh1bi55YW5nQGZseWdvYXQu
Y29tPgoKUmV2aWV3ZWQtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgoK
QmVzdCByZWdhcmRzLApSb21haW4KCgo+IC0tLQo+IHYyOiBBZGQgbWlzc2luZyB0b29sY2hhaW4g
d3JhcHBlciBjb2RlCj4gLS0tCj4gIGFyY2gvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8IDYgKysrKysrCj4gIGFyY2gvYXJjaC5tayAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEgKwo+ICBwYWNrYWdlL2djYy9nY2Mu
bWsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCA0ICsrKysKPiAgdG9vbGNo
YWluL3Rvb2xjaGFpbi1leHRlcm5hbC9wa2ctdG9vbGNoYWluLWV4dGVybmFsLm1rIHwgNCArKysr
Cj4gIHRvb2xjaGFpbi90b29sY2hhaW4td3JhcHBlci5jICAgICAgICAgICAgICAgICAgICAgICAg
ICB8IDMgKysrCj4gIDUgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYg
LS1naXQgYS9hcmNoL0NvbmZpZy5pbiBiL2FyY2gvQ29uZmlnLmluCj4gaW5kZXggNmI1NGM2NWRm
OWNjNzQzMGU5ZDk5ZTBkZDllMjlmZWYzY2M1MjdlNC4uZWM3MjBlNzRlMTkzMDIxZWQwMTc0OTk0
NWFlZDE0NTdlYzA3ODlhMSAxMDA2NDQKPiAtLS0gYS9hcmNoL0NvbmZpZy5pbgo+ICsrKyBiL2Fy
Y2gvQ29uZmlnLmluCj4gQEAgLTM0OSw2ICszNDksMTIgQEAgY29uZmlnIEJSMl9HQ0NfVEFSR0VU
X0ZQVQo+ICBjb25maWcgQlIyX0dDQ19UQVJHRVRfRkxPQVRfQUJJCj4gIAlzdHJpbmcKPiAgCj4g
KyMgVGhlIHZhbHVlIG9mIHRoaXMgb3B0aW9uIHdpbGwgYmUgcGFzc2VkIGFzIC0td2l0aC1zaW1k
PTx2YWx1ZT4gd2hlbgo+ICsjIGJ1aWxkaW5nIGdjYyAoaW50ZXJuYWwgYmFja2VuZCkgb3IgLXNp
bWQ9PHZhbHVlPiBpbiB0aGUgdG9vbGNoYWluCj4gKyMgd3JhcHBlciAoZXh0ZXJuYWwgdG9vbGNo
YWluKQo+ICtjb25maWcgQlIyX0dDQ19UQVJHRVRfU0lNRAo+ICsJc3RyaW5nCj4gKwo+ICAjIFRo
ZSB2YWx1ZSBvZiB0aGlzIG9wdGlvbiB3aWxsIGJlIHBhc3NlZCBhcyAtLXdpdGgtbW9kZT08dmFs
dWU+IHdoZW4KPiAgIyBidWlsZGluZyBnY2MgKGludGVybmFsIGJhY2tlbmQpIG9yIC1tPHZhbHVl
PiBpbiB0aGUgdG9vbGNoYWluCj4gICMgd3JhcHBlciAoZXh0ZXJuYWwgdG9vbGNoYWluKQo+IGRp
ZmYgLS1naXQgYS9hcmNoL2FyY2gubWsgYi9hcmNoL2FyY2gubWsKPiBpbmRleCA0MTc0ZDMzZGY1
NDhiMGY3YmM3NTRjODkwNzYxNDJjNDFmZTNmODY3Li40YTc4NTFhOWZkY2ViYzQ3MjA0MTVmNWIw
ZmJhNzcxYmI0OTkzZWY2IDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJjaC5tawo+ICsrKyBiL2FyY2gv
YXJjaC5tawo+IEBAIC0xNiw2ICsxNiw3IEBAIEdDQ19UQVJHRVRfRlAzMl9NT0RFIDo9ICQoY2Fs
bCBxc3RyaXAsJChCUjJfR0NDX1RBUkdFVF9GUDMyX01PREUpKQo+ICBHQ0NfVEFSR0VUX0NQVSA6
PSAkKGNhbGwgcXN0cmlwLCQoQlIyX0dDQ19UQVJHRVRfQ1BVKSkKPiAgR0NDX1RBUkdFVF9GUFUg
Oj0gJChjYWxsIHFzdHJpcCwkKEJSMl9HQ0NfVEFSR0VUX0ZQVSkpCj4gIEdDQ19UQVJHRVRfRkxP
QVRfQUJJIDo9ICQoY2FsbCBxc3RyaXAsJChCUjJfR0NDX1RBUkdFVF9GTE9BVF9BQkkpKQo+ICtH
Q0NfVEFSR0VUX1NJTUQgOj0gJChjYWxsIHFzdHJpcCwkKEJSMl9HQ0NfVEFSR0VUX1NJTUQpKQo+
ICBHQ0NfVEFSR0VUX01PREUgOj0gJChjYWxsIHFzdHJpcCwkKEJSMl9HQ0NfVEFSR0VUX01PREUp
KQo+ICAKPiAgIyBFeHBsaWNpdGx5IHNldCBMRCdzICJtYXgtcGFnZS1zaXplIiBpbnN0ZWFkIG9m
IHJlbHlpbmcgb24gc29tZSBkZWZhdWx0cwo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2djYy9nY2Mu
bWsgYi9wYWNrYWdlL2djYy9nY2MubWsKPiBpbmRleCA2NThmNWE2YjRmZTIxZmIzMDIzMzNmY2Zm
MzAxMmU2MjRjZTI0MWE3Li5lYTk2Mjg2YzMyMmY2YWFjMGFkMjZhZDYzM2RiNmI3M2M1NDRkYWMw
IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvZ2NjL2djYy5tawo+ICsrKyBiL3BhY2thZ2UvZ2NjL2dj
Yy5tawo+IEBAIC0yNTEsNiArMjUxLDEwIEBAIGlmbmVxICgkKEdDQ19UQVJHRVRfRkxPQVRfQUJJ
KSwpCj4gIEhPU1RfR0NDX0NPTU1PTl9DT05GX09QVFMgKz0gLS13aXRoLWZsb2F0PSQoR0NDX1RB
UkdFVF9GTE9BVF9BQkkpCj4gIGVuZGlmCj4gIAo+ICtpZm5lcSAoJChHQ0NfVEFSR0VUX1NJTUQp
LCkKPiArSE9TVF9HQ0NfQ09NTU9OX0NPTkZfT1BUUyArPSAtLXdpdGgtc2ltZD0kKEdDQ19UQVJH
RVRfU0lNRCkKPiArZW5kaWYKPiArCj4gIGlmbmVxICgkKEdDQ19UQVJHRVRfTU9ERSksKQo+ICBI
T1NUX0dDQ19DT01NT05fQ09ORl9PUFRTICs9IC0td2l0aC1tb2RlPSQoR0NDX1RBUkdFVF9NT0RF
KQo+ICBlbmRpZgo+IGRpZmYgLS1naXQgYS90b29sY2hhaW4vdG9vbGNoYWluLWV4dGVybmFsL3Br
Zy10b29sY2hhaW4tZXh0ZXJuYWwubWsgYi90b29sY2hhaW4vdG9vbGNoYWluLWV4dGVybmFsL3Br
Zy10b29sY2hhaW4tZXh0ZXJuYWwubWsKPiBpbmRleCBjMDhiZjBhNjUzOTE4MzNkZTg0MGMyZjVj
YTExMmJiMGI3ODAyNDcxLi4yYzJhZmE3NmMwNjkyMDM4OWYxMDU5NWRkYmVjYjllMDQ1NWNlY2Nl
IDEwMDY0NAo+IC0tLSBhL3Rvb2xjaGFpbi90b29sY2hhaW4tZXh0ZXJuYWwvcGtnLXRvb2xjaGFp
bi1leHRlcm5hbC5tawo+ICsrKyBiL3Rvb2xjaGFpbi90b29sY2hhaW4tZXh0ZXJuYWwvcGtnLXRv
b2xjaGFpbi1leHRlcm5hbC5tawo+IEBAIC0yMTcsNiArMjE3LDEwIEBAIGlmbmVxICgkKEdDQ19U
QVJHRVRfRkxPQVRfQUJJKSwpCj4gIFRPT0xDSEFJTl9FWFRFUk5BTF9DRkxBR1MgKz0gLW1mbG9h
dC1hYmk9JChHQ0NfVEFSR0VUX0ZMT0FUX0FCSSkKPiAgVE9PTENIQUlOX0VYVEVSTkFMX1RPT0xD
SEFJTl9XUkFQUEVSX0FSR1MgKz0gLURCUl9GTE9BVF9BQkk9JyIkKEdDQ19UQVJHRVRfRkxPQVRf
QUJJKSInCj4gIGVuZGlmCj4gK2lmbmVxICgkKEdDQ19UQVJHRVRfU0lNRCksKQo+ICtUT09MQ0hB
SU5fRVhURVJOQUxfQ0ZMQUdTICs9IC1tc2ltZD0kKEdDQ19UQVJHRVRfU0lNRCkKPiArVE9PTENI
QUlOX0VYVEVSTkFMX1RPT0xDSEFJTl9XUkFQUEVSX0FSR1MgKz0gLURCUl9TSU1EPSciJChHQ0Nf
VEFSR0VUX1NJTUQpIicKPiArZW5kaWYKPiAgaWZuZXEgKCQoR0NDX1RBUkdFVF9NT0RFKSwpCj4g
IFRPT0xDSEFJTl9FWFRFUk5BTF9DRkxBR1MgKz0gLW0kKEdDQ19UQVJHRVRfTU9ERSkKPiAgVE9P
TENIQUlOX0VYVEVSTkFMX1RPT0xDSEFJTl9XUkFQUEVSX0FSR1MgKz0gLURCUl9NT0RFPSciJChH
Q0NfVEFSR0VUX01PREUpIicKPiBkaWZmIC0tZ2l0IGEvdG9vbGNoYWluL3Rvb2xjaGFpbi13cmFw
cGVyLmMgYi90b29sY2hhaW4vdG9vbGNoYWluLXdyYXBwZXIuYwo+IGluZGV4IGU2NDRjMWU3YmI5
MDZjYWEyNGVhNjczYTg2NWM5MzRmOTA5NGEwMzAuLmE2OTc0YmE3OGY4YTUzNTM1YzZjZDY1MTdl
MWFmMWJiNWVjMTI0MzEgMTAwNjQ0Cj4gLS0tIGEvdG9vbGNoYWluL3Rvb2xjaGFpbi13cmFwcGVy
LmMKPiArKysgYi90b29sY2hhaW4vdG9vbGNoYWluLXdyYXBwZXIuYwo+IEBAIC03NCw2ICs3NCw5
IEBAIHN0YXRpYyBjaGFyICpwcmVkZWZfYXJnc1tdID0gewo+ICAjaWZkZWYgQlJfU09GVEZMT0FU
Cj4gIAkiLW1zb2Z0LWZsb2F0IiwKPiAgI2VuZGlmIC8qIEJSX1NPRlRGTE9BVCAqLwo+ICsjaWZk
ZWYgQlJfU0lNRAo+ICsJIi1tc2ltZD0iIEJSX1NJTUQsCj4gKyNlbmRpZgo+ICAjaWZkZWYgQlJf
TU9ERQo+ICAJIi1tIiBCUl9NT0RFLAo+ICAjZW5kaWYKPiAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
