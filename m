Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F460C83F34
	for <buildroot@archiver.kernel.org>; Sat, 19 Jul 2025 13:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61D2F84519;
	Sat, 19 Jul 2025 13:13:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ZfULzyzNBxH; Sat, 19 Jul 2025 13:13:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D4A08451A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D4A08451A;
	Sat, 19 Jul 2025 13:13:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 065B8DA
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 13:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E0A0C41B51
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 13:13:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ca5pjz9kXAwb for <buildroot@buildroot.org>;
 Sat, 19 Jul 2025 13:13:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::236; helo=mail-oi1-x236.google.com;
 envelope-from=tom5760@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 587F641B45
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 587F641B45
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 587F641B45
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 13:13:04 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id
 5614622812f47-40a4de1753fso1730792b6e.1
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 06:13:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752930783; x=1753535583;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AuG4I/UBwpq5kmh5wNqmhN9R9mrc1R3FLkZMYoLw6ec=;
 b=wOY0mjlIybA7cmER2XMCAfD8DfxFX+JQMWjZBGf9JA9+2iRvoh90+Wtd6EQyyN3IDi
 InR9GMOOH6a9R4WamsEK1Su24cy5QWP4Ov0VtBOPg1TgmaYwEoknUTHrE+kq57cjECk2
 LVkri+1TA1cDFpktVLCSDoa2fcukgKtLSrWcTfRVuZHxgAaz0Wx8LqJrZVTCPfesh0UV
 QoMbtbsY+yrg5Lna+JEml+pX+KQqhATD/qB6iIJCLi68d0MlCy8izZ9ZMymQ2TgAfNPB
 qL1eWhLqfE8hv5sV0eXWc3bvuHBwM577ETFKOoXEolaTBZiC1eukzOuQfZHBCcKudCwf
 zGLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVB9vqeH8C6BJDePODo1kSZAMnMS9My8Nl/wXcajNjPSiu+gPdTX8InCEgputCwx/A4ZztUjKKGIiM=@buildroot.org
X-Gm-Message-State: AOJu0YxVk8qkXJU//IKnTkc9g9k0EHEXld0bTMSYLw7ILF1QrD3VlmfD
 d9qfUl+i6sLQQIpePhQEUulQNfaLnNGDPp8mQAJ90mwhy+5xyfr6OxqXW8O4VTdQQn38u4oylk7
 9aF/vZNd7zEkPlLSiW4kC2u2NoJIGG33wtA==
X-Gm-Gg: ASbGncspr9Rs4i7ZFFcfOpHGn+qC77FCYo/xBgzpfq9hzSXWQKtc9vgzkMjKsl6Rotx
 cMz35a2cJSM10bJV/FbQ/tbBrdJgUHZKvBJHlMbxVuGkHmNue9XJe7BPFoMfqixMI5nMKetLYtO
 YXkAgnV0PSGUMfnEaPQcV7J9ZXopad0H3vYkoNElvTIlyQvIbCL1UVKw2LrYefkryNmJtafVvoq
 8hkdW8bdYD8ioWOTF1UAiGjQ2DksAAGa9SN7z1QneGekb83
X-Google-Smtp-Source: AGHT+IEPKb2q5SQYJ9Ngz+6twL+GhyEEixroMi3quQ4ecA9JMw223C3TqZuugE/5f70QPDJazPxrQkRFAKKAScUw6SQ=
X-Received: by 2002:a05:6808:50a8:b0:40c:b75a:40ab with SMTP id
 5614622812f47-41e2f52fd61mr8371928b6e.19.1752930783261; Sat, 19 Jul 2025
 06:13:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250314154252.10248-1-tom5760@gmail.com>
 <20250331153438.4103-1-tom5760@gmail.com>
 <20250518141452.4f6ea693@windsurf>
 <CA+h8R2qBG0XV2591Y5BXo0_RvNcqCnZXJdtYsXoq=NAEff3R2Q@mail.gmail.com>
In-Reply-To: <CA+h8R2qBG0XV2591Y5BXo0_RvNcqCnZXJdtYsXoq=NAEff3R2Q@mail.gmail.com>
From: Tom Wambold <tom5760@gmail.com>
Date: Sat, 19 Jul 2025 09:12:47 -0400
X-Gm-Features: Ac12FXwzmKSgLHvsVO1nmn-s-GRu5DvdvsdP4mGmRjo3u3BZd5LNYXVdoI8LiOY
Message-ID: <CAGQD++g87TTcswJDZFPL_4moRiZ7t4GSb71E3-hZyDAe9A47Hw@mail.gmail.com>
To: Christian Stewart <christian@aperture.us>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org, 
 Thomas Perale <thomas.perale@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752930783; x=1753535583; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AuG4I/UBwpq5kmh5wNqmhN9R9mrc1R3FLkZMYoLw6ec=;
 b=FbhTb3P6ak4rEW7OK8+abNzw2F93d4rgmt6thQlz8d4IZjif7qS22nR6uAgxk1UGMg
 DBBzPEpjPqFMf2BJP9xi+xG+5PvZTd+CH8igbHGayvSrVsgLyxq8SlQcsk/W7ulqmYlD
 LDo8KriUmR4yHdnVL75BrHgbO0J4FT+0qQXChOw+XpUiio3w2Yab0C4IclGO8sfCgpE3
 /eiNm8coYMldl+WYbIX2I9Hya1W6Pv1+qXf4+fQGFugz+KvMdQTMlw8JxKZf27yE3Jwh
 Fb2Uv4Ctgs6cjj6tSqvBmad3PrewoK5GukD4/7czFUaQ1CzKN0Er3cj7h9iaGN3pZrJU
 fuFA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FbhTb3P6
Subject: Re: [Buildroot] [PATCH v2] package/go: go-bin host-go provider
 implies target support
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

SGVsbG8gQ2hyaXN0aWFuOgoKT24gU3VuLCBNYXkgMjUsIDIwMjUgYXQgMzoxM+KAr0FNIENocmlz
dGlhbiBTdGV3YXJ0IDxjaHJpc3RpYW5AYXBlcnR1cmUudXM+IHdyb3RlOgo+IE92ZXJhbGwgbGd0
bSBhbmQgSSBjYW4gdGVzdCB0aGlzIG91dCBhcyB3ZWxsLiBXaWxsIGhhdmUgYSBsb29rIGF0IGl0
IG9uIE1vbmRheS4KPgo+IFRoaXMgb25lIHNsaXBwZWQgdGhyb3VnaCB0aGUgY3JhY2tzLCBhcG9s
b2dpZXMgZm9yIHRoZSBkZWxheSEKCkp1c3QgYSBxdWljayBidW1wLiAgQW55IGNoYW5jZSB0aGlz
IGNvdWxkIGdldCBhcHBsaWVkIHNvb24/CgpVbmRlcnN0YW5kIGFib3V0IGRlbGF5cywgSSBmb3Jn
b3QgYWJvdXQgdGhpcyB0b28hCgpUaGFua3MgYWdhaW4uCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
