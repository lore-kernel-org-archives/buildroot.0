Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E118C02196
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 09:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7B18607A4;
	Wed,  5 Feb 2025 09:52:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4fYXeSjk7NbJ; Wed,  5 Feb 2025 09:52:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C474660F96
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C474660F96;
	Wed,  5 Feb 2025 09:52:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CCF4ACD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 09:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0FC383704
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 09:52:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4_Ryanm8zKt5 for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 09:52:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E8C22836F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8C22836F1
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E8C22836F1
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 09:52:39 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-38632b8ae71so5451371f8f.0
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 01:52:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738749158; x=1739353958;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KxsVumXEqbP+rOtQdRm2cCSRQzL8TWDPe3XMAt5YIxc=;
 b=BEf4U7i6XLIcKcnOdBMm6+l8HCitV95Ag3GFRgtuTElDrbhuNrmB0/gMtaoVHOzDIp
 k3PDXr63EDSyhxnoIJxFT6GovGFOXePYjr35bZn/joa58Jaxn07Q0tv+2pm2OLUGhvxC
 viMGvMcI12kMYcxO8y/oyp2Z6FwLh4A1buy2O5/0ueXmRuFuue4FXuECIttT7c+TbtVZ
 bZUEbTpl/sxReQ4zYTyofw9YOH52eptcAHafkg06CM5QbWDe2EYsD2Kh84XMvcwz50Td
 ApDoYXe6AJeqN8Kd6e0aAupP9i4ifbSA+2SywrLENxylQOCwTvlMAqKd4OAhtrzoFTFy
 0qpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLfaaY2cowe5g5kATum+OfUV7OWMynhqgmS8AWRkgbeIa01K9Eo4BOTvMgRzl+9HYguSEd5whd+Bc=@buildroot.org
X-Gm-Message-State: AOJu0YyShDvKlK1Ltk1lhFwZ71HKjV8PaaAixQSD2bbHKG9Qe1pD8Zmm
 cHlYO6ecBUscVxtBmkQooufV0KvzLCa7XtaUupfegJWlpgBeIifHjez8FPgDKtnEXhnQVC3+32i
 zyWg=
X-Gm-Gg: ASbGncuedw8l4Txewj9GXID7vT2KgyThfJCxkvJo7iWXS+nZw7cIyvD4jtfYc6pkLtQ
 ipKTYG1AzNKZ2TjpS9RvoNEub7bNN9jtps3mMILhOSn380ZBQToe3x11/3gzbvxzYIQbqC9qLfN
 9FFvn9NgQq/vA70h8rG0YT6bmf3Z50B2FMpXNLe2HBcQvakA2aPXEFirs5FK9GLP5xT2sEkzRcY
 CQdBusd+frCOhEHoFn7MAEbkQLu7DDjSkQKcrlpGgRZkPxOKc4Ulz0uKBU7ic7SMRHfEgYxXcQ8
 UYTj4HEJV9OGphTc6mKSZr9YFWOKcxXoFDr0/7XT1AqgIaQUdIscyDMw
X-Google-Smtp-Source: AGHT+IFUC2+2fG4skjgSiaho4i9AZEW079bPaOpSXYy/PCpAqtQp7dOl4Nax3o88hreffQTfccdMKw==
X-Received: by 2002:a5d:6c66:0:b0:38d:ada6:f259 with SMTP id
 ffacd0b85a97d-38db48a9b18mr1334100f8f.4.1738749157553; 
 Wed, 05 Feb 2025 01:52:37 -0800 (PST)
Received: from [172.16.2.119] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390d94da8asm15606225e9.13.2025.02.05.01.52.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 01:52:37 -0800 (PST)
Message-ID: <ec08b385-3fca-4224-ac8e-f57acdb1780f@smile.fr>
Date: Wed, 5 Feb 2025 10:52:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay+rtone@gmail.com>,
 buildroot@buildroot.org
Cc: Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>
References: <20250203172342.2831824-1-gael.portay+rtone@gmail.com>
Content-Language: en-US
In-Reply-To: <20250203172342.2831824-1-gael.portay+rtone@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1738749158; x=1739353958; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KxsVumXEqbP+rOtQdRm2cCSRQzL8TWDPe3XMAt5YIxc=;
 b=rAgurvQtL+66fLOrw+shJ1InLn+baxgf9gopLJxFJC43MCn9CuXYGRKqXr8tE/x+tI
 BycIlH4E+S/XzAp3yX03Dx4EwRVjRoIbLA8NLLl4FCytV+8t7NBccfG9cUOYculW4kvi
 IELvHeDJ65UfW4v1Z/OlyuDOk8ecBg66d+ynA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=rAgurvQt
Subject: Re: [Buildroot] [PATCH v4 1/1] configs/raspberrypizero2w_64: new
 defconfig
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

SGVsbG8gR2HDq2wsIEFsbCwKCkxlIDAzLzAyLzIwMjUgw6AgMTg6MjMsIEdhw6tsIFBPUlRBWSBh
IMOpY3JpdMKgOgo+IFRoaXMgY29uZmlndXJhdGlvbiBidWlsZHMgYW4gaW1hZ2UgZm9yIHRoZSBS
YXNwYmVycnkgUGkgWmVybyAyIFcKPiAoNjQtYml0KS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBHYcOr
bCBQT1JUQVkgPGdhZWwucG9ydGF5K3J0b25lQGdtYWlsLmNvbT4KPiAtLS0KPiBIZWxsbywKPiAK
PiBUaGlzIHBhdGNoIHNlcmllIGFkZHMgdGhlIGRlZmNvbmZpZyB0byBidWlsZCBhbiBpbWFnZSBm
b3IgdGhlIFJhc3BiZXJyeQo+IFBpIFplcm8gMiBXICg2NC1iaXQpLgo+IAo+IFRoZSBmaXJzdCBw
YXRjaCBhZGRzIG15c2VsZiBhcyBkZXZlbG9wZXIgZm9yIGV2ZXJ5IHJhc3BiZXJyeXBpCj4gZGVm
Y29uZmlncy4KPiAKPiBUaGUgc2Vjb25kIGFuZCBsYXN0IHBhdGNoIGFkZHMgdGhlIGRlZmNvbmZp
Zy4KPiAKPiAgICAgIyB1bmFtZSAtYQo+ICAgICBMaW51eCBidWlsZHJvb3QgNi42LjI4LXY4ICMx
IFNNUCBQUkVFTVBUIE1vbiBGZWIgIDMgMTg6MDY6MjYgQ0VUIDIwMjUgYWFyY2g2NCBHTlUvTGlu
dXgKPiAgICAgIyBjYXQgL3N5cy9maXJtd2FyZS9kZXZpY2V0cmVlL2Jhc2UvY29tcGF0aWJsZSAK
PiAgICAgcmFzcGJlcnJ5cGksbW9kZWwtemVyby0yLXdicmNtLGJjbTI4MzcjIAo+IAo+IENoYW5n
ZXMgc2luY2UgdjE6Cj4gIC0gQWRkIHBhdGNoIHRvIHJlbW92ZSB1bm5lY2Vzc2FyeSBzeW1saW5r
cwo+ICAtIEFkZCBwYXRjaCB0byBhZGQgbXlzZWxmIGFzIGRldmVsb3BlciBmb3IgZXZlcnkgcmFz
cGJlcnJ5cGkKPiAgLSBSZW1vdmUgbWVyZ2VkIHBhdGNoIHJld29yZGluZyBjb25zb2xlIGNvbW1l
bnQKPiAgLSBSZXRpdGxlIGNvbW1pdCBtZXNzYWdlIGNvcnJlY3RseQo+IAo+IENoYW5nZXMgc2lu
Y2UgdjI6Cj4gIC0gUmVtb3ZlIHBhdGNoIHRvIHJlbW92ZSBhY3R1YWxseSB1c2VkIHN5bWxpbmtz
Cj4gIC0gVXNlIHJhc3BlcnJ5cGl6ZXJvMnctNjQgc3ltbGluayBpbiBkZWZjb25maWcKPiAgLSBS
ZWdlbmVyYXRlIGRlZmNvbmZpZyB0byByZW1vdmUgYW5ub3RhdGlvbnMKPiAKPiBDaGFuZ2VzIHNp
bmNlIHYzOgo+ICAtIFJlbW92ZSBtZXJnZWQgcGF0Y2ggYWRkaW5nIG15c2VsZiBhcyBkZXZlbG9w
ZXIgZm9yIGV2ZXJ5IHJhc3BiZXJyeXBpCj4gIC0gQWRkIG5vdGUgaW4gdGhlIGRvY3VtZW50YXRp
b24KPiAgLSBVc2UgZXh0ZXJuYWwgQm9vdGxpbiBnbGliYyBzdGFibGUgdG9vbGNoYWluCj4gCj4g
UmVnYXJkcywKPiBHYcOrbCBQT1JUQVkgKDIpOgo+ICAgREVWRUxPUEVSUzogYWRkIG15c2VsZiBh
cyBkZXZlbG9wZXIgZm9yIHJhc3BiZXJyeXBpCj4gICBjb25maWdzL3Jhc3BiZXJyeXBpemVybzJ3
XzY0OiBuZXcgZGVmY29uZmlnCj4gCj4gIGJvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ196ZXJvMndf
NjRiaXQudHh0IHwgMjkgKysrKysrKysrKysrKysrKysrKysKPiAgYm9hcmQvcmFzcGJlcnJ5cGkv
cmVhZG1lLnR4dCAgICAgICAgICAgICAgfCAgNCArKysKPiAgYm9hcmQvcmFzcGJlcnJ5cGl6ZXJv
MnctNjQgICAgICAgICAgICAgICAgfCAgMSArCj4gIGNvbmZpZ3MvcmFzcGJlcnJ5cGl6ZXJvMndf
NjRfZGVmY29uZmlnICAgIHwgMzIgKysrKysrKysrKysrKysrKysrKysrKysKPiAgNCBmaWxlcyBj
aGFuZ2VkLCA2NiBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBib2FyZC9yYXNw
YmVycnlwaS9jb25maWdfemVybzJ3XzY0Yml0LnR4dAo+ICBjcmVhdGUgbW9kZSAxMjAwMDAgYm9h
cmQvcmFzcGJlcnJ5cGl6ZXJvMnctNjQKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGNvbmZpZ3MvcmFz
cGJlcnJ5cGl6ZXJvMndfNjRfZGVmY29uZmlnCj4gCj4gZGlmZiAtLWdpdCBhL2JvYXJkL3Jhc3Bi
ZXJyeXBpL2NvbmZpZ196ZXJvMndfNjRiaXQudHh0IGIvYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmln
X3plcm8yd182NGJpdC50eHQKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAw
MDAuLmJiZDhiNjkzNjMKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvYm9hcmQvcmFzcGJlcnJ5cGkv
Y29uZmlnX3plcm8yd182NGJpdC50eHQKPiBAQCAtMCwwICsxLDI5IEBACj4gKyMgUGxlYXNlIG5v
dGUgdGhhdCB0aGlzIGlzIG9ubHkgYSBzYW1wbGUsIHdlIHJlY29tbWVuZCB5b3UgdG8gY2hhbmdl
IGl0IHRvIGZpdAo+ICsjIHlvdXIgbmVlZHMuCj4gKyMgWW91IHNob3VsZCBvdmVycmlkZSB0aGlz
IGZpbGUgdXNpbmcgQlIyX1BBQ0tBR0VfUlBJX0ZJUk1XQVJFX0NPTkZJR19GSUxFLgo+ICsjIFNl
ZSBodHRwOi8vYnVpbGRyb290Lm9yZy9tYW51YWwuaHRtbCNyb290ZnMtY3VzdG9tCj4gKyMgYW5k
IGh0dHA6Ly9lbGludXgub3JnL1JQaWNvbmZpZyBmb3IgYSBkZXNjcmlwdGlvbiBvZiBjb25maWcu
dHh0IHN5bnRheAo+ICsKPiArc3RhcnRfZmlsZT1zdGFydC5lbGYKPiArZml4dXBfZmlsZT1maXh1
cC5kYXQKPiArCj4gK2tlcm5lbD1JbWFnZQo+ICsKPiArIyBUbyB1c2UgYW4gZXh0ZXJuYWwgaW5p
dHJhbWZzIGZpbGUKPiArI2luaXRyYW1mcyByb290ZnMuY3Bpby5nego+ICsKPiArIyBEaXNhYmxl
IG92ZXJzY2FuIGFzc3VtaW5nIHRoZSBkaXNwbGF5IHN1cHBvcnRzIGRpc3BsYXlpbmcgdGhlIGZ1
bGwgcmVzb2x1dGlvbgo+ICsjIElmIHRoZSB0ZXh0IHNob3duIG9uIHRoZSBzY3JlZW4gZGlzYXBw
ZWFycyBvZmYgdGhlIGVkZ2UsIGNvbW1lbnQgdGhpcyBvdXQKPiArZGlzYWJsZV9vdmVyc2Nhbj0x
Cj4gKwo+ICsjIEhvdyBtdWNoIG1lbW9yeSBpbiBNQiB0byBhc3NpZ24gdG8gdGhlIEdQVSBvbiBQ
aSBtb2RlbHMgaGF2aW5nCj4gKyMgMjU2LCA1MTIgb3IgMTAyNCBNQiB0b3RhbCBtZW1vcnkKPiAr
Z3B1X21lbV8yNTY9MTAwCj4gK2dwdV9tZW1fNTEyPTEwMAo+ICtncHVfbWVtXzEwMjQ9MTAwCj4g
Kwo+ICsjIEVuYWJsZSBVQVJUMCBmb3Igc2VyaWFsIGNvbnNvbGUgb24gdHR5QU1BMAo+ICtkdG92
ZXJsYXk9bWluaXVhcnQtYnQKPiArCj4gKyMgZW5hYmxlIDY0Yml0cyBzdXBwb3J0Cj4gK2FybV82
NGJpdD0xCj4gZGlmZiAtLWdpdCBhL2JvYXJkL3Jhc3BiZXJyeXBpL3JlYWRtZS50eHQgYi9ib2Fy
ZC9yYXNwYmVycnlwaS9yZWFkbWUudHh0Cj4gaW5kZXggODFjZDgxYTdmMy4uNjRmMGUyYTI2ZiAx
MDA2NDQKPiAtLS0gYS9ib2FyZC9yYXNwYmVycnlwaS9yZWFkbWUudHh0Cj4gKysrIGIvYm9hcmQv
cmFzcGJlcnJ5cGkvcmVhZG1lLnR4dAo+IEBAIC0zNyw2ICszNywxMCBAQCBGb3IgbW9kZWwgWmVy
byAyIFcgKG1vZGVsIEIzIGluIHNtYWxsZXIgZm9ybSBmYWN0b3IpOgo+ICAKPiAgICAkIG1ha2Ug
cmFzcGJlcnJ5cGl6ZXJvMndfZGVmY29uZmlnCj4gIAo+ICtGb3IgbW9kZWwgWmVybyAyIFcgKG1v
ZGVsIEIzIGluIHNtYWxsZXIgZm9ybSBmYWN0b3IsIDY0LWJpdCk6Cj4gKwo+ICsgICQgbWFrZSBy
YXNwYmVycnlwaXplcm8yd182NF9kZWZjb25maWcKPiArCj4gIEZvciBtb2RlbCAyIEI6Cj4gIAo+
ICAgICQgbWFrZSByYXNwYmVycnlwaTJfZGVmY29uZmlnCj4gZGlmZiAtLWdpdCBhL2JvYXJkL3Jh
c3BiZXJyeXBpemVybzJ3LTY0IGIvYm9hcmQvcmFzcGJlcnJ5cGl6ZXJvMnctNjQKPiBuZXcgZmls
ZSBtb2RlIDEyMDAwMAo+IGluZGV4IDAwMDAwMDAwMDAuLmZjZGFmYzgxZWQKPiAtLS0gL2Rldi9u
dWxsCj4gKysrIGIvYm9hcmQvcmFzcGJlcnJ5cGl6ZXJvMnctNjQKPiBAQCAtMCwwICsxIEBACj4g
K3Jhc3BiZXJyeXBpCj4gXCBObyBuZXdsaW5lIGF0IGVuZCBvZiBmaWxlCj4gZGlmZiAtLWdpdCBh
L2NvbmZpZ3MvcmFzcGJlcnJ5cGl6ZXJvMndfNjRfZGVmY29uZmlnIGIvY29uZmlncy9yYXNwYmVy
cnlwaXplcm8yd182NF9kZWZjb25maWcKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAw
MDAwMDAwMDAuLmRjYjg0NzI2NzEKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvY29uZmlncy9yYXNw
YmVycnlwaXplcm8yd182NF9kZWZjb25maWcKPiBAQCAtMCwwICsxLDMyIEBACj4gK0JSMl9hYXJj
aDY0PXkKPiArQlIyX0FSTV9GUFVfVkZQVjQ9eQo+ICtCUjJfVE9PTENIQUlOX0VYVEVSTkFMPXkK
PiArQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9CT09UTElOPXkKPiArQlIyX1RPT0xDSEFJTl9FWFRF
Uk5BTF9CT09UTElOX0FBUkNINjRfR0xJQkNfU1RBQkxFPXkKPiArQlIyX0dMT0JBTF9QQVRDSF9E
SVI9ImJvYXJkL3Jhc3BiZXJyeXBpL3BhdGNoZXMiCj4gK0JSMl9ET1dOTE9BRF9GT1JDRV9DSEVD
S19IQVNIRVM9eQo+ICtCUjJfUk9PVEZTX1BPU1RfQlVJTERfU0NSSVBUPSJib2FyZC9yYXNwYmVy
cnlwaXplcm8ydy02NC9wb3N0LWJ1aWxkLnNoIgo+ICtCUjJfUk9PVEZTX1BPU1RfSU1BR0VfU0NS
SVBUPSJib2FyZC9yYXNwYmVycnlwaXplcm8ydy02NC9wb3N0LWltYWdlLnNoIgo+ICtCUjJfTElO
VVhfS0VSTkVMPXkKPiArQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVEFSQkFMTD15Cj4gK0JSMl9M
SU5VWF9LRVJORUxfQ1VTVE9NX1RBUkJBTExfTE9DQVRJT049IiQoY2FsbCBnaXRodWIscmFzcGJl
cnJ5cGksbGludXgsNTc2Y2MxMGUxZWQ1MGE5ZWFjZmZjN2EwNWM3OTYwNTFkNzM0M2VhNCkvbGlu
dXgtNTc2Y2MxMGUxZWQ1MGE5ZWFjZmZjN2EwNWM3OTYwNTFkNzM0M2VhNC50YXIuZ3oiCj4gK0JS
Ml9MSU5VWF9LRVJORUxfREVGQ09ORklHPSJiY21ycGkzIgoKVGhlIG5hbWUgcmFzcGJlcnJ5cGl6
ZXJvMiB1c2luZyBhIGRlZmNvbmZpZyBuYW1tZWQgYmNtcnBpMyBpcyBjb25mdXNpbmcgYXQgZmly
c3QKZ2xhbmNlIGJ1dCBhY3R1YWxseSBhbiByYXNwYmVycnlwaSBtb2RlbCBaZXJvIDIgVyBpcyBi
YXNlZCBvbiBtb2RlbCBCMyBpbgpzbWFsbGVyIGZvcm0gZmFjdG9yLCA2NC1iaXQuCgpTZWU6Cmh0
dHBzOi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcvbWV0YS1yYXNwYmVycnlwaS90cmVlL2NvbmYvbWFj
aGluZS9yYXNwYmVycnlwaTAtMnctNjQuY29uZgoKCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3Mu
CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gK0JSMl9MSU5VWF9LRVJORUxfRFRTX1NVUFBPUlQ9
eQo+ICtCUjJfTElOVVhfS0VSTkVMX0lOVFJFRV9EVFNfTkFNRT0iYnJvYWRjb20vYmNtMjcxMC1y
cGktemVyby0yLXciCj4gK0JSMl9MSU5VWF9LRVJORUxfTkVFRFNfSE9TVF9PUEVOU1NMPXkKPiAr
QlIyX1BBQ0tBR0VfQlVTWUJPWF9TSE9XX09USEVSUz15Cj4gK0JSMl9QQUNLQUdFX1haPXkKPiAr
QlIyX1BBQ0tBR0VfUlBJX0ZJUk1XQVJFPXkKPiArQlIyX1BBQ0tBR0VfUlBJX0ZJUk1XQVJFX0JP
T1RDT0RFX0JJTj15Cj4gK0JSMl9QQUNLQUdFX1JQSV9GSVJNV0FSRV9WQVJJQU5UX1BJPXkKPiAr
QlIyX1BBQ0tBR0VfUlBJX0ZJUk1XQVJFX0NPTkZJR19GSUxFPSJib2FyZC9yYXNwYmVycnlwaXpl
cm8ydy02NC9jb25maWdfemVybzJ3XzY0Yml0LnR4dCIKPiArQlIyX1BBQ0tBR0VfS01PRD15Cj4g
K0JSMl9QQUNLQUdFX0tNT0RfVE9PTFM9eQo+ICtCUjJfVEFSR0VUX1JPT1RGU19FWFQyPXkKPiAr
QlIyX1RBUkdFVF9ST09URlNfRVhUMl80PXkKPiArQlIyX1RBUkdFVF9ST09URlNfRVhUMl9TSVpF
PSIxMjBNIgo+ICsjIEJSMl9UQVJHRVRfUk9PVEZTX1RBUiBpcyBub3Qgc2V0Cj4gK0JSMl9QQUNL
QUdFX0hPU1RfRE9TRlNUT09MUz15Cj4gK0JSMl9QQUNLQUdFX0hPU1RfR0VOSU1BR0U9eQo+ICtC
UjJfUEFDS0FHRV9IT1NUX0tNT0RfWFo9eQo+ICtCUjJfUEFDS0FHRV9IT1NUX01UT09MUz15Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
