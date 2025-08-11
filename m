Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F177CA0EC4
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 15:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A49D61429;
	Mon, 11 Aug 2025 15:56:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sDl2se67iO-h; Mon, 11 Aug 2025 15:56:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 296C6613E8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 296C6613E8;
	Mon, 11 Aug 2025 15:56:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D150E1C5
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 15:56:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C32BA40DE6
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 15:56:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B490BI8r5A7u for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 15:56:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e2b; helo=mail-vs1-xe2b.google.com;
 envelope-from=jesse@rivosinc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C1A6540D47
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1A6540D47
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com
 [IPv6:2607:f8b0:4864:20::e2b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C1A6540D47
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 15:56:19 +0000 (UTC)
Received: by mail-vs1-xe2b.google.com with SMTP id
 ada2fe7eead31-504dd872585so2153928137.3
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 08:56:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754927778; x=1755532578;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xvRo1+261neY2FTFDH7X8yWFudL9M9iv3gGSAfhTMUo=;
 b=mM2UYHC/rg9GIHmhck7nLvyliCECd7XxX1+kPCgWVfLklllPIWXu07TgxSDWDs1vNX
 ODeCBm7U+0WshtTWi7HYdXZ6FDsWbf4Qpewep+tNJykque84a2wOXbl2sXcVUgcN5MbC
 VqxjJ5FSKZRwNA748hRRZiWbegcAQxrRWpRWzD64l1n1dMEYfceHdZbI2oi/b3Mbf0Tg
 Ur59z0GplYvUa4brbr5bJ/p+rCwMyKsGnt73m1OqzcunAxQBXRdiI7YDYwIBTshowfp1
 ergGdwqNSpjP+7eFYbzqMX46XR1Xof5BOkKDPB/fIY3Vap+KnfyBqIak0O/CrTI7z2Is
 oYfA==
X-Gm-Message-State: AOJu0YwhIPUdQmdTnAaE7hmISGNRO6Yk6uC/B2Pk+ZpawOI3LsjVYprX
 WNzhxHZBJnCkEtxHDzOerx4T8SadQBKPdrnwutz2Nfj8DYa7TVDrOe5f5JAhzlsb5vWF1QPaOa3
 2bP6cd1aP/R/XOU6GIqTXRf651Hu+OpkOEO0Q6O7tww==
X-Gm-Gg: ASbGnctT1t6Vk69Wt+eeMg1X2jp1vtu35kBX7YLKtBEEXUVdXIyZ7JWKi06c565y6Se
 i+26yf0oUgxlNEeMj2jRBHfAUHwccuKU2m26KJee9Gn3E4nwCq4G5TF4rUfTYW2veL7m6ooQOxo
 rRwxLmlthbHhBzxns199ql2FMJatB6HTVds5Ha9z6dn0NGqKeSxtROzPquKjeMcVkv914Z5IzT7
 8BGWwVLyzhKbvNPINQ=
X-Google-Smtp-Source: AGHT+IHFh6edRPxmUfdEykaAkXEnw0vu50nyUtRLSQk1akWzXKe4+T0uSQtauHhTskRZnWYRkTJVXvMcTUJmDL3OaZM=
X-Received: by 2002:a05:6102:41a8:b0:4fd:3b67:4572 with SMTP id
 ada2fe7eead31-50cbeb7194bmr184817137.15.1754927778413; Mon, 11 Aug 2025
 08:56:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250805151814.1114414-1-alex.bennee@linaro.org>
 <20250805151814.1114414-3-alex.bennee@linaro.org>
 <CALSpo=ZEowv4Mh849WqWx4PxBP1aCMG7HGx=eV1cEcyam50Rdg@mail.gmail.com>
In-Reply-To: <CALSpo=ZEowv4Mh849WqWx4PxBP1aCMG7HGx=eV1cEcyam50Rdg@mail.gmail.com>
From: Jesse Taube <jesse@rivosinc.com>
Date: Mon, 11 Aug 2025 08:56:07 -0700
X-Gm-Features: Ac12FXxJNzfzUotc4fu723fGzUzTfIQ-Q96ddjXbgwSUtWrk4GHYsd6bJKd771Y
Message-ID: <CALSpo=a_EoHqfBm-mmHynK=S3_SRkBejOtUgNO6PZVyNPtrQWw@mail.gmail.com>
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: buildroot@buildroot.org, Thomas Huth <huth@tuxfamily.org>, 
 Cyril Bur <cyrilbur@gmail.com>, Jesse Taube <Mr.Bossman075@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc.com; s=google; t=1754927778; x=1755532578; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xvRo1+261neY2FTFDH7X8yWFudL9M9iv3gGSAfhTMUo=;
 b=Btw3vjgOmt2g/1k/NkuzKYIjAorIh/J0jOuo9U8yn4hHDuuYpNj28uMw+fXwaUSVW+
 RNapwGQLf42hYvO1jTlm3p1joCQHqUVtCBTg+likjrwACQRD86d8dPBKKPSgM0vffkot
 nipUQE6syxK4TZ8Rl9lNFlagV1HJ7IaqMLQipPAWJfPWiRUhmXj63F3ZoZHpEBGB2sJn
 CVSaSH3GePwhQ/5uq63+kxU7IBwBQaRRZiqy6BTiZNczNV/JojmS3nuFXDToVbDBbkAp
 OlZximjtloMlSQ6ZMqxQ1948tbFWWprHTNVJOqt4QGjiQ/LUZvJXFUsfH+c1wP4QC8Pd
 nZLA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=rivosinc.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com
 header.a=rsa-sha256 header.s=google header.b=Btw3vjgO
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

T24gTW9uLCBBdWcgMTEsIDIwMjUgYXQgODo0MOKAr0FNIEplc3NlIFRhdWJlIDxqZXNzZUByaXZv
c2luYy5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBBdWcgNSwgMjAyNSBhdCA4OjE44oCvQU0gQWxl
eCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPiB3cm90ZToKPiA+Cj4gPiBBbHRob3Vn
aCBpdCBpcyBwb3NzaWJsZSB0byBjb25maWd1cmUgYW4gQUFyY2g2NCBDUFUgd2l0aG91dCBzdXBw
b3J0Cj4gPiBmb3IgRUwyIGluIHByYWN0aWNlIGFsbCB0aGUgY29tbW9uIEFBcmNoNjQgaGF2ZSBz
dXBwb3J0ZWQKPiA+IHZpcnR1YWxpc2F0aW9uIGZyb20gdGhlIHN0YXJ0Lgo+ID4KPiA+IElmIHdl
IHJlYWxseSB3YW50ZWQgdG8gYmUgc3RyaWN0IHdlIGNvdWxkIGJsYWNrbGlzdCBrbm93biBub24t
RUwyIENQVXMKPiA+IGJ1dCBBRkFJQ1QgYWxsIHRoZSBjdXJyZW50IG9uZXMgaW4gdGhlIGNvbmZp
ZyBoYXZlIEVMMi4KPiA+Cj4gPiBJIHNob3VsZCBhbHNvIG5vdGUgS1ZNIG9uIEFybSBpcyBkZXBy
ZWNhdGVkIGFuZCB3YXMgcmVtb3ZlZCBmcm9tIHRoZQo+ID4ga2VybmVsIGluIHY2LjEwLgo+ID4K
PiA+IFJldmlld2VkLWJ5OiBUaG9tYXMgSHV0aCA8aHV0aEB0dXhmYW1pbHkub3JnPgo+ID4gU2ln
bmVkLW9mZi1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgoKUmV2aWV3
ZWQtYnk6IEplc3NlIFRhdWJlIDxqZXNzZUByaXZvc2luYy5jb20+CgpPb3BzLi4uCgo+Cj4gPgo+
ID4gLS0tCj4gPiB2Mgo+ID4gICAtIGxlYXZlIEJSMl9jb3J0ZXhfYTc2IGFuZCBCUjJfY29ydGV4
X2E3Nl9hNTUgaW4gcGxhY2UgYXMgY2FuIGJlCj4gPiAgIHVzZWQgd2l0aCBhcm0zMgo+ID4gdjMK
PiA+ICAgLSByLWIKPiA+IHY0Cj4gPiAgIC0gcmViYXNlIGZpeGVzCj4gPiAtLS0KPiA+ICBwYWNr
YWdlL2t2bS11bml0LXRlc3RzL0NvbmZpZy5pbiB8IDggKysrKy0tLS0KPiA+ICAxIGZpbGUgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL2t2bS11bml0LXRlc3RzL0NvbmZpZy5pbiBiL3BhY2thZ2Uva3ZtLXVuaXQtdGVz
dHMvQ29uZmlnLmluCj4gPiBpbmRleCAwZDY2YTA4ZGQ3Li43NTM4MzYxZGY0IDEwMDY0NAo+ID4g
LS0tIGEvcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9Db25maWcuaW4KPiA+ICsrKyBiL3BhY2thZ2Uv
a3ZtLXVuaXQtdGVzdHMvQ29uZmlnLmluCj4gPiBAQCAtMSwxMyArMSwxMyBAQAo+ID4gIGNvbmZp
ZyBCUjJfUEFDS0FHRV9LVk1fVU5JVF9URVNUU19BUkNIX1NVUFBPUlRTCj4gPiAgICAgICAgIGJv
b2wKPiA+ICAgICAgICAgIyBPbiBBUk0sIGl0IG5lZWRzIHZpcnR1YWxpemF0aW9uIGV4dGVuc2lv
bnMgYW5kIGxpdHRsZSBlbmRpYW4gQ1BVcwo+ID4gLSAgICAgICBkZWZhdWx0IHkgaWYgKEJSMl9h
cm0gfHwgQlIyX2FhcmNoNjQpICYmIFwKPiA+ICsgICAgICAgZGVmYXVsdCB5IGlmIEJSMl9hcm0g
JiYgXAo+ID4gICAgICAgICAgICAgICAgIChCUjJfY29ydGV4X2E3IHx8IEJSMl9jb3J0ZXhfYTEy
IHx8IFwKPiA+ICAgICAgICAgICAgICAgICBCUjJfY29ydGV4X2ExNSB8fCBCUjJfY29ydGV4X2Ex
NV9hNyB8fCBcCj4gPiAgICAgICAgICAgICAgICAgQlIyX2NvcnRleF9hMTcgfHwgQlIyX2NvcnRl
eF9hMTdfYTcgfHwgXAo+ID4gLSAgICAgICAgICAgICAgIEJSMl9jb3J0ZXhfYTU1IHx8IEJSMl9j
b3J0ZXhfYTc1IHx8IFwKPiA+IC0gICAgICAgICAgICAgICBCUjJfY29ydGV4X2E3NV9hNTUgfHwg
QlIyX2NvcnRleF9hNzYgfHwgXAo+ID4gLSAgICAgICAgICAgICAgIEJSMl9jb3J0ZXhfYTc2X2E1
NSkKPiA+ICsgICAgICAgICAgICAgICBCUjJfY29ydGV4X2E3NiB8fCBCUjJfY29ydGV4X2E3Nl9h
NTUgKQo+ID4gKyAgICAgICAjIEZvciBBQXJjaDY0IHdlIGNhbiBhc3N1bWUgYWxsIHY4LjArIHN1
cHBvcnQgdmlydHVhbGl6YXRpb24KPiA+ICsgICAgICAgZGVmYXVsdCB5IGlmIEJSMl9hYXJjaDY0
Cj4gPiAgICAgICAgIGRlZmF1bHQgeSBpZiBCUjJfcmlzY3YKPiA+ICAgICAgICAgZGVmYXVsdCB5
IGlmIEJSMl9pMzg2IHx8IEJSMl94ODZfNjQKPiA+ICAgICAgICAgZGVmYXVsdCB5IGlmIEJSMl9w
b3dlcnBjNjQgfHwgQlIyX3Bvd2VycGM2NGxlCj4gPiAtLQo+ID4gMi40Ny4yCj4gPgo+ID4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IGJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKPiA+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gPiBodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
