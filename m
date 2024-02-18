Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A8BCC48BF6
	for <buildroot@archiver.kernel.org>; Sun, 18 Feb 2024 13:49:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E562B40745;
	Sun, 18 Feb 2024 13:49:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y6Xae_Cb7liV; Sun, 18 Feb 2024 13:49:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D73E24075C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D73E24075C;
	Sun, 18 Feb 2024 13:49:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6EB451BF31A
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 13:49:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B9FA404C3
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 13:49:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xr_L98uCdHFR for <buildroot@lists.busybox.net>;
 Sun, 18 Feb 2024 13:49:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b34; helo=mail-yb1-xb34.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 38D9C40158
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38D9C40158
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 38D9C40158
 for <buildroot@buildroot.org>; Sun, 18 Feb 2024 13:49:19 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-dc6d24737d7so2940344276.0
 for <buildroot@buildroot.org>; Sun, 18 Feb 2024 05:49:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708264158; x=1708868958;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v6sT8u6Q5dRUPziXeteoykCb4E5Se6hJk7MHuSCbuyw=;
 b=LzI76johlUTDm9LkGI4Xp1FFRJznrfFHsY3qHwjNEWGpvm+f9+upZG0q8spJeslt9Q
 9wtTz+NVpE0V3idiAM3PmJqvJgeXh+0cL4MK/JKEF0U/hrY2in3qMKJpT0/bapkBNGlX
 S4tGiDMVSPTZZo4Axue78J2w8PavOzz+3HrOcpsH7KNqEs5JOij0M1sYK+mj3qrvGGOG
 NoaSa8i0HrPGq669xuhnIxDLg9UEtq5u8yOKNmaN/tQwlDbfZuJLJO363ru0z1m/4BbP
 QDza2jqF3eUMiqnkrqTo1DqaojeFeWffSNN+OSeTVFPGqR4sJ//fW/PCG9+kWgahTHB/
 q1iQ==
X-Gm-Message-State: AOJu0Yw05aS6G3aZMG2CFIWq3/Srs6vnx7sprz17VTmHuQIp+jOZL5K7
 A2sTOLLxtsVbUm3hA2sOEcZM4I/zA/TXz28oUM6sXZvGFhwKrmUuU1MWmqS0eSzc/HNp+KU+cJv
 Bo5Q/JP0kVk8qQm9eh9nJ05JcgLD+OeZwpaCXmA==
X-Google-Smtp-Source: AGHT+IFxJcF2k8TX+cDxOCAlSbEK+0T+KE7DwLhgz6YIeaNfa02Iz2mIXEJuS4YbwBUL3m0HeIKnEfXb8BZWv4a/rz0=
X-Received: by 2002:a25:ac0a:0:b0:dcc:ae3:d893 with SMTP id
 w10-20020a25ac0a000000b00dcc0ae3d893mr7622149ybi.50.1708264157057; Sun, 18
 Feb 2024 05:49:17 -0800 (PST)
MIME-Version: 1.0
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
 <20240217160244.1320482-16-dario.binacchi@amarulasolutions.com>
 <73868728d467604fa82ada93e652c23eca4afaa6.camel@gmail.com>
In-Reply-To: <73868728d467604fa82ada93e652c23eca4afaa6.camel@gmail.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sun, 18 Feb 2024 14:49:06 +0100
Message-ID: <CABGWkvoGfYMt4ME+ObBWZ6s5ot2yNbHX6sGQZX5vi4608OGRwg@mail.gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708264158; x=1708868958;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v6sT8u6Q5dRUPziXeteoykCb4E5Se6hJk7MHuSCbuyw=;
 b=PCERNLFTZRcOClHavmXs6xyMxZhDH4Fd1KyHcM0onzE8+oZkZkx8itfGGm+lSOuJz9
 vAGQfcvU58yrJlXCJsJIDJ+pEqVq03612WUpHpS7sQauBJe3dK6QJsmUJpQbJ5e0gT56
 MgHAf0vTF8GDc+WFRWMqJPfENGOG/xEh+mehs=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=PCERNLFT
Subject: Re: [Buildroot] [PATCH v4 15/20] configs/ti_am62x_sk_defconfig:
 bump U-Boot version to 2024.01
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

SGkgQWxleGFuZGVyLAoKT24gU2F0LCBGZWIgMTcsIDIwMjQgYXQgOToyMOKAr1BNIEFsZXhhbmRl
ciBTdmVyZGxpbgo8YWxleGFuZGVyLnN2ZXJkbGluQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBT
YXQsIDIwMjQtMDItMTcgYXQgMTc6MDIgKzAxMDAsIERhcmlvIEJpbmFjY2hpIHdyb3RlOgo+ID4g
VGhlIDIwMjQuMDEgdmVyc2lvbiBvZiBVLUJvb3QgZm9yIHRoZSBhbTYyeC1zayBib2FyZCBoYXMg
aW50cm9kdWNlZCB0d28KPiA+IG1ham9yIGNoYW5nZXM6Cj4gPiAtIFRoZSBkZXZpY2UgdHJlZSBr
My1hbTYyNS1zay5kdGIgaXMgbm8gbG9uZ2VyIHNlYXJjaGVkIGluIC9ib290LCBidXQgaW4KPiA+
ICAgL2Jvb3QvZHRiL3RpLiBIZW5jZSwgdGhlIGRpc2FibGluZyBvZiBCUjJfTElOVVhfS0VSTkVM
X0lOU1RBTExfVEFSR0VUCj4gPiAgIGFuZCB0aGUgdXNlIG9mIGV4dGxpbnV4LmNvbmYgZm9yIHRo
ZSBwcm9wZXIgbG9hZGluZyBvZiB0aGUgZGV2aWNlIHRyZWUuCj4gPiAgIEZ1cnRoZXJtb3JlLCB0
aGUgcGFyYW1ldGVyIEJSMl9ST09URlNfUE9TVF9TQ1JJUFRfQVJHUyB3YXMgdXNlZCB0bwo+ID4g
ICBhdXRvLWdlbmVyYXRlIHRoZSBleHRsaW51eC5jb25mIGZpbGUgc28gdGhhdCBkZXZlbG9wZXJz
IGNhbiBjaGFuZ2UgdGhlCj4gPiAgIGtlcm5lbCBsb2FkaW5nIG9wdGlvbnMgYnkgbW9kaWZ5aW5n
IHRoZSAuY29uZmlnLgo+ID4gLSBUaGUgdXNlIG9mIGJpbm1hbiBmb3IgYnVpbGRpbmcgaW1hZ2Vz
Lgo+ID4KPiA+IFRlc3RlZCBvbiBTSy1BTTYyQi1QMS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBE
YXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4KPiBb
XQo+Cj4gPiBAQCAtMjcsMTQgKzI3LDE1IEBAIEJSMl9UQVJHRVRfVElfSzNfSU1BR0VfR0VOPXkK
PiA+ICBCUjJfVEFSR0VUX1RJX0szX0lNQUdFX0dFTl9TT0NfQU02Mlg9eQo+ID4gIEJSMl9UQVJH
RVRfVElfSzNfUjVfTE9BREVSPXkKPiA+ICBCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUl9DVVNU
T01fVkVSU0lPTj15Cj4gPiAtQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfQ1VTVE9NX1ZFUlNJ
T05fVkFMVUU9IjIwMjIuMTAiCj4gPiArQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfQ1VTVE9N
X1ZFUlNJT05fVkFMVUU9IjIwMjQuMDEiCj4KPiBJcyBwYXRjaCAzLzIwIHJlYWxseSByZXF1aXJl
ZCBpbiB0aGlzIGNhc2U/Cj4gSXMgY3VzdG9tIHZlcnNpb24gcmVxdWlyZWQgaWYgeW91IHNldCB0
aGUgc2FtZSB2ZXJzaW9uIGFzIGRlZmF1bHQgaW4gcGF0Y2gKPiA1LzIwPwo+Cj4gLS0KPiBBbGV4
YW5kZXIgU3ZlcmRsaW4uCj4KClJvbWFpbiBhc2tlZCBtZSB0byB1cGRhdGUgdGhlIGRlZmF1bHQg
dmVyc2lvbiBmb3IgdGktazMtcjUtbG9hZGVyIHRvCjIwMjQuMDEuIFRoZXJlZm9yZSwKSSB3YW50
ZWQgdGhpcyBjaGFuZ2Ugbm90IHRvIGltcHJvcGVybHkgYWR2YW5jZSB0aGUgdmVyc2lvbiBmb3Ig
dGhlCnRpX2FtNnsyLDR9eF9za19kZWZjb25maWcgY29uZmlndXJhdGlvbi4KQWRkaXRpb25hbGx5
LCBJIHdhbnRlZCB0byBwdXQgdGhlc2UgcGF0Y2hlcyBiZWZvcmUgdGhlIG9uZXMgSSBoYWQKYWxy
ZWFkeSBzdWJtaXR0ZWQgaW4gdmVyc2lvbiAzLCB0byBoYXZlIGEKbW9yZSByZWFkYWJsZSBzZXBh
cmF0aW9uIGJldHdlZW4gYmVmb3JlIGFuZCBhZnRlci4KClRoYW5rcyBhbmQgcmVnYXJkcywKRGFy
aW8KCi0tCgpEYXJpbyBCaW5hY2NoaQoKU2VuaW9yIEVtYmVkZGVkIExpbnV4IERldmVsb3BlcgoK
ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KCgpBbWFydWxhIFNvbHV0aW9ucyBTUkwKClZpYSBMZSBDYW5ldmFyZSAz
MCwgMzExMDAgVHJldmlzbywgVmVuZXRvLCBJVAoKVC4gKzM5IDA0MiAyNDMgNTMxMAppbmZvQGFt
YXJ1bGFzb2x1dGlvbnMuY29tCgp3d3cuYW1hcnVsYXNvbHV0aW9ucy5jb20KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
