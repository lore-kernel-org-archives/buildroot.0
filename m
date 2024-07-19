Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46AE4C3DA59
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 07:19:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA4B160619;
	Fri, 19 Jul 2024 07:19:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jZN1L2Mxtstz; Fri, 19 Jul 2024 07:19:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A6396063A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A6396063A;
	Fri, 19 Jul 2024 07:19:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 66FE21BF575
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 07:19:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FADD403D7
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 07:19:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aFy5kaDvYi8C for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 07:19:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E59CE408C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E59CE408C3
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E59CE408C3
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 07:19:26 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3683178b226so410526f8f.1
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 00:19:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721373565; x=1721978365;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6ewikEP/Rjh45JMA9BE+AjCvYXsdSerjNxKKpvIJDak=;
 b=HmXvTGhSGVGfIfPuO/LF2qW831/dmcczONEx1uWg81hwvcozrtkf//c18r1awUfyeU
 Sb/8/1+GD0IHHprWWFiyQXmXoo9EWjVWnCUMIa3Vfr0dpWiy7woSCY/ewIP3+HRn0QWd
 A99FEPEIQUwdg4GLMfc8fx3TB2jdDXtrVZ/Fs+Yap3HMNhJXegMkoazIGJK5/63t43lM
 vyq47Q9qsK4eaAeVbxaWKjDVfd3zaymoxCcJ6hUETuO2C0PlweeKDi1XrePPK6lhx0TY
 3Z7AjyrkUTESsAmoLq+W4ngslYBraKzdogd2e1urg5y/dPP26BNBFrFbkXUxP1tTozlY
 pe3Q==
X-Gm-Message-State: AOJu0Yyt4OM8/3Cc4p815zuaqXDwg0uW2h9TLhLKUwxdf2GiGRAdzwk5
 FqqgXLU0gNyUKTJfDszyMV+3YgtNxERfOlZUQX6o7yxzvC2mjiIrmIGDKfyIztI=
X-Google-Smtp-Source: AGHT+IHgTmgfxpVjZBqWyXZSErEriFaKwNn9KFwybvgfeZIYycWQ8pFHFEcSoky1ucsWjkbJ2wYUFw==
X-Received: by 2002:a05:6000:18ac:b0:368:712c:6bb3 with SMTP id
 ffacd0b85a97d-368712c6cf7mr1830601f8f.65.1721373564649; 
 Fri, 19 Jul 2024 00:19:24 -0700 (PDT)
Received: from [192.168.6.174] (213.211.177.222.static.edpnet.net.
 [213.211.177.222]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d2a635cdsm41129575e9.13.2024.07.19.00.19.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jul 2024 00:19:24 -0700 (PDT)
Message-ID: <08cd73a1-8e7c-4891-b3c8-84fba092877d@mind.be>
Date: Fri, 19 Jul 2024 09:19:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
References: <20240718-ztext-v4-1-15a9744f1edb@gmx.net>
 <ZpoMYixDlvqpfpJ6@probook>
Content-Language: en-GB
In-Reply-To: <ZpoMYixDlvqpfpJ6@probook>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1721373565; x=1721978365; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6ewikEP/Rjh45JMA9BE+AjCvYXsdSerjNxKKpvIJDak=;
 b=csqwYsk9UJTb6+l8N7b+yhcbXZOCXBNLIeEdBxDhMs3Hl48oy4JWkaGBfDeZaIZTOp
 59Z9guooAaRzElEQJPSvTJVlfa3Wu4V/HySABas0N+jvFuNWCGGIWF396sr5Fz9aDgC4
 lS0CNpd5SLn3Titne43LjUG1TY75l2TX+8kDEYRVRZDCZfq/++oddAVXNiaTyAwvPBSp
 XVEO8+CFU3dEdGAr5o0ccM3AAcyINhUEVDkfOfnKEaG0rim++b3pZ08k4CxxMwArfNqY
 VpzUHx1REVW1XUFJZS2Yc3mXo9eww3FdhDU9WS1ZE5+xaO6i+Rn5jATTuQWSUio1v4I+
 60wQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=csqwYsk9
Subject: Re: [Buildroot] [PATCH v4] Config.in: ban textrels on musl
 toolchains
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxOS8wNy8yMDI0IDA4OjQ5LCBKLiBOZXVzY2jDpGZlciB3cm90ZToKPiBPbiBUaHUsIEp1
bCAxOCwgMjAyNCBhdCAxMDozMzoyM1BNICswMjAwLCBKLiBOZXVzY2jDpGZlciB3cm90ZToKPj4g
K2lmZXEgKCQoQlIyX1RPT0xDSEFJTl9VU0VTX01VU0wpJChCUjJfQklORk1UX1NVUFBPUlRTX1NI
QVJFRCkseXkpCj4gCj4gSSBqdXN0IG5vdGljZWQgdGhhdCBCUjJfQklORk1UX1NVUFBPUlRTX1NI
QVJFRCBpcyBpbmNvcnJlY3QsIGJlY2F1c2UKPiBpdCdzIHRydWUgcmVnYXJkbGVzcyBvZiB3aGV0
aGVyIHNoYXJlZCBsaWJyYXJpZXMgYXJlIGFjdHVhbGx5IHVzZWQuCj4gV2hhdCBJIHdhcyBhaW1p
bmcgZm9yIGlzICJCUjJfU0hBUkVEX0xJQlMgb3IgQlIyX1NIQVJFRF9TVEFUSUNfTElCUyIuCj4g
Cj4gSSBzdXBwb3NlIHRoaXMgc2hvdWxkIHdvcms6Cj4gCj4gaWZlcSAoJChCUjJfVE9PTENIQUlO
X1VTRVNfTVVTTCkkKEJSMl9TSEFSRURfTElCUykkKEJSMl9TSEFSRURfU1RBVElDX0xJQlMpLHl5
KQoKICBXaGF0IHdlIGRvIGlzOgoKaWZlcSAoJChCUjJfVE9PTENIQUlOX1VTRVNfTVVTTCk6JChC
UjJfU1RBVElDX0xJQlMpLHk6KQoKICBUaGlzIHNheXMgdGhhdCBtdXNsIG11c3QgYmUgeSBhbmQg
c3RhdGljIG11c3Qgbm90IGJlLgoKICBSZWdhcmRzLAogIEFybm91dAoKPiAKPiAuLi4gYnV0IEkg
ZmluZCBpdCBhIGJpdCB1bmNsZWFyIGJlY2F1c2UgaXQgdGVjaG5pY2FsbHkgZG9lc24ndCBsaW1p
dAo+IHdoaWNoIHR3byBvZiB0aGUgdGhyZWUgb3B0aW9ucyBoYXZlIHRvIGJlIHRydWUgKHRoaXMg
aXMgZG9uZSBlbHNld2hlcmUsCj4gaW4gdGhlIEtjb25maWcgbG9naWMgdGhhdCBtYWtlcyBCUjJf
U0hBUkVEX0xJQlMgYW5kIEJSMl9TSEFSRURfU1RBVElDX0xJQlMKPiBtdXR1YWxseSBleGNsdXNp
dmUpLiBJJ2xsIHJhdGhlciBnbyBmb3IgdHdvIGlmZXFzIGluIHRoaXMgY2FzZToKPiAKPiBpZmVx
ICgkKEJSMl9UT09MQ0hBSU5fVVNFU19NVVNMKSx5KQo+IGlmZXEgKCQoQlIyX1NIQVJFRF9MSUJT
KSQoQlIyX1NIQVJFRF9TVEFUSUNfTElCUykseSkKPiAKPiAKPiAtLSBqbgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
