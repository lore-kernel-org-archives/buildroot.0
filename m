Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F825C54798
	for <buildroot@archiver.kernel.org>; Sun, 25 Feb 2024 16:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9307F4064C;
	Sun, 25 Feb 2024 16:06:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UFvIsBaIzDsF; Sun, 25 Feb 2024 16:06:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 780A6406BE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 780A6406BE;
	Sun, 25 Feb 2024 16:06:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 346E11BF36A
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 16:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 21C4360796
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 16:06:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0ZlSTKq2R0fl for <buildroot@lists.busybox.net>;
 Sun, 25 Feb 2024 16:06:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 72F806074D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72F806074D
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 72F806074D
 for <buildroot@buildroot.org>; Sun, 25 Feb 2024 16:06:11 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-412a3903586so2556955e9.3
 for <buildroot@buildroot.org>; Sun, 25 Feb 2024 08:06:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708877169; x=1709481969;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tXfUDHUmEnKdmPW0T6GIejvumDVwhUzGDsxBloDzI9A=;
 b=rkfdghbDuur4EwD856jGab/0owDl+KY8KPJwDf2B6OU1ClRV3u2mxPePrImLe8UW3E
 xAufzEOO4f5ZiPjuJJGda0baMl90PFkDNg7s2nqLYyEOV66l8a78hvjDGJhOwB+gdtJj
 V1xu/n10FkLYULx78ePSkHd1SJm29ZLoYBq3E5l+pY12pf00ujwRlt96RmzNfebnwivi
 WKWtXQi/wp0lJU34zD57Q/Vz8F4E0Qxjsul0lzA29vihe9//1oLU1f9noQ3VgmVgegM5
 9cPmT3ELEpqSHNNu59w/vK1OUV0Koz32sCe7XP/64iH6BQN9sJdb34bwNhMhdx8vxOnr
 7lHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrsaAV7aJ5bYhyo8FBXATUl3veKpflk5t5+aDFgDZtvMuZpBpv2LWMtTlGy8rKUoV0SHMI6ep7lMNB+/nbXHVWjqZ9R2nRbw==
X-Gm-Message-State: AOJu0YxAVi6FqVo9C6AAKRj+ucOuTdW7sHD/f2dGfsKIrQuN8JxHAaIj
 H9QF4BCc62Z/5aJ5elrxsZFQ/KtPCPAWsyULzCVL1reL/UXedC1oASphxE2b0N0=
X-Google-Smtp-Source: AGHT+IEZHEDXQn60qLeo0ZaeJKyCSjTNpuDuaHtrhIYe9XVmCTC1QvpBB8E6waz1UfLaAg++sqX77Q==
X-Received: by 2002:a05:600c:1e01:b0:412:95f4:2300 with SMTP id
 ay1-20020a05600c1e0100b0041295f42300mr3954919wmb.7.1708877169098; 
 Sun, 25 Feb 2024 08:06:09 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a05600c198800b00412a218a68fsm2421208wmq.31.2024.02.25.08.06.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Feb 2024 08:06:08 -0800 (PST)
Message-ID: <8d3bb106-cae8-4271-87e9-200c879de7f1@smile.fr>
Date: Sun, 25 Feb 2024 17:06:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240224205654.1546744-1-dario.binacchi@amarulasolutions.com>
 <20240224205654.1546744-13-dario.binacchi@amarulasolutions.com>
Content-Language: fr
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240224205654.1546744-13-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1708877169; x=1709481969;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tXfUDHUmEnKdmPW0T6GIejvumDVwhUzGDsxBloDzI9A=;
 b=mzflZ6XBpkPvh5fzd68eTXQBl8uzhiaC40oMhErLULxZjf3s+9ixVne5bnOTkHlOW4
 C6/vd3aWQ+AwfzvRQZMLjCW6a+Q9LxlfZM/3etbdgN4y9LotxhnYjaf2G7PrFK7My2oF
 VOkgAd2wFhF8GAA423BuI9r9FN4gcY7zR6WB28ukp4IelC65eN7P0wpPwj0whQxZnNh8
 N9umY/GpsbN6XBQPDhKGAZoZu139nOGROpXW3fxHYcm3XPej28wV8rPEFQJFrrcoM8LP
 V0i3U3cuUvl9XoYfzZXxkusgCKXljahiCSIdKkvoTbka7tL1ILkk4PsGH9B7FIooBj/w
 46Rw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=mzflZ6XB
Subject: Re: [Buildroot] [PATCH v6 12/16] boot/uboot: add
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
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRGFyaW8sCgpMZSAyNC8wMi8yMDI0IMOgIDIxOjU2LCBEYXJpbyBCaW5hY2NoaSBhIMOp
Y3JpdMKgOgo+IFJlY2VudCB2ZXJzaW9uIG9mIFUtQm9vdCB1c2UgYmlubWFuIHRvIHByb3ZpZGUg
YSBtZWNoYW5pc20gZm9yIGJ1aWxkaW5nCj4gaW1hZ2VzLCBmcm9tIHNpbXBsZSBTUEwgKyBVLUJv
b3QgY29tYmluYXRpb25zLCB0byBtb3JlIGNvbXBsZXgKPiBhcnJhbmdlbWVudHMgd2l0aCBtYW55
IHBhcnRzLgo+IAo+IFRoaXMgdG9vbCB1c2VzIGFkZGl0aW9uYWwgaG9zdCBweXRob24gbW9kdWxl
cyB0aGF0IG11c3QgYmUgcHJvdmlkZWQgYnkKPiBCdWlsZHJvb3QuIFNvIGludHJvZHVjZSBhIG5l
dyBvcHRpb24gQlIyX1RBUkdFVF9VQk9PVF9VU0VfQklOTUFOIHRvCj4gYWRkIGFkZGl0aW9uYWwg
aG9zdCBwYWNrYWdlcyBpbiBVLUJvb3QgYnVpbGQgZGVwZW5kZW5jeSB0byB1c2UgYmlubWFuLgo+
IAo+IFRoZSBiaW5tYW4gcmVxdWlyZW1lbnQgaXMgZGlyZWN0bHkgaW5jbHVkZWQgaW4gYnVpbGRt
YW4gZGVwZW5kZW5jeQo+ICh0b29scy9idWlsZG1hbi9yZXF1aXJlbWVudHMudHh0KSBzaW5jZSB3
aXRoaW4gVS1Cb290LCBiaW5tYW4gaXMKPiBpbnZva2VkIGJ5IHRoZSBidWlsZCBzeXN0ZW0sIGhl
cmUgYnVpbGRtYW4gWzFdLgo+IAo+IFsxXSBodHRwczovL2RvY3MudS1ib290Lm9yZy9lbi92MjAy
NC4wMS9kZXZlbG9wL3BhY2thZ2UvYmlubWFuLmh0bWwjaW52b2tpbmctYmlubWFuLXdpdGhpbi11
LWJvb3QKPiAKPiBDby1kZXZlbG9wZWQtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNt
aWxlLmZyPgo+IFNpZ25lZC1vZmYtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxl
LmZyPgo+IFNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFy
dWxhc29sdXRpb25zLmNvbT4KPiAKPiAtLS0KPiAKPiBDaGFuZ2VzIGluIHY2Ogo+IC0gQlIyX1RB
UkdFVF9VQk9PVF9VU0VfQklOTUFOCj4gLSBCaW5tYW4gdG9vbCBpcyBub3Qgc3BlY2lmaWMgdG8g
VEkgSzMgcGxhdGZvcm0sIHNvIGFkZCBhbiBvcHRpb24gdG8gc3BlY2lmeQo+ICAgdGhlIHVzZSBv
ZiBCaW5tYW4gaW4gVS1Cb290Lgo+IC0gQWRkIHJ1bnRpbWUgZGVwZW5kZW5jaWVzCj4gLSBVcGRh
dGUgY29tbWl0IG1lc3NhZ2UKPiAtIEFkZCBTT0IgYW5kIENPQiB0YWdzIG9mIFJvbWFpbiBOYW91
cgo+IAo+IENoYW5nZXMgaW4gdjU6Cj4gLSBEcm9wICJETT0kKEJJTkFSSUVTX0RJUikvdGktZG0v
JChVQk9PVF9USV9LM19ETV9TT0NOQU1FKS9pcGNfZWNob190ZXN0Yl9tY3UxXzBfcmVsZWFzZV9z
dHJpcC54ZXI1ZiIKPiAgIGZyb20gVUJPT1RfTUFLRV9PUFRTLgo+IAo+IG5vIGNoYW5nZXMgc2lu
Y2UgdjE6Cj4gCj4gIGJvb3QvdWJvb3QvQ29uZmlnLmluIHwgMTEgKysrKysrKysrKysKPiAgYm9v
dC91Ym9vdC91Ym9vdC5tayAgfCAxMiArKysrKysrKysrKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAy
MiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Jvb3QvdWJv
b3QvQ29uZmlnLmluIGIvYm9vdC91Ym9vdC9Db25maWcuaW4KPiBpbmRleCBiZWFmYjM4OTMwZGIu
LmU2ZTc5NTZhZGNjYiAxMDA2NDQKPiAtLS0gYS9ib290L3Vib290L0NvbmZpZy5pbgo+ICsrKyBi
L2Jvb3QvdWJvb3QvQ29uZmlnLmluCj4gQEAgLTI5MCw2ICsyOTAsMTcgQEAgY29uZmlnIEJSMl9U
QVJHRVRfVUJPT1RfTkVFRFNfUk9DS0NISVBfUktCSU4KPiAgCSAgVGhpcyBvcHRpb24gbWFrZXMg
c3VyZSB0aGF0IHRoZSBuZWVkZWQgYmluYXJ5IGJsb2JzIGFyZSBjb3BpZWQKPiAgCSAgaW50byB0
aGUgVS1Cb290IHNvdXJjZSBkaXJlY3RvcnkuCj4gIAo+ICtjb25maWcgQlIyX1RBUkdFVF9VQk9P
VF9VU0VfQklOTUFOCj4gKwlib29sICJVLUJvb3QgdXNlIGJpbm1hbiIKPiArCWRlcGVuZHMgb24g
QlIyX1BBQ0tBR0VfSE9TVF9SVVNUQ19UQVJHRVRfQVJDSF9TVVBQT1JUUyAjIHB5dGhvbi1ycGRz
LXB5IC0+IHB5dGhvbi1qc29uc2NoZW1hCj4gKwlzZWxlY3QgQlIyX1RBUkdFVF9VQk9PVF9ORUVE
U19QWVRIT04zCj4gKwlzZWxlY3QgQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19QWUVMRlRPT0xTCj4g
KwlzZWxlY3QgQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19QWUxJQkZEVAo+ICsJaGVscAo+ICsJICBV
c2UgYmlubWFuIHRvb2wgZm9yIGdlbmVyYXRpb24gYW5kIHNpZ25pbmcgb2YgYm9vdCBpbWFnZXMu
Cj4gKwo+ICsJICBodHRwczovL2RvY3MudS1ib290Lm9yZy9lbi92MjAyNC4wMS9kZXZlbG9wL3Bh
Y2thZ2UvYmlubWFuLmh0bWwKPiArCj4gIG1lbnUgIlUtQm9vdCBiaW5hcnkgZm9ybWF0Igo+ICAK
PiAgY29uZmlnIEJSMl9UQVJHRVRfVUJPT1RfRk9STUFUX0FJUwo+IGRpZmYgLS1naXQgYS9ib290
L3Vib290L3Vib290Lm1rIGIvYm9vdC91Ym9vdC91Ym9vdC5tawo+IGluZGV4IGRkYTYwNmE4ODA1
OS4uOTE1N2E0YjczOGMzIDEwMDY0NAo+IC0tLSBhL2Jvb3QvdWJvb3QvdWJvb3QubWsKPiArKysg
Yi9ib290L3Vib290L3Vib290Lm1rCj4gQEAgLTE4NywxMCArMTg3LDEyIEBAIFVCT09UX01BS0Vf
T1BUUyArPSBURUU9JChCSU5BUklFU19ESVIpL3RlZS5lbGYKPiAgZW5kaWYKPiAgCj4gIGlmZXEg
KCQoQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19USV9LM19ETSkseSkKPiAtVUJPT1RfVElfSzNfRE1f
U09DTkFNRSA9ICQoY2FsbCBxc3RyaXAsJChCUjJfVEFSR0VUX1VCT09UX1RJX0szX0RNX1NPQ05B
TUUpKQo+ICBVQk9PVF9ERVBFTkRFTkNJRVMgKz0gdGktazMtYm9vdC1maXJtd2FyZQo+ICtpZm5l
cSAoJChCUjJfVEFSR0VUX1VCT09UX1VTRV9CSU5NQU4pLHkpCgpVc3VhbGx5IHdlIHByZWZlciB0
aGUgInBvc2l0aXZlIiBsb2dpYzogaWZlcSAoJChCUjJfVEFSR0VUX1VCT09UX1VTRV9CSU5NQU4p
LCkKCj4gK1VCT09UX1RJX0szX0RNX1NPQ05BTUUgPSAkKGNhbGwgcXN0cmlwLCQoQlIyX1RBUkdF
VF9VQk9PVF9USV9LM19ETV9TT0NOQU1FKSkKPiAgVUJPT1RfTUFLRV9PUFRTICs9IERNPSQoQklO
QVJJRVNfRElSKS90aS1kbS8kKFVCT09UX1RJX0szX0RNX1NPQ05BTUUpL2lwY19lY2hvX3Rlc3Ri
X21jdTFfMF9yZWxlYXNlX3N0cmlwLnhlcjVmCgpMb29raW5nIGF0IHRoZSBjb21taXQgbG9nLCBJ
dCdzIG5vdCBvYnZpb3VzIHdoeSBETT0gaXMgbm8gbmVlZGVkIHdpdGggYmlubWFuLgoKV2UgaGFk
IHRoZSBleHBsYW5hdGlvbiBmcm9tIEFuZHJlYXM6Cmh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9w
aXBlcm1haWwvYnVpbGRyb290LzIwMjQtRmVicnVhcnkvNjg1OTc3Lmh0bWwKCiJCSU5NQU5fSU5E
SVJTIGlzIHVzZWQgdG8gZmV0Y2ggdGhlIERNIGJpbmFyeSBmcm9tIDxwYXRoIHRvCnRpLWxpbnV4
LWZpcm13YXJlPi90aS1kbS8gYW5kIFNZU0ZXIGJpbmFyaWVzIGZyb20gPHBhdGggdG8KdGktbGlu
dXgtZmlybXdhcmU+L3RpLXN5c2Z3Ly4iCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gIGVuZGlm
Cj4gK2VuZGlmCj4gIAo+ICBpZmVxICgkKEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNfT1BFTlNCSSks
eSkKPiAgVUJPT1RfREVQRU5ERU5DSUVTICs9IG9wZW5zYmkKPiBAQCAtMjY5LDYgKzI3MSwxNCBA
QCBpZmVxICgkKEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNfWFhEKSx5KQo+ICBVQk9PVF9ERVBFTkRF
TkNJRVMgKz0gaG9zdC12aW0KPiAgZW5kaWYKPiAgCj4gK2lmZXEgKCQoQlIyX1RBUkdFVF9VQk9P
VF9VU0VfQklOTUFOKSx5KQo+ICsjIGh0dHBzOi8vc291cmNlLmRlbnguZGUvdS1ib290L3UtYm9v
dC8tL2Jsb2IvdjIwMjQuMDEvdG9vbHMvYnVpbGRtYW4vcmVxdWlyZW1lbnRzLnR4dAo+ICtVQk9P
VF9ERVBFTkRFTkNJRVMgKz0gXAo+ICsJaG9zdC1weXRob24tanNvbnNjaGVtYSBcCj4gKwlob3N0
LXB5dGhvbi1weXlhbWwKPiArVUJPT1RfTUFLRV9PUFRTICs9IEJJTk1BTl9JTkRJUlM9JChCSU5B
UklFU19ESVIpCj4gK2VuZGlmCj4gKwo+ICAjIHByaW9yIHRvIHUtYm9vdCAyMDEzLjEwIHRoZSBs
aWNlbnNlIGluZm8gd2FzIGluIENPUFlJTkcuIENvcHkgaXQgc28KPiAgIyBsZWdhbC1pbmZvIGZp
bmRzIGl0Cj4gIGRlZmluZSBVQk9PVF9DT1BZX09MRF9MSUNFTlNFX0ZJTEUKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
