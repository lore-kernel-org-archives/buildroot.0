Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76898C0218F
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 03:42:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1191481A30;
	Tue,  4 Feb 2025 03:42:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qCRbXtbOKfdz; Tue,  4 Feb 2025 03:42:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 182F281A39
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 182F281A39;
	Tue,  4 Feb 2025 03:42:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BDAC612A
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 03:42:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A248381A39
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 03:42:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ngrTh9C18G9e for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 03:42:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::30; helo=mail-oa1-x30.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9A4AE81A30
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A4AE81A30
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A4AE81A30
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 03:42:01 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-2a3939a758dso1597475fac.1
 for <buildroot@buildroot.org>; Mon, 03 Feb 2025 19:42:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738640520; x=1739245320;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yFUWz2uxlQ6zuBYYNf6vmKMgs0HVL8+2JBpYcjYpwpw=;
 b=aGLdTQNkFM+FJKjM8kLo8Oon/v+F54EalWyLuGB1YKaZ/AfyV4jeuNwlQ+E5iQgbGr
 ob63HF8mU/ZnDa+E8Yeb1VDthPfjAf/7JLeVpatJoJiwy+ZCtmHddZIx4UVY454RWMar
 cDBarhML1yMTSwFsR1KYpUVpKKv8RhcEPUeEMJN0WiMtQ7wL/5zC/cYJCQpGo2Rsgk2w
 /QUItBSTeJxUjr2k+vyQHZtGkED9CpvMKNGJpd8I36V5bVQ3dXWa9xBDEjv27cezX6y/
 Cs7yfZhaSD2RWOOT3MWo5+cQ+6qz8g2W6yFmnVSVHUsLvVTZdFV0Na8uXxo/6Ka/65Pn
 GhmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdxnv4dcZt92VjAeXBLxXfJlfWYZnLt86vJeJaKc29NNe5NUwenSC/Iu/6TERbe4buQBZOCrgE0mU=@buildroot.org
X-Gm-Message-State: AOJu0Yx1x+n700nryu23Uh5mGjnxC99DBzw1+3hH6FqyJVSTJP5k0O5h
 HsTeLXNYPgLoVCYk5ZlNC5exx3dNApzibaZoQhuX7CX+yA8wNZTDsiAuxqhUqjyAoL9LIHf33Ml
 5
X-Gm-Gg: ASbGncuQh+UnC91PfcGuei2wt/Nn8TocFKYxmNacLoKlsiTxiHd7f4RnydMDqMsLbQv
 OHAXinV2oa2D5R4A9kUJL2WbxymvUDzxLorXeQVvhm0t8KBX9HkFh6pVStytjeJKNyHHwaa3Z4H
 Ve5I5WK1iTJwCXSs09bchd7nFw1x2NwS7VVcjVPSCkoILTjMgbYPhLzlC4mKeCxe9D5QwLMrQgz
 mOSn2iZ8p1EgmI/fdiYfUv7AAMn8ltz1vDZSL6kHgLZ0WENXHpXXgKr2+30fe6o2iYPtZaEWJgM
 oWxFmQ/IYCaUDCVM78XNQep8GrLxUBxkMuTbj2KxSJYetQgCxQF5U40=
X-Google-Smtp-Source: AGHT+IF9D4rHioAknfWnx79r2RV+052MhijMgSpip5S6/TRWRHQ0E1rEOeZ11u6tLX9VWn5sYiP7Hg==
X-Received: by 2002:a05:6871:2017:b0:29e:2f3a:761a with SMTP id
 586e51a60fabf-2b32f12d611mr14668892fac.20.1738640519811; 
 Mon, 03 Feb 2025 19:41:59 -0800 (PST)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com.
 [209.85.160.46]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2b3561a849asm3799731fac.18.2025.02.03.19.41.58
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 19:41:59 -0800 (PST)
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-2a8690dcb35so1636358fac.3
 for <buildroot@buildroot.org>; Mon, 03 Feb 2025 19:41:58 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXXKNrbnGdu0kKWFepUQgCzFpIkFRj6valWe9E0a/9OaUeuBmsMxE/in6r9iIOYAlIkF8Cz/Kwk7Uc=@buildroot.org
X-Received: by 2002:a05:6870:899c:b0:29e:7dd8:92b1 with SMTP id
 586e51a60fabf-2b32f2db995mr14071144fac.24.1738640518727; Mon, 03 Feb 2025
 19:41:58 -0800 (PST)
MIME-Version: 1.0
References: <20250203120130.2332720-1-fiona.klute@gmx.de>
 <3dfa6faa-9307-4091-9a8b-f327a0be19be@mind.be>
 <434ed0ef-17b5-48af-9c93-1c7bb75c857f@gmx.de>
 <087a8c52-81f6-4031-b0ce-712fc8857034@mind.be>
 <bf504c35-cbe4-40dd-b56d-bfa3b62e552c@gmx.de>
 <CA+h8R2qSoHp-YPNDAtNiCMrsEEULhYZGZa_EveNnUuPHkeucMQ@mail.gmail.com>
In-Reply-To: <CA+h8R2qSoHp-YPNDAtNiCMrsEEULhYZGZa_EveNnUuPHkeucMQ@mail.gmail.com>
Date: Mon, 3 Feb 2025 19:41:47 -0800
X-Gmail-Original-Message-ID: <CA+h8R2qfjy2PWktigLvq96Tg-GHvVk=uxicdkgW_pp84OvZBCg@mail.gmail.com>
X-Gm-Features: AWEUYZlkArhU25e-9Kc9RqLtuOwVe9Z-lqwpC3SuRcp7NzdQVpliOMy9VOv_tgc
Message-ID: <CA+h8R2qfjy2PWktigLvq96Tg-GHvVk=uxicdkgW_pp84OvZBCg@mail.gmail.com>
To: Fiona Klute <fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1738640520; x=1739245320; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yFUWz2uxlQ6zuBYYNf6vmKMgs0HVL8+2JBpYcjYpwpw=;
 b=n8Bijw6/T7kkFXVWLri8sjSMtsWFCrSWFxqReKZPBYZzRdW7RGxrgrJwXPI+VcOKil
 5g7HsVp3xG7GkomO8AHu1qzdxhwWiwNsxn83mfFoZ4833nXZbwR5uvhmF0WEEx4Mt0jH
 S9YBXsGJ0hjKL5L3KENfqRDAYJ41tC/0NZPsvQG3RTDY7AFdWC7L1emxKtZbv/IEIjjn
 046bS6dUxPZKrlBa8wTRGnKuSW8+KNxF/0HsY7AvwbU7zt9XB9EUlxxJ4po9c+xT/VGh
 sp4KED+ctON/Fx5V0hUI/a2JN/PeT0VQHXUS6incsvMybNPAI7B/NS0ycJNX7d7o1QCl
 ubow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=n8Bijw6/
Subject: Re: [Buildroot] [PATCH 1/1] package/go/go-src: stop forcing
 binutils-gold dependency on aarch64
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRmlvbmEsCgpEb2VzIHRoaXMgUFIgbW9yZSBjb3JyZWN0bHkgYWRkcmVzcyB0aGUgc2l0dWF0
aW9uPwoKaHR0cHM6Ly9naXRodWIuY29tL2dvbGFuZy9nby9wdWxsLzQ5NzQ4CgpPbiBNb24sIEZl
YiAzLCAyMDI1IGF0IDEyOjA44oCvUE0gQ2hyaXN0aWFuIFN0ZXdhcnQgPGNocmlzdGlhbkBhcGVy
dHVyZS51cz4gd3JvdGU6Cj4gT24gTW9uLCBGZWIgMywgMjAyNSBhdCA3OjE34oCvQU0gRmlvbmEg
S2x1dGUgPGZpb25hLmtsdXRlQGdteC5kZT4gd3JvdGU6Cj4gPiBJZiB3ZSBuZWVkIGEgd29ya2Fy
b3VuZCBlbmFibGluZyBHb2xkIGluIHRoZSBCaW51dGlscyBidWlsZCBmb3IgdGhlCj4gPiBjcm9z
cyB0b29sY2hhaW4gbWlnaHQgYWxzbyBiZSBhbiBvcHRpb24sIGJ1dCBoYXMgdHdvIGRpc2FkdmFu
dGFnZXM6Cj4gPgo+ID4gYSkgSXQncyBub3QgZ29pbmcgdG8gaGVscCBwZW9wbGUgdXNpbmcgYSBw
cmUtYnVpbHQgdG9vbGNoYWluLgo+ID4gYikgVGhlIEJpbnV0aWxzIGRldmVsb3BlcnMgc2VlbSB0
byBiZSBwbGFubmluZyB0byBkZXByZWNhdGUgR29sZDoKPiA+IGh0dHBzOi8vc291cmNld2FyZS5v
cmcvcGlwZXJtYWlsL2JpbnV0aWxzLzIwMjQtT2N0b2Jlci8xMzczMTkuaHRtbCAoVGhlCj4gPiBE
ZWJpYW4gcGFja2FnZSBjaGFuZ2Vsb2cgaXMgYSBsb3QgbW9yZSBkaXJlY3QgYWJvdXQgdGhhdC4p
Cj4gPgo+ID4gSSBob3BlIHRoYXQgcG9pbnQgYikgaHVycmllcyB0aGluZ3MgYWxvbmcgb24gdGhl
IEdvIHNpZGUsIHNvIEkgbWVudGlvbmVkCj4gPiBpdCBpbiB0aGUgaXNzdWUgWzFdLgo+Cj4gQ2Fu
J3Qgd2UganVzdCBwdXQgYSBmYWtlIGxkLmdvbGQgYmluYXJ5IGluIHRoZSBQQVRIIGZvciBHbz8K
ClRoYW5rcywKQ2hyaXN0aWFuIFN0ZXdhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
