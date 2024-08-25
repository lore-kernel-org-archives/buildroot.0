Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 034B7C5321E
	for <buildroot@archiver.kernel.org>; Sun, 25 Aug 2024 15:06:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6979A4027B;
	Sun, 25 Aug 2024 15:06:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GB1mVzENnLPD; Sun, 25 Aug 2024 15:06:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57FA840270
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57FA840270;
	Sun, 25 Aug 2024 15:06:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EBFEB1BF369
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 15:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E84FA80D55
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 15:06:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7s56QEJH9FCx for <buildroot@lists.busybox.net>;
 Sun, 25 Aug 2024 15:06:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1136; helo=mail-yw1-x1136.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C2CF580D3C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2CF580D3C
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C2CF580D3C
 for <buildroot@buildroot.org>; Sun, 25 Aug 2024 15:06:21 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-690e9001e01so33165507b3.3
 for <buildroot@buildroot.org>; Sun, 25 Aug 2024 08:06:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724598380; x=1725203180;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Phr+y60zSfU/s5ukjWhpHGJjX/Xvo2Y9mF37jv821gs=;
 b=SXzFBzPBl6LWC9jb5QTDnWv4lAVVdwa/WK/rdZ4lnK/paqSgZcX8HwPIeuhwpbfczS
 G/veiwBtS+CGqxrNoYioWpmWsdgp1pAmKi1ZJ4qNi/aaFLU5p8vA+vS04ZT1um1t9NaN
 AfIt6wnW1DEkXwj14pTguHGFL9VpYnUIiOwDrVpVR6bbcbYFbIS1lapjqaPJQj353QFR
 Y8QhffxkDvYJVsQ9FejkkFVylZYdFE8xYvCpE7nEiwoKyQtrwP1vW97fbcSwJO/1drm/
 1AEKfnSFTxO1X25oPpMVwApmIaGMQIlDX2RUREHrnH4V381ddzvCK5J95x9ZFQkxLYGf
 YyDg==
X-Gm-Message-State: AOJu0YwwCtnWx9DtaVHNHdjNtXBzlwnXyrcgtg8dYaGQWJigNuso9CPD
 R2xpAyNcaFmMcy0lliAL5ACcl418S3OylUZieaCCJzyZdqR6MBjTBJ+LVtfIqjzni0RMHQWDz+I
 iT5eUyDiN7A2dkcimgGDYvFUkv6Ykidh+R22yuQ==
X-Google-Smtp-Source: AGHT+IFUqLZksdfL7sgWpqGaXQhKA+hIPBE5GejBs1BdBROwbSwBo1VTVkCMCE9Y7+HE4FicCq8bGT82wWEGf0S2JzY=
X-Received: by 2002:a05:690c:2d06:b0:6b2:7bd8:d7b1 with SMTP id
 00721157ae682-6c629bef79bmr66521627b3.44.1724598380523; Sun, 25 Aug 2024
 08:06:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240822183742.3550055-1-dario.binacchi@amarulasolutions.com>
 <20240822183742.3550055-2-dario.binacchi@amarulasolutions.com>
 <20240823181741.499173f2@windsurf>
In-Reply-To: <20240823181741.499173f2@windsurf>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sun, 25 Aug 2024 17:06:09 +0200
Message-ID: <CABGWkvrAors7RK=8NK+5hnKCsuLU8HNyFzduFLNJHB679_a2-g@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 "Yann E . MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1724598380; x=1725203180;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Phr+y60zSfU/s5ukjWhpHGJjX/Xvo2Y9mF37jv821gs=;
 b=Eas7Wtqs0ISONt2sehAVRZbwfVDPQl+/j2RrbPUx4cu71AQeQCLy61c4inQFchINOX
 NF80iOt/Fcr1nCRczStoiQ4RVyPDhF5/L0ZO0DHNxMN8nM2a6zs5qsM3SCEkbukxBreI
 ArIoI1E/5Xo7JFD4tCkzfZKsQitV7PQzzsmRs=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Eas7Wtqs
Subject: Re: [Buildroot] [PATCH v3 1/3] package/tinyinit: new package
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
Cc: Damien Le Moal <dlemoal@kernel.org>, linux-amarula@amarulasolutions.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzIGFuZCBZYW5uLAoKT24gRnJpLCBBdWcgMjMsIDIwMjQgYXQgNjoxN+KAr1BN
IFRob21hcyBQZXRhenpvbmkKPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+
Cj4gT24gVGh1LCAyMiBBdWcgMjAyNCAyMDozNzo0MCArMDIwMAo+IERhcmlvIEJpbmFjY2hpIDxk
YXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4gd3JvdGU6Cj4KPiA+ICBERVZFTE9Q
RVJTICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+ID4gIHBhY2thZ2UvQ29uZmlnLmluICAgICAg
ICAgICAgfCAgMSArCj4gPiAgcGFja2FnZS90aW55aW5pdC9Db25maWcuaW4gICB8IDEwICsrKysr
KysrKysKPiA+ICBwYWNrYWdlL3Rpbnlpbml0L2luaXQgICAgICAgIHwgMzIgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysKPiA+ICBwYWNrYWdlL3Rpbnlpbml0L3Rpbnlpbml0Lm1rIHwg
MTIgKysrKysrKysrKysrCj4gPiAgNSBmaWxlcyBjaGFuZ2VkLCA1NiBpbnNlcnRpb25zKCspCj4K
PiBXZSBhbHNvIG5lZWQgdG8gY2hhbmdlIGJ1c3lib3gubWsgdG8gZW5zdXJlIHRoYXQgdGlueWlu
aXQgaXMgYnVpbHQKPiBiZWZvcmUgQnVzeWJveDoKPgo+ICMgUGFja2FnZXMgdGhhdCBwcm92aWRl
IGNvbW1hbmRzIHRoYXQgbWF5IGFsc28gYmUgYnVzeWJveCBhcHBsZXRzOgo+IEJVU1lCT1hfREVQ
RU5ERU5DSUVTID0gXAo+ICAgICAgICAgLi4uCj4gICAgICAgICAkKGlmICQoQlIyX1BBQ0tBR0Vf
VElOWUlOSVQpLHRpbnlpbml0KSBcCj4KPgo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvdGlueWlu
aXQvQ29uZmlnLmluIGIvcGFja2FnZS90aW55aW5pdC9Db25maWcuaW4KPiA+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjJjZWI4ZTE5MWUyMwo+ID4gLS0tIC9k
ZXYvbnVsbAo+ID4gKysrIGIvcGFja2FnZS90aW55aW5pdC9Db25maWcuaW4KPiA+IEBAIC0wLDAg
KzEsMTAgQEAKPiA+ICtjb25maWcgQlIyX1BBQ0tBR0VfVElOWUlOSVQKPiA+ICsgICAgIGJvb2wg
InRpbnlpbml0Igo+ID4gKyAgICAgZGVwZW5kcyBvbiBCUjJfSU5JVF9OT05FCj4gPiArICAgICBo
ZWxwCj4gPiArICAgICAgIEEgTGludXggdGlueSBpbml0aWFsaXphdGlvbiBzY3JpcHQgc3VpdGFi
bGUgZm9yIHJlc291cmNlCj4gPiArICAgICAgIGxpbWl0ZWQgc3lzdGVtcywgd2hpY2ggY2FuIGJl
IHVzZWQgYXMgYW4gYWx0ZXJuYXRpdmUgdG8gdGhlCj4gPiArICAgICAgIG9uZSBwcm92aWRlZCBi
eSBCdXN5Ym94Lgo+ID4gKwo+ID4gK2NvbW1lbnQgInRpbnlpbml0IG5lZWRzIEJSMl9JTklUX05P
TkUsIGkuIGUuIG5vIGluaXQgc3lzdGVtIGluc3RhbGxlZCIKPiA+ICsgICAgIGRlcGVuZHMgb24g
IUJSMl9JTklUX05PTkUKPgo+IEkgZmluZCB0aGlzIGEgYml0IG9kZC4gSW4gdGhlIGVuZCwgc2hv
dWxkbid0IHdlIHNpbXBseSBwcm9tb3RlIHRpbnlpbml0Cj4gYXMgYW4gaW5pdCBpbXBsZW1lbnRh
dGlvbiwgYW5kIGhhdmUgaXRzIG93biBCUjJfSU5JVF9USU5ZSU5JVCBlbnRyeT8KCkkgcmVtb3Zl
ZCBUSU5ZSU5JVCBmcm9tIHRoZSBpbml0IHNlbGVjdGlvbnMgYmFzZWQgb24gWWFubidzIHN1Z2dl
c3Rpb246Cmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0
Y2gvMjAyNDA4MjAxOTE5MjcuMjEyNjI4MS0yLWRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlv
bnMuY29tLwoKSU1ITywgSSBiZWxpZXZlIHRoZXJlIGFyZSBwb3NpdGl2ZSBhc3BlY3RzIGluIGJv
dGggaW1wbGVtZW50YXRpb25zLApidXQgbXkga25vd2xlZGdlCm9uIHRoZSBzdWJqZWN0IGlzIG1v
cmUgbGltaXRlZCBjb21wYXJlZCB0byB5b3Vycy4gRnJvbSBteSBzaWRlLCBJIGNhbgphc3N1cmUg
eW91IHRoYXQKdGhlcmUncyBubyBwcm9ibGVtIHRvIHJlc3RvcmUgdGlueWluaXQgYXMgYSBuZXcg
ZW50cnkgaW4gdGhlIGxpc3Qgb2YKaW5pdCBvcHRpb25zLgoKVGhhbmtzIGFuZCByZWdhcmRzLApE
YXJpbwoKPgo+IEFsc28sIHNob3VsZCBCUjJfUEFDS0FHRV9USU5ZSU5JVCBzZWxlY3QgYnVzeWJv
eD8gT3IgZG8gd2UgcHJldGVuZCB0aGF0Cj4gaXQgaXMgcG9zc2libGUgdG8gdXNlIGl0IHdpdGgg
c29tZSBvdGhlciBpbXBsZW1lbnRhdGlvbnMgb2YgbW91bnQgYW5kCj4gb3RoZXIgYmFzaWMgY29t
bWFuZHM/IFBlcmhhcHMgdGhpcyBpcyBhIGdvb2QgY2FzZSB0byB1c2UgImltcGx5Cj4gQlIyX1BB
Q0tBR0VfQlVTWUJPWCIsIHNvIHRoYXQgQlIyX1BBQ0tBR0VfVElOWUlOSVQgZW5hYmxlcyBidXN5
Ym94IGJ5Cj4gZGVmYXVsdCwgYnV0IHN0aWxsIGFsbG93cyByZW1vdmluZyBidXN5Ym94IGlmIHJl
YWxseSB0aGUgdXNlciBrbm93cwo+IHdoYXQgKHMpaGUgaXMgZG9pbmc/Cj4KPiA+ICtkZWZpbmUg
VElOWUlOSVRfSU5TVEFMTF9UQVJHRVRfQ01EUwo+ID4gKyAgICAgJChJTlNUQUxMKSAtbSAwNzU1
IC1EICQoVElOWUlOSVRfUEtHRElSKS9pbml0ICQoVEFSR0VUX0RJUikvc2Jpbi9pbml0Cj4gPiAr
ICAgICAoY2QgJChUQVJHRVRfRElSKTsgbG4gLXNmIC9zYmluL2luaXQgaW5pdCkKPgo+IEhtbS4g
SSBpbml0aWFsbHkgdGhvdWdodCB0aGlzIHN5bWxpbmsgc2hvdWxkbid0IGJlIG5lZWRlZCwgYXMg
aXQncwo+IGNyZWF0ZWQgYnkgZnMvY3Bpby9jcGlvLm1rIHdoZW4geW91J3JlIGJ1aWxkaW5nIGEg
Y3BpbyBmb3IgaW5pdHJhbWZzOgo+Cj4gaWZlcSAoJChCUjJfUk9PVEZTX0RFVklDRV9DUkVBVElP
Tl9TVEFUSUMpLHkpCj4KPiBkZWZpbmUgUk9PVEZTX0NQSU9fQUREX0lOSVQKPiAgICAgICAgIGlm
IFsgISAtZSAkKFRBUkdFVF9ESVIpL2luaXQgXTsgdGhlbiBcCj4gICAgICAgICAgICAgICAgIGxu
IC1zZiBzYmluL2luaXQgJChUQVJHRVRfRElSKS9pbml0OyBcCj4gICAgICAgICBmaQo+IGVuZGVm
Cj4KPiBlbHNlCj4gIyBkZXZ0bXBmcyBkb2VzIG5vdCBnZXQgYXV0b21vdW50ZWQgd2hlbiBpbml0
cmFtZnMgaXMgdXNlZC4KPiAjIEFkZCBhIHByZS1pbml0IHNjcmlwdCB0byBtb3VudCBpdCBiZWZv
cmUgcnVubmluZyBpbml0Cj4gIyBXZSBtdXN0IGhhdmUgL2Rldi9jb25zb2xlIHZlcnkgZWFybHks
IGV2ZW4gYmVmb3JlIC9pbml0IHJ1bnMsCj4gIyBmb3Igc3RkaW4vc3Rkb3V0L3N0ZGVycgo+IGRl
ZmluZSBST09URlNfQ1BJT19BRERfSU5JVAo+ICAgICAgICAgaWYgWyAhIC1lICQoVEFSR0VUX0RJ
UikvaW5pdCBdOyB0aGVuIFwKPiAgICAgICAgICAgICAgICAgJChJTlNUQUxMKSAtbSAwNzU1IGZz
L2NwaW8vaW5pdCAkKFRBUkdFVF9ESVIpL2luaXQ7IFwKPiAgICAgICAgIGZpCj4gICAgICAgICBt
a2RpciAtcCAkKFRBUkdFVF9ESVIpL2Rldgo+ICAgICAgICAgbWtub2QgLW0gMDYyMiAkKFRBUkdF
VF9ESVIpL2Rldi9jb25zb2xlIGMgNSAxCj4gZW5kZWYKPgo+IEJ1dCBhY3R1YWxseSwgaW4gdGhl
IGNhc2Ugb2YgYSBub24tc3RhdGljIC9kZXYsIGl0IGRvZXNuJ3QgZG8gYQo+IHN5bWxpbmssIGJ1
dCBhZGRzIGEgcHJlLWluaXQgc2NyaXB0LCBhbmQgeW91ciB0aW55aW5pdCBhbHJlYWR5IGRvZXMg
dGhlCj4gdGFza3Mgb2YgdGhpcyBwcmUtaW5pdCBwcm92aWRlZCBieSBmcy9jcGlvL2luaXQuCj4K
PiBTbyBJIGd1ZXNzIHdoYXQgeW91IGRpZCBpcyBwcm9iYWJseSBPSywgYnV0IG1heWJlIGEgY29t
bWVudCB3b3VsZCBiZQo+IHVzZWZ1bC4gVGhlIG9ubHkgZG93bnNpZGUgb2YgeW91ciBhcHByb2Fj
aCBpcyB0aGF0IGl0IGxlYXZlcyBhIC9pbml0Cj4gc3ltbGluayB0aGF0IGlzbid0IHVzZWQvbmVl
ZGVkIGZvciBub24taW5pdHJhbWZzIHVzZS1jYXNlcywgYnV0IHBlcmhhcHMKPiB0aGF0J3MgT0su
Cj4KPgo+IFRob21hcwo+IC0tCj4gVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywg
Qm9vdGxpbgo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWlu
aW5nCj4gaHR0cHM6Ly9ib290bGluLmNvbQoKCgotLSAKCkRhcmlvIEJpbmFjY2hpCgpTZW5pb3Ig
RW1iZWRkZWQgTGludXggRGV2ZWxvcGVyCgpkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25z
LmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwoKCkFtYXJ1bGEgU29sdXRp
b25zIFNSTAoKVmlhIExlIENhbmV2YXJlIDMwLCAzMTEwMCBUcmV2aXNvLCBWZW5ldG8sIElUCgpU
LiArMzkgMDQyIDI0MyA1MzEwCmluZm9AYW1hcnVsYXNvbHV0aW9ucy5jb20KCnd3dy5hbWFydWxh
c29sdXRpb25zLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
