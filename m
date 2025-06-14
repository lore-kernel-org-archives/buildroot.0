Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B069C71135
	for <buildroot@archiver.kernel.org>; Sat, 14 Jun 2025 12:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC427607B2;
	Sat, 14 Jun 2025 12:54:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RP5FMN4GcAs4; Sat, 14 Jun 2025 12:54:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7F6E6080F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7F6E6080F;
	Sat, 14 Jun 2025 12:54:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B8FA1A4
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 12:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E521B60ACC
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 12:54:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4G-6MJIBdrrZ for <buildroot@buildroot.org>;
 Sat, 14 Jun 2025 12:54:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7915A60631
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7915A60631
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7915A60631
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 12:54:07 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-442f9043f56so17437295e9.0
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 05:54:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749905645; x=1750510445;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RQI1pqvU8bPSP0ZAsf/odMCVfhe62m8YhuzES6Pq99o=;
 b=nrNO4qFsXAJ60GEQo9y7Jn/ZQioPkalvUvcKfogYNArCodWLDZIJCaiEE2ljurE7r2
 9/57diePQZQmZZvXrbikswWgrHKGwGfeW9nGjCS8acnFcWM1jIdI/DQC0tsUYLRb5cMU
 X8KXECtjGQIaXY7LLkFFCE/v6fE2CEjEYdMyo1J4dBjuakIV323K7dSE85jSWMahrCSW
 IkPZMOlnXSlu3+bRhn/++36w18DbXfP6PPRe+DN1ACD+vdhB4zXRPxoplaCkeaVXaa6h
 9LT4RSdVuzwsjiQ3txWKeOPG19kGVh+aw1gv5gEy9BbLOgdYZC60mYRgz9b6v9qKwXAA
 trAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYqzysZf1k0TDPCXMwmyZa7YyjHbg4QvUTTMha9jpR5IZIsLGnnH7nRmLpMq3YypyPjBLnRen/I08=@buildroot.org
X-Gm-Message-State: AOJu0YyoGLeps5njKZJMbyxb2EuwCN0JQRbvglFZfECHFrijU+lTlkeP
 5Kw2OHDQLf6iNmdhSYVRGEZDKWE+lmTcBLtEZo3rpY3bYmMG5rUsvlt98i47jrHETQM=
X-Gm-Gg: ASbGncsxRK9QB3OKAH/wUWf2yQgXzHnHYIx/mAfRkWA3LWoxFWjnBLuMcjr8AYj2pFL
 LSwakPlqVps4hgx2F42/tks3Nt5w3+YBTZDHZycyuxBWFjGYvRWhrC8sh3eiYP3eB2wPZyKMT9U
 ayLfLfm1U/mXOebv5lrD9KGqb+Ug34KoPUz87v4ECY8LGk+NQBTJhTUrYcdPDzTpo8DU6cLK/fz
 c1z2IXFcxci1x1ctVhhfpRrvJMJP+H41in7osTWrfg2GMjZ9NKDAoyZR4anztSVX6TuBoySfjoi
 bk31zYXjexWT4HYYBetyqWGw6TTmB9TrWxwYUfI2i9zTOw++K3k7MJAQGpSIuvx/m91Vf2ik5NQ
 PQR3TMInqZavXzDEB9lrTl+wCVqqffNexPyujg1gaLTcWzG2GfrLBWFdgEhwHQ2H3Z+YcIzQpRd
 K3i0/530rKC0HJwi50CxXBx8Qi
X-Google-Smtp-Source: AGHT+IE352l5aefMQZT3Hr5Lpggcku9rO9jsllMUM3pHH3/51i4nxeG6cFClmOTdBzCyvvoIQyJdtA==
X-Received: by 2002:a05:600c:c0d4:b0:450:d204:34ca with SMTP id
 5b1f17b1804b1-4533cb488dcmr25753785e9.18.1749905645079; 
 Sat, 14 Jun 2025 05:54:05 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568b2f80asm5128184f8f.78.2025.06.14.05.54.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Jun 2025 05:54:04 -0700 (PDT)
Message-ID: <3807ec63-f603-4a95-9894-93ba95d6e2db@smile.fr>
Date: Sat, 14 Jun 2025 14:54:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Dick Olsson <hi@senzilla.io>
References: <20250607-loongarch-v2-0-90bc4fda9080@flygoat.com>
 <20250607-loongarch-v2-2-90bc4fda9080@flygoat.com>
Content-Language: fr
In-Reply-To: <20250607-loongarch-v2-2-90bc4fda9080@flygoat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1749905645; x=1750510445; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RQI1pqvU8bPSP0ZAsf/odMCVfhe62m8YhuzES6Pq99o=;
 b=pzYXks6ZpiYyBZ6R42Mo8gfudI6cuLma39NLrqmTX3sItQXBWUlLzRteRP8Lt82mtF
 hOjXhmhwAVckdp3TUdqzH7JR/dMDc6oboEj9Q2ORWfEWSEXfWm4sADDsEa9vO3eyX9u1
 wDPjZbrNuC+6RHEzq4OCjspiOKY0hKy15ROhQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=pzYXks6Z
Subject: Re: [Buildroot] [PATCH v2 2/9] arch: Introduce LoongArch64
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
IMOpY3JpdMKgOgo+IEludHJvZHVjZSBMb29uZ0FyY2g2NCBhdCBhcmNoaXRlY3R1cmUgbGV2ZWwu
Cj4gCj4gQ29uZmlnLmluLmxvb25nYXJjaCBpcyBwcmVwYXJlZCBmb3IgcG9zc2libGUgbG9vbmdh
cmNoMzIKPiBlbmFibGVtZW50IGluIGZ1dHVyZS4KPiAKPiBJbnRlcm5hbCB0b29sY2hhaW4gaXMg
c3VwcG9ydGVkLCBhcyBvdXIgbWluaW1hbCBiaW51dGlscwo+IHZlcnNpb24gaXMgYWxyZWFkeSBi
ZXlvbmQgTG9vbmdBcmNoIG1pbmltYWwgdmVyc2lvbiBhbmQKPiBHQ0Mgb3B0aW9uIGlzIGxpbWl0
ZWQgYnkgQlIyX0FSQ0hfTkVFRFNfR0NDX0FUX0xFQVNUXzEyLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEppYXh1biBZYW5nIDxqaWF4dW4ueWFuZ0BmbHlnb2F0LmNvbT4KPiAtLS0KPiB2MjoKPiAJLSBT
dHlsZSBmaXhlcwo+IAktIGFkZCBjb21taXQgbWVzc2FnZSBhYm91dCBpbnRlcm5hbCB0b29sY2hh
aW4KPiAtLS0KPiAgYXJjaC9Db25maWcuaW4gICAgICAgICAgIHwgIDEzICsrKysrCj4gIGFyY2gv
Q29uZmlnLmluLmxvb25nYXJjaCB8IDEyOSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDE0MiBpbnNlcnRpb25zKCspCj4g
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvQ29uZmlnLmluIGIvYXJjaC9Db25maWcuaW4KPiBpbmRleCBl
YzcyMGU3NGUxOTMwMjFlZDAxNzQ5OTQ1YWVkMTQ1N2VjMDc4OWExLi5jYzhiNzc0YTQ0ODkxM2E3
MTk1ZjBkYzEyYTFiNDUyYjZhZjgwZmQxIDEwMDY0NAo+IC0tLSBhL2FyY2gvQ29uZmlnLmluCj4g
KysrIGIvYXJjaC9Db25maWcuaW4KPiBAQCAtODAsNiArODAsMTUgQEAgY29uZmlnIEJSMl9pMzg2
Cj4gIAkgIEludGVsIGkzODYgYXJjaGl0ZWN0dXJlIGNvbXBhdGlibGUgbWljcm9wcm9jZXNzb3IK
PiAgCSAgaHR0cDovL2VuLndpa2lwZWRpYS5vcmcvd2lraS9JMzg2Cj4gIAo+ICtjb25maWcgQlIy
X2xvb25nYXJjaDY0Cj4gKwlib29sICJMb29uZ0FyY2g2NCIKPiArCXNlbGVjdCBCUjJfVVNFX01N
VQo+ICsJc2VsZWN0IEJSMl9BUkNIX0lTXzY0CgpGb3Igbm93IGFuZCB3aXRob3V0IGFueSBsaWJj
IGF2YWlsYWJsZSwgbG9vbmdhcmNoNjQgb3B0aW9uIG5lZWRzIHRvIHNlbGVjdApCUjJfQVJDSF9I
QVNfTk9fVE9PTENIQUlOX0JVSUxEUk9PVCBzaW5jZSB3ZSBjYW4ndCB5ZXQgYnVpbGQgYSBjb21w
bGV0ZQp0b29sY2hhaW4gd2l0aCBvbmx5IHRoaXMgcGF0Y2ggYXBwbGllZC4KCkluIGFkZGl0aW9u
LCB5b3Ugc2hvdWxkIGFkZCB0aGUgbWluaW1hbCBnY2MgdmVyc2lvbiBzdXBwb3J0ZWQgYnkgbG9v
bmdhcmNoNjQKZ2VuZXJpYyAoQlIyX0FSQ0hfTkVFRFNfR0NDX0FUX0xFQVNUXzEyKSBvdGhlcndp
c2UgeW91IGNvdWxkIGVuYWJsZSBsb29uZ2FyY2g2NAp3aXRob3V0IGFueSB0YXJnZXQgYXJjaGl0
ZWN0dXJlIHZhcmlhbnQuCgo+ICsJaGVscAo+ICsJICBMb29uZ0FyY2g2NCBpcyA2NC1iaXQgYXJj
aGl0ZWN0dXJlIGRldmVsb3BlZCBieSBMb29uZ3Nvbi4KPiArCSAgaHR0cDovL3d3dy5sb29uZ3Nv
bi5jbi8KPiArCSAgaHR0cHM6Ly9lbi53aWtpcGVkaWEub3JnL3dpa2kvTG9vbmdzb24KPiArCj4g
IGNvbmZpZyBCUjJfbTY4awo+ICAJYm9vbCAibTY4ayIKPiAgCSMgTU1VIHN1cHBvcnQgaXMgc2V0
IGJ5IHRoZSBzdWJhcmNoaXRlY3R1cmUgZmlsZSwgYXJjaC9Db25maWcuaW4ubTY4awo+IEBAIC0z
NzksNiArMzg4LDEwIEBAIGlmIEJSMl9hcm0gfHwgQlIyX2FybWViIHx8IEJSMl9hYXJjaDY0IHx8
IEJSMl9hYXJjaDY0X2JlCj4gIHNvdXJjZSAiYXJjaC9Db25maWcuaW4uYXJtIgo+ICBlbmRpZgo+
ICAKPiAraWYgQlIyX2xvb25nYXJjaDY0Cj4gK3NvdXJjZSAiYXJjaC9Db25maWcuaW4ubG9vbmdh
cmNoIgo+ICtlbmRpZgo+ICsKPiAgaWYgQlIyX202OGsKPiAgc291cmNlICJhcmNoL0NvbmZpZy5p
bi5tNjhrIgo+ICBlbmRpZgo+IGRpZmYgLS1naXQgYS9hcmNoL0NvbmZpZy5pbi5sb29uZ2FyY2gg
Yi9hcmNoL0NvbmZpZy5pbi5sb29uZ2FyY2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4
IDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAuLmU1MzQzMmFiNTBhMTUw
ODE4YTBhNGI4Y2NlYWJlZWVlYTUwNWJlNjkKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvYXJjaC9D
b25maWcuaW4ubG9vbmdhcmNoCj4gQEAgLTAsMCArMSwxMjkgQEAKPiArIyBMb29uZ0FyY2ggQ1BV
Cj4gKwo+ICtjaG9pY2UKPiArCXByb21wdCAiVGFyZ2V0IEFyY2hpdGVjdHVyZSBWYXJpYW50Igo+
ICsJZGVmYXVsdCBCUjJfbG9vbmdhcmNoNjRfZ2VuZXJpYwo+ICsKPiArY29uZmlnIEJSMl9sb29u
Z2FyY2g2NF9nZW5lcmljCj4gKwlib29sICJHZW5lcmljIExvb25nQXJjaCA2NC1iaXQiCj4gKwlk
ZXBlbmRzIG9uIEJSMl9BUkNIX0lTXzY0Cj4gKwlzZWxlY3QgQlIyX0FSQ0hfTkVFRFNfR0NDX0FU
X0xFQVNUXzEyCgpUaGlzIGNhbiBiZSBtb3ZlZCB1bmRlciBCUjJfbG9vbmdhcmNoNjQuCgpCZXN0
IHJlZ2FyZHMsClJvbWFpbgoKCj4gKwloZWxwCj4gKwkgIEdlbmVyaWMgTG9vbmdBcmNoIDY0LWJp
dCBwcm9jZXNzb3IuCj4gKwo+ICtjb25maWcgQlIyX2xvb25nYXJjaDY0X3YxXzAKPiArCWJvb2wg
Ikxvb25nQXJjaDY0IElTQSB2ZXJzaW9uIDEuMCIKPiArCWRlcGVuZHMgb24gQlIyX0FSQ0hfSVNf
NjQKPiArCXNlbGVjdCBCUjJfQVJDSF9ORUVEU19HQ0NfQVRfTEVBU1RfMTMKPiArCWhlbHAKPiAr
CSAgTG9vbmdBcmNoNjQgSVNBIHZlcnNpb24gMS4wIHByb2Nlc3Nvci4KPiArCj4gK2NvbmZpZyBC
UjJfbG9vbmdhcmNoNjRfdjFfMQo+ICsJYm9vbCAiTG9vbmdBcmNoNjQgSVNBIHZlcnNpb24gMS4x
Igo+ICsJZGVwZW5kcyBvbiBCUjJfQVJDSF9JU182NAo+ICsJc2VsZWN0IEJSMl9BUkNIX05FRURT
X0dDQ19BVF9MRUFTVF8xMwo+ICsJaGVscAo+ICsJICBMb29uZ0FyY2g2NCBJU0EgdmVyc2lvbiAx
LjEgcHJvY2Vzc29yLgo+ICsKPiArZW5kY2hvaWNlCj4gKwo+ICtjaG9pY2UKPiArCXByb21wdCAi
RlBVIFR5cGUiCj4gKwlkZWZhdWx0IEJSMl9MT09OR0FSQ0hfRlBVXzY0Cj4gKwo+ICtjb25maWcg
QlIyX0xPT05HQVJDSF9GUFVfNjQKPiArCWJvb2wgIjY0Igo+ICsJaGVscAo+ICsJICBBbGxvdyB0
aGUgdXNlIG9mIGhhcmR3YXJlIGZsb2F0aW5nLXBvaW50IGluc3RydWN0aW9ucyBmb3IKPiArCSAg
MzItYml0IGFuZCA2NC1iaXQgb3BlcmF0aW9ucy4KPiArCj4gK2NvbmZpZyBCUjJfTE9PTkdBUkNI
X0ZQVV8zMgo+ICsJYm9vbCAiMzIiCj4gKwloZWxwCj4gKwkgIEFsbG93IHRoZSB1c2Ugb2YgaGFy
ZHdhcmUgZmxvYXRpbmctcG9pbnQgaW5zdHJ1Y3Rpb25zIGZvcgo+ICsJICAzMi1iaXQgb3BlcmF0
aW9ucyBvbmx5Lgo+ICsKPiArY29uZmlnIEJSMl9MT09OR0FSQ0hfRlBVX05PTkUKPiArCWJvb2wg
Im5vbmUiCj4gKwloZWxwCj4gKwkgIFByZXZlbnQgdGhlIHVzZSBvZiBoYXJkd2FyZSBmbG9hdGlu
Zy1wb2ludCBpbnN0cnVjdGlvbnMuCj4gK2VuZGNob2ljZQo+ICsKPiArY2hvaWNlCj4gKwlwcm9t
cHQgIlNJTUQgVHlwZSIKPiArCWRlZmF1bHQgQlIyX0xPT05HQVJDSF9TSU1EX05PTkUKPiArCj4g
K2NvbmZpZyBCUjJfTE9PTkdBUkNIX1NJTURfTk9ORQo+ICsJYm9vbCAibm9uZSIKPiArCWhlbHAK
PiArCSAgUHJldmVudCB0aGUgdXNlIG9mIGhhcmR3YXJlIFNJTUQgaW5zdHJ1Y3Rpb25zLgo+ICsK
PiArY29uZmlnIEJSMl9MT09OR0FSQ0hfU0lNRF9MU1gKPiArCWJvb2wgIkxTWCIKPiArCWhlbHAK
PiArCSAgRW5hYmxlIGdlbmVyYXRpbmcgaW5zdHJ1Y3Rpb25zIGZyb20gdGhlIDEyOC1iaXQgTG9v
bmdBcmNoIFNJTUQKPiArCSAgRXh0ZW5zaW9uIChMU1gpLgo+ICsKPiArY29uZmlnIEJSMl9MT09O
R0FSQ0hfU0lNRF9MQVNYCj4gKwlib29sICJMQVNYIgo+ICsJaGVscAo+ICsJICBFbmFibGUgZ2Vu
ZXJhdGluZyBpbnN0cnVjdGlvbnMgZnJvbSB0aGUgMjU2LWJpdCBMb29uZ0FyY2gKPiArCSAgQWR2
YW5jZWQgU0lNRCBFeHRlbnNpb24gKExBU1gpIGFuZCB0aGUgMTI4LWJpdCBMb29uZ0FyY2gKPiAr
CSAgU0lNRCBFeHRlbnNpb24gKExTWCkuCj4gK2VuZGNob2ljZQo+ICsKPiArY2hvaWNlCj4gKwlw
cm9tcHQgIlRhcmdldCBBQkkiCj4gKwlkZWZhdWx0IEJSMl9MT09OR0FSQ0hfQUJJX0xQNjREIGlm
IEJSMl9BUkNIX0lTXzY0ICYmIEJSMl9MT09OR0FSQ0hfRlBVXzY0Cj4gKwlkZWZhdWx0IEJSMl9M
T09OR0FSQ0hfQUJJX0xQNjRGIGlmIEJSMl9BUkNIX0lTXzY0ICYmIEJSMl9MT09OR0FSQ0hfRlBV
XzMyCj4gKwlkZWZhdWx0IEJSMl9MT09OR0FSQ0hfQUJJX0xQNjRTIGlmIEJSMl9BUkNIX0lTXzY0
ICYmIEJSMl9MT09OR0FSQ0hfU0lNRF9OT05FCj4gKwo+ICtjb25maWcgQlIyX0xPT05HQVJDSF9B
QklfTFA2NEQKPiArCWJvb2wgImxwNjRkIgo+ICsJZGVwZW5kcyBvbiBCUjJfQVJDSF9JU182NAo+
ICsJZGVwZW5kcyBvbiBCUjJfTE9PTkdBUkNIX0ZQVV82NAo+ICsKPiArY29uZmlnIEJSMl9MT09O
R0FSQ0hfQUJJX0xQNjRGCj4gKwlib29sICJscDY0ZiIKPiArCWRlcGVuZHMgb24gQlIyX0FSQ0hf
SVNfNjQKPiArCWRlcGVuZHMgb24gQlIyX0xPT05HQVJDSF9GUFVfNjQgfHwgQlIyX0xPT05HQVJD
SF9GUFVfMzIKPiArCj4gK2NvbmZpZyBCUjJfTE9PTkdBUkNIX0FCSV9MUDY0Uwo+ICsJYm9vbCAi
bHA2NGQiCj4gKwlkZXBlbmRzIG9uIEJSMl9BUkNIX0lTXzY0Cj4gK2VuZGNob2ljZQo+ICsKPiAr
Y29uZmlnIEJSMl9BUkNICj4gKwlkZWZhdWx0ICJsb29uZ2FyY2g2NCIgaWYgQlIyX0FSQ0hfSVNf
NjQKPiArCj4gK2NvbmZpZyBCUjJfTk9STUFMSVpFRF9BUkNICj4gKwlkZWZhdWx0ICJsb29uZ2Fy
Y2giCj4gKwo+ICtjb25maWcgQlIyX0VORElBTgo+ICsJZGVmYXVsdCAiTElUVExFIgo+ICsKPiAr
Y29uZmlnIEJSMl9HQ0NfVEFSR0VUX0FSQ0gKPiArCWRlZmF1bHQgImxvb25nYXJjaDY0IiBpZiBC
UjJfbG9vbmdhcmNoNjRfZ2VuZXJpYwo+ICsJZGVmYXVsdCAibGE2NHYxLjAiIGlmIEJSMl9sb29u
Z2FyY2g2NF92MV8wCj4gKwlkZWZhdWx0ICJsYTY0djEuMSIgaWYgQlIyX2xvb25nYXJjaDY0X3Yx
XzEKPiArCj4gK2NvbmZpZyBCUjJfR0NDX1RBUkdFVF9GUFUKPiArCWRlZmF1bHQgIjY0IiBpZiBC
UjJfTE9PTkdBUkNIX0ZQVV82NAo+ICsJZGVmYXVsdCAiMzIiIGlmIEJSMl9MT09OR0FSQ0hfRlBV
XzMyCj4gKwlkZWZhdWx0ICJub25lIiBpZiBCUjJfTE9PTkdBUkNIX0ZQVV9OT05FCj4gKwo+ICtj
b25maWcgQlIyX0dDQ19UQVJHRVRfU0lNRAo+ICsJZGVmYXVsdCAibGFzeCIgaWYgQlIyX0xPT05H
QVJDSF9TSU1EX0xBU1gKPiArCWRlZmF1bHQgImxzeCIgaWYgQlIyX0xPT05HQVJDSF9TSU1EX0xT
WAo+ICsJZGVmYXVsdCAibm9uZSIgaWYgQlIyX0xPT05HQVJDSF9GUFVfTk9ORQo+ICsKPiArY29u
ZmlnIEJSMl9HQ0NfVEFSR0VUX0FCSQo+ICsJZGVmYXVsdCAibHA2NGQiIGlmIEJSMl9MT09OR0FS
Q0hfQUJJX0xQNjRECj4gKwlkZWZhdWx0ICJscDY0ZiIgaWYgQlIyX0xPT05HQVJDSF9BQklfTFA2
NEYKPiArCWRlZmF1bHQgImxwNjRzIiBpZiBCUjJfTE9PTkdBUkNIX0FCSV9MUDY0Uwo+ICsKPiAr
Y29uZmlnIEJSMl9SRUFERUxGX0FSQ0hfTkFNRQo+ICsJZGVmYXVsdCAiTG9vbmdBcmNoIgo+ICsK
PiArIyB2aW06IGZ0PWtjb25maWcKPiArIyAtKi0gbW9kZTprY29uZmlnOyAtKi0KPiAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
