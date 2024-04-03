Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD500CD1288
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 08:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 73382400BA;
	Wed,  3 Apr 2024 08:34:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qvTdYlJMnKSX; Wed,  3 Apr 2024 08:34:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B6CF40527
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B6CF40527;
	Wed,  3 Apr 2024 08:34:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 995FB1BF44A
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 08:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 834E3409F5
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 08:34:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w7Doaim1i2Ok for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 08:34:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=michael@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BB89A4097A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB89A4097A
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BB89A4097A
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 08:34:28 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a44f2d894b7so710085766b.1
 for <buildroot@buildroot.org>; Wed, 03 Apr 2024 01:34:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712133266; x=1712738066;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QnfemmekfJTNEniJ3TEXuh/5Q3oAOU4V0SLOL++NhbE=;
 b=RrGRGJ6gVkj238A0jqww4GQRS3c5B6XhLBiBnwHgcnu+SjmEb6VKbdXbRU7DziXYxA
 sbCWfVmsYwIDAPKMTPiUQF5pUIsNNQ5NiP83OuhkbwkNXj88NrKwCLT/iFO2p+PTLM71
 j5r7mWhJvgmJtDEMONBuSo9vFNGTDa2sM7ncqPj9nrE44n0+cpXC76lEMc5ql7a9xEYB
 eAe2+W030Ey6tbBX3ikqGwAgXVLpcGgKtIUbW8fQlxJvgDxH4/oNmMILGrs+zyt4pGci
 AYRqXSPxUUvrOCk+xLqlm4ds+d9S1F4wGdG88f0oOLle/q5UU4JSxyxuuMlKK2wqTLkI
 yz8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnAsMvB8nRStVqPjyqW7j1US/BQJHOkiG6IDcRcrUG2RoIJ/vIu2E3tZU2GN31kZIlJRfvZG6bB9y9NoBkNdVXgwxdLxKH/w==
X-Gm-Message-State: AOJu0YzGFjY1o3RfQuem9jD92RZYTnubO9eWSkjO3WxmT14kMYSsL4Eg
 0Ry6KsoTWYzXlwBZAhyzpXJIbS0pem/7nzPNa9Gzrjl7gqKcvyvP6ynvDfD8DTNNviUTBdo2dPR
 ilCxKllIXGtYtnQDrOxpdB+pScPHy08l4ZKaRQQ==
X-Google-Smtp-Source: AGHT+IHMeM7xmXxwSBc/S92nUtL+A3JFBMFcEmHZrCTElvxCxuQPBpQjJocHC1MEfCYcML12opzdUqqc6iqEl4DIgkk=
X-Received: by 2002:a17:906:5ada:b0:a47:4efb:b0f5 with SMTP id
 x26-20020a1709065ada00b00a474efbb0f5mr9650348ejs.67.1712133266477; Wed, 03
 Apr 2024 01:34:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240304153253.732708-1-dario.binacchi@amarulasolutions.com>
 <20240304153253.732708-12-dario.binacchi@amarulasolutions.com>
 <20240319151642.iqpbgwlcqxcumi52@bryanbrattlof.com>
 <fb91444b-65b9-4c8a-877c-00bcfe754729@smile.fr>
In-Reply-To: <fb91444b-65b9-4c8a-877c-00bcfe754729@smile.fr>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Wed, 3 Apr 2024 10:34:15 +0200
Message-ID: <CAOf5uwny_iJrx4MeN-qg+Z0wn-JoZY1Ei1QfRvx5buNXX8M7Hw@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1712133266; x=1712738066;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QnfemmekfJTNEniJ3TEXuh/5Q3oAOU4V0SLOL++NhbE=;
 b=TgEt0vXNvcMj+4zvEjdqdy3J+vCmGLiJmCnepb2XqocRfAxqY9ovCsyYKMLto0FR18
 oZgbmLa3I7anGPhbiOdLaqyK0oji8QpEUGIxQsBO+K+euObeyrvRDXPGv+Y64rBQeASH
 YgMbwTL7rvmFuawWCl5Py2Ge06nKQUSTOY/wo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=TgEt0vXN
Subject: Re: [Buildroot] [PATCH v9 11/22] boot/ti-k3-r5-loader: set binman
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
Cc: Bryan Brattlof <bb@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Anand Gadiyar <gadiyar@ti.com>, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, bryce@redpinelabs.com,
 Andreas Dannenberg <dannenberg@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUm9tYWluCgpPbiBXZWQsIEFwciAzLCAyMDI0IGF0IDEwOjI44oCvQU0gUm9tYWluIE5hb3Vy
IDxyb21haW4ubmFvdXJAc21pbGUuZnI+IHdyb3RlOgo+Cj4gSGVsbG8gQnJ5YW4sIEFsbCwKPgo+
IExlIDE5LzAzLzIwMjQgw6AgMTY6MTYsIEJyeWFuIEJyYXR0bG9mIGEgw6ljcml0IDoKPiA+IEhp
IERhcmlvLAo+ID4KPiA+IE9uIE1hcmNoICA0LCAyMDI0IHRodXMgc2F5ZXRoIERhcmlvIEJpbmFj
Y2hpOgo+ID4+IFJlY2VudCB2ZXJzaW9uIG9mIFUtQm9vdCB1c2UgYmlubWFuIHRvIHByb3ZpZGUg
YSBtZWNoYW5pc20gZm9yIGJ1aWxkaW5nCj4gPj4gaW1hZ2VzLCBmcm9tIHNpbXBsZSBTUEwgKyBV
LUJvb3QgY29tYmluYXRpb25zLCB0byBtb3JlIGNvbXBsZXgKPiA+PiBhcnJhbmdlbWVudHMgd2l0
aCBtYW55IHBhcnRzLgo+ID4+Cj4gPj4gVGhlIHBhdGNoIHNldCB0aGUgQklOTUFOX0lORElSUyBl
bnZpcm9ubWVudCB2YXJpYWJsZSB0byBwcm92aWRlIHRoZQo+ID4+IGRpcmVjdG9yeSB0byBzZWFy
Y2ggZm9yIGJpbmFyeSBibG9icyBhbmQgc2VsZWN0IHRoZSBwYWNrYWdlcyByZXF1aXJlZCBieQo+
ID4+IGJpbm1hbi4KPiA+Pgo+ID4+IFRoZSBkZXBlbmRlbmN5IG9mIGJpbm1hbiBpcyBub3QgcmVh
bGx5IGVhc3kgdG8gZm9sbG93LiBGaXJzdCB3ZSBoYXZlIHRoZQo+ID4+IHBhY2thZ2VzIGxpc3Qg
ZnJvbSBiaW5tYW4ucnN0IFsxXSB0aGVuIHdlIGhhdmUgdG8gaW5zdGFsbCBhZGRpdGlvbmFsIHB5
dGhvbgo+ID4+IG1vZHVsZXMgWzJdLiBNYXliZSBpbiB0aGUgZnV0dXJlIGl0IHdpbGwgYmUgbmVj
ZXNzYXJ5IHRvIGFkZCBob3N0LWx6bWEgYW5kCj4gPj4gaG9zdC1sejQgaW4gdGhlIGRlcGVuZGVu
Y2llcyBsaXN0Lgo+ID4+Cj4gPj4gWzFdIGh0dHBzOi8vc291cmNlLmRlbnguZGUvdS1ib290L3Ut
Ym9vdC8tL2Jsb2IvdjIwMjQuMDEvdG9vbHMvYmlubWFuL2Jpbm1hbi5yc3Q/cGxhaW49MSNMMzc3
Cj4gPj4gWzJdIGh0dHBzOi8vc291cmNlLmRlbnguZGUvdS1ib290L3UtYm9vdC8tL2Jsb2IvdjIw
MjQuMDEvdG9vbHMvYnVpbGRtYW4vcmVxdWlyZW1lbnRzLnR4dAo+ID4+IENvLWRldmVsb3BlZC1i
eTogTWljaGFlbCBUcmltYXJjaGkgPG1pY2hhZWxAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gPj4g
U2lnbmVkLW9mZi1ieTogTWljaGFlbCBUcmltYXJjaGkgPG1pY2hhZWxAYW1hcnVsYXNvbHV0aW9u
cy5jb20+Cj4gPj4gQ28tZGV2ZWxvcGVkLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBz
bWlsZS5mcj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBz
bWlsZS5mcj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNj
aGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gPj4KPiA+PiAtLS0KPiA+Pgo+ID4KPiA+IC4uLgo+
ID4KPiA+PiBkaWZmIC0tZ2l0IGEvYm9vdC90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVy
Lm1rCj4gPj4gYi9ib290L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIubWsKPiA+PiBp
bmRleCAwZmZjYjgyMzVmMmUuLmZkYjA1OGYzYjcyYSAxMDA2NDQKPiA+PiAtLS0gYS9ib290L3Rp
LWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIubWsKPiA+PiArKysgYi9ib290L3RpLWszLXI1
LWxvYWRlci90aS1rMy1yNS1sb2FkZXIubWsKPiA+PiBAQCAtMzksNyArMzksMTIgQEAgVElfSzNf
UjVfTE9BREVSX0RFUEVOREVOQ0lFUyA9IFwKPiA+PiAgICAgIGhvc3QtcGtnY29uZiBcCj4gPj4g
ICAgICAkKEJSMl9NQUtFX0hPU1RfREVQRU5ERU5DWSkgXAo+ID4+ICAgICAgaG9zdC1hcm0tZ251
LXRvb2xjaGFpbiBcCj4gPj4gLSAgICBob3N0LW9wZW5zc2wKPiA+PiArICAgIGhvc3Qtb3BlbnNz
bCBcCj4gPj4gKyAgICBob3N0LXB5dGhvbi1qc29uc2NoZW1hIFwKPiA+PiArICAgIGhvc3QtcHl0
aG9uLXB5eWFtbCBcCj4gPj4gKyAgICBob3N0LXB5dGhvbjMgXAo+ID4+ICsgICAgaG9zdC1weXRo
b24tc2V0dXB0b29scyBcCj4gPj4gKyAgICBob3N0LXB5dGhvbi1weWxpYmZkdAo+ID4KPiA+IEp1
c3QgYSBxdWVzdGlvbiBvbiBob3cgYm9vdCBkZXBlbmRlbmNpZXMgYXJlIHJlc29sdmVkLiBEbyB3
ZSBuZWVkIHRvIGFkZAo+ID4gdGktazMtYm9vdC1maXJtd2FyZSB0byB0aGlzIGxpc3Q/IEhvdyBk
b2VzIHRpLWszLXI1LWxvYWRlciBrbm93IHRvCj4gPiAnYnVpbGQnIHRoZSBmaXJtd2FyZSBiZWZv
cmUgd2UgYnVpbGQgdGlib290My5iaW4/Cj4KPiBJbmRlZWQsIHdpdGhvdXQgdGktazMtYm9vdC1m
aXJtd2FyZSBwYWNrYWdlIGluc3RhbGxlZCwgYmlubWFuIHdhcm4gYWJvdXQKPiAiTWlzc2luZyBi
bG9iIgo+Cj4gbWFrZSB0aV9hbTYyeF9za19kZWZjb25maWcKPiBtYWtlIHRpLWszLXI1LWxvYWRl
cgo+Cj4gICBCSU5NQU4gIC5iaW5tYW5fc3RhbXAKPiBJbWFnZSAndGlib290My1hbTYyeC1ocy1l
dm0uYmluJyBpcyBtaXNzaW5nIG9wdGlvbmFsIGV4dGVybmFsIGJsb2JzIGJ1dCBpcyBzdGlsbAo+
IGZ1bmN0aW9uYWw6IHRpLWZzLWVuYy5iaW4gc3lzZnctaW5uZXItY2VydAo+Cj4gL2Jpbm1hbi90
aWJvb3QzLWFtNjJ4LWhzLWV2bS5iaW4vdGktZnMtZW5jLmJpbgo+ICh0aS1zeXNmdy90aS1mcy1m
aXJtd2FyZS1hbTYyeC1ocy1lbmMuYmluKToKPiAgICBNaXNzaW5nIGJsb2IKPgo+IC9iaW5tYW4v
dGlib290My1hbTYyeC1ocy1ldm0uYmluL3N5c2Z3LWlubmVyLWNlcnQKPiAodGktc3lzZncvdGkt
ZnMtZmlybXdhcmUtYW02MngtaHMtY2VydC5iaW4pOgo+ICAgIE1pc3NpbmcgYmxvYgo+Cj4gSW1h
Z2UgJ3RpYm9vdDMtYW02MngtaHMtZnMtZXZtLmJpbicgaXMgbWlzc2luZyBvcHRpb25hbCBleHRl
cm5hbCBibG9icyBidXQgaXMKPiBzdGlsbCBmdW5jdGlvbmFsOiB0aS1mcy1lbmMuYmluIHN5c2Z3
LWlubmVyLWNlcnQKPgo+IC9iaW5tYW4vdGlib290My1hbTYyeC1ocy1mcy1ldm0uYmluL3RpLWZz
LWVuYy5iaW4KPiAodGktc3lzZncvdGktZnMtZmlybXdhcmUtYW02MngtaHMtZnMtZW5jLmJpbik6
Cj4gICAgTWlzc2luZyBibG9iCj4KPiAvYmlubWFuL3RpYm9vdDMtYW02MngtaHMtZnMtZXZtLmJp
bi9zeXNmdy1pbm5lci1jZXJ0Cj4gKHRpLXN5c2Z3L3RpLWZzLWZpcm13YXJlLWFtNjJ4LWhzLWZz
LWNlcnQuYmluKToKPiAgICBNaXNzaW5nIGJsb2IKPgo+IEltYWdlICd0aWJvb3QzLWFtNjJ4LWdw
LWV2bS5iaW4nIGlzIG1pc3Npbmcgb3B0aW9uYWwgZXh0ZXJuYWwgYmxvYnMgYnV0IGlzIHN0aWxs
Cj4gZnVuY3Rpb25hbDogdGktZnMtZ3AuYmluCj4KPiAvYmlubWFuL3RpYm9vdDMtYW02MngtZ3At
ZXZtLmJpbi90aS1mcy1ncC5iaW4KPiAodGktc3lzZncvdGktZnMtZmlybXdhcmUtYW02MngtZ3Au
YmluKToKPiAgICBNaXNzaW5nIGJsb2IKPgo+ICAgT0ZDSEsgICAuY29uZmlnCj4KPiBTbywgd2Ug
c2hvdWxkIGFkZCB0aS1rMy1ib290LWZpcm13YXJlIGluIGRlcGVuZGVuY2llcyB0byBhdm9pZCBi
dWlsZGluZwo+IHRpLWszLXI1LWxvYWRlciBiZWZvcmUgdGktazMtYm9vdC1maXJtd2FyZS4KPgo+
IFdoZW4gYnVpbGRpbmcgdGhlIEFNNiBkZWZjb25maWcsIHRoZSBidWlsZCBvcmRlciBpcyBvcmRl
cmVkIGFscGhhYmV0aWNhbGx5IGJ5Cj4gZGVmYXVsdCBhbmQgdGktazMtYm9vdC1maXJtd2FyZSBp
cyBpbnN0YWxsZWQgYmVmb3JlIHRpLWszLXI1LWxvYWRlci4KPgoKT0ssIHRoaXMgaXMgYSB2YWxp
ZCBwb2ludC4gQW55d2F5IHdoYXQgeW91IHN1Z2dlc3QgZm9yY2Ugc2VsZWN0IG9yIGEKZGVwZW5k
LiBJZiB5b3UgaGF2ZSBtb3JlIHBvaW50cywgaXMgYmV0dGVyIHRvIHdyaXRlIGRvd24gYWxsIG9m
CnRoZW0gaW4gb25lIHJldmlldywgYW5kIG5vdCBzcGxpdCBhcyBub3cgZXZlcnkgbmV3IHBhdGNo
ZXNldC4gV2hhdCBkbyB5b3UgdGhpbms/CgpNaWNoYWVsCgo+IEJlc3QgcmVnYXJkcywKPiBSb21h
aW4KPgo+Cj4gPgo+ID4gfkJyeWFuCj4KCgotLSAKTWljaGFlbCBOYXp6YXJlbm8gVHJpbWFyY2hp
CkNvLUZvdW5kZXIgJiBDaGllZiBFeGVjdXRpdmUgT2ZmaWNlcgpNLiArMzkgMzQ3IDkxMyAyMTcw
Cm1pY2hhZWxAYW1hcnVsYXNvbHV0aW9ucy5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwoKQW1hcnVsYSBTb2x1dGlvbnMgQlYKSm9vcCBHZWVzaW5rd2VnIDEyNSwgMTExNCBB
QiwgQW1zdGVyZGFtLCBOTApULiArMzEgKDApODUgMTExIDkxNzIKaW5mb0BhbWFydWxhc29sdXRp
b25zLmNvbQp3d3cuYW1hcnVsYXNvbHV0aW9ucy5jb20KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
