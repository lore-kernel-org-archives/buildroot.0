Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1088D5B156
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 20:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EBDF6077B;
	Mon, 28 Oct 2024 20:55:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PCKKFsB2y2HS; Mon, 28 Oct 2024 20:55:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7008F60736
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7008F60736;
	Mon, 28 Oct 2024 20:55:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A28654EC0
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:55:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9078740245
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:55:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yb3S08KiIuvW for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 20:55:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a29; helo=mail-vk1-xa29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 61AFF40241
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61AFF40241
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com
 [IPv6:2607:f8b0:4864:20::a29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 61AFF40241
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:55:02 +0000 (UTC)
Received: by mail-vk1-xa29.google.com with SMTP id
 71dfb90a1353d-50c9f4efd09so1451056e0c.2
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 13:55:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730148901; x=1730753701;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7V/xMBnhPOmTMmh55ZXW95bIDxhIN7qJTRHMiRQ+UO8=;
 b=W9mxmt2g5inWqYusvfi5Lwjr5/srFkHfjOdVNypxEQzBtwP//I/HO1obAaWIbXOzHl
 T8sWcqDXGqvRKvGJGh/EcuXhmt/vtupYL1DWtoG1rMn1NHQ2T7EH+l1jLoCMmVHJzS4O
 p3/ccUmqN35iZ9blA7j60VdMZoF37lLD2nRprZTyU4F5NX/vdSnn0QLtnRUZ7zfmgPmH
 9TMF5cN0RpqGyyESIviKG2ogTP1xCWuKPTOJ52c1gykMeFj28BbKa6BSjhwZAxfNyNrZ
 g6WcK8K14/K68aquaiblBxR15LcshnBLTbxvPdqLLF5gcsd31orL8i4s3uK7FY4j44wo
 9hFA==
X-Gm-Message-State: AOJu0YxT2pzqZ8TM7+MaRRZOkqIyJAw2jmAYx4sPGSefEkz5mfcfO1vo
 r5a/qopgkB08LN+7VovVuXu4ZEd161CzGVoPuxdxZSSlfS4DZsh7nYy+8Sc6rRfvw43is4nOL7v
 jck+56iIs6VRY/tNF0sbgaC1dCN0=
X-Google-Smtp-Source: AGHT+IEhJAsxmfLI3we9O7Y2OxOlLwFis9KqLfwrA7pYW3QVd+ccMgT1xSOCMJMpajHKxneoMO2cRKn1sjeEmKBb0po=
X-Received: by 2002:a05:6122:2393:b0:510:185:5d89 with SMTP id
 71dfb90a1353d-5101511c220mr6103072e0c.12.1730148901065; Mon, 28 Oct 2024
 13:55:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240924023919.1502635-1-james.hilliard1@gmail.com>
 <20241026162759.0100482f@windsurf>
 <CADvTj4poUTwYNeVK63EkZHKyYZ9BWAnVMNv9jOxcd-0guH+wAQ@mail.gmail.com>
 <20241028211103.67456028@windsurf>
 <CADvTj4pKGh1-PxmuCvOFcV4Vw2hREChCj4Q3FAgS=kicuHJpHQ@mail.gmail.com>
 <20241028215359.048d4733@windsurf>
In-Reply-To: <20241028215359.048d4733@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 28 Oct 2024 14:54:49 -0600
Message-ID: <CADvTj4pCpCjJgQAcuvKqf-bokZCnUujGVeio+=5Je1LFNwn9Rw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Kamel Bouhara <kamel.bouhara@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, 
 Asaf Kahlon <asafka7@gmail.com>, Julien Olivain <ju.o@free.fr>, 
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Christian Stewart <christian@aperture.us>, 
 Robert Rose <robertroyrose@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730148901; x=1730753701; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7V/xMBnhPOmTMmh55ZXW95bIDxhIN7qJTRHMiRQ+UO8=;
 b=G097A7wxSq0GGYiViavOxfQggp684oFyYKYrGgWE2LR5O8jYqwGN9f3WE9nZXJJ0gg
 59L+3lZrH6IG/Cl5tpbvhqgv/DavGls9ha5YOOLTEfJ+IpBdGK/wrbNCpxN+xE7s1U9T
 HCmT9zGUrC2QtIDD/grhw5mtZ5qu5leD5T8JzMuD+v9IuT7I0bm6qkxlu/WfLbO3Nbou
 6oNaMdrN04FofxXBU4MIt7G7255l54eA+3yv1ZKcOVBhzL+mlkp9Xxi8HnQLhmgUA7e9
 t6By/O0uJf/0OBFdMmg2LTLUCuJnN5eKI+v8KZXImFRXR2mMTjo1PvbKJfQPwHFAhQDS
 pK6A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=G097A7wx
Subject: Re: [Buildroot] [PATCH v2 1/3] package/{python-}protobuf: bump to
 version 28.1
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

T24gTW9uLCBPY3QgMjgsIDIwMjQgYXQgMjo1NOKAr1BNIFRob21hcyBQZXRhenpvbmkKPHRob21h
cy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCAyOCBPY3QgMjAyNCAx
NDoyMToyMSAtMDYwMAo+IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29t
PiB3cm90ZToKPgo+ID4gPiBXaGljaCBvZiB0aGUgdHdvIGlzc3VlcyBpcyB0aGlzIGZpeGluZz8g
SSB3YXMgcmVwb3J0aW5nIGEgYnVpbGQKPiA+ID4gZmFpbHVyZSwgYW5kIE1pY2hhZWwgTm9zdGhv
ZmYgd2FzIHJlcG9ydGluZyBhIGJ1aWxkIGhhbmcgaW4gcGtnLWNvbmZpZy4KPiA+Cj4gPiBUaGlz
IGZpeGVzIHRoZSBidWlsZCBmYWlsdXJlIHlvdSByZXBvcnRlZCwgdXBkYXRpbmcgcGtnY29uZiBm
aXhlcyB0aGUgYnVpbGQKPiA+IGhhbmcuCj4KPiBTbyB0aGlzIHNlcmllcyBkZXBlbmRzIG9uIHRo
ZSBwa2ctY29uZmlnIGJ1bXAuCgpZZXMuCgo+Cj4gVGhvbWFzCj4gLS0KPiBUaG9tYXMgUGV0YXp6
b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5l
bCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKPiBodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
