Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B11E8C3DA70
	for <buildroot@archiver.kernel.org>; Tue, 30 Jul 2024 15:15:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73E5D60A41;
	Tue, 30 Jul 2024 15:15:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wrpLYLojvC-J; Tue, 30 Jul 2024 15:15:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B6E260A43
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B6E260A43;
	Tue, 30 Jul 2024 15:15:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2C24C1BF5AE
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 15:15:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17E484026E
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 15:15:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ctc7_C2gx3_R for <buildroot@lists.busybox.net>;
 Tue, 30 Jul 2024 15:15:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::329; helo=mail-ot1-x329.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BDD23400E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDD23400E2
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BDD23400E2
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 15:15:54 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-7094468d392so1667689a34.0
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 08:15:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722352554; x=1722957354;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J60a81AXhOrsNaL3rl1yieNovoWCMNHabsUbUhSNW/Y=;
 b=LVanscbtm3rSRA5p0TZ+snao0eg2AJy3eSaPNKMnmaZfoukvTRIplzcm2LMFB25/rT
 IS/WsQx1NB0ioAXwyr7gyVEOrb0xBx23whUau1GSfKzEodPPy+yblvfnqkjRARCAcxK9
 obTgBGPTPjyPfXnzzUrtF+NUe3qKZt+fjlJfAWFSuwvmFPFUUdDJV4NXCSf3b9NEz8yG
 1j0nrU82xKUmATnvZFghUQJUrCcoMKXBmZv3gQ7GeerBbpNMI1cPG/nVywHTEAN4ewsy
 SENHW4mt1GngHXeusGoBXEsiHZgcGec65iKFNnNvSrhQKA/ag5Fany2x5XCRImu5Pm/s
 3iIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+MaTgB3gGZZgsNobxhIw1btiTaTvQz0hRCg7gHIkCCnfn/G87+ms0Hom+ROmT1k4HPQyydVwrQ2L4wOTn1YhVARdYYV55AA==
X-Gm-Message-State: AOJu0YzNo9nMUu4nhGjbKueKOthfJlX8CbW+xmYxRy3A0E8UPGI493zA
 A7DGvD0icQm0xG1jRZFbQ1dxpX15GbY9fT2e6gAtMg19Tf2DNjbbCc5b3+eN2GQ37+dCT4oes45
 M4hiNOkiLZJ6A5ICusFGYT5CkDx38IDUG8Rs=
X-Google-Smtp-Source: AGHT+IG9/CG6sSsgb/04K1orPYj/aNrS/bS1vEYiwIjURPp4je8dgL7ZZCef9cRuxNahQwOmN2Enc5FdF/LM8wY6fIA=
X-Received: by 2002:a05:6358:7245:b0:1a5:3627:feb9 with SMTP id
 e5c5f4694b2df-1ade0894084mr1249130755d.19.1722352553459; Tue, 30 Jul 2024
 08:15:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240727202340.1484781-1-james.hilliard1@gmail.com>
 <20240729203325.3560903e@windsurf>
 <CA+h8R2rym0T+bcy3mUUSXKxwYtNH7KuTV0oUV-7PdCQdA6L5jQ@mail.gmail.com>
 <20240729221051.2e84f11f@windsurf>
In-Reply-To: <20240729221051.2e84f11f@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 30 Jul 2024 09:15:41 -0600
Message-ID: <CADvTj4pQEj2oXgs5c72Zu6Hg8WPAGjYEGc9TSaAVPKyT2muMww@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722352554; x=1722957354; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J60a81AXhOrsNaL3rl1yieNovoWCMNHabsUbUhSNW/Y=;
 b=Q8iGCpDyd1qBa0cCiI61u3aQa8ucR/PCRRLq+1eMxcyKKsucA7bClfVkFy/dYCL/gX
 WUiJH2rtIAU2cJm1ZWNt/1/Bs6mMxbGoN/UvpI+UA6tHYUpIFc1v8v1gqgjuYqH1Q0SP
 dXx2cDg1EsXigdWwbE7g4hSr65kJs5fG3x2Xa+o+cuU/figypA/Au7yIjegfjBgby+hv
 Ad8PGEhkWcFM8Fww6QY1pbeCsRg9A9OT7JV13AR/O3bPiKxThdb26x+lzpZ6eUd4VPfh
 QyTsjBOD0D0+9PjwTd4Qtfu1ck8725j9VgEhphUWcIEHDlu/nOvcKHeUIXCd9SLHQ4nR
 o2vQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Q8iGCpDy
Subject: Re: [Buildroot] [PATCH v3 1/1] package/tailscale: new package
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
Cc: Anisse Astier <anisse@astier.eu>, Christian Stewart <christian@aperture.us>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBKdWwgMjksIDIwMjQgYXQgMjoxMOKAr1BNIFRob21hcyBQZXRhenpvbmkKPHRob21h
cy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCAyOSBKdWwgMjAyNCAx
MjoyNjo0NiAtMDcwMAo+IENocmlzdGlhbiBTdGV3YXJ0IDxjaHJpc3RpYW5AYXBlcnR1cmUudXM+
IHdyb3RlOgo+Cj4gPiBUaGlzIHdhcyBzb2x2ZWQgYWxyZWFkeSBvbiBUYWlsc2NhbGUgbWFzdGVy
IGJyYW5jaDoKPiA+Cj4gPiBodHRwczovL2dpdGh1Yi5jb20vdGFpbHNjYWxlL3RhaWxzY2FsZS9p
c3N1ZXMvMTI4NTkjaXNzdWVjb21tZW50LTIyMzkxNTc1NjMKPiA+Cj4gPiBJdCB3YXMgZml4ZWQg
aW4gdGhpcyBjb21taXQ6Cj4gPgo+ID4gaHR0cHM6Ly9naXRodWIuY29tL3RhaWxzY2FsZS90YWls
c2NhbGUvY29tbWl0LzBmNTdiOTM0MGIxNDQ5ZGU4MTFhOWRhY2QwOThhNzY5MTkyYzQzNDQKPgo+
IFRoYW5rcyBmb3IgaGF2aW5nIGxvb2tlZCBpbnRvIHRoaXMhCj4KPiA+IEkgZG9uJ3Qgc2VlIGEg
cmVsZWFzZSB5ZXQgd2l0aCB0aGlzIGNvbW1pdC4gV2UgY291bGQgZWl0aGVyIHRha2UgdGhlCj4g
PiBsYXRlc3QgbWFzdGVyIGNvbW1pdCBoYXNoIGZvciBub3cgb3IgYXBwbHkgYSBwYXRjaCB3aXRo
IHRoaXMgY29tbWl0Lgo+Cj4gSSB0aGluayBhcHBseWluZyBhIHBhdGNoIGRvZXNuJ3Qgd29yayBi
ZWNhdXNlIHRoaXMgZXJyb3IgaGFwcGVucyBkdXJpbmcKPiB0aGUgdmVuZG9yaW5nIHN0ZXAsIHdo
aWNoIGlzIHBhcnQgb2YgdGhlIGRvd25sb2FkIHN0ZXAsIGFuZCBpcwo+IHRoZXJlZm9yZSAqYmVm
b3JlKiB3ZSBhcHBseSBhbnkgcGF0Y2hlcy4KCkknbSB0aGlua2luZyBtYXliZSBvbmUgb3B0aW9u
IGlzIHRvIGF1dG9tYXRpY2FsbHkgZmFsbGJhY2sgdG8gYXR0ZW1wdGluZwp0byB2ZW5kb3IgdXNp
bmcgR09QUk9YWT1odHRwczovL3Byb3h5LmdvbGFuZy5vcmcgd2hlbmV2ZXIgd2UgZ2V0CmEgdmVu
ZG9yaW5nIGZhaWx1cmUgdXNpbmcgR09QUk9YWT1kaXJlY3QgYXMgaXQgc2VlbXMgb3RoZXIgcGFj
a2FnZXMKbWF5IGJlIGFmZmVjdGVkIGJ5IHRoaXMgc29ydCBvZiBpc3N1ZS4KCgo+Cj4gVGhvbWFz
Cj4gLS0KPiBUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCj4gRW1i
ZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKPiBodHRwczov
L2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
