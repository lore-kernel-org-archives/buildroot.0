Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B96CFD2F6
	for <buildroot@archiver.kernel.org>; Sat, 29 Nov 2025 17:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4856F60754;
	Sat, 29 Nov 2025 17:54:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9fAJXmgE2gaz; Sat, 29 Nov 2025 17:54:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C7D060759
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C7D060759;
	Sat, 29 Nov 2025 17:54:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B47E3273
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 17:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9AD5040A27;
 Sat, 29 Nov 2025 17:54:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9jGDh5jYZXL1; Sat, 29 Nov 2025 17:53:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 821A04084E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 821A04084E
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 821A04084E
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 17:53:59 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4775ae77516so29406855e9.1
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 09:53:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764438837; x=1765043637;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:sender
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BR0uzddaWXTi9iMiAzsWGoslKX/o5/J0U4covLlMtL8=;
 b=ti8gGuUxY3G95PFjuNjDWFm77FK1vppS8wgESvYzhlBGJ5CdBjq8R8LkOjNTJQohRq
 ReN6ow0+/F9oRf3Ubg3amnMKIlu4RRxbFrx2vrkTjzCnRYhEw23SH3skfgnA0uJPF8Mg
 R+dGzRAQ4oEZh2KsoyFqHKaI8B9kjsEOZ9yDkttk040UNowzUn+YbPIqjHxiHKiwmeYa
 XQEAvRtXPeaau09KFUxOBIbeo/B91HlUlhtoPb/FGrHV+iEyFCZU5blQp5lCIRyz7//y
 EKd5Yi+u9OBEdwOrYE584PVbRxAvJx1qLtL32kzfD5AQuOXwvJy+oMET04PkmdZ+C4UQ
 4a0g==
X-Gm-Message-State: AOJu0YwkDn/s4NdjAx6OuVg1wrTFgzRk+Gnuj9dbraH5Ll6BJFT/TaAB
 0Ye33d8LOumGtOy5n8xsP3i38FtpBI+vrHu+WWiz7Ima+MeAkoT+lnE7OjObAg==
X-Gm-Gg: ASbGncuaG8TfLnd+rF7MbYxr+UyujgrQOY391RtzyI5Yx5XEZA3SeKRZUyPCaYrJ47O
 Rvie4pkyY4uCQeOJEr9NsG2MqaNhGHHtmvI1Ksz6BYJ3izGrrFSPfpUG+j2HtkuYKedR8Sr0ihA
 cX/qaCMvm/N74rkGuvEGPgKYGd/biYd60B1Taz3zuTuDaU1BcvJh5wSD0MqmRvPmWcj/dMG7YfN
 1DbPIS2LMqbFt7aD9rf4364mhAVXEqCBSt+3mMwDEokIKcSIOAK5/3XDQ0d+Zp6RUd0S978lzhA
 cTpgUAdLpJ5GK294AkvMQwlzYGS2dGlBlAJ/kOyhhHdQJl3MdOBm31B1aa1fWMhtkZp5y/bb0dN
 N0vOv8QcgRj3Aqvwpy0sZHwTAtsjU/k9U15Ns6kJRUUIN3py8ZcdvmC5q8QBGlJ4HTS0++J9BkA
 af9QpYYSJAzT7j5y6J/WhfWs5qQWvGfhZ/
X-Google-Smtp-Source: AGHT+IFNcFjk1yUbaJC6HN/8HThECRqhuGnDxge84GOtOWUX/CAbYtivZnIoVT6gdP4kgtX08au2aA==
X-Received: by 2002:a05:600c:1c29:b0:477:639d:bca2 with SMTP id
 5b1f17b1804b1-477c10c85e2mr366314265e9.4.1764438837008; 
 Sat, 29 Nov 2025 09:53:57 -0800 (PST)
Received: from ymorin.is-a-geek.org ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4790add60e2sm210797365e9.6.2025.11.29.09.53.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Nov 2025 09:53:56 -0800 (PST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 29 Nov 2025 18:53:55 +0100
Date: Sat, 29 Nov 2025 18:53:55 +0100
To: =?utf-8?B?Sm9zw6k=?= Luis Salvador Rufo <salvador.joseluis@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <aSszM90msDWGlEaa@landeda>
References: <CAH+XeQYPBnXkXq4Fu0aBJ2UBR_U31ypza4z-1jf2Y78aWWiv-g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH+XeQYPBnXkXq4Fu0aBJ2UBR_U31ypza4z-1jf2Y78aWWiv-g@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764438837; x=1765043637; darn=buildroot.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:sender
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BR0uzddaWXTi9iMiAzsWGoslKX/o5/J0U4covLlMtL8=;
 b=QNSGjLMhpCcaaz1GhpRuCUiiQTaJo04BD3ZYOAKhL5+1bvVJP2n3a+GJcz93NuGiqt
 ds8x8X9k4FyCQ16PDsVZETU2UxpZA5zaAe2ATkJVSIIx3x1swOhhDSBSPnzcR0UlVNo3
 fWounHrdk4bFgdTD4VA/BBJRdj2OmO4eWeYZ736qYL9GCvtzwV9h0JnZJspXAMQRbkPk
 6Sg4LEJvg3HAf32a0E7bwGsHGaB3q+TxsSOvYcgbhJcE8EXuVoxvraqQ3iv8H6Qbm8Eq
 GUiYNWwNTou/JlyfEf02aVsq/vgDti3M+PlQlc2EM9MORv7V5/Cmw5L56Ylej9h0uhVK
 U7SQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QNSGjLMh
Subject: Re: [Buildroot] Compilation Issue with Commit
 793ebd5d28095c8df45a0d183d273d8a84b3f0a4
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Sm9zw6ksIEFsbCwKCk9uIDIwMjUtMTEtMjkgMTg6MTQgKzAxMDAsIEpvc8OpIEx1aXMgU2FsdmFk
b3IgUnVmbyBzcGFrZSB0aHVzbHk6Cj4gVGhlIGNvbW1pdCA3OTNlYmQ1ZDI4MDk1YzhkZjQ1YTBk
MTgzZDI3M2Q4YTg0YjNmMGE0IGJyb2tlIG15IGNvbXBpbGF0aW9uLgoKUGxlYXNlIGV4cGxhaW4g
d2hhdCB0aGUgcHJvYmxlbSBpcy4KCj4gQW4gQUkgc3VnZ2VzdGVkIHRoYXQgdGhlIHByb2JsZW0g
aXMgYmVjYXVzZSB0aGUgc2NyaXB0Cj4gYHN1cHBvcnQvc2NyaXB0cy9jaGVjay1tZXJnZWRgIHJl
cXVpcmVzIHRoZSBmb2xsb3dpbmcgY2hhbmdlOgoKRGlkIHlvdSB1bmRlcnN0YW5kIHdoeSB0aGUg
c3VnZ2VzdGVkIGNoYW5nZSBpcyBjb3JyZWN0PwoKSW4gdGhlIGVuZCwgSSBkb24ndCB0aGluayB3
ZSBzcGVjaWZpY2FsbHkgY2FyZSBob3cgeW91IGNhbWUgdXAgd2l0aCB0aGUKcHJvcG9zZWQgY2hh
bmdlLCBidXQgd2UgbmVlZCB0byBrbm93IHdoeSB0aGlzIGlzIGNvcnJlY3QuIFdlIGRvbid0IG5l
ZWQKc29tZSBoYW5kLXdhdmluZyAiSSBkb24ndCB1bmRlcnN0YW5kIHdoeSBidXQgaXQgd29ya3Ms
IG1hZ2ljISIsIGJ1dApyYXRoZXIgYW4gZXhwbGFuYXRpb24gZm9yIHdoeSB0aGlzIGlzIG5lZWRl
ZC4gVGhpcyBpcyBuZWVkZWQgZm9yIHRoZQpmdXR1cmUsIHdoZW4gd2UgZXZlbnR1YWxseSBuZWVk
IHRvIHJldmlzaXQgdGhhdCBjb21taXQgbGF0ZXIgb24sIHRvCnVuZGVyc3RhbmQgd2h5IHdlIHRo
b3VnaHQgdGhlIGZpeCB3YXMgY29ycmVjdCBiYWNrIHRoZW4sIGFuZCBzZWUgaWYgc29tZQphc3N1
bXB0aW9ucyB2YWxpZCByaWdodCBub3cgd291bGQgc3RpbGwgYmUgdGhlbi4KCkhvd2V2ZXIsIHRo
YW5rcyBmb3IgZGlzY2xvc2luZyB0aGUgdXNlIG9mIGFuIEFJIGFnZW50OyBub3RlIHRoYXQgbXkK
cmVwbHkgd291bGQgaGF2ZSBiZWVuIHRoZSBzYW1lIGV2ZW4gaWYgeW91IGhhZCBub3QuCgpXb3Vs
ZCB5b3UgY2FyZSB0byByZXN1Ym1pdCB0aGlzIHBhdGNoIHdpdGggYSBwcm9wZXIgY29tbWl0IGxv
ZyAobG9vayBhdAp0aGUgaGlzdG9yeSB0byBnZXQgc29tZSBpZGVhcyk7IHlvdSBjYW4gYWxzbyBs
b29rIGF0IHNvbWUgZGlyZWN0aW9ucyBpbgp0aGUgbWFudWFsIChpdCBpcyBhIGJpdCB2ZXJib3Nl
LCBidXQgY29udGFpbnMgYSBsb3Qgb2YgaW1wb3J0YW50CmluZm9ybWF0aW9uKToKCiAgICBodHRw
czovL2J1aWxkcm9vdC5vcmcvZG93bmxvYWRzL21hbnVhbC9tYW51YWwuaHRtbCNzdWJtaXR0aW5n
LXBhdGNoZXMKCkFsc28sIHBsZWFzZSBhZGQgaW4gdGhlIGNvbW1pdCBsb2cgdGhhdCB0aGlzIGZp
eGVzIGEgW3ByZXZpb3VzIGNvbW1pdCwKZS5nLiB3aXRoIGEgbGluZSByZWFkb2luZzsKCiAgICBG
aXhlczogNzkzZWJkNWQyODA5NWM4ZGY0NWEwZDE4M2QyNzNkOGE4NGIzZjBhNAoKV2hlbiB5b3Ug
ZG8gdGhhdCwgeW91IGNhbiBhZGQgbXk6CgogICAgUmV2aWV3ZWQtYnk6IFlhbm4gRS4gTU9SSU4g
PHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPgoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCj4gZGlm
ZiAtLWdpdCBhL3N1cHBvcnQvc2NyaXB0cy9jaGVjay1tZXJnZWQgYi9zdXBwb3J0L3NjcmlwdHMv
Y2hlY2stbWVyZ2VkCj4gaW5kZXggNDQ3YWJmZDgxNS4uMjNmZGFhYzJjOCAxMDA3NTUKPiAtLS0g
YS9zdXBwb3J0L3NjcmlwdHMvY2hlY2stbWVyZ2VkCj4gKysrIGIvc3VwcG9ydC9zY3JpcHRzL2No
ZWNrLW1lcmdlZAo+IEBAIC00Nyw2ICs0Nyw4IEBAIHdoaWxlIGdldG9wdHMgInQ6dWIiIE9QVDsg
ZG8KPiAgICAgICAgIGVzYWMKPiAgZG9uZQo+IAo+ICtzaGlmdCAkKChPUFRJTkQtMSkpCj4gKwo+
ICBpZiBbICIke3R5cGV9IiA9ICJza2VsZXRvbiIgXTsgdGhlbgo+ICAgICAgICAgc3RyaWN0PXRy
dWUKPiAgZWxzZQo+IAo+IEFmdGVyIGFwcGx5aW5nIHRoaXMgY2hhbmdlLCBteSBjb21waWxhdGlv
biB3b3JrcyBhZ2FpbiwgaW4gdGhlIHNhbWUKPiB3YXkgYXMgcmV2ZXJ0aW5nIGNvbW1pdCA3OTNl
YmQ1ZDI4MDk1YzhkZjQ1YTBkMTgzZDI3M2Q4YTg0YjNmMGE0Lgo+IEkgaGF2ZW7igJl0IGNoZWNr
ZWQgdGhlIHJlYXNvbiBmb3IgdGhpcyBgc2hpZnRgIG15c2VsZi4KPiAKPiBHcmVldGluZ3MuCgot
LSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0t
LS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUg
RW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMg
NjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9f
XyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0t
OiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmlu
LmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3Bp
cmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0t
LS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
