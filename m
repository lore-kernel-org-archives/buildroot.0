Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73105C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 16:22:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11B65400C4;
	Sun, 24 Mar 2024 16:22:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wDitnNxGBqSX; Sun, 24 Mar 2024 16:22:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E882840296
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E882840296;
	Sun, 24 Mar 2024 16:22:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 670B11BF4D6
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 16:22:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 53B2781AF5
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 16:22:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ao88QVogMYVr for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 16:22:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1133; helo=mail-yw1-x1133.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 158EF81A6D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 158EF81A6D
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 158EF81A6D
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 16:22:45 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-60a0579a968so38203227b3.3
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 09:22:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711297364; x=1711902164;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wxl0F/uqOOQLlxcVbhNTgj4B4u0su5FbyKDB1ZjI7o0=;
 b=TfXKQVCO/h4vjxo0Stg2NaZgXbf2vjLKqksRmv94Ad6SvId2AOMSA3X9TYOnImpBnH
 /h6MLk33+d2qUW0kMAfhJ4IUgJUbWw0VNXImGC+zBxEYfdpgnIf8OqMoimEFX6C8CuxH
 5st+iSU7sMiqiw+BtFGvzq6TBEPASHJrpvlYeor96isXq8A3CkbdKZtpWVEZEO1Pawzz
 JOCjzNMsRoAdBacdqSjjljPVOtgIDeAUgLMQcMKfvpQxlRrLRQPDwj+ls2zgwxiBdvON
 Mwgp4UlglZgWf65NICb71XN7k+HIr5Eg72RcECfBSMoWlIUQtPBhgIJGE1FEfko74XC6
 W4IQ==
X-Gm-Message-State: AOJu0YwyN36cve+rGgHYGsDWnHBLqaD7cMR5yi2EIyJ74Zhx7/l7jSch
 O/xOCvQ8pJghrth8B9ooTOQwzsEnfY9zw+3uSnjxH3GK6z206aZdxxUq7D5Wj1UdEOKY3RSMzjC
 BwqKm7u2l1vtFiP5oXdFzzMC+dAEE4n7eKOFyfw==
X-Google-Smtp-Source: AGHT+IER+sf9g6vR2JqsENlRfQaieLonlSDv+r1C6Du2WhVLZobhvVaIFhSUPGjrfCioDfWHYqWhBZr5WOqmWT11CpI=
X-Received: by 2002:a81:6243:0:b0:611:6b6f:dba8 with SMTP id
 w64-20020a816243000000b006116b6fdba8mr1059247ywb.25.1711297364527; Sun, 24
 Mar 2024 09:22:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240304153253.732708-1-dario.binacchi@amarulasolutions.com>
 <20240304153253.732708-6-dario.binacchi@amarulasolutions.com>
 <ZfoNHD-DlqkkYCRh@landeda>
In-Reply-To: <ZfoNHD-DlqkkYCRh@landeda>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sun, 24 Mar 2024 17:22:33 +0100
Message-ID: <CABGWkvpPaiC3Uz8_dG87x9n=5R+f7U-KWA_ibGnHH=GkPsTkyw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1711297364; x=1711902164;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wxl0F/uqOOQLlxcVbhNTgj4B4u0su5FbyKDB1ZjI7o0=;
 b=mQ1KKOZ5GNNj1avb9JRti0/nZFEkT018r9gFO94drOaboVG3YCMmAx+acJfj+e+oXm
 aYwN415YQPDBOiLmilxaE9jZH0rKucdJ5Zxb9eevM+squboP+bbIK68gWlWViiVnELmd
 6L27OxHvbV+ByKNRYvFu74ZuB8ynR47dofOKk=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=mQ1KKOZ5
Subject: Re: [Buildroot] [PATCH v9 05/22] boot/ti-k3-r5-loader: bump to
 version 2024.01
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
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Anand Gadiyar <gadiyar@ti.com>, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@smile.fr>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com, bryce@redpinelabs.com,
 Andreas Dannenberg <dannenberg@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgWWFubiwKCk9uIFR1ZSwgTWFyIDE5LCAyMDI0IGF0IDExOjA54oCvUE0gWWFubiBFLiBNT1JJ
TiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdyb3RlOgo+Cj4gRGFyaW8sIEFsbCwKPgo+IE9u
IDIwMjQtMDMtMDQgMTY6MzIgKzAxMDAsIERhcmlvIEJpbmFjY2hpIHNwYWtlIHRodXNseToKPiA+
IEFsbCBpbi10cmVlIGNvbmZpZ3Mgd2l0aCB0aGUgdGktazMtcjUgYm9vdGxvYWRlciB1c2UgYSBj
dXN0b20gdmVyc2lvbiwKPiA+IHNvIHRoaXMgcGF0Y2ggaXMgbW9zdGx5IGZvciB0aGUgbWVudWNv
bmZpZyBkZWZhdWx0IHZlcnNpb24KPiA+Cj4gPiBTdWdnZXN0ZWQtYnk6IFJvbWFpbiBOYW91ciA8
cm9tYWluLm5hb3VyQHNtaWxlLmZyPgo+ID4gU2lnbmVkLW9mZi1ieTogRGFyaW8gQmluYWNjaGkg
PGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+IFstLVNOSVAtLV0KPiA+IGRp
ZmYgLS1naXQgYS9ib290L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIuaGFzaCBiL2Jv
b3QvdGktazMtcjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5oYXNoCj4gPiBpbmRleCBjNWQxY2I4
ZTA5ZjAuLmZiZTVkMjE1NDA5ZCAxMDA2NDQKPiA+IC0tLSBhL2Jvb3QvdGktazMtcjUtbG9hZGVy
L3RpLWszLXI1LWxvYWRlci5oYXNoCj4gPiArKysgYi9ib290L3RpLWszLXI1LWxvYWRlci90aS1r
My1yNS1sb2FkZXIuaGFzaAo+ID4gQEAgLTEsMyArMSwzIEBACj4gPiAgIyBMb2NhbGx5IGNvbXB1
dGVkOgo+ID4gLXNoYTI1NiAgNTBiNDQ4MmE1MDViYzI4MWJhODQ3MGMzOTlhM2MyNmUxNDVlMjli
MjM1MDBiYzM1YzUwZGViZDdmYTQ2YmRmOCAgdS1ib290LTIwMjIuMTAudGFyLmJ6Mgo+Cj4gUmVt
b3ZpbmcgdGhpcyBoYXNoIG1lYW5zIHRoYXQgZGVmY29uZmlncyB0aGF0IHN0aWxsIHJlZmVyZW5j
ZSB0aGUKPiAyMDIyLjEwIHZlcnNpb24sIG5vIGxvbmdlciBoYXZlIGEgaGFzaCB0byB2YWxpZGF0
ZSB0aGUgZG93bmxvYWQgYWdhaW5zdCwKPiB3aGljaCBtYWtlIGl0IHN1c2NlcHRpYmxlIHRvIENW
RS0yMDIzLTQzNjA4IFswXSBbMV0uCj4KPiBUaGF0IHdhcyBhbHJlYWR5IHRoZSBjYXNlIGZvciB0
aGUgdHdvIHRpLWFtNj94IGRlZmNvbmZpZyBpbiB0aGUgdGhlIHR3bwo+IHByZXZpb3VzIHBhdGNo
ZXMsIGFzIHRoZXkgYWxyZWFkeSB1c2VkIGEgY3VzdG9tIGtlcm5lbCwgYSBjdXN0bSBBVEYsIGEK
PiBjdXN0b20gdS1ib290OiB0aGUgaGFzaGVzIGNhbid0IGJlIGNoZWNrZWQgZm9yIHRob3NlIHZl
cnNpb25zLCBzbyB0aGUKPiB0d28gdGkgYW0/eCBkZWZjb25maWdzIGFscmVhZHkgaGl0IENWRS0y
MDIzLTQzNjA4Lgo+Cj4gV2UgYWxyZWFkeSBmaXhlZCBhbm90aGVyIGRlZmNvbmZpZyBmb3IgYSBz
aW1pbGFyIGlzc3VlLCBzZWUgY29tbWl0Cj4gOWViYmZlZmYzODcgKGNvbmZpZ3Mvcm9jazViOiBh
ZGQgaGFzaCBmb3IgY3VzdG9tIGtlcm5lbCkuCj4KPiBDb3VsZCB5b3UgbG9vayBpbnRvIGRvaW5n
IHRoZSBzYW1lIGZvciB0aG9zZSB0byBUSSBhbTY/eCBkZWZjb25maWcsCj4gcGxlYXNlPwoKVGhh
bmtzIGZvciB0aGUgaW5mby4KWWVzIEkgd2lsbCBhZGQgYSBwYXRjaCBmb3IgdGhpcyBwb2ludCBp
biB2ZXJzaW9uIDEwIG9mIHRoZSBzZXJpZXMuCgo+Cj4gSW4gdGhlIG1lYW50aW1lLCBJIGtlcHQg
dGhlIGhhc2ggZm9yIDIwMjIuMTAgZm9yIHRpLWszLXI1LWxvYWRlcgo+IChyZWFsbHksIGZvciB1
Ym9vdCksIHRvIGFidm9pZCB0aGUgaXNzdWUgYXQgbGVhc3QgZm9yIHRpLWszLXI1LWxvYWRlci4K
Pgo+IFNwZWFraW5nIG9mIHRoYXQsIGJ5IHRoZSB3YXksIHRpLWszLXI1LWxvYWRlciByZWFsbHkg
aXMgdWJvb3QsIHNvIEkKPiB0aGluayB0aGF0IGl0IHNob3VsZCBzaGFyZToKPgo+ICAxLiB0aGUg
c2FtZSBETF9ESVI6ICAgVElfSzNfUjVfTE9BREVSX0RMX1NVQkRJUiA9IHVib290Cj4KPiAgMi4g
dGhlIHNhbWUgaGFzaCBmaWxlOiAgaGF2ZSB0aS1rMy1yNS1sb2FkZXIuaGFzaCBiZSBhIHN5bWxp
bmsgdG8KPiAgICAgdWJvb3QuaGFzaCAgKGFuZCBoYXZlIGEgeG9tbWVudCBhdCB0aGUgdG9wIG9m
IHRoYXQgaGFzaCBmaWxlIHRoYXQgaXQKPiAgICAgaXMgc2hhcmVkIGFuZCB0aGF0IG9sZCBoYXNo
ZXMgc2hvdWxkL2NhbiBiZSBrZXB0KQo+Cj4gRG8geW91IHRoaW5rIHRoYXQgbWFrZXMgc2Vuc2U/
IElmIHNvLCB3b3VsZCB5b3UgbGlrZSB0byBsb29rIGludG8gaXQ/CgpJIHRoaW5rIGxpa2UgeW91
IHRoYXQgd2hlcmUgcG9zc2libGUgaXQgaXMgYmV0dGVyIG5vdCB0byByZXBsaWNhdGUgY29kZS4K
VGhpcyBzZXJpZXMgaGFzIGJlZW4gb25nb2luZyBzaW5jZSBOb3ZlbWJlciAyMDIzLCBzdGFydGVk
IHRvIGZpeCB0aGUKY29tcGlsYXRpb24gZm9yIHRoZSBIU19GUyBkZXZpY2UgZm9yIHRoZSB0aV9h
bTYyeF9za19kZWZjb25maWcgY29uZmlndXJhdGlvbi4KRHVyaW5nIHRoZSByZXZpZXcgcHJvY2Vz
cywgaXQgaGFzIGFkZGVkIGFkZGl0aW9uYWwgcGF0Y2hlcwoodGlfYW02NHhfc2tfZGVmY29uZmln
LAphbmQgcmVtb3ZhbCBvZiB0aGUgdGktazMtaW1hZ2UtZ2VuIHBhY2thZ2UpIHdoaWNoIHN0aWxs
IHRvZGF5IGhhdmUgbm90CmFsbG93ZWQgdGhlCnNlcmllcyB0byBiZSBtZXJnZWQgYW5kIHRoZXJl
Zm9yZSB0byBmaXggdGhlIGlzc3VlLgpTbywgSSB3b3VsZCBwcmVmZXIgdG8gYWRkcmVzcyB0aGlz
IGFzcGVjdCBpbiBhIHNlcGFyYXRlIHNlcmllcyBmcm9tCnRoaXMgb25lIGluIG9yZGVyCm5vdCB0
byBmdXJ0aGVyIHNsb3cgaXQgZG93bi4KRG8geW91IGFncmVlPwoKVGhhbmtzIGFuZCByZWdhcmRz
LApEYXJpbwo+Cj4gWzBdIGh0dHBzOi8vY3ZlLm1pdHJlLm9yZy9jZ2ktYmluL2N2ZW5hbWUuY2dp
P25hbWU9MjAyMy00MzYwOAo+IFsxXSBodHRwczovL3RhbG9zaW50ZWxsaWdlbmNlLmNvbS92dWxu
ZXJhYmlsaXR5X3JlcG9ydHMvVEFMT1MtMjAyMy0xODQ0Cj4KPiBSZWdhcmRzLAo+IFlhbm4gRS4g
TU9SSU4uCj4KPiA+ICtzaGEyNTYgIGI5OTYxMWYxZWQyMzdiZjM1NDFiZGM4NDM0YjY4Yzk2YTZl
MDU5NjcwNjFmOTkyNDQzY2IzMGFhYmViZWY1YjMgIHUtYm9vdC0yMDI0LjAxLnRhci5iejIKPiA+
ICBzaGEyNTYgIDgxNzdmOTc1MTMyMTM1MjZkZjJjZjYxODRkOGZmOTg2YzY3NWFmYjUxNGQ0ZTY4
YTQwNDAxMDUyMWI4ODA2NDMgIExpY2Vuc2VzL2dwbC0yLjAudHh0Cj4gPiAtLQo+ID4gMi40My4w
Cj4gPgo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiA+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiA+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4g
PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
Pgo+IC0tCj4gLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0t
LS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KPiB8ICBZYW5uIEUuIE1PUklOICB8IFJl
YWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTog
fAo+IHwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdO
ICAgICB8ICBfX18gICAgICAgICAgICAgICB8Cj4gfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0t
LS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKPiB8
IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAg
fCAgIHYgICBjb25zcGlyYWN5LiAgfAo+ICctLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1e
LS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCgoKCi0tIAoK
RGFyaW8gQmluYWNjaGkKClNlbmlvciBFbWJlZGRlZCBMaW51eCBEZXZlbG9wZXIKCmRhcmlvLmJp
bmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCgoKQW1hcnVsYSBTb2x1dGlvbnMgU1JMCgpWaWEgTGUgQ2FuZXZhcmUgMzAsIDMxMTAw
IFRyZXZpc28sIFZlbmV0bywgSVQKClQuICszOSAwNDIgMjQzIDUzMTAKaW5mb0BhbWFydWxhc29s
dXRpb25zLmNvbQoKd3d3LmFtYXJ1bGFzb2x1dGlvbnMuY29tCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
