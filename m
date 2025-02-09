Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F6A4C0219B
	for <buildroot@archiver.kernel.org>; Sun,  9 Feb 2025 17:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D0B1811C9;
	Sun,  9 Feb 2025 17:20:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d4K6H4RCztKU; Sun,  9 Feb 2025 17:20:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CD6B811B7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CD6B811B7;
	Sun,  9 Feb 2025 17:20:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EAD556C
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 17:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E56DE40B38
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 17:20:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id crOMajDu2Wk7 for <buildroot@buildroot.org>;
 Sun,  9 Feb 2025 17:20:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com;
 envelope-from=eagle.alexander923@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 06A0D40B35
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06A0D40B35
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 06A0D40B35
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 17:20:36 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-2f9b91dff71so5570390a91.2
 for <buildroot@buildroot.org>; Sun, 09 Feb 2025 09:20:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739121636; x=1739726436;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=adQrkvojCNFI7wjQOyjZzh6RHZ1xETj2SM2yPHjTr1o=;
 b=TAM6aZ4+5nIhWp3yir1socwLsyM7FwfKO/g9XPaPSfcFJdVb/qNaOpwOPcLCOjrH96
 PnChPHHg0vaI+WVch9MMPbcqsoa3cQqjTk+IFyjl7eVHC1BpuT832EfG/XyMO6moIHbG
 Ue2G16qc8He2HcOJI7q+ODisz5TNw5YhLpGn16DQbAW2PZfA9I8BEqxh9NkaXj9AwH0F
 nNHzGrDqpZDSNTF9tfVVVV9xWBoufSFSOW1Xm6pDAVI3tFFHeg5Lb+3//eTLkYqtaP8x
 3dV3WmDEluOR0fSuKnHqELuume0bzAS5yFoRspJvyz6bIV0mCZBiefxUtsrnR+uCW1sm
 zAfQ==
X-Gm-Message-State: AOJu0YwamuTU/PDJDKNUrS1KXscY7ELyQybgfn+uoNLVjMlxWSF7vGMO
 tl+sDWIrchRHc0Stl1XwdxwCbW/C+VCM7zvGvtxaZTpgwE+r+0g/SYEHTHYIEAZT5CX2JnSe9Ka
 OqbaroQAI0+7GgA4VeQ8kEit8egI=
X-Gm-Gg: ASbGncuOMoZqu4wKKoGYEgKPHH6waZG5ojg43yud8gQw6HFqTNYRZT5OIHYvM53a59C
 14/dw9f6IVAn7Py6b6ehxYBzwXfy0r0Dx/lYaGYamPAris2NAOydwp4jGCogI4o7//Elr25yBlg
 ==
X-Google-Smtp-Source: AGHT+IGk0l6YForHqAPu/h3Sfz/PqjLif8tXrOyPH4tygXBaSlccFRquikc79O8K1SB3sK6420KxWBPCzKg25PTh0MM=
X-Received: by 2002:a17:90b:2b48:b0:2f2:3efd:96da with SMTP id
 98e67ed59e1d1-2fa242e5ca3mr16141476a91.24.1739121636189; Sun, 09 Feb 2025
 09:20:36 -0800 (PST)
MIME-Version: 1.0
References: <20250206070910.1423800-1-eagle.alexander923@gmail.com>
 <20250207120300.112124-1-thomas@devoogdt.com>
In-Reply-To: <20250207120300.112124-1-thomas@devoogdt.com>
From: Alexander Shiyan <eagle.alexander923@gmail.com>
Date: Sun, 9 Feb 2025 20:20:23 +0300
X-Gm-Features: AWEUYZl6PGSv7uSlYf2jyFpi3nIYBQabIsnIxSruX8LG9HFTnxtDSWprVEYlU1A
Message-ID: <CAP1tNvRcjwyCJ=zdV0ug84NWGBVWC7L4F-FkrQZNQvnOHkp7_g@mail.gmail.com>
To: thomas@devoogdt.com
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739121636; x=1739726436; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=adQrkvojCNFI7wjQOyjZzh6RHZ1xETj2SM2yPHjTr1o=;
 b=UIqPPQpFt6uxRPrGkKnvhygwyTrRwQv2qKygsRD+j2yQcpHnb89S1WV6HLkKp/uxxs
 UFsWmDDpCsPXdpMD0mgokRfygwaKNVKN1m+TywQi2DBvbBl4YVDGDeQ+fi87/9eEoryf
 fqVnyPi/iIW149lrHkLvBZKHuXu4zIVRE7f4aFO0KHgXr8UQS3M/LcqP4X9MnXABE1EP
 Exldvw56B2vsOT1sdvGQmnlCuA7HPeuRpcJsIjqwDh9dsowRml/LBzcqdeGlBiUZmOdw
 h6EWLcH4U7jVN3O+gsLGC8m5zxpT+EJxneDcq6m0yJgvHR1YI9arZWVfd/RwfKRjJD+U
 Hqjg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=UIqPPQpF
Subject: Re: [Buildroot] [PATCH] package/sdl2: Add wayland support
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

SGVsbG8gVGhvbWFzLgoKVW5mb3J0dW5hdGVseSBJIGRvbid0IGhhdmUgdGhhdCBsZXR0ZXIgdG8g
d2hpY2ggSSBjb3VsZCByZXBseSB3aXRoIGEgdGFnLgpJZiB5b3UgcG9zdCB0aGUgdjIgKGl0J3Mg
YmVlbiBhIGxvbmcgdGltZSBzaW5jZSB0aGUgcGF0Y2ggcHVibGljYXRpb24sIEkgdGhpbmsKaXQg
Z290IGxvc3QpLCB5b3UgY2FuIGFkZCBhIHRhZyBmcm9tIG1lOgoKVGVzdGVkLWJ5OiBBbGV4YW5k
ZXIgU2hpeWFuIDxlYWdsZS5hbGV4YW5kZXI5MjNAZ21haWwuY29tPgoKVGhhbmtzIQoK0L/Rgiwg
NyDRhNC10LLRgC4gMjAyNeKAr9CzLiDQsiAxNTowMywgVGhvbWFzIERldm9vZ2R0IDx0aG9tYXNA
ZGV2b29nZHQuY29tPjoKPgo+IEhpIEFsZXhhbmRlciwKPgo+Cj4gVGhpcyBwYXRjaCBkdXBsaWNh
dGVzIGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gv
MjAyNDA4MzAxNzUyMjkuMjYxOTM2Mi0xLXRob21hc0BkZXZvb2dkdC5jb20vLAo+IGNhbiB5b3Ug
dmVyaWZ5IHRoYXQgb25lPwo+Cj4gSnVzdCByZXBseSB0byB0aGF0IHBhdGNoIHdpdGg6Cj4gVGVz
dGVkLWJ5OiBBbGV4YW5kZXIgU2hpeWFuIDxlYWdsZS5hbGV4YW5kZXI5MjNAZ21haWwuY29tPgo+
Cj4KPiBLciwKPgo+IFRob21hcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
