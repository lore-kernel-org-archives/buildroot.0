Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 472C3C28B20
	for <buildroot@archiver.kernel.org>; Wed,  2 Apr 2025 09:59:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E87DD830D7;
	Wed,  2 Apr 2025 09:59:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B5Ywic2dnMcy; Wed,  2 Apr 2025 09:59:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 201E482F6C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 201E482F6C;
	Wed,  2 Apr 2025 09:59:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D73511F
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 09:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB7BC40A03
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 09:59:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aTqKoimIw6ho for <buildroot@buildroot.org>;
 Wed,  2 Apr 2025 09:59:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1131; helo=mail-yw1-x1131.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0E4AF405A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E4AF405A7
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E4AF405A7
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 09:59:38 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-6fead015247so55060137b3.2
 for <buildroot@buildroot.org>; Wed, 02 Apr 2025 02:59:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743587978; x=1744192778;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cg6I/R3ETMeKQzCTiJiil7yKgsTbjTMWOujmV5jTOkc=;
 b=jxleRm6BDuGA4Nam5bvmojfkAJn9+qkoQqhdgKeB3d0TH+VyoXnq+tSK2Fz1maNyqH
 GLNDKo/0YTva9BiWnkTtW23u046Q1sCnzmiGlBxTAK+iZgtzZzkeTb0uyLeG2iWIIf2H
 sSBkjofMQ7spVbFjbHAfgxsJn1PQn1/9xJ8PfhWALtU7+pQ/PZYzRQkbVpYLzkhMDusV
 lLasSABRHjtEj/lP+YrL0ybhwwyewxnnt1OKhlmZIvubZzV3xIUeISJJZz8p0iZb+ZMh
 EeFRsNgWBy+O1GhOBEQYpe8xdL2rRvHPTLkaUO6f0B0Kb1P5XXe20mZco2rSs+e1YikQ
 hk7g==
X-Gm-Message-State: AOJu0YwWvrFY+VT9eSyY4RsHuT8lnzuVgx4vkJtlecpX/Ve8PFfAgjV3
 ZlkdJw0H9Y/cYv+2cyksT1zdntA8HEVeM0JM3tgRlXE/wQF7dy9jxD4ehj/kO26vFESsK47oa3Y
 giPs=
X-Gm-Gg: ASbGnct2f6Ub5Emhlrnub5lD03blDoJECFRnEoHHTE/jyxYCAHtM0Sv3D+RSpfBdVUI
 m9QDtjcr1k0TjwdQ/g62Ho7bNatDKf96Y2OMJo7GMEU6d43vMyhvRRzZgC0V6xcJ5tgthlPJewB
 eH9XzAWn9rRWfV5GCLC5eaV5ldfc3F8I5rqL3hXCk1zKjyn2DhBkINqYfEvt2HMYJz3sX/02gjl
 fCauFueYwdDwqXfrn61guXR4peJfFCufWAgTJ00wKopvevrbwwYNCVGVStI9KDnFLCTxwb+PGkq
 Q5ljqrGBIFRBRDejHEuNCuoYIKU/6B4YGnFmTzi04UmgwszXQiS69bDF/07uDTeikUN5OeVkit1
 ylZrFnj1GDjw6
X-Google-Smtp-Source: AGHT+IE3w79IQlAjC9EJ2V2BbydDmbwjm28aO78VcnPAyG9Gv//A3AFMuz2FN2hQ7GNHsKQ4KQqoTQ==
X-Received: by 2002:a05:690c:c08:b0:6ff:1c1a:f61f with SMTP id
 00721157ae682-702573097ebmr210395467b3.30.1743587977819; 
 Wed, 02 Apr 2025 02:59:37 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com.
 [209.85.219.181]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-7023a98a35fsm31955727b3.82.2025.04.02.02.59.37
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Apr 2025 02:59:37 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-e643f235a34so4945623276.1
 for <buildroot@buildroot.org>; Wed, 02 Apr 2025 02:59:37 -0700 (PDT)
X-Received: by 2002:a05:6902:2803:b0:e6d:e8d4:6826 with SMTP id
 3f1490d57ef6-e6de8d46b99mr7438575276.2.1743587977160; Wed, 02 Apr 2025
 02:59:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250402044107.4128-1-christian@aperture.us>
In-Reply-To: <20250402044107.4128-1-christian@aperture.us>
Date: Wed, 2 Apr 2025 02:59:25 -0700
X-Gmail-Original-Message-ID: <CA+h8R2r6WiJPWKTMjgF3JOi3GMzeivCLtmgH+fkjkio_0fmFHg@mail.gmail.com>
X-Gm-Features: AQ5f1JpSl8j-5tYfoY-QmXbjXL7HlCRlWQ5z6L1xvy80EbE1kRPtnBYGW9SBuwY
Message-ID: <CA+h8R2r6WiJPWKTMjgF3JOi3GMzeivCLtmgH+fkjkio_0fmFHg@mail.gmail.com>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>, Bernd Kuhls <bernd@kuhls.net>, 
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1743587978; x=1744192778; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cg6I/R3ETMeKQzCTiJiil7yKgsTbjTMWOujmV5jTOkc=;
 b=qcoe0200x6Ecll29sVuOz+GENXz8z/IMl9iF5M/+H0FEq06urI8oUFkuU/AusI0PQZ
 96Oh9/fTDNy/GcvO+O9qMQ42q0APDu4qbP7/uOGnPQzQ1PWfXeQoZrp5kIRzSl7TymJ2
 bKTX+BZSPIcRlIm6Nx24dC6vhSOHvBJ4oowgTH//f2kBE03pkZ9/a1f5EKevBx8wXo9G
 ES5qyS/aOjzHqXfkeWT1sOhl3TBzZie02tnNy8o9poAU1n1E6J7Kej7NKCaWmJ+Daq0h
 YMl6JeHS6+r2JgEsqPZk/6Pd6tLy0zH/ih5ix8EYmVobZdHGdfz+7WfX2fbo9EBtyw8T
 Xu5A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=qcoe0200
Subject: Re: [Buildroot] [PATCH v1 1/1] package/hiredis: force cmake version
 3.5
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgYWxsLAoKT24gVHVlLCBBcHIgMSwgMjAyNSBhdCA5OjQx4oCvUE0gQ2hyaXN0aWFuIFN0ZXdh
cnQgPGNocmlzdGlhbkBhcGVydHVyZS51cz4gd3JvdGU6Cj4KPiBCdWlsZHMgZmFpbCB3aXRoIGxh
dGVzdCBVYnVudHUgZHVlIHRvIGhvc3QtaGlyZWRpcy4KPgo+IFRoZSBDTWFrZUxpc3RzLnR4dCB3
aXRoaW4gcmVxdWlyZXMgQ01ha2UgMy4wLjAsIGJ1dCBuZXdlciBDTWFrZSBmb3JjZXMKPiBhdCBt
aW5pbXVtIHZlcnNpb24gMy41LCBsZWFkaW5nIHRvIGJ1aWxkIGZhaWx1cmVzOgo+Cj4gaHR0cHM6
Ly9naXRodWIuY29tL3NraWZmb3MvU2tpZmZPUy9hY3Rpb25zL3J1bnMvMTQyMDg5ODgzNTQvam9i
LzM5ODEyNTc2MTM5I3N0ZXA6ODo2MzgKPgo+IEFkZCB0aGUgc3VnZ2VzdGVkIGJ1aWxkIGZsYWcg
dG8gZm9yY2UgdmVyc2lvbiAzLjUueCBhbmQgZml4IHRoZSBlcnJvcjoKPgo+ICAgLURDTUFLRV9Q
T0xJQ1lfVkVSU0lPTl9NSU5JTVVNPTMuNQo+CgpJIGFtIG5vdyBzZWVpbmcgdGhpcyBmYWlsdXJl
IG9uIG90aGVyIHBhY2thZ2VzIHRvbyBvbiB1YnVudHUtbGF0ZXN0OgoKaHR0cHM6Ly9naXRodWIu
Y29tL3NraWZmb3MvU2tpZmZPUy9hY3Rpb25zL3J1bnMvMTQyMTE1NjYyNTYvam9iLzM5ODE5NjAw
MTg0I3N0ZXA6ODoyNjY2NAoKSGVyZSBpcyBhIGZhaWx1cmUgd2l0aCBsem8gYXMgd2VsbCBhcyBo
aXJlZGlzLgoKSSdtIHRlc3RpbmcgYSBlZGl0IHRvIHBrZy1jbWFrZS5tayB0byBhZGQgdGhpcyB0
byBkZWZhdWx0IG9wdGlvbnM6CgojIFNvbWUgcGFja2FnZXMgcmVxdWlyZXMgQ01ha2UgMy4wLjAg
YnV0IGxhdGVzdCBDTWFrZSByZXF1aXJlcyA+PTMuNQojIFNldCB0aGUgcG9saWN5IHZlcnNpb24g
bWluaW11bSB0byBmb3JjZSB0aGVzZSBwYWNrYWdlcyB0byAzLjUgb3IgZ3JlYXRlci4KJCgyKV9D
T05GX09QVFMgKz0gLURDTUFLRV9QT0xJQ1lfVkVSU0lPTl9NSU5JTVVNPTMuNQoKVGhpcyB3b3Vs
ZCBmaXggaXQgYWNyb3NzIHRoZSBib2FyZC4KCkJlc3QgcmVnYXJkcywKQ2hyaXN0aWFuIFN0ZXdh
cnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
