Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06742C54E66
	for <buildroot@archiver.kernel.org>; Tue, 12 Mar 2024 07:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F73A40147;
	Tue, 12 Mar 2024 07:18:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MZLpWR0tfxn1; Tue, 12 Mar 2024 07:18:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DA8C40472
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6DA8C40472;
	Tue, 12 Mar 2024 07:18:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 95DBD1BF2B5
 for <buildroot@lists.busybox.net>; Tue, 12 Mar 2024 07:18:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 903C4814B6
 for <buildroot@lists.busybox.net>; Tue, 12 Mar 2024 07:18:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CcA-_TOxKIJX for <buildroot@lists.busybox.net>;
 Tue, 12 Mar 2024 07:18:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 79057814AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79057814AB
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 79057814AB
 for <buildroot@buildroot.org>; Tue, 12 Mar 2024 07:18:49 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5131a9b3d5bso4876143e87.0
 for <buildroot@buildroot.org>; Tue, 12 Mar 2024 00:18:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710227927; x=1710832727;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5EskLOaSemKwsMVmrXNmls6POpXuBIIomkQi3/Lpri0=;
 b=urUM3TLPnElBu5DU5+JYhEphzCm/jEruBN1i/A8zsFs+AzBrQQ3mDJ3FbuW/iPJFEa
 08fuc2jmNPc3RUkSaxN82BwEPPJOp/chUn4Yy2CAwgZsfPDi8YdSnbMvFWk4YFI5WhAr
 y4seS7hpwIAxQkBJmTqcaw2oJY7wshNkSrJNL9kzGYsanRIROfXsH30ltnRlH5ALOBNR
 qVYpvT60F7R1cWncskyRtzzS38NaBafOiYkfJGYVXk692bkQSzQBSXY5takCs/jOb4Ft
 eOfgKSbQYzje9RVKhCwgAd6dFrE+AkMvdk8DBSewmTsPi6rfmgO+6zRyZ+ohD2JbS4my
 asOg==
X-Gm-Message-State: AOJu0YxFCI3pCNKAQZmWgkpZJcL/DoYD78eMBR1yGPIbGEwcPsCu0wTB
 O7Ft+HnX4y/hNIaZjDrT8hDSGw1yBjkbYhBk2yhq+qEtUkT3KCKblOUaLotwo/nIAIdY1+cFFuR
 vU66lMH5spWCyn6OMIMHSCGTz87s=
X-Google-Smtp-Source: AGHT+IHvE12EnxkLUejuvMA6nvuXGGkp5l6S/QwPTLsA5kJVLKYuClLwTjx3MkEiK3gIvmyZUi12XL6Nt3OINpTUOxE=
X-Received: by 2002:ac2:4311:0:b0:513:b8c7:7ecc with SMTP id
 l17-20020ac24311000000b00513b8c77eccmr802547lfh.60.1710227926789; Tue, 12 Mar
 2024 00:18:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240307122806.102726-1-fontaine.fabrice@gmail.com>
 <20240307134916.32738b5e@windsurf>
 <CAPi7W803mjZL9-rRu2wdcG=5t=D1wtDJET2S_SHfjCc_uvViVA@mail.gmail.com>
 <20240311123512.09c1c77d@windsurf>
In-Reply-To: <20240311123512.09c1c77d@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 12 Mar 2024 08:18:35 +0100
Message-ID: <CAPi7W808FakSM3CDpHEDrVh4HgHgfbZjd0SzK0W-pav1ub=3ww@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710227927; x=1710832727; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5EskLOaSemKwsMVmrXNmls6POpXuBIIomkQi3/Lpri0=;
 b=YdQd92PSfvFuwXWjXAl73ztMqk7cyjSJiV7b1xsNPsFvboFzvGP1CZrwr3advVW+Bs
 VV/dyAyCDTS/fJQvLFPHvzFAPxIb9ptskaOlGALzofPMCdYI8t90mnVykbgcwNn1sicm
 B2Qs2h7NrUBFDgYkeNlLGJeqdP5uYWwuBbBTuswp1I+NzKXSC6LQ4fS/aKHHBQxrHbl8
 QFCsT4MNOWtuXEq0We3kd39KjCAwAzoQR8Ak/YOP/EJfj7t2TlkeJOAKxRUI3Sg19XBc
 8wG7DrCq9gPHMM3zOk8EG49Fr4Z4lftotPS/9/s5ALhTr2UjjBTV767md+jF3KJH2xIA
 Ehhw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YdQd92PS
Subject: Re: [Buildroot] [PATCH 1/1] toolchain/Config.in: enable libatomic
 with BR2_BINFMT_FLAT
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKTGUgbHVuLiAxMSBtYXJzIDIwMjQgw6AgMTI6MzUsIFRob21hcyBQZXRh
enpvbmkKPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IGEgw6ljcml0IDoKPgo+IE9uIFRo
dSwgNyBNYXIgMjAyNCAxODoxODoyNCArMDEwMAo+IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5l
LmZhYnJpY2VAZ21haWwuY29tPiB3cm90ZToKPgo+ID4gPiBUaGFua3MgZm9yIHRoZSBwYXRjaC4g
RG8gd2Uga25vdyBzaW5jZSB3aGVuIHRoZXJlIGlzIHN1cHBvcnQgZm9yCj4gPiA+IGxpYmF0b21p
YyBmb3IgcGxhdGZvcm1zIHRoYXQgdXNlIHRoZSBGTEFUIGJpbmFyeSBmb3JtYXQ/IElzIHRoaXMK
PiA+ID4gc3BlY2lmaWMgdG8gQVJNL0ZMQVQsIG9yIGFwcGxpY2FibGUgdG8gYWxsIGNvbmZpZ3Vy
YXRpb25zIHRoYXQgdXNlIHRoZQo+ID4gPiBGTEFUIGJpbmFyeSBmb3JtYXQ/Cj4gPgo+ID4gTm9w
ZSwgSSBkb24ndCBrbm93LiBJIGRpZG4ndCBmaW5kIGFueSBjbHVlIGluIHVjbGliYy1uZyBnaXRo
dWIgaGlzdG9yeS4KPgo+IFRoYXQncyBiZWNhdXNlIGxpYmF0b21pYyBoYXMgbm90aGluZyB0byBk
byB3aXRoIHRoZSBDIGxpYnJhcnkuCj4gbGliYXRvbWljIGlzIHByb3ZpZGVkIGJ5IGdjYy4gU28g
aWYgeW91IHdhbnQgdG8gZmluZCBvdXQgd2h5IGl0IGlzIG5vdwo+IGF2YWlsYWJsZSBmb3IgRkxB
VCBwbGF0Zm9ybXMsIHlvdSBzaG91bGQgY2hlY2sgdGhlIGdjYyBHaXQgaGlzdG9yeSA6LSkKCkFm
dGVyIHJlYWRpbmcgZ2NjIGdpdCBoaXN0b3J5LCBJIGRpZG4ndCBmaW5kIGFueXRoaW5nIGVpdGhl
ci4KSG93ZXZlciwgSSBmb3VuZCBvdXQgc29tZSBpbmZvcm1hdGlvbiBpbiBidWlsZHJvb3QgZ2l0
IGhpc3RvcnkgWzFdOgoKIlRoZSBjYWlybyBwYWNrYWdlIGZhaWxzIHRvIGJ1aWxkIG9uIHNvbWUg
YXJjaGl0ZWN0dXJlczoKQlIyX1RPT0xDSEFJTl9IQVNfTElCQVRPTUlDIGlzIGVuYWJsZWQsIGJ1
dCBsaWJhdG9taWMgaXMgaW4gZmFjdCBub3QKYXZhaWxhYmxlLgpUaGlzIGhhcHBlbnMgYmVjYXVz
ZSB0aGUgZ2NjIGxvZ2ljIGluIGxpYmF0b21pYy9jb25maWd1cmUudGd0IGRvZXMgbm90CnJlY29n
bml6ZSAidWNsaW51eCIgYXMgYSB2YWxpZCBPUyBwYXJ0IG9mIHRoZSB0YXJnZXQgdHVwbGUsIGFu
ZAp0aGVyZWZvcmUgaXQgZG9lcyBub3QgYnVpbGQgbGliYXRvbWljLgpUaGUgInVjbGludXgiIHBh
cnQgb2YgdGhlIHR1cGxlIGlzIHVzZWQgYnkgQnVpbGRyb290IHdoZW4KQlIyX0JJTkZNVF9GTEFU
PXksIHNvIHdlIG1ha2UgQlIyX1RPT0xDSEFJTl9IQVNfTElCQVRPTUlDIGVuYWJsZWQgb25seQpp
ZiAhQlIyX0JJTkZNVF9GTEFULiIKClNvIGZpbmFsbHkgdGhpcyBsaWJhdG9taWMgd29ya2Fyb3Vu
ZCBoYXMgbm90aGluZyB0byBkbyB3aXRoIEZMQVQgYnkgaXRzZWxmLgpUaGUgdWNsaW51eCBoYW5k
bGluZyBoYXMgYmVlbiBmaXhlZCBidXQgb25seSBmb3IgYXJtIHNpbmNlIGdjYyAxMC4xLjAgd2l0
aCBbMl0uClNvIGRyb3BwaW5nIEJSMl9CSU5GTVRfRkxBVCB3aWxsIHByb2JhYmx5IHJhaXNlIGJ1
aWxkIGZhaWx1cmUgb24gb3RoZXIKYXJjaGl0ZWN0dXJlcy4KCkhvdyBzaG91bGQgSSBwcm9jZWVk
IGZvciBteSB2Mj8KU2hvdWxkIEkgcmVwbGFjZSAhQlIyX0JJTkZNVF9GTEFUIGJ5ICghQlIyX0JJ
TkZNVF9GTEFUPXkgfHwKKEJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzEwICYmIEJSMl9hcm0p
KT8KQW4gb3RoZXIgb3B0aW9uIHdvdWxkIGJlIHRvIGFkZCBkZWZhdWx0IHkgaWYKQlIyX1RPT0xD
SEFJTl9FWFRFUk5BTF9CT09UTElOX0FSTVY3TV9VQ0xJQkNfU1RBQkxFIChtb3JlIHNpbXBsZSBi
dXQKdWdseSkuCgpbMV0gaHR0cHM6Ly9naXQuYnVpbGRyb290Lm5ldC9idWlsZHJvb3QvY29tbWl0
Lz9pZD1iM2QxZmIyNmRjYWRkOGM1NzBlMmM0MTVjZTA1Mzk4ZWNjODEwYjMyClsyXSBodHRwczov
L2djYy5nbnUub3JnL2dpdC8/cD1nY2MuZ2l0O2E9Y29tbWl0O2g9YjFlMjFlNWE1ZDE5YjQzNmY5
NDg3MTBlMDkxNTdjNWIzMjQ0ZjU0MQoKPgo+IEJlc3QgcmVnYXJkcywKPgo+IFRob21hcwo+IC0t
Cj4gVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgo+IEVtYmVkZGVk
IExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCj4gaHR0cHM6Ly9ib290
bGluLmNvbQoKQmVzdCBSZWdhcmRzLAoKRmFicmljZQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
