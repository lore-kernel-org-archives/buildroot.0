Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1729FCD6E7C
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0F6260B58;
	Fri,  5 Jun 2026 12:49:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n5gVCbV8-DWh; Fri,  5 Jun 2026 12:49:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E094460B3C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663753;
	bh=jPteLTDTBlLmkn5g92+hbwBrBlu6TjJKJjER9KdAZyg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=D4mxFNVzW1mOjbL7wAiHhJP1o0zanYVDbc4xschmTPJ/N3q/1wUC/5KTk2seV9/+T
	 7++8TQZZVSGzj7qmaQj7on5JAdIDZY+NARFotjUW5B4RA2y51Uc3qa+ww4PkwXUvz9
	 MrMPiH6Y2N5SZ3xuD/zpEmMBLbi11vlNGOmKAJ4Wy3avp7sodSVVIAW3mHm93JYEI5
	 RviufKA4+mX1K0jRvwiyZkmWy9JHBOlZwjQWoAE/s/MSMNlrtwypGLuqQbQFrQTSmK
	 M8jJ42ucILPhuzOcPFeIBeipnfCS1lhYylzRtjM6KIT/PgNz4vDY1J6o/L/+sdCbli
	 rIBmCCWNph8sw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E094460B3C;
	Fri,  5 Jun 2026 12:49:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1457A3B7
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A95D82073
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id toWE-qmPZrSf for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:49:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0ED0781FF5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0ED0781FF5
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0ED0781FF5
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:49:07 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-490a765d410so19853155e9.1
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:49:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663746; x=1781268546;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qJGzZXu2vnb1INuxrkusHHDDjY2YyXh99VH78aiVpS0=;
 b=giNlWNLOptdc8cUUa6JMdYzP0g05nxLi26Q+P/e4hFgg5SOM2vDGUaNwtxI0g0qWij
 gN58FC+IteUdkS9u/VqNOY3ThZVjwXSSO9XFKKiyji44m0IXJ1DHkt15jLfK5rp8TEk0
 Rv5+bdeap4JTU3ulkAgGjFtT6ysdQJAD5qF1iBXsqf7abYPRiPbOQ/coI6ILR6w64kYB
 bQXpFkFoQvk9lpHssssn6TPOVn6WzL9kmPpk6DKba3PtDmX73pAY/ipx0RLyWcXzZNOv
 ICFn36337K5bFF2VmyASXVkpKIt/KLZJ3Yt56nke9YZ9PIvZsK5i3fcKfuvLX+hsD58w
 0EYg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/hSSvs5fYJr2BIkz4ZfgkH2fY3EqQd9cMXdAR01gH9noFG3zOhGtFfz7ww8962+AM/BsX9sm9YZQk=@buildroot.org
X-Gm-Message-State: AOJu0YzovPGrH0mr0xMAjPBPiFuWpY/BTboGJ31ZdI8YgIUtDcnM9gva
 MDZHFLiSRfaYLftbmj567/OpDkULwKMUrny+YeIcEp4Z4x2QvuDdPiw+5r6E9DyA9mG/zWukqeC
 oqWd8
X-Gm-Gg: Acq92OEwwvJa3wsotiWwCf4E0V8oT6Nusa107AFhmn3fyH5sHyOnlPUHPuGEsCDBzf3
 XJcQktcug9KbAIq2wWxHFlqCDQgeQB/HijBY0174ul5wOaPZBp0/0R9wPecUzK/rQfZnH7pkWa7
 /oZ+aGsiCaOhesGTUvh02MSLsjoBjqFo52WjBlezMpeE/BOf5NuImWiiFaOREB2pLaycdySJPBm
 W0X0pMBs0e1dx0JVelzVehomoILaGg0uQ6TTKEZotI4NSshsG3TJcIX6y2+d8KolLqfw2hwqBIr
 Y3DIxF/xXnFm4tnoJjLf09+I16D/0NQK6RzIoAse18ZT2tMVI7xlhZULS+KoSbKTMXnBiGYN9lM
 Yie7u2Gd6W7SXQw4Al/ZIAfOG9z25sOnWnSlQkXQqmipu2R+RTFGOaZWgz1at9hWCFwciqaxQFl
 oBw6Gwv2lI4AMEHrD9tCrPSscmqA==
X-Received: by 2002:a05:600c:358b:b0:490:b591:b5a1 with SMTP id
 5b1f17b1804b1-490c25da474mr59758665e9.32.1780663745978; 
 Fri, 05 Jun 2026 05:49:05 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc3e5a00sm154565215e9.15.2026.06.05.05.49.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:49:05 -0700 (PDT)
To: Arnout Vandecappelle <arnout@rnout.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:49:04 +0200
Message-ID: <20260605124905.270343-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602104105.729293-1-arnout@rnout.be>
References: <20260602104105.729293-1-arnout@rnout.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663746; x=1781268546; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qJGzZXu2vnb1INuxrkusHHDDjY2YyXh99VH78aiVpS0=;
 b=H2o8vsJyLf/mm539HmgefQLl13Mw6DaPV16vbmO/GA32f08l2KftGkwSUn/W2rgJrT
 Kf8RuSryovC1qRmdfGOcxEFnk4c6fuk/v4BS+tY9zTWfXyUdcAOvtr3X4rUuuFDoYkV4
 mA0uasqAVtFEjX12OEvTpuCiZeq/p3QqBoMiQtumhgOFeAIXqWnnE6eKzCH7Vc689xJE
 Rq9d8BNZMY92cQRbiRvrSviYiPNCUDKoM7XkbOIqdQjf+Szr4AwHQ+MqwCbzSmogsGkH
 Pptt8vY7v+RcvQIPuYzs3A1SgWEzAMyY1xT5zM4rNccuHg9q+Io9XO5BiRLdrnJDZZnQ
 k0nA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=H2o8vsJy
Subject: Re: [Buildroot] [PATCH 2025.02.x] package/systemd: fix host build
 with 7.0+ kernel
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVwbHkgb2Y6Cj4gTGludXggdjcuMCBpbnRyb2R1Y2VkIGEgZmV3IG1vcmUgZXJybm8gdmFs
dWVzIHRoYXQgYXJlIGFsaWFzZXMgb2Ygb3RoZXIKPiBlcnJub3MuIFRoaXMgY2F1c2VzIHRoZSBm
b2xsb3dpbmcgZXJyb3I6Cj4gCj4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC4uL3NyYy9iYXNpYy9l
cnJuby1saXN0LmM6MTM6Cj4gc3JjL2Jhc2ljL2Vycm5vLXRvLW5hbWUuaDo3MToyMzogZXJyb3I6
IGluaXRpYWxpemVkIGZpZWxkIG92ZXJ3cml0dGVuIFstV2Vycm9yPW92ZXJyaWRlLWluaXRdCj4g
ICAgNzEgfCAgICAgICAgIFtFRlNCQURDUkNdID0gIkVGU0JBRENSQyIsCj4gICAgICAgfCAgICAg
ICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn4KPiBzcmMvYmFzaWMvZXJybm8tdG8tbmFtZS5o
OjcxOjIzOiBub3RlOiAobmVhciBpbml0aWFsaXphdGlvbiBmb3Ig4oCYZXJybm9fbmFtZXNbNzRd
4oCZKQo+IHNyYy9iYXNpYy9lcnJuby10by1uYW1lLmg6MTE0OjI2OiBlcnJvcjogaW5pdGlhbGl6
ZWQgZmllbGQgb3ZlcndyaXR0ZW4gWy1XZXJyb3I9b3ZlcnJpZGUtaW5pdF0KPiAgIDExNCB8ICAg
ICAgICAgW0VGU0NPUlJVUFRFRF0gPSAiRUZTQ09SUlVQVEVEIiwKPiAgICAgICB8ICAgICAgICAg
ICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fgo+IHNyYy9iYXNpYy9lcnJuby10by1uYW1l
Lmg6MTE0OjI2OiBub3RlOiAobmVhciBpbml0aWFsaXphdGlvbiBmb3Ig4oCYZXJybm9fbmFtZXNb
MTE3XeKAmSkKPiBjYzE6IHNvbWUgd2FybmluZ3MgYmVpbmcgdHJlYXRlZCBhcyBlcnJvcnMKPiAK
PiBGb3IgdGFyZ2V0IHN5c3RlbWQgdGhpcyBpcyBub3QgYW4gaXNzdWUgYXMgd2UgZG9uJ3Qgc3Vw
cG9ydCB2Ny4wLAo+IGhvd2V2ZXIgaXQgYWxzbyBvY2N1cnMgZm9yIGhvc3Qtc3lzdGVtZCB3aGVu
IGJ1aWxkaW5nIG9uIGEgc3lzdGVtIHdpdGgKPiBrZXJuZWwgdjcuMCsuCj4gCj4gQmFja3BvcnQg
YW4gdXBzdHJlYW0gcGF0Y2ggdGhhdCBleGNsdWRlcyB0aGVzZSB0d28gZXJybm9zIGZyb20gdGhl
Cj4gZXJybm8tdG8tbmFtZSBhcnJheS4gVGhlIHVwc3RyZWFtIHBhdGNoIHdhcyBhcHBsaWVkIHRv
IHYyNjEgYW5kCj4gYmFja3BvcnRlZCB0byB2MjU4LjUsIGJ1dCBpdCB3YXMgbm90IGJhY2twb3J0
ZWQgdG8gdjI1Ni1zdGFibGUgKHdoaWNoIGlzCj4gRU9MKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBB
cm5vdXQgVmFuZGVjYXBwZWxsZSA8YXJub3V0QHJub3V0LmJlPgoKQXBwbGllZCB0byAyMDI1LjAy
LnguIFRoYW5rcwoKPiAtLS0KPiAgLi4uaWx0ZXItb3V0LUVGU0JBRENSQy1hbmQtRUZTQ09SUlVQ
VEVELnBhdGNoIHwgMzcgKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMzcg
aW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9zeXN0ZW1kLzAwMDIt
ZXJybm8tbGlzdC1maWx0ZXItb3V0LUVGU0JBRENSQy1hbmQtRUZTQ09SUlVQVEVELnBhdGNoCj4g
Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc3lzdGVtZC8wMDAyLWVycm5vLWxpc3QtZmlsdGVyLW91
dC1FRlNCQURDUkMtYW5kLUVGU0NPUlJVUFRFRC5wYXRjaCBiL3BhY2thZ2Uvc3lzdGVtZC8wMDAy
LWVycm5vLWxpc3QtZmlsdGVyLW91dC1FRlNCQURDUkMtYW5kLUVGU0NPUlJVUFRFRC5wYXRjaAo+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uMzhmZDBiYWY0NQo+IC0t
LSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL3N5c3RlbWQvMDAwMi1lcnJuby1saXN0LWZpbHRl
ci1vdXQtRUZTQkFEQ1JDLWFuZC1FRlNDT1JSVVBURUQucGF0Y2gKPiBAQCAtMCwwICsxLDM3IEBA
Cj4gK0Zyb20gYWQ2YTI5OTg1YjZkNzhhMzdhZjU2MTYzMzhlNTFiYWZjODY1M2M3MSBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKPiArRnJvbTogWXUgV2F0YW5hYmUgPHdhdGFuYWJlLnl1K2dpdGh1
YkBnbWFpbC5jb20+Cj4gK0RhdGU6IFR1ZSwgMjQgRmViIDIwMjYgMjA6MTk6NDUgKzA5MDAKPiAr
U3ViamVjdDogW1BBVENIXSBlcnJuby1saXN0OiBmaWx0ZXIgb3V0IEVGU0JBRENSQyBhbmQgRUZT
Q09SUlVQVEVECj4gKwo+ICtUaGVzZSBhcmUgaW50cm9kdWNlZCBpbiBrZXJuZWwgdjcuMC4KPiAr
Cj4gK1Vwc3RyZWFtOiBodHRwczovL2dpdGh1Yi5jb20vc3lzdGVtZC9zeXN0ZW1kL2NvbW1pdC8z
Y2ZiMTY5OTg4MDhhNmVjODAxMmE2MTIwZDBhODJmMGUxYTBjOGJiCj4gK1NpZ25lZC1vZmYtYnk6
IEFybm91dCBWYW5kZWNhcHBlbGxlIDxhcm5vdXRAcm5vdXQuYmU+Cj4gKy0tLQo+ICsgc3JjL2Jh
c2ljL2dlbmVyYXRlLWVycm5vLWxpc3Quc2ggfCAxMCArKysrKysrLS0tCj4gKyAxIGZpbGUgY2hh
bmdlZCwgNyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ICsKPiArZGlmZiAtLWdpdCBh
L3NyYy9iYXNpYy9nZW5lcmF0ZS1lcnJuby1saXN0LnNoIGIvc3JjL2Jhc2ljL2dlbmVyYXRlLWVy
cm5vLWxpc3Quc2gKPiAraW5kZXggZjc1NmIyZTAyMC4uNDkxZmExYjZlMyAxMDA3NTUKPiArLS0t
IGEvc3JjL2Jhc2ljL2dlbmVyYXRlLWVycm5vLWxpc3Quc2gKPiArKysrIGIvc3JjL2Jhc2ljL2dl
bmVyYXRlLWVycm5vLWxpc3Quc2gKPiArQEAgLTMsOSArMywxMyBAQAo+ICsgc2V0IC1ldQo+ICsg
c2V0IC1vIHBpcGVmYWlsCj4gKyAKPiArLSMgSW4ga2VybmVsJ3MgYXJjaC9wYXJpc2MvaW5jbHVk
ZS91YXBpL2FzbS9lcnJuby5oLCBFQ0FOQ0VMTEVEIGFuZCBFUkVGVVNFRCBhcmUgZGVmaW5lZCBh
cyBhbGlhc2VzIG9mCj4gKy0jIEVDQU5DRUxFRCBhbmQgRUNPTk5SRUZVU0VELCByZXNwZWN0aXZl
bHkuIExldCdzIGRyb3AgdGhlbS4KPiArKyMgSW4ga2VybmVsJ3MgYXJjaC9wYXJpc2MvaW5jbHVk
ZS91YXBpL2FzbS9lcnJuby5oLCBUaGUgZm9sbG93aW5nIGFsaWFzZXMgYXJlIGRlZmluZWQ6Cj4g
KysjIEVDQU5DRUxMRUQg4oaSIEVDQU5DRUxFRAo+ICsrIyBFUkVGVVNFRCDihpIgRUNPTk5SRUZV
U0VECj4gKysjIEVGU0JBRENSQyDihpIgRUJBRE1TRwo+ICsrIyBFRlNDT1JSVVBURUQg4oaSIEVV
Q0xFQU4KPiArKyMgTGV0J3MgZHJvcCB0aGVtLgo+ICsgCj4gKyAkezE6P30gLWRNIC1pbmNsdWRl
IGVycm5vLmggLSA8L2Rldi9udWxsIHwgXAo+ICstICAgICAgIGdyZXAgLUV2ICdeI2RlZmluZVtb
OnNwYWNlOl1dKyhFQ0FOQ0VMTEVEfEVSRUZVU0VEKScgfCBcCj4gKysgICAgICAgZ3JlcCAtRXYg
J14jZGVmaW5lW1s6c3BhY2U6XV0rKEVDQU5DRUxMRUR8RVJFRlVTRUR8RUZTQkFEQ1JDfEVGU0NP
UlJVUFRFRCknIHwgXAo+ICsgICAgICAgIGF3ayAnL14jZGVmaW5lWyBcdF0rRVteIF9dK1sgXHRd
Ky8geyBwcmludCAkMjsgfScKPiArLS0gCj4gKzIuNTQuMAo+ICsKPiAtLSAKPiAyLjU0LjAKPiAK
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
