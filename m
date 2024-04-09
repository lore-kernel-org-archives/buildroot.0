Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B29C67861
	for <buildroot@archiver.kernel.org>; Tue,  9 Apr 2024 11:58:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2DEC0409F3;
	Tue,  9 Apr 2024 11:58:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bvo2imzvQceT; Tue,  9 Apr 2024 11:58:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E701640AE5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E701640AE5;
	Tue,  9 Apr 2024 11:58:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 42B211BF3BB
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 11:58:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C4B081DA0
 for <buildroot@lists.busybox.net>; Tue,  9 Apr 2024 11:58:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mUDEBaxGYTZl for <buildroot@lists.busybox.net>;
 Tue,  9 Apr 2024 11:58:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7120E81D3D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7120E81D3D
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7120E81D3D
 for <buildroot@buildroot.org>; Tue,  9 Apr 2024 11:58:13 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-343b92e54f5so4151116f8f.0
 for <buildroot@buildroot.org>; Tue, 09 Apr 2024 04:58:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712663891; x=1713268691;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a3l0u+eo9rKN7YGI9AhJeZq97CcAwnCZAGzQlBRJPUQ=;
 b=juTG5es7lMjPI/nCpbtRvB0MgMEEHm+uyLwaegghOVOVd3scLm0AzxkPdlnBZpX9gX
 3a9A5zpOlozv25Wsma4pQBsApNs5fVQ20/BaWMRd2X84MX+89Vx8uB1NsfKL35LyMJjU
 Wk4ItpxDmNHd+CYb4boAWNwFn2Vcm9SZ9FbECMzG9I/vRUWH/5ADuf/eZU6sxWOkDPdG
 3spWZkpw0GXP4JuLX5JVtT8e/0GQrwvPdLX8zsaiE9PCMRby6wYWGT3EpNNo83eaSuk9
 6xle1dNzGbanQPR/YbSCG7+D3y4Ch5mPmpYE1pGal565XuNnbqJKkNS/Zr21Cs82BBqx
 KhrA==
X-Gm-Message-State: AOJu0YxCwnKpHYbgngKNz4f5sFoOc+24SHXQ6yz99i2xolrgJsUS1dZ8
 OxyiwlTFVWyjAqFAvx8lkJLsH6wRshOVRxPfLkwO4fMch4q5bkFhM1CBrPt/Vps=
X-Google-Smtp-Source: AGHT+IE9iPD89deLTckPpSCW5afhwgSiaODkPiLGOXXUvIWHVV7luy4zKUul56tsmDyWqOKFov66ag==
X-Received: by 2002:adf:fd4c:0:b0:343:e83a:5588 with SMTP id
 h12-20020adffd4c000000b00343e83a5588mr7208789wrs.69.1712663891427; 
 Tue, 09 Apr 2024 04:58:11 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a5d668d000000b0034354a99d43sm11282520wru.43.2024.04.09.04.58.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Apr 2024 04:58:11 -0700 (PDT)
Message-ID: <8b182357-7c07-42d9-a58b-9c2d036a02d0@smile.fr>
Date: Tue, 9 Apr 2024 13:58:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>
References: <20240407103512.1112712-1-romain.naour@smile.fr>
 <20240407103512.1112712-6-romain.naour@smile.fr>
 <CADvTj4qrYwRrNRfD6sap-nO94eKC4h4t-DuDrceZJrJZNA3pLw@mail.gmail.com>
Content-Language: fr
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <CADvTj4qrYwRrNRfD6sap-nO94eKC4h4t-DuDrceZJrJZNA3pLw@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712663891; x=1713268691;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=a3l0u+eo9rKN7YGI9AhJeZq97CcAwnCZAGzQlBRJPUQ=;
 b=ArFLH9xQ/ocHVbGCvi1PuX7DuHOUgT7xiWZVSIzAeQkhBcoYXDPOjkVK/vbyYbrSPc
 wtXoA0OZS5WISs3qBoPR8BbW6MijPztdTOpx3VXFWbYejzZTbKTd1El/FeUkxuh6AUSN
 MzSL2W/VlnZ7MdLrR2y2YnelfpFQj8D99yRHKspDDjwluumsaQfQmwzeDcgIIA1Xw5gQ
 62jxRIjNBAwI0ZnQzzZbxMy2SlHnXH/l7+p0BKL46aUXbdFvffBWNVAqaqD37lnHJ2H6
 hU79n36MmoN1xowojpGeIIowCDz/GsApjt+dkOaBwomKHYp7rk4c8PgQ+ZrtBasPhkP3
 +xPQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=ArFLH9xQ
Subject: Re: [Buildroot] [PATCH v12 05/16] boot/uboot: add
 BR2_TARGET_UBOOT_USE_BINMAN option
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSmFtZXMsCgpMZSAwOC8wNC8yMDI0IMOgIDE4OjExLCBKYW1lcyBIaWxsaWFyZCBhIMOp
Y3JpdMKgOgo+IE9uIFN1biwgQXByIDcsIDIwMjQgYXQgNDozNeKAr0FNIFJvbWFpbiBOYW91ciA8
cm9tYWluLm5hb3VyQHNtaWxlLmZyPiB3cm90ZToKPj4KPj4gRnJvbTogRGFyaW8gQmluYWNjaGkg
PGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+Pgo+PiBSZWNlbnQgdmVyc2lv
biBvZiBVLUJvb3QgdXNlIGJpbm1hbiB0byBwcm92aWRlIGEgbWVjaGFuaXNtIGZvciBidWlsZGlu
Zwo+PiBpbWFnZXMsIGZyb20gc2ltcGxlIFNQTCArIFUtQm9vdCBjb21iaW5hdGlvbnMsIHRvIG1v
cmUgY29tcGxleAo+PiBhcnJhbmdlbWVudHMgd2l0aCBtYW55IHBhcnRzLgo+Pgo+PiBUaGlzIHRv
b2wgdXNlcyBhZGRpdGlvbmFsIGhvc3QgcHl0aG9uIG1vZHVsZXMgdGhhdCBtdXN0IGJlIHByb3Zp
ZGVkIGJ5Cj4+IEJ1aWxkcm9vdC4gU28gaW50cm9kdWNlIGEgbmV3IG9wdGlvbiBCUjJfVEFSR0VU
X1VCT09UX1VTRV9CSU5NQU4gdG8KPj4gYWRkIGFkZGl0aW9uYWwgaG9zdCBwYWNrYWdlcyBpbiBV
LUJvb3QgYnVpbGQgZGVwZW5kZW5jeSB0byB1c2UgYmlubWFuLgo+Pgo+PiBUaGUgYmlubWFuIHJl
cXVpcmVtZW50IGlzIGRpcmVjdGx5IGluY2x1ZGVkIGluIGJ1aWxkbWFuIGRlcGVuZGVuY3kKPj4g
KHRvb2xzL2J1aWxkbWFuL3JlcXVpcmVtZW50cy50eHQpIHNpbmNlIHdpdGhpbiBVLUJvb3QsIGJp
bm1hbiBpcwo+PiBpbnZva2VkIGJ5IHRoZSBidWlsZCBzeXN0ZW0sIGhlcmUgYnVpbGRtYW4gWzFd
Lgo+Pgo+PiBbMV0gaHR0cHM6Ly9kb2NzLnUtYm9vdC5vcmcvZW4vdjIwMjQuMDEvZGV2ZWxvcC9w
YWNrYWdlL2Jpbm1hbi5odG1sI2ludm9raW5nLWJpbm1hbi13aXRoaW4tdS1ib290Cj4+Cj4+IENv
LWRldmVsb3BlZC1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+Cj4+IFNp
Z25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRp
b25zLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21p
bGUuZnI+Cj4+IC0tLQo+PiBDaGFuZ2VzIGluIHYxMjoKPj4gLSByZW1vdmUgQlIyX1BBQ0tBR0Vf
VElfSzMgcGFydCBzaW5jZSB0aGlzIG9wdGlvbiBoYXMgYmVlbiByZW1vdmVkIGZyb20gdGhpcyBz
ZXJpZXMKPj4gLSByZW1vdmUgVEkgSzMgc3BlY2lmaWMgcGFydCBmcm9tIHRoZSBjb21taXQgbG9n
Cj4+Cj4+IENoYW5nZXMgaW4gdjExOgo+PiAtIEFkZCB0aS1rMy1ib290LWZpcm13YXJlIGRlcGVk
ZW5kZW5jeSB3aGVuIGJvdGggQlIyX1RBUkdFVF9VQk9PVF9VU0VfQklOTUFOCj4+ICAgYW5kIEJS
Ml9QQUNLQUdFX1RJX0szIGFyZSBzZXQKPj4gLSBkcm9wIEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNf
VElfSzNfRE0gcmVsYXRlZCBjaGFuZ2VzCj4+Cj4+IENoYW5nZXMgaW4gdjc6Cj4+IC0gUmVwbGFj
ZSBpZm5lcSAoJChCUjJfVEFSR0VUX1VCT09UX1VTRV9CSU5NQU4pLHkpIHdpdGgKPj4gICBpZmVx
ICgkKEJSMl9UQVJHRVRfVUJPT1RfVVNFX0JJTk1BTiksKS4KPj4gLSBVcGRhdGUgdGhlIGNvbW1p
dCBtZXNzYWdlCj4+Cj4+IENoYW5nZXMgaW4gdjY6Cj4+IC0gQlIyX1RBUkdFVF9VQk9PVF9VU0Vf
QklOTUFOCj4+IC0gQmlubWFuIHRvb2wgaXMgbm90IHNwZWNpZmljIHRvIFRJIEszIHBsYXRmb3Jt
LCBzbyBhZGQgYW4gb3B0aW9uIHRvIHNwZWNpZnkKPj4gICB0aGUgdXNlIG9mIEJpbm1hbiBpbiBV
LUJvb3QuCj4+IC0gQWRkIHJ1bnRpbWUgZGVwZW5kZW5jaWVzCj4+IC0gVXBkYXRlIGNvbW1pdCBt
ZXNzYWdlCj4+IC0gQWRkIFNPQiBhbmQgQ09CIHRhZ3Mgb2YgUm9tYWluIE5hb3VyCj4+Cj4+IENo
YW5nZXMgaW4gdjU6Cj4+IC0gRHJvcCAiRE09JChCSU5BUklFU19ESVIpL3RpLWRtLyQoVUJPT1Rf
VElfSzNfRE1fU09DTkFNRSkvaXBjX2VjaG9fdGVzdGJfbWN1MV8wX3JlbGVhc2Vfc3RyaXAueGVy
NWYiCj4+ICAgZnJvbSBVQk9PVF9NQUtFX09QVFMuCj4+Cj4+IG5vIGNoYW5nZXMgc2luY2UgdjE6
Cj4+IC0tLQo+PiAgYm9vdC91Ym9vdC9Db25maWcuaW4gfCAxMSArKysrKysrKysrKwo+PiAgYm9v
dC91Ym9vdC91Ym9vdC5tayAgfCAgOCArKysrKysrKwo+PiAgMiBmaWxlcyBjaGFuZ2VkLCAxOSBp
bnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9ib290L3Vib290L0NvbmZpZy5pbiBiL2Jv
b3QvdWJvb3QvQ29uZmlnLmluCj4+IGluZGV4IGUzMTBjMDkyMTcuLjM5ZTQ5ZDY4MWIgMTAwNjQ0
Cj4+IC0tLSBhL2Jvb3QvdWJvb3QvQ29uZmlnLmluCj4+ICsrKyBiL2Jvb3QvdWJvb3QvQ29uZmln
LmluCj4+IEBAIC0yOTUsNiArMjk1LDE3IEBAIGNvbmZpZyBCUjJfVEFSR0VUX1VCT09UX05FRURT
X1JPQ0tDSElQX1JLQklOCj4+ICAgICAgICAgICBUaGlzIG9wdGlvbiBtYWtlcyBzdXJlIHRoYXQg
dGhlIG5lZWRlZCBiaW5hcnkgYmxvYnMgYXJlIGNvcGllZAo+PiAgICAgICAgICAgaW50byB0aGUg
VS1Cb290IHNvdXJjZSBkaXJlY3RvcnkuCj4+Cj4+ICtjb25maWcgQlIyX1RBUkdFVF9VQk9PVF9V
U0VfQklOTUFOCj4+ICsgICAgICAgYm9vbCAiVS1Cb290IHVzZSBiaW5tYW4iCj4+ICsgICAgICAg
ZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9IT1NUX1JVU1RDX1RBUkdFVF9BUkNIX1NVUFBPUlRTICMg
cHl0aG9uLXJwZHMtcHkgLT4gcHl0aG9uLWpzb25zY2hlbWEKPiAKPiBUaGlzIGNvbW1lbnQgZG9l
c24ndCBsb29rIHJpZ2h0LCB3aGF0IGlzIHNlbGVjdGluZyBweXRob24tcnBkcy1weSBhbmQKPiBw
eXRob24tanNvbnNjaGVtYT8KCllvdSdyZSByaWdodCwgb25seSBob3N0LXB5dGhvbi1qc29uc2No
ZW1hIGlzIHJlcXVpcmVkIHNvIHRoaXMgZGVwZW5jeSBpcyBub3QgbmVlZGVkLgoKQmVzdCByZWdh
cmRzLApSb21haW4KCgo+IAo+PiArICAgICAgIHNlbGVjdCBCUjJfVEFSR0VUX1VCT09UX05FRURT
X1BZVEhPTjMKPj4gKyAgICAgICBzZWxlY3QgQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19QWUVMRlRP
T0xTCj4+ICsgICAgICAgc2VsZWN0IEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNfUFlMSUJGRFQKPj4g
KyAgICAgICBoZWxwCj4+ICsgICAgICAgICBVc2UgYmlubWFuIHRvb2wgZm9yIGdlbmVyYXRpb24g
YW5kIHNpZ25pbmcgb2YgYm9vdCBpbWFnZXMuCj4+ICsKPj4gKyAgICAgICAgIGh0dHBzOi8vZG9j
cy51LWJvb3Qub3JnL2VuL3YyMDI0LjAxL2RldmVsb3AvcGFja2FnZS9iaW5tYW4uaHRtbAo+PiAr
Cj4+ICBtZW51ICJVLUJvb3QgYmluYXJ5IGZvcm1hdCIKPj4KPj4gIGNvbmZpZyBCUjJfVEFSR0VU
X1VCT09UX0ZPUk1BVF9BSVMKPj4gZGlmZiAtLWdpdCBhL2Jvb3QvdWJvb3QvdWJvb3QubWsgYi9i
b290L3Vib290L3Vib290Lm1rCj4+IGluZGV4IDQ3ZmI0MTllOTIuLjM5ODQ4NTE5NWUgMTAwNjQ0
Cj4+IC0tLSBhL2Jvb3QvdWJvb3QvdWJvb3QubWsKPj4gKysrIGIvYm9vdC91Ym9vdC91Ym9vdC5t
awo+PiBAQCAtMjc5LDYgKzI3OSwxNCBAQCBpZmVxICgkKEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNf
WFhEKSx5KQo+PiAgVUJPT1RfREVQRU5ERU5DSUVTICs9IGhvc3QtdmltCj4+ICBlbmRpZgo+Pgo+
PiAraWZlcSAoJChCUjJfVEFSR0VUX1VCT09UX1VTRV9CSU5NQU4pLHkpCj4+ICsjIGh0dHBzOi8v
c291cmNlLmRlbnguZGUvdS1ib290L3UtYm9vdC8tL2Jsb2IvdjIwMjQuMDEvdG9vbHMvYnVpbGRt
YW4vcmVxdWlyZW1lbnRzLnR4dAo+PiArVUJPT1RfREVQRU5ERU5DSUVTICs9IFwKPj4gKyAgICAg
ICBob3N0LXB5dGhvbi1qc29uc2NoZW1hIFwKPj4gKyAgICAgICBob3N0LXB5dGhvbi1weXlhbWwK
Pj4gK1VCT09UX01BS0VfT1BUUyArPSBCSU5NQU5fSU5ESVJTPSQoQklOQVJJRVNfRElSKQo+PiAr
ZW5kaWYKPj4gKwo+PiAgIyBwcmlvciB0byB1LWJvb3QgMjAxMy4xMCB0aGUgbGljZW5zZSBpbmZv
IHdhcyBpbiBDT1BZSU5HLiBDb3B5IGl0IHNvCj4+ICAjIGxlZ2FsLWluZm8gZmluZHMgaXQKPj4g
IGRlZmluZSBVQk9PVF9DT1BZX09MRF9MSUNFTlNFX0ZJTEUKPj4gLS0KPj4gMi40NC4wCj4+Cj4+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKPj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPj4gaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
