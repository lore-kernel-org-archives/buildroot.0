Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D908DC4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 20:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 833B683CCA;
	Wed,  7 Feb 2024 20:49:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m2n3dRMIoIb2; Wed,  7 Feb 2024 20:49:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA03083CCE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA03083CCE;
	Wed,  7 Feb 2024 20:49:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0FDA91BF3DF
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 20:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0C4D41714
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 20:49:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3a5pEjfVgSOx for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 20:49:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6F55C41718
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F55C41718
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6F55C41718
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 20:49:05 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-51165efb684so2058192e87.3
 for <buildroot@buildroot.org>; Wed, 07 Feb 2024 12:49:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707338944; x=1707943744;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hJTLnWLU8qxiNkT0ea+1RZX3YjTEjI3zLio/D6DlGmA=;
 b=strwT3yTwZDSP7AGs8s/m6TUYI5BJQdzaGEjHfJIZCvnmowfSHji7Gnh0ThhYL9YY1
 jBCfFdJVfXF1MHeumzVwcmJHZ7beXVn5FcmYTO0U1+DOPWIMJaQKq3EPyB8DLAYdeQvU
 XvSxalYOql77dC+PO5QKZ0OSMlbAUtUAh4DlE6YJItxGzRbzlwWw/5UG8n27tIVBmvWu
 wv0NopB/d9FOTw/kZigDpvJo+ECMxdC3n3OIuxe6hjgNF+O2W16tg3KHSTQwF/svpCrF
 DxvS1KtpwtCJT57br6MEUAtV0Ks/+asFhl0UGirGtDL0UB2GkJz2R5p7XpMnYn+HUJW2
 OK9g==
X-Gm-Message-State: AOJu0YxYHkj8jKV2cF7b6ehJO1+8YNFqt6EMeqMPP3mRoXPJIW5NOYLX
 k1e6MFH2pdQyTSrnPc8/f6Hocnd7gjU+mzgVKDZlHRSEq4GBRcN9dddLRIoNGppB9H8tXhuRU/c
 BWePyDMriP+zlbN8qR0eZ7YY3Ngs=
X-Google-Smtp-Source: AGHT+IFbuiDr2Gu7VEW/Q9F2fVnTl62jRCAABsN6aO2KcYK3NixmjtYf6fQ0w39fXAb2m7abxE1H7P8TGU6aljM8EZ4=
X-Received: by 2002:ac2:5b85:0:b0:511:fb6:b1a0 with SMTP id
 o5-20020ac25b85000000b005110fb6b1a0mr5107998lfn.52.1707338943437; Wed, 07 Feb
 2024 12:49:03 -0800 (PST)
MIME-Version: 1.0
References: <20240114135446.1156025-1-fontaine.fabrice@gmail.com>
 <20240207164741.1bad9b44@windsurf>
In-Reply-To: <20240207164741.1bad9b44@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 7 Feb 2024 21:48:51 +0100
Message-ID: <CAPi7W83R+a-vwbBVS-Lk-u7gW5isBmfz8aJpCYUQap1cRM54Ug@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707338944; x=1707943744; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hJTLnWLU8qxiNkT0ea+1RZX3YjTEjI3zLio/D6DlGmA=;
 b=AM9CUMV3RevF55ypNBzpAbW2KIMcnJLQ2khaP2NgcrreDaV6aoartiFfOKOsdPo6Xr
 EYNuWZa7ygBsg3g35g9lB+E+LOx9JS90gJRdM5O4z9oKiKdowtcqmSPnel3+WiShd5m1
 x2W9AMM3b4qOwXAMa2hr++LsMGZHBgEVRl3q1jeu3vTZqz7fjIYl8brln31/rLgVvMiN
 8aWeyVHKKm62P2mqmYQs9ccgWMMqaI0MjqliLpvw0DP0wxK0C7KBOzop3MOKBR7ABC0p
 xNlNeW4tueUuyd0ehtk57+WMu+04OdufFpXLGxnerA2MMb80kuw0kO8CuFhbbf8UrhiV
 syTw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=AM9CUMV3
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/tinymembench: force arm mode instead of Thumb mode
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpMZSBtZXIuIDcgZsOpdnIuIDIwMjQgw6AgMTY6NDcsIFRob21hcyBQZXRhenpvbmkK
PHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IGEgw6ljcml0IDoKPgo+IEhlbGxvIEZhYnJp
Y2UsCj4KPiBPbiBTdW4sIDE0IEphbiAyMDI0IDE0OjU0OjQ2ICswMTAwCj4gRmFicmljZSBGb250
YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gPiArIyB0aW55bWVt
YmVuY2ggaGFzIHNvbWUgYXNzZW1ibHkgZnVuY3Rpb24gdGhhdCBpcyBub3QgcHJlc2VudCBpbiBU
aHVtYiBtb2RlOgo+ID4gKyMgRXJyb3I6IGluc3RydWN0aW9uIG5vdCBzdXBwb3J0ZWQgaW4gVGh1
bWIxNiBtb2RlIC0tIGBzdWJzIHIxLHIxLCMxNicKPiA+ICsjIHNvLCB3ZSBkZXNhY3RpdmF0ZSBU
aHVtYiBtb2RlCj4gPiAraWZlcSAoJChCUjJfQVJNX0lOU1RSVUNUSU9OU19USFVNQikseSkKPiA+
ICtUSU5ZTUVNQkVOQ0hfTUFLRV9PUFRTICs9IENGTEFHUz0iJChUQVJHRVRfQ0ZMQUdTKSAtbWFy
bSIKPiA+ICtlbmRpZgo+Cj4gV2h5IGRvbid0IHdlIHNpbXBseSBleHRlbmQgdGhlIGV4aXN0aW5n
IHBhdGNoIGluIHRoZSBzYW1lIHdheT8gSXQncwo+IGp1c3QgdGhhdCBuZXcgY29kZSBoYXMgYmVl
biBhZGRlZCBpbiBtYWluLmMgdGhhdCBpc24ndCBUaHVtYgo+IGNvbXBhdGlibGUsIHNvIEkgdGhp
bmsgeW91IGNvdWxkIGNoYW5nZToKPgo+ICNpZmRlZiBfX2FybV9fCj4KPiB0bwo+Cj4gI2lmIGRl
ZmluZWQoX19hcm1fXykgJiYgZGVmaW5lZChfX0FSTV9BUkNIX0lTQV9BUk0pCj4KPiBpbiBtYWlu
LmMsIGFuZCB0aGlzIHNob3VsZCBnZXQgeW91IGdvaW5nLiBDb3VsZCB5b3UgdHJ5IHRoaXMgaW5z
dGVhZD8KCkZpcnN0LCBpdCBzaG91bGQgYmUgbm90ZWQgdGhhdCB0aGUgYnVpbGQgZmFpbHVyZSBp
cyBub3QgcmVsYXRlZCB0byBhbnkKbmV3IGNvZGUsIHRoaXMgY29kZSB3YXMgYWxyZWFkeSB0aGVy
ZSBpbiB2MC4zOgpodHRwczovL2dpdGh1Yi5jb20vc3N2Yi90aW55bWVtYmVuY2gvYmxvYi92MC4z
L21haW4uYwoKTW9yZW92ZXIsIEkgYWxyZWFkeSB0cmllZCB0aGF0IGFwcHJvYWNoIGFuZCB0aGlz
IGRvZXNuJ3Qgd29yayBhcwpfX0FSTV9BUkNIX0lTQV9BUk0gaXMgZGVmaW5lZCBieSB0aGUgdG9v
bGNoYWluLgpfX0FSTV9BUkNIX0lTQV9USFVNQiB2YWx1ZSBjb3VsZCBiZSBjaGVja2VkIGluc3Rl
YWQgYnV0IEkgd2FzIG5vdApjb25maWRlbnQgaW4gdGhpcyBzb2x1dGlvbiBhczoKIC0gSSBkb24n
dCBmdWxseSB1bmRlcnN0YW5kIHdoYXQgYXJlIHRoZSBkaWZmZXJlbnQgbWVhbmluZyBvZgpfX0FS
TV9BUkNIX0lTQV97QVJNLFRIVU1CfSB2YWx1ZXMKIC0gdXBzdHJlYW0gZmVlZGJhY2sgb24gZmly
c3QgcGF0Y2ggd2FzIG5vdCByZWFsbHkgcG9zaXRpdmUgYmFjayBpbiAyMDE3CiAtIHVwc3RyZWFt
IHNlZW1zIGRlYWQgbm93IHNvIG5vbiB1cHN0cmVhbWFibGUgcGF0Y2hlcyB3aWxsIGhhdmUgdG8g
YmUKa2VwdCAiZm9yZXZlciIKCj4KPiBUaGFua3MhCj4KPiBUaG9tYXMKPiAtLQo+IFRob21hcyBQ
ZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KPiBFbWJlZGRlZCBMaW51eCBhbmQg
S2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwo+IGh0dHBzOi8vYm9vdGxpbi5jb20KCkJl
c3QgUmVnYXJkcywKCkZhYnJpY2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
