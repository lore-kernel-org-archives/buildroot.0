Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A3C2C433EF
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 06:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0631F40C73;
	Tue, 17 May 2022 06:13:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VBK7WppnwVkN; Tue, 17 May 2022 06:13:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E6E76405AC;
	Tue, 17 May 2022 06:13:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 135221BF309
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 06:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC23C83E1A
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 06:13:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=jms.id.au
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y5IpyJPaWdp0 for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 06:13:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DE48F83E1B
 for <buildroot@buildroot.org>; Tue, 17 May 2022 06:13:53 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 a14-20020a7bc1ce000000b00393fb52a386so760202wmj.1
 for <buildroot@buildroot.org>; Mon, 16 May 2022 23:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=brc9iUGQPaSJc6fnbn1V0rgUTDjor0KnLEg7V+97BMc=;
 b=b45Y9//EI9uk4h1pyh9cIDQXDaHZApGU38QdZToR98d6ch0SP8Gd/e+VdnB76YrAb6
 2/z6zMgb0fYltxpj6RH2NBM9Trjf0dwkgHFZ0OFe6o0n+9nIMjcoN9Vv5bYc60KvnrYl
 4i8Lr35+KhbLBh4yhYO37PwHwj6aMQzS3YrRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=brc9iUGQPaSJc6fnbn1V0rgUTDjor0KnLEg7V+97BMc=;
 b=SIcWyaDC2FcEgjK1qQxFQ9zRIf8f+w286tS7vDQQn85VHAuVywPdlgEKY5NkOw6ujH
 FslBCEAd2Na19cIHnFojO+W6xVnlCT7khu6m2MhS5lfWd2ZoZOQV2alTTUlDkf26x886
 pNqG90fbtKW5WGmyTsuwx76rsNU05I4fMpRI12WNTQG/j3wRDFHkOD6IgunNFZingMQL
 pZ4nEZ88lyvKDPHG9+gOYhPHjoiZWwkLwRYy3gZWCieoH05ntVM5ENw2WVTEYEooK8BH
 +0Ku5F1I3PUB0kcwsICBvxk4lqWk07DpyxC9SkkydFnVCUrUcYKPsAFT3rLjN2CnAanL
 R/eQ==
X-Gm-Message-State: AOAM532JhSduEENOaoKU52HEdCv6490WSRuKlKzp6MjpyjF+ttacXwVa
 CmbwRd1TbNPTqXXHSbTUegiJ5dKYi0O9m18C0ki8YS4NMN4=
X-Google-Smtp-Source: ABdhPJxjd7uPlGcUhM+0FWLnGQ/j7HxtNa5DwEM2rTdelsjR5IFFTYaTh3j06URH8RvCFQz0SBDu1gt/Z+AQYjvH4a0=
X-Received: by 2002:a7b:cd82:0:b0:389:77ef:66d7 with SMTP id
 y2-20020a7bcd82000000b0038977ef66d7mr19249579wmj.171.1652768031829; Mon, 16
 May 2022 23:13:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220510022055.67582-1-joel@jms.id.au>
 <a18d0411-9134-2ee7-62d0-4ba6a1780846@mind.be>
In-Reply-To: <a18d0411-9134-2ee7-62d0-4ba6a1780846@mind.be>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 17 May 2022 06:13:39 +0000
Message-ID: <CACPK8Xem3ZS_fQdtcyO-wjeX43j+gW3bj0xmtxU4S5WVbtzXLw@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH] linux: Fix powerpc64le defconfig selection
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
Cc: Michael Ellerman <mpe@ellerman.id.au>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCAxMyBNYXkgMjAyMiBhdCAyMTo1MiwgQXJub3V0IFZhbmRlY2FwcGVsbGUgPGFybm91
dEBtaW5kLmJlPiB3cm90ZToKPgo+Cj4KPiBPbiAxMC8wNS8yMDIyIDA0OjIwLCBKb2VsIFN0YW5s
ZXkgd3JvdGU6Cj4gPiBUaGUgZGVmYXVsdCBkZWZjb25maWcgdGFyZ2V0IGZvciB0aGUgNjQgYml0
IHBvd2VycGMga2VybmVsIGlzCj4gPiBwcGM2NF9kZWZjb25maWcsIHRoZSBiaWcgZW5kaWFuIGNv
bmZpZ3VyYXRpb24uCj4gPgo+ID4gV2hlbiBidWlsZGluZyBmb3IgcG93ZXJwYzY0bGUgdXNlcnMg
d2FudCB0aGUgbGl0dGxlIGVuZGlhbiBrZXJuZWwgYXMKPiA+IHRoZXkgY2FuJ3QgYm9vdCBMRSB1
c2Vyc3BhY2Ugb24gYSBCRSBrZXJuZWwuCj4gPgo+ID4gRml4IHVwIHRoZSBkZWZjb25maWcgdXNl
ZCBpbiB0aGlzIGNhc2UuIFRoaXMgd2lsbCBhdm9pZCB0aGUgZm9sbG93aW5nCj4gPiBhdXRvYnVp
bGRlciBmYWlsdXJlOgo+ID4KPiA+ICAgVkRTTzMyQSBhcmNoL3Bvd2VycGMva2VybmVsL3Zkc28z
Mi9zaWd0cmFtcC5vCj4gPiAgIGNjMTogZXJyb3I6IOKAmC1tMzLigJkgbm90IHN1cHBvcnRlZCBp
biB0aGlzIGNvbmZpZ3VyYXRpb2luCj4gPiAgIG1ha2VbNF06ICoqKiBbYXJjaC9wb3dlcnBjL2tl
cm5lbC92ZHNvMzIvTWFrZWZpbGU6NDk6IGFyY2gvcG93ZXJwYy9rZXJuZWwvdmRzbzMyL3NpZ3Ry
YW1wLm9dIEVycm9yIDEKPiA+Cj4gPiAgIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9y
ZXN1bHRzL2RkNzZkNTNiYWI1NjQ3MGMwYjgzZTI5Njg3MmQ3YmI5MGY5ZTgyOTYvCj4gPgo+ID4g
Tm90ZSB0aGF0IHRoZSBmYWlsdXJlIGluZGljYXRlcyB0aGUgdG9vbGNoYWluIGlzIGNvbmZpZ3Vy
ZWQgdG8gZGlzYWJsZQo+ID4gdGhlIDMyIGJpdCB0YXJnZXQsIGNhdXNpbmcgdGhlIGtlcm5lbCB0
byBmYWlsIHdoZW4gYnVpbGRpbmcgdGhlIDMyIGJpdAo+ID4gVkRTTy4gVGhpcyBpcyBvbmx5IGEg
cHJvYmxlbSBvbiB0aGUgQkUga2VybmVsIGFzIHRoZSBMRSBrZXJuZWwgZGlzYWJsZXMKPiA+IENP
TkZJR19DT01QQVQsIGFrYSAzMiBiaXQgdXNlcnNwYWNlIHN1cHBvcnQsIGJ5IGRlZmF1bHQuCj4g
Pgo+ID4gU2lnbmVkLW9mZi1ieTogSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT4KPgo+ICAg
QXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4gSG93ZXZlciwgdGhlIGRlZmNvbmZpZyBtZWNoYW5p
c20gZm9yICphbGwqIHBvd2VycGMKPiBzZWVtcyBwcmV0dHkgYnJva2VuLiBIZXJlJ3Mgd2hhdCB3
ZSBoYXZlIGluIDUuMTYsIGJlZm9yZSB0aGF0IHRoZXJlIHdhcwo+IHNvbWV0aGluZyBzaW1pbGFy
Ogo+Cj4gIyBJZiB3ZSdyZSBvbiBhIHBwYy9wcGM2NC9wcGM2NGxlIG1hY2hpbmUgdXNlIHRoYXQg
ZGVmY29uZmlnLCBvdGhlcndpc2UganVzdCB1c2UKPiAjIHBwYzY0X2RlZmNvbmZpZyBiZWNhdXNl
IHdlIGhhdmUgbm90aGluZyBiZXR0ZXIgdG8gZ28gb24uCj4gdW5hbWUgOj0gJChzaGVsbCB1bmFt
ZSAtbSkKPiBLQlVJTERfREVGQ09ORklHIDo9ICQoaWYgJChmaWx0ZXIgcHBjJSwkKHVuYW1lKSks
JCh1bmFtZSkscHBjNjQpX2RlZmNvbmZpZwoKWWVzLCBtcGUgYW5kIEkgZGlzY3Vzc2VkIHRoaXMu
IHg4NiBkb2VzIGEgc2ltaWxhciB0aGluZzoKCmlmZXEgKCQoQVJDSCkseDg2KQogIGlmZXEgKCQo
c2hlbGwgdW5hbWUgLW0pLHg4Nl82NCkKICAgICAgICBLQlVJTERfREVGQ09ORklHIDo9IHg4Nl82
NF9kZWZjb25maWcKICBlbHNlCiAgICAgICAgS0JVSUxEX0RFRkNPTkZJRyA6PSBpMzg2X2RlZmNv
bmZpZwogIGVuZGlmCmVsc2UKICAgICAgICBLQlVJTERfREVGQ09ORklHIDo9ICQoQVJDSClfZGVm
Y29uZmlnCmVuZGlmCgpJZiB5b3Ugd2VyZSBidWlsZGluZyBvbiBhbiBlZy4gQXJtIG9yIFBvd2Vy
UEMgaG9zdCB3aXRoIEFSQ0g9eDg2LCB5b3UKd291bGQgZ2V0IHVuZXhwZWN0ZWQgcmVzdWx0cy4K
Cj4KPiAgIFNvIEkgZ3Vlc3Mgd2Ugc2hvdWxkIHVzZSBhIHNwZWNpZmljIGRlZmNvbmZpZyBmb3Ig
KmFsbCogcG93ZXJwYy4KPgo+ICAgVGhlIGFyY2gtZGVmYXVsdCBkZWZjb25maWcgaXMgZ2VuZXJh
bGx5IG5vdCByZWFsbHkgcmVsaWFibGUsIGZvciBleGFtcGxlIGZvcgo+IGFybSBpdCBhbHdheXMg
dGFrZXMgdjdfbXVsdGksIGJ1dCB0aGF0IHdvbid0IHdvcmsgZm9yIHY3bSB0YXJnZXRzLi4uCgpJ
IG5vdGljZWQgdGhhdC4gSXQgaXMgc2ltaWxhcmx5IGJyb2tlbiBpZiB5b3UgZXhwZWN0ZWQgYSBr
ZXJuZWwgdGhhdAp3b3JrZWQgb24gYXJtdjUuCgpTaG91bGQgd2UgZGlzYWJsZSBCUjJfTElOVVhf
S0VSTkVMX1VTRV9BUkNIX0RFRkFVTFRfQ09ORklHIGZvcgpwbGF0Zm9ybXMgdGhhdCBkb24ndCBo
YXZlIGEgc2luZ2xlIGRlZmNvbmZpZz8KClRoZSBvdGhlciBvcHRpb24gSSBjb25zaWRlcmVkIHdh
cyByZW1vdmluZyBBUkNIX0RFRkFVTFRfQ09ORklHIGFuZApwcm92aWRpbmcgYSBkZWZhdWx0IGZv
ciBwbGF0Zm9ybXMgd2hlcmUgd2UgY291bGQgc3VnZ2VzdCBvbmUuIEl0IHdvdWxkCmxvb2sgc29t
ZXRoaW5nIGxpa2UgdGhpczoKCi0tLSBhL2xpbnV4L0NvbmZpZy5pbgorKysgYi9saW51eC9Db25m
aWcuaW4KQEAgLTE3NiwxMCArMTc2LDE1IEBAIGVuZGNob2ljZQogY29uZmlnIEJSMl9MSU5VWF9L
RVJORUxfREVGQ09ORklHCiAgICAgICAgc3RyaW5nICJEZWZjb25maWcgbmFtZSIKICAgICAgICBk
ZXBlbmRzIG9uIEJSMl9MSU5VWF9LRVJORUxfVVNFX0RFRkNPTkZJRworICAgICAgIGRlZmF1bHQg
InBwYzY0bGVfZGVmY29uZmlnIiBpZiBCUjJfcG93ZXJwY19wb3dlcnBjNjRsZQorICAgICAgIGRl
ZmF1bHQgInBwYzY0X2RlZmNvbmZpZyIgaWYgQlIyX3Bvd2VycGNfcG93ZXJwYzY0CisgICAgICAg
ZGVmYXVsdCAicHBjX2RlZmNvbmZpZyIgaWYgQlIyX3Bvd2VycGNfcG93ZXJwYworICAgICAgIGRl
ZmF1bHQgIm11dGxpX3Y1X2RlZmNvbmZpZyIgaWYgQlIyX0FSTV9DUFVfQVJNVjUKKyAgICAgICBk
ZWZhdWx0ICJtdXRsaV92N19kZWZjb25maWciIGlmIEJSMl9BUk1fQ1BVX0FSTVY3QQorICAgICAg
IGRlZmF1bHQgImRlZmNvbmZpZyIKICAgICAgICBoZWxwCi0gICAgICAgICBOYW1lIG9mIHRoZSBr
ZXJuZWwgZGVmY29uZmlnIGZpbGUgdG8gdXNlLCB3aXRob3V0IHRoZQotICAgICAgICAgdHJhaWxp
bmcgX2RlZmNvbmZpZy4gIFRoZSBkZWZjb25maWcgaXMgbG9jYXRlZCBpbgotICAgICAgICAgYXJj
aC88YXJjaD4vY29uZmlncyBpbiB0aGUga2VybmVsIHRyZWUuCisgICAgICAgICBOYW1lIG9mIHRo
ZSBrZXJuZWwgZGVmY29uZmlnIGZpbGUgdG8gdXNlLiBUaGUgZGVmY29uZmlnIGlzIGxvY2F0ZWQg
aW4KKyAgICAgICAgIGFyY2gvPGFyY2g+L2NvbmZpZ3MgaW4gdGhlIGtlcm5lbCB0cmVlCgpJdCB3
b3VsZCBuZWVkIHRvIGNoYW5nZSB0aGUgb3B0aW9uIHRvIGluY2x1ZGUgdGhlIF9kZWZjb25maWcg
KGluIG9yZGVyCnRvIHN1cHBvcnQgcGxhaW4gb2xkICJkZWZjb25maWciKSwgb3Igd2UgY291bGQg
YWRkIHNvbWUgbG9naWMgaW4gdGhlCi5tayB0byBhZGQgX2RlZmNvbmZpZyBvbmx5IGlmIHRoZSBu
YW1lIGlzIG5vdCAiZGVmY29uZmlnIi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
