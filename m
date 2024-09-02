Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A9FCA0ED3
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 13:31:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DECA24056B;
	Mon,  2 Sep 2024 13:31:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RMK2GqjG0qqj; Mon,  2 Sep 2024 13:31:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8AB8F40522
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8AB8F40522;
	Mon,  2 Sep 2024 13:31:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DE3CF1BF414
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 13:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC4EF80EEE
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 13:31:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aoYVlLBO-AeR for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 13:31:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112a; helo=mail-yw1-x112a.google.com;
 envelope-from=bmeng.cn@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9A41F80EEC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A41F80EEC
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A41F80EEC
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 13:31:55 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-699ac6dbf24so35844827b3.3
 for <buildroot@buildroot.org>; Mon, 02 Sep 2024 06:31:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725283914; x=1725888714;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6cVg9DPP1yO6nKfqR418L8BhMkSTS8Vvy4NaBiWpAq0=;
 b=tNZ7KLelRvykMSElM9z0pWWW/5ZGvlhRYv6yekHI2XQhLYJgPhnz40mhD+L88CPEbQ
 FxyGxwTtO4Ez2/7yCHYsOUUtLxXfMVbS/njlRBhfXbw329Y9f2suB/llA37vDNjGjom1
 6Ghv3Tjn7yfP5fEgZdbzlN3oggkFKQIhmtPnMU4OhH1Gtt6eRXpKSB1ze/kC/UAGXx4o
 usxcdgSqyRC7fIqhRC+5oskEC+BtJQBb0V9trdvrByrBHV6MEb/VIIjTEBxU5M28ofhV
 ol7mQ94nQTkjOBtnwpquCyD/J2HiPG6gP3uydibVqMCi4CNTuJs0LFQg03cP2jREppAy
 t1YQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXW9QmwPFz3VvvwFT6srjQJDSGECT5PsnqrPDtSPe/kHV60g5F0IJYXZ1oGpLO3UHua3D0vz1yRy9M=@buildroot.org
X-Gm-Message-State: AOJu0Yz3MZ77tO5m0TJF0AscnShNV4OWzZia7XSJuK+6I6dSeDbuPk7P
 XgTDyhiWxz2FngYwZkRZHF/R7Ghzt6Cgl2Ka/kH6SWpAvcMDLxIJG0K4kxibQVxyEM6WZyknpfN
 aIQruzQCF/jquptQbHXty2k+U/is=
X-Google-Smtp-Source: AGHT+IEE9VrLXqhzE5cUAII0Na3TM8mgfKaD0bXDwG4eRz88gKTs6XBgb807Xvg2sFoSLq0QAfMxqjtrOnc5B09xe7s=
X-Received: by 2002:a05:690c:660f:b0:6c8:94e9:52a0 with SMTP id
 00721157ae682-6d40da7f760mr95765137b3.9.1725283914282; Mon, 02 Sep 2024
 06:31:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240829154150.174934-1-bmeng.cn@gmail.com>
 <20240830190222.6e2285cc@windsurf>
In-Reply-To: <20240830190222.6e2285cc@windsurf>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 2 Sep 2024 21:31:42 +0800
Message-ID: <CAEUhbmVVsiEmRFYHNHLkkgSQAnvH+9Wsw5-Dcr496CXTaFqBoA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725283914; x=1725888714; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6cVg9DPP1yO6nKfqR418L8BhMkSTS8Vvy4NaBiWpAq0=;
 b=hvlLDI6GRve25jD59UQAfFkegfXpE3Y6GJX+5BqrFcDvHWqUOs/cpv6pjEu9qfWIKx
 bs2aMWehYM/6/pf0r4JdZK2sYwV7FrBJxsHEaim04MIeVtyj0V16mWCx4tPHF26dfQU8
 2DTbv4nbdmzgCOX9cLwcwuyinSYgMO7QBAjtvbMNbOKCiqKmSUpFxNRDF/p7wlbqezx+
 8mh54UHXjgZmP2VqekC6Cb3wVrcG9lzJVRDDutkf3/MxuOWjXPhY+r49z6+vpfUX/NXM
 o6Yk63Ae4JMUDfTVK2QOcZf8U6Okfj+8wuzs0bB69qW21abwLBF/8Xab97BEXDQgzft2
 9u0Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hvlLDI6G
Subject: Re: [Buildroot] [PATCH v2] configs: riscv: qemu: Drop
 BR2_TARGET_OPENSBI_CUSTOM_VERSION
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
Cc: Bin Meng <bmeng@tinylab.org>, Alistair Francis <alistair.francis@wdc.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoKT24gU2F0LCBBdWcgMzEsIDIwMjQgYXQgMTowMuKAr0FNIFRob21hcyBQZXRh
enpvbmkKPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGVsbG8gQmlu
LAo+Cj4gT24gVGh1LCAyOSBBdWcgMjAyNCAyMzo0MTo1MCArMDgwMAo+IEJpbiBNZW5nIDxibWVu
Zy5jbkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gPiBGcm9tOiBCaW4gTWVuZyA8Ym1lbmdAdGlueWxh
Yi5vcmc+Cj4gPgo+ID4gVXBkYXRlIHFlbXVfcmlzY3YzMl92aXJ0X2RlZmNvbmZpZyBhbmQgcWVt
dV9yaXNjdjY0X3ZpcnRfZGVmY29uZmlnCj4gPiB0byB1c2UgdGhlIGxhdGVzdCBPcGVuU0JJIGR1
ZSB0byB0aGUgcmVhc29uIHRoYXQ6Cj4gPgo+ID4gMS4gdGhleSBhcmUgdGhlIG1haW4gcGxhdGZv
cm1zIHRvIGRldmVsb3AgYW5kIHRlc3QgT3BlblNCSQo+ID4gMi4gbGF0ZXN0IE9wZW5TQkkgYmlu
YXJpZXMgYXJlIGFsd2F5cyBpbnRlZ3JhdGVkIGludG8gUUVNVSBhcwo+ID4gICAgdGhlIGRlZmF1
bHQgYmlvcwo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEJpbiBNZW5nIDxibWVuZ0B0aW55bGFiLm9y
Zz4KPiA+IC0tLQo+ID4gU2VlIHYxIEAgaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9q
ZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDIzMDYyNjE2MDAzMC45MzA2My03LWJtZW5nLmNuQGdtYWls
LmNvbS8KPgo+IFNvcnJ5IGJ1dCBuby4gV2UgX2RvXyB3YW50IG91ciBkZWZjb25maWdzIHRvIHNw
ZWNpZnkgYSBjdXN0b20gYW5kIGZpeGVkCj4gdmVyc2lvbiBvZiBMaW51eCwgVS1Cb290LCBPcGVu
U0JJLCBURi1BLCBldGMuCj4gU2VlIGh0dHBzOi8vYnVpbGRyb290Lm9yZy9kb3dubG9hZHMvbWFu
dWFsL21hbnVhbC5odG1sI2FkZGluZy1ib2FyZC1zdXBwb3J0Ogo+Cj4gIiIiCj4gQWx3YXlzIHVz
ZSBmaXhlZCB2ZXJzaW9ucyBvciBjb21taXQgaGFzaGVzIGZvciB0aGUgZGlmZmVyZW50Cj4gY29t
cG9uZW50cywgbm90IHRoZSAibGF0ZXN0IiB2ZXJzaW9uLiBGb3IgZXhhbXBsZSwgc2V0Cj4gQlIy
X0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTj15IGFuZAo+IEJSMl9MSU5VWF9LRVJORUxfQ1VT
VE9NX1ZFUlNJT05fVkFMVUUgdG8gdGhlIGtlcm5lbCB2ZXJzaW9uIHlvdSB0ZXN0ZWQKPiB3aXRo
Lgo+ICIiIgoKUUVNVSBpcyB0aGUgc3BlY2lhbCBjYXNlIGFzIEkgd3JvdGUgaW4gdGhlIGNvbW1p
dCBtZXNzYWdlLCB0aGF0OgoKMS4gdGhleSBhcmUgdGhlIG1haW4gcGxhdGZvcm1zIHRvIGRldmVs
b3AgYW5kIHRlc3QgT3BlblNCSQoyLiBsYXRlc3QgT3BlblNCSSBiaW5hcmllcyBhcmUgYWx3YXlz
IGludGVncmF0ZWQgaW50byBRRU1VIGFzIHRoZSBkZWZhdWx0IGJpb3MKClNvIE9wZW5TQkkgbGF0
ZXN0IHZlcnNpb24gaXMgYWx3YXlzIHRlc3RlZCBieSB0aGUgT3BlblNCSSBhbmQgUUVNVQpjb21t
dW5pdHkuIElNTyBrZWVwaW5nIHVwZGF0aW5nIHRoZSBkZWZjb25maWcgZm9yIHRoZXNlIDIgYm9h
cmRzIGRvZXMKbm90IG1ha2UgYSBsb3Qgb2Ygc2Vuc2UuCgo+Cj4gRG8gbm90IGhlc2l0YXRlIHRv
IHNlbmQgcGF0Y2hlcyB0byB1cGRhdGUgdGhlIE9wZW5TQkkgdmVyc2lvbiB1c2VkIGluCj4gdGhv
c2UgZGVmY29uZmlncywgYWZ0ZXIgdGVzdGluZyB0aGF0IHRoaXMgdXBkYXRlIHdvcmtzIGZpbmUg
Zm9yIHRob3NlCj4gcGFydGljdWxhciBwbGF0Zm9ybXMuCgpJZiB5b3Ugc3RpbGwgdGhpbmsgd2Ug
c2hvdWxkIGRvIHRoaXMsIEkgd291bGQgYXJndWUgd2UgY29tcGxldGVseSBkcm9wCnRoZSBCUjJf
VEFSR0VUX09QRU5TQklfTEFURVNUX1ZFUlNJT04gY29uZmlnIG9wdGlvbiBzbyB0aGF0IGFsbCBi
b2FyZHMKc2hhbGwgZXhwbGljaXRlbHkgc3BlY2lmeSB0aGUgT3BlblNCSSB2ZXJzaW9uIGluIHRo
ZWlyIGRlZmNvbmZpZwpmaWxlcy4KClJlZ2FyZHMsCkJpbgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
