Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28950C3DA49
	for <buildroot@archiver.kernel.org>; Fri, 26 Jul 2024 09:26:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDE9C80D6A;
	Fri, 26 Jul 2024 09:26:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R6zdUC1gDn9O; Fri, 26 Jul 2024 09:26:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCC9180D85
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCC9180D85;
	Fri, 26 Jul 2024 09:26:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4240B1BF20B
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 09:25:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2EEB04078C
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 09:25:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1fClPY2pFePa for <buildroot@lists.busybox.net>;
 Fri, 26 Jul 2024 09:25:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a36; helo=mail-vk1-xa36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CCBF740762
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCBF740762
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com
 [IPv6:2607:f8b0:4864:20::a36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CCBF740762
 for <buildroot@buildroot.org>; Fri, 26 Jul 2024 09:25:57 +0000 (UTC)
Received: by mail-vk1-xa36.google.com with SMTP id
 71dfb90a1353d-4f52cc4d3beso202086e0c.3
 for <buildroot@buildroot.org>; Fri, 26 Jul 2024 02:25:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721985956; x=1722590756;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j6Y6GxixTyH9Gd8R1NCHwtEAlkhnrgECEDPHgcShUm0=;
 b=wzH7g3c6ai6prPeL2+LLLEtDqxZNzaVAwP5rw4PGbE9lcuFwAYHUtqwVUDN3STSilG
 2/wzcIP1njgXcRPmOPYoY8LJ6mm9fbJPVwkutmagPMfsWruLFd9AY9cGdTZ1oUSrK/Ra
 gzjw+cYylmMVNf3Z7o2ji0IGtMH8MbwkqPvTMb5i5gYf61wsl4qMsu3P33uH65aWj/Yf
 9/YHYxvdYDWxrMzneNDdO8ngUAWfcW5PN02FIbMtYpalRjuZUk3UpIt058dGq2Uppwn2
 XVgfuwVQi8gZ2TlpLkiQ50zZP2agyrInAo08Ji8mSB803Ho5sAxHGweLTWcdE3u8InOP
 OA/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWto0SLBO3vH+JZc/q6Bt0axI9zYQr7yEt9I1BM8CayjZKoFmpBpJ0IadXLR3Jrmnc3NlBRysprCMVlF1R9zUnCP1FGE93OPQ==
X-Gm-Message-State: AOJu0YyNc2K6O9LS46CdkoOhU9oK0+pbPgwgJFN7Wv6ag1uEmNdEhux5
 wiKnKYa6gtYmz3lAjuC0RtMYkEIjRA9Zpxr/dipK/8XtBrBoffNNGnmVTny0Ii+yLAA4RHQf/s1
 rPPOBuKGQsBsH8bEMhW/UvT/y8JU=
X-Google-Smtp-Source: AGHT+IFF4c2Y8wnkIEMvAb8z/SsJSvEtHmXDCT+CUyoAyv0ioZBtcqUzXtd64ksmbrDxJkUsBaZFLwEkXJ7MB4pbL1w=
X-Received: by 2002:a05:6122:3c46:b0:4f2:a974:29e5 with SMTP id
 71dfb90a1353d-4f6c5b56223mr7209390e0c.1.1721985956182; Fri, 26 Jul 2024
 02:25:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240724-revert-output-gitignore-v1-0-510a2795884c@collins.com>
 <20240724-revert-output-gitignore-v1-1-510a2795884c@collins.com>
 <20240725075112.576a95cf@windsurf> <D2YVE5NGZSYH.25O7ZZFRN3GCY@collins.com>
In-Reply-To: <D2YVE5NGZSYH.25O7ZZFRN3GCY@collins.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 26 Jul 2024 03:25:44 -0600
Message-ID: <CADvTj4r5Kw0wpwb0yjnO0_7h-qB5i3LW50_yS1M-xLgQZ61P1Q@mail.gmail.com>
To: Brandon Maier <brandon.maier@collins.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721985956; x=1722590756; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j6Y6GxixTyH9Gd8R1NCHwtEAlkhnrgECEDPHgcShUm0=;
 b=W6mtAnezC47NGxH8vZX+OXM4DGyspG9tnO0TjN93iKZile9pv+2kyW5f7s2aG8upaJ
 vGplyKwTDoCyb7VKjtbEu0jzwqav6mWjHd4BoHZwNbiCG0Rk6EmBkAHTDQt1DL12zsQc
 txgXsHjZoje7svep9Dq5gvyoT+/7JF7qMyjFZSNadhW59WQrIxFieBglf+vo4tgwOw8u
 Uue3lccj8JSmbMtVuKAlRK3QbhWsIig3zpva5TAVF2hf+tXqJAYK3dvvaqVvGXPq5Jzj
 HhjovJOnaQ8la65HVI1QJNH9P/GnpRb/HW+rSa6EIH32pIRgClHXuX8yo5ANcRoGa3XR
 Pc1w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=W6mtAnez
Subject: Re: [Buildroot] [PATCH 1/2] Revert "Create a .gitignore file in the
 CANONICAL_O directory"
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
Cc: Bryan Brattlof <bb@ti.com>, Marcus Hoffmann <buildroot@bubu1.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCBKdWwgMjUsIDIwMjQgYXQgMTozNOKAr1BNIEJyYW5kb24gTWFpZXIgdmlhIGJ1aWxk
cm9vdAo8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgo+Cj4gSGkgVGhvbWFzLAo+Cj4g
T24gVGh1IEp1bCAyNSwgMjAyNCBhdCA1OjUxIEFNIFVUQywgVGhvbWFzIFBldGF6em9uaSB2aWEg
YnVpbGRyb290IHdyb3RlOgo+ID4gSGVsbG8gQnJhbmRvbiwKPiA+Cj4gPiBPbiBXZWQsIDI0IEp1
bCAyMDI0IDIxOjIzOjIwICswMDAwCj4gPiBCcmFuZG9uIE1haWVyIDxicmFuZG9uLm1haWVyQGNv
bGxpbnMuY29tPiB3cm90ZToKPiA+Cj4gPiA+IFRoZSBwYWNrYWdlcyAncHl0aG9uLWpzb25zY2hl
bWEtc3BlY2lmaWNhdGlvbnMnLCAncHlkYW50aWMtY29yZScsIGFuZAo+ID4gPiBsaWtlbHkgb3Ro
ZXIgcGFja2FnZXMgYmFzZWQgb24gUHl0aG9uIG1hdHVyaW4gc2lsZW50bHkgc3RvcHBlZAo+ID4g
PiBpbnN0YWxsaW5nIGZpbGVzIHRvIHRoZSBob3N0IGFuZCB0YXJnZXQgZGlyZWN0b3JpZXMgYWZ0
ZXIgY29tbWl0Cj4gPiA+IGExNGM4NjJjMDguCj4gPiA+Cj4gPiA+IEEgc2ltaWxhciBpc3N1ZSB3
YXMgcmVwb3J0ZWQgYnkgdGhlIENvbmRhIHByb2plY3RbMV0uIEl0IHNlZW1zIHNvbWUKPiA+ID4g
YnVpbGQgdG9vbHMgc2NhbiBmb3IgZ2l0aWdub3JlIGZpbGVzIHRvIGRlY2lkZSB3aGF0IGZpbGVz
IHRvIGJ1aWxkCj4gPiA+IGFuZCBpbnN0YWxsLgo+ID4gPgo+ID4gPiBJIGF0dGVtcHRlZCB2YXJp
b3VzIGNvbWJpbmF0aW9ucyBvZiBnaXRpZ25vcmUgcGF0dGVybnMgaW5jbHVkaW5nCj4gPiA+IG1p
bWlja2luZyB0aGUgQ29uZGEgcHJvamVjdCdzIGdpdGlnbm9yZVsyXSwgYnV0IHRoZSBvbmx5IHRo
aW5nIHRoYXQgaGFzCj4gPiA+IHdvcmtlZCByZWxpYWJseSBpcyB0aGUgb3JpZ2luYWwgYC9vdXRw
dXRgIGlnbm9yZSBpbiB0aGUgcm9vdCBCdWlsZHJvb3QKPiA+ID4gZGlyZWN0b3J5Lgo+ID4KPiA+
IFRoYW5rcyBmb3Igd29ya2luZyBvbiB0aGlzLiBIb3dldmVyLCBpdCdzIHJlYWxseSBtZXNzZWQg
dXAuIFdoeSB3b3VsZAo+ID4gdGhlc2UgdG9vbHMgYmUgYm90aGVyZWQgYnkgYSAuZ2l0aWdub3Jl
IGZpbGU/IERvIHlvdSBoYXZlIHNvbWUgbW9yZQo+ID4gZGV0YWlscz8KPgo+IEkgZGlkIGRpc2Nv
dmVyIEkgd2FzIHdyb25nIGFib3V0IHB5dGhvbi1qc29uc2NoZW1hLXNwZWNpZmljYXRpb25zLCBp
dAo+IGRvZXMgbm90IHVzZSBNYXR1cmluLCBpdCB1c2VzIEhhdGNobGluZy4gSGF0Y2hsaW5nIGFs
c28gaGFzIGEgZ2l0aWdub3JlCj4gcmVsYXRlZCBidWcuIEkgb3BlbmVkIGEgZ2l0aHViIGlzc3Vl
IGhlcmUgd2l0aCBtb3JlIGRldGFpbGVkIGluZm8uCj4KPiBodHRwczovL2dpdGh1Yi5jb20vcHlw
YS9oYXRjaC9pc3N1ZXMvMTY0MQoKUG9zc2libGUgZml4IGZvciB0aGUgaGF0Y2ggYnVnOgpodHRw
czovL2dpdGh1Yi5jb20vcHlwYS9oYXRjaC9wdWxsLzE2NDMKCj4KPiA+Cj4gPiBJIHRoaW5rIEkn
bSBnb2luZyB0byBhcHBseSB0aGUgcmV2ZXJ0IHRvIGZpeCB0aGUgaW1tZWRpYXRlIGJ1aWxkCj4g
PiBpc3N1ZXMsIGJ1dCBJIHdvdWxkIHJlYWxseSByZWFsbHkgbGlrZSB0byBmaXggdGhlIHJlYWwg
cHJvYmxlbSwgYW5kCj4gPiBhbGxvdyB1cyB0byBnZW5lcmF0ZSB0aGlzIC5naXRpZ25vcmUgZmls
ZSBpbiB0aGUgb3V0cHV0IGRpcmVjdG9yeS4KPgo+IFNhbWUsIGhvcGVmdWxseSB3ZSBjYW4gZ2V0
IHRoZXNlIGlzc3VlcyB3b3JrZWQgb3V0IGFuZCB0cnkgYWdhaW4gOikKPgo+IFRoYW5rcywKPiBC
cmFuZG9uCj4KPiA+Cj4gPiBUaG9tYXMKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
