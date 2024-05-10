Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 606C8C25B10
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 20:18:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED5C2423BE;
	Fri, 10 May 2024 20:18:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rVZrxUEUCyu1; Fri, 10 May 2024 20:18:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53D4C422FC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53D4C422FC;
	Fri, 10 May 2024 20:18:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5A5BD1BF28A
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 20:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 469EA61624
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 20:18:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pdaT0pLoOgoN for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 20:18:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=michael@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A3B42615E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3B42615E9
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A3B42615E9
 for <buildroot@buildroot.org>; Fri, 10 May 2024 20:18:05 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a59ad344f7dso517553366b.0
 for <buildroot@buildroot.org>; Fri, 10 May 2024 13:18:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715372283; x=1715977083;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VQmYFJcgeZQIl6tmZzkPSahcwqrtpdMgMwj7JdefmHA=;
 b=csCuNriXNB82XgsgjJsrRRxQ3WktHOpjdsNxi3cM6pY6WRrVPqc7vj6p2xgKHC0WNd
 1XybRvZlfs57/sCcGigRCJ7vSqz7Y8YSk1r6dZr9tr8CmL2cF+B4M1uVtYb46LGJzgS9
 1TUfp8hFWJnEcgArL9x40sN9xdNuebrUPVPHtB6bbEFZnVKkgUjg11WicIVpfnl7kNEi
 GfrPAXuM7nG5QNQmOYdVbDOqVlNQEXtqZOZLKniBAam4XFx/JzlwtEe55bg2Bu9U7mML
 qNkOmmmMpirE+801EpPSE3JnIpRaYqhp9jKA8eRM4TNmPGu9gcBrzwm+ekDJxGOK8xc5
 1O/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMwGaFigog7IvkrywH2FMDOIvt4MYGtLg3XgR09ie2NdcoD8zAqTtW5EsrKYjbM486JWLXeI9unuUPt8LEwtoaUmry+4pnXw==
X-Gm-Message-State: AOJu0YzFaoPwuOm4bCB08hCC0ogdpUs+xydzaVHH876tryrQgMJZ+pQT
 SVEq7J6qXyzzpisvgR6XRUq1ID4RkvYhA7AEy048JHPBhp6PU60ckoIpFAMtBKXFFFqc73jRebk
 sc/S98fNftoMnaNtgomsdkIojSyqZ4o4BFlMlsQ==
X-Google-Smtp-Source: AGHT+IHvURd9W5QCkySPIItK1MfLC4yuubjigioCC5HMKMlEBUBs7nZ/LiQmcyg4W1mxwbE+Tc2A0MWUNh1N55twQBw=
X-Received: by 2002:a50:bb0e:0:b0:572:df77:c1bf with SMTP id
 4fb4d7f45d1cf-5734d5974f2mr2570618a12.3.1715372283569; Fri, 10 May 2024
 13:18:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240421095353.208034-1-dario.binacchi@amarulasolutions.com>
 <20240421095353.208034-2-dario.binacchi@amarulasolutions.com>
 <20240510215442.3475120a@windsurf>
In-Reply-To: <20240510215442.3475120a@windsurf>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Fri, 10 May 2024 22:17:51 +0200
Message-ID: <CAOf5uwkDmcxhWJUFhxjw_GJTiTEO5oEexb0Xjh6aNJx+K_9dXA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1715372283; x=1715977083;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VQmYFJcgeZQIl6tmZzkPSahcwqrtpdMgMwj7JdefmHA=;
 b=EFNVQ5/fpEu/Odt8P2NtxZOO2IkeO89f1O/QUY7ZF0Zf8ElAaBf1olMKG9D+ay4ep6
 vmn1QkqqkJq1hNnjASqVmDrw4vpqiBEHIW9sjXCHPotBMVEPyqe3k1GglVLWegmJiyle
 l3exUj/8yVPIwd2novy8btxVImBBAoF68+Syw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=EFNVQ5/f
Subject: Re: [Buildroot] [RFC PATCH 1/2] support/scripts/genimage.sh:
 support creating a bmap image
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
Cc: Xuanhao Shi <X15000177@gmail.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@smile.fr>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzIGFuZCBhbGwKCk9uIEZyaSwgTWF5IDEwLCAyMDI0IGF0IDk6NTTigK9QTSBUaG9t
YXMgUGV0YXp6b25pCjx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhl
bGxvIERhcmlvLAo+Cj4gT24gU3VuLCAyMSBBcHIgMjAyNCAxMTo1Mzo1MiArMDIwMAo+IERhcmlv
IEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4gd3JvdGU6Cj4K
PiA+IFRoZSBwYXRjaCBhZGRzIGFuIG9wdGlvbiB0byBjcmVhdGUsIGluIGFkZGl0aW9uIHRvIHRo
ZSB1c3VhbCBpbWFnZSwgYW4KPiA+IGltYWdlIG9mIHR5cGUgYm1hcCB0aGF0IGRyYXN0aWNhbGx5
IHJlZHVjZXMgdGhlIGFtb3VudCBvZiBkYXRhIHRoYXQKPiA+IG5lZWRzIHRvIGJlIHdyaXR0ZW4g
dG8gYW4gU0QgY2FyZCwgcmVzdWx0aW5nIGluIHRpbWUgc2F2aW5ncy4KPiA+Cj4gPiBUaGlzIG1h
a2VzIGl0IHBvc3NpYmxlIHRvIGFjdGl2YXRlIHRoaXMgb3B0aW9uIGVhc2lseSBhbmQgbWFpbnRh
aW4KPiA+IGJhY2t3YXJkIGNvbXBhdGliaWxpdHkgZm9yIGFsbCBjb25maWd1cmF0aW9ucyBhbHJl
YWR5IHVzaW5nIHRoZSBnZW5pbWFnZQo+ID4gdG9vbCBmb3IgY3JlYXRpbmcgdGhlIGltYWdlIHRv
IGJlIHdyaXR0ZW4gdG8gdGhlIFNEIGNhcmQ6Cj4gPgo+ID4gQlIyX1JPT1RGU19QT1NUX0lNQUdF
X1NDUklQVD0ic3VwcG9ydC9zY3JpcHRzL2dlbmltYWdlLnNoIgo+ID4gK0JSMl9ST09URlNfUE9T
VF9JTUFHRV9TQ1JJUFRfQVJHUz0iLWMgYm9hcmQvPG1hbnVmYWN0dXJlcj4vPGJvYXJkbmFtZT4v
Z2VuaW1hZ2UuY2ZnIC1iIgo+ID4gK0JSMl9QQUNLQUdFX0hPU1RfQk1BUF9UT09MUz15Cj4gPgo+
ID4gSXQgZm9sbG93cyB0aGF0IHRoZSBzY3JpcHQgbm93IGFzc3VtZXMgYSBicm9hZGVyIGZ1bmN0
aW9uYWxpdHkgdGhhdAo+ID4gZXh0ZW5kcyBiZXlvbmQganVzdCBiZWluZyBhbiBpbnRlcmZhY2Ug
Zm9yIHRoZSBnZW5pbWFnZSB0b29sLgo+ID4KPiA+IEFuIGFsdGVybmF0aXZlIGltcGxlbWVudGF0
aW9uIGNvdWxkIGhhdmUgYmVlbiB0byBjcmVhdGUgYW5vdGhlciBzY3JpcHQsCj4gPiBzdWNoIGFz
IHN1cHBvcnQvc2NyaXB0cy9ibWFwLnNoLCBjYXBhYmxlIG9mIGNyZWF0aW5nIHRoZSBibWFwIGlt
YWdlCj4gPiB1c2luZyB0aGUgc2FtZSBwYXJhbWV0ZXJzIHBhc3NlZCB0byBzdXBwb3J0L3Njcmlw
dHMvZ2VuaW1hZ2Uuc2ggKGkuIGUuCj4gPiAtYyBib2FyZC88bWFudWZhY3R1cmVyPi88Ym9hcmRu
YW1lPi9nZW5pbWFnZS5jZmcpLiBIb3dldmVyLCBpbiB0aGlzIGNhc2UsCj4gPiB0aGUgc2NyaXB0
IHdvdWxkIGFsc28gbmVlZCB0byBrbm93IHRoYXQgdGhlIGltYWdlIGlzIGxvY2F0ZWQgaW4gdGhl
Cj4gPiAke0JJTkFSSUVTfSBkaXJlY3RvcnkuIFRoaXMgY291bGQgYmUgYWNoaWV2ZWQgYnkgYWRk
aW5nIGFuIGFkZGl0aW9uYWwKPiA+IHBhcmFtZXRlciwgYnV0IGl0IG1pZ2h0IGNhdXNlIGdlbmlt
YWdlLnNoIHRvIGZhaWwgZHVlIHRvIGFuIHVucmVjb2duaXplZAo+ID4gcGFyYW1ldGVyLgo+ID4K
PiA+IFNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxh
c29sdXRpb25zLmNvbT4KPgo+IFRoYW5rcyBmb3IgdGhpcyBwcm9wb3NhbCEgQWN0dWFsbHksIEkg
dmVyeSBtdWNoIGxpa2UgdGhlIGlkZWEgb2YKPiBleHRlbmRpbmcgdGhlIHVzYWdlIG9mIGJtYXAt
dG9vbHMgaW4gQnVpbGRyb290LiBJIHRoaW5rIGl0J3MgYSBncmVhdAo+IHRvb2wsIGFuZCBpdCBt
YWtlcyBhIGxvdCBvZiBzZW5zZSB0byBlbmNvdXJhZ2UgbW9yZSBvZiBpdHMgdXNlLgo+Cj4gTm93
IHRoZSBxdWVzdGlvbiBpcyBob3cgdG8gZG8gdGhpcy4gVG8gbWUgeW91ciBwcm9wb3NhbCBsb29r
cwo+IHJlYXNvbmFibGUsIHRob3VnaCBzb21lIHBlb3BsZSBoYWQgdGhlIGZlZWRiYWNrIHRoYXQg
Ym1hcC10b29scyB3aWxsCj4gbm90IHdvcmsgaW4gYWxsIGNhc2VzIChzaG91bGQgd2UgdGhlbiBn
cmFjZWZ1bGx5IGhhbmRsZSB0aGlzIGZhaWx1cmUKPiBjYXNlPykuCj4KPiBBcm5vdXQsIFlhbm4s
IFBldGVyLCBSb21haW4sIHdoYXQgZG8geW91IHRoaW5rPyBEbyB5b3Ugc2VlIG90aGVyCj4gYXBw
cm9hY2hlcyB0byBlYXNpbHkgYWxsb3cgZ2VuZXJhdGluZyBibWFwLWNvbXBhdGlibGUgaW1hZ2Vz
Pwo+Cj4gQW5vdGhlciBxdWVzdGlvbiwgcGVyaGFwcyBmb3IgRGFyaW8sIG9yIG90aGVyIHBlb3Bs
ZSBmYW1pbGlhciB3aXRoCj4gZ2VuaW1hZ2U6IGlmIHRoZSByb290ZnMuZXh0NCBnZW5lcmF0ZWQg
YnkgQnVpbGRyb290IGlzIHNwYXJzZSwgaXMKPiBnZW5pbWFnZSBhYmxlIHRvIHByZXNlcnZlIHRo
ZSAiaG9sZXMiIHdoZW4gZ2VuZXJhdGluZyB0aGUgc2RjYXJkLmltZwo+IHRoYXQgaW5jbHVkZXMg
dGhlIHJvb3Rmcy5leHQ0ID8KCklmIHlvdSBjb25zaWRlciBzcGFyc2UgdGhlIHdheSB0aGF0IGZh
c3Rib290IGhhbmRsZSBpdCwgc28gSSBoYXZlCnF1aWNrIHRlc3RlZCBhbmQgc2VlbXMKZ2VuaW1h
Z2UgY2FuIGNyZWF0ZSBzZGNhcmQuaW1nIGFuZCBzZGNhcmQtc3BhcnNlLmltZyB1c2luZyBhIHNw
ZWNpZmljIGdlbmNvbmZpZwoKSSBoYXZlIHRlc3RlZCB3aXRoIHRoaXMKCmltYWdlIHNkY2FyZC5p
bWcgewogICAgaGRpbWFnZSB7CiAgICB9CgogICAgcGFydGl0aW9uIHUtYm9vdC10cGwtc3BsLWR0
YiB7CiAgICAgICAgaW4tcGFydGl0aW9uLXRhYmxlID0gIm5vIgogICAgICAgIGltYWdlID0gImlk
YmxvYWRlci5pbWciCiAgICAgICAgb2Zmc2V0ID0gMzJLCiAgICB9CgogICAgcGFydGl0aW9uIHUt
Ym9vdC1kdGIgewogICAgICAgIGluLXBhcnRpdGlvbi10YWJsZSA9ICJubyIKICAgICAgICBpbWFn
ZSA9ICJ1LWJvb3QuaXRiIgogICAgICAgIG9mZnNldCA9IDhNCiAgICAgICAgc2l6ZSA9IDMwTQog
ICAgfQoKICAgIHBhcnRpdGlvbiByb290ZnMgewogICAgICAgIHBhcnRpdGlvbi10eXBlID0gMHg4
MwogICAgICAgIGltYWdlID0gInJvb3Rmcy5leHQ0IgogICAgfQp9CgppbWFnZSBzZGNhcmQtc3Bh
cnNlLmltZyB7CiAgICBhbmRyb2lkLXNwYXJzZSB7CiAgICAgICAgaW1hZ2UgPSBzZGNhcmQuaW1n
CiAgICB9Cn0KCm91dHB1dC9pbWFnZXMvc2RjYXJkLmltZzogICAgICAgIERPUy9NQlIgYm9vdCBz
ZWN0b3I7IHBhcnRpdGlvbiAxIDoKSUQ9MHg4Mywgc3RhcnQtQ0hTICgweDQsMjE1LDIwKSwgZW5k
LUNIUyAoMHg1MSw4NSw0KSwgc3RhcnRzZWN0b3IKNzc4MjQsIDEyMjg4MDAgc2VjdG9ycywgZXh0
ZW5kZWQgcGFydGl0aW9uIHRhYmxlIChsYXN0KQpvdXRwdXQvaW1hZ2VzL3NkY2FyZC1zcGFyc2Uu
aW1nOiBBbmRyb2lkIHNwYXJzZSBpbWFnZSwgdmVyc2lvbjogMS4wLApUb3RhbCBvZiAxNjMzMjgg
NDA5Ni1ieXRlIG91dHB1dCBibG9ja3MgaW4gMjkgaW5wdXQgY2h1bmtzLgoKTWljaGFlbAoKPgo+
IFRoYW5rcyEKPgo+IFRob21hcwo+IC0tCj4gVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5k
IENFTywgQm9vdGxpbgo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5k
IHRyYWluaW5nCj4gaHR0cHM6Ly9ib290bGluLmNvbQoKCgotLSAKTWljaGFlbCBOYXp6YXJlbm8g
VHJpbWFyY2hpCkNvLUZvdW5kZXIgJiBDaGllZiBFeGVjdXRpdmUgT2ZmaWNlcgpNLiArMzkgMzQ3
IDkxMyAyMTcwCm1pY2hhZWxAYW1hcnVsYXNvbHV0aW9ucy5jb20KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwoKQW1hcnVsYSBTb2x1dGlvbnMgQlYKSm9vcCBHZWVzaW5rd2VnIDEy
NSwgMTExNCBBQiwgQW1zdGVyZGFtLCBOTApULiArMzEgKDApODUgMTExIDkxNzIKaW5mb0BhbWFy
dWxhc29sdXRpb25zLmNvbQp3d3cuYW1hcnVsYXNvbHV0aW9ucy5jb20KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
