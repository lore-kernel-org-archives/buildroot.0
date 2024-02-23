Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF39C54798
	for <buildroot@archiver.kernel.org>; Fri, 23 Feb 2024 11:13:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98FAD835C8;
	Fri, 23 Feb 2024 11:13:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l-fcLZbog8Og; Fri, 23 Feb 2024 11:13:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEF0A832D9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEF0A832D9;
	Fri, 23 Feb 2024 11:13:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 508461BF239
 for <buildroot@lists.busybox.net>; Fri, 23 Feb 2024 11:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A85841C5B
 for <buildroot@lists.busybox.net>; Fri, 23 Feb 2024 11:13:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id peBzNeNGYUrA for <buildroot@lists.busybox.net>;
 Fri, 23 Feb 2024 11:13:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b33; helo=mail-yb1-xb33.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 30CA840320
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 30CA840320
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 30CA840320
 for <buildroot@buildroot.org>; Fri, 23 Feb 2024 11:13:04 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-dc236729a2bso673875276.0
 for <buildroot@buildroot.org>; Fri, 23 Feb 2024 03:13:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708686784; x=1709291584;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wwlYkJ4eDAF+EBjuktCsLUz+6yqOYfQiyqzpiOb+f+E=;
 b=LxQIk/SYrigW2J8KXQlyrTFxB+kEVgTITux3uLQ8ideFi3nkVh1mmneOVwh84zNnzD
 WvMKiGRHgA5qU3IH7FqygwyQY2P8CQ/v8rAM6kmH7kH0BHpSRdYh6PXA6u5cKjHhDRYV
 fMbmtTkgFc7yckAJ18lyCSqWfR2y8HnYi6IGPth+zDSoBdW22NXDwUuFNfnp7evUOz3y
 FJTcj2rTmq+od8lWSanycaad2s7UTy9GhGWhlhKSgIBicjuxyP/2l1Uq2RINAYtEIMep
 w/hs3kFXSykxy9PZdAYRg+HG+qi3OLd3+PpAXwuz6rgh2Td35G60aXxNfm46T1wZKZ1R
 Uo3A==
X-Gm-Message-State: AOJu0YzqSFCVZvwdXzSgQ798qPiUVsbNB5WeDFgOpQIasHbtPWr2pwNP
 lg25ioq3zOEZEe5/GyPSjQU63Drn78yidYQz5Zf3Mbb+JhpvJG/XAw3pXM6BIO6HgOC6hnVyWGp
 JlWOFsxvdbOrDIqtC0O+rsydrYMQaiZJ+3CjPhA==
X-Google-Smtp-Source: AGHT+IE3bA6W7fKeuHiYL1UFPRYSj2Q7VS8HXNWv0Rhx6eY2y6LWzMkfInqXUwygg7ODgQfgeLvLyFq7VOKfkeoEa/E=
X-Received: by 2002:a25:9c87:0:b0:dcd:5bdb:4aa4 with SMTP id
 y7-20020a259c87000000b00dcd5bdb4aa4mr1594223ybo.51.1708686783848; Fri, 23 Feb
 2024 03:13:03 -0800 (PST)
MIME-Version: 1.0
References: <20240222101617.18422-1-dario.binacchi@amarulasolutions.com>
 <20240222101617.18422-15-dario.binacchi@amarulasolutions.com>
 <62b63f26-4e2e-4538-a422-bc7f7e131fb9@smile.fr>
In-Reply-To: <62b63f26-4e2e-4538-a422-bc7f7e131fb9@smile.fr>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 23 Feb 2024 12:12:53 +0100
Message-ID: <CABGWkvrYGNUC0mAeNBGSm9FY8=kfq+FGKawuM1AuPzzjDsbUOA@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708686784; x=1709291584;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wwlYkJ4eDAF+EBjuktCsLUz+6yqOYfQiyqzpiOb+f+E=;
 b=QXk+T39UZSJCTPPbXiyFAJ2A+mqKHRhwKOHOWFFZ4Bra6+5iGYtDFL7tcQ3gR3dJVj
 uxOlW62L38AYW5DxVwPHuWjjM8s0toAgaLlfWQ3OWtEYBe77Nky9blW21wpVIrqxtibO
 PyuyfGAdTIHH4UQyZST7Y1eEOaSkkKryH5rj4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=QXk+T39U
Subject: Re: [Buildroot] [PATCH v5 14/16] boot/ti-k3/ti-k3-r5-loader:
 install tiboot3.bin
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

SGkgUm9tYWluLAoKT24gVGh1LCBGZWIgMjIsIDIwMjQgYXQgMTE6NDnigK9QTSBSb21haW4gTmFv
dXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4gd3JvdGU6Cj4KPiBIZWxsbyBEYXJpbywKPgo+IExl
IDIyLzAyLzIwMjQgw6AgMTE6MTYsIERhcmlvIEJpbmFjY2hpIGEgw6ljcml0IDoKPiA+IFJlY2Vu
dCB2ZXJzaW9ucyBvZiBVLUJvb3QgYXJlIGNhcGFibGUgb2YgYnVpbGRpbmcgdGlib290My5iaW4g
dXNpbmcKPiA+IEJpbm1hbi4gSW4gdGhpcyBjYXNlLCBsZXQncyBjb3B5IGl0IHRvIHRoZSBiaW5h
cmllcyBkaXJlY3RvcnkuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogRGFyaW8gQmluYWNjaGkgPGRh
cmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+ID4KPiA+IC0tLQo+ID4KPiA+IENo
YW5nZXMgaW4gdjU6Cj4gPiAtIFJlcGxhY2UgdGlib290My0qLSQoVElfSzNfUjVfTE9BREVSX1NF
Q1RZUEUpLSouYmluIHdpdGgKPiA+ICAgdGlib290My0kKFRJX0szX1I1X0xPQURFUl9TT0MpLSQo
VElfSzNfUjVfTE9BREVSX1NFQ1RZUEUpLSouYmluCj4gPgo+ID4gQWRkZWQgaW4gdjQKPiA+Cj4g
PiAgYm9vdC90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVyLm1rIHwgNCArKysrCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9ib290
L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIubWsgYi9ib290L3RpLWszLXI1LWxvYWRl
ci90aS1rMy1yNS1sb2FkZXIubWsKPiA+IGluZGV4IGZkYjA1OGYzYjcyYS4uZTBjNGM5MmJkNGNj
IDEwMDY0NAo+ID4gLS0tIGEvYm9vdC90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVyLm1r
Cj4gPiArKysgYi9ib290L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIubWsKPiA+IEBA
IC03MCw4ICs3MCwxMiBAQCBkZWZpbmUgVElfSzNfUjVfTE9BREVSX0JVSUxEX0NNRFMKPiA+ICAg
ICAgICQoVEFSR0VUX0NPTkZJR1VSRV9PUFRTKSAkKFRJX0szX1I1X0xPQURFUl9NQUtFKSAtQyAk
KEBEKSAkKFRJX0szX1I1X0xPQURFUl9NQUtFX09QVFMpCj4gPiAgZW5kZWYKPiA+Cj4gPiArVElf
SzNfUjVfTE9BREVSX1NFQ1RZUEUgPSAkKGNhbGwgcXN0cmlwLCQoQlIyX1BBQ0tBR0VfVElfSzNf
U0VDVFlQRSkpCj4gPiArVElfSzNfUjVfTE9BREVSX1NPQyA9ICQoY2FsbCBxc3RyaXAsJChCUjJf
UEFDS0FHRV9USV9LM19TT0MpKQo+ID4gKwo+ID4gIGRlZmluZSBUSV9LM19SNV9MT0FERVJfSU5T
VEFMTF9JTUFHRVNfQ01EUwo+ID4gICAgICAgY3AgJChARCkvc3BsL3UtYm9vdC1zcGwuYmluICQo
QklOQVJJRVNfRElSKS9yNS11LWJvb3Qtc3BsLmJpbgo+ID4gKyAgICAgZmluZCAkKEBEKSAtbmFt
ZSAidGlib290My0kKFRJX0szX1I1X0xPQURFUl9TT0MpLSQoVElfSzNfUjVfTE9BREVSX1NFQ1RZ
UEUpLSouYmluIiAtdHlwZSBmIC1leGVjIGNwIHt9ICQoQklOQVJJRVNfRElSKS90aWJvb3QzLmJp
biBcOwo+Cj4gSSBkb24ndCB0aGluayAiZmluZCIgaXMgbmVlZGVkIGhlcmUgc2luY2Ugd2Ugc2hv
dWxkIGNvcHkgb25seSBvbmUgZmlsZSB0bwo+ICQoQklOQVJJRVNfRElSKS90aWJvb3QzLmJpbgoK
Q2FuIGl0IGJlIG9rPwoKLSAgICAgICBmaW5kICQoQEQpIC1uYW1lCiJ0aWJvb3QzLSQoVElfSzNf
UjVfTE9BREVSX1NPQyktJChUSV9LM19SNV9MT0FERVJfU0VDVFlQRSktKi5iaW4iCi10eXBlIGYg
LWV4ZWMgY3Age30gJChCSU5BUklFU19ESVIpL3RpYm9vdDMuYmluIFw7CisgICAgICAgY3AgJChA
RCkvdGlib290My0kKFRJX0szX1I1X0xPQURFUl9TT0MpLSQoVElfSzNfUjVfTE9BREVSX1NFQ1RZ
UEUpLSouYmluCiQoQklOQVJJRVNfRElSKS90aWJvb3QzLmJpbgoKSSB0ZXN0ZWQgaXQgYW5kIEl0
IHdvcmtzLgoKVGhhbmtzIGFuZCBSZWdhcmRzLApEYXJpbwoKPgo+Cj4KPiA+ICBlbmRlZgo+ID4K
PiA+ICAkKGV2YWwgJChrY29uZmlnLXBhY2thZ2UpKQo+CgoKLS0gCgpEYXJpbyBCaW5hY2NoaQoK
U2VuaW9yIEVtYmVkZGVkIExpbnV4IERldmVsb3BlcgoKZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNv
bHV0aW9ucy5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KCgpBbWFydWxh
IFNvbHV0aW9ucyBTUkwKClZpYSBMZSBDYW5ldmFyZSAzMCwgMzExMDAgVHJldmlzbywgVmVuZXRv
LCBJVAoKVC4gKzM5IDA0MiAyNDMgNTMxMAppbmZvQGFtYXJ1bGFzb2x1dGlvbnMuY29tCgp3d3cu
YW1hcnVsYXNvbHV0aW9ucy5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
