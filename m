Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0004AC25B74
	for <buildroot@archiver.kernel.org>; Sun,  2 Jun 2024 21:25:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADEEF81FF4;
	Sun,  2 Jun 2024 21:25:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e98mvj1Zedfd; Sun,  2 Jun 2024 21:25:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 974048206F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 974048206F;
	Sun,  2 Jun 2024 21:25:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 92F411BF5AA
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 21:25:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DA8B8206F
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 21:25:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FODzgVGEHezJ for <buildroot@lists.busybox.net>;
 Sun,  2 Jun 2024 21:25:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::82c; helo=mail-qt1-x82c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D17AF81FF4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D17AF81FF4
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D17AF81FF4
 for <buildroot@buildroot.org>; Sun,  2 Jun 2024 21:25:17 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id
 d75a77b69052e-43fb058873bso14705801cf.1
 for <buildroot@buildroot.org>; Sun, 02 Jun 2024 14:25:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717363516; x=1717968316;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qgpAkoPTrb6n2AvFchxudnGbnLflAljRQvHn8Gs3TUI=;
 b=oml436j6z2Q+NYLo5qHhyAT/vpNBrYhADIq3LrVWIHo8QcCubT6AkyXMVApAeXgCgU
 B098LcqyXpnR3MscyeRV0stkO2GHH3hrqdN2MXuiS7eGxPq6vss/4350neh3OvBEKDXM
 Q60V3f8OJ+1IW2imMktbyGy5T7O4IE0nmyHausG6jfwezhvBcLHt2KuKJCmBMJDJFmsl
 8Dt5CmQ7QKIDf+J/pSiTLevYqUbu/+GPCpTZXQ4yRzGcCcKPL3TBBkI/cTLjPeUx6r4X
 Bf7T4S5KislAaK9j+3Ksfz5U6df6pcRq6IPUG3Bl6D/GGx9IVSCFFu2ADHsn6NhXH21V
 7vkg==
X-Gm-Message-State: AOJu0YwvM2Qf6osvyGln3MLriwdkK6KJFmppNpPVu3e+ZJewgpC802hc
 xgwHt3PnTg7nDi5tMUTUvvJUWp/ShemFhpq8hlaE2BAjiEJqw+sc8NjqPUw1fYMv125pRuG9Zfp
 Yf+P3fXPLeeQSse+vfOanttJ0ONM=
X-Google-Smtp-Source: AGHT+IFBSLfeUS7vfbc2b5fPyMuNKZR4tLrPVxRdgJ2514+Zprfxq/wloBhtpZefWFVOsN5vAam43N998ywVULAZi7M=
X-Received: by 2002:a05:622a:252:b0:43d:fe36:99 with SMTP id
 d75a77b69052e-43ff52aae43mr87612301cf.52.1717363516465; Sun, 02 Jun 2024
 14:25:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1717360788.git.yann.morin.1998@free.fr>
 <1f9ee4bc875b559abde9a4746ab55fa4ca62dc85.1717360788.git.yann.morin.1998@free.fr>
 <CADvTj4qfHg9=mC_OweMCpfNNBDMweBreqDo_bT=t=m339oLBWQ@mail.gmail.com>
 <Zlzg8I5r7cd8yTz5@landeda>
In-Reply-To: <Zlzg8I5r7cd8yTz5@landeda>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 2 Jun 2024 15:25:04 -0600
Message-ID: <CADvTj4rhK6KUZ-q-w65ZDGJZyh2fs2DnHXM-mxzMv3LS9GOQYA@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717363516; x=1717968316; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qgpAkoPTrb6n2AvFchxudnGbnLflAljRQvHn8Gs3TUI=;
 b=fW/xTlTHRadhqyM3WlQxaNFcuHivRhNnoDDpERDjcmqCrvnYOT//26tIVmU61AwlKY
 od9c5cFLXkG0wMaLG3u+VRUqykhLuX0PU38cJcWqj6zeb7MMNumhmBI9bYIPsvvQh9wP
 HU6sZ7MkBm0c2ucJfL2uInW4UHxtDWwFOujnMOO9CbDyzU9B8BtXNWqyyz6izYviISxp
 dw1bKXAi3rOTqSnK4AYSS/sMh99iyPzUMVIjaX6Q659Vc3rDhVkyfuHLmovLRyTHXMto
 L1mtQbHO52qMfDblD+KTTOPfPrUl7cglAk7QO41BqqronmV6PTCrm9Pv71QOLXC19zem
 7IAA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fW/xTlTH
Subject: Re: [Buildroot] [PATCH 14/16] package/pkg-cargo: add support for
 unlocked packages
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

T24gU3VuLCBKdW4gMiwgMjAyNCBhdCAzOjE14oCvUE0gWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jp
bi4xOTk4QGZyZWUuZnI+IHdyb3RlOgo+Cj4gSmFtZXMsIEFsbCwKPgo+IE9uIDIwMjQtMDYtMDIg
MTQ6NTMgLTA2MDAsIEphbWVzIEhpbGxpYXJkIHNwYWtlIHRodXNseToKPiA+IE9uIFN1biwgSnVu
IDIsIDIwMjQgYXQgMjo0MuKAr1BNIFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVl
LmZyPiB3cm90ZToKPiBbLS1TTklQLS1dCj4gPiA+ICtXaGVuIGEgcGFja2FnZSBzb3VyY2UgdHJl
ZSBjb250YWlucyBhICtDYXJnby5sb2NrKyBmaWxlLCB0aGUgcGFja2FnZSBoYXMKPiA+ID4gK2Jl
ZW4gX2xvY2tlZF86IGNhcmdvIGRpZCBzdG9yZSB0aGUgdmVyc2lvbnMgZm9yIHRoZSBjb21wbGV0
ZSBkZXBlbmRlbmN5Cj4gPiA+ICtjaGFpbiBpbiB0aGUgK0NhcmdvLmxvY2srIGZpbGU7IHRoYXQg
aXMgdGhlbiByZXVzZWQgYnkgY2FyZ28gZHVyaW5nIHRoZQo+ID4gPiArdmVuZG9yaW5nLCB3aGlj
aCB5aWVsZHMgYSByZXByb2R1Y2libGUgZGVwZW5kZW5jeSBjaGFpbiwgYW5kIHRodXMgYQo+ID4g
PiArcmVwcm9kdWNpYmxlIHRhcmJhbGw7IHRoZXJlZm9yZSwgaXQgaXMgcG9zc2libGUgdG8gY29t
cHV0ZSBhIGhhc2ggZm9yCj4gPiA+ICt0aGF0IGFyY2hpdmUuIElmIGEgcGFja2FnZSB3YXMgaG93
ZXZlciBub3QgbG9ja2VkLCB0aGVuIHRoZSB2ZXJzaW9ucyBmb3IKPiA+ID4gK3RoZSBkZXBlbmRl
bmNpZXMgYXJlIHVua25vd24sIHRoZSBkZXBlbmRlbmN5IGNoYWluIGlzIG5vdCByZXByb2R1Y2li
bGUsCj4gPiA+ICthbmQgdGhlIGFyY2hpdmUgaXMgdGhlbiBub3QgcmVwcm9kdWNpYmxlLCB3aGlj
aCBpbXBsaWVzIHRoZXJlIGNhbiBiZSBubwo+ID4gPiAraGFzaCBmb3IgdGhhdCBhcmNoaXZlLgo+
ID4KPiA+IEhtbSwgZm9yIHRoZXNlIGNhc2VzIHNob3VsZG4ndCB3ZSBnZW5lcmF0ZSBhbmQgY29t
bWl0IHRoZSBsb2NrZmlsZSB0bwo+ID4gdGhlIGJ1aWxkcm9vdCBwYWNrYWdlIHNvIHRoYXQgd2Ug
Y2FuIHRoZW4gZ2VuZXJhdGUgYSBkZXRlcm1pbmlzdGljIGFyY2hpdmUKPiA+IGFuZCBhcmNoaXZl
IGhhc2g/Cj4KPiBUaGFua3MgZm9yIHRoZSBxdWljayBmZWVkYmFjayEgOi0pCj4gVGhhdCdzIGEg
Z29vZCBpZGVhLCBpbmRlZWQhCj4KPiBJbnN0ZWFkIG9mIGludHJvZHVjaW5nIHRoZSAtdSBvcHRp
b24sIHdlJ2QgZG8gc29tZXRoaW5nIGxpa2U6Cj4KPiBJbiBmb28ubWs6Cj4KPiAgICAgRk9PX0NB
UkdPX0xPQ0tFRCA9IGJ1aWxkcm9vdCAgKG9yIHdoYXRldmVyIG5tZWFucyAibm90IHVwdHJlYW0i
KQo+Cj4gaW4gcGtnLWNhcmdvLm1rOgo+Cj4gICAgICQoMilfQ0FSR09fTE9DS0VEID89IHVwc3Ry
ZWFtICAob3IgYW55dGhpbmcgdGhhdCBtZWFucyAiT0shISEiKQo+Cj4gaW4gcGtnLWRvd25sb2Fk
Lm1rOgo+Cj4gICAgIGRsLXdyYXBwZXIgXAo+ICAgICAgICAgWy4uLl0gXAo+ICAgICAgICAgJChp
ZiAkKGZpbHRlciBidWlsZHJvb3QsJCgkKFBLRylfQ0FSR09fTE9DS0VEKSksLUwgJCgkKFBLRylf
UEtHRElSKS9DYXJnby5sb2NrIFwKPiAgICAgICAgIFsuLi5dCj4KPiBhbmQgaW4gY2FyZ28tcG9z
dC1wcm9jZXNzIChwc2V1ZG8gY29kZSk6Cj4KPiAgICAgaWYgb3B0aW9uIC1MIGlzIGdpdmVuOgo+
ICAgICAgICAgY29weSAtTCBhcmcgdG8gLi9DYXJnby5sb2NrCj4gICAgIGVuZGlmCj4KPiAgICAg
WyAtZiBDYXJnby5sb2NrIF0gfHwgZGllICdObyB3YXkhJwo+Cj4gV2FzIHRoYXQgd2hhdCB5b3Ug
aGFkIGluIG1pbmQ/CgpZZWFoLCBzb21ldGhpbmcgYWxvbmcgdGhvc2UgbGluZXMsIG9uZSB0aGlu
ZyB0aGF0IG1pZ2h0IGJlIGEgYml0IHRyaWNreSBpcwp0aGF0IHdlIHByb2JhYmx5IG5lZWQgdG8g
aW5jb3Jwb3JhdGUgdGhlIENhcmdvLmxvY2sgZmlsZSBoYXNoIG9yIHNvbWV0aGluZwpsaWtlIHRo
YXQgaW4gdGhlIGFyY2hpdmUgbmFtZSwgc28gdGhhdCB3YXkgaWYgdGhlIENhcmdvLmxvY2sgZmls
ZSBuZWVkcyB0byBiZQpyZWdlbmVyYXRlZCB0aGUgYXJjaGl2ZSBuYW1lIHdpbGwgYWxzbyBiZSBh
cHByb3ByaWF0ZWx5IGNoYW5nZWQgYXQgdGhlIHNhbWUKdGltZS4KCj4KPiA+IEkgdGhpbmsgd2Ug
d2FudCB0byBoYXZlIHRoZSBhYmlsaXR5IHRvIG1ha2UgdGhlc2UgcGFja2FnZXMgZGV0ZXJtaW5p
c3RpYwo+ID4gZXZlbiBpZiB1cHN0cmVhbSBmYWlscyB0byBwcm92aWRlIGEgQ2FyZ28ubG9jayBm
aWxlLgo+Cj4gWWVzLCB0aGUgbGFjayBvZiByZXByb2R1Y2liaWxpdHkgd2FzIHJlYWxseSBib3Ro
ZXJpbmcgbWUuIEJ1dCBpZiB3ZSBjYW4KPiBlYXNpbHkgY3JlYXRlIGEgQ2FyZ28ubG9jayB3aXRo
b3V0IHRvbyBtdWNoIGlzc3VlLCB0aGVuIHlvdXIgc3VnZ2VzdGlvbgo+IHdvdWxkIGJlIGdyZWF0
IQo+Cj4gUmVnYXJkcywKPiBZYW5uIEUuIE1PUklOLgo+Cj4gLS0KPiAuLS0tLS0tLS0tLS0tLS0t
LS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0t
LS0tLS0tLgo+IHwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFT
Q0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8Cj4gfCArMzMgNjYyIDM3NiAwNTYgfCBT
b2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAg
IHwKPiB8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNU
ICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAo+IHwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsu
b3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8Cj4g
Jy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0t
LV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
