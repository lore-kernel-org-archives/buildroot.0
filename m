Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 357CEC3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 21:34:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F239C606FA;
	Mon, 19 Aug 2024 21:34:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sp-EqGGPJPJ8; Mon, 19 Aug 2024 21:34:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECC3160826
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECC3160826;
	Mon, 19 Aug 2024 21:34:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 19C701BF398
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 21:34:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 078D680B7E
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 21:34:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pfXXk1X0sn-O for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 21:34:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 090A480B1A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 090A480B1A
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 090A480B1A
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 21:34:51 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a7abe5aa9d5so514760566b.1
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 14:34:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724103289; x=1724708089;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WGexndHFJs+lPOZk8KUGx8oVFxGGNMJjV4ZepQaXIGg=;
 b=C7A5gZ6aGVlFISvoMGxm3p13ehaABoL76rIv9dye0n6LD/uScl+53AJqLyQ+WxPCol
 iJRLAgyP1JBvSyUxdiR/r/tRJkfkbcq6JHRp/OhTJh7fNWbnoQHPJPE3NoW9tNV18iw1
 wDTmN22xM9avE1ZzkOWRb4ZKyOmB8gW0Q8EsBSWYy0EMZ2rHx4iAGGIBJ5pzi5DeXE2v
 qZx/Whfq+lgOvgw8bUl9Bx+XqKSu+Mc0DPrVaU+8gIkSE3A4YsZldxL24SAAxEOg9nIV
 wbyuLt8iwaU+HT+KWLzSp7usRwGwPHvYKNEiAMDAq5CI8KhM8HGQpVk6/PTJlM8/T5I6
 JGfw==
X-Gm-Message-State: AOJu0YxEwS8OSc1xaBjgn0zKgr0UTtnJIRVxm5NjTbyGf/0DQSlFxcT1
 LI4P0xgzPUG3dOv1dC3RMSRxh7lBYN5q1UOZPRghLOl0tdYB2wgfJc+wzPwbRjn++s2+WlVxMiX
 pNowc8Q==
X-Google-Smtp-Source: AGHT+IGnljN/10JAa9EST6HIhuJl6lR3e+nDz9cC5yzeav301+/Tv5B2lgkH6UnoyDiYFK0zKiU83A==
X-Received: by 2002:a17:907:97c2:b0:a7c:f6f5:390e with SMTP id
 a640c23a62f3a-a8392a38b3emr839084966b.58.1724103289055; 
 Mon, 19 Aug 2024 14:34:49 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com.
 [209.85.218.54]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a838394712esm672362166b.163.2024.08.19.14.34.48
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2024 14:34:48 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-a864574429aso30651666b.0
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 14:34:48 -0700 (PDT)
X-Received: by 2002:a17:907:c885:b0:a7d:a4d2:a2ba with SMTP id
 a640c23a62f3a-a83929d3666mr859635466b.49.1724103288086; Mon, 19 Aug 2024
 14:34:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAEpB38NWKuFapnjbEofugLm-csmkwq1dUbvh0jRbcPRVO5K19Q@mail.gmail.com>
 <ZsO2bDVn41vsZfq1@landeda>
In-Reply-To: <ZsO2bDVn41vsZfq1@landeda>
Date: Mon, 19 Aug 2024 14:34:37 -0700
X-Gmail-Original-Message-ID: <CA+h8R2q9ueiNE+SKXNJGq4zGnquRZ=jN-8MHKOwUNVNcBj7yXA@mail.gmail.com>
Message-ID: <CA+h8R2q9ueiNE+SKXNJGq4zGnquRZ=jN-8MHKOwUNVNcBj7yXA@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1724103289; x=1724708089; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WGexndHFJs+lPOZk8KUGx8oVFxGGNMJjV4ZepQaXIGg=;
 b=1mlYEgsEULC99uBBEGt+1qYPo/N7ulmhoNG0xAqEqXrjegTMojJb4QtkqhDOlj0jVy
 5VgQkD4Lan0fh8/73+DFblpBqyxIuPaKpWXCIh/BlmVymTSnbU56pXYX6cZSMhlnpYYs
 bgiDrPjn4TJTFHF/Q4rMJUkElS5giWkxFN5z7it4wH9LaEf4xvN0+miqRaJ+1JjtEknK
 VQzKfAc7jrjvHxmfHkYzPgzoXK2aYl8rewkKgo+23g9c6QJxjpquv+oX0QhDZOtLSmgt
 wh3AWmp7CwXv70s+mznfeD6LnuDr1shzhfA466Ng1AZ2hAeheeHARqETeC+lzfsIywgN
 ANYA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=1mlYEgsE
Subject: Re: [Buildroot] [PATCH v8 1/1] package/go: use host compiler when
 go-bootstrap unsupported
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
Cc: Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

WWFubiwKCk9uIE1vbiwgQXVnIDE5LCAyMDI0IGF0IDI6MTfigK9QTSBZYW5uIEUuIE1PUklOIDx5
YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gd3JvdGU6Cj4gPiBSZWNlbnQgY2hhbmdlcyBhZGRlZCBn
by1zcmMgd2l0aCB0aGUgaW50ZW50IG9mIGFkZGluZyBnby1iaW4gbGF0ZXIuIFRoaXMKPiA+IGNv
bW1pdCBjaGFuZ2VzIGdvLXNyYyB0byBkZXBlbmQgb24gdGhlIGhvc3QgR28gY29tcGlsZXIgdG8g
Ym9vdHN0cmFwCj4gPiBnby1zcmMgb24gYXJjaGl0ZWN0dXJlcyB0aGF0IGNhbm5vdCBidWlsZCBn
by1ib290c3RyYXAtc3RhZ2UxIChzdWNoIGFzIGFybTY0KS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBDaHJpc3RpYW4gU3Rld2FydCA8Y2hyaXN0aWFuQGFwZXJ0dXJlLnVzPgo+Cj4gVGhhbmtzIGZv
ciB0aGlzIG5ldyBpdGVyYXRpb24uIEJ1dCBJJ2QgcmF0aGVyIGZpcnN0IGhhdmUgdGhlIHN1cHBv
cnQgZm9yCj4gaG9zdC1nby1iaW4sIHJhdGhlciB0aGFuIHJlbHkgb24gdGhlIHN5c3RlbSBnby4K
Pgo+IEluZGVlZCwgdXNuZyBob3N0LWdvLWJpbiB3b3VsZCBub3QgcmVxdWlyZSB0aGUgdXNlciB0
byBpbnN0YWxsIGdvIG9uCj4gdGhlaXIgc3lzdGVtOyBob3N0LWdvLWJpbiBjYW4gYmUgdXNlZCBv
biBvZGVyIGRpc3RyaWJ1dGlvbnMgd2hlcmUgYSBnbwo+IGNvbXBpbGVyIGlzIG5vdCBhdmFpbGFi
bGUsIG9yIHdoZXJlIHRoZSBnbyBjb21waWxlciBpcyB0b28gb2xkIHRvIGJ1aWxkCj4gZ28tc3Jj
Lgo+Cj4gU28sIEkgYW0gbm90IGNvbnZpbmNlZCBhYm91dCB0aGlzICJ1c2UgdGhlIHN5c3RlbSBn
byIgc29sdXRpb24uCgpUaGVzZSBhcmUgdHdvIGRpZmZlcmVudCB1c2UgY2FzZXMuCgpXaGF0IHlv
dSBhcmUgZGVzY3JpYmluZyBpcyBkb3dubG9hZGluZyBhbmQgdXNpbmcgdGhlIHByZS1idWlsdCBH
byBmb3IKZXZlcnl0aGluZy4KCldoYXQgdGhpcyBwYXRjaCBhY2NvbXBsaXNoZXMgaXMgYm9vdHN0
cmFwcGluZyBob3N0LWdvLXNyYyB1c2luZyB0aGUKc3lzdGVtIEdvIGNvbXBpbGVyLgoKQm90aCBj
YW4gYmUgc3VwcG9ydGVkLCB0aGlzIHBhdGNoIGZpeGVzIHdoZW4gd2Ugc2VsZWN0IGhvc3QtZ28t
c3JjIG9uCmFuIGFybTY0IG1hY2hpbmUuCgpUaGlzIGlzIG5vIGRpZmZlcmVudCBmcm9tIHVzaW5n
IHRoZSBob3N0IGdjYyB0byBib290c3RyYXAgdGhlIEJ1aWxkcm9vdCBnY2MsIG5vPwoKQmVzdCBy
ZWdhcmRzLApDaHJpc3RpYW4gU3Rld2FydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
