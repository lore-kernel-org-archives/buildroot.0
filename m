Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE2ABCA0EC4
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 15:58:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAE4D41537;
	Mon, 11 Aug 2025 15:58:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BkdxHpLB9jak; Mon, 11 Aug 2025 15:58:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE7C14145E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE7C14145E;
	Mon, 11 Aug 2025 15:58:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 61A421C5
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 15:58:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 470294145E
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 15:58:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sPMayMGN3lkd for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 15:58:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::936; helo=mail-ua1-x936.google.com;
 envelope-from=jesse@rivosinc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4CCFB4141A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CCFB4141A
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com
 [IPv6:2607:f8b0:4864:20::936])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4CCFB4141A
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 15:58:52 +0000 (UTC)
Received: by mail-ua1-x936.google.com with SMTP id
 a1e0cc1a2514c-88bc71ff9b0so2185750241.1
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 08:58:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754927931; x=1755532731;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MxsAkCvDWSw+CTHKW5UqixgQsogp3oUXsYwcrTPq56o=;
 b=X0ckSSVXaak4FZ0jZti17Npa+AhfIqNYaHAsQAl2tYAuE/h0SXw+Q+w5qK20RWtuKO
 8lyPNFG20pEQe5FutG4LTPpd3A7PgP8VMOqaKqrOqmKiucHNa5Ssj22d/wxFPsXpfnLE
 d2ER752+AutB+shANUklLJJs9Pji6In0bchD+pIrX0DNpVmvb/g4MuafblxoHVxgRtN2
 tei4U74lxrRY+yU7jHjbv9aPlpHcc+tsb5N59+VpsI2z+DRZQh6fVevwFXJ8gelN/Sk5
 Za6Fte63y5O3et8EsCJlm0CQpD7hMlx1Wb4IeUKwqh39VDk7Cd74pjl3vIwyAWzSTRrV
 UbBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlgK33i8HTahqdHoSVMrWFIOdpNysbQEU5KM87osAY7f8gbKi4jm+CU5dooX/ZQ49xAt6YOgNEq9k=@buildroot.org
X-Gm-Message-State: AOJu0Ywa4sTeEU/KdPW6OnI+XkkBOi3oV/DYlYPvOfylFtRaR4LHoLQl
 suY74NAYxdeWn1YpT4lcyknOu9eNJeofpvFJ5nKLr/m24tva9PPWkCNzc8rOIjC23BXkc6fvWpg
 69B7qgVUpl6N9lVvMj4gQcRKPgdGrPLLH/UQ7wQZLaQ==
X-Gm-Gg: ASbGncuYbbail1z9/buUz1dHqhMfGIEy78NAjgNWkzKH6KGeOgsMFJjWTsYVTl52qLu
 qsE4dmkQ2ptxeUSofH8Ba5jQmqWESjulsG2Cx6XHZ4ox7USfKJuoZMXpd76rfc8LvQ6qpCdcT7V
 O7fgrsxn0OETLXtIuEp3ux0nk1FEP514bXIX2Rbsi1Nk/a4EJY1Qz1LaxhwEux4I8NDd56iTMfh
 nzf+i9y
X-Google-Smtp-Source: AGHT+IF5Qr/lzlTPZSvXaiEGzVhtFVRwatou3IDV7YOaXMuQcqZOvMYPIf03UdXKj080yeYV8GK4TgZim7o4+DCKFHg=
X-Received: by 2002:a05:6102:a47:b0:4e2:82b9:b377 with SMTP id
 ada2fe7eead31-50cbe7723e9mr178970137.18.1754927930567; Mon, 11 Aug 2025
 08:58:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250805151814.1114414-1-alex.bennee@linaro.org>
 <20250805151814.1114414-6-alex.bennee@linaro.org>
 <20250806013747.1b2835f8@tpx1>
In-Reply-To: <20250806013747.1b2835f8@tpx1>
From: Jesse Taube <jesse@rivosinc.com>
Date: Mon, 11 Aug 2025 08:58:38 -0700
X-Gm-Features: Ac12FXw97-meNIRKQFPaNfGJ1ZTYd7I0r-KaxAjSZFRh4KIiZCDZpmm2htGT4cQ
Message-ID: <CALSpo=aMKU7fXC7BcWJW=W2t2=S7uGnc9-tg+0t82tqw-gWXuA@mail.gmail.com>
To: Thomas Huth <huth@tuxfamily.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc.com; s=google; t=1754927931; x=1755532731; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MxsAkCvDWSw+CTHKW5UqixgQsogp3oUXsYwcrTPq56o=;
 b=DLDnx/J+BC3pjWXIMzp0QWdLLvpCvMhKDzLzlMzJqK85jqogvTHWFYWdeoFqr2nWB3
 WYeFoEfwpvm/BtmGLm0OReGTy/42uDzX2RXLvxfqKXVL9Gk4w3hAjkWodx+Hz/I/cXF+
 R/t4ecEW/2XqqC7OiYF1lbkJz3rRqj9EaC5r9CRFMYl5evjAU8AL9jV/aQNA1gUB9S+I
 usOGEQSZYgWvvsW+hJIEdmMbEac6imBj8B89JeK/CckHBbfOcWdM4xDLUV2ySj5ryrdV
 gOEq2x5KbCS53CyuAMRnI8PPDLSDjF+Pp4aQmJZQzsBMX+yDIRJXM7s5fBRLlGKUcnhJ
 4/tA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=rivosinc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com
 header.a=rsa-sha256 header.s=google header.b=DLDnx/J+
Subject: Re: [Buildroot] [PATCH v4 5/9] package/kvm-unit-tests: bump to
 v2025-07-31
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
Cc: Jesse Taube <Mr.Bossman075@gmail.com>, Cyril Bur <cyrilbur@gmail.com>,
 Jesse Taube <Jesse@rivosinc.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCBBdWcgNSwgMjAyNSBhdCA0OjM34oCvUE0gVGhvbWFzIEh1dGggPGh1dGhAdHV4ZmFt
aWx5Lm9yZz4gd3JvdGU6Cj4KPiBBbSBUdWUsICA1IEF1ZyAyMDI1IDE2OjE4OjA3ICswMTAwCj4g
c2NocmllYiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+Ogo+Cj4gPiBVcGRh
dGUgdG8gdGhlIGN1cnJlbnQgdmVyc2lvbiBvZiBLVk0gdW5pdCB0ZXN0cy4gVGhlIG1haW4gY2hh
bmdlCj4gPiBzaW5jZSB0aGUgbGFzdCBjaGVjayBwb2ludCBpcyBzdXBwb3J0IGZvciBrdm10b29s
IHRvIGxhdW5jaCB0ZXN0cy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbGV4IEJlbm7DqWUgPGFs
ZXguYmVubmVlQGxpbmFyby5vcmc+CgpSZXZpZXdlZC1ieTogSmVzc2UgVGF1YmUgPGplc3NlQHJp
dm9zaW5jLmNvbT4KClRoYW5rcywKSmVzc2UgVGF1YmUKCj4gPgo+ID4gLS0tCj4gPiB2Mwo+ID4g
ICAtIHJld29yZCBjb21taXQKPiA+ICAgLSBtb3ZlIHRvIGN1cnJlbnQgbWFzdGVyIHNvIHdlIGNh
biB1c2Uga3ZtdG9vbCBhcyB3ZWxsCj4gPiAgIC0gZGlkbid0IGFwcGx5IHRoX2h1dGgncyByLWIg
YXMgbW92ZWQgdG8gbWFzdGVyCj4gPiB2NAo+ID4gICAtIGNoYW5nZSBmcm9tIHNuYXBzaG90IHRv
IHYyMDI1LTA3LTMxCj4gPiAgIC0gcmV3b3JkIGNvbW1pdCBtZXNzYWdlIGFnYWluCj4gPiAtLS0K
Pgo+IFJldmlld2VkLWJ5OiBUaG9tYXMgSHV0aCA8aHV0aEB0dXhmYW1pbHkub3JnPgo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1h
aWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
