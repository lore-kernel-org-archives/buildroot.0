Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DBF4C36010
	for <buildroot@archiver.kernel.org>; Fri,  4 Apr 2025 18:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3521781F92;
	Fri,  4 Apr 2025 18:25:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5d2QzzQTEMey; Fri,  4 Apr 2025 18:25:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F50281FC2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F50281FC2;
	Fri,  4 Apr 2025 18:25:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 027D65E
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 18:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E868A405C9
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 18:25:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w6gziq2xY4BI for <buildroot@buildroot.org>;
 Fri,  4 Apr 2025 18:25:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b30; helo=mail-yb1-xb30.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F15E540BE8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F15E540BE8
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F15E540BE8
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 18:25:49 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-e6405b5cd9bso2077855276.1
 for <buildroot@buildroot.org>; Fri, 04 Apr 2025 11:25:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743791149; x=1744395949;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SZuuSDNMYVLBh7LIBUs8qesHazA1YlaZ0qJGPuXdl6c=;
 b=ipUjDQdG2DhuuXJ7C9r+ib9okUDVNsUYgJhSARf5gpu2Cc4n7ujndeEVSra2HjsCAZ
 sMNQ0vX2liOOD6+MESh2bDPFk1gTt9Op9MzkNmgqqkAMcJBkXDZM89SsaDSprD/Dr8ZB
 u3XoshktSV7qPd3QmB+dbrDUQa2OgeqAwP1DD5MMxFRjf/9nlYmwtLLIX2pnsOxE3gxe
 QopZdJQcQgW51nIrRQ12HtCKcfaxDSOpgEwWhTr2/fuLxcJNoRKQACNck0yPzBG0cEuW
 +EUPo3XRNbB02U7nswkf3YsQIO3LUedzxp7nOAQ3rsWyOB3O6nKpNxZgJyt8uJ1nJHMl
 eBww==
X-Gm-Message-State: AOJu0YxsLqQYsQEbp/yxDvTWE18R/3vsAl+vwuBoLMJGxEN4nUwZrZxJ
 QR+wZzYlKPf/W5Cp5R1w4Vw4r01aVKt9mfDjqCgZGb5b/cDpKEJjoUHp4LIyXTAM8lMnqHnJFBb
 J
X-Gm-Gg: ASbGncuBFuBRETYtNlXx/2O+BOK3t1WoroW0H05z9sOhO5oPQ09YOKm8C4XnhA3Mr+U
 9i1p6UOpZSOywANhn6Vj7qCU9+w09RJ5FRnIaSphBNsWNyGrGgYK5WXgZfQGH7a1V197IXlGUok
 bqPjlOlBBr3iER+XnjrSUQYUDNNhFJe6vHAqXsoC4DbpWtwM4GK9RbGdJPg3LaklCXjcYYHWmWe
 wyxix7yPmaExZPbCInLeg5zrTAxuPuD3u95P7q5U8ZS3OC+PeVw55cr4m2yRGv2GKicINJI5mAj
 Ysw14x7hlrNtxcuMP4D3Fkn5AQlQSANciJFV/TVlpBoBUR9SrGlDCjn3qNPMuMNlez3N0mAUwrj
 DGObZSUy0fySj
X-Google-Smtp-Source: AGHT+IEV+r9DwRiTq7fKG2evdjCsKvdVrtCnag70S5Lmi250Y/2zaZUbZNc7FZthrfk5rFiLciR7+g==
X-Received: by 2002:a05:6902:490b:b0:e65:5698:e40 with SMTP id
 3f1490d57ef6-e6e1cfa9cf5mr6809078276.18.1743791148686; 
 Fri, 04 Apr 2025 11:25:48 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com.
 [209.85.219.180]) by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-e6e0cadc024sm881445276.57.2025.04.04.11.25.48
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Apr 2025 11:25:48 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-e6405e4ab4dso3192633276.0
 for <buildroot@buildroot.org>; Fri, 04 Apr 2025 11:25:48 -0700 (PDT)
X-Received: by 2002:a05:6902:a91:b0:e6b:723f:bcf with SMTP id
 3f1490d57ef6-e6e077b72damr15097414276.21.1743791148001; Fri, 04 Apr 2025
 11:25:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250402044107.4128-1-christian@aperture.us>
 <CA+h8R2r6WiJPWKTMjgF3JOi3GMzeivCLtmgH+fkjkio_0fmFHg@mail.gmail.com>
In-Reply-To: <CA+h8R2r6WiJPWKTMjgF3JOi3GMzeivCLtmgH+fkjkio_0fmFHg@mail.gmail.com>
Date: Fri, 4 Apr 2025 11:25:37 -0700
X-Gmail-Original-Message-ID: <CA+h8R2rckasaKBUDutvWbbZgUsEMFTzxdYDvoSTemsJCw_DbjA@mail.gmail.com>
X-Gm-Features: ATxdqUEdUODfpS6gnFIwPOz3xdQKjiiPe95LlAMHQfxTIpI7REuAyns3CEbyZvE
Message-ID: <CA+h8R2rckasaKBUDutvWbbZgUsEMFTzxdYDvoSTemsJCw_DbjA@mail.gmail.com>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>, Bernd Kuhls <bernd@kuhls.net>, 
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1743791149; x=1744395949; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SZuuSDNMYVLBh7LIBUs8qesHazA1YlaZ0qJGPuXdl6c=;
 b=U5McIspOV/2WWwNi9ONUy4Y3LNw2xAf7YmRQd1sDAu8hJWp8RBSQmm6s54X6SgXzeM
 a3VKAAJMLYM4G1dSGqYCFiIUCvWWRK6mjsEi/OsibP/xt0uv6BQSqFjsLN7Y/fsxyZKM
 CQM6KFC7QDNDs85R3RC1q6MsaJmoEgFa0l4pHdgtD7NX7MR7BZ+cNO7QIlwS++MEdncF
 pJxGPIBGzzED2HhUzXVQJjw6RIJHxRgZgFqnFG0rDq4iQyt2xzC6pFc61XZvbFvUF9iC
 kbdviU9fRnrqHzQyzql8R6kiLqNGSbnDjHA5+ZaWhTA7XBp1NVNG8TABLvCWxj6yshDE
 39Pg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=U5McIspO
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

SGkgYWxsLAoKTWFya2luZyB0aGlzIHBhdGNoIGFzIFN1cGVyY2VkZWQuIFNlZSBiZWxvdy0KCk9u
IFdlZCwgQXByIDIsIDIwMjUgYXQgMjo1OeKAr0FNIENocmlzdGlhbiBTdGV3YXJ0IDxjaHJpc3Rp
YW5AYXBlcnR1cmUudXM+IHdyb3RlOgo+ID4gVGhlIENNYWtlTGlzdHMudHh0IHdpdGhpbiByZXF1
aXJlcyBDTWFrZSAzLjAuMCwgYnV0IG5ld2VyIENNYWtlIGZvcmNlcwo+ID4gYXQgbWluaW11bSB2
ZXJzaW9uIDMuNSwgbGVhZGluZyB0byBidWlsZCBmYWlsdXJlczoKPiA+Cj4gPiBodHRwczovL2dp
dGh1Yi5jb20vc2tpZmZvcy9Ta2lmZk9TL2FjdGlvbnMvcnVucy8xNDIwODk4ODM1NC9qb2IvMzk4
MTI1NzYxMzkjc3RlcDo4OjYzOAo+ID4KPiA+IEFkZCB0aGUgc3VnZ2VzdGVkIGJ1aWxkIGZsYWcg
dG8gZm9yY2UgdmVyc2lvbiAzLjUueCBhbmQgZml4IHRoZSBlcnJvcjoKPiA+Cj4gPiAgIC1EQ01B
S0VfUE9MSUNZX1ZFUlNJT05fTUlOSU1VTT0zLjUKPiA+Cj4KPiBJIGFtIG5vdyBzZWVpbmcgdGhp
cyBmYWlsdXJlIG9uIG90aGVyIHBhY2thZ2VzIHRvbyBvbiB1YnVudHUtbGF0ZXN0Ogo+Cj4gaHR0
cHM6Ly9naXRodWIuY29tL3NraWZmb3MvU2tpZmZPUy9hY3Rpb25zL3J1bnMvMTQyMTE1NjYyNTYv
am9iLzM5ODE5NjAwMTg0I3N0ZXA6ODoyNjY2NAo+Cj4gSGVyZSBpcyBhIGZhaWx1cmUgd2l0aCBs
em8gYXMgd2VsbCBhcyBoaXJlZGlzLgo+Cj4gSSdtIHRlc3RpbmcgYSBlZGl0IHRvIHBrZy1jbWFr
ZS5tayB0byBhZGQgdGhpcyB0byBkZWZhdWx0IG9wdGlvbnM6Cj4KPiAjIFNvbWUgcGFja2FnZXMg
cmVxdWlyZXMgQ01ha2UgMy4wLjAgYnV0IGxhdGVzdCBDTWFrZSByZXF1aXJlcyA+PTMuNQo+ICMg
U2V0IHRoZSBwb2xpY3kgdmVyc2lvbiBtaW5pbXVtIHRvIGZvcmNlIHRoZXNlIHBhY2thZ2VzIHRv
IDMuNSBvciBncmVhdGVyLgo+ICQoMilfQ09ORl9PUFRTICs9IC1EQ01BS0VfUE9MSUNZX1ZFUlNJ
T05fTUlOSU1VTT0zLjUKPgo+IFRoaXMgd291bGQgZml4IGl0IGFjcm9zcyB0aGUgYm9hcmQuCgpU
aGlzIHdvcmtlZCwgc3VibWl0dGVkIGEgcGF0Y2ggaGVyZToKCmh0dHBzOi8vcGF0Y2h3b3JrLm96
bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyNTA0MDQxODI0MDcuNDUyNDQtMS1j
aHJpc3RpYW5AYXBlcnR1cmUudXMvCgpCZXN0IHJlZ2FyZHMsCkNocmlzdGlhbiBTdGV3YXJ0Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
