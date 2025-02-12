Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C594C02198
	for <buildroot@archiver.kernel.org>; Wed, 12 Feb 2025 13:56:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCA29610A1;
	Wed, 12 Feb 2025 13:56:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X7FbVKtDPbxa; Wed, 12 Feb 2025 13:56:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D956D610A7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D956D610A7;
	Wed, 12 Feb 2025 13:56:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 739A8C2
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 13:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 574C1404CA
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 13:56:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8TjLB3zEUc2S for <buildroot@buildroot.org>;
 Wed, 12 Feb 2025 13:56:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 69D5740491
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69D5740491
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 69D5740491
 for <buildroot@uclibc.org>; Wed, 12 Feb 2025 13:56:38 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-308f141518cso32782731fa.2
 for <buildroot@uclibc.org>; Wed, 12 Feb 2025 05:56:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739368596; x=1739973396;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yt42P0FaK87lJPGJRU5841saXtP07QUzRPw1DdVyogc=;
 b=ko6j5ETXCJzn2jy01fLrDwNkOGG0EU2XLOlOfjCVN6PEE7eRufwKlTOHrkqr48AkUp
 hYmf0Fk8nzOaOnAkNZKD8jtfqlrzYJSPPiVg3paLjpo/9uC6KgJO8WRlbjngmznJGhoZ
 2YQWv6bJuREQeoM4CCB69NyeRxxZGwXNgSxEkeO4K1b5ssCADUzDSptBGeODgn1ZWX5z
 RfGXe93T8H5DYuM6nEgKY8/qZZ/2F/ZoZ0l/ClLTUrqRq3k117GIB9Q5jEF/V4x/7Adj
 rN/4uuglZy2NfqWuNj5ymiWHPHmmHP6qTVjtQ5X8nZt/VD/FQVARPOVj181tF+pKjg35
 K30A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDtYumY8gJ+QYc2Bltq5HkfOEkhOKyl1f/9cHe+o6kUNzw5P4xiLmWOogEMA0DgAG+qrg3EP5+ufs=@uclibc.org
X-Gm-Message-State: AOJu0YzLjIV8cpDp1wNf1UlexlW0JypDZWKjhaDMiMbfebp7jl5QDo4U
 OfYkLYyMNfK6W6IQ2Wg5QY6EnXdX1+z/cjnIW/4lXmBU2mf+Dgp2CW/d1H5JtoCXaJ5QVA/XBfi
 sMOniGi9DajTUoJPbIcSXejc59Os=
X-Gm-Gg: ASbGncsJe+aXTYBqnB7K/mbrroZpgnTYPV7karXFfbgVGlNSReZKiY97N/brIpCfzpB
 k2+8pRwdU/0tJR+TH3APBNREnnj/urvW6Q05gVRQh2k3VM8dUmgNxl1rFduu04lDcaoWAnKFWSg
 ==
X-Google-Smtp-Source: AGHT+IE2Vk8uZZNC/pcf7n0Abn0A02i+eMfb1x3DxlbZXHAcR2U/6q2FIaL9k69dj/GCNtD5astRdBVFU47bCglVjSM=
X-Received: by 2002:a05:6512:3b87:b0:544:ee5:87b0 with SMTP id
 2adb3069b0e04-5451826e9bcmr1395622e87.3.1739368595675; Wed, 12 Feb 2025
 05:56:35 -0800 (PST)
MIME-Version: 1.0
References: <20250210022648.1634973-1-fancp2007__48543.0357208074$1739154457$gmane$org@gmail.com>
 <pan$2c183$bf7fddbb$580230b4$48c2eea8@ID-313208.user.individual.net>
 <CAFkzVZas4H_PYmmSkhVAiQjBfzZzdSF8EcgAVEn=6JE_bVv1yQ@mail.gmail.com>
 <871pw31g18.fsf@dell.be.48ers.dk>
In-Reply-To: <871pw31g18.fsf@dell.be.48ers.dk>
From: Scott Fan <fancp2007@gmail.com>
Date: Wed, 12 Feb 2025 21:56:22 +0800
X-Gm-Features: AWEUYZlXYy-mM0BFpxQyH42rtY3kKq3O4vzmDJ5sHwsMwY-alhHa89e7WA7UqpM
Message-ID: <CAFkzVZY7GxPe_mcSFKZY9J7rw-8jMdRZZOuLaGJyfxZ0VJvXGw@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@uclibc.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739368596; x=1739973396; darn=uclibc.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yt42P0FaK87lJPGJRU5841saXtP07QUzRPw1DdVyogc=;
 b=ZdsFaFMct/qAh+ut95VTscVXfNFoPjwcTvJqgbPn+eLbNQnHmABA+vxfhQxtTWSoTx
 Czr7UCJpsM4J+4Y2xvFpq0UQYer0QloDfcIO66JpCfvtbbwIoQuy3xXTGPqYZXeSUIhe
 ff05pXBKqcpusgv5sdzQZuXJwUvtppc74FJNpH9qy0ju6TUuA4UkYq0jwbBaTLsW7htJ
 VlfB0VVNtDPGi/6onDCdz8y+VJPuayFU5uEILJxixHiaMWVp8KSdPRK+IdBh+LVsYi7m
 oeOsteRDYQHzXgxaxOp6xTDM2X2eO76vIy90zbW9zgSFDayTJ0hJB8tWHE87R8QTlLvm
 ACSw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZdsFaFMc
Subject: Re: [Buildroot] [PATCH] package/sqlite: bump version to 3.49.0
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

SGksCgpJIGhhZCBzZW50IGEgbmV3IHBhdGNoIGZpbGUgdG8gZml4IHRoZSBpc3N1ZSBjYXVzZWQg
YnkgdGhlIEF1dG9zZXR1cApjb25maWd1cmUgc2NyaXB0LgoKU2NvdHQgRmFuCgpPbiBXZWQsIEZl
YiAxMiwgMjAyNSBhdCA4OjUy4oCvUE0gUGV0ZXIgS29yc2dhYXJkIDxwZXRlckBrb3JzZ2FhcmQu
Y29tPiB3cm90ZToKPgo+ID4+Pj4+ICJTY290dCIgPT0gU2NvdHQgRmFuIDxmYW5jcDIwMDdAZ21h
aWwuY29tPiB3cml0ZXM6Cj4KPiAgPiBXaGVuIEkgZm91bmQgdGhlIGNvbXBpbGF0aW9uIGVycm9y
IG1lc3NhZ2UsIEkgaW1tZWRpYXRlbHkgY2hhbmdlZCB0aGUKPiAgPiBwYXRjaCB0aGF0IGhhZCBi
ZWVuIHNlbnQgdG8gcGF0Y2h3b3JrIHRvIHRoZSBDaGFuZ2VzIFJlcXVlc3RlZCBzdGF0ZQo+ICA+
IHRvIHByZXZlbnQgaXQgZnJvbSBiZWluZyBtZXJnZWQgaW50byB0aGUgbWFpbmxpbmUsIGJ1dCBJ
IGRvbid0IGtub3cKPiAgPiB3aHkgaXQgd2FzIGZpbmFsbHkgbWVyZ2VkLgo+Cj4gRm9yIHRoZSBm
dXR1cmUgcGxlYXNlIHNlbmQgYSBtZXNzYWdlIGV4cGxhaW5pbmcgd2h5IHRoaXMgd2FzIGRvbmUu
IEkKPiBhc2tlZCBhcm91bmQgd2l0aCB0aGUgb3RoZXIgY28tbWFpbnRhaW5lcnMgYW5kIGVuZGVk
IHVwIHdpdGggdGhlICh3cm9uZykKPiBjb25jbHVzaW9uIHRoYXQgaXQgd2FzIG1hcmtlZCBhcyBj
aGFuZ2VzIHJlcXVlc3RlZCBieSBhY2NpZGVudC4KPgo+IEhhdmUgeW91IGhhZCBhIGxvb2sgYXQg
aG93IHRvIGZpeCB0aGUgaXNzdWUgb3Igc2hvdWxkIEkgcmV2ZXJ0Pwo+Cj4gLS0KPiBCeWUsIFBl
dGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
