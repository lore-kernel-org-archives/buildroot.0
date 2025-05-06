Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51615C3ABBC
	for <buildroot@archiver.kernel.org>; Tue,  6 May 2025 20:30:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E520460C19;
	Tue,  6 May 2025 20:30:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tp7n3ifYw_m6; Tue,  6 May 2025 20:30:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2823360BDC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2823360BDC;
	Tue,  6 May 2025 20:30:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 46C551A3
 for <buildroot@buildroot.org>; Tue,  6 May 2025 20:30:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D5DB40651
 for <buildroot@buildroot.org>; Tue,  6 May 2025 20:30:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c0gWydBARS21 for <buildroot@buildroot.org>;
 Tue,  6 May 2025 20:30:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 52A6840396
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52A6840396
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 52A6840396
 for <buildroot@buildroot.org>; Tue,  6 May 2025 20:30:21 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-30bfb6ab47cso54963211fa.3
 for <buildroot@buildroot.org>; Tue, 06 May 2025 13:30:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746563419; x=1747168219;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yXNuB6YAksCPZ/GLcJfxNO8ZhUWmSfGQhkBv/gk/NkQ=;
 b=YEcRs9xcj6oHyPwHhBtL76oq9Zbq0LK7vyoMvPwGWWvR4P7U8sSobxmO7Sf59Z5PYx
 aaE6kdWaLrEBFEbHaTvoX+XEnSt1OF/NVgXx6MrTYh3lc+UWMomy2jUAwtDnvwOF4WRY
 94cgz1O4cie7Pw4gi7iDhozHg01nZocBQ7nS2u5itah1eFHtKDUmgTtu+CA4vGbrF5Ux
 VsZ57KdZCG3Rh2JYGgoAq29zAIorshtGJfEIQ6TtHO7wad+W9GPvXbsaIv2TC6Us6Adm
 n651IRTHLIhrxEz+KJ8aBiFSxP5KV96DJBlEa/wB90vnR5OQns4uODnLu0+T6P5VwKnG
 xFOA==
X-Gm-Message-State: AOJu0YzIrng4sdJh+NEzV0qyCpEx28CdJ1nzlT3Jd3uxNcCgo7qw7ihA
 qisnYLxbskVGLvN2LLw9k6tqjkL1n97pd5NNgnnJB8ftydZHyB4K/9JADQWFB3tI/ar9T+ZzK2P
 L9cXK4dsyHh6rtbuaL14NPI2+O7ZK5Q==
X-Gm-Gg: ASbGnctw+MDvCiKlxr+NqU6vOlmUcqt6wqz2MB/RFvHYMvca9BAEot89PoxcsdQJJOr
 zdFzO8hpvsyzfIkz2njUcyYh6FY8mtvbeq/z5qDo8ANDdEV4ktEYDgxwGifnNaxoQ3O2Tb/qKA7
 JSgiCf2d4sB7sUAEnnNBO1zlPBhCTjy5SemurrPNMWFyx3VnkD4jh4AiqUs/0fZl7V
X-Google-Smtp-Source: AGHT+IEILeOk0XJn2vLi6HeFC6yGraRnNqdyxTae4qEteny+KJqZQkCCm1HXLQk+s1M5B28qOcJo3uXHgA0x9sDgAHc=
X-Received: by 2002:a2e:a550:0:b0:30a:4428:dea9 with SMTP id
 38308e7fff4ca-326ad32334dmr1487311fa.30.1746563418588; Tue, 06 May 2025
 13:30:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250506194502.2960556-1-ju.o@free.fr>
In-Reply-To: <20250506194502.2960556-1-ju.o@free.fr>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 6 May 2025 17:30:07 -0300
X-Gm-Features: ATxdqUHoPycxWfbhlG2iHi9QUS-prKnqQlwiWHh59nIvEje7ncjJHWIm9HtYld8
Message-ID: <CAOMZO5DGRVK+bHTz=B9sdhegNmiBYyC9gDMtrctfJhix_xBM2Q@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746563419; x=1747168219; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yXNuB6YAksCPZ/GLcJfxNO8ZhUWmSfGQhkBv/gk/NkQ=;
 b=eFdHNzvnqXarW+UkH7yb9YsTSKW/Dj6OQiX74rbSBf1bZ4ZkhMbC2zRLYPLzryx/ZL
 Kk7SHoRPk7QDN1IleBJYHZp40pRZ1lnj1AtoJMiLPIK5U1xqMByFdt/r0Ns90Ehed3D8
 1dL/34LrgD8makhObzXzLJ1FC7pa52duNpAc9jr5ZwaiKDJtNM7wrY2ZY/D0Lyl/o06c
 BxRyXGlGP7CsYf1FnRIfZC7K1SH+TxCSkEhG0i/vAJINwcFyzpU9xQWswoMeWHUOILHj
 koxqj+X7CoVx0b7uZZKiJQut8Q4Wn5b0jdnl/MTN06hNg2FF+gwO3smtSvqi3LmH7Ouf
 /l0A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=eFdHNzvn
Subject: Re: [Buildroot] [PATCH 1/1] configs/imx28evk: enable
 BR2_DOWNLOAD_FORCE_CHECK_HASHES
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

SGkgSnVsaWVuLAoKT24gVHVlLCBNYXkgNiwgMjAyNSBhdCA0OjQ14oCvUE0gSnVsaWVuIE9saXZh
aW4gPGp1Lm9AZnJlZS5mcj4gd3JvdGU6Cj4KPiBUaGlzIGNvbW1pdCBhZGRzIEJSMl9ET1dOTE9B
RF9GT1JDRV9DSEVDS19IQVNIRVM9eSBpbiB0aGUgZGVmY29uZmlnCj4gYW5kIGFkZHMgY3VzdG9t
IGhhc2ggZmlsZXMuIFRoZSBleGNlcHRpb24gZW50cnkgaW4gLmNoZWNrcGFja2FnZWlnbm9yZQo+
IGlzIGFsc28gcmVtb3ZlZC4KPgo+IENjOiBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5j
b20+Cj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4KClRoYW5r
cyBmb3IgdGhlIHBhdGNoOgoKUmV2aWV3ZWQtYnk6IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdt
YWlsLmNvbT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
