Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D113C27C6E
	for <buildroot@archiver.kernel.org>; Fri, 14 Jun 2024 22:12:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4027841745;
	Fri, 14 Jun 2024 22:12:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XaiRPFOz7tKg; Fri, 14 Jun 2024 22:12:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 833C441731
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 833C441731;
	Fri, 14 Jun 2024 22:12:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B99FB1BF31C
 for <buildroot@lists.busybox.net>; Fri, 14 Jun 2024 22:12:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A77916069C
 for <buildroot@lists.busybox.net>; Fri, 14 Jun 2024 22:12:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T7vg8Lu5UzZc for <buildroot@lists.busybox.net>;
 Fri, 14 Jun 2024 22:12:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::82e; helo=mail-qt1-x82e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 79BF860671
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79BF860671
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 79BF860671
 for <buildroot@buildroot.org>; Fri, 14 Jun 2024 22:12:13 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id
 d75a77b69052e-440609dd118so13034561cf.1
 for <buildroot@buildroot.org>; Fri, 14 Jun 2024 15:12:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718403132; x=1719007932;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QcKyya641D6jpNdaVj+vjzU8OUTJkuavVdTZjjA8Cqc=;
 b=jBKLptGk30eAxJLrt8GdC2c6bXJ60RSxoe18vwZDplxEakQOpIznPqWfbkJoK3wGLH
 2MZGM/2c58l8XUjdZh1PpuDzmrS2pLOk7CAmdb97+cv3I4A6Vht3ChXER0aqimAo+M4x
 NYD+716mjc9clQCYjz6QieYQ9sFvaYTnCF0zRajUx7FX5K5ZbIIh+dDdr1kpCuDylpKR
 w24q+aE5s/ldpP+4+vPNoFecAyNoe3/QQ720X5rH1kvlg85PX652Gro7psXDRdCeyBdL
 zl5CcGGsG+Kl1GgcFeMfGtTZZ/HN/D1MVtvhFowwb3gj6+KSKn6T3U/Bo1PJg3/ohj61
 FKLw==
X-Gm-Message-State: AOJu0Yz5FL84V1WXewqqiWoDDFyGWtNKufscQeGWkBw60gy/JO4PUuVk
 HqmFCEfHz5rYT0EA8VJMmULrMntVoqWMmrezmCd0WKRb27CiOtRYgJ34onWmzUDLOt6FiVsJ6QK
 UOQzwSCf6ElazqmVRPIh/uP0MVW5358Ou
X-Google-Smtp-Source: AGHT+IE1X45UF/KbrA5eS5y8j9TftAHnpsIPKY4Y+BULxKZuy61CR+4+0JjzbZ9iA+kwbT3PaffeBmsQGlsh/o1RkAo=
X-Received: by 2002:ac8:5ad4:0:b0:441:3ce:f012 with SMTP id
 d75a77b69052e-44216b1c049mr42756431cf.46.1718403132055; Fri, 14 Jun 2024
 15:12:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1718382114.git.yann.morin.1998@free.fr>
 <cea1e19d0c970055e04dbdbcfd7f1c74d2f4d694.1718382114.git.yann.morin.1998@free.fr>
 <Zmx-y2XW4ygziuh0@landeda>
 <CADvTj4q7pj+omVnVUgyA1OPX5+wvY9v18qi=8VVJ61SuUFQ+ow@mail.gmail.com>
 <Zmyt6DHL6Km2pj_i@landeda>
In-Reply-To: <Zmyt6DHL6Km2pj_i@landeda>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 14 Jun 2024 16:12:00 -0600
Message-ID: <CADvTj4puAf0k3wfZfza8Uv68sa_2G1kjWuPiXSDFUtgjP-K=Qw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718403132; x=1719007932; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QcKyya641D6jpNdaVj+vjzU8OUTJkuavVdTZjjA8Cqc=;
 b=QCJXpI4mTqAtu7FzkTXiKImoNWIrpbhuHVHOGMG8TgPPMXgsRGfSRxCEWLGGM2pGdm
 2vungmxfF4pkkqwmOlSG/5WvWU7rxKXIWREyk5qoyNpJitu94tc+uaiV3nFQHP6yI6rd
 mbPfovrLAVXad5BH/o3d1M2YJGNxl8nHLvEw9PV5EAx/Yc5dCn6/v4bsS6mk6emVW4+M
 +KY2NXTb9tZKH4KpDyJHCRZjrj7fyQ1buD2clktH2qT0aNNEDqaxD0yXZ9IqOTUoEVd/
 NkBNGSW6sp82OhjZdr6u6QAtTcCR/sk8dWQeQwAOblx5c3W4FD6b9+sS/CbpouonB5F6
 NqVw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QCJXpI4m
Subject: Re: [Buildroot] [PATCH 5/6] package/python-pydantic-core: bump for
 fixes with python 3.12
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCBKdW4gMTQsIDIwMjQgYXQgMjo1NOKAr1BNIFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9y
aW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPgo+IEphbWVzLCBBbGwsCj4KPiBPbiAyMDI0LTA2LTE0
IDEyOjAzIC0wNjAwLCBKYW1lcyBIaWxsaWFyZCBzcGFrZSB0aHVzbHk6Cj4gPiBPbiBGcmksIEp1
biAxNCwgMjAyNCBhdCAxMTozM+KAr0FNIFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBm
cmVlLmZyPiB3cm90ZToKPiA+ID4gT24gMjAyNC0wNi0xNCAxODoyMSArMDIwMCwgWWFubiBFLiBN
T1JJTiBzcGFrZSB0aHVzbHk6Cj4gPiA+ID4gVGhlIHBhY2thZ2UgaXMgbm90IHlldCBhdmFpbGFi
bGUgb24gUHlQSSwgc28gZ28gZmV0Y2ggaXQgYXQgdGhlIHNvdXJjZS4KPiA+ID4gQW5kIGV2ZW4g
dGhvdWdoIGl0IG5vdyBpcyBvbiBQeVBJLCBJIGFtIHN0aWxsIG9mIHRoZSBvcGluaW9uIHRoYXQs
IHdoZW4KPiA+ID4gdGhlIG9mZmljaWFsIHVwc3RyZWFtIHJlcG8gaXMgdXNhYmxlIGFzLWlzLCBp
dCBpcyBiZXR0ZXIgdG8gdXNlIHRoZQo+ID4gPiBzb3VyY2VzIGZyb20gdGhlcmUgdGhhbiBmcm9t
IHRoZSBwYWNrYWdlIG9uIFB5UEksIGZvciB3aGljaCB3ZSBoYXZlIG5vCj4gPiA+IHdheSB0byBr
bm93IGhvdyBpdCBoYXMgYmVlbiBnZW5lcmF0ZWQuIFdlIHNob3VsZCBvbmx5IHJlbHkgb24gZmV0
Y2hpbmcKPiA+ID4gZnJvbSBQeVBJIHRob3MgcGFja2FnZXMgZm9yIHdoaWNoIHRoZSB1cHN0cmVh
bSBzb3VyY2VzIGFyZSBub3QgZW5vdWdoCj4gPiA+IChlLmcuIG5lZWRzIGhlYXZ5IHRvb2xpbmcg
dGhhdCB3ZSBsYWNrKS4KPiA+Cj4gPiBJJ20gbm90IHN1cmUgd2h5IGl0IHdvdWxkIG1ha2Ugc2Vu
c2UgdG8gcHJlZmVyIGdpdCBzb3VyY2VzIGZvciBQeVBpCj4gPiBwYWNrYWdlcyB3aGVuIHdlIHBy
ZWZlciByZWxlYXNlIHRhcmJhbGxzIGZvciBub24tUHlQaSBwYWNrYWdlcwo+Cj4gRm9yIGdpdC1o
b3N0ZWQgcGFja2FnZXMgd2hlcmUgdGhlcmUgaXMgdGhlIHBvc3NpYmlsaXR5IHRvIHVzZSBhIHJl
bW90ZWx5Cj4gZ2VuZXJhdGVkIHRhcmJhbGwsIEkgc3RpbGwgdGhpbmsgKGFuZCBhbHdheXMgc2Fp
ZCBzbykgdGhhdCBpdCB3YXMgYW4KPiBlcnJvciB0byBkbyBzby4gSW5kZWVkLCB3ZSBoYXZlIGFs
cmVhZHkgaGFkIGF0IGxlYXN0IHRocmVlIGtub3duIGNhc2VzCj4gd2hlcmUgdGhlIHJlbW90ZSBm
b3JnZSBhY3R1YWxseSBjaGFuZ2VkIHRoZSB3YXkgdGhlIGFyY2hpdmVzIHdlcmUKPiBnZW5lcmF0
ZWQsIGFuZCBfdGhhdF8gYnJva2Ugb3VyIGhhc2hlcyAoYXMgd2VsbCBhcyBldmVyeWJvZHkgZWxl
c2Uncyk7Cj4gYW5kIHdlIGFyZSBhdCB0aGUgbWVyY3kgb2Ygc3VjaCBjaGFuZ2VzIGluIHRoZSBm
dXR1cmUuIEV2ZW4gaWYgYSBmb3JnZQo+IGRvZXMgbm90IGNoYW5nZSBpdHMgdGFyYmFsbCBnZW5l
cmF0aW9uIG1lY2hhbmlzbSwgaXQgaXMgc3RpbGwgcG9zc2libGUKPiB0aGF0IGFyY2h2aWUgZ2Vu
ZXJhdGVkIGJ5IGdpdCBjaGFuZ2U7IG9uZSBzdWNoIGNhc2UgaXMgd2hlbiBhIHJlcG9zaXRvcnkK
PiBhaHMgYSBmaWxlIGhhcyB0aGUgZ2l0IGF0dHJpYnV0ZSBleHBvcnQtc3Vic3QgYW5kIHVzZXMg
dGhlICVoCj4gKGFiYnJldmlhdGVkIGNvbW1pdCBoYXNoKSBwbGFjZWhvbGRlciwgd2hlcmUgZ2l0
IG1heSBkZWNpZGUgdG8gaW5jcmVhc2UKPiB0aGUgbGVuZ3RoIG9mIHRoZSBzaG9ydCBoYXNoIHRv
IGF2b2lkIGNvbGxpc2lvbiB3aGVuIHRoZSByZXBvc2l0b3J5Cj4gZ3Jvd3MuLi4KCk5vdGUgdGhh
dCBQeVBpIHRhcmJhbGxzIGFyZSBub3QgZ2VuZXJhdGVkIGJ5IHRoZSByZW1vdGUgbGlrZSB0aGlz
LiBUaGV5CmFyZSB1cGxvYWRlZCB0byBQeVBpIGJ5IHRoZSBtYWludGFpbmVycyBvZiB0aGUgaW5k
aXZpZHVhbCBwYWNrYWdlcy4KCj4KPiBJbnN0ZWFkLCB3ZSBzaG91bGQgaGF2ZSBhbHdheXMgdXNl
ZCBnaXQtY2xvbmUgYW5kIHJlbHkgb24gb3VyIGFyY2hpdmUKPiBoZWxwZXJzLiBUcnVlIHRoYXQg
d2UgZGlkIGNoYW5nZSB0aGVtLCBhbmQgdGhhdCB3ZSBoYWQgdG8gaW50cm9kdWNlCj4gYXJjaHZp
ZSBmb3JtYXQgdmVyc2lvbnMsIGJ1dCBmb3IgYSBnaXZlbiB2ZXJzaW9uIG9mIEJ1aWxkcm9vdCwg
aXQgd2FzCj4gcGVyZmVjdGx5IHN0YWJsZS4KPgo+ID4gYXMKPiA+IFB5UGkgc2Rpc3QgdGFyYmFs
bHMgYXJlIGVmZmVjdGl2ZWx5IHJlbGVhc2UgdGFyYmFsbHMuCj4KPiBFeGNlcHQgd2hlbiB0aGV5
IGFyZSBub3QsIGJlYXVzZSB0aGV5IHN0aWxsIG5lZWQgdG8gYmUgdmVuZG9yZWQgd2hlbgo+IHRo
ZXkgaGF2ZSBydXN0IGNvZGUgaW4gdGhlcmUuIEJ1dCB0aGF0J3Mgbm90IHRoZSBhY3R1YWwgaXNz
dWUgSSBoYXZlLi4uCgpZZWFoLi4uaXQgd291bGQgYmUgZ29vZCBpZiBtYWludGFpbmVycyB3b3Vs
ZCB1cGxvYWQgdmVuZG9yZWQgcnVzdCBjb2RlCmluIHRoZWlyIFB5UGkgc2Rpc3RzLgoKPgo+IFNv
bWUgaGF2ZSBhbHNvIGhhZCB2YXJpb3VzIG1hbmdsaW5nIGRvbmUsIGFuZCB0aHVzIG9uZSBoYXMg
bm8gaWRlYSBob3cKPiB0aGUgb2ZmaWNpYWwgc291cmNlIHJlcG9zaXRvcnkgY2FuIGJlIHVzZWQg
dG8gZ2VuZXJhdGUgdGhlICJzZGlzdCIgYW5kCj4gdGhlbiB5b3UgbWlnaHQgZ2V0IGluIGxlZ2Fs
IHRyb3VibGUgYmVjYXVzZSB3aGF0IHlvdSBiZWxpZXZlIGlzIHNvdXJjZQo+IGlzIGFjdHVhbGx5
IG5vdCBzb3VyY2UgYnV0IGdlbmVyYXRlZCBjb2RlIGZvciB3aGloY2ggdGhlIGFjdHVhbCBzb3Vy
Y2UKPiBpcyBub3QgYXZhaWFsYmxlLCBhbmQgdGhlbiB5b3UgbWlnaHQgZ2V0IGluIGJyZWFjaCBv
ZiB0aGUgbGljZW5zZSB3aGVuCj4geW91IGRpc3RyaWJ1dGUgdGhhdC4uLgo+Cj4gVGhhdCBpcyBh
bHNvIHRydWUgZm9yIG90aGVyIHRhcmJhbGxzLCBhcyB5b3UgbWVudGlvbiwgYnV0IHRoaXMgaXMg
bXVjaAo+IGxlc3Mgb2Z0ZW4gdGhlIGNhc2U7IHRoZSBvbmx5IHJlbGVhc2UgdGFyYmFsbCBmb3Ig
YW4gYXV0b3Rvb2xzIHBhY2thZ2UKPiB0aGF0IEkgcmVtZW1iZXIgb2YsIHRoYXQgaGFkIHN1Y2gg
YW4gaXNzdWUsIHdlcmUgYSBmZXcgYmludXRpbHMgdmVyc2lvbnMKPiB3ZXJlIHRoZXkgaW5jbHVk
ZWQgYSBnZW5lcmF0ZWQgZmlsZSB3aXRob3V0IGl0cyBzb3VyY2UsIGFuZCB0aGF0IHdhcyBhbgo+
IG92ZXJzaWdodCwgbm90IGRvbmUgb24gcHVycG9zZSwgYW5kIHRoZXkgZml4ZWQgaXQgKHRoYXQg
Y2F1c2VkIHF1aXRlIGEKPiBtZXNzKS4uLgo+Cj4gPiBPbmUgYWR2YW50YWdlIHRvIHVzaW5nIFB5
UGkgcmVsZWFzZXMgaXMgeW91IGF2b2lkIGlzc3VlcyB3aXRoIGhhc2gncwo+ID4gY2hhbmdpbmcg
ZHVlLgo+Cj4gV2hlbiB3ZSBjaGFuZ2Ugb3VyIGRvd25sb2FkIGhlbHBlcnMsIHdlIGFyZSByZXNw
b25zaWJsZSBmb3IgdGhlIGNoYW5nZQo+IGluIGhhc2hlcywgc28gd2UgY2FuIHBsYW4gZm9yIGl0
LiBBcyBJIHNhaWQgYWJvdmUsIGZvciBhIGdpdmVuIHZlcnNpb24KPiBvZiBCdWlsZHJvb3QsIHRo
ZW4gYXJjaGl2ZXMgYXJlIHJlcHJvZHVjaWJsZTsgaXQncyBvbmx5IHdoZW4gX3dlXyBkZWNpZGUK
PiB0byBjaGFuZ2Ugb3VyIGhlbHBlcnMgdGhhdCB3ZSBoYXZlIHRvIHVwZGF0ZSB0aGUgaGFzaGVz
LiBBRkFJQ1MsIHRoZXIKPiBlaXMgbm90aGluZyB0aGF0IHdvdWxkIHByZXZlbnQgYSBwYWNrYWdl
ciB0byBwdXNoIGFuIHVwZGF0ZWQgYXJjaGl2ZSB0bwo+IHJlcGxhY2UgYW4gZXhpc3Rpbmcgb25l
IG9uIFB5UEksIHRodXMgYWN0dWFsbHkgYnJlYWtpbmcgdGhlIGhhc2ggd2l0aG91dAo+IGFueSBy
ZXNvcnQgb24gb3VyIHNpZGUgdG8gd29rcmthcm91bmQgdGhhdC4KClB5UGkgZG9lcyBub3QgYWxs
b3cgcmVwbGFjaW5nIGV4aXN0aW5nIGFyY2hpdmVzLCBhcyB0aGUgdXJsIGNvbnRhaW5zIGEgaGFz
aAphbmQgZ3VhcmFudGVlcyB0aGF0IGRvd25sb2FkIFVSTHMgZm9yIGluZGl2aWR1YWwgZmlsZXMg
d2lsbCBuZXZlciBjaGFuZ2UuCgpTZWU6Cmh0dHBzOi8vd2FyZWhvdXNlLnB5cGEuaW8vYXBpLXJl
ZmVyZW5jZS9pbnRlZ3JhdGlvbi1ndWlkZS5odG1sI3F1ZXJ5aW5nLXB5cGktZm9yLXBhY2thZ2Ut
dXJscwoKPgo+IEFzIEkgc2FpZCBlYXJsaWVyLCB0aGUgb25seSBjYXNlIHdoZXJlIGl0IHdvdWxk
IGJlIGFuIGFjY2VwdGJsZQo+IGxhc3QtcmVzb3J0LCB3b3VsZCBiZSB3aGVuIHRoZSBhcmNoaXZl
IG9uIFB5UEkgY29udGFpbnMgX2FkZGl0aW9uYWxfCj4gZGF0YSB0aGF0IHdhcyBnZW5lcmF0ZWQg
d2l0aCBoZWF2eSB0b29saW5nIHRoYXQgd2UgbGFjayAoYW5kIGNhbid0Cj4gZWFzaWx5IHBhY2th
Z2UgaW4gQnVpbGRyb290KS4KPgo+IFJlZ2FyZHMsCj4gWWFubiBFLiBNT1JJTi4KPgo+IC0tCj4g
Li0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0t
LS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KPiB8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBF
bWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAo+IHwgKzMz
IDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBf
X18gICAgICAgICAgICAgICB8Cj4gfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0t
LS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKPiB8IGh0dHA6Ly95
bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBj
b25zcGlyYWN5LiAgfAo+ICctLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4t
LS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
