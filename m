Return-Path: <SRS0=yDzA=MT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E39AC4338F
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 06:54:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC99861132
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 06:54:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DC99861132
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAD42605EB;
	Tue, 27 Jul 2021 06:54:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lVd3AXtLpG5E; Tue, 27 Jul 2021 06:54:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C33A605C0;
	Tue, 27 Jul 2021 06:54:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9D3E81BF2BF
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 06:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C0ED400CA
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 06:54:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rj4_Dntl61jI for <buildroot@lists.busybox.net>;
 Tue, 27 Jul 2021 06:54:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8C2B6400A8
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 06:54:11 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id m9so14569073ljp.7
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 23:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pLoLgb2FJ0ghz7jqXiqXkzaohzt+pJ3Am1U9P1N54CU=;
 b=q3psw2WDRNFi7pCuXF/GxfttuA1URPpvBCuJbuXEe6Oj/lf60EVULO6AlofaxX//b2
 sFuIzUZLbvFUt71l6VujGU34dzyhsBRsE9qtni6IlkGVrVWBpLlNXaqzJSx98vRbw4GG
 b/ct8fT+sRkbIiLvqBPcQolf1P9PIGN5oTHqwuJ2xHst/Bi/+E7UM4My5Q6d+jUZKByW
 xNNl8XXHkiT8hMmpWyse/gwz3ss7FZ5FTT6pseh6MDm9aNLqTgRWTXYrspL/U515eD9V
 GJeUnAKviLCjwj+MSx//PY8ZbryA9HHzNVCymbTBCZnpZ3FZNeWm3focFs9JvDsfoGAn
 VM7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pLoLgb2FJ0ghz7jqXiqXkzaohzt+pJ3Am1U9P1N54CU=;
 b=HyIc4Ah8G/34KSYQGIGoncnbM1RBJ/D67TDlgIEW7aGvfecLp83LK+9t6bonux9l1t
 RFwBulfhdsitkeKZvlO3v5P79lAX4mKM+/37ackdAc20PvwqDfnqrbAdGBNp5cEwZ7E/
 HknHPpoKzOMiqbKwucKT3D9WGqeh7mRUgJJPn3WjujCO72PRmT+xv/jLK4WCvqfdpYGP
 SQ2ScT5B/6FIWGY/mtehGNnp7IGdjMkaABklNaM/CjJ4qu2Za99o4R/aWtvBoe7RT5h2
 jJY9q8jbnd3E2UQd5iNj00LevC1g65zmzM8cly6W8YYtPJf2uE5Tdbi8+H2S2RAbR0f9
 SEsA==
X-Gm-Message-State: AOAM5310uQrRouHvaF3m9Fl6igFvMh/puftSFQ/bt+Mq4M88urmR6iAR
 c/LCuqJMFwduT89bPoKC1YmKztx6LoeZyQqiCW8=
X-Google-Smtp-Source: ABdhPJzx4ueExnzJZ2KH9x3lgnqINULrB80kzaFAYWuYmB9RH//OZpWEkGyrOo9X3g0bdxNq/BHlxnd/WJ52FlYBYz4=
X-Received: by 2002:a2e:7d15:: with SMTP id y21mr14687992ljc.230.1627368849401; 
 Mon, 26 Jul 2021 23:54:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210726082131.1705945-1-fontaine.fabrice@gmail.com>
 <20210726141522.38012b89@windsurf>
In-Reply-To: <20210726141522.38012b89@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 27 Jul 2021 08:53:55 +0200
Message-ID: <CAPi7W81OG0DYk7nrPLzVPeLEAxyau3AHn-z_w9oV+kjm3Z2s6Q@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/drbd-utils: add SELinux module
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGVsbG8sCgpMZSBsdW4uIDI2IGp1aWwuIDIwMjEgw6AgMTQ6MTUsIFRob21hcyBQZXRhenpvbmkK
PHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IGEgw6ljcml0IDoKPgo+IEhlbGxvIEZhYnJp
Y2UsCj4KPiBPbiBNb24sIDI2IEp1bCAyMDIxIDEwOjIxOjMxICswMjAwCj4gRmFicmljZSBGb250
YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gPiBTdXBwb3J0IGZv
ciBkcmJkLXV0aWxzIGlzIGFkZGVkIGJ5IHRoZSBzZXJ2aWNlcy9kcmJkIG1vZHVsZSBpbiB0aGUK
PiA+IFNFTGludXggcmVmcG9saWN5Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9u
dGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+ID4gLS0tCj4gPiAgcGFja2FnZS9k
cmJkLXV0aWxzL2RyYmQtdXRpbHMubWsgfCAxICsKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKykKPgo+IEkgaGF2ZSBhIHF1ZXN0aW9uOiBhcmUgeW91IHRlc3RpbmcvdXNpbmcgYWxs
IHRoZXNlIHBhY2thZ2VzIGluIGFuCj4gU0VMaW51eCBjb250ZXh0ID8KTm9wZSwgSSdtIG5vdCBk
b2luZyBydW50aW1lIHRlc3RzIGZvciBhbGwgdGhlc2UgcGFja2FnZXMuCkknbSBqdXN0IHRyeWlu
ZyB0byBleHRlbmQgU0VMaW51eCBzdXBwb3J0IGluIGJ1aWxkcm9vdCBieSBmaW5kaW5nCm1hdGNo
ZXMgYmV0d2VlbiBidWlsZHJvb3QgcGFja2FnZXMgYW5kIHJlZnBvbGljeSBtb2R1bGVzLgpJJ2xs
IGZpeCBmYWlsdXJlcyByYWlzZWQgYnkgYXV0b2J1aWxkZXJzIChlLmcuCmh0dHBzOi8vZ2l0aHVi
LmNvbS9TRUxpbnV4UHJvamVjdC9yZWZwb2xpY3kvcHVsbC8zOTYpLgpGb3IgcnVudGltZSBmYWls
dXJlcywgSSdtIGhvcGluZyB0aGF0IHVzZXJzIG9mIHRob3NlIHBhY2thZ2VzIHdpdGgKU0VMaW51
eCB3aWxsIHJlcG9ydCB0aGVtIHRvIGh0dHBzOi8vYnVncy5idWlsZHJvb3Qub3JnLgo+Cj4gVGhv
bWFzCj4gLS0KPiBUaG9tYXMgUGV0YXp6b25pLCBDVE8sIEJvb3RsaW4KPiBFbWJlZGRlZCBMaW51
eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCj4gaHR0cHM6Ly9ib290bGluLmNvbQpCZXN0IHJlZ2Fy
ZHMsCgpGYWJyaWNlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1c3lib3gubmV0Cmh0dHA6Ly9s
aXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
