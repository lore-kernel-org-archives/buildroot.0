Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9FABC77B7A
	for <buildroot@archiver.kernel.org>; Fri,  2 Jun 2023 06:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1127D41E1C;
	Fri,  2 Jun 2023 06:12:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1127D41E1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id atppggpULYmd; Fri,  2 Jun 2023 06:12:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D448416AA;
	Fri,  2 Jun 2023 06:12:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D448416AA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DDD451BF5A8
 for <buildroot@lists.busybox.net>; Fri,  2 Jun 2023 06:12:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B59EB416AA
 for <buildroot@lists.busybox.net>; Fri,  2 Jun 2023 06:12:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B59EB416AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J3lVq0Z7FViR for <buildroot@lists.busybox.net>;
 Fri,  2 Jun 2023 06:12:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 894F04098F
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 894F04098F
 for <buildroot@buildroot.org>; Fri,  2 Jun 2023 06:12:18 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-19f6211d4e1so1661391fac.1
 for <buildroot@buildroot.org>; Thu, 01 Jun 2023 23:12:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685686337; x=1688278337;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5/c665GfQbvqW5mS2I5kh6WpQe7Iz31mrjTEGAKLX6c=;
 b=PpKqQvYkp3G1GZrvApF+GoYItUDcsIS5GZNfJZmT6oLIKJSwxIY/tglK/syYUgCh0Z
 rCOWdUimujQI8/C1uLTnFtd2ZNGnYSv0sFhHA7O8PFgqwxz2gEc52nntFhokckIAqBeV
 mujLs3BB6kLCvIQoD/oD8lJAYNrLoS4xQJy8OK8/tpl9l1S1/2BRxcU+MP4Q4WqBkxiE
 CyzBG5OXyLMVqXb1sYcwldVi4jHp++tDtBqAYShYkX70E0m86tg5mWPvJqPWTpCS4Fyd
 qqgoYJBsg7ize/f/WlRN284/LYHpBEfYd6gso06k1BGe1Oom+hGoxqVlVOurASy6krr/
 /Dxg==
X-Gm-Message-State: AC+VfDxEpJ+cc2GPgqPtL1bKKoFMHi9L2Ripa5knmtsT3xCGCwek5a3d
 OwchfuuF+4I2lu8kRv3Gr2CcKyzTVGE1311fU2/1vlU1zPy5Rg==
X-Google-Smtp-Source: ACHHUZ7vIwuQ3mBGY2A/f6JyQANdRXms3dGSxxsTCrd6jgOQAE1eUpQMVRIki6WjfhJ7yoe+WFx6RZlGrnyio6RBvV0=
X-Received: by 2002:a05:6870:85c6:b0:196:553c:6207 with SMTP id
 g6-20020a05687085c600b00196553c6207mr967303oal.59.1685686337278; Thu, 01 Jun
 2023 23:12:17 -0700 (PDT)
MIME-Version: 1.0
References: <81e83506-622a-7036-283c-eb0b19fcc369@gmail.com>
In-Reply-To: <81e83506-622a-7036-283c-eb0b19fcc369@gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 2 Jun 2023 00:12:05 -0600
Message-ID: <CADvTj4qqLZOe2jROO4Z3_9m4ErV97-1F3dETnM2xt0k4M1T-yA@mail.gmail.com>
To: =?UTF-8?Q?Adrian_Pra=C5=82at?= <apralat.mikroel@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685686337; x=1688278337;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5/c665GfQbvqW5mS2I5kh6WpQe7Iz31mrjTEGAKLX6c=;
 b=LJ+fJj9AUsjEh5SWT1yGD7c2LsiCgLXnVZfDMKQlnG2jVPRMjCtpc4sy9+OCtfrngS
 c77ALAhIzHBmctd+6PEWpT+7GTSZN4d/97ZH515VBQBXywKuIQqyukSMt5/3p7YzSySD
 vm1JTHqgdjUuPocNDNy9p/74J2ag9sn9LHaPrTCqlcxco9IplrPOg9YE/kmKkEJB81Q0
 vc4aTvOzvXcFpFpzETgdVDyuwDua2iYErHjv700QHdproC5hHMl08s4ztZMaxEdxogGA
 XQNypSpPUuZMrWDi7nASvh16zc4aj36d8evbd1Q3k+fvRBkMI4HFe47FH9cWzRJg2uSg
 PrlQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=LJ+fJj9A
Subject: Re: [Buildroot] Issue with compiling buildroot toolchain on Fedora
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

T24gRnJpLCBKdW4gMiwgMjAyMyBhdCAxMjowNuKAr0FNIEFkcmlhbiBQcmHFgmF0IDxhcHJhbGF0
Lm1pa3JvZWxAZ21haWwuY29tPiB3cm90ZToKPgo+IEhpIGFsbCwKPgo+IHRvZGF5IHdlIGhpdCBh
biBpc3N1ZSB3aXRoIGNvbXBpbGluZyB0aGUgdG9vbGNoYWluIGZvciBvdXIgZGV2aWNlLCB0aGUg
aXNzdWUgaXMgd2l0aCB0aGUgcGFja2FnZSBNNC4KPgo+IER1cmluZyB0aGUgY29tcGlsYXRpb24g
b24gb3RoZXIgbWFjaGluZXMgcnVubmluZyBEZWJpYW4gKGtlcm5lbCA1LjEwLjAtMjMtYW1kNjQp
IGV2ZXJ5dGhpbmcgYnVpbGRzIG5vcm1hbGx5LiBPbiBteSBzeXN0ZW0gaG93ZXZlciAoRmVkb3Jh
IDM4LCBrZXJuZWwgNi4zLjQtMjAxLmZjMzgueDg2XzY0KSB0aGUgYnVpbGQgZmFpbHMgd2l0aCB0
aGUgbWVzc2FnZToKPgo+IGNvbmZpZ3VyZTogZXJyb3I6IGNhbm5vdCBjb21wdXRlIHN1ZmZpeCBv
ZiBvYmplY3QgZmlsZXM6IGNhbm5vdCBjb21waWxlCj4gU2VlIGBjb25maWcubG9nJyBmb3IgbW9y
ZSBkZXRhaWxzCj4gbWFrZTogKioqIFtwYWNrYWdlL3BrZy1nZW5lcmljLm1rOjIyMjogL2hvbWUv
bWlrcm9lbC9wcm9qZWN0L2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvaG9zdC1tNC0xLjQuMTgvLnN0
YW1wX2NvbmZpZ3VyZWRdIEVycm9yIDEKPgo+IFRoZSBvbmx5IGRpZmZlcmVuY2Ugc2hvdWxkIGJl
IHRoZSBrZXJuZWwsIHNpbmNlIHdlIGJ1aWxkIG91ciBpbWFnZXMgaW4gdWJ1bnR1IDIyLjA0IGRv
Y2tlciBjb250YWluZXJzLiBUaGUgaXNzdWUgaXMgcHJlc2VudCBvbiBicmFuY2ggMjAxOC4wOC40
IGFuZCBhbHNvIG90aGVyIGJyYW5jaGVzLCBzdWNoIGFzIGN1cnJlbnQgMjAyMy4wNS1yYzIKPgo+
IEFueSBpZGVhcyBvbiB3aGF0IGNhbiB3ZSBjYW4gY2hlY2sgb3IgZG8gdG8gbmFycm93IGRvd24g
dGhlIGlzc3VlIGFuZCBjb3JyZWN0IHRoZSBwcm9ibGVtIGluIGJ1aWxkcm9vdCBpdHNlbGY/CgpD
aGVjayB0aGUgY29uZmlnLmxvZyBmaWxlIGFzIHRoZSBlcnJvciBtZXNzYWdlIHN1Z2dlc3RzLgoK
Pgo+IC0tCj4gUG96ZHJhd2lhbSAvIFJlZ2FyZHMsIEFkcmlhbiBQcmHFgmF0Cj4KPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
