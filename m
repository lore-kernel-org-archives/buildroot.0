Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16FB9CA0ECD
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 15:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B78864145E;
	Mon, 11 Aug 2025 15:40:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EFfVa44z_4lC; Mon, 11 Aug 2025 15:40:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCC58414CC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCC58414CC;
	Mon, 11 Aug 2025 15:40:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D3E171C5
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 15:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9F634145E
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 15:40:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fedIFm3HqzE4 for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 15:40:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::930; helo=mail-ua1-x930.google.com;
 envelope-from=jesse@rivosinc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6668B413F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6668B413F6
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com
 [IPv6:2607:f8b0:4864:20::930])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6668B413F6
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 15:40:39 +0000 (UTC)
Received: by mail-ua1-x930.google.com with SMTP id
 a1e0cc1a2514c-88ddd1c6178so2707505241.2
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 08:40:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754926838; x=1755531638;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hrb6idp3KStosQqV0/uk1+4UWqW30zX21mnXQ/4vWXM=;
 b=RRUh2jaTWlRLkM/hL4N1347TBPv00oZU0w4prFy5SMFhpDKLrlatpfjseBl4PXgGlJ
 fJLAOddc2PGnRHHbjgTppj83NxESrlnOf+7j0DY/FpyiOQGD4uIPhrPEE/CIgWm8I9sJ
 S3CDgJjRAGg5/HHs28UuAtZR1GTzD5JyloiQKGH54WVJ8jSNlGT+mUgnq8nvHBOIToJx
 TUkEi1iy+IBUcuGBhyC5C1Qg/Y3sboowwA8gsTRI+rQGrRwGXtB2IyDdS/5s3LCXveIK
 hArq9/GltvlsFTLKuSOaMD++cxZ2qzgdcpjlI4pK+f+JnTH/wDCFZA/Pr7y3k927Fwaa
 DAmQ==
X-Gm-Message-State: AOJu0YzLpmyU2WvdciAfABbxufx5GI6s9TS70j2egRQtIk7nkm9tAt0Y
 vz3O+YT4Ky9zs5jO0id4855CuYiK3EoMAfLoLjYf3VG/UVV0fExHBkWZC6V+vPNfOZJHy/k46Bo
 7GyACb3y+7PGI3jV4tQ5vvxZJdNutt9PgbVxa5L3zJw==
X-Gm-Gg: ASbGnctGobUPZgIOqL9jbVWbI7AjeFm4ZbChCKf3SWMGbYHMTamfVAxVP4jv73T/MXw
 gK+cll7OsBBXmCTHukhLUrp5q47cliClYnDhFfyLu2zy7do4LATKa4PMmY3dfhaJea43W6bKyy1
 5RQhMastmHaEtwYXDJXrweHsMhN6QwPV78nXJinFxAGhH6hVsENlq5O3k5WITgThUVHJ5qB3S+1
 b0zTVLsKl+oZ2O2NgM=
X-Google-Smtp-Source: AGHT+IG7L08ayr36RmAkDf8OzI+VWZmDL1QYRfV5+1O5Gf8I3owJrmRRhNbqOXNdaNCJuspnD++K9kJ3Xz9A7BY03xs=
X-Received: by 2002:a05:6102:3a08:b0:4f9:6a91:cc97 with SMTP id
 ada2fe7eead31-5060f4baeddmr4806049137.27.1754926838004; Mon, 11 Aug 2025
 08:40:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250805151814.1114414-1-alex.bennee@linaro.org>
 <20250805151814.1114414-3-alex.bennee@linaro.org>
In-Reply-To: <20250805151814.1114414-3-alex.bennee@linaro.org>
From: Jesse Taube <jesse@rivosinc.com>
Date: Mon, 11 Aug 2025 08:40:27 -0700
X-Gm-Features: Ac12FXyWSzxTQJr9QGWr5ieMTPxMu3APUJASGFM6hmgKFnMi0VmftIIA7cePtXI
Message-ID: <CALSpo=ZEowv4Mh849WqWx4PxBP1aCMG7HGx=eV1cEcyam50Rdg@mail.gmail.com>
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: buildroot@buildroot.org, Thomas Huth <huth@tuxfamily.org>, 
 Cyril Bur <cyrilbur@gmail.com>, Jesse Taube <Jesse@rivosinc.com>, 
 Jesse Taube <Mr.Bossman075@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc.com; s=google; t=1754926838; x=1755531638; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hrb6idp3KStosQqV0/uk1+4UWqW30zX21mnXQ/4vWXM=;
 b=QyvbcPHng5qcNp3b+yf96v6HPUYp6KZnmrAEyHPQpEBjjuaU38d2Rw48g3vqFAbCM/
 TGq480zja0Wfnw0QtcfOwkPcvE4qs+LnsQvmja+dvg5Chg3FiBKX/R+OFRApC7/CiPwD
 70dpbAkLKV47bk9DZh2SAh6NTA10imwImNUvSvfoDCnvCyPSZZ7Ji91zir/n07vmUAQu
 bqFa1u7P5tcuD9S2qkX1KSX3gi5QM9cAr6Vk5Z8QUexsB+5uzHPgluOyVrqQdL7A9Ogb
 6iEt4QB2yEHpBa+/vKeOEz1PqNASL+YewqxB3xKFNUa8j59oa9WxPwc32/TWPE0ybRbN
 nSpw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=rivosinc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rivosinc.com header.i=@rivosinc.com header.a=rsa-sha256
 header.s=google header.b=QyvbcPHn
Subject: Re: [Buildroot] [PATCH v4 2/9] package/kvm-unit-tests: assume
 AArch64 supports KVM
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCBBdWcgNSwgMjAyNSBhdCA4OjE44oCvQU0gQWxleCBCZW5uw6llIDxhbGV4LmJlbm5l
ZUBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IEFsdGhvdWdoIGl0IGlzIHBvc3NpYmxlIHRvIGNvbmZp
Z3VyZSBhbiBBQXJjaDY0IENQVSB3aXRob3V0IHN1cHBvcnQKPiBmb3IgRUwyIGluIHByYWN0aWNl
IGFsbCB0aGUgY29tbW9uIEFBcmNoNjQgaGF2ZSBzdXBwb3J0ZWQKPiB2aXJ0dWFsaXNhdGlvbiBm
cm9tIHRoZSBzdGFydC4KPgo+IElmIHdlIHJlYWxseSB3YW50ZWQgdG8gYmUgc3RyaWN0IHdlIGNv
dWxkIGJsYWNrbGlzdCBrbm93biBub24tRUwyIENQVXMKPiBidXQgQUZBSUNUIGFsbCB0aGUgY3Vy
cmVudCBvbmVzIGluIHRoZSBjb25maWcgaGF2ZSBFTDIuCj4KPiBJIHNob3VsZCBhbHNvIG5vdGUg
S1ZNIG9uIEFybSBpcyBkZXByZWNhdGVkIGFuZCB3YXMgcmVtb3ZlZCBmcm9tIHRoZQo+IGtlcm5l
bCBpbiB2Ni4xMC4KPgo+IFJldmlld2VkLWJ5OiBUaG9tYXMgSHV0aCA8aHV0aEB0dXhmYW1pbHku
b3JnPgo+IFNpZ25lZC1vZmYtYnk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9y
Zz4KClNpZ25lZC1vZmYtYnk6IEplc3NlIFRhdWJlIDxqZXNzZUByaXZvc2luYy5jb20+Cgo+Cj4g
LS0tCj4gdjIKPiAgIC0gbGVhdmUgQlIyX2NvcnRleF9hNzYgYW5kIEJSMl9jb3J0ZXhfYTc2X2E1
NSBpbiBwbGFjZSBhcyBjYW4gYmUKPiAgIHVzZWQgd2l0aCBhcm0zMgo+IHYzCj4gICAtIHItYgo+
IHY0Cj4gICAtIHJlYmFzZSBmaXhlcwo+IC0tLQo+ICBwYWNrYWdlL2t2bS11bml0LXRlc3RzL0Nv
bmZpZy5pbiB8IDggKysrKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
NCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2t2bS11bml0LXRlc3RzL0Nv
bmZpZy5pbiBiL3BhY2thZ2Uva3ZtLXVuaXQtdGVzdHMvQ29uZmlnLmluCj4gaW5kZXggMGQ2NmEw
OGRkNy4uNzUzODM2MWRmNCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2t2bS11bml0LXRlc3RzL0Nv
bmZpZy5pbgo+ICsrKyBiL3BhY2thZ2Uva3ZtLXVuaXQtdGVzdHMvQ29uZmlnLmluCj4gQEAgLTEs
MTMgKzEsMTMgQEAKPiAgY29uZmlnIEJSMl9QQUNLQUdFX0tWTV9VTklUX1RFU1RTX0FSQ0hfU1VQ
UE9SVFMKPiAgICAgICAgIGJvb2wKPiAgICAgICAgICMgT24gQVJNLCBpdCBuZWVkcyB2aXJ0dWFs
aXphdGlvbiBleHRlbnNpb25zIGFuZCBsaXR0bGUgZW5kaWFuIENQVXMKPiAtICAgICAgIGRlZmF1
bHQgeSBpZiAoQlIyX2FybSB8fCBCUjJfYWFyY2g2NCkgJiYgXAo+ICsgICAgICAgZGVmYXVsdCB5
IGlmIEJSMl9hcm0gJiYgXAo+ICAgICAgICAgICAgICAgICAoQlIyX2NvcnRleF9hNyB8fCBCUjJf
Y29ydGV4X2ExMiB8fCBcCj4gICAgICAgICAgICAgICAgIEJSMl9jb3J0ZXhfYTE1IHx8IEJSMl9j
b3J0ZXhfYTE1X2E3IHx8IFwKPiAgICAgICAgICAgICAgICAgQlIyX2NvcnRleF9hMTcgfHwgQlIy
X2NvcnRleF9hMTdfYTcgfHwgXAo+IC0gICAgICAgICAgICAgICBCUjJfY29ydGV4X2E1NSB8fCBC
UjJfY29ydGV4X2E3NSB8fCBcCj4gLSAgICAgICAgICAgICAgIEJSMl9jb3J0ZXhfYTc1X2E1NSB8
fCBCUjJfY29ydGV4X2E3NiB8fCBcCj4gLSAgICAgICAgICAgICAgIEJSMl9jb3J0ZXhfYTc2X2E1
NSkKPiArICAgICAgICAgICAgICAgQlIyX2NvcnRleF9hNzYgfHwgQlIyX2NvcnRleF9hNzZfYTU1
ICkKPiArICAgICAgICMgRm9yIEFBcmNoNjQgd2UgY2FuIGFzc3VtZSBhbGwgdjguMCsgc3VwcG9y
dCB2aXJ0dWFsaXphdGlvbgo+ICsgICAgICAgZGVmYXVsdCB5IGlmIEJSMl9hYXJjaDY0Cj4gICAg
ICAgICBkZWZhdWx0IHkgaWYgQlIyX3Jpc2N2Cj4gICAgICAgICBkZWZhdWx0IHkgaWYgQlIyX2kz
ODYgfHwgQlIyX3g4Nl82NAo+ICAgICAgICAgZGVmYXVsdCB5IGlmIEJSMl9wb3dlcnBjNjQgfHwg
QlIyX3Bvd2VycGM2NGxlCj4gLS0KPiAyLjQ3LjIKPgo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
