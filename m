Return-Path: <SRS0=drHZ=PV=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 708DDC433EF
	for <buildroot@archiver.kernel.org>; Tue,  2 Nov 2021 17:26:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1DD8610CA
	for <buildroot@archiver.kernel.org>; Tue,  2 Nov 2021 17:26:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D1DD8610CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 642A940196;
	Tue,  2 Nov 2021 17:26:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EMC2Ue9urp4G; Tue,  2 Nov 2021 17:26:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63D54402E1;
	Tue,  2 Nov 2021 17:26:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2517E1BF291
 for <buildroot@lists.busybox.net>; Tue,  2 Nov 2021 17:26:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 143146060A
 for <buildroot@lists.busybox.net>; Tue,  2 Nov 2021 17:26:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AaqWyMsygQBk for <buildroot@lists.busybox.net>;
 Tue,  2 Nov 2021 17:26:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2EEA0605DF
 for <buildroot@buildroot.org>; Tue,  2 Nov 2021 17:26:17 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id bn12so3057376oib.2
 for <buildroot@buildroot.org>; Tue, 02 Nov 2021 10:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZhjR7+2vsvoipRZoM9ML3SQQQ0tBi2ny3UJK9iCll5E=;
 b=S7p3AbAj1bXmz6T+Bx9HPuu6axVJAWta/R+Mc24QjnZfEqyaiCMP+Phr95JQvLQ+LP
 tpyXA5OSgBtftjzMbNlEHjcESONtLO82fn+E+oaaUJ+X8oLGBVjfyU7rQRW9bXzdltZp
 ROlT8HGVkIWI5A4I2KoHrbF84noaCGP6OoI7Ng+B2SIJU4vfEH31Dt+5VbM443w2VlgC
 twfrn9WF6fSWcb5su2R94FaiWsszua/184w8m0us31FG0strQz4VMU7DqFYesGtouc51
 cfLiG6D6PFvs4I5S8aK1yjaWuXQ9O/aehyc9iizqNq/sNxpDYZlKHDexxuS+SX05UdJL
 P2iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZhjR7+2vsvoipRZoM9ML3SQQQ0tBi2ny3UJK9iCll5E=;
 b=PrCV2RCqFhQxrRER0qAAnFqxDVTIpOO7w53FW4RHiA08NJtG8xzBUdjguV+chhtfFR
 feqkzeryt2XLRR54ghDxO7AJqjguHnQLKzeXGCVTB+ip8JhWStdoZQ8epTKIyka8JUty
 DZ7vAWUtBw1z+7n5qad/n+jAavaNqfJNbgbHTwgTPc+9WQEvTJgCr4uL6BuRK/swcXGS
 HszHAu3XZwZ2g+BMaq+iLoNFNgXcYvvxYOODpBIM9FEQkE/YQJridqzXZDXc2tEireLP
 +o64+Lhype1JOMMoThnWyNpq2Fj85gLiDPxZDmYkiFZdC4XPifvRSIXB3hgvdvmcT6nF
 JqHw==
X-Gm-Message-State: AOAM531XPFF2EyFOmrWD9fVenXwE7H15sTcaqYjFBlIofxQribHgxHKL
 2jZBEOtXjJ4xD8aLHs4ReJ4LVLo5E8Q3eEpLHRA=
X-Google-Smtp-Source: ABdhPJwSz21A7qnxTMypksbGYJpTVCPF3dK7p23cUrr96BRiIURybJKywaZMcAL/ugaUO+zc+F91BrSEi7xVL3PuZMI=
X-Received: by 2002:a05:6808:159b:: with SMTP id
 t27mr6220780oiw.108.1635873976197; 
 Tue, 02 Nov 2021 10:26:16 -0700 (PDT)
MIME-Version: 1.0
References: <20211031224207.1385633-1-romain.naour@gmail.com>
 <BY5PR19MB36687517E13A0EE264B37A5FFB8A9@BY5PR19MB3668.namprd19.prod.outlook.com>
 <7a877d3b-95b9-55dc-8756-88fa9bb51876@gmail.com>
In-Reply-To: <7a877d3b-95b9-55dc-8756-88fa9bb51876@gmail.com>
From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 2 Nov 2021 10:26:05 -0700
Message-ID: <CAFSsvmqUvKZVr+uCFCpinRM5sK-3UdBrMXUXzJ1kF=i1xnXNxQ@mail.gmail.com>
To: Romain Naour <romain.naour@gmail.com>
Subject: Re: [Buildroot] [PATCH] package/refpolicy: enable refpolicy's xdg
 module when systemd is enabled
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
Cc: Antoine Tenart <atenart@kernel.org>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGV5IFJvbWFpbjsKClNvcnJ5IGZvciB0aGUgbGF0ZSByZXBseSEKCgpPbiBNb24sIE5vdiAxLCAy
MDIxIGF0IDI6MjMgQU0gUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPiB3cm90
ZToKPgo+IEhlbGxvIEFkYW0sCj4KPiBMZSAwMS8xMS8yMDIxIMOgIDA3OjEwLCByYXRiZXJ0OTAg
YSDDqWNyaXQgOgo+ID4gSGVsbG87Cj4gPgo+ID4gU2hvdWxkbuKAmXQgdGhpcyBnbyBpbiBzeXN0
ZW1kLm1rPwo+Cj4gSSdtIG5vdCBzdXJlIHRvIHVuZGVyc3RhbmQsIHdoYXQgZG8geW91IG1lYW4/
Cj4KPiBJdCdzIGFib3V0IGEgcmVmcG9saWN5IG1vZHVsZSBub3Qgc2VsaW51eCBtb2R1bGUgKFNZ
U1RFTURfU0VMSU5VWF9NT0RVTEVTKS4KClJlZnBvbGljeSBtb2R1bGVzIGFyZSBTRUxpbnV4IG1v
ZHVsZXMhCgpJIGp1c3QgdGVzdGVkIGJ5IGFkZGluZyB4ZGcgdG8gU1lTVEVNRF9TRUxJTlVYX01P
RFVMRVMgd2hpY2ggZG9lcwppbmRlZWQgZml4IHRoZSBpc3N1ZS4KCkFkYW0KPgo+IEFub3RoZXIg
d2F5IHRvIGZpeCB0aGUgaXNzdWUgaXMgdG8gYWRkIHhkcCB0byBCUjJfUkVGUE9MSUNZX0VYVFJB
X01PRFVMRVMgaW4gdGhlCj4gdGVzdCBjb25maWcuLi4gYnV0IEkgZG9uJ3QgdGhpbmsgaXQncyB0
aGUgcmlnaHQgZml4Lgo+Cj4gQmVzdCByZWdhcmRzLAo+IFJvbWFpbgo+Cj4KPiA+Cj4gPiBBZGFt
Cj4gPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gKkRhOiogYnVpbGRyb290IDxidWlsZHJv
b3QtYm91bmNlc0BidWlsZHJvb3Qub3JnPiBwZXIgY29udG8gZGkgUm9tYWluIE5hb3VyCj4gPiA8
cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4KPiA+ICpJbnZpYXRvOiogU3VuZGF5LCBPY3RvYmVyIDMx
LCAyMDIxIDM6NDI6MDcgUE0KPiA+ICpBOiogYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcgPGJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnPgo+ID4gKkNjOiogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJA
Z21haWwuY29tPjsgQW50b2luZSBUZW5hcnQgPGF0ZW5hcnRAa2VybmVsLm9yZz4KPiA+ICpPZ2dl
dHRvOiogW0J1aWxkcm9vdF0gW1BBVENIXSBwYWNrYWdlL3JlZnBvbGljeTogZW5hYmxlIHJlZnBv
bGljeSdzIHhkZyBtb2R1bGUKPiA+IHdoZW4gc3lzdGVtZCBpcyBlbmFibGVkCj4gPgo+ID4gcG9s
aWN5L21vZHVsZXMvc3lzdGVtL3N5c3RlbWQudGUgcmVxdWlyZXMgeGRnIG1vZHVsZSBlbmFibGVk
IFsxXQo+ID4gb3RoZXJ3aXNlIHJlZnBvbGljeSBmYWlsIHRvIGJ1aWxkOgo+ID4KPiA+IHBvbGlj
eS9tb2R1bGVzL3N5c3RlbS9zeXN0ZW1kLnRlOjI4ODpFUlJPUiAnYXR0cmlidXRlIHhkZ19jb25m
aWdfdHlwZSBpcyBub3QKPiA+IGRlY2xhcmVkJyBhdCB0b2tlbiAnOycgb24gbGluZSA1MDg0NDc6
Cj4gPgo+ID4gRml4ZXM6Cj4gPiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWls
ZHJvb3QvLS9qb2JzLzE3MTA1NTI0NjgKPiA+IDxodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290
Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzE3MTA1NTI0Njg+Cj4gPiBodHRwczovL2dpdGxhYi5jb20v
YnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzE3MTA1NTI0NzAKPiA+IDxodHRwczovL2dp
dGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzE3MTA1NTI0NzA+Cj4gPgo+
ID4gWzFdCj4gPiBodHRwczovL2dpdGh1Yi5jb20vU0VMaW51eFByb2plY3QvcmVmcG9saWN5L2Js
b2IvUkVMRUFTRV8yXzIwMjEwOTA4L3BvbGljeS9tb2R1bGVzL3N5c3RlbS9zeXN0ZW1kLnRlI0wy
ODgKPiA+IDxodHRwczovL2dpdGh1Yi5jb20vU0VMaW51eFByb2plY3QvcmVmcG9saWN5L2Jsb2Iv
UkVMRUFTRV8yXzIwMjEwOTA4L3BvbGljeS9tb2R1bGVzL3N5c3RlbS9zeXN0ZW1kLnRlI0wyODg+
Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwu
Y29tPgo+ID4gQ2M6IEFudG9pbmUgVGVuYXJ0IDxhdGVuYXJ0QGtlcm5lbC5vcmc+Cj4gPiAtLS0K
PiA+ICBwYWNrYWdlL3JlZnBvbGljeS9yZWZwb2xpY3kubWsgfCAxICsKPiA+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9yZWZwb2xp
Y3kvcmVmcG9saWN5Lm1rIGIvcGFja2FnZS9yZWZwb2xpY3kvcmVmcG9saWN5Lm1rCj4gPiBpbmRl
eCA5NzVjM2I1ODRjLi5iMWQxMDFlMzExIDEwMDY0NAo+ID4gLS0tIGEvcGFja2FnZS9yZWZwb2xp
Y3kvcmVmcG9saWN5Lm1rCj4gPiArKysgYi9wYWNrYWdlL3JlZnBvbGljeS9yZWZwb2xpY3kubWsK
PiA+IEBAIC02OSw2ICs2OSw3IEBAIFJFRlBPTElDWV9NT0RVTEVTID0gXAo+ID4gICAgICAgICAg
c3lzbmV0d29yayBcCj4gPiAgICAgICAgICB1bmNvbmZpbmVkIFwKPiA+ICAgICAgICAgIHVzZXJk
b21haW4gXAo+ID4gKyAgICAgICAkKGlmICQoQlIyX1BBQ0tBR0VfU1lTVEVNRCkseGRnKSBcCj4g
PiAgICAgICAgICAkKFBBQ0tBR0VTX1NFTElOVVhfTU9EVUxFUykgXAo+ID4gICAgICAgICAgJChj
YWxsIHFzdHJpcCwkKEJSMl9SRUZQT0xJQ1lfRVhUUkFfTU9EVUxFUykpIFwKPiA+ICAgICAgICAg
ICQoZm9yZWFjaCBkLCQoUkVGUE9MSUNZX0VYVFJBX01PRFVMRVNfRElSUyksXAo+ID4gLS0KPiA+
IDIuMzEuMQo+ID4KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gPiBidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwo+ID4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cj4gPiA8aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Pgo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
