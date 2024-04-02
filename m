Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1FDECD1284
	for <buildroot@archiver.kernel.org>; Tue,  2 Apr 2024 16:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AAD981F92;
	Tue,  2 Apr 2024 16:21:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q0qGsRtouka3; Tue,  2 Apr 2024 16:21:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 911EA81F97
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 911EA81F97;
	Tue,  2 Apr 2024 16:21:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2B8131BF471
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 16:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1879C40BD3
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 16:21:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xUxvKXFg6B5Y for <buildroot@lists.busybox.net>;
 Tue,  2 Apr 2024 16:21:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=michael@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 72A2440578
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72A2440578
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 72A2440578
 for <buildroot@buildroot.org>; Tue,  2 Apr 2024 16:21:04 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-56b0af675deso6057813a12.1
 for <buildroot@buildroot.org>; Tue, 02 Apr 2024 09:21:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712074862; x=1712679662;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iugeUU2axAORewu0G6jd0ec3EUoxp/pmxl9AImLQ0/U=;
 b=QMYu+i2DwvczQXNATHV6kgW09/ra+jEhslXfRgb+LYDreXRWBSQTBvR5QDspLs/gRp
 vOPN2tv+nJm1AkFtR1OftaRmVVhqEG80RxtB25QewZJraZprO+iJa3LFY4S7fWweNaSo
 2Ay/MO78ylsjTbQQdf3H1+jnpYM65InxaMw6pEGGp/ubzFrQSJmfQVbQs6yqwauj5BaH
 mRrWU60uv4W3p4SOUafHLrWCSAB8+E7vTaI1R7UwHlykWXmpVFJbuRrgQTpmxGMQWXsv
 jyhJtLDG3D4t8WEoenXFIDaCTCFEGreg6N7trDzi8O8oLCVBxlIjtE2isXBCbhp/TpGp
 fkkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV86hDEoVeIH0OxHsbeONLhEmG8bugw+RINe1ovd7WjHmiOAipcVx6BURmIkeS2pajvJewokXMXJuHp8KxGM6JHRJFbcXG10g==
X-Gm-Message-State: AOJu0Yyq+OeKcY5UoqZ1/l9Q672voWY+8uZIBOElF7ycmEFJTDsjyt4X
 hkefplBN23D9mKq2A7Z1TbSVi6pbg77O9w52azVc905PMfcyap3nMZEkG4kLP47ayVTZMmaBu31
 inOkyEbjlAgMzvZ+LdIruz0Q/TKfpD+T+7MxeRA==
X-Google-Smtp-Source: AGHT+IFm/QFiUWDc8BTM6g/fTb68pcTEd1TeeRncME7oPbdq7/1D/80Eqqgs2e08Hgqg4sEGk4LL0H70vKkOumhOCVI=
X-Received: by 2002:a50:d69c:0:b0:566:ab90:1073 with SMTP id
 r28-20020a50d69c000000b00566ab901073mr8912077edi.34.1712074862477; Tue, 02
 Apr 2024 09:21:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240330160244.3214733-1-dario.binacchi@amarulasolutions.com>
 <20240402145026.GA886045@theia>
In-Reply-To: <20240402145026.GA886045@theia>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Tue, 2 Apr 2024 18:20:51 +0200
Message-ID: <CAOf5uwnnpKWdTHVN6ua9r_KnZ7sjwJj8hcpOsLwBMnb2RoVr7A@mail.gmail.com>
To: =?UTF-8?Q?Gero_Schw=C3=A4ricke?= <gero.schwaericke@grandcentrix.net>, 
 buildroot@buildroot.org, Dario Binacchi <dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1712074862; x=1712679662;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iugeUU2axAORewu0G6jd0ec3EUoxp/pmxl9AImLQ0/U=;
 b=VnuEXt8SKCuehrVaSJOYe3M772juhkrdjIL+kjAntqoOqRmHeffht5EMkSdPeK8MK0
 NW19036hPawThz0X1z3hjoXzBuqXn2HctYWgTXEOttk7g1T06+/IRcOMXlgyIb3y2Yqd
 Tgb1MLaDyUUV/3+D0dBx9Vp0I+Y2668hDdjMY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=VnuEXt8S
Subject: Re: [Buildroot] [PATCH v10 00/12] Add support for AM62x-SK HS-FS
 devices
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
Cc: Romain Naour <romain.naour@smile.fr>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Andreas Dannenberg <dannenberg@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkKCk9uIFR1ZSwgQXByIDIsIDIwMjQgYXQgNDo1MOKAr1BNIEdlcm8gU2Nod8Okcmlja2Ugdmlh
IGJ1aWxkcm9vdAo8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgo+Cj4gVGVzdHMgcGVy
Zm9ybWVkOgo+Cj4gKiBjb21waWxlZCB0aV9hbTYyeF9za19kZWZjb25maWcKPiAgICogc3VjY2Vz
cwo+ICogYm9vdGVkIG9uIEFNNjJ4IFNLIEVWTSAoRTMpCj4gICAqIHN1Y2Nlc3MKPiAgICogbm8g
b2J2aW91cyBlcnJvcnMgaW4gZG1lc2cKPgo+IFRlc3RlZC1ieTogR2VybyBTY2h3w6RyaWNrZSA8
Z2Vyby5zY2h3YWVyaWNrZUBncmFuZGNlbnRyaXgubmV0Pgo+CgpUaGFuayB5b3UgdG8gdGVzdCB0
aGVtIGFuZCBmb3IgYWxsIHRoZSBvdGhlciBwZW9wbGUgdGhhdCBhcmUgd29ya2luZwp0byBnZXQg
dGhvc2UgcGF0Y2hlcyBpbgoKTWljaGFlbAoKPgo+IC0tCj4KPgo+Cj4g4oCT4oCT4oCTCj4KPgo+
IGdyYW5kY2VudHJpeCBHbWJIIHwgQSBWb2RhZm9uZSBDb21wYW55IMK3IEhvbHptYXJrdCAxIMK3
IDUwNjc2Cj4gKkNvbG9nbmUqIHwgUGhvZW5peHNlZXN0cmFzc2UgMTggwrcgNDQyNjMgKkRvcnRt
dW5kKiDCtyBHZXJtYW55Cj4gfCBpbgo+IDxodHRwczovL3d3dy5saW5rZWRpbi5jb20vY29tcGFu
eS9ncmFuZGNlbnRyaXg+IHwgcGhvbmU6ICs0OS0yMjEtNjc3LTg2MC0wCj4gfCBlbWFpbDogaGVs
bG9AZ3JhbmRjZW50cml4Lm5ldCA8bWFpbHRvOmhlbGxvQGdyYW5kY2VudHJpeC5uZXQ+Cj4KPgo+
IGdyYW5kY2VudHJpeCBjYXJlcyBhYm91dCBwcml2YWN5Cj4gPGh0dHBzOi8vZ3JhbmRjZW50cml4
Lm5ldC9kZS9wYWdlcy9wcml2YWN5bWFpbC8+Cj4KPiBBbXRzZ2VyaWNodCBLw7ZsbiB8IEhSQgo+
IDcwMTE5IHwgR2VzY2jDpGZ0c2bDvGhyZXI6IE0uIEtyw7ZtZXIsICBSLiBIw6RuZWwgfCBVU3Qu
LUlkTnIuOiBERTI2NjMzMzk2OQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QKCgoKLS0gCk1pY2hhZWwgTmF6emFyZW5vIFRyaW1hcmNoaQpDby1Gb3VuZGVyICYg
Q2hpZWYgRXhlY3V0aXZlIE9mZmljZXIKTS4gKzM5IDM0NyA5MTMgMjE3MAptaWNoYWVsQGFtYXJ1
bGFzb2x1dGlvbnMuY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KCkFtYXJ1
bGEgU29sdXRpb25zIEJWCkpvb3AgR2Vlc2lua3dlZyAxMjUsIDExMTQgQUIsIEFtc3RlcmRhbSwg
TkwKVC4gKzMxICgwKTg1IDExMSA5MTcyCmluZm9AYW1hcnVsYXNvbHV0aW9ucy5jb20Kd3d3LmFt
YXJ1bGFzb2x1dGlvbnMuY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
