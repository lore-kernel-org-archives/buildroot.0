Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C168C43458
	for <buildroot@archiver.kernel.org>; Thu,  9 Jul 2026 13:16:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAE9E410A7;
	Thu,  9 Jul 2026 13:16:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HXJPlDPUElcd; Thu,  9 Jul 2026 13:16:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49ACB41016
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783602962;
	bh=/fcgmnIKqSthGmnEpWAVR+gDqKPbhIqMiMnQ4S0Fcjo=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OTHOP006mUup/muzI7ZQAFB7F8FD8RpVtUTzoBIIIiQy9kRB2AF5dWdpHgoTVdbfF
	 9dSYR5OkQn9eHnOuJivUtZdJPKV7bw6kGbaLtJ6x0iuajkl1BWiCPWg2CTL87hpW99
	 0RdfLaWB6hD/1+rBbE3HNfQxs5IrjeimRNaK/ivia5Ds7LGOX61iwZStt+1lkRs76P
	 JFPPBqfx5omonhekqMCwjoGJ6aoGvVwpS9y97bkGQgz3jrkyVi3APfy3TFnrVdVIhP
	 GnmX11BVoNyfO1BsWlfPSrV1aBRCcz7JqAkyZTQNcpYJQ87RewXVfVQQ0l+lCanWVv
	 qmfY03IAntELQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49ACB41016;
	Thu,  9 Jul 2026 13:16:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E59D320
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 13:16:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64553400E9
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 13:16:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JmGk65vz_2EQ for <buildroot@buildroot.org>;
 Thu,  9 Jul 2026 13:16:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1135; helo=mail-yw1-x1135.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 648D9400BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 648D9400BC
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 648D9400BC
 for <buildroot@buildroot.org>; Thu,  9 Jul 2026 13:16:00 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-80bd5b5b3afso19092477b3.3
 for <buildroot@buildroot.org>; Thu, 09 Jul 2026 06:16:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783602959; cv=none;
 d=google.com; s=arc-20260327;
 b=f6HX/XMngYMLbzeaRhSvJ8tz/RicCEdB414bpFsG3Bvj20NFAhRKhfg8SIW1txfDGI
 08MwUQ77dX69DSsIQ2Q3pCM3+gDn9OKDpYMGan4DqdimTDauH4F7MyaNtQxdDzkf4EJr
 CQTaSlZANCJAcbhYa0LMbgo4D84EZOLujFVgDbxou9pBXFrtGh1eUAlNWCAZR+XA2N5d
 RNO8XtAqq8vEFzTA6nJdV6tupv008NsdrhZlKPiIfmpK8eEYqKdW4CXa3NHtlsAugap5
 JDoBQagz+g/On2yhYNjP7hM4cS9AGe4zG+RbJP6sYcW1I+9NhTPUtX5ljDBES9bksCPN
 tgtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=3qhmu2HZmjpEXWr1jlhcfhra9BJSBEJmkw7ruYuwTOo=;
 fh=6sviQuouh0OiqqP4vmOf1zq2y9SvS50+AE9uy0nzLmk=;
 b=eipN69ei7H0vjjyu063yxZEYwT0DrGErF1zat4AJsbXnfT33JvnNxBkGPQL485+OQv
 ug0l5WAK/RnkOVQeWrtzbUYmewYPQ37FHD1pr/IcXUPZnYjvfJNN5EqJNEDz7RUy8IJ5
 VcYfr7Ye/EWxF3I4Rp+3vezgWaaSXkY8dJRD9/peTHoamsMjuFFyckt2N7rm1lNkjBRW
 9fR0bKg94Saz8uo4WlxhxAnUoIxPJEFA47jx6lDYwVsQ/YDjAfHyvZOjzd0d+r0h51T1
 2S7RVt6s0C/GbpyfycnTqQPX71zjCOxL72uAvqPslgmAdTq4gjrSGlE1d9hAaO9z16lw
 TCcw==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783602959; x=1784207759;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=3qhmu2HZmjpEXWr1jlhcfhra9BJSBEJmkw7ruYuwTOo=;
 b=MgEjq9UQPGuJQRxO0oDB/KbW0UOdNTsXA63N+P3PPBKWn4DsGwOgLWDx6wuixahos/
 wNeYy/yjrYySZBsuQR6fYzD0JGlNv0SszgJKDGqeGIacgROWEvFEu92X39ndEpRK9cfX
 I/g4QtEu3+ES1xKquUEPMDN3WUo62fhZSjoB+DdIKZSFOJjLXymiNvU7UiSu5A8gE8YZ
 U2b7JSLDBN6M/N21FwGTkHXTuF0RrekAIz7AW6NGBhwwBMuScP4ZGq8V5M884DWsGtPm
 LwT4og791sWIpoPn+IuePwAZAFdtbIOWPRp+23Rkg46afAJlq45kQS1Xqqe5+a+xIx78
 nfcA==
X-Gm-Message-State: AOJu0YxDpNpWfFYTzSlii1nzD/3CkK3jwCR3r7cbFk/UA1VMMqvy6boH
 A0OF0529dTlUk+DPn/jtoxUbUwEyUg6I8Wadc5soHFzT5AWNDVAl/VfiTXPJcz9IexfUKWfks80
 Pq4HgWlkN41Ttmh/oitTCS+hGEtiYixjuI95HUBeuRd3ysZ+6OM71Lf/QJQ==
X-Gm-Gg: AfdE7cmvBdEzMf7xU4RZWi8ahvFgNrGbIXNC+yod9oW/irhL8hP7qLsVsRoE7S/97iO
 PRqXpsUvRTKnNT0oOb7IrEScGZyqLx13WBsiJ0PTMebVasBqLOcK+bfOa+n6CG8DpDPrmEJfncF
 DYJGTMQTxmFdngRuhK15YZVf6rw9vYNqlGd/jU1IXkHVqu0iFQwPuqxI6kDyFYLBF47KGsPbiLm
 kiDXaWIv3npfTz2i5tuv/DNLnxrVoG9FY61P8NNjnCIQXni8B5tlk/jvX76O93GoowSEtSPNE7I
 QhjD3SneVmMriaR7oVmJJXWY9B+4
X-Received: by 2002:a05:690e:4092:b0:667:ba32:4612 with SMTP id
 956f58d0204a3-667ba324c9cmr1418246d50.46.1783602958709; Thu, 09 Jul 2026
 06:15:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260707100837.3332387-1-dario.binacchi@amarulasolutions.com>
 <20260707100837.3332387-2-dario.binacchi@amarulasolutions.com>
 <75405e29-81ac-41e8-8f3b-5c6de3807a8e@gmx.de>
In-Reply-To: <75405e29-81ac-41e8-8f3b-5c6de3807a8e@gmx.de>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 9 Jul 2026 15:15:47 +0200
X-Gm-Features: AUfX_mzYVm9rzhM67Xrx_XLqaAEO33OxvYd0VlprnYx7d3f6xEBfJFs4-6wWLNo
Message-ID: <CABGWkvoB2KoQz60moVnCuqWxejjP+nBUeU1KUMJDUuWZveWPaw@mail.gmail.com>
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1783602959; x=1784207759;
 darn=buildroot.org; 
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=3qhmu2HZmjpEXWr1jlhcfhra9BJSBEJmkw7ruYuwTOo=;
 b=MT1YIXeVPDsnK5X31Sy33L5NQWpD0yx51+MYVDEOtCiKAIWGwHWcbw3lEflT4JlNEA
 VvBvxcHlhj/joPHLhVMI/DWnVBZIHXh+azwx6VobWbXm6XmMbFLOVOkfhTI4J5Kg/1v1
 kFhj7fT6vLj9j8sxEa8bLKKZoRWHWeTq75Kr4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=MT1YIXeV
Subject: Re: [Buildroot] [PATCH 2/3] package/gnutls: allow enabling
 host-p11-kit support
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRmlvbmEsCgpPbiBUaHUsIEp1bCA5LCAyMDI2IGF0IDEwOjQz4oCvQU0gRmlvbmEgS2x1dGUg
dmlhIGJ1aWxkcm9vdAo8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgo+Cj4gSGkgRGFy
aW8hCj4KPiBBbSAwNy4wNy4yNiB1bSAxMjowOCBzY2hyaWViIERhcmlvIEJpbmFjY2hpOgo+ID4g
QWRkIGEgbmV3IEJSMl9QQUNLQUdFX0hPU1RfR05VVExTX1AxMV9LSVQgb3B0aW9uIHRvIGVuYWJs
ZSB0aGUKPiA+IGhvc3QtcDExLWtpdCBkZXBlbmRlbmN5IHdoaWxlIHByZXNlcnZpbmcgYmFja3dh
cmQgY29tcGF0aWJpbGl0eSBieQo+ID4ga2VlcGluZyBwMTEta2l0IHN1cHBvcnQgZGlzYWJsZWQg
YnkgZGVmYXVsdC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8u
YmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gPiAtLS0KPiA+ICAgcGFja2FnZS9nbnV0
bHMvQ29uZmlnLmluIHwgMyArKysKPiA+ICAgcGFja2FnZS9nbnV0bHMvZ251dGxzLm1rIHwgNyAr
KysrKystCj4gPiAgIDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZ251dGxzL0NvbmZpZy5pbiBiL3BhY2th
Z2UvZ251dGxzL0NvbmZpZy5pbgo+ID4gaW5kZXggNTlhZjMyYmYxZWZiLi45M2YyMjg3YmY4MGQg
MTAwNjQ0Cj4gPiAtLS0gYS9wYWNrYWdlL2dudXRscy9Db25maWcuaW4KPiA+ICsrKyBiL3BhY2th
Z2UvZ251dGxzL0NvbmZpZy5pbgo+ID4gQEAgLTM5LDMgKzM5LDYgQEAgZW5kaWYKPiA+Cj4gPiAg
IGNvbW1lbnQgImdudXRscyBuZWVkcyBhIHRvb2xjaGFpbiB3LyB3Y2hhciwgZHluYW1pYyBsaWJy
YXJ5Igo+ID4gICAgICAgZGVwZW5kcyBvbiAhQlIyX1VTRV9XQ0hBUiB8fCBCUjJfU1RBVElDX0xJ
QlMKPiA+ICsKPiA+ICtjb25maWcgQlIyX1BBQ0tBR0VfSE9TVF9HTlVUTFNfUDExX0tJVAo+ID4g
KyAgICAgYm9vbAo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZ251dGxzL2dudXRscy5tayBiL3Bh
Y2thZ2UvZ251dGxzL2dudXRscy5tawo+ID4gaW5kZXggNjQxMWE3ZDYyMTE1Li43MWQ2MDI4MjVj
ZjIgMTAwNjQ0Cj4gPiAtLS0gYS9wYWNrYWdlL2dudXRscy9nbnV0bHMubWsKPiA+ICsrKyBiL3Bh
Y2thZ2UvZ251dGxzL2dudXRscy5tawo+ID4gQEAgLTY0LDEwICs2NCwxNSBAQCBIT1NUX0dOVVRM
U19DT05GX09QVFMgPSBcCj4gPiAgICAgICAtLWRpc2FibGUtb3BlbnNzbC1jb21wYXRpYmlsaXR5
IFwKPiA+ICAgICAgIC0td2l0aG91dC1icm90bGkgXAo+ID4gICAgICAgLS13aXRob3V0LWlkbiBc
Cj4gPiAtICAgICAtLXdpdGhvdXQtcDExLWtpdCBcCj4gPiAgICAgICAtLXdpdGhvdXQtemxpYiBc
Cj4gPiAgICAgICAtLXdpdGhvdXQtenN0ZAo+ID4KPiA+ICtpZmVxICgkKEJSMl9QQUNLQUdFX0hP
U1RfR05VVExTX1AxMV9LSVQpLHkpCj4gPiArSE9TVF9HTlVUTFNfREVQRU5ERU5DSUVTICs9IGhv
c3QtcDExLWtpdAo+Cj4gWW91IHNob3VsZCBleHBsaWNpdGx5IGVuYWJsZSBwMTEta2l0IHN1cHBv
cnQgaW4gdGhpcyBicmFuY2gsIHNvIGFueQo+IChjb25maWd1cmUvYnVpbGQgdGltZSkgcHJvYmxl
bSB3aXRoIHRoYXQgc2hvd3MgdXAgaW1tZWRpYXRlbHkuCj4KPiBTZXJpZXMgbG9va3MgZ29vZCB0
byBtZSBvdGhlcndpc2UsIGJ1dCBJIGRpZG4ndCBnZXQgdG8gdGVzdCBpdCB5ZXQuCgpUaGFua3Mg
Zm9yIHRoZSByZXZpZXcuIEknbGwgc2VuZCBhIHYyIHdpdGggeW91ciBzdWdnZXN0aW9uIGFwcGxp
ZWQuCgpJIHRlc3RlZCB0aGUgc2VyaWVzIGJ5IGJ1bXBpbmcgdGhlIEJlYWdsZUJvbmUgdG8gdGhl
IG5ldyBVLUJvb3QgdmVyc2lvbgphbmQgdGhlIGxhdGVzdCBMaW51eCB2ZXJzaW9uLCBidXQgSSBk
ZWNpZGVkIG5vdCB0byBpbmNsdWRlIHRoYXQgcGF0Y2ggaW4gdGhpcwpzZXJpZXMgYW5kIGluc3Rl
YWQgd2FpdCB1bnRpbCB0aGUgc2VyaWVzIGlzIG1lcmdlZCBmaXJzdC4KClRoYW5rcyBhbmQgcmVn
YXJkcywKRGFyaW8KCj4KPiBCZXN0IHJlZ2FyZHMsCj4gRmlvbmEKPgo+ID4gK2Vsc2UKPiA+ICtI
T1NUX0dOVVRMU19DT05GX09QVFMgKz0gLS13aXRob3V0LXAxMS1raXQKPiA+ICtlbmRpZgo+ID4g
Kwo+ID4gICBpZmVxICgkKEJSMl9QQUNLQUdFX0dOVVRMU19PUEVOU1NMKSx5KQo+ID4gICBHTlVU
TFNfTElDRU5TRSArPSAsIEdQTC0zLjArIChnbnV0bHMtb3BlbnNzbCBsaWJyYXJ5KQo+ID4gICBH
TlVUTFNfTElDRU5TRV9GSUxFUyArPSBDT1BZSU5HCj4KPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAoKCgotLSAKRGFyaW8gQmluYWNjaGkKU2VuaW9yIEVtYmVkZGVk
IFNvZnR3YXJlIEVuZ2luZWVyCk0uICszOSAzMjggMDYyNTI0NgpkYXJpby5iaW5hY2NoaUBhbWFy
dWxhc29sdXRpb25zLmNvbQrigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXigJXi
gJXigJUKQW1hcnVsYSBTb2x1dGlvbnMgU1JMCiBWaWEgRmVsaWNlIENhdmFsbG90dGkgMjVELCA0
MTAxMiBDYXJwaSwgTU8sIElUCmluZm9AYW1hcnVsYXNvbHV0aW9ucy5jb20Kd3d3LmFtYXJ1bGFz
b2x1dGlvbnMuY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
