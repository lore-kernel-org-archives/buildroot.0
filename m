Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B84CAC48BC4
	for <buildroot@archiver.kernel.org>; Sat, 17 Feb 2024 17:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E17E415A2;
	Sat, 17 Feb 2024 17:28:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id peEn2DCo18Jq; Sat, 17 Feb 2024 17:28:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8715E415AA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8715E415AA;
	Sat, 17 Feb 2024 17:28:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 34DBD1BF5A8
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 17:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2CAC6401D8
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 17:28:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yANaGhD2BIhF for <buildroot@lists.busybox.net>;
 Sat, 17 Feb 2024 17:28:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com;
 envelope-from=alexander.sverdlin@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A0A0E4012E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0A0E4012E
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A0A0E4012E
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 17:28:33 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2d107900457so43029931fa.1
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 09:28:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708190911; x=1708795711;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vtDOKSR/FSvMxuHlmYi5UiCThEWLJ9eC+xstdn9n8O8=;
 b=uBtHhlc9pDJPHQcSooF3qE76ogPTuq1m1yMXOD7By5pN3hGG53o6aMWQOO6cgn3cud
 dmsJ4e5c3GYs0OAeDhv/ryk8gSvsQn3r31vLPoBz1Ud84q4amvvNpPTPwqj2t3bSFmAy
 MFSPLTuQV764g+UqoEjD5vFMQQ+kS1ngGWRMbbWoOf1sqyXp6B3fq8WuCd/bJVK6pT4y
 jy/YUpVfqUfKjHfc4jhM7gYkgOp8w/EBrMGHgMzGZt6bAmnYJau2hiqbY7MqK7nhkyLf
 eXBTRGm1/K4zeO21UQKz8BAdr6lnkyg868DPrC8qST863i9pdktRhKghG8IqKRjHC+E/
 UVWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPECIn4YeNJmdIaBA25BpniZxrlH8VVo1QJ+ts33ISdL6StW0VYesl0iBkg28j6BjqDdwM3lctvK8AIlQXEqHnsAkr2Y0t3A==
X-Gm-Message-State: AOJu0YzrqDT9GOSzFb+XaH4swhc36PLsHgTuSknzWklRi60JisAccq2m
 imh8iT///Rx6MBgxrnPW7m7lwrd5s6HpBjLNKHo7Ier83w/MhnJl
X-Google-Smtp-Source: AGHT+IHtYBUvAV9Fz5UUpoenobH1oe4pvkweHBimp6KYw5l50zzGZgQPXrsn9Bzs2BS/nUmKKpPzyg==
X-Received: by 2002:a2e:9c07:0:b0:2d0:de6f:c697 with SMTP id
 s7-20020a2e9c07000000b002d0de6fc697mr5272551lji.13.1708190911012; 
 Sat, 17 Feb 2024 09:28:31 -0800 (PST)
Received: from giga-mm-1.home ([2a02:1210:8690:9300:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a05600c00c700b0040fb783ad93sm5656947wmm.48.2024.02.17.09.28.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Feb 2024 09:28:30 -0800 (PST)
Message-ID: <8662a0c59b8cea111c15cabb121c6b598d5a1d04.camel@gmail.com>
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 buildroot@buildroot.org
Date: Sat, 17 Feb 2024 18:28:35 +0100
In-Reply-To: <20240217160244.1320482-20-dario.binacchi@amarulasolutions.com>
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
 <20240217160244.1320482-20-dario.binacchi@amarulasolutions.com>
Autocrypt: addr=alexander.sverdlin@gmail.com; prefer-encrypt=mutual;
 keydata=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
User-Agent: Evolution 3.50.4 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708190911; x=1708795711; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=vtDOKSR/FSvMxuHlmYi5UiCThEWLJ9eC+xstdn9n8O8=;
 b=E6INhK1XRm4otdS6CfLGdfZhpp7qA/rOlQcVC2ILr0hb1BHQGfVFtsg9TK7I8DSmCV
 Bsdsj3WvX+Muh6UdBHatdNO6psTsT7G1gI5Vsm9A0Auzl5j5lL4ITb9JVARJXl3H6BcP
 l8iv/qzEc2sigI20KzlzPyosnK9VKVcxA6TJ873+NZ0x/yNNWnzeIBBEp7yVNYsGB/0K
 TTdM19T02lTbF1AMf9qncQoFBmrUlEpaLgQSCOxTUxC6nVVJkqcpYBZchGTr0Swh+CQG
 hvlc4B1nEaLi1F5Ud05yXKXhEq+aDOKgVeOTZXR0rF8WXsEuHBawb/IT79gOPYYW5aFg
 EUog==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=E6INhK1X
Subject: Re: [Buildroot] [PATCH v4 19/20] boot/ti-k3/ti-k3-r5-loader:
 install tiboot3.bin
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
Cc: michael@amarulasolutions.com, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>, Andreas Dannenberg <dannenberg@ti.com>,
 linux-amarula@amarulasolutions.com, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRGFyaW8sCgpPbiBTYXQsIDIwMjQtMDItMTcgYXQgMTc6MDIgKzAxMDAsIERhcmlvIEJpbmFj
Y2hpIHdyb3RlOgo+IFJlY2VudCB2ZXJzaW9ucyBvZiBVLUJvb3QgYXJlIGNhcGFibGUgb2YgYnVp
bGRpbmcgdGlib290My5iaW4gdXNpbmcKPiBCaW5tYW4uIEluIHRoaXMgY2FzZSwgbGV0J3MgY29w
eSBpdCB0byB0aGUgYmluYXJpZXMgZGlyZWN0b3J5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IERhcmlv
IEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4KCmh0dHBzOi8v
cGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyNDAyMTMxNzI4
MTcuMjg3Mjg0OS0xMi1yb21haW4ubmFvdXJAc21pbGUuZnIvCgpsb29rcyBtb3JlIGNvbXBsZXRl
IHdpdGggc3lzZncuaXRiPwoKPiAtLS0KPiAKPiBBZGRlZCBpbiB2NAo+IAo+IFNpZ25lZC1vZmYt
Ynk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4K
PiAtLS0KPiDCoGJvb3QvdGktazMvdGktazMtcjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5tayB8
IDMgKysrCj4gwqAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdp
dCBhL2Jvb3QvdGktazMvdGktazMtcjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5tayBiL2Jvb3Qv
dGktazMvdGktazMtcjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5tawo+IGluZGV4IDJhMTAwMjRh
ZWRhYS4uNjQzMjk4YTFlNzBhIDEwMDY0NAo+IC0tLSBhL2Jvb3QvdGktazMvdGktazMtcjUtbG9h
ZGVyL3RpLWszLXI1LWxvYWRlci5tawo+ICsrKyBiL2Jvb3QvdGktazMvdGktazMtcjUtbG9hZGVy
L3RpLWszLXI1LWxvYWRlci5tawo+IEBAIC03NSw4ICs3NSwxMSBAQCBkZWZpbmUgVElfSzNfUjVf
TE9BREVSX0JVSUxEX0NNRFMKPiDCoAkkKFRBUkdFVF9DT05GSUdVUkVfT1BUUykgJChUSV9LM19S
NV9MT0FERVJfTUFLRSkgLUMgJChARCkgJChUSV9LM19SNV9MT0FERVJfTUFLRV9PUFRTKQo+IMKg
ZW5kZWYKPiDCoAo+ICtUSV9LM19SNV9MT0FERVJfU0VDVFlQRSA9ICQoY2FsbCBxc3RyaXAsJChC
UjJfVEFSR0VUX1RJX0szX1NFQ1RZUEUpKQo+ICsKPiDCoGRlZmluZSBUSV9LM19SNV9MT0FERVJf
SU5TVEFMTF9JTUFHRVNfQ01EUwo+IMKgCWNwICQoQEQpL3NwbC91LWJvb3Qtc3BsLmJpbiAkKEJJ
TkFSSUVTX0RJUikvcjUtdS1ib290LXNwbC5iaW4KPiArCWZpbmQgJChARCkgLW5hbWUgInRpYm9v
dDMtKi0kKFRJX0szX1I1X0xPQURFUl9TRUNUWVBFKS0qLmJpbiIgLXR5cGUgZiAtZXhlYyBjcCB7
fSAkKEJJTkFSSUVTX0RJUikvdGlib290My5iaW4gXDsKPiDCoGVuZGVmCj4gwqAKPiDCoCQoZXZh
bCAkKGtjb25maWctcGFja2FnZSkpCgotLSAKQWxleGFuZGVyIFN2ZXJkbGluLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
