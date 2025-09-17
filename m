Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 234CCCAC5A0
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 17:29:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B79224004A;
	Wed, 17 Sep 2025 17:29:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NjI5lYxDnRhG; Wed, 17 Sep 2025 17:29:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E66B1401EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E66B1401EA;
	Wed, 17 Sep 2025 17:29:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A2F24AF1
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 17:29:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94D714004A
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 17:29:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id om_LoAZpHCbg for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 17:29:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e36; helo=mail-vs1-xe36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A5C3C40622
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5C3C40622
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com
 [IPv6:2607:f8b0:4864:20::e36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A5C3C40622
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 17:29:23 +0000 (UTC)
Received: by mail-vs1-xe36.google.com with SMTP id
 ada2fe7eead31-538e108f6cfso67128137.0
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 10:29:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758130162; x=1758734962;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hHx8H8bvI8ahbEV0/lm7ZHgOp7kcmgI+90f1j0zNxSQ=;
 b=wMOVoR9ra2kaK8TXguThlMaisy17SBAPKuVzOsYB8pdf6BST+V020lSVnIA9mBt4o4
 GHUNnhyjLt0lv2H9IFDgtUamyYvFdm1kbiznJlS3T8W5T2NcDo4zJ17MuKqfGbmj5KHl
 MWk+8N3Yz1NzFQt8h28nDC1MMq3oPKLcNLeCHNUrgqTW5DyM2QqWCCbN6rhnVG4U8I1h
 4QHs4kkCrCNI7WKZ0itibEQDkfcmk80YYBBSj7HWIjth3izExrYsMRL2TWMTlUC0Xgv3
 Se8HAlnVGqmXubo2OvoLAplp/PPntHOGLpuFIrDmrhTsak9UagkWqDRL6VssukWUnj7O
 fNdA==
X-Gm-Message-State: AOJu0YxCYzlVxSuvSmQ2KQnnPM376SCEbubnbBddaYrpvPHmyHrXPpmK
 5KS5HWSeEuVRI9R0MHdJRNrbYsri/m1voqP63akd52HDbJu9n1wqY6TkUxJ2Nd4c+PoVgYi0yMK
 EcIwfLDUrYS92FX4yPfLd022RWGiy9IrXWw==
X-Gm-Gg: ASbGncsS+CpV8kLQeSGAFwrZY3sTl70GVdCmhxVjh5P0Txyc17n8gNFas5lvoTOTqCb
 Ly5VfP4ME2rKWwQBa4XW+Tcp0MXsBcWHXD4SJqqUYv0cscHDI/Ch8GQHw45yQKlR7v2VYDD97aE
 6KywJD0gzI6jp5mjWnyMl2Zkvjct8kqsEZEmsArVeyJOfzpcTBzjRVzfnk4crifevHUyiIJ9wnA
 v+2hE882nAUe7LzF/Y=
X-Google-Smtp-Source: AGHT+IGSWkqOfWCrjtrBRA4w36VgRhOzfSqyROwC2i7xM5Mmx+hzWr7tHfJUjD8+lBXXyfQvo0eJTBngwWIKjPgefwc=
X-Received: by 2002:a05:6102:512c:b0:520:ca2b:4591 with SMTP id
 ada2fe7eead31-56d6327eb36mr1167099137.20.1758130162303; Wed, 17 Sep 2025
 10:29:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250916003036.2506534-1-james.hilliard1@gmail.com>
 <e334751a5a70b13d39c4cb67e47626b1@free.fr>
In-Reply-To: <e334751a5a70b13d39c4cb67e47626b1@free.fr>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 17 Sep 2025 11:29:09 -0600
X-Gm-Features: AS18NWCKFctITUGqyONEXfKRjJTQpiOPqLQeaw3pl2_1ViKyx7bjlDW4BhOJz0g
Message-ID: <CADvTj4rD4nNXkrwpJQJKxX1nUpfg_DVa-9Lr-8FRqa+s5LYpXw@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Marcus Hoffmann <bubu@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758130162; x=1758734962; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hHx8H8bvI8ahbEV0/lm7ZHgOp7kcmgI+90f1j0zNxSQ=;
 b=CjdFFIN/aJLZq6LPBnTT34C+OTPeK3FMfWG21x913ggPwl9KLukY/m1+RNHecm0Jrv
 pWiJ704i6t6439l5T7rf1u7ibKzDgjVmXkRZM85NNIVk4yofc+FnrLJn4C2v2uV8NA9N
 UCttZTuVKvqhxeth1CkB5dt7qXoCugUDCNJpR3PPJByWKU28Ja1sbJtUEJFnG0pAFZ1c
 OY8LPWJq2u6bgVNfgkbsUfHKlyw5ecRHFyPcNJBnKG4ejAB8Pc1Wfq2Gb87/Yl3Cfyxl
 axL6/tbWzxiQOkwspEdUMellfrtnqjabS32o9dVwZJMZqljcyz1viFw12TPJpa003lDY
 BlvA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=CjdFFIN/
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pydantic-core: bump to
 version 2.39.0
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

T24gV2VkLCBTZXAgMTcsIDIwMjUgYXQgMTE6MTnigK9BTSBKdWxpZW4gT2xpdmFpbiA8anUub0Bm
cmVlLmZyPiB3cm90ZToKPgo+IEhpIEphbWVzLAo+Cj4gVGhhbmtzIGZvciB0aGUgcGF0Y2guCj4K
PiBPbiAxNi8wOS8yMDI1IDAyOjMwLCBKYW1lcyBIaWxsaWFyZCB3cm90ZToKPiA+IFNpZ25lZC1v
ZmYtYnk6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgo+ID4gLS0t
Cj4gWy4uLl0KPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1weWRhbnRpYy1jb3JlL3B5
dGhvbi1weWRhbnRpYy1jb3JlLm1rCj4gPiBiL3BhY2thZ2UvcHl0aG9uLXB5ZGFudGljLWNvcmUv
cHl0aG9uLXB5ZGFudGljLWNvcmUubWsKPiA+IGluZGV4IDUwODViOTA2ZDUuLjczNDI3MTFiMmEg
MTAwNjQ0Cj4gPiAtLS0gYS9wYWNrYWdlL3B5dGhvbi1weWRhbnRpYy1jb3JlL3B5dGhvbi1weWRh
bnRpYy1jb3JlLm1rCj4gPiArKysgYi9wYWNrYWdlL3B5dGhvbi1weWRhbnRpYy1jb3JlL3B5dGhv
bi1weWRhbnRpYy1jb3JlLm1rCj4gPiBAQCAtNiwxMCArNiwxMCBAQAo+ID4KPiA+ICAjIHB5dGhv
bi1weWRhbnRpYyBwaW5zIGFuIGV4YWN0IHZlcnNpb24gb2YgcHlkYW50aWMtY29yZSBpbgo+ID4g
cHlwcm9qZWN0LnRvbWwsCj4gPiAgIyBtYWtlIHN1cmUgdG8gc3luYyBweWRhbnRpYy1jb3JlIHRv
IHRoaXMgdmVyc2lvbiB3aGVuIHVwZGF0aW5nCj4gPiBweWRhbnRpYwo+ID4gLVBZVEhPTl9QWURB
TlRJQ19DT1JFX1ZFUlNJT04gPSAyLjMzLjIKPiA+ICtQWVRIT05fUFlEQU5USUNfQ09SRV9WRVJT
SU9OID0gMi4zOS4wCj4KPiBUaGlzIG5ldyB2ZXJzaW9uIGJyZWFrcyB0aGUgcnVudGltZSB0ZXN0
cy4gU2VlOgo+IGh0dHBzOi8vZ2l0bGFiLmNvbS9qb2xpdmFpbi9idWlsZHJvb3QvLS9waXBlbGlu
ZXMvMjA0NTQ4Nzc4Ngo+Cj4gQ291bGQgeW91IGhhdmUgYSBsb29rIHBsZWFzZT8KPgo+IEl0IGlz
IGxpa2VseSBhIG1pc3NpbmcgcnVudGltZSBkZXBlbmRlbmN5LiBJIGRpZCBub3QgYXBwbGllZAo+
IHRoZSBweXRob24tcHlkYW50aWMgYnVtcCBmcm9tOgo+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFi
cy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyNTA5MTYwMDMzMTkuMjUxMDA1MC0xLWph
bWVzLmhpbGxpYXJkMUBnbWFpbC5jb20vCj4KPiBJJ2xsIHJldGVzdCBib3RoIGJ1bXBzIGF0IHRo
ZSBzYW1lIHRpbWUuCgpZZWFoLCBiYXNlZCBvbiB0aGUgZXJyb3IgSSB0aGluayBhcHBseWluZyBi
b3RoIGF0IHRoZSBzYW1lIHRpbWUgc2hvdWxkIGZpeCBpdC4KCj4KPiBCZXN0IHJlZ2FyZHMsCj4K
PiBKdWxpZW4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
