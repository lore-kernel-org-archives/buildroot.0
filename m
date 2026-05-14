Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 368C8CD4F39
	for <buildroot@archiver.kernel.org>; Thu, 14 May 2026 12:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC6BB60E87;
	Thu, 14 May 2026 12:43:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0nrRwB7zij3e; Thu, 14 May 2026 12:43:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7A4860E7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778762591;
	bh=mMGwb5NgGhk+xyuZUZ97jUnP+ZQtrMnGLN+iCpZxz4I=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AhoTv3RsPaNMAf37AGlJzRuZCxwLzy7+fOaRKCufcsumlBfGG52tMrx2dvb2kRtyJ
	 kjcZ8jSd8otvXd4xS7HqRQFGyDhG47ULk6WADTIfljBuJyzwddS0mkPTA13zUeUbEq
	 Z3hiKji6xBy7o0jEHw/XR6+Uhb1OKfAa2A/LCcoQZwXCbVU25i8KksUw2yF2X2Wsp8
	 7FScP/7vWtUZQQl0GmsA314wjyn9nxthPhrUaEIFw4Og71P9gy5JprQZL2LpIaqaMJ
	 7K1NFX8UNfZYyRZ6Z+yPWSXX0pqls+URL7zSNJxsN7E2ph4oGbxakKl4ss5NLyC2b9
	 WuLFfTIT+f/7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7A4860E7D;
	Thu, 14 May 2026 12:43:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0191637F
 for <buildroot@buildroot.org>; Thu, 14 May 2026 12:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7C9440EC6
 for <buildroot@buildroot.org>; Thu, 14 May 2026 12:43:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OiNEAL4Mg8qD for <buildroot@buildroot.org>;
 Thu, 14 May 2026 12:43:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A843E40DD5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A843E40DD5
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A843E40DD5
 for <buildroot@buildroot.org>; Thu, 14 May 2026 12:43:08 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-488ab2db91aso84974205e9.3
 for <buildroot@buildroot.org>; Thu, 14 May 2026 05:43:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778762586; x=1779367386;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TXb41UN8+NCYJqGB5YlJ/EVtWBbV9UMIOpDNBGw0UCU=;
 b=g6mNKKSz00xqsNYIf234InK//8HHrQ76UVHZ63BuAwl/sdLrIbyo/m+rfj9zzF1dBi
 tilIv9NOxntCr2snaw9CzkZKAJhPH6x/juqNyL51HnqyhqD918Pq3wNpSbGBolo2D11C
 Dek43mo0Dsl4fm5BxKGnNYAnK5XGH33AzkE/tDbMInKcB54BXDGMMQwP7cdiaOVkVdkF
 N+LBjkDz9uv4viplpZisrrBsf3tJKo3ku0ihnjFNGnWjzORlNYxUFQnv34WImK51wnCK
 n3kSLV3kL8rDrAAYq7xS900yZaFwEk9WkWTNwKKddTTFB4f8VgJzIgbGvbVDEZ+38GbL
 Hu3Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ8MqOjoLv71noOJDNQYGY/eXZ3DKAfS2hHjZPKRpoEgiL3V0pwl4JVNaFOcv2b3wm33JAbY3llMUCc=@buildroot.org
X-Gm-Message-State: AOJu0Yykvhoyf6SZyu2oOnrU61LHtnRTOPgDaH0m7ARPtZvvyVvqNRwz
 WMbs74w14YjQUtieiNs8bdMvZByjoGPjRGOOTackA7JFoQ87NhJwS7GYWxm/x1JDyiI=
X-Gm-Gg: Acq92OFjQ3xPT+Tdu54lSw/JYa5zUeRcUdzpFRsMMYalZaveEg3nw0+P4FjhYZ+OPbh
 m29MMSwThXCoxnKMOFCJNrEXy4MjhqXuH61IyUdlX4BzaFW6sjsn0cRn8khBmWT0Y3WyADjcOQ/
 O98Lb/sDl2p10uMFLTOGzHjtKe24PUTUPb1eLpHzOUFH+tlsPvNeeyyjWzj8t3tpLyMI1q3yO37
 NWJeasGtb6oYMaq6jBpISU71lEog/I2Bvhbvbej/FAGLHVCE7tISiDOJZXSHG7QlwiL8hwh6zOg
 yjRSTtM3Ex/eAtZlQpzIpbENCEg+/K2STeSSFoON7TyzHsdJ6RNeUInWRafKRdNwZcxJtXG6GP+
 bkSO8W0udfzzfJ1PuNQYADMS9QcCARMKnjZ+Trfo9f4ZlgBTaMlLJlX6P2ZqYCGi84F3VC98oiV
 pEsBbOhapVeOI/xbByYLBPVYWHDgvHhcjBACDuEbI23kVLvhm3cfFFwcFX750FiJv+RaA9upaFn
 sL2Jv2Odh/Hawqml8ikzJd6UnDPFZ2Sf/RTZ1UjBAjrMs1PX6xQVk/yajS3u341cItWXaA7edRW
X-Received: by 2002:a05:600c:4746:b0:48e:635a:18d7 with SMTP id
 5b1f17b1804b1-48fce7659c7mr111949405e9.0.1778762586448; 
 Thu, 14 May 2026 05:43:06 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fdb2716eesm48070445e9.5.2026.05.14.05.43.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 May 2026 05:43:06 -0700 (PDT)
Message-ID: <ce2f40c6-1c9b-4aaa-be5d-9699ada1da3e@smile.fr>
Date: Thu, 14 May 2026 14:43:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Joseph Kogut <joseph@anodize.com>, buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Romain Naour <romain.naour@gmail.com>
References: <20260512-radeonsi-aco-compiler-v1-1-6557627f3d55@anodize.com>
Content-Language: en-US
In-Reply-To: <20260512-radeonsi-aco-compiler-v1-1-6557627f3d55@anodize.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1778762586; x=1779367386; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TXb41UN8+NCYJqGB5YlJ/EVtWBbV9UMIOpDNBGw0UCU=;
 b=QdYKEYb6nxkezwWVe8WBSlEc+4bXmH8B6zf8enQ7zElFla4BiKRlkk/h+lKa0jV+V+
 DBkfr+e7qO2P/fqkFRD9gSeUsxyYFIr85mqR2f8u6zIj3xyftjJqjj5/DrFUxZpGaRvu
 nY7ImBB80Rsj7vZ2vNV1LNPWZCAikQ/V0f/eg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=QdYKEYb6
Subject: Re: [Buildroot] [PATCH RESEND] package/mesa3d: make LLVM optional
 for radeonsi
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

SGVsbG8gSm9zZXBoLAoKTGUgMTIvMDUvMjAyNiDDoCAyMToyOSwgSm9zZXBoIEtvZ3V0IGEgw6lj
cml0wqA6Cj4gU2luY2UgbWVzYTNkIHYyNi4wIFswXSwgdGhlIEFDTyBjb21waWxlciBoYXMgYmVl
biB0aGUgZGVmYXVsdCBvdmVyIExMVk0uCj4gVGhpcyBzaGFkZXIgY29tcGlsZXIgYmFja2VuZCBo
YXMgYmVlbiB1c2VkIGZvciBldmVuIGxvbmdlciBieSB0aGUgUkFEVgo+IHZ1bGthbiBkcml2ZXIu
Cj4gCj4gTGV0J3MgbWFrZSBMTFZNIG9wdGlvbmFsLgo+IAo+IFswXSBodHRwczovL2NnaXQuZnJl
ZWRlc2t0b3Aub3JnL21lc2EvbWVzYS9jb21taXQvP2lkPWUyNmMyOGYzMTFjYzU0MTZmNmM3ZjVi
MDlhNTNjYTJiMTRkZmI5NTUKClBsZWFzZSB1cGRhdGUgdG8gdGhlIG5ldyBnaXRsYWIgcmVwb3Np
dG9yeToKaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvbWVzYS8tL2NvbW1pdC9l
MjZjMjhmMzExY2M1NDE2ZjZjN2Y1YjA5YTUzY2EyYjE0ZGZiOTU1Cgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEpvc2VwaCBLb2d1dCA8am9zZXBoQGFub2RpemUuY29tPgo+IC0tLQo+ICBwYWNrYWdlL21l
c2EzZC9Db25maWcuaW4gfCAzICstLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbWVzYTNkL0NvbmZpZy5p
biBiL3BhY2thZ2UvbWVzYTNkL0NvbmZpZy5pbgo+IGluZGV4IDY2ZWJlMDQzOTQuLjA4ODgxYWY1
YmQgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9tZXNhM2QvQ29uZmlnLmluCj4gKysrIGIvcGFja2Fn
ZS9tZXNhM2QvQ29uZmlnLmluCj4gQEAgLTI1MiwxMSArMjUyLDEwIEBAIGNvbmZpZyBCUjJfUEFD
S0FHRV9NRVNBM0RfR0FMTElVTV9EUklWRVJfUkFERU9OU0kKPiAgCWJvb2wgIkdhbGxpdW0gUmFk
ZW9uIFNJIGRyaXZlciIKPiAgCWRlcGVuZHMgb24gQlIyX1VTRV9NTVUgIyBsaWJkcm0KPiAgCWRl
cGVuZHMgb24gQlIyX2kzODYgfHwgQlIyX3g4Nl82NAo+IC0JZGVwZW5kcyBvbiBCUjJfUEFDS0FH
RV9NRVNBM0RfTExWTQo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX01FU0EzRF9HQUxMSVVNX0RSSVZF
Ugo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX0xJQkRSTV9BTURHUFUKPiAgCXNlbGVjdCBCUjJfUEFD
S0FHRV9MSUJEUk1fUkFERU9OCj4gLQlzZWxlY3QgQlIyX1BBQ0tBR0VfTExWTV9BTURHUFUKPiAr
CXNlbGVjdCBCUjJfUEFDS0FHRV9MTFZNX0FNREdQVSBpZiBCUjJfUEFDS0FHRV9NRVNBM0RfTExW
TQoKVGhpcyBzdGlsbCByZXF1aXJlcyB0byBzZXQgQU1EX0RFQlVHPXVzZWxsdm0gaW4gdGhlIGVu
dmlyb25tZW50IHRvIHJlYWxseSB1c2UKbGx2bSBjb21waWxlciBmb3IgcmFkZW9uc2kuIEJ1dCB3
ZSBjYW4ndCByZW1vdmUgdGhpcyBsaW5lIGZvciB0aGUgc2FrZSBvZgpyZXByb2R1Y2libGUgYnVp
bGRzLgoKUmV2aWV3ZWQtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgoK
QmVzdCByZWdhcmRzLApSb21haW4KCj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfRUxGVVRJTFMKPiAg
CXNlbGVjdCBCUjJfUEFDS0FHRV9NRVNBM0RfTkVFRFNfRUxGVVRJTFMKPiAgCXNlbGVjdCBCUjJf
UEFDS0FHRV9NRVNBM0RfUlVTVElDTF9TVVBQT1JURURfRFJJVkVSCj4gCj4gLS0tCj4gYmFzZS1j
b21taXQ6IDk2ODRjYjliNDQwNmUwMTY4M2E5YjUxMzYxMDBkODEwNDBkNTZhYTAKPiBjaGFuZ2Ut
aWQ6IDIwMjYwNTEyLXJhZGVvbnNpLWFjby1jb21waWxlci1hZTRlNjk3ZDQ4NDgKPiAKPiBCZXN0
IHJlZ2FyZHMsCj4gLS0gIAo+IEpvc2VwaCBLb2d1dCA8am9zZXBoQGFub2RpemUuY29tPgo+IAo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRy
b290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
