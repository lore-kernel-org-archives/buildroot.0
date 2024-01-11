Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 718BBC4707B
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 19:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23BB442527;
	Thu, 11 Jan 2024 19:40:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23BB442527
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nc_6g2F3JSOc; Thu, 11 Jan 2024 19:40:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E15A4288D;
	Thu, 11 Jan 2024 19:40:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E15A4288D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3D5FD1BF82C
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 19:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1FFC3428C7
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 19:40:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FFC3428C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fDRRA_CvJ8Pq for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 19:40:44 +0000 (UTC)
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CC23C428BD
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 19:40:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC23C428BD
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-50e7abe4be4so7638416e87.2
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 11:40:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705002041; x=1705606841;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=87maWGX10AR5qB3n8XPU9KWSqkhsLiaYYC5Sj5O5nCk=;
 b=LivOJg7JON9FyrizyJlg4M8UN143dh/GMwUhe+c3WYrI/ARToJWYz993MxtYSwhIty
 vRz3uTwOWQ0h4tYtH8wQeMLB2i0fR/eqglyJSvfCGcwCi5VYj2MjP5lVP3y4d9xZGqN/
 4Sv6Le5IZpjo9aMyjNL5alCtFURg1+uLG7F3mTcxI0JIm4u7vCnNjLkUghcqtJwxQFRn
 9NAMAZKOGBWWCG2sDsM4I/309iqEXT/tRHZvm2fXjTsDBrtPvigg9WZ/KiPjqcUI0Lnr
 w9wOul71fIC9oPlR0fMv24fsntvTn2apOKsRGixEa/antTPYYQIDg9vjPh5R63b8TRxj
 Sb7w==
X-Gm-Message-State: AOJu0Yx/1jCkKARWmQmE1ASeVzIMarBtoRcmg9gcBjlHc6gFnUYM361d
 8eEhWZwrVfsm4xTZ1Mqtt+cpQsxw0s9zd/9EhvowQtgS0aKs9swrTwlg9FCJ
X-Google-Smtp-Source: AGHT+IG0fZJsOXv0OatQ+3dQkP2fsZXiESgE4ffHkXh2l2kXlqepjh9wxbK9pjFMffarV8beAtN77NxLOQtyf1twwYg=
X-Received: by 2002:a05:6512:5cc:b0:50e:dfb7:607d with SMTP id
 o12-20020a05651205cc00b0050edfb7607dmr97087lfo.55.1705002041364; Thu, 11 Jan
 2024 11:40:41 -0800 (PST)
MIME-Version: 1.0
References: <20240102235957.3072102-1-adam.duskett@amarulasolutions.com>
 <20240102235957.3072102-9-adam.duskett@amarulasolutions.com>
 <ZaA4GvpdWkjt9kb5@landeda>
In-Reply-To: <ZaA4GvpdWkjt9kb5@landeda>
From: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Thu, 11 Jan 2024 12:40:30 -0700
Message-ID: <CAHDQB6PaKTpFgpK+jaMVrDmbkUDz5-qv-MTrWT7wFNM7HFM44w@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1705002041; x=1705606841;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=87maWGX10AR5qB3n8XPU9KWSqkhsLiaYYC5Sj5O5nCk=;
 b=Nkpo5QL6KeqFpyPCMyky3zPU2d5J/Qolxo3VnJAkSpZsHCqbZE1B/Sbt6pcdQXmp0e
 9f9SykBzo2jSiWJEZGDdDcw9fhDl/9SE5zEyx1m5LfGkwJqVdlisi5GfqOw07LlYuVtQ
 f0Uk6EUHGyMuUz4HAipphGBKXTyj5V1fh2qdg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Nkpo5QL6
Subject: Re: [Buildroot] [PATCH v3 08/11] package/flutter-sdk-bin: add dart
 arguments for different runtime modes
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

WWFubjsKCgpPbiBUaHUsIEphbiAxMSwgMjAyNCBhdCAxMTo0OeKAr0FNIFlhbm4gRS4gTU9SSU4g
PHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPgo+IEFEYW0sIEFsbCwKPgo+IE9uIDIw
MjQtMDEtMDIgMTY6NTkgLTA3MDAsIEFkYW0gRHVza2V0dCBzcGFrZSB0aHVzbHk6Cj4gPiBOb3cg
dGhhdCBwcm9maWxlIG1vZGUgaXMgYW4gb3B0aW9uIGZvciB0aGUgZmx1dHRlci1lbmdpbmUgcGFj
a2FnZSwgdGhlIGxvZ2ljCj4gPiBpbiBwYWNrYWdlL2ZsdXR0ZXItc2RrLWJpbi9mbHV0dGVyLXNk
ay1iaW4ubWsgaXMgbm8gbG9uZ2VyIHN1ZmZpY2llbnQuCj4gPgo+ID4gQWRkIGFuIGlmZXEgc3Rh
dGVtZW50IGZvciBGTFVUVEVSX0VOR0lORV9SVU5USU1FX01PREVfUFJPRklMRSBhbmQgc2V0IHRo
ZQo+ID4gZm9sbG93aW5nIGxvZ2ljLCBib3Jyb3dlZCBmcm9tCj4gPiBodHRwczovL2dpdGh1Yi5j
b20vbWV0YS1mbHV0dGVyL21ldGEtZmx1dHRlci9ibG9iL2tpcmtzdG9uZS9jb25mL2luY2x1ZGUv
Zmx1dHRlci1hcHAuaW5jI0wyMzkKPiA+Cj4gPiBgYGAKPiA+IEhPU1RfRkxVVFRFUl9TREtfQklO
X1BST0ZJTEVfRkxBR1MgPSAtLXRyYWNrLXdpZGdldC1jcmVhdGlvbgo+ID4gSE9TVF9GTFVUVEVS
X1NES19CSU5fU0RLX1ZNX1BST0ZJTEUgPSB0cnVlCj4gPiBgYGAKPiA+Cj4gPiBUaGUgRkxVVFRF
Ul9FTkdJTkVfUlVOVElNRV9NT0RFX1BST0ZJTEUgYWxzbyBzZXRzCj4gPiBIT1NUX0ZMVVRURVJf
U0RLX0JJTl9TREtfUFJPRFVDVCB0byBmYWxzZSwgYW5kIHRoZQo+ID4gSE9TVF9GTFVUVEVSX1NE
S19CSU5fU0RLX1JPT1QgdG8KPiA+ICQoSE9TVF9GTFVUVEVSX1NES19CSU5fU0RLX0VOR0lORSkv
Y29tbW9uL2ZsdXR0ZXJfcGF0Y2hlZF9zZGsuIFdoaWNoIGlzIHRoZQo+ID4gc2FtZSBhcyBEZWJ1
ZyBtb2RlLgo+ID4KPiA+IFRoZSAtRGRhcnQudm0ucHJvZmlsZSBvcHRpb24gaXMgbm8gbG9uZ2Vy
IGhhcmQgY29kZWQgdG8gZmFsc2UgYW5kIGlzIHNldCB0bwo+ID4gdGhlIHZhbHVlIG9mIHRoZSBI
T1NUX0ZMVVRURVJfU0RLX0JJTl9TREtfVk1fUFJPRklMRSB2YXJpYWJsZS4KPiA+Cj4gPiBGaW5h
bGx5LCBhZGQgdGhlIGZvbGxvd2luZyBuZXcgdmFyaWFibGVzIHRvIEhPU1RfRkxVVFRFUl9TREtf
QklOX0RBUlRfQVJHUzoKPiA+ICAgLSBIT1NUX0ZMVVRURVJfU0RLX0JJTl9ERUJVR19GTEFHUwo+
ID4gICAtIEhPU1RfRkxVVFRFUl9TREtfQklOX1BST0ZJTEVfRkxBR1MKPiA+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBBZGFtIER1c2tldHQgPGFkYW0uZHVza2V0dEBhbWFydWxhc29sdXRpb25zLmNvbT4K
PiA+IC0tLQo+ID4gIHBhY2thZ2UvZmx1dHRlci1zZGstYmluL2ZsdXR0ZXItc2RrLWJpbi5tayB8
IDE5ICsrKysrKysrKysrKysrLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9u
cygrKSwgNSBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9mbHV0dGVy
LXNkay1iaW4vZmx1dHRlci1zZGstYmluLm1rIGIvcGFja2FnZS9mbHV0dGVyLXNkay1iaW4vZmx1
dHRlci1zZGstYmluLm1rCj4gPiBpbmRleCBhMjhjZjY0NWYzLi5lN2ZkMDljYjU2IDEwMDY0NAo+
ID4gLS0tIGEvcGFja2FnZS9mbHV0dGVyLXNkay1iaW4vZmx1dHRlci1zZGstYmluLm1rCj4gPiAr
KysgYi9wYWNrYWdlL2ZsdXR0ZXItc2RrLWJpbi9mbHV0dGVyLXNkay1iaW4ubWsKPiA+IEBAIC01
NSwxMyArNTUsMjAgQEAgZGVmaW5lIEhPU1RfRkxVVFRFUl9TREtfQklOX0lOU1RBTExfQ01EUwo+
ID4gIGVuZGVmCj4gPgo+ID4gIGlmZXEgKCQoQlIyX0VOQUJMRV9SVU5USU1FX0RFQlVHKSx5KQo+
ID4gLUhPU1RfRkxVVFRFUl9TREtfQklOX1NES19ST09UID0gXAo+ID4gLSAgICAgJChIT1NUX0ZM
VVRURVJfU0RLX0JJTl9TREtfRU5HSU5FKS9jb21tb24vZmx1dHRlcl9wYXRjaGVkX3Nkawo+ID4g
K0hPU1RfRkxVVFRFUl9TREtfQklOX0RFQlVHX0ZMQUdTID0gLS1lbmFibGUtYXNzZXJ0cwo+ID4g
IEhPU1RfRkxVVFRFUl9TREtfQklOX1NES19QUk9EVUNUID0gZmFsc2UKPiA+ICtIT1NUX0ZMVVRU
RVJfU0RLX0JJTl9TREtfUk9PVCA9ICQoSE9TVF9GTFVUVEVSX1NES19CSU5fU0RLX0VOR0lORSkv
Y29tbW9uL2ZsdXR0ZXJfcGF0Y2hlZF9zZGsKPiA+ICtlbHNlIGlmZXEgKCQoRkxVVFRFUl9FTkdJ
TkVfUlVOVElNRV9NT0RFX1BST0ZJTEUpLHkpCj4gPiArSE9TVF9GTFVUVEVSX1NES19CSU5fUFJP
RklMRV9GTEFHUyA9IC0tdHJhY2std2lkZ2V0LWNyZWF0aW9uCj4gPiArSE9TVF9GTFVUVEVSX1NE
S19CSU5fU0RLX1BST0RVQ1QgPSBmYWxzZQo+ID4gK0hPU1RfRkxVVFRFUl9TREtfQklOX1NES19S
T09UID0gJChIT1NUX0ZMVVRURVJfU0RLX0JJTl9TREtfRU5HSU5FKS9jb21tb24vZmx1dHRlcl9w
YXRjaGVkX3Nkawo+ID4gK0hPU1RfRkxVVFRFUl9TREtfQklOX1NES19WTV9QUk9GSUxFID0gdHJ1
ZQo+ID4gIGVsc2UKPiA+IC1IT1NUX0ZMVVRURVJfU0RLX0JJTl9TREtfUk9PVCA9IFwKPiA+IC0g
ICAgICQoSE9TVF9GTFVUVEVSX1NES19CSU5fU0RLX0VOR0lORSkvY29tbW9uL2ZsdXR0ZXJfcGF0
Y2hlZF9zZGtfcHJvZHVjdAo+ID4gK0hPU1RfRkxVVFRFUl9TREtfQklOX0RFQlVHX0ZMQUdTID0K
PiA+ICtIT1NUX0ZMVVRURVJfU0RLX0JJTl9QUk9GSUxFX0ZMQUdTID0KPiA+ICBIT1NUX0ZMVVRU
RVJfU0RLX0JJTl9TREtfUFJPRFVDVCA9IHRydWUKPiA+ICtIT1NUX0ZMVVRURVJfU0RLX0JJTl9T
REtfUk9PVCA9ICQoSE9TVF9GTFVUVEVSX1NES19CSU5fU0RLX0VOR0lORSkvY29tbW9uL2ZsdXR0
ZXJfcGF0Y2hlZF9zZGtfcHJvZHVjdAo+ID4gK0hPU1RfRkxVVFRFUl9TREtfQklOX1NES19WTV9Q
Uk9GSUxFID0gZmFsc2UKPiA+ICBlbmRpZgo+Cj4gVGhpcyBpZi1lbGlmLWVsc2UgYmxvY2sgaXMg
bm90IGluIHRoZSBzYW1lIG9yZGVyIGFzIHRoZSBvbmUgdG8gZW5hYmxlCj4gcHJvZmlsaW5nIGlu
IGZsdXR0ZXItZW5naW5lLiBIZXJlIHlvdSBoYXZlOiBkZWJ1ZywgcHJvZmlsaW5nLCByZWxlYXNl
LAo+IHdoaWxlIGluIGZsdXR0ZXItZW5naW5lIHRoZSBvcmRlciBpczogcHJvZmlsaW5nLCBkZWJ1
ZywgcmVsZWFzZS4KPgo+IFNob3VsZG4ndCB0aGUgdHdvIG1hdGNoLCBpLmUuIHNob3VsZCB3ZSBz
d2FwIHRoZSBkZWJ1ZyBhbmQgcHJvZmlsaW5nCj4gYmxvY2tzIGhlcmU/Cj4KPiBJZiBzbywgSSBj
YW4gZG8gc28gd2hlbiBhcHBseWluZy4KPgo+IChBbHNvLCB0aGUgY29tbWl0IGxvZyBpcyBkZXNj
cmlwdGl2ZSwgbm90IGV4cGxhbmF0b3J5LCBidXQgSSBjYW4gdHJpbW1lZAo+IGl0IHRvIHRoZSBu
ZWVkZWQgaW5mbyB3aGVuIGFwcGx5aW5nLCB0b28pLgo+Ck5vIHdvcnJpZXMgaWYgeW91IHJlLWFy
cmFuZ2UgdGhlIGlmLWVsaWYtZWxzZSBibG9jayB0byBtYXRjaCB3aGF0IGlzCmluIGZsdXR0ZXIt
ZW5naW5lLiBUaGUgb3V0Y29tZSBpcyB0aGUgc2FtZS4KUmVnYXJkcywKQWRhbQoKPiBSZWdhcmRz
LAo+IFlhbm4gRS4gTU9SSU4uCj4KPiA+ICAjIFRoZSBPcmRlciBtYXR0ZXJzLlRha2VuIGZyb206
Cj4gPiBAQCAtNzMsOCArODAsMTAgQEAgSE9TVF9GTFVUVEVSX1NES19CSU5fREFSVF9BUkdTID0g
XAo+ID4gICAgICAgLS1zZGstcm9vdCAkKEhPU1RfRkxVVFRFUl9TREtfQklOX1NES19ST09UKSBc
Cj4gPiAgICAgICAtLXRhcmdldD1mbHV0dGVyIFwKPiA+ICAgICAgIC0tbm8tcHJpbnQtaW5jcmVt
ZW50YWwtZGVwZW5kZW5jaWVzIFwKPiA+IC0gICAgIC1EZGFydC52bS5wcm9maWxlPWZhbHNlIFwK
PiA+ICsgICAgIC1EZGFydC52bS5wcm9maWxlPSQoSE9TVF9GTFVUVEVSX1NES19CSU5fU0RLX1ZN
X1BST0ZJTEUpIFwKPiA+ICAgICAgIC1EZGFydC52bS5wcm9kdWN0PSQoSE9TVF9GTFVUVEVSX1NE
S19CSU5fU0RLX1BST0RVQ1QpIFwKPiA+ICsgICAgICQoSE9TVF9GTFVUVEVSX1NES19CSU5fREVC
VUdfRkxBR1MpIFwKPiA+ICsgICAgICQoSE9TVF9GTFVUVEVSX1NES19CSU5fUFJPRklMRV9GTEFH
UykgXAo+ID4gICAgICAgLS1hb3QgXAo+ID4gICAgICAgLS10ZmEgXAo+ID4gICAgICAgLS10YXJn
ZXQtb3MgbGludXggXAo+ID4gLS0KPiA+IDIuNDMuMAo+ID4KPiA+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0
Cj4gPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+ID4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4KPiAtLQo+IC4tLS0tLS0tLS0tLS0tLS0t
LS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0t
LS0tLS0uCj4gfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVND
SUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKPiB8ICszMyA2NjIgMzc2IDA1NiB8IFNv
ZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAg
fAo+IHwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1Qg
ICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8Cj4gfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5v
cmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKPiAn
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0t
Xi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
