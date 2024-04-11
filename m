Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D05B5CD128A
	for <buildroot@archiver.kernel.org>; Thu, 11 Apr 2024 11:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8574B400FB;
	Thu, 11 Apr 2024 11:50:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PqVtP5xE15uA; Thu, 11 Apr 2024 11:50:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51F4141839
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51F4141839;
	Thu, 11 Apr 2024 11:50:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 730A41BF86C
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 11:50:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E0308218A
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 11:50:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VKPMD2Kv-AKQ for <buildroot@lists.busybox.net>;
 Thu, 11 Apr 2024 11:50:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 04D3182187
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04D3182187
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 04D3182187
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 11:50:51 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2d8a24f8a3cso38370061fa.1
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 04:50:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712836249; x=1713441049;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w/PLZ0zNpgLw0Z7GzRhdtl/timUcmjkgiPz/wsahhpA=;
 b=F7hXz+SwJHMyhh/JNWIH5iwdzWKTZKcqH1q5624RP8hU16J5nPUQlDgKRPmPTxqpfW
 VX9ZEo7X8lbLpDzujWKzUIhmpD/PcKUCccNmNtKw4jT9Ny5pNQL8qoIXzaU/SUdnNwks
 PgVPMVMSMfVP7FYlyT3X2ghsLbFiM472XGBRilmWQKZlGxM6L7TVck+5BA1lhEjKVaVP
 Rh2LPXr5mSiVp+diI/iEYnVRn8RuEki5jxLsXj7RPEJZetTeN8IcNkt7L4jH9+GRUIEe
 QxxdhEVlL+Ck3hk63oLJBTWYzzaQfAVkmN7GLxQExaZ/GTAvWzMlqhbVGHIZFSONGSJN
 Soyw==
X-Gm-Message-State: AOJu0YzQ1a8phgyHbFWXzCEam5NtsoueSO5/97oxx8kXvxEVa0nfxbz9
 +Cc1Oc0U0Ym/e92lQwyPWgqPNjoKpZwFlSi4MotoHVyoycyz7ZeqkoiuaxixOwFq/LNbr7If25G
 /GOemO0MruXKBZzqqUFJn2zY0Eyw=
X-Google-Smtp-Source: AGHT+IF6zdbc+cD3yqbb7JeRrWZ9BNWqFzZy8s326Sn/2qcAGXZCWkznut1Pqi/eMqJHlU1cCcNW1sFS+e6TITgJJAc=
X-Received: by 2002:a05:651c:21c:b0:2d8:84a0:357a with SMTP id
 y28-20020a05651c021c00b002d884a0357amr3530400ljn.33.1712836249010; Thu, 11
 Apr 2024 04:50:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240404081714.1190807-1-heiko.thiery@gmail.com>
 <175783f5-a44c-47ae-b261-c9ddd8cb9291@smile.fr>
In-Reply-To: <175783f5-a44c-47ae-b261-c9ddd8cb9291@smile.fr>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 11 Apr 2024 13:50:36 +0200
Message-ID: <CAEyMn7bvT48jSPURFx2N_qK5c33nF3N+A6J34hc-ktWnKX26Gg@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712836249; x=1713441049; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w/PLZ0zNpgLw0Z7GzRhdtl/timUcmjkgiPz/wsahhpA=;
 b=VUFIXGrYBz3PWc7k3EFgHkoTJoDTLZs7/7/cEzEIoLFmJKdoTPzt11BKd4xpsuYBUE
 Ndi0ghTikTQPXq1o2MLumKifcyHMOdDVua33pUps6uuezL/E9ulRKA5eE/U4vqswJdul
 SyCwmwDTVkx3+yeQVg4WsJJlaz6kuKp+5TVI5sh02T9eOdMX+rLr6krsCZf9g7xYTHds
 or/ICBwO1jeeT2wyUQZQV+EA5OKhdBhe4Uk/1vGXMzhupougDBKYqgUFs0H+Luqr9m2R
 KGzfKRg62AHQzqCW2XmBaIey5eLUrcBCv3A4dk/z4CeTCoQFkDp2c77YXm9QbDizyFxx
 Sy1g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VUFIXGrY
Subject: Re: [Buildroot] [PATCH v2 1/3] package/python-yamllint: new package
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
Cc: michael@amarulasolutions.com, Michael Walle <michael@walle.cc>,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Andreas Dannenberg <dannenberg@ti.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUm9tYWluLAoKQW0gTWkuLCAxMC4gQXByLiAyMDI0IHVtIDIzOjU4IFVociBzY2hyaWViIFJv
bWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPjoKPgo+IEhlbGxvIEhlaWtvLAo+Cj4g
TGUgMDQvMDQvMjAyNCDDoCAxMDoxNywgSGVpa28gVGhpZXJ5IGEgw6ljcml0IDoKPiA+IFRoaXMg
aG9zdCBwYWNrYWdlIGlzIG5lZWRlZCBzaW5jZSB1LWJvb3QgMjAyNC4wNCBmb3IgYnVpbGRpbmcg
dGkgZGVmY29uZmlncy4KPiA+Cj4gPiBUaGlzIGlzIGFuIHJlcXVpcmVtZW50IGZvciB1c2luZyBi
dWlsZG1hbi9iaW5tYW4gWzFdLgo+ID4KPiA+IFsxXSBodHRwczovL3NvdXJjZS5kZW54LmRlL3Ut
Ym9vdC91LWJvb3QvLS9ibG9iL3YyMDI0LjA0L3Rvb2xzL2J1aWxkbWFuL3JlcXVpcmVtZW50cy50
eHQ/cmVmX3R5cGU9dGFncyNMMwo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEhlaWtvIFRoaWVyeSA8
aGVpa28udGhpZXJ5QGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gIHBhY2thZ2UvQ29uZmlnLmluICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+ID4gIHBhY2thZ2UvcHl0aG9uLXlhbWxs
aW50L0NvbmZpZy5pbiAgICAgICAgICAgIHwgIDYgKysrKysrCj4gPiAgcGFja2FnZS9weXRob24t
eWFtbGxpbnQvcHl0aG9uLXlhbWxsaW50Lmhhc2ggfCAgMyArKysKPiA+ICBwYWNrYWdlL3B5dGhv
bi15YW1sbGludC9weXRob24teWFtbGxpbnQubWsgICB8IDE1ICsrKysrKysrKysrKysrKwo+ID4g
IDQgZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBwYWNrYWdlL3B5dGhvbi15YW1sbGludC9Db25maWcuaW4KPiA+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgcGFja2FnZS9weXRob24teWFtbGxpbnQvcHl0aG9uLXlhbWxsaW50Lmhhc2gKPiA+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgcGFja2FnZS9weXRob24teWFtbGxpbnQvcHl0aG9uLXlhbWxsaW50Lm1r
Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvQ29uZmlnLmluIGIvcGFja2FnZS9Db25maWcu
aW4KPiA+IGluZGV4IDg3NzY3OTkzYTIuLmEwMjM3MGEyYWQgMTAwNjQ0Cj4gPiAtLS0gYS9wYWNr
YWdlL0NvbmZpZy5pbgo+ID4gKysrIGIvcGFja2FnZS9Db25maWcuaW4KPiA+IEBAIC0xNDM3LDYg
KzE0MzcsNyBAQCBtZW51ICJFeHRlcm5hbCBweXRob24gbW9kdWxlcyIKPiA+ICAgICAgIHNvdXJj
ZSAicGFja2FnZS9weXRob24teG1sanNvbi9Db25maWcuaW4iCj4gPiAgICAgICBzb3VyY2UgInBh
Y2thZ2UvcHl0aG9uLXhtbHRvZGljdC9Db25maWcuaW4iCj4gPiAgICAgICBzb3VyY2UgInBhY2th
Z2UvcHl0aG9uLXhtb2RlbS9Db25maWcuaW4iCj4gPiArICAgICBzb3VyY2UgInBhY2thZ2UvcHl0
aG9uLXlhbWxsaW50L0NvbmZpZy5pbiIKPiA+ICAgICAgIHNvdXJjZSAicGFja2FnZS9weXRob24t
eWFybC9Db25maWcuaW4iCj4gPiAgICAgICBzb3VyY2UgInBhY2thZ2UvcHl0aG9uLXlhdGwvQ29u
ZmlnLmluIgo+ID4gICAgICAgc291cmNlICJwYWNrYWdlL3B5dGhvbi16Yy1sb2NrZmlsZS9Db25m
aWcuaW4iCj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24teWFtbGxpbnQvQ29uZmlnLmlu
IGIvcGFja2FnZS9weXRob24teWFtbGxpbnQvQ29uZmlnLmluCj4gPiBuZXcgZmlsZSBtb2RlIDEw
MDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMC4uY2I2N2IzNTVjMwo+ID4gLS0tIC9kZXYvbnVsbAo+
ID4gKysrIGIvcGFja2FnZS9weXRob24teWFtbGxpbnQvQ29uZmlnLmluCj4gPiBAQCAtMCwwICsx
LDYgQEAKPiA+ICtjb25maWcgQlIyX1BBQ0tBR0VfUFlUSE9OX1lBTUxMSU5UCj4gPiArICAgICBi
b29sICJweXRob24teWFtbGxpbnQiCj4KPiBZb3UgYXJlIGFkZGluZyB0aGUgdGFyZ2V0IHZhcmlh
bnQgaGVyZSBidXQgcHl0aG9uLXB5eWFtbCBhbmQgcHl0aG9uLXBhdGhzcGVjCj4gcnVudGltZSBk
ZXBlbmRlbmNpZXMgYXJlIG1pc3Npbmc6CgpZb3UgYXJlIHJpZ2h0LiBKdXN0IGFkZGVkIHRoaXMg
aGVyZS4KCj4KPiBodHRwczovL2dpdGh1Yi5jb20vYWRyaWVudmVyZ2UveWFtbGxpbnQvYmxvYi9t
YXN0ZXIvcHlwcm9qZWN0LnRvbWwjTDIwCj4KPiBTaW5jZSBweXRob24gcGFja2FnZSBlYXNpbHkg
YnJlYWsgYXQgcnVudGltZSwgaXQgd291bGQgYmUgZ3JlYXQgaWYgeW91IGNhbiBhZGQgYQo+IHJ1
bnRpbWUgdGVzdC4KCkFzIGV4cGVjdGVkIHRoZSB0YXJnZXQgcGFja2FnZSBicmVha3MgYmVjYXVz
ZXQgcHl0aHNwZWMgaXMgbm90IHByZXNlbnQKYmVjYXVzZSBpdCBpcyBub3QgYXZhaWxhYmxlIGFz
IHRhcmdldCBwYWNrYWdlLiBJIHdpbGwgZml4IHRoYXQsIGFkZAp0aGUgdGVzdGNhc2UgYW5kIHBy
ZXBhcmUgZm9yIHYyLgoKPiBJIHRlc3RlZCB0aGUgaG9zdCB2YXJpYW50IHRvIGJ1aWxkIHVib290
IDIwMjQuMDQgZm9yIHRoZSBTSy1UREE0Vk0gYm9hcmQuCgp0aGFua3MKCj4gVGVzdGVkLWJ5OiBS
b21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4KPgo+IEJlc3QgcmVnYXJkcywKPiBS
b21haW4KPgo+Cj4gPiArICAgICBoZWxwCj4gPiArICAgICAgIEEgbGludGVyIGZvciBZQU1MIGZp
bGVzLgo+ID4gKwo+ID4gKyAgICAgICBodHRwczovL2dpdGh1Yi5jb20vYWRyaWVudmVyZ2UveWFt
bGxpbnQKPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi15YW1sbGludC9weXRob24teWFt
bGxpbnQuaGFzaCBiL3BhY2thZ2UvcHl0aG9uLXlhbWxsaW50L3B5dGhvbi15YW1sbGludC5oYXNo
Cj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMC4uZDgwZTBmZGY0
Mgo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvcGFja2FnZS9weXRob24teWFtbGxpbnQvcHl0
aG9uLXlhbWxsaW50Lmhhc2gKPiA+IEBAIC0wLDAgKzEsMyBAQAo+ID4gKyMgTG9jYWxseSBjb21w
dXRlZCBzaGEyNTYgY2hlY2tzdW1zCj4gPiArc2hhMjU2ICA3YTAwMzgwOWY4ODMyNGZkMmM4Nzc3
MzRmMmQ1NzVlZTc4ODFkZDkwNDMzNjA2NTdjYzgwNDljODA5ZWJhNmNkICB5YW1sbGludC0xLjM1
LjEudGFyLmd6Cj4gPiArc2hhMjU2ICAzOTcyZGM5NzQ0ZjY0OTlmMGY5YjJkYmY3NjY5NmYyYWU3
YWQ4YWY5YjIzZGRlNjZkNmFmODZjOWRmYjM2OTg2ICBMSUNFTlNFCj4gPiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS9weXRob24teWFtbGxpbnQvcHl0aG9uLXlhbWxsaW50Lm1rIGIvcGFja2FnZS9weXRo
b24teWFtbGxpbnQvcHl0aG9uLXlhbWxsaW50Lm1rCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+
ID4gaW5kZXggMDAwMDAwMDAwMC4uY2VhY2EzYjBiOAo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysr
IGIvcGFja2FnZS9weXRob24teWFtbGxpbnQvcHl0aG9uLXlhbWxsaW50Lm1rCj4gPiBAQCAtMCww
ICsxLDE1IEBACj4gPiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiA+ICsjCj4gPiArIyBweXRo
b24teWFtbGxpbnQKPiA+ICsjCj4gPiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiA+ICsKPiA+
ICtQWVRIT05fWUFNTExJTlRfVkVSU0lPTiA9IDEuMzUuMQo+ID4gK1BZVEhPTl9ZQU1MTElOVF9T
T1VSQ0UgPSB5YW1sbGludC0kKFBZVEhPTl9ZQU1MTElOVF9WRVJTSU9OKS50YXIuZ3oKPiA+ICtQ
WVRIT05fWUFNTExJTlRfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNr
YWdlcy9kYS8wNi9kOGNlZTVjM2RmZDU1MGNjMGE0NjZlYWQ4YjMyMTEzODE5ODQ4NWQxMDM0MTMw
YWMxMzkzY2M0OWQ2M2UKPiA+ICtQWVRIT05fWUFNTExJTlRfU0VUVVBfVFlQRSA9IHBlcDUxNwo+
ID4gK1BZVEhPTl9ZQU1MTElOVF9MSUNFTlNFID0gR1BMLTMuMAo+ID4gK1BZVEhPTl9ZQU1MTElO
VF9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQo+ID4gKwo+ID4gKyQoZXZhbCAkKHB5dGhvbi1wYWNr
YWdlKSkKPiA+ICskKGV2YWwgJChob3N0LXB5dGhvbi1wYWNrYWdlKSkKPiA+IC0tCj4gPiAyLjM5
LjIKPiA+Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
