Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B3CECD4F39
	for <buildroot@archiver.kernel.org>; Thu, 14 May 2026 21:33:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B4C460FDC;
	Thu, 14 May 2026 19:38:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s2ca6C3Yswzv; Thu, 14 May 2026 19:38:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FD9760E70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778787517;
	bh=UHv8ku2P1dSPU7be19u44wdRM0fdGLi4f8Sp+QboQIs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qKrHN0TCCLcl8G0dprM13OQSVu43CnYTVPcruu4xLJcoajFhjG021bUxMkx/brme1
	 DUPAKiI5l3hal9/Br2RdjSu+M1UCXh7QHWseIMWCSwa2H5KENfT7ao3XkNUGYa6rfz
	 hyg43frrKmdaEjRxKJxTqzZwBO1YuZ02RTu2Nu3eqRro3ivggY/eFOqggxyZPEfz69
	 Fwj6Pj1eep7ICLJaO5KHSXUqP94iPyr5IjJXtd7+uiSa7T1ZDDy2yC1zXAT0ehykru
	 cURQKaC3luCkkZuawSznMErPBalFCiON9XA1b9z5+18GgvWLqXRIgYjncQ8F0kdV2/
	 rZhcUljLI5NJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FD9760E70;
	Thu, 14 May 2026 19:38:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FF5837F
 for <buildroot@buildroot.org>; Thu, 14 May 2026 19:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0667960A75
 for <buildroot@buildroot.org>; Thu, 14 May 2026 19:38:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tWBGr3H5RppV for <buildroot@buildroot.org>;
 Thu, 14 May 2026 19:38:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2C76260FEC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C76260FEC
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2C76260FEC
 for <buildroot@buildroot.org>; Thu, 14 May 2026 19:38:31 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-441209fb77eso106756f8f.1
 for <buildroot@buildroot.org>; Thu, 14 May 2026 12:38:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778787509; x=1779392309;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m228tGSrhYF+o9AVToOQe2zvQoajD8mlSDKv23s00Ug=;
 b=IuH+ULE9uI0G5d3GitstRnSQkjWWxN+D+ND2dYMwIMCvmWOBXi7mSIfBRVkV7C0mS2
 bIyEXFaLatGpVHJZP5AesyRgo6KdzfCEY4bPcjuk8NSTkM3EdcRoUkEfo8eo4r8tNhj3
 7eZrWXaKij+Leap7I9ut0QmNRIKoidBuUdjMIlr3wamDnY8+Bsq9qWMzVC4iCfPQ9wJU
 H3cHoUTIY+H0XKRYiVQ/JbOjGH/6+BVoaOHRxbuPExod9fmcrO6KCQYJ8i7smKCkMrdb
 k2gLbtRCUlrUoTyonlnk/P8dDTnPjbj1UsptfxSkQsyyDmwBUPuGTOw8IAafZuwttv+Q
 EJ7A==
X-Forwarded-Encrypted: i=1;
 AFNElJ8oz6cNWIXLWv9fn5IokE0R5CbDRTXuPzsUXYSNu3iHvuaiv4n/YquhM64fZZY+C+/tlirp+6YCsiQ=@buildroot.org
X-Gm-Message-State: AOJu0YycthxQPaWW51VDFbxkTFcrQk+uQ3aWtfRZIXmtwP8V38EpULnH
 QTuouP4E4A5073Eaj0oPSjKTznh8ORdH3p0xuhKXfCMcyTgVqDvPqiB6tPOLYkbu1YA=
X-Gm-Gg: Acq92OE1wPdME3XQSszLn5Yr2hyU4lOL4jBSuHHvbIJ/FlHZREJrVvBmcsIpc+9RgOx
 80dbEUjPGTyJ/UaXUOO0BWBQtZYvkbqZ7ltA0ddjBURdUfhL6qRKfz2Ad8/X69DJSzlAXBEKhsh
 J9E3TL1VvG8DkA+aTh9EJl4A/mI/OGPYdl5Zoo02Wfh3aWJBk8kpliv91WnG7m21DPhB852Dlng
 atCfMXSQUilXxoy2JUZcqLVGIFazd4iOWdynTe7eWPXDo3ndpB9USer0CY9CR6606PYOtoyC45x
 ZzKhOlvkDsYKIaC5D12k+3MZssbqj9kmEx9iok6qdf0eyay8yzZMdlyLVEvshwH5CxsXpHXizgi
 Ll1GESebj2lRt1VFaduAlDLHuX0LcgVzKq/bVKtxH7tZ463zpWblNlvlf9imL5Hlawc340omYlE
 OFE9vJGJTG0g66Nc/FebJewoy6XJXaynyyOMPC5uO/giM+BRLjsXc4/0ilyAEB5L2LdQW3h6mnB
 Nu3PLz2fN5dUp22SiNi4jlQm8o8fo0dApxWfuSz017Bz7EnzPm7Zg8T6zX2cbPuMrDHUHCdRk7l
X-Received: by 2002:a5d:64c6:0:b0:446:708e:1e8d with SMTP id
 ffacd0b85a97d-45d955021f5mr7609914f8f.30.1778787509129; 
 Thu, 14 May 2026 12:38:29 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9e768acesm9415061f8f.7.2026.05.14.12.38.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 May 2026 12:38:28 -0700 (PDT)
Message-ID: <3ca4025a-839d-490b-a952-15b6a592e477@smile.fr>
Date: Thu, 14 May 2026 21:38:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Gary Bisson <bisson.gary@gmail.com>,
 Alexander Clouter <alex+buildroot@digriz.org.uk>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Brandon Maier <brandon.maier@collins.com>,
 "Alvaro G . M" <alvaro.gamez@hazent.com>,
 Paul Cercueil <paul@crapouillou.net>, Refik Tuzakli
 <tuzakli.refik@gmail.com>, Doug Kehn <rdkehn@gmail.com>,
 Spenser Gilliland <spenser@gillilanding.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Marcus Hoffmann <bubu@bubu1.eu>, Pascal de Bruijn <p.debruijn@unilogic.nl>
References: <20260506223341.1759760-1-james.hilliard1@gmail.com>
Content-Language: fr
In-Reply-To: <20260506223341.1759760-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1778787509; x=1779392309; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m228tGSrhYF+o9AVToOQe2zvQoajD8mlSDKv23s00Ug=;
 b=QvlkG5b39KHzKWUsRmTziJitMm2zatX0K0/Xal13BQWWIOpf1n9vnU/4jHtmVPmOIT
 ovsGbTbKrxfWUQX2dNWd1fvnan+up4Btd/pNquJqnOvV0EEh34l3eKa6et6i00qzW8jY
 LdciVQoi5u69OVoqtwELaBoVSN4DcgKuvxDAA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=QvlkG5b3
Subject: Re: [Buildroot] [PATCH 01/40] package/arptables: preserve /usr/sbin
 symlink
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

SGVsbG8gSmFtZXMsIEFsbCwKCkxlIDA3LzA1LzIwMjYgw6AgMDA6MzMsIEphbWVzIEhpbGxpYXJk
IGEgw6ljcml0wqA6Cj4gV2l0aCBCUjJfUk9PVEZTX01FUkdFRF9CSU49eSwgL3Vzci9zYmluIGlz
IGEgc3ltbGluayB0byBiaW4uCj4gVXNpbmcgaW5zdGFsbCAtRCBmb3IgZmlsZXMgYmVsb3cgJChU
QVJHRVRfRElSKS91c3Ivc2JpbiBjYW4gY3JlYXRlCj4gdGhlIHBhcmVudCBkaXJlY3RvcnkgcGF0
aCBhbmQgcmVwbGFjZSB0aGF0IHN5bWxpbmsgd2l0aCBhIHJlYWwKPiBkaXJlY3RvcnkuCj4gCj4g
V2l0aCBwZXItcGFja2FnZSBkaXJlY3RvcmllcywgdGhpcyBjYW4gbGF0ZXIgbWFrZSByc3luYyBm
YWlsIHdoZW4gYQo+IHBhY2thZ2UgdGFyZ2V0IGRpcmVjdG9yeSBjb250YWlucyBhIG5vbi1lbXB0
eSB1c3Ivc2JpbiBkaXJlY3RvcnkgYW5kCj4gdGhlIHNrZWxldG9uIHByb3ZpZGVzIHVzci9zYmlu
IC0+IGJpbi4KCk1heWJlIHRoaXMgaXMgc29tZXRoaW5nIHdlIGhhdmUgdG8gZml4IGluIHRoZSBw
YWNrYWdlIGluZnJhc3RydWN0dXJlPwoKPiAKPiBUaGUgc2tlbGV0b24gZGVwZW5kZW5jeSBoYXMg
YWxyZWFkeSBjcmVhdGVkIC91c3Ivc2JpbiwgZWl0aGVyIGFzIGEKPiBkaXJlY3Rvcnkgb3IgYXMg
dGhlIG1lcmdlZC1iaW4gc3ltbGluaywgc28gdXNlIHBsYWluIGluc3RhbGwgYW5kIGxldCBpdAo+
IGZvbGxvdyB0aGUgZXhpc3RpbmcgcGF0aC4KClRoaXMgc2hvdWxkIGhhcHBlbiBpbiB0aGUgYXV0
b2J1aWxkZXJzIHdoZW4gQlIyX1JPT1RGU19NRVJHRURfQklOIGFuZApCUjJfUEVSX1BBQ0tBR0Vf
RElSRUNUT1JJRVMgYXJlIGJvdGggc2V0LiBDYW4geW91IHNoYXJlIGEgbGluayB0byB0aGUgaXNz
dWU/CgpJIGNhbid0IHJlcHJvZHVjZSBoZXJlIHdpdGggYXJwdGFibGVzIHBhY2thZ2Ugd2l0aCBC
UjJfUk9PVEZTX01FUkdFRF9CSU49eSBhbmQKQlIyX1BFUl9QQUNLQUdFX0RJUkVDVE9SSUVTPXku
CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFy
ZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KPiAtLS0KPiAgcGFja2FnZS9hcnB0YWJsZXMv
YXJwdGFibGVzLm1rIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9hcnB0YWJsZXMvYXJwdGFibGVz
Lm1rIGIvcGFja2FnZS9hcnB0YWJsZXMvYXJwdGFibGVzLm1rCj4gaW5kZXggMzIwYTMzYmIzYy4u
ZWM2NTIwMWM4NiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2FycHRhYmxlcy9hcnB0YWJsZXMubWsK
PiArKysgYi9wYWNrYWdlL2FycHRhYmxlcy9hcnB0YWJsZXMubWsKPiBAQCAtMTUsNyArMTUsNyBA
QCBkZWZpbmUgQVJQVEFCTEVTX0JVSUxEX0NNRFMKPiAgZW5kZWYKPiAgCj4gIGRlZmluZSBBUlBU
QUJMRVNfSU5TVEFMTF9UQVJHRVRfQ01EUwo+IC0JJChJTlNUQUxMKSAtbSA3NTUgLUQgJChARCkv
YXJwdGFibGVzLWxlZ2FjeSBcCj4gKwkkKElOU1RBTEwpIC1tIDc1NSAkKEBEKS9hcnB0YWJsZXMt
bGVnYWN5IFwKPiAgCQkkKFRBUkdFVF9ESVIpL3Vzci9zYmluL2FycHRhYmxlcy1sZWdhY3kKPiAg
ZW5kZWYKPiAgCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
