Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 370BFCD37AB
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 18:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0069D404C8;
	Tue,  3 Sep 2024 18:56:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id apBD04YWnljf; Tue,  3 Sep 2024 18:56:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFC3A40A02
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AFC3A40A02;
	Tue,  3 Sep 2024 18:56:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9AF411BF319
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 18:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B98AC80D17
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 18:56:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id idPUm6BNyO9Y for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 18:56:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=michael@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9550D80D00
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9550D80D00
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9550D80D00
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 18:56:01 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a868831216cso671100966b.3
 for <buildroot@buildroot.org>; Tue, 03 Sep 2024 11:56:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725389759; x=1725994559;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BSnaRurVJEmLyrB1QJ0l8vhy4U1+T21s4Lorsm1LNk8=;
 b=PX8yi4kT+XfmHPDE7+dNUZtrqZN07jPOIE77tJxAW+MBd5SKvJ5Z7nrkC9ZmEWk9+K
 92xVjBp01003YPJCAVp6BIWCp3+DGYq+HJh47YT9yeBoRYyT1rStNoqSOvN/ogNBhFst
 fAkYfxWAHDh24UtZSjjTl6qx7bQBU0Yhe1wrqDQITMtiFDagPrNLgdQAwJJnMqE0HKWD
 0KZf1s1JQ35sclrV/ja96MIgfVDKig/ZPmDId89WjPf25La2M29uY9jyXvEsbnPIjyEN
 g6wvogeXRitXeAuHmU1gwYPROSH+4v5YrlysbYl2oM1Sxw35t3RjpPdkjO7miDUAymBF
 umeA==
X-Gm-Message-State: AOJu0YzMyGu7yet9Fidzr/CPCJ53p+LI7mBbi2PN6pEtm8ofcj5UtK+B
 afIddVj8gq8MU4O2u4xyFug47MALTRVFpMec3DE3Pbn2RQ730VjpTsaGa3qLUAV7Pi+OmRVB1Zx
 d2nmFhGgcChpbD5iLYMLFSSXeCNd7QDdAZOi++vRcB0KR2vApxtmm/Q==
X-Google-Smtp-Source: AGHT+IEX/rtLP8C1+TOgigwVmciPSxSQTbSc6ncwhTu+XvbkYPdepxadmCP7Xrewy8TEe8dmsoWpOFQS3k5Jz5VhW1I=
X-Received: by 2002:a17:907:7f29:b0:a7a:b4bd:d0eb with SMTP id
 a640c23a62f3a-a89b94cef55mr931788266b.24.1725389759149; Tue, 03 Sep 2024
 11:55:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240903085745.2594893-1-michael@amarulasolutions.com>
 <20240903085745.2594893-2-michael@amarulasolutions.com>
 <20240903205216.09ea5f17@windsurf>
In-Reply-To: <20240903205216.09ea5f17@windsurf>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Tue, 3 Sep 2024 20:55:48 +0200
Message-ID: <CAOf5uwn5tfE9ZV_dvsqiCcOpzQ2bxL=UZu8+3fhkqs1Nt=4Fug@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1725389759; x=1725994559;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BSnaRurVJEmLyrB1QJ0l8vhy4U1+T21s4Lorsm1LNk8=;
 b=dqw1khipe8vJUFpFE+qGDgRiFvewNXhJCoAPvw7Tq56MCy0XI6r6h06q6I35t8LSJg
 CDZW5G6NUN5pI2K2IilbABqEN3EwVSQLur8V5BG9udJEStmDkj82Lrm2VnZfxZLGL45t
 Ec7IzmoH7LNN2B2iwy+9NCR8i7huhf7Es/QjY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=dqw1khip
Subject: Re: [Buildroot] [PATCH V2 2/2] scripts/cve: Restart the clone if
 the pull generate an exception
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
Cc: linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzCgpPbiBUdWUsIFNlcCAzLCAyMDI0IGF0IDg6NTLigK9QTSBUaG9tYXMgUGV0YXp6
b25pCjx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgIDMg
U2VwIDIwMjQgMTA6NTc6NDUgKzAyMDAKPiBNaWNoYWVsIFRyaW1hcmNoaSA8bWljaGFlbEBhbWFy
dWxhc29sdXRpb25zLmNvbT4gd3JvdGU6Cj4KPiA+IGRpZmYgLS1naXQgYS9zdXBwb3J0L3Njcmlw
dHMvY3ZlLnB5IGIvc3VwcG9ydC9zY3JpcHRzL2N2ZS5weQo+ID4gaW5kZXggZGNiM2E2MzkyNS4u
NmNkOWFhYjk2MyAxMDA3NTUKPiA+IC0tLSBhL3N1cHBvcnQvc2NyaXB0cy9jdmUucHkKPiA+ICsr
KyBiL3N1cHBvcnQvc2NyaXB0cy9jdmUucHkKPiA+IEBAIC0yMSw2ICsyMSw3IEBAIGltcG9ydCBk
YXRldGltZQo+ID4gIGltcG9ydCBvcwo+ID4gIGltcG9ydCBkaXN0dXRpbHMudmVyc2lvbgo+ID4g
IGltcG9ydCBqc29uCj4gPiAraW1wb3J0IHNodXRpbAo+ID4gIGltcG9ydCBzdWJwcm9jZXNzCj4g
PiAgaW1wb3J0IHN5cwo+ID4gIGltcG9ydCBvcGVyYXRvcgo+ID4gQEAgLTY5LDE1ICs3MCwyMSBA
QCBjbGFzcyBDVkU6Cj4gPgo+ID4gICAgICBAc3RhdGljbWV0aG9kCj4gPiAgICAgIGRlZiBkb3du
bG9hZF9udmQobnZkX2dpdF9kaXIpOgo+ID4gKyAgICAgICAgZG9uZSA9IEZhbHNlCj4gPiAgICAg
ICAgICBwcmludChmIlVwZGF0aW5nIGZyb20ge05WRF9CQVNFX1VSTH0iKQo+ID4gICAgICAgICAg
aWYgb3MucGF0aC5leGlzdHMobnZkX2dpdF9kaXIpOgo+ID4gLSAgICAgICAgICAgIHN1YnByb2Nl
c3MuY2hlY2tfY2FsbCgKPiA+IC0gICAgICAgICAgICAgICAgWyJnaXQiLCAicHVsbCIsICItLWRl
cHRoIiwgIjEiXSwKPiA+IC0gICAgICAgICAgICAgICAgY3dkPW52ZF9naXRfZGlyLAo+ID4gLSAg
ICAgICAgICAgICAgICBzdGRvdXQ9c3VicHJvY2Vzcy5ERVZOVUxMLAo+ID4gLSAgICAgICAgICAg
ICAgICBzdGRlcnI9c3VicHJvY2Vzcy5ERVZOVUxMLAo+ID4gLSAgICAgICAgICAgICkKPiA+IC0g
ICAgICAgIGVsc2U6Cj4gPiArICAgICAgICAgICAgdHJ5Ogo+ID4gKyAgICAgICAgICAgICAgICBz
dWJwcm9jZXNzLmNoZWNrX2NhbGwoCj4gPiArICAgICAgICAgICAgICAgICAgICBbImdpdCIsICJw
dWxsIiwgIi0tZGVwdGgiLCAiMSJdLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgY3dkPW52ZF9n
aXRfZGlyLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgc3Rkb3V0PXN1YnByb2Nlc3MuREVWTlVM
TCwKPiA+ICsgICAgICAgICAgICAgICAgICAgIHN0ZGVycj1zdWJwcm9jZXNzLkRFVk5VTEwsCj4g
PiArICAgICAgICAgICAgICAgICkKPiA+ICsgICAgICAgICAgICAgICAgZG9uZSA9IFRydWUKPiA+
ICsgICAgICAgICAgICBleGNlcHQ6Cj4gPiArICAgICAgICAgICAgICAgIHNodXRpbC5ybXRyZWUo
bnZkX2dpdF9kaXIpCj4KPiBUaGUgdGhpbmcgSSdtIHdvcnJpZWQgYWJvdXQgaXMgdGhhdCB5b3Ug
Y2FuIGFsc28gZ2V0IGEgZmFpbHVyZSBvZiAiZ2l0Cj4gcHVsbCIgZm9yIGV4YW1wbGUgZHVlIHRv
IGEgbmV0d29yayB0aW1lb3V0IG9yIHNvbWV0aGluZyBsaWtlIHRoYXQsCj4gd2hpY2ggZG9lc24n
dCBuZWVkIGEgZnVsbCBnaXQgY2xvbmUsIGJ1dCBqdXN0IGEgInRyeSBhZ2FpbiIgbGF0ZXIuLi4K
PiBhbmQgbm93IHdlJ3JlIGdvaW5nIHRvIHdpcGUgb3V0IHRoZSBlbnRpcmUgbG9jYWwgY2xvbmUs
IGFuZCB0cnkgdG8KPiBjbG9uZSBldmVyeXRoaW5nIGFnYWluLiBJcyB0aGF0IGEgZ29vZCBpZGVh
Pwo+Cj4gQWxzbywgcGVyaGFwcyB3ZSBuZWVkIHRvIHNob3cgYW4gZXJyb3IgbWVzc2FnZSBpZiB0
aGUgImdpdCBwdWxsIgo+IGZhaWxlZCwgYW5kIHNheWluZyB3ZSdyZSBmYWxsaW5nIGJhY2sgdG8g
YSBmdWxsIGNsb25lLCBvciBzb21ldGhpbmc/Cj4KPiA+ICsgICAgICAgIGlmIChub3QgZG9uZSk6
Cj4KPiAgICAgICAgICAgIGlmIG5vdCBkb25lOgo+Cj4KPiBpcyBzdWZmaWNpZW50LCB3ZSBhcmUg
bm90IHdyaXRpbmcgQyBjb2RlIGhlcmUgOi0pCgpTb3JyeSwgSSB3aWxsIGFzayBteSBjb2xsZWFn
dWUgdG8gd3JpdGUgcHl0aG9uIGFuZCBzZW5kIGEgYmV0dGVyCnN0cmF0ZWd5LiBJIHRvdGFsbHkg
YWdyZWUgd2l0aCB5b3UuCgpBbnl3YXkgSSBoYXZlIGEgcGxhbiB0byBhZGQgbW9yZSBpbmZvcm1h
dGlvbiBvbiBjdmUgcmVwb3J0aW5nLCBob3BlCnRoYXQgeW91IGxpa2UgdGhlIGlkZWEuCk1vc3Rs
eSBJJ20gcGxheWluZyB3aXRoIHBhcnNlciBmb3IgamVua2lucyBhbmQgbG92ZSB0byBhZGQgYnVp
bGRyb290CnRvbyBidXQgSSBkb24ndCBoYXZlIGVub3VnaAppbmZvcm1hdGlvbiB0byBzaG93Cgpo
dHRwczovL2dpdGh1Yi5jb20vamVua2luc2NpL2FuYWx5c2lzLW1vZGVsL3B1bGwvMTA4NQoKTWlj
aGFlbAoKCj4KPiBUaGFua3MhCj4KPiBUaG9tYXMKPiAtLQo+IFRob21hcyBQZXRhenpvbmksIGNv
LW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2lu
ZWVyaW5nIGFuZCB0cmFpbmluZwo+IGh0dHBzOi8vYm9vdGxpbi5jb20KCgoKLS0gCk1pY2hhZWwg
TmF6emFyZW5vIFRyaW1hcmNoaQpDby1Gb3VuZGVyICYgQ2hpZWYgRXhlY3V0aXZlIE9mZmljZXIK
TS4gKzM5IDM0NyA5MTMgMjE3MAptaWNoYWVsQGFtYXJ1bGFzb2x1dGlvbnMuY29tCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KCkFtYXJ1bGEgU29sdXRpb25zIEJWCkpvb3AgR2Vl
c2lua3dlZyAxMjUsIDExMTQgQUIsIEFtc3RlcmRhbSwgTkwKVC4gKzMxICgwKTg1IDExMSA5MTcy
CmluZm9AYW1hcnVsYXNvbHV0aW9ucy5jb20Kd3d3LmFtYXJ1bGFzb2x1dGlvbnMuY29tCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
