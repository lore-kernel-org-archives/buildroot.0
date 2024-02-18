Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 965FCC48BF6
	for <buildroot@archiver.kernel.org>; Sun, 18 Feb 2024 13:39:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3182340787;
	Sun, 18 Feb 2024 13:39:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pg8toWBMY-iF; Sun, 18 Feb 2024 13:39:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E79F4079C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E79F4079C;
	Sun, 18 Feb 2024 13:39:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 022DF1BF31A
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 13:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDCFB400FD
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 13:39:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U2k9uopWnuFv for <buildroot@lists.busybox.net>;
 Sun, 18 Feb 2024 13:39:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b34; helo=mail-yb1-xb34.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 48347400D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48347400D3
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 48347400D3
 for <buildroot@buildroot.org>; Sun, 18 Feb 2024 13:39:05 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-dccb1421bdeso3192607276.1
 for <buildroot@buildroot.org>; Sun, 18 Feb 2024 05:39:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708263544; x=1708868344;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eENYGONt2mnh7Kaxq3HXvsEXbOoIQXzB2YiGkil7AYE=;
 b=QB+RK4QE5iGNCgYW7Ro4W0u9t5egdW+l0grCPe7PGyMj+hxJ0lwL8NefdeCRGHXctY
 pZ8Wl0x7IwT1xYIxaFlwglXY6Xi8kaonpHvFswo3VMDodRy1mGu+eZIViLIJWPlXc+wz
 jWiI2CkfB7W2I/hiWVapfUJacLrBeyqwHKpiW1JeUzV3DGOdGvka2LLX4bhnuw9rlauV
 crCmOB2dt8E4kVfeFe1NSxmHN0k2xJFZlD80AaVksUl23jalB9JnMuOj4JjuU3I1Kdjr
 QH9JuWlfn5785QZKnO1s8DUQS6Djr0GkIt18V+u1Er9q0vwegHgNBJOj1OGs2D5d+PcN
 d9nw==
X-Gm-Message-State: AOJu0Yx+FMd5Que3KHYIETKFbLq5LubAg3kIO+8OR6e9HRtLwzWctmiH
 VBOf5PiqGoDiCIFFPY6RzK7Af39yMYNMcTA1Ot9zyHZP+v52H1BsTXKV/QsP9I30aENO5EJUpkq
 DYrQ5zHKUZxeMKHfM1wvlTKxY2CNwWrbkMav3mQ==
X-Google-Smtp-Source: AGHT+IE+DOtcpY4EFzQfr3c50MNWGRCHxpANieMVahQTn3aO/5ljdTfRLIMTBty+8aabjDHGDxi7ZggoLd9H8QwSCIM=
X-Received: by 2002:a25:9012:0:b0:dc7:1d:5db4 with SMTP id
 s18-20020a259012000000b00dc7001d5db4mr8609602ybl.34.1708263544160; 
 Sun, 18 Feb 2024 05:39:04 -0800 (PST)
MIME-Version: 1.0
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
 <20240217160244.1320482-20-dario.binacchi@amarulasolutions.com>
 <8662a0c59b8cea111c15cabb121c6b598d5a1d04.camel@gmail.com>
In-Reply-To: <8662a0c59b8cea111c15cabb121c6b598d5a1d04.camel@gmail.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sun, 18 Feb 2024 14:38:53 +0100
Message-ID: <CABGWkvq6Q5b+ozb6Vhccagg3gsYgMqa7x2tBVtEAxCp2S72evg@mail.gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708263544; x=1708868344;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eENYGONt2mnh7Kaxq3HXvsEXbOoIQXzB2YiGkil7AYE=;
 b=GZMJBH3q1mt7EfMVyycBCEscfMULqUcFp+5gXWP2C17SmluQTH6ijpJHnNFSGFV1kN
 8t2RVe3r3b2SoCRWGJfndzLICZlMxUNGT0n9Lzy5iqoJ6/jRnVJ/7G2oZUerG9Z0nfUo
 F5uTUEbFHtFOQit+7odPgH0kaBUTvGxfSgQe0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=GZMJBH3q
Subject: Re: [Buildroot] [PATCH v4 19/20] boot/ti-k3/ti-k3-r5-loader:
 install tiboot3.bin
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
Cc: michael@amarulasolutions.com, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@smile.fr>, Anand Gadiyar <gadiyar@ti.com>,
 linux-amarula@amarulasolutions.com, bryce@redpinelabs.com,
 Andreas Dannenberg <dannenberg@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQWxleGFuZGVyLAoKT24gU2F0LCBGZWIgMTcsIDIwMjQgYXQgNjoyOOKAr1BNIEFsZXhhbmRl
ciBTdmVyZGxpbgo8YWxleGFuZGVyLnN2ZXJkbGluQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIaSBE
YXJpbywKPgo+IE9uIFNhdCwgMjAyNC0wMi0xNyBhdCAxNzowMiArMDEwMCwgRGFyaW8gQmluYWNj
aGkgd3JvdGU6Cj4gPiBSZWNlbnQgdmVyc2lvbnMgb2YgVS1Cb290IGFyZSBjYXBhYmxlIG9mIGJ1
aWxkaW5nIHRpYm9vdDMuYmluIHVzaW5nCj4gPiBCaW5tYW4uIEluIHRoaXMgY2FzZSwgbGV0J3Mg
Y29weSBpdCB0byB0aGUgYmluYXJpZXMgZGlyZWN0b3J5Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6
IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4KPgo+
IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAy
NDAyMTMxNzI4MTcuMjg3Mjg0OS0xMi1yb21haW4ubmFvdXJAc21pbGUuZnIvCj4KPiBsb29rcyBt
b3JlIGNvbXBsZXRlIHdpdGggc3lzZncuaXRiPwoKSW4gbXkgdXNlIGNhc2UsIHRoZXJlIHdhcyBu
byBuZWVkIGFzIGl0IHdhcyBuZWNlc3NhcnkgdG8gZW5hYmxlCnRpLWszLWJvb3QtZmlybXdhcmU6
CgpkZWZpbmUgVElfSzNfQk9PVF9GSVJNV0FSRV9JTlNUQUxMX0lNQUdFU19DTURTCmNwIC1kcGZy
ICQoQEQpL3RpLXN5c2Z3ICQoQklOQVJJRVNfRElSKS8KY3AgLWRwZnIgJChARCkvdGktZG0gJChC
SU5BUklFU19ESVIpLwplbmRlZgoKSSBhbHNvIHdvbmRlciB3aGV0aGVyIGl0IGlzIG5lY2Vzc2Fy
eSB0byByZW1vdmUgdGhlCmNwIC1kcGZyICQoQEQpL3RpLXN5c2Z3ICQoQklOQVJJRVNfRElSKS8K
dG8gYXZvaWQgY29uZmxpY3RzLgoKQWx0ZXJuYXRpdmVseSwgYXMgaGFwcGVuZWQgd2l0aCB0aS1r
My1oZW4taW1hZ2UsIG9uZSBkYXkgd2UgbWF5IG5vCmxvbmdlciBuZWVkIHRpLWszLWJvb3QtZmly
bXdhcmUsCmFuZCB0aGVyZWZvcmUgd2UgY291bGQgYWRkIGEgY29weSBvZiBzeXNmdy5pdGIgZnJv
bSB0aS1rMy1yNS1sb2FkZXIuIEkKYW0gYXdhaXRpbmcgc3VnZ2VzdGlvbnMuCkhvd2V2ZXIsIG15
IHBhdGNoIGRvZXMgbm90IHJlcXVpcmUgbW9kaWZ5aW5nIHRoZSBnZW5pbWFnZS5jZmcgZmlsZS4g
SW4KYW55IGNhc2UsIEkgd291bGQgdHJ5IHRvIGVuc3VyZQp0aGlzIGFsc28gZm9yIHN5c2Z3Lml0
Yi4KClRoYW5rcyBhbmQgcmVnYXJkcywKRGFyaW8KCj4KPiA+IC0tLQo+ID4KPiA+IEFkZGVkIGlu
IHY0Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hp
QGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+ID4gLS0tCj4gPiAgYm9vdC90aS1rMy90aS1rMy1yNS1s
b2FkZXIvdGktazMtcjUtbG9hZGVyLm1rIHwgMyArKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2Jvb3QvdGktazMvdGktazMtcjUtbG9h
ZGVyL3RpLWszLXI1LWxvYWRlci5tayBiL2Jvb3QvdGktazMvdGktazMtcjUtbG9hZGVyL3RpLWsz
LXI1LWxvYWRlci5tawo+ID4gaW5kZXggMmExMDAyNGFlZGFhLi42NDMyOThhMWU3MGEgMTAwNjQ0
Cj4gPiAtLS0gYS9ib290L3RpLWszL3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIubWsK
PiA+ICsrKyBiL2Jvb3QvdGktazMvdGktazMtcjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5tawo+
ID4gQEAgLTc1LDggKzc1LDExIEBAIGRlZmluZSBUSV9LM19SNV9MT0FERVJfQlVJTERfQ01EUwo+
ID4gICAgICAgJChUQVJHRVRfQ09ORklHVVJFX09QVFMpICQoVElfSzNfUjVfTE9BREVSX01BS0Up
IC1DICQoQEQpICQoVElfSzNfUjVfTE9BREVSX01BS0VfT1BUUykKPiA+ICBlbmRlZgo+ID4KPiA+
ICtUSV9LM19SNV9MT0FERVJfU0VDVFlQRSA9ICQoY2FsbCBxc3RyaXAsJChCUjJfVEFSR0VUX1RJ
X0szX1NFQ1RZUEUpKQo+ID4gKwo+ID4gIGRlZmluZSBUSV9LM19SNV9MT0FERVJfSU5TVEFMTF9J
TUFHRVNfQ01EUwo+ID4gICAgICAgY3AgJChARCkvc3BsL3UtYm9vdC1zcGwuYmluICQoQklOQVJJ
RVNfRElSKS9yNS11LWJvb3Qtc3BsLmJpbgo+ID4gKyAgICAgZmluZCAkKEBEKSAtbmFtZSAidGli
b290My0qLSQoVElfSzNfUjVfTE9BREVSX1NFQ1RZUEUpLSouYmluIiAtdHlwZSBmIC1leGVjIGNw
IHt9ICQoQklOQVJJRVNfRElSKS90aWJvb3QzLmJpbiBcOwo+ID4gIGVuZGVmCj4gPgo+ID4gICQo
ZXZhbCAkKGtjb25maWctcGFja2FnZSkpCj4KPiAtLQo+IEFsZXhhbmRlciBTdmVyZGxpbi4KPgoK
Ci0tIAoKRGFyaW8gQmluYWNjaGkKClNlbmlvciBFbWJlZGRlZCBMaW51eCBEZXZlbG9wZXIKCmRh
cmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCgoKQW1hcnVsYSBTb2x1dGlvbnMgU1JMCgpWaWEgTGUgQ2FuZXZhcmUgMzAs
IDMxMTAwIFRyZXZpc28sIFZlbmV0bywgSVQKClQuICszOSAwNDIgMjQzIDUzMTAKaW5mb0BhbWFy
dWxhc29sdXRpb25zLmNvbQoKd3d3LmFtYXJ1bGFzb2x1dGlvbnMuY29tCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
