Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6187DC48BC4
	for <buildroot@archiver.kernel.org>; Wed, 14 Feb 2024 10:58:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 077E660F00;
	Wed, 14 Feb 2024 10:58:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FTA9zKtWlHBf; Wed, 14 Feb 2024 10:58:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC8CD60E1E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC8CD60E1E;
	Wed, 14 Feb 2024 10:58:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CD9091BF5B4
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 10:58:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BAA814173D
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 10:58:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5xLOr3IkfhBl for <buildroot@lists.busybox.net>;
 Wed, 14 Feb 2024 10:58:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=alexander.sverdlin@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 83D5E4173B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83D5E4173B
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 83D5E4173B
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 10:58:41 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40fb3b5893eso42160155e9.0
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 02:58:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707908319; x=1708513119;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Pw7eU1MUl5nLurS99nnGdG8iLD/paRuHL0hCk5VaU/0=;
 b=NPLc2AgTm3LWNQoMYu+6AX3GtSQFT+cdfyv4zFclJdOECSPCbQ0BJ/KwUHcqX1pWu0
 mkklOjn4+Q8feHmM/tnnh3AjXnp0CjM93jWzx9PKDjvQKt8kOoV3oH5zlXgWdykYG170
 g82zyjVXJK7Ps823GiUvRYBpjM3+boc2hr2JXuMsPODG9L3nhGGYDJXWtes9KcSeynC1
 yOpKdDD2847D+EbvLiTab7q2z1zc/qXmqARffSnD/PVosMcwLEppx/J5TEdIglDZFYjf
 d1/4HjCZwg++iV+fI6Oc0D3a1RZ+SBI35Oou6MZVYVO0Aihyh0hDzVlXMuq7L/d4a+EC
 Zcjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEPKtxiIFCayA68fw9c8Y1RpmjByBnW+aFW6sBO1SW12DcXjSGuZ+i7ZP4pg/sA8MHNaS8fjqvBuKzxFjsni2OAB7AhaDFqA==
X-Gm-Message-State: AOJu0YwXLOvYTRYuU6pVxI9RO9FuGfXMMzFvTpGAXUMQjt1TBZoscUIj
 XTY/zBD7QEScqKKWQX/hgb0Zr8sh4RuH7JLM0nLF0YZxb53y3xSyED1faXH4UhM=
X-Google-Smtp-Source: AGHT+IGLiz6tynlEmZsoNs4sJl8VndIydWRRw8cRNGeICNfFvHa9wfQB1hNPERncPuvykVdrm10Lbg==
X-Received: by 2002:a05:600c:3c90:b0:410:a289:1f5f with SMTP id
 bg16-20020a05600c3c9000b00410a2891f5fmr1609334wmb.14.1707908319415; 
 Wed, 14 Feb 2024 02:58:39 -0800 (PST)
Received: from giga-mm-1.home ([2a02:1210:8690:9300:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a05600c3b8200b00410c449f25asm1671751wms.6.2024.02.14.02.58.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 02:58:39 -0800 (PST)
Message-ID: <450e202a12ad55dd348d72840bbaaa3619a3c9ae.camel@gmail.com>
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Date: Wed, 14 Feb 2024 11:58:38 +0100
In-Reply-To: <20240213172817.2872849-11-romain.naour@smile.fr>
References: <20240213172817.2872849-1-romain.naour@smile.fr>
 <20240213172817.2872849-11-romain.naour@smile.fr>
Autocrypt: addr=alexander.sverdlin@gmail.com; prefer-encrypt=mutual;
 keydata=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
User-Agent: Evolution 3.50.4 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707908319; x=1708513119; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pw7eU1MUl5nLurS99nnGdG8iLD/paRuHL0hCk5VaU/0=;
 b=NPLz2rCtJsQ7ac3oZRZKHSamsUqr/HHbW/kwL1dpXlWafdGTK9H4PTnm8Aj6RiKfnO
 WYnAkPZL9BRZosQa0tuK9gRj6big6vJ8p+jWsR/f208J2WqdPU/8cqbuFlTEL2RXa6fG
 S8mzSD9Lp/7jc+A4cQVHy5t0ERqgk+SiayIpk1Z2mY5qfPi5vGegRmX0K12A0DimTxXX
 ttLlEsD2ncNxWNUhAPcHLDK5KT01K3+V5x2qBjHeXsJiyzJskj8g9Is9fwd+d4iDDtSw
 tbZwBOp+H8q3wrWHHWWwIhBo7wdsHjp90NKJtFulhJcZojb2vF+Ad+K22etOO2WIT0k1
 6WFg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NPLz2rCt
Subject: Re: [Buildroot] [PATCH 10/21] boot/ti-k3-r5-loader: add
 BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN option
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUm9tYWluLAoKT24gVHVlLCAyMDI0LTAyLTEzIGF0IDE4OjI4ICswMTAwLCBSb21haW4gTmFv
dXIgd3JvdGU6Cj4gUmVjZW50IHZlcnNpb24gb2YgVS1Cb290IHVzZSBiaW5tYW4gdG8gcHJvdmlk
ZSBhIG1lY2hhbmlzbSBmb3IgYnVpbGRpbmcKPiBpbWFnZXMsIGZyb20gc2ltcGxlIFNQTCArIFUt
Qm9vdCBjb21iaW5hdGlvbnMsIHRvIG1vcmUgY29tcGxleAo+IGFycmFuZ2VtZW50cyB3aXRoIG1h
bnkgcGFydHMuCj4gCj4gQXMgZm9yIFUtYm9vdCBwYWNrYWdlLCB0aGlzIHRvb2wgdXNlcyBhZGRp
dGlvbmFsIGhvc3QgcHl0aG9uIG1vZHVsZXMKPiB0aGF0IG11c3QgYmUgcHJvdmlkZWQgYnkgQnVp
bGRyb290LiBTbyBpbnRyb2R1Y2UgYSBuZXcgb3B0aW9uCj4gQlIyX1RBUkdFVF9USV9LM19SNV9M
T0FERVJfVVNFX0JJTk1BTiB0byBhZGQgYWRkaXRpb25hbCBob3N0IHBhY2thZ2VzCj4gaW4gVS1C
b290IGJ1aWxkIGRlcGVuZGVuY3kgdG8gdXNlIGJpbm1hbi4KPiAKPiBUaGUgYmlubWFuIHJlcXVp
cmVtZW50IGlzIGRpcmVjdGx5IGluY2x1ZGVkIGluIGJ1aWxkbWFuIGRlcGVuZGVuY3kKPiAodG9v
bHMvYnVpbGRtYW4vcmVxdWlyZW1lbnRzLnR4dCkgc2luY2Ugd2l0aGluIFUtQm9vdCwgYmlubWFu
IGlzCj4gaW52b2tlZCBieSB0aGUgYnVpbGQgc3lzdGVtLCBoZXJlIGJ1aWxkbWFuIFsxXS4KPiAK
PiBNYWtlIHN1cmUgdGhhdCBhbGwgYmlubWFuIHJlcXVpcmVtZW50cyBhcmUgYnVpbGQgYmVmb3Jl
Cj4gdGktazMtcjUtbG9hZGVyLgo+IAo+IFsxXSBodHRwczovL2RvY3MudS1ib290Lm9yZy9lbi92
MjAyNC4wMS9kZXZlbG9wL3BhY2thZ2UvYmlubWFuLmh0bWwjaW52b2tpbmctYmlubWFuLXdpdGhp
bi11LWJvb3QKPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBz
bWlsZS5mcj4KClJldmlld2VkLWJ5OiBBbGV4YW5kZXIgU3ZlcmRsaW4gPGFsZXhhbmRlci5zdmVy
ZGxpbkBnbWFpbC5jb20+Cgo+IC0tLQo+IE5vdGU6Cj4gwqAgYmlubWFuIGlzIGJ1bmRsZWQgaW4g
VS1Cb290IHNvdXJjZSBjb2RlLiBVc2UgIlVTRV9CSU5NQU4iIGluc3RlYWQgb2YKPiDCoCAiTkVF
RFNfQklOTUFOIiBzaW5jZSBpdCdzIG5vdCBhbiBleHRlcm5hbCBVLUJvb3QgZGVwZW5kZW5jeS4K
PiAtLS0KPiDCoGJvb3QvdGktazMtcjUtbG9hZGVyL0NvbmZpZy5pbsKgwqDCoMKgwqDCoMKgwqDC
oCB8wqAgOCArKysrKysrKwo+IMKgYm9vdC90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVy
Lm1rIHwgMTQgKysrKysrKysrKysrKysKPiDCoDIgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9u
cygrKQo+IAo+IGRpZmYgLS1naXQgYS9ib290L3RpLWszLXI1LWxvYWRlci9Db25maWcuaW4gYi9i
b290L3RpLWszLXI1LWxvYWRlci9Db25maWcuaW4KPiBpbmRleCA4YzgzNjhhMWE1Li5kNjc4YmQx
N2MyIDEwMDY0NAo+IC0tLSBhL2Jvb3QvdGktazMtcjUtbG9hZGVyL0NvbmZpZy5pbgo+ICsrKyBi
L2Jvb3QvdGktazMtcjUtbG9hZGVyL0NvbmZpZy5pbgo+IEBAIC05Myw0ICs5MywxMiBAQCBjb25m
aWcgQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfQ1VTVE9NX0NPTkZJR19GSUxFCj4gwqAJaGVs
cAo+IMKgCcKgIFBhdGggdG8gdGhlIFRJIEszIFI1IExvYWRlciBjb25maWd1cmF0aW9uIGZpbGUu
Cj4gwqAKPiArY29uZmlnIEJSMl9UQVJHRVRfVElfSzNfUjVfTE9BREVSX1VTRV9CSU5NQU4KPiAr
CWJvb2wgInRpLWszLXI1LWxvYWRlciB1c2UgYmlubWFuIgo+ICsJZGVwZW5kcyBvbiBCUjJfUEFD
S0FHRV9IT1NUX1JVU1RDX1RBUkdFVF9BUkNIX1NVUFBPUlRTICMgcHl0aG9uLXJwZHMtcHkgLT4g
cHl0aG9uLWpzb25zY2hlbWEKPiArCWhlbHAKPiArCcKgIFVzZSBiaW5tYW4gdG9vbCBmb3IgZ2Vu
ZXJhdGlvbiBhbmQgc2lnbmluZyBvZiBib290IGltYWdlcy4KPiArCj4gKwnCoCBodHRwczovL2Rv
Y3MudS1ib290Lm9yZy9lbi92MjAyNC4wMS9kZXZlbG9wL3BhY2thZ2UvYmlubWFuLmh0bWwKPiAr
Cj4gwqBlbmRpZgo+IGRpZmYgLS1naXQgYS9ib290L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1s
b2FkZXIubWsgYi9ib290L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIubWsKPiBpbmRl
eCAwZmZjYjgyMzVmLi44Zjg2ZTBmYjA3IDEwMDY0NAo+IC0tLSBhL2Jvb3QvdGktazMtcjUtbG9h
ZGVyL3RpLWszLXI1LWxvYWRlci5tawo+ICsrKyBiL2Jvb3QvdGktazMtcjUtbG9hZGVyL3RpLWsz
LXI1LWxvYWRlci5tawo+IEBAIC02MCw2ICs2MCwyMCBAQCBUSV9LM19SNV9MT0FERVJfTUFLRV9P
UFRTID0gXAo+IMKgCUhPU1RDQz0iJChIT1NUQ0MpICQoc3Vic3QgLUkvLC1pc3lzdGVtIC8sJChz
dWJzdCAtSSAvLC1pc3lzdGVtIC8sJChIT1NUX0NGTEFHUykpKSIgXAo+IMKgCUhPU1RMREZMQUdT
PSIkKEhPU1RfTERGTEFHUykiCj4gwqAKPiAraWZlcSAoJChCUjJfVEFSR0VUX1RJX0szX1I1X0xP
QURFUl9VU0VfQklOTUFOKSx5KQo+ICsjIGh0dHBzOi8vc291cmNlLmRlbnguZGUvdS1ib290L3Ut
Ym9vdC8tL2Jsb2IvdjIwMjQuMDEvdG9vbHMvYnVpbGRtYW4vcmVxdWlyZW1lbnRzLnR4dAo+ICtU
SV9LM19SNV9MT0FERVJfREVQRU5ERU5DSUVTICs9IFwKPiArCWhvc3QtcHl0aG9uLWpzb25zY2hl
bWEgXAo+ICsJaG9zdC1weXRob24tcHl5YW1sCj4gKyMgTWFrZSBzdXJlIHRoYXQgYWxsIGJpbm1h
biByZXF1aXJlbWVudHMgYXJlIGJ1aWxkIGJlZm9yZSB0aS1rMy1yNS1sb2FkZXIuCj4gK1RJX0sz
X1I1X0xPQURFUl9ERVBFTkRFTkNJRVMgKz0gXAo+ICsJaG9zdC1weXRob24zIFwKPiArCWhvc3Qt
cHl0aG9uLXNldHVwdG9vbHMgXAo+ICsJaG9zdC1weXRob24tcHlsaWJmZHQgXAo+ICsJaG9zdC1w
eXRob24tcHllbGZ0b29scwo+ICtUSV9LM19SNV9MT0FERVJfTUFLRV9PUFRTICs9IEJJTk1BTl9J
TkRJUlM9JChCSU5BUklFU19ESVIpCj4gK2VuZGlmCj4gKwo+IMKgZGVmaW5lIFRJX0szX1I1X0xP
QURFUl9CVUlMRF9DTURTCj4gwqAJJChUQVJHRVRfQ09ORklHVVJFX09QVFMpICQoVElfSzNfUjVf
TE9BREVSX01BS0UpIC1DICQoQEQpICQoVElfSzNfUjVfTE9BREVSX01BS0VfT1BUUykKPiDCoGVu
ZGVmCgotLSAKQWxleGFuZGVyIFN2ZXJkbGluLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
