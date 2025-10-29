Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A49D8CCF9EE
	for <buildroot@archiver.kernel.org>; Wed, 29 Oct 2025 20:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DC458322E;
	Wed, 29 Oct 2025 20:36:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B9Z1jb7rk3uu; Wed, 29 Oct 2025 20:36:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8322083231
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8322083231;
	Wed, 29 Oct 2025 20:36:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 791CB2A3
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 20:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A3C54099F
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 20:36:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uePJn4eNmngu for <buildroot@buildroot.org>;
 Wed, 29 Oct 2025 20:36:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::129; helo=mail-il1-x129.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9BF6640233
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BF6640233
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9BF6640233
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 20:36:38 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-430e182727dso962215ab.1
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 13:36:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761770197; x=1762374997;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6HLt9SiXsTwPtFXWk5K5jjTmieBXHJ0m2I0XcrW8jdc=;
 b=UDOd8AOz5qqToygDEvpGBTiVTWRy1sUgKKHiSFe3d20J4vaW6sVTzdc6Q6qP4RwAez
 BYTmqBuFwQXfpD43EbmUKO4SKI7R0vK2IwFKhqtLwvN1tWb8wWQlidKESakOOJc8ggz/
 Rpxl6S0zwcex0GhSKMSeRHR/MF03K6CSdPBUpmTvLS9ss/uuyjvkQMz3X7z3kaCMcfu0
 /YnYQytxcpQwnrU2+DgaTBhKcBkzusGsCnnCgGdt4zBDH4A1eCORpQ3gIkIvCnXVIutN
 HXo+IGsVp+qHt2MHT9wh7vbXPtAeESjUhqYlr4sj69o9G91lR8+sFmP+la6g8KcwPApX
 nAvQ==
X-Gm-Message-State: AOJu0YwaP94K347MEgPVev4xjUUPxfYKkwDXY7usVGefWaL7z4p8v/VQ
 9UGj/F+gzJBgja+6baFe6EZ3X5bsjaoQUmz2JzUNDt8Jhw1FDPWabaTYxef096EN558SKUrimYJ
 /owstq4XCvuVkUwuUqxF4ksIm/fkxGng=
X-Gm-Gg: ASbGnctE7xibmamwlwQqcqv5yyUFZlTEwv7lXSBswSF+ZCnzyrdl5zeuJ92yDEppvfn
 p2w30rF2Igyy3LkVAmI0LkW2s+5LROxUBWVRwKD0ZP3PIB8RfFyKixDTqtwg2X5ZKbK/rtoy2fq
 Ck7T1FdWlRSvMtsiKNc0tM4yrCcZHnfdcqRFuyuRQ2XfcRdZoo9vgaiPUcAy9v/tjkSfuhNm38G
 vce/SovIee1ZDaiezVEmbYvGflKw9qluLsSVzqSSaWpPxyWgSLm8JFA1i0=
X-Google-Smtp-Source: AGHT+IHySONGAgwf8GbaAWQgq/f98DAcg0Fbrz7GdVAoavzSScifeQlNT6ii6UPgzXyDIiRsS9fp04Vyp7AOBZx16xQ=
X-Received: by 2002:a05:6e02:3003:b0:430:d448:eb41 with SMTP id
 e9e14a558f8ab-432f9074d3cmr58248735ab.31.1761770197363; Wed, 29 Oct 2025
 13:36:37 -0700 (PDT)
MIME-Version: 1.0
References: <20251028-llama-cpp-v2-v4-1-5f21e78c9c6a@gmail.com>
 <2e2f4d6dd384f9db30eb63c476cf6801@free.fr>
In-Reply-To: <2e2f4d6dd384f9db30eb63c476cf6801@free.fr>
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Wed, 29 Oct 2025 13:36:01 -0700
X-Gm-Features: AWmQ_bnU-VPkLlpqN4-SGRiHHfIeAaeaFlna1molVtXxPgudsTK-DDMTxJRFHvs
Message-ID: <CAMWSM7jafL7_wx-zCGnYyFUPSv6sZ-14ZjSGma9ONega1CVNcQ@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Thomas Perale <thomas.perale@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761770197; x=1762374997; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6HLt9SiXsTwPtFXWk5K5jjTmieBXHJ0m2I0XcrW8jdc=;
 b=f1UcwjVXa+ATYKXavQwH0LYXbBPDDWEyeYmXFwzDHQZwOGBP6HzbrK2qi2Xcv2Ei1U
 NJ1SSb/7EZog0sd5bYVJy0Fd5Kn/NMryQsP+7GCRokkWJzLrDaIwvivuPn/9INI7izO2
 2WXcxX3Kz7k5Om/56doByanrLaVvxKafTz0R9GCTFc6ZjkrqcAssgrVExfy/p5iapnIT
 0Z3k8XZY09Inkl19ZDozyO/G3aQiBznQV5DCecrdEX7eBLp4FiuN5xzAzDuqcvsbrz1I
 dGqW9eN+gAaEWEWChSMEf+bLiLMPDFSc2E8dRY0N1nqSylmDzR20tVJGLpwD36cBNI8m
 Amew==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=f1UcwjVX
Subject: Re: [Buildroot] [PATCH v4] package/llama-cpp: new package
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

SGkgSnVsaWVuLAoKCk9uIFdlZCwgT2N0IDI5LCAyMDI1IGF0IDE6MjjigK9QTSBKdWxpZW4gT2xp
dmFpbiA8anUub0BmcmVlLmZyPiB3cm90ZToKPgo+IEhpIEpvc2VwaCwKPgo+IE9uIDI4LzEwLzIw
MjUgMTg6MTYsIEpvc2VwaCBLb2d1dCB3cm90ZToKPiA+IEFkZCBhIHBhY2thZ2UgZm9yIGxsYW1h
LmNwcCwgYSBDL0MrKyBMTE0gaW5mZXJlbmNlIGxpYnJhcnksIHVzZWQgaW4KPiA+IHBvcHVsYXIg
cHJvamVjdHMgbGlrZSBPbGxhbWEsIFJhbWFMYW1hLCBhbmQgbW9yZS4KPiA+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBKb3NlcGggS29ndXQgPGpvc2VwaC5rb2d1dEBnbWFpbC5jb20+Cj4KPiBJIGFwcGxp
ZWQgdGhpcyBwYXRjaCB0byBtYXN0ZXIuCj4KPiBJIGRpZCB0d28gbWlub3IgY2hhbmdlcywgc2Vl
Ogo+IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2NvbW1pdC8w
M2YzNWJjNjNiYTAxZWRlNWU3ODkwMGNkOThlNTIxN2I3ZThkNzBiCj4KPiBJIHdhcyBub3Qgc3Vy
ZSBhYm91dCB0aGUgcmVhbCB2YWx1ZSBvZiBzdXBwb3J0aW5nIGEgbXVzbCBzdGF0aWMgYnVpbGQK
PiB3aXRoIHN1Y2ggYSBwYWNrYWdlLi4uIElmIHdlIHNlZSBpbiBhdXRvYnVpbGRlcnMgdGhvc2Ug
c3RhdGljIGJ1aWxkcwo+IGFyZSBhIHNvdXJjZSBvZiBidWlsZCBmYWlsdXJlcyB3aGljaCBhcmUg
Y29tcGxleCB0byBmaXgsIHdlIGNvdWxkIGxpbWl0Cj4gdG8gc2hhcmVkIGxpYnJhcmllcyBsYXRl
ci4uLgo+CgpMb29rcyBnb29kLCB0aGFua3MgZm9yIHlvdXIgc3VwcG9ydCBhbmQgcmV2aWV3cyEK
Cj4gSSBhbHNvIHdyb3RlIGEgcnVudGltZSB0ZXN0IGZvciB0aGF0IHBhY2thZ2UuIElmIHlvdSB3
YW50IHRvIHJldmlldwo+IG9yIHRlc3QgaXQ6Cj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9y
Zy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDI1MTAyOTIwMjMzMS4xNjE5Mi0xLWp1Lm9AZnJl
ZS5mci8KPgoKVGhpcyBpcyBncmVhdCwgSSdsbCB0ZXN0IGFuZCBmb2xsb3cgdXAgb24gdGhhdCBw
YXRjaC4KCj4gQmVzdCByZWdhcmRzLAo+Cj4gSnVsaWVuLgoKQmVzdCwKSm9zZXBoCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
