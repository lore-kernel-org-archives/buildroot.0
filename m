Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8C6CF07C9
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 08:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 285068169B;
	Thu, 10 Oct 2024 08:43:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o1-noza044Ma; Thu, 10 Oct 2024 08:43:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 097018164B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 097018164B;
	Thu, 10 Oct 2024 08:43:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 176DC1BF3CD
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 08:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0659181678
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 08:43:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z3jDSE4x6N02 for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 08:43:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b2b; helo=mail-yb1-xb2b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D215B815CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D215B815CF
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D215B815CF
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 08:43:55 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-e290200a560so555335276.1
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 01:43:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728549834; x=1729154634;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=onltkJakmvE0/8wPX++2nOIONbqzqy+qM4TsYfm1+FA=;
 b=PDr04L8NEVJq1Ls0rWuVcDpUfQszV94B4i5o4ER7Kwv6lMEinLvI3HWdxKBtJQbbsK
 C5XXOqgAWYsY/p9qnAWPaBCrRs5EOtqpoxQpHGxTv7Pfc160QYznUm5xNvMKOLscZRKr
 zk83KiSquzt7ePaZVAB3JP8jsVD0+GQsvNz3HA0dODnyI2uJkzwGCW5JplQsojIG+cqk
 0V3GsewQH1u0Q2J3XNFNcZdH7XEBHIfM/hjlhZ/CfiZBk4l/AjRnl+y08jxAsoYVrozk
 meXOeBC+uFLRgp+amxH3Xpk+05k9JjbR2Ea/TNY/Mjg4m4bPnPdcfjNLXjrNZQI/I2ua
 vlFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8ObHHYLFIdRNdWIGuCau8WZmzDR2oVkAS28Wg9gzr1ACLUvOQ+0mfXNTi9CCLS8znL3D/BXSY1tU=@buildroot.org
X-Gm-Message-State: AOJu0YxGSQb7WKyweJSoIbjhzo8qn2Xcx1hXXv6slG8U+VjQ95v8KfG7
 XcbUrl33dYQ1MJfyH3vce+Al8O4eYda8ModTqk0xyqVUx9fDjI5f1PQdSYOIU1yJceEvQs8WdHF
 /3vlLkeg4LbSKsK9eYOmsvDUWC2ybwtpDhKP1/g==
X-Google-Smtp-Source: AGHT+IGGl8BHiUPbz1/RA5xwBcOqESVTMih+p/O8BjMNmim2pSObDshFYzuIC8Wd7mSU0mkAJojmYvm5GTx6PObycJw=
X-Received: by 2002:a05:6902:2b0a:b0:e28:a9d4:8328 with SMTP id
 3f1490d57ef6-e28fe47e8e3mr5289421276.35.1728549834517; Thu, 10 Oct 2024
 01:43:54 -0700 (PDT)
MIME-Version: 1.0
References: <20241009062631.895124-1-dario.binacchi@amarulasolutions.com>
 <20241009150040.mxnktvztmjzwasyw@bryanbrattlof.com>
 <CABGWkvqAVxoYRPm3=LJsM6QhGF_BOFP=FXiKYtuF4R-RgEyavg@mail.gmail.com>
 <20241009190945.r6ye6anm2cxj7jsv@bryanbrattlof.com>
In-Reply-To: <20241009190945.r6ye6anm2cxj7jsv@bryanbrattlof.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 10 Oct 2024 10:43:43 +0200
Message-ID: <CABGWkvo88Ce6GxPb5ZsFi5ZEwGaCLuURCO=MurCb0MKoDesQ1Q@mail.gmail.com>
To: Bryan Brattlof <bb@ti.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1728549834; x=1729154634;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=onltkJakmvE0/8wPX++2nOIONbqzqy+qM4TsYfm1+FA=;
 b=rkNAQ8W9ss6eF1eu2qnflvMD0iQl98i5LmTMSHw3GOnBigp+XjSE69kk960eZZbXeW
 UbvR9bG8DdtnAOmPbVyHTB5uo5Ma/cY1qy4WXu6LuULD93uFaBnLeqovxcAREcYwsVhf
 TnKY5hrofmW518NDPAcDEkyX8HKjCnAQFyzq4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=rkNAQ8W9
Subject: Re: [Buildroot] [PATCH 1/1] configs/ti_am62x_sk: bump Linux to
 6.10.13 and U-Boot to 2024.10
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
 linux-amarula@amarulasolutions.com, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQnJ5YW4KCk9uIFdlZCwgT2N0IDksIDIwMjQgYXQgOTowOeKAr1BNIEJyeWFuIEJyYXR0bG9m
IDxiYkB0aS5jb20+IHdyb3RlOgo+Cj4gT24gT2N0b2JlciAgOSwgMjAyNCB0aHVzIHNheWV0aCBE
YXJpbyBCaW5hY2NoaToKPiA+IEhpIEJyeWFuLAo+ID4KPiA+IE9uIFdlZCwgT2N0IDksIDIwMjQg
YXQgNTowMOKAr1BNIEJyeWFuIEJyYXR0bG9mIDxiYkB0aS5jb20+IHdyb3RlOgo+ID4gPgo+ID4g
PiBIaSBEYXJpbyEKPiA+ID4KPiA+ID4gT24gT2N0b2JlciAgOSwgMjAyNCB0aHVzIHNheWV0aCBE
YXJpbyBCaW5hY2NoaToKPiA+ID4gPiBUaGUgcGF0Y2ggYnVtcHMgdGhlIExpbnV4IGtlcm5lbCB0
byB2ZXJzaW9uIDYuMTAuMTMgYW5kIFUtQm9vdCB0bwo+ID4gPiA+IHZlcnNpb24gMjAyNC4xMC4g
QXJtIHRydXN0ZWQgZmlybXdhcmUgaXMgYWxyZWFkeSB1cCB0byBkYXRlLgo+ID4gPiA+Cj4gPiA+
ID4gU2lnbmVkLW9mZi1ieTogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFz
b2x1dGlvbnMuY29tPgo+ID4gPiA+IC0tLQo+ID4gPiA+ICBib2FyZC90aS9hbTYyeC1zay9wYXRj
aGVzL2xpbnV4L2xpbnV4Lmhhc2ggfCAyICstCj4gPiA+ID4gIGJvYXJkL3RpL2FtNjJ4LXNrL3Bh
dGNoZXMvdWJvb3QvdWJvb3QuaGFzaCB8IDIgKy0KPiA+ID4gPiAgY29uZmlncy90aV9hbTYyeF9z
a19kZWZjb25maWcgICAgICAgICAgICAgIHwgNiArKystLS0KPiA+ID4gPiAgMyBmaWxlcyBjaGFu
Z2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gPiA+ID4KPiA+ID4gPiBkaWZm
IC0tZ2l0IGEvYm9hcmQvdGkvYW02Mngtc2svcGF0Y2hlcy9saW51eC9saW51eC5oYXNoIGIvYm9h
cmQvdGkvYW02Mngtc2svcGF0Y2hlcy9saW51eC9saW51eC5oYXNoCj4gPiA+ID4gaW5kZXggNTNl
YjE0Mzg5NDViLi43MDZkZGI4ZGJiZDQgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvYm9hcmQvdGkvYW02
Mngtc2svcGF0Y2hlcy9saW51eC9saW51eC5oYXNoCj4gPiA+ID4gKysrIGIvYm9hcmQvdGkvYW02
Mngtc2svcGF0Y2hlcy9saW51eC9saW51eC5oYXNoCj4gPiA+ID4gQEAgLTEsMiArMSwyIEBACj4g
PiA+ID4gICMgTG9jYWxseSBjYWxjdWxhdGVkCj4gPiA+ID4gLXNoYTI1NiAgNzc0Njk4NDIyZWU1
NGM1ZjFlNzA0NDU2ZjM3YzY1YzA2YjUxYjRlOWE4YjA4NjZmMzQ1ODBkODZmZWY4ZTIyNiAgbGlu
dXgtNi4xMC50YXIueHoKPiA+ID4gPiArc2hhMjU2ICA1ZmZjZWIyMzUwZGIxNTQ3ZTY5MjMxYTYz
ZGYyZDNiZWVkMDE1YTMxM2Q3ZDdhZGY4YjVjYjcxZGVkYWViMTZhICBsaW51eC02LjEwLjEzLnRh
ci54ego+ID4gPiA+IGRpZmYgLS1naXQgYS9ib2FyZC90aS9hbTYyeC1zay9wYXRjaGVzL3Vib290
L3Vib290Lmhhc2ggYi9ib2FyZC90aS9hbTYyeC1zay9wYXRjaGVzL3Vib290L3Vib290Lmhhc2gK
PiA+ID4gPiBpbmRleCBmZTliNGY1M2RjNjMuLjkwNGZhNTZjMDJhMyAxMDA2NDQKPiA+ID4gPiAt
LS0gYS9ib2FyZC90aS9hbTYyeC1zay9wYXRjaGVzL3Vib290L3Vib290Lmhhc2gKPiA+ID4gPiAr
KysgYi9ib2FyZC90aS9hbTYyeC1zay9wYXRjaGVzL3Vib290L3Vib290Lmhhc2gKPiA+ID4gPiBA
QCAtMSwyICsxLDIgQEAKPiA+ID4gPiAgIyBMb2NhbGx5IGNhbGN1bGF0ZWQKPiA+ID4gPiAtc2hh
MjU2ICBmNTkxZGE5YWI5MGVmM2Q2YjNkMTczNzY2ZDBkZGZmOTBjNGVkNzMzMDY4MDg5NzQ4NjEx
N2RmMzkwZDgzYzhmICB1LWJvb3QtMjAyNC4wNy50YXIuYnoyCj4gPiA+ID4gK3NoYTI1NiAgYjI4
ZGFmNGFjMTdlNDMxNTYzNjMwNzhiZjUxMDI5NzU4NDEzN2Y2ZGY1MGZjZWQ5YjEyZGYzNGY2MWE5
MmZiMCAgdS1ib290LTIwMjQuMTAudGFyLmJ6Mgo+ID4gPiA+IGRpZmYgLS1naXQgYS9jb25maWdz
L3RpX2FtNjJ4X3NrX2RlZmNvbmZpZyBiL2NvbmZpZ3MvdGlfYW02Mnhfc2tfZGVmY29uZmlnCj4g
PiA+ID4gaW5kZXggZTExYjgwM2I3M2U0Li42ZDA3MWI0Y2MxNDggMTAwNjQ0Cj4gPiA+ID4gLS0t
IGEvY29uZmlncy90aV9hbTYyeF9za19kZWZjb25maWcKPiA+ID4gPiArKysgYi9jb25maWdzL3Rp
X2FtNjJ4X3NrX2RlZmNvbmZpZwo+ID4gPiA+IEBAIC04LDcgKzgsNyBAQCBCUjJfUk9PVEZTX1BP
U1RfQlVJTERfU0NSSVBUX0FSR1M9Ii1jIHR0eVMyLDExNTIwMG44IC1kIGszLWFtNjI1LXNrLmR0
YiAtbCBhbTYyeAo+ID4gPiA+ICBCUjJfUk9PVEZTX1BPU1RfSU1BR0VfU0NSSVBUX0FSR1M9Ii1j
IGJvYXJkL3RpL2FtNjJ4LXNrL2dlbmltYWdlLmNmZyIKPiA+ID4gPiAgQlIyX0xJTlVYX0tFUk5F
TD15Cj4gPiA+ID4gIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT049eQo+ID4gPiA+IC1C
UjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI2LjEwIgo+ID4gPiA+ICtCUjJf
TElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI2LjEwLjEzIgo+ID4gPgo+ID4gPiBJ
J3ZlIG5vdGljZWQgeW91J3ZlIGJlZW4gcGlja2luZyBzdGFibGUgdGFncyBhbmQgd2FzIGN1cmlv
dXMgaWYgeW91Cj4gPiA+IHByZWZlciB0byBzdGF5IG9uIHN0YWJsZSB0YWdzPwo+ID4KPiA+IEFz
IGZhciBhcyBJIGtub3csIGl0IGlzIGdvb2QgcHJhY3RpY2UuCj4gPgo+Cj4gQWxsIGdvb2QuIEl0
J3MganVzdCBwcmVmZXJlbmNlLiBJIHRyeSB0byBydW4gdGhlIGxhdGVzdCBrZXJuZWwgdG8gdHJ5
IG91dAo+IGFsbCB0aGUgbGF0ZXN0IGZlYXR1cmVzIGFuZCBmaXhlcyBiZWZvcmUgdGhleSBuZWVk
IHRvIGJlIGJhY2stcG9ydGVkIGFueXdoZXJlCj4KPiA+Cj4gPiA+IEkgaGF2ZSBwbGFucyB0byBt
b3ZlIGV2ZXJ5dGhpbmcgdG8gdjYuMTEKPiA+ID4gYnV0IEkgY291bGQgY2hvb3NlIHRoZSBzdGFi
bGUgdmVyc2lvbiAodjYuMTEuMikgaWYgdGhhdCBoZWxwcyB5b3UuCj4gPgo+ID4gPgo+ID4gPiA+
ICBCUjJfTElOVVhfS0VSTkVMX1VTRV9BUkNIX0RFRkFVTFRfQ09ORklHPXkKPiA+ID4gPiAgQlIy
X0xJTlVYX0tFUk5FTF9EVFNfU1VQUE9SVD15Cj4gPiA+ID4gIEJSMl9MSU5VWF9LRVJORUxfSU5U
UkVFX0RUU19OQU1FPSJ0aS9rMy1hbTYyNS1zayIKPiA+ID4gPiBAQCAtMjcsMTIgKzI3LDEyIEBA
IEJSMl9UQVJHRVRfT1BURUVfT1M9eQo+ID4gPiA+ICBCUjJfVEFSR0VUX09QVEVFX09TX1BMQVRG
T1JNPSJrMy1hbTYyeCIKPiA+ID4gPiAgQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVI9eQo+ID4g
PiA+ICBCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUl9DVVNUT01fVkVSU0lPTj15Cj4gPiA+ID4g
LUJSMl9UQVJHRVRfVElfSzNfUjVfTE9BREVSX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSIyMDI0LjA3
Igo+ID4gPiA+ICtCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUl9DVVNUT01fVkVSU0lPTl9WQUxV
RT0iMjAyNC4xMCIKPiA+ID4gPiAgQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfQk9BUkRfREVG
Q09ORklHPSJhbTYyeF9ldm1fcjUiCj4gPiA+ID4gIEJSMl9UQVJHRVRfVUJPT1Q9eQo+ID4gPiA+
ICBCUjJfVEFSR0VUX1VCT09UX0JVSUxEX1NZU1RFTV9LQ09ORklHPXkKPiA+ID4gPiAgQlIyX1RB
UkdFVF9VQk9PVF9DVVNUT01fVkVSU0lPTj15Cj4gPiA+ID4gLUJSMl9UQVJHRVRfVUJPT1RfQ1VT
VE9NX1ZFUlNJT05fVkFMVUU9IjIwMjQuMDciCj4gPiA+ID4gK0JSMl9UQVJHRVRfVUJPT1RfQ1VT
VE9NX1ZFUlNJT05fVkFMVUU9IjIwMjQuMTAiCj4gPiA+Cj4gPiA+IE9uZSBvZiB0aGUgbW9yZSBp
bnRlcmVzdGluZyB0aGluZ3Mgd2UndmUgYmVlbiB3b3JraW5nIG9uIGxhdGVseSBpcyBFRkkKPiA+
ID4gQ2Fwc3VsZSBzdXBwb3J0IHdoaWNoIGRlcGVuZHMgb24gR251VExTLiBXZSdsbCBuZWVkIHRv
IGNoZWNrCj4gPiA+IEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNfR05VVExTIHdoZW4gbW92aW5nIHRv
IHRoaXMgdmVyc2lvbi4gOikKPiA+Cj4gPiBEbyBJIGhhdmUgdG8gZW5hYmxlIHRoaXMgb3B0aW9u
PyBXaGVuIEkgdGVzdGVkLCBJIGRpZG4ndCBub3RpY2UgYW55dGhpbmcgdW51c3VhbAo+ID4gT3Ig
aXMgdGhlcmUgc29tZXRoaW5nIEknbSBtaXNzaW5nPwo+ID4KPgo+IEl0J3Mgb24gbXkgdG9kbyBs
aXN0IHRvIHN0YXJ0IGJyZWFraW5nIHVwIHRoZSBVLUJvb3QgZGVmY29uZmlnIGludG8KPiB2YXJp
b3VzIGZlYXR1cmUgZnJhZ21lbnRzIHRvIHN1aXQgYSBudW1iZXIgb2YgdXNlY2FzZXMgb3VyIFNL
IGJvYXJkcwo+IGhhdmUuIFNhZGx5IHRoaXMgb25lWzBdIGlzIG1hbmRhdG9yeSBpZiB3ZSBtb3Zl
IHRvIHRoZSB2MjAyNC4xMCB0YWcgb3IKPiB0aGUgYnVpbGQgd2lsbCBjb21wbGFpbiBhYm91dCBt
aXNzaW5nIGxpYnJhcmllcy4KPgo+ICAgICB0b29scy9ta2VmaWNhcHN1bGUuYzoyMToxMDogZmF0
YWwgZXJyb3I6IGdudXRscy9nbnV0bHMuaDogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQo+ICAg
ICAgICAyMSB8ICNpbmNsdWRlIDxnbnV0bHMvZ251dGxzLmg+Cj4gICAgICAgICAgIHwgICAgICAg
ICAgXn5+fn5+fn5+fn5+fn5+fn4KPiAgICAgY29tcGlsYXRpb24gdGVybWluYXRlZC4KPiAgICAg
bWFrZVszXTogKioqIFtzY3JpcHRzL01ha2VmaWxlLmhvc3Q6OTU6IHRvb2xzL21rZWZpY2Fwc3Vs
ZV0gRXJyb3IgMQo+ICAgICBtYWtlWzNdOiAqKiogV2FpdGluZyBmb3IgdW5maW5pc2hlZCBqb2Jz
Li4uLgo+ICAgICBtYWtlWzJdOiAqKiogW01ha2VmaWxlOjE4OTU6IHRvb2xzXSBFcnJvciAyCj4g
ICAgIG1ha2VbMV06ICoqKiBbcGFja2FnZS9wa2ctZ2VuZXJpYy5tazoyODk6IC9ob21lL21lL3Ny
Yy9idWlsZHJvb3Qvb3V0cHV0L2J1aWxkL3Vib290LTIwMjQuMTAvLnN0YW1wX2J1aWx0XSBFcnJv
ciAyCj4gICAgIG1ha2U6ICoqKiBbTWFrZWZpbGU6ODM6IF9hbGxdIEVycm9yIDIKCkkgZGlkbid0
IGdldCB0aGUgZXJyb3IgYmVjYXVzZSBteSBsYXB0b3AgL3Vzci9pbmNsdWRlL2dudXRscy9nbnV0
bHMuaAppcyBpbnN0YWxsZWQuIEJ1dCBhZnRlciB0ZW1wb3JhcmlseSByZW5hbWluZyBpdCBmb3IK
dGVzdGluZyB0aGUgcGF0Y2ggSSBnb3QgdGhlIGNvbXBpbGluZyBlcnJvci4gU28gdGhhbmsgeW91
IGZvciB0aGUgaW5mby4KRG8gSSBuZWVkIGluIHZlcnNpb24gMiBtb3ZlIHRoZSBMaW51eCBidW1w
IHRvIHY2LjExIHRvbywgb3Igb25seQplbmFibGUgQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19HTlVU
TFMKZm9yIFUtQm9vdD8KClRoYW5rcyBhbmQgcmVnYXJkcywKRGFyaW8KCj4KPiBbMF0gaHR0cHM6
Ly9zb3VyY2UuZGVueC5kZS91LWJvb3QvdS1ib290Ly0vY29tbWl0LzAwNDBmMDdlNWE1NjNmNjRm
NjA5MTVhNmNlZmRmN2IxYmU3YmZlZTgKPgo+ID4gVGhhbmtzIGFuZCByZWdhcmRzLAo+ID4gRGFy
aW8KPiA+Cj4gPiA+Cj4gPiA+IH5Ccnlhbgo+ID4KPiA+Cj4gPgo+ID4gLS0KPiA+Cj4gPiBEYXJp
byBCaW5hY2NoaQo+ID4KPiA+IFNlbmlvciBFbWJlZGRlZCBMaW51eCBEZXZlbG9wZXIKPiA+Cj4g
PiBkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbQo+ID4KPiA+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiA+Cj4gPgo+ID4gQW1hcnVsYSBTb2x1dGlvbnMgU1JM
Cj4gPgo+ID4gVmlhIExlIENhbmV2YXJlIDMwLCAzMTEwMCBUcmV2aXNvLCBWZW5ldG8sIElUCj4g
Pgo+ID4gVC4gKzM5IDA0MiAyNDMgNTMxMAo+ID4gaW5mb0BhbWFydWxhc29sdXRpb25zLmNvbQo+
ID4KPiA+IHd3dy5hbWFydWxhc29sdXRpb25zLmNvbQo+ID4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiA+
IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCgoKLS0gCgpEYXJpbyBCaW5hY2NoaQoKU2VuaW9y
IEVtYmVkZGVkIExpbnV4IERldmVsb3BlcgoKZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9u
cy5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KCgpBbWFydWxhIFNvbHV0
aW9ucyBTUkwKClZpYSBMZSBDYW5ldmFyZSAzMCwgMzExMDAgVHJldmlzbywgVmVuZXRvLCBJVAoK
VC4gKzM5IDA0MiAyNDMgNTMxMAppbmZvQGFtYXJ1bGFzb2x1dGlvbnMuY29tCgp3d3cuYW1hcnVs
YXNvbHV0aW9ucy5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
