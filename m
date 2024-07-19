Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D6A3C3DA61
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 03:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24A07405FB;
	Fri, 19 Jul 2024 03:27:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O_u7S7GNTFNT; Fri, 19 Jul 2024 03:27:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6821407AA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6821407AA;
	Fri, 19 Jul 2024 03:27:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 896F81BF315
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 03:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 824E3407AA
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 03:27:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NtyoueonPhXq for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 03:27:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 61F6B405FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61F6B405FB
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 61F6B405FB
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 03:27:10 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a77e2f51496so151073666b.0
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 20:27:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721359628; x=1721964428;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5cCPahME6EGhaFHjJH9mVSsA6mpBS7O4z4o5tsW45mI=;
 b=Le1/86sjW+LbyDI7hLwduMBpN2zTIxvZlCnFAKioq8aNUTf6UWCCyI16B3tnX3wk8j
 Am1F+DeqvS6hp/Ie21kh7uhdC//yFvAYleKTwRAIFviRAhY3AiJg2+W/LMeRKrOaEanX
 aYlC60IkUPm7QYAy0iBHVdQ6tvl3mh3oKcYVhkY0g2PhL7/JEZmszDcjgxBuNTCMTY+H
 Hkr0HaNee7NncojvEH80/vErSrMYvM75DRKMZYOxrxL00wzgxvO9MRUKZu71cFOKanKF
 nk6oBoiBXaurZofIupZJxBUE9Y9hjBB3B3UGpSPVpaF/JlQ9K6CIlbfvoNreTMpv1rFK
 fd2g==
X-Gm-Message-State: AOJu0YwZ3jZHkBU0pMYsglNIsxqFZI+LIqw3nOpn5hXM8D0p3q/5pLvO
 LIph2nb6Umhl3YzUR8Brk46jwt6F/DUCSo9M6XQ9kxCWPrp9i/Mo3KxnFUQc6csSTMUgj9YIMYm
 6c2FCVQ==
X-Google-Smtp-Source: AGHT+IGf9u251rqBbR2eeNQ75VLUVcLsmp27JSC/U8odNOXg4NdYY9HRDE9Hes9JDJq0Otf2g1nZtQ==
X-Received: by 2002:a17:906:4945:b0:a77:e2e3:3546 with SMTP id
 a640c23a62f3a-a7a011208aamr397336766b.9.1721359627839; 
 Thu, 18 Jul 2024 20:27:07 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com.
 [209.85.218.48]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a33d9fbd7sm37576366b.122.2024.07.18.20.27.07
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jul 2024 20:27:07 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-a77e2f51496so151071866b.0
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 20:27:07 -0700 (PDT)
X-Received: by 2002:a17:906:b886:b0:a6f:1036:98cf with SMTP id
 a640c23a62f3a-a7a01337706mr407670566b.54.1721359626694; Thu, 18 Jul 2024
 20:27:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240719030537.3156999-1-james.hilliard1@gmail.com>
 <20240719030537.3156999-2-james.hilliard1@gmail.com>
In-Reply-To: <20240719030537.3156999-2-james.hilliard1@gmail.com>
Date: Thu, 18 Jul 2024 20:26:55 -0700
X-Gmail-Original-Message-ID: <CA+h8R2q4zcBocTRqEjtmQfB-matNSbcB+mRbzM8+AqXyUSaUdw@mail.gmail.com>
Message-ID: <CA+h8R2q4zcBocTRqEjtmQfB-matNSbcB+mRbzM8+AqXyUSaUdw@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1721359628; x=1721964428; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5cCPahME6EGhaFHjJH9mVSsA6mpBS7O4z4o5tsW45mI=;
 b=GPRG78GqAwwYShPmXNKW54Is6+1BUtt7mLC8nbgQEoYUEx176GLw19YQXtLtCdtQTC
 pbWGwoYznWqZfQfY4NYVd8U4UBUjSPPgRl3Iv5pobAErMbvE6sHvqSuMpR1doSupxRSM
 6u3mkDmDBquAERCq4Io4slYTXLDouRgthvYgrRfCZtwOilFPZJXPe9lESU4sKDydmYbS
 8t8HSXNyS/j0R6PKk+KLVbOGZfUE6MUaRuzGdkzcwbI/3jXIuW86/b7T/oseu184YKak
 IkIROPxL0nT53vIepEKJpfDFECnX2XqZJSk2tVTWaXKNbQcCAVbWMegLiAfBUByQzJ5z
 Oqhg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=GPRG78Gq
Subject: Re: [Buildroot] [PATCH 2/2] package/tailscale: new package
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
Cc: Anisse Astier <anisse@astier.eu>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSmFtZXMsCgpPbiBUaHUsIEp1bCAxOCwgMjAyNCBhdCA4OjA14oCvUE0gSmFtZXMgSGlsbGlh
cmQKPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gU2lnbmVkLW9mZi1ieTog
SmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Cj4gLS0tCj4gIHBhY2th
Z2UvQ29uZmlnLmluICAgICAgICAgICAgICAgIHwgIDEgKwo+ICBwYWNrYWdlL3RhaWxzY2FsZS9D
b25maWcuaW4gICAgICB8ICA4ICsrKysrKysrCj4gIHBhY2thZ2UvdGFpbHNjYWxlL3RhaWxzY2Fs
ZS5oYXNoIHwgIDMgKysrCj4gIHBhY2thZ2UvdGFpbHNjYWxlL3RhaWxzY2FsZS5tayAgIHwgMTkg
KysrKysrKysrKysrKysrKysrKwo+ICA0IGZpbGVzIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKykK
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvdGFpbHNjYWxlL0NvbmZpZy5pbgo+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgcGFja2FnZS90YWlsc2NhbGUvdGFpbHNjYWxlLmhhc2gKPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IHBhY2thZ2UvdGFpbHNjYWxlL3RhaWxzY2FsZS5tawoKClRoYW5rcyBmb3Ig
dGhpcyBwa2cuIEFzaWRlIGZyb20gdGhlIEdPUFJPWFkgbm90ZSBJIHNlbnQgaW4gYW5vdGhlcgpl
bWFpbCwgbG9va3MgZ29vZC4KCkJlc3QgcmVnYXJkcywKQ2hyaXN0aWFuIFN0ZXdhcnQKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
