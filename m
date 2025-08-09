Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B2AC87FCB
	for <buildroot@archiver.kernel.org>; Sat,  9 Aug 2025 17:27:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0686960C2E;
	Sat,  9 Aug 2025 17:27:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YGPNXbTbyasO; Sat,  9 Aug 2025 17:27:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 200CF60C0F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 200CF60C0F;
	Sat,  9 Aug 2025 17:27:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B23B21D3
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 17:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3FF440B4F
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 17:27:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U-evePDdWQfR for <buildroot@buildroot.org>;
 Sat,  9 Aug 2025 17:27:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B0D8D40A47
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0D8D40A47
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B0D8D40A47
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 17:27:31 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3b78127c5d1so1950300f8f.3
 for <buildroot@buildroot.org>; Sat, 09 Aug 2025 10:27:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754760449; x=1755365249;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6vrFCwSWoGvfRL3QXbcGse1zT2/vrYFkHMVb5TIbjnM=;
 b=qHeZfhB6cl3lsiMASngkExMid/qr2KVUB0/xlBPtmJdHp/ThQjiOHRhR8vD5oKUkau
 IhzR3AJWbGIurfGtVQbdgPuaQwola6NMSCutCRJqYwFPKXXebnU14C+0+sfGBUJaW83W
 qSD1OiwGdAKKdwVOptT+IMlYa4vqHoAP5nbMFKl++d9TAxQ+uo6L/DpPr9atNvGl6kMm
 uXJNwMjSWsKgbBg4bdRxn/1jLak7rBVLahbJXc+e8XGxb+00F5N0LktpLj2Z1PHXknRp
 VaqR2E4btz1QMXfHYxxL9MULG4VsDFWr3nzFUN3qnrmX7nYEv4RIPdQJi2oke0WqrGDP
 uUbQ==
X-Gm-Message-State: AOJu0YxFIxHJydkIzZnkkDORsNNgFuLDclSTRLVdQsZX6+SHJd/+a50r
 D/TcYAayBQ4qRYeiMn0wleG1j2En8tLPV8WGgznr/C0v2d2nWoTRyMT4AwzgrkB0LK8=
X-Gm-Gg: ASbGnctNZTq/0vOaTw6Rz88r3d9+FauLs7D6NZ7KY4BTaSs6+xZun1vKv1EUeeP+aWk
 SUZX7KjUbEVQfUNes2fd+Sp0H20NE38uYwRk+POcwpShzw0+D6Rga3OQzfv3V2CQUixmtfaZ8Un
 7bNJM5OqguuSuiG5iFTizIusK8AvOV0tPybB3Yrao/ndY+9DQLpov+E9bttwR5hPXFtXeBITc1V
 Xs/bANvqIjV4Cfj+Z0vZs8t49Nc0qBNC/Tukf5TDYs+yhhoOL5o3adtA6/s175VzI7ZbwO3zFCE
 C9n4UxrWq9mdeNXjeMfjLx+OYpiLQ526tF/LxQ2mq8npgkaPPPAD+WLzXEPmOghZhCkDb61V07p
 sw0lDVPG0BtXWjyAQOr5Nn+T+2GpooNSgcXlOKZqbB/DtpeHVAUOHtxe/CfEEtzR95QjAahoSnn
 YbyZV8TB/g8enR/gd1cwSdBZVu60LgUDkwxq9i0jUfjQEbTrfwmgepf5WvKukH
X-Google-Smtp-Source: AGHT+IExJTyzTHBZIf/wjAMd3rC2c2P1CgznW/LEsOFJeyoOk+scSFy1vX4VJLu3Gst4reciwNaOAA==
X-Received: by 2002:a05:6000:4025:b0:3b7:98bc:b856 with SMTP id
 ffacd0b85a97d-3b900b50524mr5793591f8f.41.1754760449548; 
 Sat, 09 Aug 2025 10:27:29 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b8fc28a830sm10164393f8f.16.2025.08.09.10.27.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Aug 2025 10:27:28 -0700 (PDT)
Message-ID: <8d0167d1-7d6c-46fb-a754-c5f6ce013ee9@smile.fr>
Date: Sat, 9 Aug 2025 19:27:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: yann.morin@orange.com, Florian Larysch <fl@n621.de>
Cc: buildroot@buildroot.org, Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>
References: <20250714145242.27516-1-fl@n621.de> <aIi2HTxHmOPhk7t4@yd-6wlzhs3>
Content-Language: fr
In-Reply-To: <aIi2HTxHmOPhk7t4@yd-6wlzhs3>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1754760449; x=1755365249; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6vrFCwSWoGvfRL3QXbcGse1zT2/vrYFkHMVb5TIbjnM=;
 b=IvVW5/muXVABzaG9WL7C68kzEN3sBuvYWMYCciVMpPoHmztWORyIYQajV1EWQrSXzv
 CUYpfUIcRRscmP6gIR/P4VMmeUhFvPDwhJgPfp0SG4J5D1wdwHH0tfTDut53ROljQnKp
 adEz0yplwjE2yXqnQRJoAtDLnisKshn11WJ/s=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=IvVW5/mu
Subject: Re: [Buildroot] [PATCH v2 1/1] package/go: make pre-built compiler
 provide target support too
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

SGVsbG8gRm9yaWFuLCBZYW5uLCBBbGwsCgpMZSAyOS8wNy8yMDI1IMOgIDEzOjUzLCB5YW5uLm1v
cmluQG9yYW5nZS5jb20gYSDDqWNyaXTCoDoKPiBGbG9yaWFuLCBBbGwsCj4gCj4gT24gMjAyNS0w
Ny0xNCAxNjo1MiArMDIwMCwgRmxvcmlhbiBMYXJ5c2NoIHNwYWtlIHRodXNseToKPj4gQWxsIEdv
IHBhY2thZ2VzIG11c3QgZGVwZW5kIG9uIEJSMl9QQUNLQUdFX0hPU1RfR09fVEFSR0VUX0FSQ0hf
U1VQUE9SVFMsCj4+IHdoaWNoIGVuc3VyZXMgdGhhdCB3ZSBkbyBoYXZlIGEgR28gY29tcGlsZXIg
YXZhaWxhYmxlIGZvciB0aGF0IHRhcmdldC4KPj4KPj4gQlIyX1BBQ0tBR0VfSE9TVF9HT19UQVJH
RVRfQVJDSF9TVVBQT1JUUyBpcyBjdXJyZW50bHkgcmVzdHJpY3RlZCB0byB0aGUKPj4gYXZhaWxh
YmlsaXR5IG9mIGEgZnVsbCBob3N0IEdvIGNvbXBpbGVyIGJvb3RzdHJhcC4gSG93ZXZlciwgdGhl
cmUgYXJlCj4+IGFyY2hpdGVjdHVyZXMgbGlrZSBBQXJjaDY0IGZvciB3aGljaCBhIGZ1bGwgYm9v
dHN0cmFwIGlzIG5vdCBzdXBwb3J0ZWQuCj4+Cj4+IFRodXMsIGN1cnJlbnRseSwgb24gYW4gQUFy
Y2g2NCBob3N0LCB3ZSBjYW4ndCBidWlsZCBHbyBwYWNrYWdlcyAoZm9yCj4+IHRhcmdldCBvciBo
b3N0KSwgYmVjYXVzZSB3ZSBjYW4ndCBib290c3RyYXAgYSBHbyBjb21waWxlci4KPj4KPj4gSG93
ZXZlciwgbm90ZSB0aGF0IGEgc2luZ2xlIEdvIGNvbXBpbGVyIGNhbiBnZW5lcmF0ZSBjb2RlIGZv
ciBhbGwgdGhlCj4+IGFyY2hpdGVjdHVyZXMgc3VwcG9ydGVkIGJ5IEdvIGFuZCBmb3Igc29tZSBo
b3N0IGFyY2hpdGVjdHVyZXMsIHRoZXJlIGFyZQo+PiBwcmUtYnVpbHQgdG9vbGNoYWlucyBhdmFp
bGFibGUuIFdoZW4gaG9zdC1nby1iaW4gd2FzIGFkZGVkIGluIGNvbW1pdAo+PiA3YjJhMTY0Yjc0
NjAgKCJwYWNrYWdlL2dvL2dvLWJpbjogbmV3IGhvc3QtZ28gcHJvdmlkZXIiKSwgdGhlIGhvc3QK
Pj4gZGVwZW5kZW5jeSB3YXMgcHJvcGVybHkgYWNjb3VudGVkIGZvcjogSXQgaXMgYWxyZWFkeSBw
b3NzaWJsZSB0byBidWlsZAo+PiBob3N0LWdvIHBhY2thZ2VzIHdpdGggZ28tYmluLiBIb3dldmVy
LCB0aGUgZmFjdCB0aGF0IGEgR28gY29tcGlsZXIsIGluCj4+IGFkZGl0aW9uIHRvIGl0cyBuYXRp
dmUgdGFyZ2V0LCBjYW4gYWxzbyBnZW5lcmF0ZSBjb2RlIGZvciBhbGwgc3VwcG9ydGVkCj4+IGFy
Y2hpdGVjdHVyZXMsIHdhcyBtaXNzZWQgYXQgdGhlIHRpbWUuCj4+Cj4+IFRodXMsIHdlIGNhbiBm
aXggdGhpcyBwcm9ibGVtIGJ5IHJlbGF4aW5nIHRoZSBjb25kaXRpb24gdW5kZXIgd2hpY2gKPj4g
QlIyX1BBQ0tBR0VfSE9TVF9HT19UQVJHRVRfQVJDSF9TVVBQT1JUUyBpcyBzZXQgdG8gYWxsb3dp
bmcgZ28tYmluCj4+IGFsb25nIHdpdGggZ28tYm9vdHN0cmFwLiBUaGlzIGFsbG93cyBhIHNpdHVh
dGlvbiB3aGVyZSB0aGUgaG9zdCBjYW4ndAo+PiBib290c3RyYXAsIGJ1dCBmb3Igd2hpY2ggdGhl
cmUgaXMgYSBwcmUtYnVpbHQgdG9vbGNoYWluIHRvIGJ1aWxkIEdvCj4+IHBhY2thZ2VzIGZvciBh
IHN1cHBvcnRlZCB0YXJnZXQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEZsb3JpYW4gTGFyeXNjaCA8
ZmxAbjYyMS5kZT4KPj4gQ2M6IFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW5Ab3JhbmdlLmNvbT4K
Pj4gQ2M6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgo+IAo+IFJldmlld2Vk
LWJ5OiBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmluQG9yYW5nZS5jb20+Cj4gCj4gVGhhbmtzIGZv
ciB0aGUgcmVzcGluIQoKKzEgOikKCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpCZXN0IHJl
Z2FyZHMsClJvbWFpbgoKCj4gCj4gUmVnYXJkcywKPiBZYW5uIEUuIE1PUklOLgo+IAo+PiAtLS0K
Pj4gdjEtPnYyOgo+PiAgLSBSZXdvcmRlZCBjb21taXQgbWVzc2FnZSBhZnRlciBkaXNjdXNzaW9u
IHdpdGggUm9tYWluIGFuZCBZYW5uLgo+Pgo+PiAgcGFja2FnZS9nby9Db25maWcuaW4uaG9zdCB8
IDIgKy0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+
Pgo+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9nby9Db25maWcuaW4uaG9zdCBiL3BhY2thZ2UvZ28v
Q29uZmlnLmluLmhvc3QKPj4gaW5kZXggN2UzNTRiMzI5OC4uYTQyZTM3ZjkwYiAxMDA2NDQKPj4g
LS0tIGEvcGFja2FnZS9nby9Db25maWcuaW4uaG9zdAo+PiArKysgYi9wYWNrYWdlL2dvL0NvbmZp
Zy5pbi5ob3N0Cj4+IEBAIC0yLDcgKzIsNyBAQAo+PiAgY29uZmlnIEJSMl9QQUNLQUdFX0hPU1Rf
R09fVEFSR0VUX0FSQ0hfU1VQUE9SVFMKPj4gIAlib29sCj4+ICAJZGVmYXVsdCB5Cj4+IC0JZGVw
ZW5kcyBvbiBCUjJfUEFDS0FHRV9IT1NUX0dPX0JPT1RTVFJBUF9TVEFHRTNfQVJDSF9TVVBQT1JU
Uwo+PiArCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfSE9TVF9HT19CT09UU1RSQVBfU1RBR0UzX0FS
Q0hfU1VQUE9SVFMgfHwgQlIyX1BBQ0tBR0VfSE9TVF9HT19CSU5fSE9TVF9BUkNIX1NVUFBPUlRT
Cj4+ICAJIyBTZWUgaHR0cHM6Ly9nby5kZXYvZG9jL2luc3RhbGwvc291cmNlI2Vudmlyb25tZW50
Cj4+ICAJIyBTZWUgc3JjL2dvL2J1aWxkL3N5c2xpc3QuZ28gZm9yIHRoZSBsaXN0IG9mIHN1cHBv
cnRlZCBhcmNoaXRlY3R1cmVzCj4+ICAJZGVwZW5kcyBvbiAoQlIyX2FybSAmJiBCUjJfVE9PTENI
QUlOX1NVUFBPUlRTX1BJRSkgfHwgQlIyX2FhcmNoNjQgXAo+PiAtLSAKPj4gMi40OS4wCj4+Cj4g
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
