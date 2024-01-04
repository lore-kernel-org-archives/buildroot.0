Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05AA3C47077
	for <buildroot@archiver.kernel.org>; Thu,  4 Jan 2024 10:10:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABEDB417F9;
	Thu,  4 Jan 2024 10:10:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABEDB417F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 80DqSaQKiFWX; Thu,  4 Jan 2024 10:10:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEFA24180B;
	Thu,  4 Jan 2024 10:10:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEFA24180B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1AB381BF3D0
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 10:10:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E71AD4180B
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 10:10:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E71AD4180B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qHKp8lFvmX4B for <buildroot@lists.busybox.net>;
 Thu,  4 Jan 2024 10:10:36 +0000 (UTC)
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9731D417F9
 for <buildroot@buildroot.org>; Thu,  4 Jan 2024 10:10:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9731D417F9
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2ccec119587so4050581fa.0
 for <buildroot@buildroot.org>; Thu, 04 Jan 2024 02:10:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704363034; x=1704967834;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l94pug7gxDgGZgm2cgo24P5j1Ulsj6jPe4PhzRoUEx4=;
 b=o0Bfw9xl6iM+u7BP0C4RIQfCp7ajmTKtMv4H6vlL1wxjfa996u9tqgk7dnioD+tW/X
 +w9a9MJDQaGBX+KxYCgCuZPq2VF2gMaoc7sAlDHvcCz37OMkMyRB1VCzgMzGQJ2sCbRf
 u8VOO/GefatGGkJkUdUEewECA29ORic98xonGz33ejhlwR/D5Ihia88QvkNx/vVBf7yr
 ggrxBIM5ZxlRh+08vvQlSL/ybsghZnqoyCWgJG3Zf9a7WPkSYJfy6MAfOX5OLl2plbTH
 VgYplgPaOWsts6i4BN3JOH/zlm3zgSyvZyNqKcXVLdN++v72+pWQVniN2fTTZt49+vP1
 tC5Q==
X-Gm-Message-State: AOJu0Yy+Cu9AMM6OBcLp6L6Y9O7tXiD+a3scWbKUgTzJyWqEevzmhH5G
 cI6eKj5bGbfA0m+eLiWQ9C33YV1Ronbu/cA5S6E=
X-Google-Smtp-Source: AGHT+IEwVEG7+qzE2WC//BUc1lclw0rYD6UH40gKTN9fCuJXcOFBtb+F4RisJnzQEtbHk/UqHiu+/T0twHCiB+RkiRA=
X-Received: by 2002:a05:651c:1308:b0:2cc:b0fe:3d38 with SMTP id
 u8-20020a05651c130800b002ccb0fe3d38mr222809lja.71.1704363033959; Thu, 04 Jan
 2024 02:10:33 -0800 (PST)
MIME-Version: 1.0
References: <20240103173741.850916-1-fontaine.fabrice@gmail.com>
 <20240103173741.850916-2-fontaine.fabrice@gmail.com>
 <20240104105538.36eaf9ef@windsurf>
In-Reply-To: <20240104105538.36eaf9ef@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 4 Jan 2024 11:10:22 +0100
Message-ID: <CAPi7W83sQsbf-_SVva6QFpRhzg-YJ65UwKf+YeU2HRi_GVkt_w@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704363034; x=1704967834; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l94pug7gxDgGZgm2cgo24P5j1Ulsj6jPe4PhzRoUEx4=;
 b=IGTm0qwwI8f1m/5RvY5TPEiQMllF8K0xO06S0OUxnrsaKxxtfWHVrKIdUwiw94YJwY
 oTzmA6nAoOieCeLdZkvxVFsqRkDmsjAVE/N4Vg5d4qWdjO2ddFGRJhV7c9G4cND4qMfq
 xOa/5L4KXKJ2XZPKSRf3iqKVvAjKYevKk0vPEZj+9YKgUIpfDktlexViBCOjjYSivbKd
 5qSfctgIda+05RyikUHVsuSttA0qw3AtO4xd4VZ/Foa2edxqbBZlhxu7ZR7QZToAUbvy
 4+eI+jx5GwYzAsiC36Hm6yDfxwsjnoQxWhejpAy3WzqxCNdyhOLHT6zIS9TKTva2FA0k
 QUHg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IGTm0qww
Subject: Re: [Buildroot] [PATCH v2,
 2/2] package/python-pysensors: add host-lm-sensors dependency
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoKTGUgamV1LiA0IGphbnYuIDIwMjQgw6AgMTA6NTUsIFRob21hcyBQZXRhenpv
bmkKPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IGEgw6ljcml0IDoKPgo+IEhlbGxvIEZh
YnJpY2UsCj4KPiBUaGFua3MgZm9yIHRoZSBwYXRjaC4gU2VlIGJlbG93IHNvbWUgZmVlZGJhY2su
Cj4KPiBPbiBXZWQsICAzIEphbiAyMDI0IDE4OjM3OjQxICswMTAwCj4gRmFicmljZSBGb250YWlu
ZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gPiBob3N0LWxtLXNlbnNv
cnMgaXMgbmVlZGVkIHRvIGV4dHJhY3QgdGhlIHZlcnNpb24gZnJvbSBsaWJzZW5zb3JzLnNvIGFu
ZAo+ID4gYXZvaWQgdGhlIGZvbGxvd2luZyBidWlsZCBmYWlsdXJlIHJhaXNlZCBzaW5jZSB0aGUg
YWRkaXRpb24gb2YgdGhlCj4gPiBwYWNrYWdlIGluIGNvbW1pdCBjOGZmOGQ0MWMwNmY2YjFjYmM1
Y2Y4NzAyYTUxNjQxMTA4NGVhZDE2Ogo+ID4KPiA+ICAgRmlsZSAiL2hvbWUvYnVpbGRyb290L2F1
dG9idWlsZC9pbnN0YW5jZS0yL291dHB1dC0xL2J1aWxkL3B5dGhvbi1weXNlbnNvcnMtMC4wLjQv
c2V0dXAucHkiLCBsaW5lIDMsIGluIDxtb2R1bGU+Cj4gPiAgICAgaW1wb3J0IHNlbnNvcnMKPiA+
ICAgRmlsZSAiL2hvbWUvYnVpbGRyb290L2F1dG9idWlsZC9pbnN0YW5jZS0yL291dHB1dC0xL2J1
aWxkL3B5dGhvbi1weXNlbnNvcnMtMC4wLjQvc2Vuc29ycy9fX2luaXRfXy5weSIsIGxpbmUgMjAs
IGluIDxtb2R1bGU+Cj4gPiAgICAgcmFpc2UgSW1wb3J0RXJyb3IoImNhbid0IGZpbmQgdGhlIHNl
bnNvcnMgbGlicmFyeS4iKQo+ID4KPiA+IEZpeGVzOgo+ID4gIC0gaHR0cDovL2F1dG9idWlsZC5i
dWlsZHJvb3Qub3JnL3Jlc3VsdHMvYWNkODU4M2ZiNjM1ZWEyNzgxMTQwNWEyNDc4MTgyZGRjZDU2
NDJmNwo+Cj4gRG9lcyBweXRob24tcHlzZW5zb3JzIHNldHVwLnB5IHJlYWxseSBuZWVkICB0aGUg
dmVyc2lvbiBvZiB0aGUKPiBsbS1zZW5zb3JzIGxpYnJhcnk/Cj4KPiBJIHNlZSB0aGlzOgo+Cj4g
IyEvdXNyL2Jpbi9lbnYgcHl0aG9uMwo+IGZyb20gc2V0dXB0b29scyBpbXBvcnQgc2V0dXAKPiBp
bXBvcnQgc2Vuc29ycwo+Cj4gc2V0dXAoCj4gICAgIG5hbWU9J1B5U2Vuc29ycycsCj4gICAgIHZl
cnNpb249c2Vuc29ycy5fX3ZlcnNpb25fXywKPiAgICAgYXV0aG9yPXNlbnNvcnMuX19hdXRob3Jf
XywKPiAgICAgYXV0aG9yX2VtYWlsPXNlbnNvcnMuX19jb250YWN0X18sCj4gICAgIHBhY2thZ2Vz
PVsnc2Vuc29ycyddLAo+ICAgICAjIHNjcmlwdHM9W10sCj4gICAgIHVybD0naHR0cDovL3B5cGku
cHl0aG9uLm9yZy9weXBpL1B5U2Vuc29ycy8nLAo+ICAgICAjIGRvd25sb2FkX3VybD0nJywKPiAg
ICAgbGljZW5zZT1zZW5zb3JzLl9fbGljZW5zZV9fLAo+ICAgICBkZXNjcmlwdGlvbj0nUHl0aG9u
IGJpbmRpbmdzIHRvIGxpYnNlbnNvcnMgKHZpYSBjdHlwZXMpJywKPiAgICAgbG9uZ19kZXNjcmlw
dGlvbj1vcGVuKCdSRUFETUUucnN0JykucmVhZCgpLAo+ICAgICBsb25nX2Rlc2NyaXB0aW9uX2Nv
bnRlbnRfdHlwZT0idGV4dC94LXJzdCIsCj4gICAgIGtleXdvcmRzPVsnc2Vuc29ycycsICdoYXJk
d2FyZScsICdtb25pdG9yaW5nJ10sCj4gICAgIGNsYXNzaWZpZXJzPVsKPiAgICAgICAgICdEZXZl
bG9wbWVudCBTdGF0dXMgOjogMyAtIEFscGhhJywKPiAgICAgICAgICdJbnRlbmRlZCBBdWRpZW5j
ZSA6OiBEZXZlbG9wZXJzJywKPiAgICAgICAgICdMaWNlbnNlIDo6IE9TSSBBcHByb3ZlZCcsCj4g
ICAgICAgICAnTGljZW5zZSA6OiBPU0kgQXBwcm92ZWQgOjonCj4gICAgICAgICAnIEdOVSBMZXNz
ZXIgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSB2MiBvciBsYXRlciAoTEdQTHYyKyknLAo+ICAgICAg
ICAgJ09wZXJhdGluZyBTeXN0ZW0gOjogUE9TSVggOjogTGludXgnLAo+ICAgICAgICAgJ1Byb2dy
YW1taW5nIExhbmd1YWdlIDo6IFB5dGhvbicsCj4gICAgICAgICAnUHJvZ3JhbW1pbmcgTGFuZ3Vh
Z2UgOjogUHl0aG9uIDo6IDMnLAo+ICAgICAgICAgJ1Byb2dyYW1taW5nIExhbmd1YWdlIDo6IFB5
dGhvbiA6OiAzLjYnLAo+ICAgICAgICAgJ1Byb2dyYW1taW5nIExhbmd1YWdlIDo6IFB5dGhvbiA6
OiBJbXBsZW1lbnRhdGlvbicsCj4gICAgICAgICAnUHJvZ3JhbW1pbmcgTGFuZ3VhZ2UgOjogUHl0
aG9uIDo6IEltcGxlbWVudGF0aW9uIDo6IENQeXRob24nLAo+ICAgICAgICAgJ1RvcGljIDo6IFN5
c3RlbScsCj4gICAgICAgICAnVG9waWMgOjogU3lzdGVtIDo6IEhhcmR3YXJlJywKPiAgICAgICAg
ICdUb3BpYyA6OiBTeXN0ZW0gOjogTW9uaXRvcmluZycsCj4gICAgIF0sCj4gICAgIHB5dGhvbl9y
ZXF1aXJlcz0iPj0zLjYiLAo+ICkKPgo+IFNvIHRoZSAic2Vuc29ycyIgbW9kdWxlIGlzIG9ubHkg
YmVpbmcgaW1wb3J0ZWQgdG8gZ2V0Cj4gc2Vuc29ycy5fX3ZlcnNpb25fXywgc2Vuc29ycy5fX2F1
dGhvcl9fIGFuZCBzZW5zb3JzLl9fY29udGFjdF9fLAo+IHNlbnNvcnMuX19saWNlbnNlX18sIGFs
bCBvZiB3aGljaCBhcmUgc3RhdGljYWxseSBkZWZpbmVkIGluIHRoZSBzZW5zb3JzCj4gbW9kdWxl
Lgo+Cj4gU28gaW4gcHJhY3RpY2UsIGluIHRoZSBjb250ZXh0IG9mIHNldHVwLnB5LCB0aGlzIGRl
dGVjdGlvbiBvZiB0aGUKPiBsbS1zZW5zb3JzIHZlcnNpb24gaXMgbm90IHVzZWQuIEkgYmVsaWV2
ZToKPgo+IF9fdmVyc2lvbl9fID0gIjAuMC40Igo+IF9fZGF0ZV9fID0gIjIwMTktMDktMTkiCj4g
X19hdXRob3JfXyA9ICJNYXJjICdCbGFja0phY2snIFJpbnRzY2giCj4gX19jb250YWN0X18gPSAn
bWFyY0ByaW50c2NoLmRlJwo+IF9fbGljZW5zZV9fID0gJ0xHUEwgdjIuMScKPgo+IFNob3VsZCBq
dXN0IGJlIG1vdmVkIGRpcmVjdGx5IHRvIHNldHVwLnB5LCBhbmQgc2V0dXAucHkgc2hvdWxkIG5v
dAo+IGltcG9ydCBzZW5zb3JzLiBGcm9tIGEgcXVpY2sgbG9vaywgbm9uZSBvZiB0aG9zZSB2YXJp
YWJsZXMgYXJlIHVzZWQKPiBvdXRzaWRlIG9mIHNldHVwLnB5LiBBbmQgb2YgY291cnNlIHRoaXMg
Y291bGQgYmUgY29udHJpYnV0ZWQgdXBzdHJlYW0sCj4gZXhwbGFpbmluZyB3aHkgImltcG9ydCBz
ZW5zb3JzIiBhdCBzZXR1cCB0aW1lIGlzIG5vdCBnb29kLgoKSW5kZWVkLCB0aGlzIGlzIGEgY2xl
YW5lciBzb2x1dGlvbi4KSG93ZXZlciwgaXQgc2hvdWxkIGJlIG5vdGVkIHRoYXQgdXBzdHJlYW0g
aXMgZGVhZDogbGF0ZXN0IHZlcnNpb24gaXMKZnJvbSAyMDE5IGFuZCBzb3VyY2UgY29kZSByZXBv
c2l0b3J5IGdpdmVuIG9uCmh0dHBzOi8vcHlwaS5vcmcvcHJvamVjdC9QeVNlbnNvcnMvIGlzIHVu
cmVhY2hhYmxlLgoKPgo+IFRob21hcwo+IC0tCj4gVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIg
YW5kIENFTywgQm9vdGxpbgo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcg
YW5kIHRyYWluaW5nCj4gaHR0cHM6Ly9ib290bGluLmNvbQoKQmVzdCBSZWdhcmRzLAoKRmFicmlj
ZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
