Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 415A1C4829A
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 23:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72F0C4159D;
	Tue, 13 Feb 2024 23:43:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iKe21WWsg2Nv; Tue, 13 Feb 2024 23:43:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F0D8415C1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F0D8415C1;
	Tue, 13 Feb 2024 23:43:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 49EBD1BF2FC
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 23:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36238415A7
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 23:43:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RGaI2HMQl0ls for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 23:43:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::234; helo=mail-oi1-x234.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CB28941572
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB28941572
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CB28941572
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 23:43:29 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-3bbbc6b4ed1so1135689b6e.2
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 15:43:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707867808; x=1708472608;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IT2RGBXrevlVV/hOttND72fNlKwlNR5zytH13rLy6BU=;
 b=D5N+qaIdmrmuyJkmHgE/LNtLC2rwIDKGQsaqzBYK1QHhlvne20kfo+rCLM/wVecXRz
 8gvUatLnxvxnXEmdFyu/q1Z7AP3RE7ObILY3Juqm/mYT/I9kJ4i7XHPmwIHXmyAj6VtJ
 SXFjJOS42yehihXTVPHhGpp9qhE2USC4cxHt/pv7safyUrnlV2QqrmQ61pSC74OGCuAP
 FWOyz7RTL7pJdY94guFXuhpEePOt8asFYpLuWf8aTTyXWK+Jy6muLLlhdHxjEQkiygJM
 6q+H0ZlwtWOHFE6zkSe+KVfmwyj6xLHbOZevrFBYqPJXd9LzKNCdPsB2b8ulVL/r4S3s
 c+dg==
X-Gm-Message-State: AOJu0YwaBybXeRoEYKJSNoO+ZUjq1HXqghlP0+S4HjXLfJhHwoogF2ro
 DMn9+3iaxNxXZg9lyi6qc4IKTIoUPulw922GPQ2me7BuXgz76vvx7KuZjiCBiPjFxYAJXWHgUYb
 Bwn/vDGrVebu70yz501hXTCTUJeI=
X-Google-Smtp-Source: AGHT+IHsN2YXxV0RHOgLFAnaTdANlP9R/E2KrMHZ8Ca2+NQdVtoYSS48V4P366ChT8+anxXa8LRAoyC51Yp/0LfdIhg=
X-Received: by 2002:a05:6808:187:b0:3bf:feab:f91c with SMTP id
 w7-20020a056808018700b003bffeabf91cmr937776oic.21.1707867808574; Tue, 13 Feb
 2024 15:43:28 -0800 (PST)
MIME-Version: 1.0
References: <20240213211512.3918044-1-james.hilliard1@gmail.com>
 <20240213211512.3918044-4-james.hilliard1@gmail.com>
 <7384cb6e-1b5b-4fca-ba0c-2c4d0fcd05a3@bubu1.eu>
In-Reply-To: <7384cb6e-1b5b-4fca-ba0c-2c4d0fcd05a3@bubu1.eu>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 13 Feb 2024 16:43:16 -0700
Message-ID: <CADvTj4qvJzBr4jBwj4htyAa=hKm67yo06Gn+kmAizbyGnZ=b3Q@mail.gmail.com>
To: Marcus Hoffmann <buildroot@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707867808; x=1708472608; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IT2RGBXrevlVV/hOttND72fNlKwlNR5zytH13rLy6BU=;
 b=bMq2BYL6N3Dw3xwJDxJl0QM5nPWvrSdEitROMyGN2ThsZNJn37JFLkXUrdCC0teAp3
 bVBkoO4qQD7vaBFXHHdesR3WxZWeitwuIO9yhjVPDYi6m8XRIwUebF/TkLjlri6mdj+M
 rl8ERDNFP8xcMVUwOR8pwm7sXr5k4DtAqjTIXIZtrmhxEqmanyD53IFyJ/XkHTQyw2+H
 MHhbYP3g3b3v927q3FItlJCYwmWR10AS7qG7gqQxTUY7biQ9BtOYhwjXco1un2A/LPmQ
 emUFfdCkzwRdR88p3iEpwsHSxRj2tsNWYg2kUwXOyelVYigY2g+sQmcHVvqsDRgt5Wl2
 BIGg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bMq2BYL6
Subject: Re: [Buildroot] [PATCH v8 04/26] package/python-setuptools: revert
 to last version with functional --build-option
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
Cc: Geoffrey Ragot <geoffreyragot@gmail.com>,
 Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Gustavo Heinz <gustavo@gsthnz.com>,
 =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 Attila Wagner <attila.wagner@onyxinsight.com>,
 =?UTF-8?B?RmzDoXZpbyBUYXBhasOzcw==?= <flavio.tapajos@newtesc.com.br>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Louis Aussedat <aussedat.louis@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Joris Offouga <offougajoris@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Christian Kellermann <christian.kellermann@solectrix.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Lionel Flandrin <lionel@svkt.org>, Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCBGZWIgMTMsIDIwMjQgYXQgNDoxNOKAr1BNIE1hcmN1cyBIb2ZmbWFubiA8YnVpbGRy
b290QGJ1YnUxLmV1PiB3cm90ZToKPgo+IEhpIEphbWVzLAo+Cj4gT24gMTMuMDIuMjQgMjI6MTQs
IEphbWVzIEhpbGxpYXJkIHdyb3RlOgo+ID4gQSByZWNlbnQgY2hhbmdlIGluIHNldHVwdG9vbHMg
YWNjaWRlbnRpYWxseSBicm9rZSB0aGUgYWJpbGl0eSB0bwo+ID4gcGFzcyBidWlsZF9leHQgYXJn
cyB2aWEgdGhlIC0tYnVpbGQtb3B0aW9uIGNvbmZpZyBzZXR0aW5nLgo+ID4KPiA+IExldHMgZG93
bmdyYWRlIHRvIHRoZSBsYXN0IHdvcmtpbmcgdmVyc2lvbiBmb3Igbm93Lgo+Cj4gRG8geW91IGhh
dmUgYSBsaW5rIHRvIGEgaXNzdWUgaGVyZT8gSXMgdGhpbmcgYWNrbm93bGVkZ2VkIGJ5IHVwc3Ry
ZWFtLAo+IGlzIHRoaXMgcGxhbm5lZCB0byBiZSBmaXhlZD8KClllYWgsIEkgaGF2ZSBhIHB1bGwg
cmVxdWVzdCByZXZlcnRpbmcgdGhlIGNoYW5nZSB0aGF0IGNhdXNlZCB0aGlzIHRvIGJyZWFrOgpo
dHRwczovL2dpdGh1Yi5jb20vcHlwYS9zZXR1cHRvb2xzL3B1bGwvNDIxOAoKVGhlcmUncyBzb21l
IGxpbmtzL3RocmVhZHMgdGhlcmUgd2l0aCBtb3JlIGluZm8uCgo+Cj4gPgo+ID4gU2lnbmVkLW9m
Zi1ieTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Cj4gPiAtLS0K
PiA+ICAgcGFja2FnZS9weXRob24tc2V0dXB0b29scy9weXRob24tc2V0dXB0b29scy5oYXNoIHwg
NCArKy0tCj4gPiAgIHBhY2thZ2UvcHl0aG9uLXNldHVwdG9vbHMvcHl0aG9uLXNldHVwdG9vbHMu
bWsgICB8IDQgKystLQo+ID4gICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tc2V0dXB0b29s
cy9weXRob24tc2V0dXB0b29scy5oYXNoIGIvcGFja2FnZS9weXRob24tc2V0dXB0b29scy9weXRo
b24tc2V0dXB0b29scy5oYXNoCj4gPiBpbmRleCA3ZjEzYWMzODk2Li45Yzk3MWVlYzExIDEwMDY0
NAo+ID4gLS0tIGEvcGFja2FnZS9weXRob24tc2V0dXB0b29scy9weXRob24tc2V0dXB0b29scy5o
YXNoCj4gPiArKysgYi9wYWNrYWdlL3B5dGhvbi1zZXR1cHRvb2xzL3B5dGhvbi1zZXR1cHRvb2xz
Lmhhc2gKPiA+IEBAIC0xLDUgKzEsNSBAQAo+ID4gICAjIG1kNSwgc2hhMjU2IGZyb20gaHR0cHM6
Ly9weXBpLm9yZy9weXBpL3NldHVwdG9vbHMvanNvbgo+ID4gLW1kNSAgYjgyZGU0NWFhYTZiOWJi
OTExMjI2NjYwMjEyZWJiODMgIHNldHVwdG9vbHMtNjkuMC4zLnRhci5nego+ID4gLXNoYTI1NiAg
YmUxYWY1N2ZjNDA5ZjkzNjQ3ZjJlOGU0NTczYTE0MmVkMzg3MjRiOGNkZDM4OTcwNmE4NjdiYjRl
ZmNmMWU3OCAgc2V0dXB0b29scy02OS4wLjMudGFyLmd6Cj4gPiArbWQ1ICBkOTY3Y2EyYmE3ZjQ2
ZGI4ODdkYWVlMmQ1YzliZDZhMiAgc2V0dXB0b29scy02OC4yLjIudGFyLmd6Cj4gPiArc2hhMjU2
ICA0YWMxNDc1Mjc2ZDJmMWM0ODY4NDg3NDA4OWZlZmNkODNiZDcxNjJkZGFhZmI4MWZhYzg2NmJh
MGRiMjgyYTg3ICBzZXR1cHRvb2xzLTY4LjIuMi50YXIuZ3oKPiA+ICAgIyBMb2NhbGx5IGNvbXB1
dGVkIHNoYTI1NiBjaGVja3N1bXMKPiA+ICAgc2hhMjU2ICA4NmRhMGYwMWFlYWU0NjM0OGEzYzNk
NDY1MTk1ZGMxY2VjY2RlNzlmNzllODc3NjlhNjRiOGRhMDRiMmE0NzQxICBMSUNFTlNFCj4gPiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tc2V0dXB0b29scy9weXRob24tc2V0dXB0b29scy5t
ayBiL3BhY2thZ2UvcHl0aG9uLXNldHVwdG9vbHMvcHl0aG9uLXNldHVwdG9vbHMubWsKPiA+IGlu
ZGV4IDBhZWEzYzZjZmEuLmYyNmY0MjdjY2MgMTAwNjQ0Cj4gPiAtLS0gYS9wYWNrYWdlL3B5dGhv
bi1zZXR1cHRvb2xzL3B5dGhvbi1zZXR1cHRvb2xzLm1rCj4gPiArKysgYi9wYWNrYWdlL3B5dGhv
bi1zZXR1cHRvb2xzL3B5dGhvbi1zZXR1cHRvb2xzLm1rCj4gPiBAQCAtNCw5ICs0LDkgQEAKPiA+
ICAgIwo+ID4gICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ID4KPiA+IC1QWVRIT05fU0VUVVBU
T09MU19WRVJTSU9OID0gNjkuMC4zCj4gPiArUFlUSE9OX1NFVFVQVE9PTFNfVkVSU0lPTiA9IDY4
LjIuMgo+ID4gICBQWVRIT05fU0VUVVBUT09MU19TT1VSQ0UgPSBzZXR1cHRvb2xzLSQoUFlUSE9O
X1NFVFVQVE9PTFNfVkVSU0lPTikudGFyLmd6Cj4gPiAtUFlUSE9OX1NFVFVQVE9PTFNfU0lURSA9
IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy9mYy9jOS9iMTQ2Y2ExOTU0
MDNlMDE4MmEzNzRlMGVhNGRiYzY5MTM2YmFkM2NkNTViYzI5M2RmNDk2ZDYyNWQwZjcKPiA+ICtQ
WVRIT05fU0VUVVBUT09MU19TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3Bh
Y2thZ2VzL2VmL2NjLzkzZjcyMTNiMmFiNWVkMzgzZjk4Y2U4MDIwZTYzMmVmMjU2YjQwNmI4NTY5
NjA2YzNmMTYwZWQ4ZTFjOQo+ID4gICBQWVRIT05fU0VUVVBUT09MU19MSUNFTlNFID0gTUlUCj4g
PiAgIFBZVEhPTl9TRVRVUFRPT0xTX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCj4gPiAgIFBZVEhP
Tl9TRVRVUFRPT0xTX0NQRV9JRF9WRU5ET1IgPSBweXRob24KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
