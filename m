Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 578B9CD1294
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 09:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2211A82071;
	Wed,  3 Apr 2024 09:47:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RsMQ_TctSgNr; Wed,  3 Apr 2024 09:47:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07F93820A9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07F93820A9;
	Wed,  3 Apr 2024 09:47:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3D7C11BF271
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 09:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 288AE40B27
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 09:47:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5GHKWvw3ZI2B for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 09:47:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com;
 envelope-from=michael@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A0D364040D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0D364040D
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A0D364040D
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 09:47:11 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-513e134f73aso8092258e87.2
 for <buildroot@buildroot.org>; Wed, 03 Apr 2024 02:47:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712137629; x=1712742429;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DLcIhW+SaVHHAt3eYpL4B+71PH0TEBfREVf3H2ph0C0=;
 b=YXWDbKvJFMRbofCEC7TMWyRUx2wGXZF318px5pPG/BnoLeo+colQ0Tary5pT67ktAF
 NmCkh2qZze1BBU37meV3CnNirYUM0nNml31bCSx7lkk44lHozWuyQ1HUQGEUuLGAB7do
 4YIAIevxzfEcYvJHxZN4ITpdTkjNmhTG+jzC0WA2qXfSlZCuTJo3DMGmM/Bx6u3rfnlV
 a3n6IWXEuDuR3jxc763jsJv5ShKvid9qvX5IO0RKEkqBxTzAJ0+4KS8eaKISGJ7PVZ+w
 bmF6obRVK6+EPoCJ3+CkMKTRpqnSkVqBeVa1NVXJbwdpS5lPctkK88DTy+h1cvIvQT4E
 /lDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbjR1pKZvDs/RUKObyN/LKZHa/Djqzx3N6Ajj4EBTyn2Wt7vF6e8fnxBB/5IqvSI1Bxp4mlXbatveV8sXqcwR+1y6Fden3Nw==
X-Gm-Message-State: AOJu0Yyqm1oT8s2bZKAQ3jd8YwaIhxsb7EZpgj97liZD6p6tFy2ZzOFm
 /kBDLq+9ohINnAlqGPdSn6Gbu5gbygeB6Y78wWzCaW5PNsk3BNAcqVopWk4kRvd8xBXySqAcXkk
 U3ZETzEO1PDWtHo8KNP648V0EVLHOyh4f3uGy0g==
X-Google-Smtp-Source: AGHT+IGu7tIm0ph0dvGmuXfMMn9XfV/8fqhRcyqCJy7XLF7uuQZvj+7kLYwgINp8ROSeNxJQV7mpIMp/W3wSS/Roy/8=
X-Received: by 2002:a19:430a:0:b0:513:c2e4:9daf with SMTP id
 q10-20020a19430a000000b00513c2e49dafmr10909907lfa.52.1712137629008; Wed, 03
 Apr 2024 02:47:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240304153253.732708-1-dario.binacchi@amarulasolutions.com>
 <20240304153253.732708-12-dario.binacchi@amarulasolutions.com>
 <20240319151642.iqpbgwlcqxcumi52@bryanbrattlof.com>
 <fb91444b-65b9-4c8a-877c-00bcfe754729@smile.fr>
 <CAOf5uwny_iJrx4MeN-qg+Z0wn-JoZY1Ei1QfRvx5buNXX8M7Hw@mail.gmail.com>
 <a4e32712-b57e-4d2e-a1af-29aee0969064@smile.fr>
In-Reply-To: <a4e32712-b57e-4d2e-a1af-29aee0969064@smile.fr>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Wed, 3 Apr 2024 11:46:57 +0200
Message-ID: <CAOf5uwk8-V0sChhNDa_uB95eM-REjbQZpmk=tin_AzVLdknu1Q@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1712137629; x=1712742429;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DLcIhW+SaVHHAt3eYpL4B+71PH0TEBfREVf3H2ph0C0=;
 b=gIMZ0s5YCnjECdLtXiWiAmHopH39skwoAgUE/t2sjhJ4ouTMzYiMc0j3VIc+/SNlY9
 KxnTM45fWfXE02eDoHULHimwBzK3xMqj4+C2ce34OZy5grdF0aAhmBiL60WDF79hMwt0
 PRbOulGswzMIMIndUpPxtTbzOU+3DM3jd2RpY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=gIMZ0s5Y
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

SGkgUm9tYWluCgpPbiBXZWQsIEFwciAzLCAyMDI0IGF0IDExOjM44oCvQU0gUm9tYWluIE5hb3Vy
IDxyb21haW4ubmFvdXJAc21pbGUuZnI+IHdyb3RlOgo+Cj4gSGkgTWljaGFlbCwKPgo+IExlIDAz
LzA0LzIwMjQgw6AgMTA6MzQsIE1pY2hhZWwgTmF6emFyZW5vIFRyaW1hcmNoaSBhIMOpY3JpdCA6
Cj4gPiBIaSBSb21haW4KPiA+Cj4gPiBPbiBXZWQsIEFwciAzLCAyMDI0IGF0IDEwOjI44oCvQU0g
Um9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+IHdyb3RlOgo+ID4+Cj4gPj4gSGVs
bG8gQnJ5YW4sIEFsbCwKPiA+Pgo+ID4+IExlIDE5LzAzLzIwMjQgw6AgMTY6MTYsIEJyeWFuIEJy
YXR0bG9mIGEgw6ljcml0IDoKPiA+Pj4gSGkgRGFyaW8sCj4gPj4+Cj4gPj4+IE9uIE1hcmNoICA0
LCAyMDI0IHRodXMgc2F5ZXRoIERhcmlvIEJpbmFjY2hpOgo+ID4+Pj4gUmVjZW50IHZlcnNpb24g
b2YgVS1Cb290IHVzZSBiaW5tYW4gdG8gcHJvdmlkZSBhIG1lY2hhbmlzbSBmb3IgYnVpbGRpbmcK
PiA+Pj4+IGltYWdlcywgZnJvbSBzaW1wbGUgU1BMICsgVS1Cb290IGNvbWJpbmF0aW9ucywgdG8g
bW9yZSBjb21wbGV4Cj4gPj4+PiBhcnJhbmdlbWVudHMgd2l0aCBtYW55IHBhcnRzLgo+ID4+Pj4K
PiA+Pj4+IFRoZSBwYXRjaCBzZXQgdGhlIEJJTk1BTl9JTkRJUlMgZW52aXJvbm1lbnQgdmFyaWFi
bGUgdG8gcHJvdmlkZSB0aGUKPiA+Pj4+IGRpcmVjdG9yeSB0byBzZWFyY2ggZm9yIGJpbmFyeSBi
bG9icyBhbmQgc2VsZWN0IHRoZSBwYWNrYWdlcyByZXF1aXJlZCBieQo+ID4+Pj4gYmlubWFuLgo+
ID4+Pj4KPiA+Pj4+IFRoZSBkZXBlbmRlbmN5IG9mIGJpbm1hbiBpcyBub3QgcmVhbGx5IGVhc3kg
dG8gZm9sbG93LiBGaXJzdCB3ZSBoYXZlIHRoZQo+ID4+Pj4gcGFja2FnZXMgbGlzdCBmcm9tIGJp
bm1hbi5yc3QgWzFdIHRoZW4gd2UgaGF2ZSB0byBpbnN0YWxsIGFkZGl0aW9uYWwgcHl0aG9uCj4g
Pj4+PiBtb2R1bGVzIFsyXS4gTWF5YmUgaW4gdGhlIGZ1dHVyZSBpdCB3aWxsIGJlIG5lY2Vzc2Fy
eSB0byBhZGQgaG9zdC1sem1hIGFuZAo+ID4+Pj4gaG9zdC1sejQgaW4gdGhlIGRlcGVuZGVuY2ll
cyBsaXN0Lgo+ID4+Pj4KPiA+Pj4+IFsxXSBodHRwczovL3NvdXJjZS5kZW54LmRlL3UtYm9vdC91
LWJvb3QvLS9ibG9iL3YyMDI0LjAxL3Rvb2xzL2Jpbm1hbi9iaW5tYW4ucnN0P3BsYWluPTEjTDM3
Nwo+ID4+Pj4gWzJdIGh0dHBzOi8vc291cmNlLmRlbnguZGUvdS1ib290L3UtYm9vdC8tL2Jsb2Iv
djIwMjQuMDEvdG9vbHMvYnVpbGRtYW4vcmVxdWlyZW1lbnRzLnR4dAo+ID4+Pj4gQ28tZGV2ZWxv
cGVkLWJ5OiBNaWNoYWVsIFRyaW1hcmNoaSA8bWljaGFlbEBhbWFydWxhc29sdXRpb25zLmNvbT4K
PiA+Pj4+IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgVHJpbWFyY2hpIDxtaWNoYWVsQGFtYXJ1bGFz
b2x1dGlvbnMuY29tPgo+ID4+Pj4gQ28tZGV2ZWxvcGVkLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFp
bi5uYW91ckBzbWlsZS5mcj4KPiA+Pj4+IFNpZ25lZC1vZmYtYnk6IFJvbWFpbiBOYW91ciA8cm9t
YWluLm5hb3VyQHNtaWxlLmZyPgo+ID4+Pj4gU2lnbmVkLW9mZi1ieTogRGFyaW8gQmluYWNjaGkg
PGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+ID4+Pj4KPiA+Pj4+IC0tLQo+
ID4+Pj4KPiA+Pj4KPiA+Pj4gLi4uCj4gPj4+Cj4gPj4+PiBkaWZmIC0tZ2l0IGEvYm9vdC90aS1r
My1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVyLm1rCj4gPj4+PiBiL2Jvb3QvdGktazMtcjUtbG9h
ZGVyL3RpLWszLXI1LWxvYWRlci5tawo+ID4+Pj4gaW5kZXggMGZmY2I4MjM1ZjJlLi5mZGIwNThm
M2I3MmEgMTAwNjQ0Cj4gPj4+PiAtLS0gYS9ib290L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1s
b2FkZXIubWsKPiA+Pj4+ICsrKyBiL2Jvb3QvdGktazMtcjUtbG9hZGVyL3RpLWszLXI1LWxvYWRl
ci5tawo+ID4+Pj4gQEAgLTM5LDcgKzM5LDEyIEBAIFRJX0szX1I1X0xPQURFUl9ERVBFTkRFTkNJ
RVMgPSBcCj4gPj4+PiAgICAgIGhvc3QtcGtnY29uZiBcCj4gPj4+PiAgICAgICQoQlIyX01BS0Vf
SE9TVF9ERVBFTkRFTkNZKSBcCj4gPj4+PiAgICAgIGhvc3QtYXJtLWdudS10b29sY2hhaW4gXAo+
ID4+Pj4gLSAgICBob3N0LW9wZW5zc2wKPiA+Pj4+ICsgICAgaG9zdC1vcGVuc3NsIFwKPiA+Pj4+
ICsgICAgaG9zdC1weXRob24tanNvbnNjaGVtYSBcCj4gPj4+PiArICAgIGhvc3QtcHl0aG9uLXB5
eWFtbCBcCj4gPj4+PiArICAgIGhvc3QtcHl0aG9uMyBcCj4gPj4+PiArICAgIGhvc3QtcHl0aG9u
LXNldHVwdG9vbHMgXAo+ID4+Pj4gKyAgICBob3N0LXB5dGhvbi1weWxpYmZkdAo+ID4+Pgo+ID4+
PiBKdXN0IGEgcXVlc3Rpb24gb24gaG93IGJvb3QgZGVwZW5kZW5jaWVzIGFyZSByZXNvbHZlZC4g
RG8gd2UgbmVlZCB0byBhZGQKPiA+Pj4gdGktazMtYm9vdC1maXJtd2FyZSB0byB0aGlzIGxpc3Q/
IEhvdyBkb2VzIHRpLWszLXI1LWxvYWRlciBrbm93IHRvCj4gPj4+ICdidWlsZCcgdGhlIGZpcm13
YXJlIGJlZm9yZSB3ZSBidWlsZCB0aWJvb3QzLmJpbj8KPiA+Pgo+ID4+IEluZGVlZCwgd2l0aG91
dCB0aS1rMy1ib290LWZpcm13YXJlIHBhY2thZ2UgaW5zdGFsbGVkLCBiaW5tYW4gd2FybiBhYm91
dAo+ID4+ICJNaXNzaW5nIGJsb2IiCj4gPj4KPiA+PiBtYWtlIHRpX2FtNjJ4X3NrX2RlZmNvbmZp
Zwo+ID4+IG1ha2UgdGktazMtcjUtbG9hZGVyCj4gPj4KPiA+PiAgIEJJTk1BTiAgLmJpbm1hbl9z
dGFtcAo+ID4+IEltYWdlICd0aWJvb3QzLWFtNjJ4LWhzLWV2bS5iaW4nIGlzIG1pc3Npbmcgb3B0
aW9uYWwgZXh0ZXJuYWwgYmxvYnMgYnV0IGlzIHN0aWxsCj4gPj4gZnVuY3Rpb25hbDogdGktZnMt
ZW5jLmJpbiBzeXNmdy1pbm5lci1jZXJ0Cj4gPj4KPiA+PiAvYmlubWFuL3RpYm9vdDMtYW02Mngt
aHMtZXZtLmJpbi90aS1mcy1lbmMuYmluCj4gPj4gKHRpLXN5c2Z3L3RpLWZzLWZpcm13YXJlLWFt
NjJ4LWhzLWVuYy5iaW4pOgo+ID4+ICAgIE1pc3NpbmcgYmxvYgo+ID4+Cj4gPj4gL2Jpbm1hbi90
aWJvb3QzLWFtNjJ4LWhzLWV2bS5iaW4vc3lzZnctaW5uZXItY2VydAo+ID4+ICh0aS1zeXNmdy90
aS1mcy1maXJtd2FyZS1hbTYyeC1ocy1jZXJ0LmJpbik6Cj4gPj4gICAgTWlzc2luZyBibG9iCj4g
Pj4KPiA+PiBJbWFnZSAndGlib290My1hbTYyeC1ocy1mcy1ldm0uYmluJyBpcyBtaXNzaW5nIG9w
dGlvbmFsIGV4dGVybmFsIGJsb2JzIGJ1dCBpcwo+ID4+IHN0aWxsIGZ1bmN0aW9uYWw6IHRpLWZz
LWVuYy5iaW4gc3lzZnctaW5uZXItY2VydAo+ID4+Cj4gPj4gL2Jpbm1hbi90aWJvb3QzLWFtNjJ4
LWhzLWZzLWV2bS5iaW4vdGktZnMtZW5jLmJpbgo+ID4+ICh0aS1zeXNmdy90aS1mcy1maXJtd2Fy
ZS1hbTYyeC1ocy1mcy1lbmMuYmluKToKPiA+PiAgICBNaXNzaW5nIGJsb2IKPiA+Pgo+ID4+IC9i
aW5tYW4vdGlib290My1hbTYyeC1ocy1mcy1ldm0uYmluL3N5c2Z3LWlubmVyLWNlcnQKPiA+PiAo
dGktc3lzZncvdGktZnMtZmlybXdhcmUtYW02MngtaHMtZnMtY2VydC5iaW4pOgo+ID4+ICAgIE1p
c3NpbmcgYmxvYgo+ID4+Cj4gPj4gSW1hZ2UgJ3RpYm9vdDMtYW02MngtZ3AtZXZtLmJpbicgaXMg
bWlzc2luZyBvcHRpb25hbCBleHRlcm5hbCBibG9icyBidXQgaXMgc3RpbGwKPiA+PiBmdW5jdGlv
bmFsOiB0aS1mcy1ncC5iaW4KPiA+Pgo+ID4+IC9iaW5tYW4vdGlib290My1hbTYyeC1ncC1ldm0u
YmluL3RpLWZzLWdwLmJpbgo+ID4+ICh0aS1zeXNmdy90aS1mcy1maXJtd2FyZS1hbTYyeC1ncC5i
aW4pOgo+ID4+ICAgIE1pc3NpbmcgYmxvYgo+ID4+Cj4gPj4gICBPRkNISyAgIC5jb25maWcKPiA+
Pgo+ID4+IFNvLCB3ZSBzaG91bGQgYWRkIHRpLWszLWJvb3QtZmlybXdhcmUgaW4gZGVwZW5kZW5j
aWVzIHRvIGF2b2lkIGJ1aWxkaW5nCj4gPj4gdGktazMtcjUtbG9hZGVyIGJlZm9yZSB0aS1rMy1i
b290LWZpcm13YXJlLgo+ID4+Cj4gPj4gV2hlbiBidWlsZGluZyB0aGUgQU02IGRlZmNvbmZpZywg
dGhlIGJ1aWxkIG9yZGVyIGlzIG9yZGVyZWQgYWxwaGFiZXRpY2FsbHkgYnkKPiA+PiBkZWZhdWx0
IGFuZCB0aS1rMy1ib290LWZpcm13YXJlIGlzIGluc3RhbGxlZCBiZWZvcmUgdGktazMtcjUtbG9h
ZGVyLgo+ID4+Cj4gPgo+ID4gT0ssIHRoaXMgaXMgYSB2YWxpZCBwb2ludC4gQW55d2F5IHdoYXQg
eW91IHN1Z2dlc3QgZm9yY2Ugc2VsZWN0IG9yIGEKPiA+IGRlcGVuZC4gSWYgeW91IGhhdmUgbW9y
ZSBwb2ludHMsIGlzIGJldHRlciB0byB3cml0ZSBkb3duIGFsbCBvZgo+ID4gdGhlbSBpbiBvbmUg
cmV2aWV3LCBhbmQgbm90IHNwbGl0IGFzIG5vdyBldmVyeSBuZXcgcGF0Y2hlc2V0LiBXaGF0IGRv
IHlvdSB0aGluaz8KPiA+Cj4KPiBJIHJldmlld2VkIHRoZSBzZXJpZXMgYWxyZWFkeSBhbmQgbWFr
ZSBzb21lIHN1Z2dlc3Rpb25zIHRoYXQgd2VyZSBub3QgaW5jbHVkZWQuCj4gU2FtZSBhYm91dCB0
aGUgcmV2aWV3IGZyb20gQnJ5YW4gKHRoaXMgb25lKSBhbmQgQW5kcmVhcyAobWFrZSBIUy1GUyB0
aGUgZGVmYXVsdAo+IGZvciBBTTYyIGFuZCBBTTY0KS4KPgo+IEknbSB3b3JraW5nIG9uIGEgVjEx
IGluY2x1ZGluZyBzb21lIEJ1aWxkcm9vdCByZXdvcmssIHRoZSBCU1AgaXRzZWxmIGlzIG9rLgo+
CgpPaywgdGhpcyB3YXkgeW91IG1ha2UgYWdhaW4gYWxsIHRoZSBwZW9wbGUgdGVzdGluZywgd2hl
biB5b3VyIHBhdGNoZXMKY2FuIGJlIG9uIHRvcCBvZiB0aGlzIHNlcmllcyB0aGF0IGFscmVhZHkK
d2FzIHByb3ZlbiB0aGF0IGl0IHdhcyB3b3JraW5nLiBJdCdzIGV2ZW4gaW1wb3J0YW50IHRoYXQg
eW91IGNvbnNpZGVyCnRoZSBlZmZvcnQgb2YgdGhlIHBlb3BsZSBvbiB0ZXN0aW5nIHNlcmllcyBh
bmQKcGF0Y2hlcyB0aGF0IGFyZSBvbiBnb2luZyBvbiB0aGUgVEkgc2lkZSB0byBpbmNsdWRlIGdw
dS4gSG9wZSB0aGF0CnlvdXIgVjExIHdpbGwgY29tZSBzb29uIGFuZCBub3QgaW5jbHVkZSB0b28g
bWFueSBjaGFuZ2VzLgpBbGwgeW91ciBzdWdnZXN0aW9ucyBjb21lIGZyb20gU29DIG9yIGJvYXJk
cyB0aGF0IGFyZSBub3QgZXZlbgppbmNsdWRlZCBpbiBidWlsZHJvb3QgYW5kIG9uIHBsYXRmb3Jt
cyB3aGVyZSB0aGV5IGFyZSBub3QgeWV0CnN1cHBvcnRlZC4KUGVvcGxlIGFyZSBjb250cmlidXRp
bmcgb24gd2hhdCB0aGV5IGNhbiB0ZXN0IGFuZCBpbmNsdWRlIGFuZCBwYXRjaGVzCnRoYXQgYXJl
IG5vdCBwYXJ0IG9mIGEgc2VyaWVzIHRoYXQgc3RhdGUgdG8gc3VwcG9ydCBzb21lIGFyY2hpdGVj
dHVyZQpzaG91bGQgbm90IGJlIGZvcmNlZCBpbiB0aGUgc2FtZSBzZXJpZXMuIFNvbWV0aW1lcyB3
ZSBjYW4gZXZlbiBhY2NlcHQKdGhhdCBhIHNlcmllcyBpcyBzdXBwb3NlZCB0byBkbyB3aGF0IGlz
IGluIHRoZSBzZXJpZXMgZGVzY3JpcHRpb24uCgpNaWNoYWVsCgoKCj4gQmVzdCByZWdhcmRzLAo+
IFJvbWFpbgo+Cj4KPiA+IE1pY2hhZWwKPiA+Cj4gPj4gQmVzdCByZWdhcmRzLAo+ID4+IFJvbWFp
bgo+ID4+Cj4gPj4KPiA+Pj4KPiA+Pj4gfkJyeWFuCj4gPj4KPiA+Cj4gPgo+CgoKLS0gCk1pY2hh
ZWwgTmF6emFyZW5vIFRyaW1hcmNoaQpDby1Gb3VuZGVyICYgQ2hpZWYgRXhlY3V0aXZlIE9mZmlj
ZXIKTS4gKzM5IDM0NyA5MTMgMjE3MAptaWNoYWVsQGFtYXJ1bGFzb2x1dGlvbnMuY29tCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KCkFtYXJ1bGEgU29sdXRpb25zIEJWCkpvb3Ag
R2Vlc2lua3dlZyAxMjUsIDExMTQgQUIsIEFtc3RlcmRhbSwgTkwKVC4gKzMxICgwKTg1IDExMSA5
MTcyCmluZm9AYW1hcnVsYXNvbHV0aW9ucy5jb20Kd3d3LmFtYXJ1bGFzb2x1dGlvbnMuY29tCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
