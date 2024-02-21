Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF98FC48BC3
	for <buildroot@archiver.kernel.org>; Wed, 21 Feb 2024 10:20:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48A8381A12;
	Wed, 21 Feb 2024 10:20:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VHS59QJMbdl5; Wed, 21 Feb 2024 10:20:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31E4581A5C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31E4581A5C;
	Wed, 21 Feb 2024 10:20:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 48F8D1BF82F
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 10:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35D37606D0
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 10:20:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8hdQaoBBHbhZ for <buildroot@lists.busybox.net>;
 Wed, 21 Feb 2024 10:20:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F1060606C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1060606C7
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F1060606C7
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 10:20:02 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-dcbef31a9dbso4221883276.1
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 02:20:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708510802; x=1709115602;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OzzZigwpm4+iSCTwSEzeP4HoRZCZatoZ/WY3SR7o+CM=;
 b=b11Kux7nV8Duk1q4CA595r69M6vI9ILvTO2CFsLaa+Op3RQR1r2UCDga7ylDrqct4W
 pcs8SedMridyno++mG9wp/3XQu2hDg3qOyKFEPyHkoLJmtvzW3lo+ovSRWS490GSfL24
 YFzaPFpuYLV8HmN9MgPQ0uFXYeCx96wu51Zwq1rl1mlj1ll2C09tulsT4IFzL3lZzUOM
 EPZ5rJ5TDHTgjxnq7Zn0vUqa/OFFEcMKsIUg1Kg2AIY6sYAuCCO6xlyu8AC5zyxy8SDS
 mqCHq1M3tif+Z/Y1pjLiWwiMZRcpTO04fr9X5ft9vn+XuDAy0oenDSNqRTjipCGiJeu4
 8A4A==
X-Gm-Message-State: AOJu0Yzn+xn4U6TGwx2LLAnUC6TVL/EQS3KgNk+i65vMsQCYBcTI5U7F
 WrOv6w1xguDjBY6a3I6ljmLED9Wal/gN3f9eyftESgY6djrzhskhhaFMNjIyCahqIZUZz9NING2
 EQ8UvGrCFQ7Oa/acGQ/eXYTg9vt+cPYgnr8mrwA==
X-Google-Smtp-Source: AGHT+IFKGjYk3h3zRNnjZdDlBe0qXYBdsD/DD+C3jym7aHFp1SOO7WOhHCFqqQreTTtG7UFhd25YXRTc7wlMCcQT+KE=
X-Received: by 2002:a25:b9cf:0:b0:dc6:c2b2:c039 with SMTP id
 y15-20020a25b9cf000000b00dc6c2b2c039mr15194101ybj.41.1708510800834; Wed, 21
 Feb 2024 02:20:00 -0800 (PST)
MIME-Version: 1.0
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
 <20240217160244.1320482-14-dario.binacchi@amarulasolutions.com>
 <af65f8aa-c746-4933-859b-1724d8653e91@smile.fr>
In-Reply-To: <af65f8aa-c746-4933-859b-1724d8653e91@smile.fr>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 21 Feb 2024 11:19:50 +0100
Message-ID: <CABGWkvrGiZhCq3WVOSFf=P1MxP8Vz7bAkHY8yYrx-89CGm5C5g@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708510802; x=1709115602;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OzzZigwpm4+iSCTwSEzeP4HoRZCZatoZ/WY3SR7o+CM=;
 b=UZb20RJTtUzGMHTBzIo2JJ32YLBBkLqJaXaJcY2Pral1uBNl/AE0NZJLbFqPLaS+4d
 rcGY6WaNmNxEOQsZnRmf8sxnO1ceaVR0MyvnC5TZCup40n6Kejv4ojZpuYxKUUw0EZa9
 xOJFiCot+XJdWIVCiIJtoOJ8LrSEk9yhH68KY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=UZb20RJT
Subject: Re: [Buildroot] [PATCH v4 13/20] boot/ti-k3-r5-loader: set binman
 environment
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
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUm9tYWluLAoKT24gTW9uLCBGZWIgMTksIDIwMjQgYXQgMTE6MTXigK9BTSBSb21haW4gTmFv
dXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4gd3JvdGU6Cj4KPiBIZWxsbyBEYXJpbywKPgo+IExl
IDE3LzAyLzIwMjQgw6AgMTc6MDIsIERhcmlvIEJpbmFjY2hpIGEgw6ljcml0IDoKPiA+IFJlY2Vu
dCB2ZXJzaW9uIG9mIFUtQm9vdCB1c2UgYmlubWFuIHRvIHByb3ZpZGUgYSBtZWNoYW5pc20gZm9y
IGJ1aWxkaW5nCj4gPiBpbWFnZXMsIGZyb20gc2ltcGxlIFNQTCArIFUtQm9vdCBjb21iaW5hdGlv
bnMsIHRvIG1vcmUgY29tcGxleAo+ID4gYXJyYW5nZW1lbnRzIHdpdGggbWFueSBwYXJ0cy4KPiA+
Cj4gPiBUaGUgcGF0Y2ggc2V0IHRoZSBCSU5NQU5fSU5ESVJTIGVudmlyb25tZW50IHZhcmlhYmxl
IHRvIHByb3ZpZGUgdGhlCj4gPiBkaXJlY3RvcnkgdG8gc2VhcmNoIGZvciBiaW5hcnkgYmxvYnMg
YW5kIHNlbGVjdCB0aGUgcGFja2FnZXMgcmVxdWlyZWQgYnkKPiA+IGJpbm1hbi4KPiA+Cj4gPiBD
by1kZXZlbG9wZWQtYnk6IE1pY2hhZWwgVHJpbWFyY2hpIDxtaWNoYWVsQGFtYXJ1bGFzb2x1dGlv
bnMuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBUcmltYXJjaGkgPG1pY2hhZWxAYW1h
cnVsYXNvbHV0aW9ucy5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFy
aW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gPgo+ID4gLS0tCj4gPgo+ID4gQ2hh
bmdlcyBpbiB2NDoKPiA+IC0gRHJvcCB0aGUgQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfVVNF
X0JJTk1BTiBvcHRpb24KPiA+Cj4gPiBDaGFuZ2VzIGluIHYyOgo+ID4gLSBDaGFuZ2UgY29tbWl0
IG1lc3NhZ2UKPiA+IC0gQWRkIEJSMl9UQVJHRVRfVElfSzNfUjVfTE9BREVSX1VTRV9CSU5NQU4g
b3B0aW9uCj4gPiAtIFNlbGVjdCBwYWNrYWdlcyByZXF1aXJlZCBieSBiaW5tYW4gaWYKPiA+ICAg
QlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfVVNFX0JJTk1BTiBpcyBlbmFibGVkCj4gPgo+ID4g
U2lnbmVkLW9mZi1ieTogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1
dGlvbnMuY29tPgo+ID4gLS0tCj4gPiAgYm9vdC90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9h
ZGVyLm1rIHwgMTMgKysrKysrKysrKysrLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2Jvb3QvdGktazMtcjUt
bG9hZGVyL3RpLWszLXI1LWxvYWRlci5tayBiL2Jvb3QvdGktazMtcjUtbG9hZGVyL3RpLWszLXI1
LWxvYWRlci5tawo+ID4gaW5kZXggMGZmY2I4MjM1ZjJlLi4yYTEwMDI0YWVkYWEgMTAwNjQ0Cj4g
PiAtLS0gYS9ib290L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIubWsKPiA+ICsrKyBi
L2Jvb3QvdGktazMtcjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5tawo+ID4gQEAgLTM5LDcgKzM5
LDEzIEBAIFRJX0szX1I1X0xPQURFUl9ERVBFTkRFTkNJRVMgPSBcCj4gPiAgICAgICBob3N0LXBr
Z2NvbmYgXAo+ID4gICAgICAgJChCUjJfTUFLRV9IT1NUX0RFUEVOREVOQ1kpIFwKPiA+ICAgICAg
IGhvc3QtYXJtLWdudS10b29sY2hhaW4gXAo+ID4gLSAgICAgaG9zdC1vcGVuc3NsCj4gPiArICAg
ICBob3N0LW9wZW5zc2wgXAo+ID4gKyAgICAgaG9zdC1weXRob24tYXR0cnMgXAo+ID4gKyAgICAg
aG9zdC1weXRob24tanNvbnNjaGVtYSBcCj4gPiArICAgICBob3N0LXB5dGhvbi1qc29uc2NoZW1h
LXNwZWNpZmljYXRpb25zIFwKPiA+ICsgICAgIGhvc3QtcHl0aG9uLXB5eWFtbCBcCj4gPiArICAg
ICBob3N0LXB5dGhvbi1yZWZlcmVuY2luZyBcCj4gPiArICAgICBob3N0LXB5dGhvbi1ycGRzLXB5
Cj4KPiBNb3N0IG9mIHRoZXNlcyBuZXcgZGVwZW5kZW5jaWVzIGFyZSBub3QgdGktazMtcjUtbG9h
ZGVyIGRlcGVuZGVuY2llcyBidXQKPiBob3N0LXB5dGhvbi1qc29uc2NoZW1hIHJ1bnRpbWUgZGVw
ZW5kZW5jaWVzLgoKSSByZW1vdmVkIHRoZSBydW50aW1lIGRlcGVuZGVuY2llcyBhbmQgdHJpZWQg
dG8gbW9kaWZ5IHRoZSBwYXRjaCBiYXNlZApvbiB5b3VyIGluZGljYXRpb25zIGFuZCB5b3VyIHBh
dGNoCihodHRwOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gv
MjAyNDAyMTMxNzI4MTcuMjg3Mjg0OS0xMS1yb21haW4ubmFvdXJAc21pbGUuZnIvKSwKYnV0IEkn
bSBlbmNvdW50ZXJpbmcgY29tcGlsYXRpb24gZXJyb3JzIHNwZWNpZmljYWxseSBvbiB0aGUgUHl0
aG9uCm1vZHVsZXMgdGhhdCB5b3UgaW5kaWNhdGVkIGFzIHJ1bnRpbWUKZGVwZW5kZW5jaWVzLiBJ
IHRyaWVkIHRvIGNvbXBpbGUgdGlfYW02Mnhfc2tfZGVmY29uZmlnIG9uIHlvdXIgc2VyaWVzCihp
LiBlLiAiQWRkIHRpX2o3MjFlX3NrX2RlZmNvbmZpZyIpLApidXQgaXQgc2VlbXMgbGlrZSB0aGUg
SFNGUyBvcHRpb24gaGFzIGRpc2FwcGVhcmVkLgpTbyBJIG5lZWQgdG8gYWRkIHRoZSBydW50aW1l
IGRlcGVuZGVuY2llcyBhcyB3ZWxsIHRvIGNvbXBpbGUgY29ycmVjdGx5LgoKVGhhbmtzIGFuZCBy
ZWdhcmRzLApEYXJpbwoKPgo+IE5vdGU6IGhvc3QtcHl0aG9uLWpzb25zY2hlbWEgZGVwZW5kcyBv
bgo+IEJSMl9QQUNLQUdFX0hPU1RfUlVTVENfVEFSR0VUX0FSQ0hfU1VQUE9SVFMgZHVlIHRvIGl0
cyBydW50aW1lIGRlcGVuZGVuY3kgb24KPiBob3N0LXB5dGhvbi1ycGRzLXB5Lgo+Cj4gPgo+ID4g
IFRJX0szX1I1X0xPQURFUl9NQUtFID0gJChCUjJfTUFLRSkKPiA+ICBUSV9LM19SNV9MT0FERVJf
TUFLRV9FTlYgPSAkKFRBUkdFVF9NQUtFX0VOVikKPiA+IEBAIC00OSw2ICs1NSwxMCBAQCBUSV9L
M19SNV9MT0FERVJfS0NPTkZJR19ERVBFTkRFTkNJRVMgPSBcCj4gPiAgICAgICAkKEJSMl9CSVNP
Tl9IT1NUX0RFUEVOREVOQ1kpIFwKPiA+ICAgICAgICQoQlIyX0ZMRVhfSE9TVF9ERVBFTkRFTkNZ
KQo+ID4KPiA+ICtpZmVxICgkKEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNfUFlMSUJGRFQpLHkpCj4K
PiBJdCdzIGEgdS1ib290IHBhY2thZ2UgY29uZmlnIG9wdGlvbi4ganVzdCBhZGQgaG9zdC1weXRo
b24tcHlsaWJmZHQgdGhlIGRlcGVuZGVuY3kuCj4KPiA+ICtUSV9LM19SNV9MT0FERVJfREVQRU5E
RU5DSUVTICs9IGhvc3QtcHl0aG9uLXB5bGliZmR0Cj4gPiArZW5kaWYKPiA+ICsKPiA+ICBpZmVx
ICgkKEJSMl9UQVJHRVRfVElfSzNfUjVfTE9BREVSX1VTRV9ERUZDT05GSUcpLHkpCj4gPiAgVElf
SzNfUjVfTE9BREVSX0tDT05GSUdfREVGQ09ORklHID0gJChjYWxsIHFzdHJpcCwkKEJSMl9UQVJH
RVRfVElfSzNfUjVfTE9BREVSX0JPQVJEX0RFRkNPTkZJRykpX2RlZmNvbmZpZwo+ID4gIGVsc2Ug
aWZlcSAoJChCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUl9VU0VfQ1VTVE9NX0NPTkZJRykseSkK
PiA+IEBAIC01OCw2ICs2OCw3IEBAIFRJX0szX1I1X0xPQURFUl9NQUtFX09QVFMgPSBcCj4gPiAg
ICAgICBDUk9TU19DT01QSUxFPSQoSE9TVF9ESVIpL2Jpbi9hcm0tbm9uZS1lYWJpLSBcCj4gPiAg
ICAgICBBUkNIPWFybSBcCj4gPiAgICAgICBIT1NUQ0M9IiQoSE9TVENDKSAkKHN1YnN0IC1JLywt
aXN5c3RlbSAvLCQoc3Vic3QgLUkgLywtaXN5c3RlbSAvLCQoSE9TVF9DRkxBR1MpKSkiIFwKPiA+
ICsgICAgIEJJTk1BTl9JTkRJUlM9JChCSU5BUklFU19ESVIpIFwKPgo+IEkgc3VnZ2VzdGVkIHRv
IGFkZCBCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUl9VU0VfQklOTUFOIGJ1dCBpbmRlZWQgd2Ug
c2hvdWxkCj4gdXNlIGJpbm1hbiB1bmNvbmRpdGlvbmFsbHkgZm9yIHRpLWszLXI1LWxvYWRlciBw
YWNrYWdlLgo+Cj4gaHR0cDovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290
L3BhdGNoLzIwMjQwMjEzMTcyODE3LjI4NzI4NDktMTEtcm9tYWluLm5hb3VyQHNtaWxlLmZyLwo+
Cj4gQmVzdCByZWdhcmRzLAo+IFJvbWFpbgo+Cj4KPiA+ICAgICAgIEhPU1RMREZMQUdTPSIkKEhP
U1RfTERGTEFHUykiCj4gPgo+ID4gIGRlZmluZSBUSV9LM19SNV9MT0FERVJfQlVJTERfQ01EUwo+
CgoKLS0gCgpEYXJpbyBCaW5hY2NoaQoKU2VuaW9yIEVtYmVkZGVkIExpbnV4IERldmVsb3BlcgoK
ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KCgpBbWFydWxhIFNvbHV0aW9ucyBTUkwKClZpYSBMZSBDYW5ldmFyZSAz
MCwgMzExMDAgVHJldmlzbywgVmVuZXRvLCBJVAoKVC4gKzM5IDA0MiAyNDMgNTMxMAppbmZvQGFt
YXJ1bGFzb2x1dGlvbnMuY29tCgp3d3cuYW1hcnVsYXNvbHV0aW9ucy5jb20KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
