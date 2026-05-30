Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11BF5CD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 22:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA48185489;
	Sat, 30 May 2026 22:02:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QAXplJg2nRVA; Sat, 30 May 2026 22:02:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C68B885488
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780178532;
	bh=DFcuDkmxUziGSSnGGeDyNhILaU58Vl29/nW4RLHbJJU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Go2ACqsN4+vVkumZQVMVx8Sft1+1akHAFB9BqKA+ApgFEJ1DwonEOPh1MJ0ko1PU8
	 HaSq6vCXbx/H/5VWJDgqSpxWRa99hejkIY4Q/v7QTKAD4/T//m9+kJf2br0GlWTwQ6
	 D2XC7E+H22W5o9ujdsIIBFJem6/K0DAgek/7fwhCXRreiBSjARvuf6Tjx5wNmusvQ3
	 LyuoFurHzZKHhcJeXJ+mnmpFduXGacmyCq0Iio9WM+EWPpxCfWvYDZCcxfBSq8kTM9
	 yWnjM4k2Vc3NlPgBLjZQ/JA4hY8nk2epn66LX5VUm+W/R9DaILtbO16HsWuKrS7kfj
	 A4no1JU64d30g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C68B885488;
	Sat, 30 May 2026 22:02:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BA76FD3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 22:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A004C40225
 for <buildroot@buildroot.org>; Sat, 30 May 2026 22:02:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9f4idKs5sgci for <buildroot@buildroot.org>;
 Sat, 30 May 2026 22:02:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 888A64010F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 888A64010F
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 888A64010F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 22:02:09 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 7D252C6246A;
 Sat, 30 May 2026 22:02:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3192E6073B;
 Sat, 30 May 2026 22:02:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3180110888CC7; 
 Sun, 31 May 2026 00:02:05 +0200 (CEST)
Date: Sun, 31 May 2026 00:02:04 +0200
To: Jan =?utf-8?B?xIxlcm3DoWs=?= <sairon@sairon.cz>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
Message-ID: <ahteTni06zPUTyjA@windsurf>
References: <20260525164043.2992387-1-sairon@sairon.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260525164043.2992387-1-sairon@sairon.cz>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780178526; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=MH2r4PEIfKVM0i+RHrbLVP8pUeDragiy7kx9CsFRshw=;
 b=PRf9E2AC399DImlCxQjnJWGJ1+Part01MhFYTePPcOTAX3YSwOa+Cb8bFQfzx14+ANC37I
 OqwJ+RhBnqwQi4otBeEMtu6pkYrtp4Z28a95v0TLn1+R+pJXPFT5ord0yxr0WUj/MnohwT
 iV2q00fpQCFJJrNfLG9MB9xAjwGGcPAf9Em1L094jH8XiOquvEaB54ZX1eTjYzkID5VPpS
 qqAWGcvoJQQi76Io2JEHb0BMcEAGeo4I0lTPXMS8uVqD5v1hjsaNdsiFkdv3dXR5A1Ha7c
 29y4lwb0tum+2z1ycG8Sldocq0jRA3Vz/Irmk6HhGzOwsXAL4seYkLhzDlHufg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=PRf9E2AC
Subject: Re: [Buildroot] [PATCH] package/linux-firmware: add WiFi and BT
 firmware for MT7920
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBNYXkgMjUsIDIwMjYgYXQgMDY6NDA6NDJQTSArMDIwMCwgSmFuIMSMZXJtw6FrIHdy
b3RlOgo+IEFkZCBmaXJtd2FyZSBmb3IgdGhlIE1lZGlhVGVrIE1UNzkyMCBjaGlwLCB3aGljaCBp
cyBoYW5kbGVkIGJ5IHRoZQo+IG10NzkyMWUgZHJpdmVyLiBXaUZpIHN1cHBvcnQgd2FzIGFkZGVk
IGluIExpbnV4IDYuMTAgWzFdIGFuZCBCbHVldG9vdGgKPiBzdXBwb3J0IGluIExpbnV4IDYuOSBb
Ml0uIFRoZSBmaXJtd2FyZSBmaWxlcyB3ZXJlIGFkZGVkIGluIFszXSAoV2lGaSkKPiBhbmQgWzRd
IChCVCksIGluY2x1ZGVkIGluIGxpbnV4LWZpcm13YXJlIHNpbmNlIHZlcnNpb24gMjAyNDEwMTcu
Cj4gCj4gWzFdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L3N0YWJsZS9saW51eC5naXQvY29tbWl0Lz9pZD00YTQwZmNiZmUzYWI0ODQ2NjcwYjU5YjgxYzkx
NGVkN2U3ZGFjMmIzCj4gWzJdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L3N0YWJsZS9saW51eC5naXQvY29tbWl0Lz9pZD0xY2I2M2Q4MGZmZjZjNGY1MDE0
NjllMjhhMGViNjM3OTYzOWUwNzExCj4gWzNdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L2Zpcm13YXJlL2xpbnV4LWZpcm13YXJlLmdpdC9jb21taXQvP2lk
PTNjZTg0YThkYmY0YTQxOGNjOTgyNTAzNTk2ZTQ4MWExYmU4NGVhYjEKPiBbNF0gaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvZmlybXdhcmUvbGludXgtZmly
bXdhcmUuZ2l0L2NvbW1pdC8/aWQ9N2Y5YzFmMWIxYzBlZGQyMzdjMmQwYjcyZmJjMTVlNzRiZTYy
NGI3Nwo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbiDEjGVybcOhayA8c2Fpcm9uQHNhaXJvbi5jej4K
ClRoYW5rcyBhIGxvdCwgYXBwbGllZCB0byBuZXh0IQoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6
b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwg
ZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
