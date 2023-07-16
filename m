Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C023EB64DD
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 09:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35D5F81E3A;
	Sun, 16 Jul 2023 09:12:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35D5F81E3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id McPTV1XlEoU2; Sun, 16 Jul 2023 09:12:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73DFD81E2A;
	Sun, 16 Jul 2023 09:12:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73DFD81E2A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1B7531BF33E
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 09:12:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0E2D40354
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 09:12:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0E2D40354
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iMNVRyU2WIeq for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 09:12:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F8D540272
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0F8D540272
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 09:12:24 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-1b38121a011so2650484fac.2
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 02:12:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689498744; x=1692090744;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GZVLlobHO0DdVztrnjq0CKsWXbnkXGI1SEtZyz1T/qI=;
 b=L2QfoJRO5pKRVnqPDaDEabrSM2+37+QZXMvtU/iq4s4K+T5+jxuAyLhpPsnYJGZ6ih
 TQAkhedehFo8pTQpSvr2aqEqY55T9jSlNlPpcgoW4kD6mCwYWWfF13CqQ82aqpN6a+/j
 QuUWJf6uJKwLYQ9TChkBafw2k9K4qNKhaUNGLJvL16ma2lFaSC5VHv5tqvdJne+prM7T
 DoclCXObxEDf2ZBd8rjprztjvMMB7Y6nqbPTky4zWAkdkBUFaJCIVo0tW+7yqxEaDk1g
 VUg+bIOjeWrTrfcU/cgSW1TM3ojJmauKa0O66pYqr8xA76E5XQP9UuSV9MLzgvA1tEkx
 6ycw==
X-Gm-Message-State: ABy/qLbA8d+wnG9ZA9ce0LaWVeAnQ8ftRsFEB5BSValIKn3SqXtSv8gM
 IFItTqHg4nJtaG7pXvmL5wv39nlajNFOqrAiSAF/gTpVg+I=
X-Google-Smtp-Source: APBJJlFyy48JtUzhwd2aujVWdDBP11Uvw5Dlsd99f7JuJgx0hEjs4H0N8XiCv+CX0G5MVxe3LhKd87782nB95w3c59M=
X-Received: by 2002:a05:6871:287:b0:1ba:6180:ff47 with SMTP id
 i7-20020a056871028700b001ba6180ff47mr2864779oae.21.1689498743880; Sun, 16 Jul
 2023 02:12:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230716085544.3685087-1-bernd@kuhls.net>
In-Reply-To: <20230716085544.3685087-1-bernd@kuhls.net>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 16 Jul 2023 03:12:12 -0600
Message-ID: <CADvTj4r9Zo4dDdk=BYbMTWQFmpmmde8WST_czaF7f4QgL5mKZw@mail.gmail.com>
To: Bernd Kuhls <bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689498744; x=1692090744;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GZVLlobHO0DdVztrnjq0CKsWXbnkXGI1SEtZyz1T/qI=;
 b=GODttwgzRVsO9+iobdyrpmV5bYAKmQUs/wOnQASUa8HJpqbZpLcbOXEDBbtFWL2D3j
 HpdPCDnT2UCPuQag6t3c2cIFPBCG0Loxn44OEjWeThfacpS0j+xiatB7BZxNCJfdZ569
 mmkjNNJsThMOd71fKSjQppRKUCdPdzkxyYsAArpgr/3qF1SIGrdeQG0Lac+xvHVN/skG
 1RG82uiO82K5Ra+DtLmCmn/eSfLTBulaLZph4I5g8snIGvgpl28ohT983u/H+JloGSrU
 pveNbZvt29KeS8mSOfA6mXA8shZQZm+i7htuSZ2k+kKIX311iLWa9JOje0W1+qvDXjlp
 VwuA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=GODttwgz
Subject: Re: [Buildroot] [PATCH 1/1] package/pipewire: bump version to 0.3.74
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCBKdWwgMTYsIDIwMjMgYXQgMjo1NeKAr0FNIEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhs
cy5uZXQ+IHdyb3RlOgo+Cj4gQ2hhbmdlbG9nOgo+IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9w
Lm9yZy9waXBld2lyZS9waXBld2lyZS8tL2Jsb2IvbWFzdGVyL05FV1MKPgo+IFNpZ25lZC1vZmYt
Ynk6IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+Cj4gLS0tCj4gIHBhY2thZ2UvcGlwZXdp
cmUvcGlwZXdpcmUuaGFzaCB8IDIgKy0KPiAgcGFja2FnZS9waXBld2lyZS9waXBld2lyZS5tayAg
IHwgMiArLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKPgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3BpcGV3aXJlL3BpcGV3aXJlLmhhc2ggYi9wYWNr
YWdlL3BpcGV3aXJlL3BpcGV3aXJlLmhhc2gKPiBpbmRleCAwZTAyN2FhYTU1Li45OGRlMDczYmRi
IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcGlwZXdpcmUvcGlwZXdpcmUuaGFzaAo+ICsrKyBiL3Bh
Y2thZ2UvcGlwZXdpcmUvcGlwZXdpcmUuaGFzaAo+IEBAIC0xLDQgKzEsNCBAQAo+ICAjIExvY2Fs
bHkgY2FsY3VsYXRlZAo+IC1zaGEyNTYgIGM3OGM5NWNkZmYyNzc0NDE4ZjBhOTQ2OGU5NGExYjI4
MDA3NjFkMzIyZjEzMTA0ZGY2NTAxZTFhMGRjOTI1NTggIHBpcGV3aXJlLTAuMy42NS50YXIuYnoy
Cj4gK3NoYTI1NiAgYjMwZDg4NmI4N2FhOGMwNTVhZjZkNmM3MjYxZDFkMDQzMzZmM2E3NTIyMWMz
MWFmZTFlYThiYTg2MTg0YmY3MCAgcGlwZXdpcmUtMC4zLjc0LnRhci5iejIKPiAgc2hhMjU2ICA4
OTA5YzMxOWE3ZTI3ZGJiMzNhMTViOTAzNWY4OWFiM2I3YjJmNmExMmY4YmNkZGM3NTUyMDZhOGRi
MWFkYTQ0ICBDT1BZSU5HCj4gIHNoYTI1NiAgYmU0YmU1ZDc3NDI0ODMzZWRmMzFmNTNmYzFmMWNl
Y2I2OTk2YjllMmQ3NDdkOWU2ZmI4Zjg3ODM2MmViYzkyYiAgTElDRU5TRQo+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL3BpcGV3aXJlL3BpcGV3aXJlLm1rIGIvcGFja2FnZS9waXBld2lyZS9waXBld2ly
ZS5tawo+IGluZGV4IGVjZjRhMDM1ZWMuLmJiMTczOTcyYWEgMTAwNjQ0Cj4gLS0tIGEvcGFja2Fn
ZS9waXBld2lyZS9waXBld2lyZS5tawo+ICsrKyBiL3BhY2thZ2UvcGlwZXdpcmUvcGlwZXdpcmUu
bWsKPiBAQCAtNCw3ICs0LDcgQEAKPiAgIwo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+Cj4g
LVBJUEVXSVJFX1ZFUlNJT04gPSAwLjMuNjUKPiArUElQRVdJUkVfVkVSU0lPTiA9IDAuMy43NAoK
VGhlcmUncyBhIGZldyBuZXcgY29uZiBvcHRpb25zIHRoYXQgbmVlZCB0byBiZSBleHBsaWNpdGx5
IGVuYWJsZWQvZGlzYWJsZWQuCgpUaGUgbGlibXlzb2ZhIG9wdGlvbiBzaG91bGQgYmUgc2V0IGRp
c2FibGVkIHNpbmNlIHdlIGRvbid0IHBhY2thZ2UgaXQKaW4gYnVpbGRyb290OgotRGxpYm15c29m
YT1kaXNhYmxlZAoKVGhlIGxpYmZmYWRvIG9wdGlvbiBzaG91bGQgYmUgc2V0IGRpc2FibGVkIHNp
bmNlIHdlIGRvbid0IHBhY2thZ2UgaXQKaW4gYnVpbGRyb290OgotRGxpYmZmYWRvPWRpc2FibGVk
CgpUaGUgbmV3IG9wdXMgb3B0aW9uIHNob3VsZCBiZSBlbmFibGVkL2Rpc2FibGVkIGJhc2VkIG9u
IEJSMl9QQUNLQUdFX09QVVMKYmVpbmcgZW5hYmxlZC4KCj4gIFBJUEVXSVJFX1NPVVJDRSA9IHBp
cGV3aXJlLSQoUElQRVdJUkVfVkVSU0lPTikudGFyLmJ6Mgo+ICBQSVBFV0lSRV9TSVRFID0gaHR0
cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3BpcGV3aXJlL3BpcGV3aXJlLy0vYXJjaGl2ZS8k
KFBJUEVXSVJFX1ZFUlNJT04pCj4gIFBJUEVXSVJFX0xJQ0VOU0UgPSBNSVQsIExHUEwtMi4xKyAo
bGlic3BhLWFsc2EpLCBHUEwtMi4wIChsaWJqYWNrc2VydmVyKQo+IC0tCj4gMi4zOS4yCj4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
