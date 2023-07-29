Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A95EB64DD
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 01:20:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A5FB61371;
	Sat, 29 Jul 2023 01:20:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A5FB61371
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v5qjwNyIftfj; Sat, 29 Jul 2023 01:20:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E922760F36;
	Sat, 29 Jul 2023 01:20:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E922760F36
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2DB801BF3E0
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 01:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 05FBF60F36
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 01:20:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05FBF60F36
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4t2qx1MdiQex for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 01:20:03 +0000 (UTC)
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BBF8660E78
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 01:20:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBF8660E78
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2b9c0391749so41271121fa.0
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 18:20:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690593600; x=1691198400;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8cflq0HspmnnmJo6ZWjaauLJhmbzTVan4LjNfmost40=;
 b=LvaeZGNX2uk5C3xQIXRWX8lBVk2lewyVdSEc1vBrNozd80iCy57Oqp39rZDIoF9UaQ
 G+vBSjIurLzykdXQKcv5pnNzJDl0LYcUJr+Kn+rQM7vh17rVZ1m6JU/1buyYNQkGckOH
 lLibbTLfPo8DUD2mNinLWMP0xHBtog0YWA0zdOwbENxNNK6d0ewcIso1hQHgJLm/ibnD
 ETjffKd3fMAk4RYFr03lEECTpASBedm1VZ43T7ACGyC1scAfMx9Ikr0w9g4nTrhovu/p
 x8Q+pqQUdkOpdeNnCdhzVw9UqsuiYVz+vyIecSfz479jRUe7sKlgefn5Jzwr5/yUIFCm
 sUCQ==
X-Gm-Message-State: ABy/qLbFlEbihs/FfhZxTQxkAAxKFePCnpXDz9lItcw89pdSf1vDKOW/
 /ztoPEYSn71tPm3wvsIfEkCB9aCh3seQGPaJSTXQE4sMnBA=
X-Google-Smtp-Source: APBJJlEJX6wDIEn1+94uSxHNgGpYhbwzf2h05axoU1xfnSCwjdBSOzsxH3P2yTQLAx9wg/FIEUSdwg==
X-Received: by 2002:a2e:910f:0:b0:2b9:5695:d10d with SMTP id
 m15-20020a2e910f000000b002b95695d10dmr2732738ljg.36.1690593599934; 
 Fri, 28 Jul 2023 18:19:59 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com.
 [209.85.167.47]) by smtp.gmail.com with ESMTPSA id
 s17-20020a2e98d1000000b002b32600ab9fsm1182108ljj.60.2023.07.28.18.19.58
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jul 2023 18:19:59 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-4fe1b00fce2so3621324e87.3
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 18:19:58 -0700 (PDT)
X-Received: by 2002:ac2:5f9c:0:b0:4f9:92c7:401d with SMTP id
 r28-20020ac25f9c000000b004f992c7401dmr2763965lfe.30.1690593598050; Fri, 28
 Jul 2023 18:19:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230728052530.1122268-1-christian@aperture.us>
 <20230728092656.5ae69f0f@windsurf>
In-Reply-To: <20230728092656.5ae69f0f@windsurf>
Date: Fri, 28 Jul 2023 18:19:46 -0700
X-Gmail-Original-Message-ID: <CA+h8R2qG4w+mHrZTZ0EmTXjH=txfGQT8-p3f_K_GqP0+8bP8hQ@mail.gmail.com>
Message-ID: <CA+h8R2qG4w+mHrZTZ0EmTXjH=txfGQT8-p3f_K_GqP0+8bP8hQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1690593600; x=1691198400;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8cflq0HspmnnmJo6ZWjaauLJhmbzTVan4LjNfmost40=;
 b=t3zJS0R5nMQgppgq7rMRLLCJCnsjEQ/v3bGMG738I/gg/4tVjhAsFRSirv979Gco/a
 a8UmLWQ3rMY14Watgsqg9spBwMpm0ngZyeKSBGEowMsyThHrt2PTQx89e/nN6kDEoPe3
 lV6J2O7MQZFwPTem0Jec7wH+zuYgZTAU2mCWEWtlbAjvextFw8WA63tEAz5fDBHeu2BU
 ZQdb/zJaMzHM+45t5dL+A3KxfqsOD1Xnx4uST0JWGPKYippg0c45XD+ZVYHce2aEg02z
 ENJ2zdnzwNCQgnWbScAJNOYf10/qzIrBmokIOh5FsuviVrF4v1uPdMP4khmeWZF5o6+u
 vw3Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=t3zJS0R5
Subject: Re: [Buildroot] [PATCH v1 1/1] package/go: add toolchain as
 dependency of host-go
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoKT24gRnJpLCBKdWwgMjgsIDIwMjMgYXQgMTI6MjfigK9BTSBUaG9tYXMgUGV0
YXp6b25pCjx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKPiBXaGF0IGhhcHBl
bnMgd2hlbiB3ZSdyZSBidWlsZGluZyBob3N0LWdvIGZvciBhIHRhcmdldCBhcmNoaXRlY3R1cmUg
dGhhdAo+IEdvIGRvZXMgbm90IHN1cHBvcnQ/IFRoaXMgd2FzIHByZXZpb3VzbHkgc3VwcG9ydGVk
IGluIGhvc3QtZ28sIGluIHdoaWNoCj4gd2UgaGF2ZSB0aGlzIGNvbmRpdGlvbjoKPgo+IGlmZXEg
KCQoQlIyX1BBQ0tBR0VfSE9TVF9HT19UQVJHRVRfQVJDSF9TVVBQT1JUUykseSkKPiAuLi4KPiBl
bmRpZgo+Cj4gdG8gZW5zdXJlIHdlIGJ1aWxkIGEgaG9zdC1nbyBjb21waWxlciBjYXBhYmxlIG9m
IGJ1aWxkaW5nIGNvZGUgZm9yIHRoZQo+IHRhcmdldCBpZiB0aGUgdGFyZ2V0IGlzIHN1cHBvcnRl
ZCwgYnV0IGluIGFsbCBjYXNlcyBidWlsZHMgYSBHbwo+IGNvbXBpbGVyIGNhcGFibGUgb2YgY29t
cGlsaW5nIGNvZGUgZm9yIHRoZSBob3N0LiBJbmRlZWQsIGhvc3QtZ28gbWlnaHQKPiBhbHNvIGJl
IG5lZWRlZCBzb2xlbHkgdG8gYnVpbGQgaG9zdCB1dGlsaXRpZXMsIHdoaWNoIHdvdWxkIGJlIHJl
bGV2YW50Cj4gZXZlbiBpZiB0aGUgdGFyZ2V0IGFyY2hpdGVjdHVyZSBpc24ndCBzdXBwb3J0ZWQg
YnkgR28uCgpJIHN1cHBvc2UgaWYgeW91IGRvbid0IHNldCBDQ19GT1JfVEFSR0VUIG5vciBDWFhf
Rk9SX1RBUkdFVCB0aGVuIHRoZQpHbyBjb21waWxlciB3aWxsIHNpbXBseSB1c2UgQ0MgYW5kIENY
WCB3aGljaCBhcmUgSE9TVENDX05PQ0NBQ0hFIGFuZApIT1NUQ1hYX05PQ0NBQ0hFLgoKSSBub3Rp
Y2VkIHRoZXJlJ3MgYWxyZWFkeSBhIGxpbmUgd2hpY2ggYWRkcyB0b29sY2hhaW4gYXMgYSBkZXBl
bmRlbmN5CmlmIGNnbyBpcyBlbmFibGVkLgoKV2lsbCBtYXJrIHRoaXMgcGF0Y2ggYXMgbm90IGFw
cGxpY2FibGUgZm9yIG5vdyBhbmQgY29uc2lkZXIgd2h5IHRoZQpidWlsZCBmYWlsZWQgaW4gdGhl
IFRlc3RNZW5kZXIgdGVzdCBjYXNlIHdoZW4gcnVubmluZyAibWFrZSBob3N0LWdvIgp3aXRob3V0
IGJ1aWxkaW5nIHRoZSB0b29sY2hhaW4gZmlyc3QuIEkgZ3Vlc3MgdGhhdCdzIGEgY2FzZSB3aGVy
ZSBjZ28KaXMgbm90IGVuYWJsZWQgYW5kIHlldCBCUjJfUEFDS0FHRV9IT1NUX0dPX1RBUkdFVF9B
UkNIX1NVUFBPUlRTPXkuCgpXZSBzaG91bGQgbW92ZSB0aGUgdG9vbGNoYWluIGRlcGVuZGVuY3kg
dG8gYmUgaWYKQlIyX1BBQ0tBR0VfSE9TVF9HT19UQVJHRVRfQVJDSF9TVVBQT1JUUyBpbnN0ZWFk
IG9mIGlmIENnbyBpcyBlbmFibGVkLApJIHRoaW5rLgoKYmVzdCwKQ2hyaXN0aWFuCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
