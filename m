Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D84AFC001B0
	for <buildroot@archiver.kernel.org>; Fri, 11 Aug 2023 20:28:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 582F6415F6;
	Fri, 11 Aug 2023 20:28:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 582F6415F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OgeBsOkgnNZX; Fri, 11 Aug 2023 20:28:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4992E4160D;
	Fri, 11 Aug 2023 20:28:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4992E4160D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9A6DF1BF588
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 20:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 73EAA81882
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 20:28:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73EAA81882
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k_n06UK5NErx for <buildroot@lists.busybox.net>;
 Fri, 11 Aug 2023 20:28:45 +0000 (UTC)
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com
 [IPv6:2607:f8b0:4864:20::e34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7EF2B81871
 for <buildroot@buildroot.org>; Fri, 11 Aug 2023 20:28:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EF2B81871
Received: by mail-vs1-xe34.google.com with SMTP id
 ada2fe7eead31-447b64b0555so766271137.3
 for <buildroot@buildroot.org>; Fri, 11 Aug 2023 13:28:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691785724; x=1692390524;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5HzKFNCX3/mRj0uFgPWJ3NLCayxs5AmR8xVuvfTXto8=;
 b=NZARqZ7IFKEEY5K390oXnlSA9XQYa9YsQ83TnKvJmL/Hi1NLMFZK5bfl36kUUyhnww
 xYcre+CJRVIUVbWjSbfXVULN+qhuYtqjVHYFSM76udJAhQ+iRqbqY+SgQTDo5d7ikjLw
 5mWO88SDajNEKOed37hD+sZF3hskTUTGqMemkY6a3FhZmjIPjY7CSKUkslX8HvWcEq0e
 Li3hCeihALKhxWcK7+Sa9E3XU58xTfanLBOZgAIGi/FG/MkWtWglyMdy4vSN5lX3ZvX5
 Tyf9WbGCI+COJJVxZOBibSKROTQMptKrUQBjyvtviKRQ3ndRn3ygyFQfbmjtoNq68MJe
 fJjw==
X-Gm-Message-State: AOJu0YzCsFxcx0/F5FIXbEHA7T4oQH4AIKzjcZC3BQ9JJz3noIWjx+Io
 9Uy9/5YGl4/clT9LzO+lgmhFExaQCOfeREJpK0Q=
X-Google-Smtp-Source: AGHT+IFAtsiHAtGrIvxv8N7q9GEQ7z4PmT5V6GQ/tCSN8D9YNFHI1x8/5iTGu9XLM7IHMVGBSLmbgkq+K9TUDjW6jhc=
X-Received: by 2002:a05:6102:3576:b0:443:72b0:6675 with SMTP id
 bh22-20020a056102357600b0044372b06675mr1744074vsb.16.1691785724241; Fri, 11
 Aug 2023 13:28:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230724014832.2207166-1-alistair.francis@wdc.com>
 <20230806154906.03f6a549@windsurf>
In-Reply-To: <20230806154906.03f6a549@windsurf>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 11 Aug 2023 16:28:17 -0400
Message-ID: <CAKmqyKN4KxtWSouG2FEt=cKV+a6MCQy_pHJvtAL_J6Lpn-oTQw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691785724; x=1692390524;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5HzKFNCX3/mRj0uFgPWJ3NLCayxs5AmR8xVuvfTXto8=;
 b=PcA5gc5Og/1M1Wv2PpkS5akYF4hV291e0F/IkB49mQ/DFvDZqUjddj4WbvSDBk5XuB
 JDMzFoGzSJQfUOY0GYDY1SeqaoGuNFnoSOLDTPtIZb1Z5csBRyfWlHjKToj/Ispa+HW7
 c+OL84EvgHa27aK0H4/eJdDnm97p6gUQribavluywz12tHx6KpSEQYnAJvxAvABi+xFv
 2gUSIt+BrJmbgUSnrj4H1zf4zvlzfWH74F6ME48uuSCzmXyy5Kyac9Uqy4ivzZTOjI3H
 jWKJAQ0XVDPkxkDwmNR2CzPtBDtGFCfmEdhDJCGn+hbxbqyFJVKDRrczBRH9aAWP9RS2
 9I9A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=PcA5gc5O
Subject: Re: [Buildroot] [PATCH v2 1/2] package/libopenssl: Copy the crypto
 include files
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCBBdWcgNiwgMjAyMyBhdCA5OjQ54oCvQU0gVGhvbWFzIFBldGF6em9uaQo8dGhvbWFz
LnBldGF6em9uaUBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIDI0IEp1bCAyMDIzIDEx
OjQ4OjMxICsxMDAwCj4gQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXIyM0BnbWFpbC5jb20+IHdy
b3RlOgo+Cj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJvcGVuc3NsL2xpYm9wZW5zc2wubWsg
Yi9wYWNrYWdlL2xpYm9wZW5zc2wvbGlib3BlbnNzbC5tawo+ID4gaW5kZXggMDZlYWM4ZjNkOS4u
YzY2YTg0MmNkZiAxMDA2NDQKPiA+IC0tLSBhL3BhY2thZ2UvbGlib3BlbnNzbC9saWJvcGVuc3Ns
Lm1rCj4gPiArKysgYi9wYWNrYWdlL2xpYm9wZW5zc2wvbGlib3BlbnNzbC5tawo+ID4gQEAgLTEy
Niw2ICsxMjYsMTAgQEAgZW5kZWYKPiA+Cj4gPiAgZGVmaW5lIExJQk9QRU5TU0xfSU5TVEFMTF9T
VEFHSU5HX0NNRFMKPiA+ICAgICAgICQoVEFSR0VUX01BS0VfRU5WKSAkKE1BS0UpIC1DICQoQEQp
IERFU1RESVI9JChTVEFHSU5HX0RJUikgaW5zdGFsbAo+ID4gKyAgICAgbWtkaXIgLXAgJChTVEFH
SU5HX0RJUikvdXNyL2luY2x1ZGUvY3J5cHRvCj4gPiArICAgICAkKElOU1RBTEwpIC1tIDY0NCAk
KEBEKS9pbmNsdWRlL2NyeXB0by8qICQoU1RBR0lOR19ESVIpL3Vzci9pbmNsdWRlL2NyeXB0by8K
PiA+ICsgICAgIG1rZGlyIC1wICQoU1RBR0lOR19ESVIpL3Vzci9pbmNsdWRlL2ludGVybmFsCj4g
PiArICAgICAkKElOU1RBTEwpIC1tIDY0NCAkKEBEKS9pbmNsdWRlL2ludGVybmFsLyogJChTVEFH
SU5HX0RJUikvdXNyL2luY2x1ZGUvaW50ZXJuYWwvCj4KPiBJJ20gc3RpbGwgcXVpdGUgY29uY2Vy
bmVkIGFib3V0IHRoaXMuIFdoeSB0aGUgaGVjayBkb2VzIGxpYnNwZG0gcmVxdWlyZQo+IHRoZSBp
bnRlcm5hbC9wcml2YXRlIGhlYWRlcnMgb2YgT3BlblNTTCwgYW5kIG5vIG90aGVyIHBhY2thZ2Ug
bmVlZHMKPiB0aGF0PyBJdCBzZWVtcyB2ZXJ5IG9kZCwgYW5kIHBvdGVudGlhbGx5IHZlcnkgd3Jv
bmcuIE9uZSBjYW4gYXNzdW1lCj4gc3VjaCBpbnRlcm5hbCBoZWFkZXJzIGV4cG9zZSBpbnRlcm5h
bCBBUElzIHRoYXQgZG9uJ3QgaGF2ZSB0aGUgc2FtZQo+IGJhY2t3YXJkIGNvbXBhdGliaWxpdHkg
Z3VhcmFudGVlcyBhcyBwdWJsaWMgQVBJcy4KClllYWgsIHlvdSBhcmUgcmlnaHQuIEknbSBnb2lu
ZyB0byB3b3JrIHdpdGggdXBzdHJlYW0gbGlic3BkbSB0byByZW1vdmUKdGhlIHJlcXVpcmVtZW50
IG9uIHRoZXNlIGFuZCB0aGVuIEknbGwgdHJ5IGFnYWluLgoKQWxpc3RhaXIKCj4KPiBXaGF0IG1h
a2VzIGxpYnNwZG0gc28gc3BlY2lhbD8gSXMgdGhlcmUgYW55IHBvdGVudGlhbCBzaWRlIGVmZmVj
dCBvZgo+IGV4cG9zaW5nIHRob3NlIE9wZW5TU0wgcHJpdmF0ZS9pbnRlcm5hbCBoZWFkZXJzIHRv
IHRoZSB3aWRlciB3b3JsZCwgYXMKPiB5b3VyIHBhdGNoIGRvZXM/Cj4KPiBCZXN0IHJlZ2FyZHMs
Cj4KPiBUaG9tYXMKPiAtLQo+IFRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJv
b3RsaW4KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmlu
Zwo+IGh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
