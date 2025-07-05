Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B8DC8303C
	for <buildroot@archiver.kernel.org>; Sat,  5 Jul 2025 21:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B54E361399;
	Sat,  5 Jul 2025 21:07:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AVaAyZewAZs4; Sat,  5 Jul 2025 21:07:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E66FD61373
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E66FD61373;
	Sat,  5 Jul 2025 21:07:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1263C15F
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 21:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04946401A1
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 21:07:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LbJqtwmGfyKx for <buildroot@buildroot.org>;
 Sat,  5 Jul 2025 21:07:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 05E2740152
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05E2740152
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 05E2740152
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 21:07:10 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a4f379662cso1745887f8f.0
 for <buildroot@buildroot.org>; Sat, 05 Jul 2025 14:07:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751749629; x=1752354429;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fnGA05rYLjk0Y84rpPWXJYj3ZXAEJvQkJXovm/tgYSY=;
 b=UIDByPwmHCH+xOjYs49aBPuy/LtqyXiRtUZ5/0aZpeOIvj/4kLuL3SuGodmIsS67np
 IzFDZgkLRRFwN7CSprkAFnBqNYYMRerGKrnCjzBiiUVhGuDjSkuXmIrBH24Ag5xtXoPx
 GishQfmHAn0UhG6cTq1Ty00wCS2uKEH8d2+Tvtv4ObTUQQS1EChUHc/tl4+c/dMCZLLF
 LFo3EteRm+/u/jcajtbXfkdqSb3wtr3162GYyeRHPoyZJBAmQlnloZykzRvmUio7zize
 lWUzZuuNIJOUJrXvIhmHjYzwlMUAhEbI4PEEYKk/gxqTR+eBzjYDEr2f5FxgGXvIeZLd
 jCeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmr46OJNpbU9fadu9YcQVrRTi8jlCaX5vVdDost5VDF1qayTJftewn3uVMpKI5DVbkJwIf7UnlLW8=@buildroot.org
X-Gm-Message-State: AOJu0YzS+o/fRXC27B1npEVc7fd+1VQFMGjTt6iU1g/M7CdcQk8+yOFB
 HypI0nYCzfoOWhUY7kb9skGkWGRltzpj3yoTkp+/iQSCaUB4PkOU52c58g1HqM5+uE8=
X-Gm-Gg: ASbGncvHzzVF/Qz/jWHvtp5pjqH9DHjTGRn8hdN2EW5MaP2Wxevepr1f/Abrj/fmIOQ
 928pDYrIDnbrJAbFBD7C6MBMBJb6Q1MU8mCGpNxlk5jjcnOOF3/HrDwoXMW98CXVDdi2iD4pbXZ
 3R1SdfRS642ufq+3LwRXrV/bKIYhZWC7S10HnPiZbi+78FFpn9aE+UfLGOjrjYzioLMkPA32lEm
 koonDAMkhWmdDQgSv7ncDnG731Fy4aosW2fnLI7MRd/ME+0FV+URJp8TDaPc9OGUxrODjyW70gJ
 AQj6mVpwmGB7v+MfCgXO5qP+83fmPAea7h6vL3/uAqdFOxujhcAovdc/7lRAV6RPiGDzliluNY+
 kFpCoScUuJVaxpwZMaRgokN94GhgZr3m2vC9mtdsn4m5iTcwqKkvlL6To7CHlLZ4F6B4q3/C1ce
 fGrEnsWP3L2VFCkXQZt9E36cYZ
X-Google-Smtp-Source: AGHT+IHR05aFV/ElKdbp7GVPS/sRb1/x20ClSuXgWIm7L5/slMlCfj7utuNofypQE3lN5UNV9wwaDg==
X-Received: by 2002:a5d:59c4:0:b0:3a3:6595:9209 with SMTP id
 ffacd0b85a97d-3b4970294afmr5431955f8f.36.1751749628757; 
 Sat, 05 Jul 2025 14:07:08 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b47285c90esm5947555f8f.91.2025.07.05.14.07.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Jul 2025 14:07:08 -0700 (PDT)
Message-ID: <bc8dbfe0-ab69-4c04-9efc-eaae23dbcad8@smile.fr>
Date: Sat, 5 Jul 2025 23:07:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Romain Naour <romain.naour@gmail.com>, James Knight <jdknight@jdknight.me>
Cc: El Mehdi YOUNES <elmehdi.younes@smile.fr>,
 buildroot <buildroot@buildroot.org>, Daniel Lang <dalang@gmx.at>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>,
 James Knight <git@jdknight.me>
References: <20250703145955.1863056-1-elmehdi.younes@smile.fr>
 <CALAjcgXUyyLUmB56DUEL67m3N+=iGQbOifH3asxZEjZ3nCj81A@mail.gmail.com>
 <CANLo3Jg0GBwx_MPyb+Efmj3H+b6ea7kkQ3v=qQ-NBZTuZoZr-g@mail.gmail.com>
Content-Language: fr
In-Reply-To: <CANLo3Jg0GBwx_MPyb+Efmj3H+b6ea7kkQ3v=qQ-NBZTuZoZr-g@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1751749629; x=1752354429; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fnGA05rYLjk0Y84rpPWXJYj3ZXAEJvQkJXovm/tgYSY=;
 b=QTINac5QLxzeTHFZ0yMq2UGVnWVlxOVCbcO+ITRdMnZ9PgXktS6rzmLMrEzaCdDG/9
 Ov2/tP0qD8/uw5pnKDtYlOGLyJlBhHrWmhnuolQetE7kS4qVduCNTOJ4HuB+UfF0pDco
 Km0dsR78hp0Hm2htGKjZ3+dY7u8mtV1o1DDmY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=QTINac5Q
Subject: Re: [Buildroot] [PATCH 1/1] package/llvm-project: fix
 gcc-install-dir in clang
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SmFtZXMsIEFsbCwKCkxlIDA1LzA3LzIwMjUgw6AgMjM6MDQsIFJvbWFpbiBOYW91ciBhIMOpY3Jp
dMKgOgo+IEhlbGxvLAo+IAo+IExlIHZlbi4gNCBqdWlsLiAyMDI1LCAwNjoyNCwgSmFtZXMgS25p
Z2h0IDxqZGtuaWdodEBqZGtuaWdodC5tZQo+IDxtYWlsdG86amRrbmlnaHRAamRrbmlnaHQubWU+
PiBhIMOpY3JpdMKgOgo+IAo+ICAgICBPbiBUaHUsIEp1bCAzLCAyMDI1IGF0IDExOjAw4oCvQU0g
RWwgTWVoZGkgWU9VTkVTIDxlbG1laGRpLnlvdW5lc0BzbWlsZS5mcgo+ICAgICA8bWFpbHRvOmVs
bWVoZGkueW91bmVzQHNtaWxlLmZyPj4gd3JvdGU6Cj4gICAgID4gV2UgcmVwbGFjZSBpdCBhIG1v
cmUgcmVsaWFibGUgYXBwcm9hY2ggdXNpbmc6Cj4gICAgID4gJChUQVJHRVRfQ0MpIC1wcmludC1z
ZWFyY2gtZGlycwo+IAo+ICAgICBXYXkgYmV0dGVyIGZpeDsgdGhhbmtzISBUZXN0ZWQgaW4gbXkg
c2V0dXAgYW5kIGZ1bmN0aW9ucyBhcyBleHBlY3RlZC4KPiAKPiAKPiBGb3Igc29tZSByZWFzb24s
IHlvdXIgcmVwbHkgaXMgbWlzc2luZyBvbiB0aGUgbWFpbGluZyBsaXN0LgoKUGxlYXNlLCByZXBs
eSB3aXRoOgoKVGVzdGVkLWJ5OiBKYW1lcyBLbmlnaHQgPGpka25pZ2h0QGpka25pZ2h0Lm1lPgoK
QmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+IFJvbWFpbsKgCj4gCj4gCj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBs
aXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
