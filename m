Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A4B4C7618A
	for <buildroot@archiver.kernel.org>; Sat, 18 Mar 2023 21:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C52C981F3E;
	Sat, 18 Mar 2023 21:43:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C52C981F3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id huzVfklbFZfw; Sat, 18 Mar 2023 21:43:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1189081F24;
	Sat, 18 Mar 2023 21:43:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1189081F24
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DFCAE1BF378
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 21:43:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA701401C4
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 21:43:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA701401C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AxZhzVK8v93H for <buildroot@lists.busybox.net>;
 Sat, 18 Mar 2023 21:43:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C621B4016F
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C621B4016F
 for <buildroot@buildroot.org>; Sat, 18 Mar 2023 21:43:18 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id
 o26-20020a4ad49a000000b0053964a84b0fso710412oos.7
 for <buildroot@buildroot.org>; Sat, 18 Mar 2023 14:43:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679175797;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+tKdlPU66PbwOZnt3IJGPASP0I99W5qiqmBaYxedz6Y=;
 b=7VztDqvVU+wYONe+udiEXr695d0XF7we0j9rnDatVPBbnxI/97lDIR1KX0bsSFMEhl
 ubWWMwO9It0j5TnrlUDMcYxLpMtp4ucxOUxbUNJX1SIfTxglExvuKjc8Tys+zvn0MCXM
 oRTRI6dB7Nf2OqoxO35erEuA5QyHotBoZzXva6YkZ2A3rwSSwiF3H+wUaXmx0tK2DK0k
 JMyJ1ZIrNcQHMPKQ/pR43YGq7Z8UVhcVJfNiM+oD7+RJLI51WxWgqR9Cv2OKeT/uMO7f
 MO20TzJaGrgD4E1evRMTSdHX194Tq/dwUmEfJ7eDW39fu3eMpuwmypKEJUg2tuNRkp07
 pK2Q==
X-Gm-Message-State: AO0yUKWe49xbGqEUaf1JZM5N2ngf9I30+1rb9ie+ytC1OSZPnkfv2oPP
 qi+QYcZ3naW2dQab/YbBO1CpWR1cFrK1T39QkPF2tUNX3D0=
X-Google-Smtp-Source: AK7set+reWxz7IKXJbQTkGBgcMmWJ0vInzmUDiPHagGVmjAdRITS96DRLx+aN0dD384nclAFyHu9ZDzU9VLAn/D4LYA=
X-Received: by 2002:a4a:be10:0:b0:53a:9f38:3170 with SMTP id
 l16-20020a4abe10000000b0053a9f383170mr803332oop.1.1679175797577; Sat, 18 Mar
 2023 14:43:17 -0700 (PDT)
MIME-Version: 1.0
References: <CANgJbdVKFO_HvXOvrMcJW_bb=QXnpB6T7M9T+r1ypR7icwfPWA@mail.gmail.com>
 <CANgJbdXqFfHtd=fnutfAkJXnRzhZH=SuLeme8P4gOxVnvTrCuA@mail.gmail.com>
In-Reply-To: <CANgJbdXqFfHtd=fnutfAkJXnRzhZH=SuLeme8P4gOxVnvTrCuA@mail.gmail.com>
From: Jonathan Bittner <jbittner.br.bugs@gmail.com>
Date: Sat, 18 Mar 2023 17:43:06 -0400
Message-ID: <CANgJbdWrJ=01EvvQ_OfoS9c0R6+RSB0x2AFW1D86KiX47BTAFw@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679175797;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+tKdlPU66PbwOZnt3IJGPASP0I99W5qiqmBaYxedz6Y=;
 b=T1z39CBCGWwhwnZkiexsjCQGRQJuHsleYYcW+NTjW5xrmkMKQzwsdoauLZsNfAwblG
 bdWUpnZPIo7DXTfTOPOh4Ry82ux8hLWopTCALxtAn+aFUA9Gmfl9brocZAjZTNPDZS3O
 cigRcEBITifRBCmKJb1b1cW1NxIoo3EcQxu4njiOZ/rQv7Gg7gXwNqwYgYAJFcMTs27Z
 6jb2exwumdxMBaKUC4n7L8jJx3TDBTDeCJW8QrGZj7zWwX9jmPppr/c/VVxFDOy/15TU
 2VlHV87iC3G5FTt22aMmp+qjMaPYWwgVMNzOD28d3rEc8Ypo37kts9dgcVZVhbYYF7n+
 OMlw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=T1z39CBC
Subject: Re: [Buildroot] Troubles with SELinux
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCBNYXIgMTcsIDIwMjMgYXQgMTE6MjDigK9BTSBKb25hdGhhbiBCaXR0bmVyCjxqYml0
dG5lci5ici5idWdzQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIE1hciAxNiwgMjAyMyBh
dCAxMjozM+KAr1BNIEpvbmF0aGFuIEJpdHRuZXIgPGpiaXR0bmVyLmJyLmJ1Z3NAZ21haWwuY29t
PiB3cm90ZToKPiAzLikgTXkgaXNzdWVzIHdpdGggc3NoIGxvZ2luIGlzIGFwcGFyZW50bHkgdGhl
IC9ldGMvcGFtLmQvc3NoZCB0aGF0IHNoaXBzIHdpdGggdGhlIHN5c3RlbSBjb250YWlucyBubyBy
ZWZlcmVuY2UgdG8gYW55IG9mIHRoZSBTRUxpbnV4IG1vZHVsZXMgaW4gdGhlIGF1dGggc3RhY2sg
d2hpY2ggbWVhbnMgdGhlIGNvbnRleHRzIGFyZSBub3Qgc2V0IGR1cmluZyB0aGUgbG9naW4uICBJ
IGhhdmVuJ3QgcXVpdGUgZml4ZWQgdGhpcyB5ZXQuIE1vc3Qgb2YgdGhlIHNhbXBsZSBjb25maWdz
IEkndmUgZm91bmQgb25saW5lIHdlcmUgZGlzdHJpYnV0aW9uLXNwZWNpZmljIGFuZCBoYWQgZXh0
ZXJuYWwgcmVmZXJlbmNlcyAoaW5jbHVkZXMpIHRvIGZpbGVzIHNoaXBwZWQgYnkgdGhhdCBkaXN0
cm8sIG9mdGVuIGluY29ycG9yYXRpbmcgZGlzdHJvLXNwZWNpZmljIG1vZHVsZXMgbm90IHNoaXBw
ZWQgd2l0aCBCdWlsZHJvb3QKClJlcGx5aW5nIGFnYWluIHRvIGFkZCB0byB0aGUgYXJjaGl2ZSBp
biBjYXNlIGFueW9uZSBldmVyIHNlYXJjaGVzIGZvcgp0aGlzOiAgc3NoIHRyb3VibGVzIHdlcmUg
YWxsZXZpYXRlZCBieSBtYW51YWxseSBtYXBwaW5nIHRoZSB1c2VyCmFjY291bnQgdG8gc3RhZmZf
dSAoaW5zdGVhZCBvZiBkZWZhdWx0IHVzZXJfdSkgaW4gc2V1c2Vycy4gIEdvb2QKZW5vdWdoIGZv
ciBub3cuIE5vdCBzdXJlIHdoeSB1c2VyX3UgaXMgYmxvY2tlZCBvciB3aGF0IHBvbGljeSB0bwpj
aGFuZ2UgdG8gZml4IGl0LiAgQWxzbyBkb24ndCBib3RoZXIgdHJ5aW5nIHRvIGluc3RhbGwgc2Vt
YW5hZ2UgYW5kCnRoZSBweXRob24gaG9va3M6IHRoZXkgZG9uJ3Qgd29yayB3aGVuIHRoZSBwb2xp
Y3kgaXMgYnVpbHQgYXMKbW9ub2xpdGhpYy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
