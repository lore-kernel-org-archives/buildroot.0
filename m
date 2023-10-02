Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C091BE74902
	for <buildroot@archiver.kernel.org>; Mon,  2 Oct 2023 18:29:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56F00610C1;
	Mon,  2 Oct 2023 18:29:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56F00610C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8SiltNHgT1Yy; Mon,  2 Oct 2023 18:29:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99EB96112A;
	Mon,  2 Oct 2023 18:29:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99EB96112A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D7BDE1BF3B9
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 18:29:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE9DC610F3
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 18:29:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE9DC610F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gFdRwLxWK3gp for <buildroot@lists.busybox.net>;
 Mon,  2 Oct 2023 18:29:03 +0000 (UTC)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9444A6103F
 for <buildroot@buildroot.org>; Mon,  2 Oct 2023 18:29:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9444A6103F
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9a6190af24aso5497366b.0
 for <buildroot@buildroot.org>; Mon, 02 Oct 2023 11:29:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696271341; x=1696876141;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=At4oD0xiQLo2xRRY+yg7reTE048Ke+oG+7tZf7OfBJc=;
 b=oT04z6lwIW0hQDpNLF9C5DqpMhpcitpOxOUgnP/szjBPpwEprmhnLOdHlL3HdbnQ+v
 1af5IX3v4NETEhfRVAqeyF7GY3r1T1eM589qI/k5hAnhTqocwE/UiuiRrVEmZLifNnrQ
 tTnc9A5OWOQ8KJ6IxvY6Xpl7a4V8wnErErQcXRrE60WjiJpeeTgfqMrz2sJexwQ2OQ+s
 +qLygOYD+Efo+WA/oA47ulABZTYHt0GyHH8Zxp6KxdQ2VGya5oxIOrKXdsC8ZoN9pMu+
 7egjc47uBEzSSQ7N7xhD5duljMsTc2C0b31MkqAG2NO0M+zvNLk/Zy7wVai3T4lL3odL
 9snw==
X-Gm-Message-State: AOJu0Yxn2tTniyXJDBvWVq5Mhg8WwBwBrJSzY8UZGtdugzbUVl1f058d
 ht46jhcHIrSiqXXKd29lL5XERkmDaJJ9D9tZ2FO9CA==
X-Google-Smtp-Source: AGHT+IGhN/I6rDbBCu4O7jfEcSL25vMdp8uWNGPO+uQJwNtxOPNqvsoM+6WOp+Gkgz44j/RE2FbmgA==
X-Received: by 2002:a17:906:19b:b0:9ae:48e7:bac9 with SMTP id
 27-20020a170906019b00b009ae48e7bac9mr12038568ejb.52.1696271341442; 
 Mon, 02 Oct 2023 11:29:01 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com.
 [209.85.218.53]) by smtp.gmail.com with ESMTPSA id
 p7-20020a170906140700b009829d2e892csm17807992ejc.15.2023.10.02.11.29.00
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Oct 2023 11:29:00 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-99357737980so1733866b.2
 for <buildroot@buildroot.org>; Mon, 02 Oct 2023 11:29:00 -0700 (PDT)
X-Received: by 2002:a17:907:75f4:b0:9a1:fb4c:3b6c with SMTP id
 jz20-20020a17090775f400b009a1fb4c3b6cmr10822888ejc.59.1696271340492; Mon, 02
 Oct 2023 11:29:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230727232235.449788-1-christian@aperture.us>
 <b73fb293249bcf48f42ebaed0f78f1c1@agner.ch>
 <CA+h8R2r3sxFvPN5QFt9szw638M_9o=WRC3a8pUQ1O2KrGMvrkw@mail.gmail.com>
 <08DC739C-F115-4DB2-9F9A-0CD6E9BFEA42@agner.ch>
 <CA+h8R2rbhvCt60Fhwi1qGv0PocZsS0rA3fVQoukDP2KhPrkjdQ@mail.gmail.com>
 <23f2b3bd59cb6d860ea52b566eacfdb8@agner.ch>
 <CA+h8R2o9eAVZBrzU1E8wbh_eoQfhWv+0JsH11_N4hrkPKqKCXg@mail.gmail.com>
 <eb94fb2be140a706ce4797df9cb56d63@agner.ch> <87r0mgay0o.fsf@48ers.dk>
In-Reply-To: <87r0mgay0o.fsf@48ers.dk>
Date: Mon, 2 Oct 2023 11:28:49 -0700
X-Gmail-Original-Message-ID: <CA+h8R2p24q9AZRvkwacX3oOzuS2T7ZAENm7yNKj70Rfe0xuF0Q@mail.gmail.com>
Message-ID: <CA+h8R2p24q9AZRvkwacX3oOzuS2T7ZAENm7yNKj70Rfe0xuF0Q@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1696271341; x=1696876141; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=At4oD0xiQLo2xRRY+yg7reTE048Ke+oG+7tZf7OfBJc=;
 b=XQxkVQODp/WrjgNQtt3k/teURmNPGmUG1AryYTRST2ab/fCjYpJLi9QcP05f+DY/fR
 yGUysi85DGOdkky39aUko5bti4eczt3hlZaVeR/O8G4Y+Be9QoV4rLzQaBEsvT7LhHwC
 SGs29F0ixIoVKGSuX4JRQIqMiFiHDmQvp+C+K/a7ACsjwMQ/93tecz+OsidDGIAH9SO5
 gghhzbCwCn+v27bLwwkT1i3Xg1ADMcwZipp1h77tGZnPyiBATHdZqbQLEfD2Y2L4NYGD
 uN7xQiE2LHJZDWh8KddbpmYxDxER9EVvJFxbYU0m+VUW0in1lzyhKh/P73gV0BOyqPmV
 0Ldg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=XQxkVQOD
Subject: Re: [Buildroot] [PATCH v1 1/1] package/containerd: bump version to
 v1.6.22
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Stefan Agner <stefan@agner.ch>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUGV0ZXIsCgpodHRwczovL2dpdGh1Yi5jb20vY29udGFpbmVyZC9jb250YWluZXJkL2lzc3Vl
cy85MTM5I2lzc3VlY29tbWVudC0xNzM2NDc3NTM0CgpPbiBTYXQsIFNlcCAzMCwgMjAyMyBhdCAx
OjAz4oCvQU0gUGV0ZXIgS29yc2dhYXJkIDxwZXRlckBrb3JzZ2FhcmQuY29tPiB3cm90ZToKPiBJ
ZiBjcmkgaXMgb25seSBuZWVkZWQgZm9yIHdoZW4gY29udGFpbmVyZCBpcyB1c2VkIHdpdGgga3Vi
ZXJuZXRlcywgdGhlbgo+IHBlcmhhcHMgd2Ugc2hvdWxkIGRpc2FibGUgaXQgYnkgZGVmYXVsdCBz
byBvdGhlciBwZW9wbGUgZG9uJ3QgbmVlZCB0bwo+IGRlYnVnIHRoZSBzYW1lIGlzc3VlLgoKSSB0
aGluayB3ZSBjYW4gc2FmZWx5IGRpc2FibGUgY3JpIG9uIHRoZSBkZWZhdWx0IGNvbmZpZy4KCkJl
c3QsCkNocmlzdGlhbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
