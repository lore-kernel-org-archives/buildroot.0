Return-Path: <SRS0=ghJV=P5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B17BCC433F5
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 09:40:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AE446101C
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 09:40:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2AE446101C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F167A4041C;
	Wed, 10 Nov 2021 09:40:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hKteQn72HrwT; Wed, 10 Nov 2021 09:40:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28F5A40414;
	Wed, 10 Nov 2021 09:40:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C4B261BF345
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 09:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C136280EF5
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 09:40:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8WJihXYm-w6T for <buildroot@lists.busybox.net>;
 Wed, 10 Nov 2021 09:40:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BDF6E80EDD
 for <buildroot@buildroot.org>; Wed, 10 Nov 2021 09:40:30 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id u11so4632877lfs.1
 for <buildroot@buildroot.org>; Wed, 10 Nov 2021 01:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5XLD0LG3BIQzmFCCcolbQu8tOrlEU14fwh//ib/Ozxg=;
 b=blLHhjakRHRTHPuftms/ldz2XHTzjTzQg4K1+9Z82yfumFKndquxYO+Mpb0a2mgyp9
 ahlIA9n1ippw2Zqyuz1/C8SB1pGx4RTm9eYKIZD8YnYAofDGwLGRODi/FEb7XKyocs2r
 FiZByrXrFcawwFOSFeDOWT5/GAbuj8lDjwx+vnbBamqlNAr8e9W/xqFLja16ecaJ+jZY
 MHcaG5srtPahVs0Jarxv5Mh3xr4NOf7OQd6Q+ivcrxfm5IuU8Gcki+tMSWEY9cjsyg8T
 zTedW07Ac9JX/UIgVH4o3QSZf4NE4MLQ4V3RhjWASK75ZJXwti34P5E5xHAfWzpDHydT
 Olhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5XLD0LG3BIQzmFCCcolbQu8tOrlEU14fwh//ib/Ozxg=;
 b=75uO426vj4EjbF6G9apl1WESK6Vt88e85DJjwQbGbuf86/NRm8qkFCHIm2lX2Hzh5G
 h0wmEE0kZ1FeMo817FhxAQ/KsgC7MpZKjUBDe4YYQfei7ZzyptK8YOm6+Y3m/jqwrj1a
 jnWQc3550DxSWrCLnyl9o/AppUeS1pM5uCWwCt5LG4GGtTpUsc4pn35FPGiIESRIUghk
 cIMZY/nTgG1UwDQ+YxBwz+8y858FZf3e+NAWMg0D+dWNnLdGlD3lr9FhwqkeGHEuV7j4
 HLK8b7zzRNP5KgG2eKy9Sf+OTH6Cf9kfjXoSWWr/+2FhWg8lwlTS1MnEGYmo6Dz+5bhe
 uIzg==
X-Gm-Message-State: AOAM530SdfYBiqBRt8shG0fJ6xlSWp4xVj7uaEqCTVCLxi/3wWB69LPs
 8r9Ln2eI4BYBFd8QNU85PcMYd0cChn8aCUJRQoo=
X-Google-Smtp-Source: ABdhPJwCJhoQzS3cHjqqBMJrf7T1klmMpEjLu5sTmNLwjOQwlRT803QVGjk+Nqb4pThdRqA8HfUimOQ0HI0lASMEaUM=
X-Received: by 2002:a05:6512:689:: with SMTP id
 t9mr7132415lfe.614.1636537228750; 
 Wed, 10 Nov 2021 01:40:28 -0800 (PST)
MIME-Version: 1.0
References: <20211030214734.2154583-1-fontaine.fabrice@gmail.com>
 <20211101094752.4f0e6943@windsurf>
 <8aa1132c-43c5-93bc-718b-5199c9936c0d@mind.be>
 <20211109222551.GB2084998@scaer>
 <CAPi7W82g-5Bs1gxUOqXwgqnx8EgBgENYwGLbAX6XvVfCd5+s5Q@mail.gmail.com>
 <20211110091203.GD2084998@scaer>
In-Reply-To: <20211110091203.GD2084998@scaer>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 10 Nov 2021 10:40:17 +0100
Message-ID: <CAPi7W805iAAG3CtW_GeCm7rc=z6cvObPko7fZSRUkunCB-H65g@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/oprofile: needs zlib
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

WWFubiwKCkxlIG1lci4gMTAgbm92LiAyMDIxIMOgIDEwOjEyLCBZYW5uIEUuIE1PUklOIDx5YW5u
Lm1vcmluLjE5OThAZnJlZS5mcj4gYSDDqWNyaXQgOgo+Cj4gRmFicmljZSwgQWxsLAo+Cj4gT24g
MjAyMS0xMS0wOSAyMzozNyArMDEwMCwgRmFicmljZSBGb250YWluZSBzcGFrZSB0aHVzbHk6Cj4g
PiBMZSBtYXIuIDkgbm92LiAyMDIxIMOgIDIzOjI2LCBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmlu
LjE5OThAZnJlZS5mcj4gYSDDqWNyaXQgOgo+ID4gPiBPbiAyMDIxLTExLTA5IDIyOjQwICswMTAw
LCBBcm5vdXQgVmFuZGVjYXBwZWxsZSBzcGFrZSB0aHVzbHk6Cj4gPiA+ID4gT24gMDEvMTEvMjAy
MSAwOTo0NywgVGhvbWFzIFBldGF6em9uaSB3cm90ZToKPiA+ID4gPiA+T24gU2F0LCAzMCBPY3Qg
MjAyMSAyMzo0NzozNCArMDIwMAo+ID4gPiA+ID5GYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5m
YWJyaWNlQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPj5vcHJvZmlsZSBuZWVkcyB6bGliIHRv
IGF2b2lkIHRoZSBmb2xsb3dpbmcgYnVpbGQgZmFpbHVyZSB3aGljaCBpcywgZm9yCj4gPiA+ID4g
Pj5hbiB1bmtub3duIHJlYXNvbiwgb25seSByYWlzZWQgc2luY2UgQXVndXN0IDIwMjE6Cj4gPiA+
ID4gPkkgZG9uJ3QgcmVhbGx5IGxpa2UgY2hhbmdlcyB0aGF0IGFyZSBtYWRlICJmb3IgYW4gdW5r
bm93biByZWFzb24iLgo+ID4gPiA+ICBOb3RlIHRoYXQgaW4gdGhpcyBjb25maWd1cmF0aW9uLCB6
bGliIGlzIG5vdCBzZWxlY3RlZCAoKiksIGJ1dCBhcHBhcmVudGx5Cj4gPiA+ID4gbGliYmZkIGlz
IHN0aWxsIGJ1aWx0IHdpdGggemxpYiBzdXBwb3J0Li4uCj4gPiA+IFRoYXQncyBiZWNhdXNlIGJp
bnV0aWxzIChhdCBsZWFzdCAyLjM2LjEpIHNoaXBzIHdpdGggYSBidW5kbGVkIGNvcHkKPiA+ID4g
dGhhdCBpdCBidWlsZHM6Cj4gPiA+Cj4gPiA+ICAgICA+Pj4gYmludXRpbHMgMi4zNi4xIEJ1aWxk
aW5nCj4gPiA+ICAgICBbLi4uXSAvdXNyL2Jpbi9tYWtlIC1qOSBMSUJTPSBNQUtFSU5GTz10cnVl
IC1DIC9ob21lL3ltb3Jpbi9kZXYvYnVpbGRyb290L08vYnVpbGQvYmludXRpbHMtMi4zNi4xLwo+
ID4gPiAgICAgbWFrZVszXTogTm90aGluZyB0byBiZSBkb25lIGZvciAnYWxsLXRhcmdldCcuCj4g
PiA+ICAgICBDb25maWd1cmluZyBpbiAuL2V0Ywo+ID4gPiAgICAgY29uZmlndXJlOiBjcmVhdGlu
ZyBjYWNoZSAuL2NvbmZpZy5jYWNoZQo+ID4gPiAgICAgY2hlY2tpbmcgZm9yIGEgQlNELWNvbXBh
dGlibGUgaW5zdGFsbC4uLiAvdXNyL2Jpbi9pbnN0YWxsIC1jCj4gPiA+ICAgICBjb25maWd1cmU6
IHVwZGF0aW5nIGNhY2hlIC4vY29uZmlnLmNhY2hlCj4gPiA+ICAgICBjb25maWd1cmU6IGNyZWF0
aW5nIC4vY29uZmlnLnN0YXR1cwo+ID4gPiAgICAgY29uZmlnLnN0YXR1czogY3JlYXRpbmcgTWFr
ZWZpbGUKPiA+ID4gICAgIG1ha2VbNF06IE5vdGhpbmcgdG8gYmUgZG9uZSBmb3IgJ2FsbCcuCj4g
PiA+ICAgICBDb25maWd1cmluZyBpbiAuL3psaWIKPiA+ID4gICAgIFsuLi5dCj4gPiA+Cj4gPiA+
IEFuZCBoZW5jZSBsaWJiZmQgaXMgYnVpbHQgYWdhaW5zdCB0aGUgYnVuZGxlZCBsaWJ6LCB3aGlj
aCBiZWluZyB3aGF0Cj4gPiA+IGF1dG90b29scyBjYWxsIGEgY29udmVuaWVuY2UgbGlicmFyeSwg
aXMgbm90IGlzbnRhbGxlZC4KPgo+IC4uLiBhbmQgaXQgaXMgYWxzbyBub3QgaW5zdGFsbGVkIGJl
Y2F1c2Ugd2UgYW55d2F5IG9ubHkgZG8gYSBwYXJ0aWFsCj4gaW5zdGFsbCBvZiBzZWxlY3QgbGli
cmFyaWVzLgo+Cj4gPiA+IEFuZCB0aGlzIGJ1bmRsZWQgY29weSBpcyBhbHdheXMgYnVpbHQsIGV2
ZW4gaWYgb25lIGlzIGFscmVhZHkgcHJlc2VudCBpbgo+ID4gPiB0aGUgc3lzdGVtIChpLmUuIHdp
dGggemxpYiBlbmFibGVkIGluIHRoZSBjb25maWd1cmF0aW9uKS4KPiA+IEZyb20gbXkgdW5kZXJz
dGFuZGluZyBvZiBiaW51dGlscydzIGNvbmZpZ3VyZS5hYywgd2Ugc2hvdWxkIGJlIGFibGUgdG8K
PiA+IGRpc2FibGUgdGhlIGJ1bmRsZWQgY29weSB0aHJvdWdoIC0td2l0aC1zeXN0ZW0tbGliIHdo
aWNoIGlzIGF2YWlsYWJsZQo+ID4gc2luY2UgdmVyc2lvbiAyLjI2IGFuZAo+ID4gaHR0cHM6Ly9n
aXRodWIuY29tL2JtaW5vci9iaW51dGlscy1nZGIvY29tbWl0L2NmMzljZmM1MmViZDY4M2Q1NWZj
Mzk2YTc3MzU1ZjM0YjUwOTRjMDQ6Cj4KPiBPaCB5ZXMsIEkgZm9yZ290IHRvIG1lbnRpb24gdGhh
dCB5ZXN0ZXJkYXkuIFllcywgdGhpcyBpcyBJIGJlbGlldmUgdGhlCj4gYmVzdCBzb2x1dGlvbjog
YmludXRpbHMgc2hvdWxkIGFsd2F5cyBkZXBlbmQgb24gemxpYiAoaXQgY3VycmVudGx5IG9ubHkK
PiBjb25kaXRpb25hbGx5IGRlcGVuZHMgb24gaXQpLgo+Cj4gQ2FyZSB0byBzZW5kIHRoZSBwYXRj
aCwgcGxlYXNlPwpJJ2xsIHNlbmQgaXQgdGhpcyBldmVuaW5nLgo+Cj4gUmVnYXJkcywKPiBZYW5u
IEUuIE1PUklOLgo+Cj4gLS0KPiAuLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0t
LS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgo+IHwgIFlhbm4gRS4g
TU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBj
b25zcGlyYWN5OiB8Cj4gfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBc
IC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKPiB8ICszMyA1NjEgMDk5IDQy
NyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBp
cyBubyAgfAo+IHwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhU
TUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8Cj4gJy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0t
LScKQmVzdCBSZWdhcmRzLAoKRmFicmljZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
