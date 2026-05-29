Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A90CD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 17:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64E9542366;
	Fri, 29 May 2026 17:21:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kO0QG1bGEwZi; Fri, 29 May 2026 17:21:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FA8B407C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780075302;
	bh=DiGKN8do9DrVK9fG8kBdARYnaXPzDyr9B2gt8ApWF8E=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=calQB6y5TCVDDoUuYTKnPElvrt0ZO8N4KuaV/0wOYcrmDuG5lxUYuv+TwBH4lsH5k
	 GJcv9RPPHaAfiAw2cW+lsOcyQKpSNZY75H7v6n0kgnkeLGBf5GuKjxJRLuYVTaLIuJ
	 DyjlFHSIctOzdU0/dOeAVYepsexzqPXhPjleHAGk5UjU7HXivAdoKz3R7IBrpeLxuq
	 sUDCPTdvSyr2eAidEL8GWpkbxbPN9EF8Z6vv/pTkafGeHt1VGn7lmMt7PVi197sPSt
	 o79Ojtzfh6oJ2c2CyNH9rBOBHxpGIUeXfcAeCoBOUyGhKPHlBybajfmA2QiVxiDbMF
	 4wncpyaTToWcQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FA8B407C9;
	Fri, 29 May 2026 17:21:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0ED78F4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 17:21:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E391C41F30
 for <buildroot@buildroot.org>; Fri, 29 May 2026 17:21:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ilV1KC8jI0OL for <buildroot@buildroot.org>;
 Fri, 29 May 2026 17:21:39 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1233; helo=mail-dl1-x1233.google.com;
 envelope-from=j@j-ernberg.se; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 42DBE41F22
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42DBE41F22
Received: from mail-dl1-x1233.google.com (mail-dl1-x1233.google.com
 [IPv6:2607:f8b0:4864:20::1233])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 42DBE41F22
 for <buildroot@buildroot.org>; Fri, 29 May 2026 17:21:37 +0000 (UTC)
Received: by mail-dl1-x1233.google.com with SMTP id
 a92af1059eb24-1363e78746eso10723854c88.1
 for <buildroot@buildroot.org>; Fri, 29 May 2026 10:21:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780075297; cv=none;
 d=google.com; s=arc-20240605;
 b=aWUlLo7HY23nl/phKyUx8bSez0B5Lq97dFZpbXAi1vo9V4hatZbZgBdTF0Uw7mA8tf
 7FQH52R2vBxBEeE2L0mWAvHFkkzQGn/dpXEQ2PELwvH/tKFozaXCTfM2f3WSO2PQN2sN
 v5POHwa12DgAlcjaTDjov14DI4LcNNZ/oXyaq99lF3bnoQuPVWGbYAeD3kXBTLk5o1WJ
 intRZaxsUcWKzEaW9QvBCoBnMo/gDols2UkvXS9aHxrizeTuTdik3oUjZ3A5sXNz+rGK
 PkYzWJGiZh+FGyYt2F6apeJn7BUuZ+MZ9kJvAnOCwiIKqnYugiXLpHNXgnNoeAr+BSyH
 01nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=q43RM9ZlaBRasmAdhBQSUwXpfOhdKZlPODrawFbVE5Q=;
 fh=HVoM4Y6kriXwIkeuiIMIT/TUDVuTOGkfqrQEu2AyZxg=;
 b=iKdSskffqHmdwtIqf1Fp84xboyda3/SkixP2UyWKtqRdlucqz81tQe4svJOmovtYlS
 FWNWVQzijJGRxCS4vmzzTdFqU/uIAFwiOKNgw/82G4QTln+amMm+nmf1Tmj+tcL8KOCo
 Moxt2YYLC+XGSnluKXDfTZP7l5FsC9JddLF5+ZpkUWdHkedK01ttHUtnH9jycaaQG8v5
 r8hbAQmCqmM5+YqYty/juYhtyh8L9B25eHGLMrRXff17zDukNLw3EvUtYDSAkRGEaKnP
 hFK+ZLiiL+FpEv1lzfmkk8VEBlz9BRto180EaOKV34NcPZj5iWRTdONTkZFRdDPp5Z7F
 OQ6A==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780075297; x=1780680097;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=q43RM9ZlaBRasmAdhBQSUwXpfOhdKZlPODrawFbVE5Q=;
 b=ZjtF83E8LqOsqzznCYRZrFa1vyDEUnsZkqcT6xVQjqFPH9if2TjP+agE0A8HtSmNCN
 aBi6H9qTGHqkM+eHRW2C4atAXgec1J9pbXW+/hAAcIjhqW6nbBZu35bBezN0eji/3gAl
 94nSOMYArepjokGRCcWKNDQUT1zUHzzHPtA6w4e5oqS808wVK1dSD96JvkTnHsEJwrD3
 3vZTCW24JmNORRSqPwgU1YXMd5fIoBQfaM9XsagwukKYduYBetx7/cY79E0f3eR1Ga6z
 47s4FcBmHgI5lNEaSMNRKcFUaoUYozDmgzJTAeBaPWEAbkhMTAD3n//jBME0+oTL8QWK
 mXsw==
X-Gm-Message-State: AOJu0Ywp5oLX/6H0LecdFRrYfDNgvG3TiL0VRKUgejBV50PAzskwAV24
 B7ZakjMn1HB8bZJqEih7Sc/9Tg3oLC4J903KI7n+D8cr9FAOs55j89K/OURCQ8a/cIEhw4k7iPx
 wE3/5I0DhmK2myGwjvoSGcqOJziKyL77oDQc50xv9fU5PRTAE1FA0uCA=
X-Gm-Gg: Acq92OElZi/q+/97UEnqt/EDH0GQnXK8LG96Rfu1heB4+c0H20VzUg+XO5EAVvRjpbY
 pXunkT3yJ882NZLzmUwqkSZy3o3NdJjHspquBaDd5yWsZvfAPZYvoQWNbZ1qt94JEWsj9pB5t7R
 ESk+SBdQRkDffnjPCT3X+mvInhJ2BNVzKJoUvoDgIyiVAF34dyx+SXiQPKhatCEzAnBnLYBQyQP
 WvveHwiJ74SIoIVRrKhc0B+5TygZhkmU+7OJQRssRKo/wE3oqbZM61KaSHLwHU+F5XzRPQv3loG
 zWRjPHNA7pF/i7BNlfgKzz+QswCT
X-Received: by 2002:a05:7022:1a84:b0:11a:fb3c:568b with SMTP id
 a92af1059eb24-137d423bfe1mr268167c88.17.1780075296918; Fri, 29 May 2026
 10:21:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260527204125.4054645-1-j@j-ernberg.se>
 <743ede88-3b01-47f2-8cde-4cf89fd25fb1@rnout.be>
In-Reply-To: <743ede88-3b01-47f2-8cde-4cf89fd25fb1@rnout.be>
From: John Ernberg <j@j-ernberg.se>
Date: Fri, 29 May 2026 19:21:25 +0200
X-Gm-Features: AVHnY4IJTbyL_mzWZLcIvsFhoDq1thK9pwd-CUd-xjg4B09EPZvk7wojUxtf9Dw
Message-ID: <CAAHg4ZhPh_R6kBwJzX2jRxZMMajSuX_Y_jHVYTevH3_ud=4AVQ@mail.gmail.com>
To: Arnout Vandecappelle <arnout@rnout.be>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 John Ernberg <john.ernberg@actia.se>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=j-ernberg-se.20251104.gappssmtp.com; s=20251104; t=1780075297; x=1780680097;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q43RM9ZlaBRasmAdhBQSUwXpfOhdKZlPODrawFbVE5Q=;
 b=vGacWhJUjlVaLO33iTb+jLLf9bZTexjKrJfZFQbAgmURZiYJ1Sju/xcny+bN06Imn0
 zjSKdpdixkfvtPWWtsmxqgaFPyqEtuTsimJSP37H9DBl94IcCfbyIBujYTDnB9u9MixZ
 C1bXEvMfDbP1tL1gaXqEpBMk6YBlapoWKUMl9LmuG2RTUExfWgHAHCtsJb1Cdt4SyZJE
 lp1ccKpXfxtuPR1ObykEpZZGfs4atFHZoY1NQCOuKwvDnj58Q0avTDBRa8I+UX3GtaR1
 ws5b69w2A7yI8o36U3CC/w6l+m2dLELED33kZ7hENemfbomyx5FBO50Oo03g0it6wD3e
 qDQQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=j-ernberg.se
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=vGacWhJU
Subject: Re: [Buildroot] [PATCH v2] package/pkg-generic: Add
 /usr/share/info/dir to $(2)_DROP_FILES_OR_DIRS
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

SGkgQXJub3V0LAoKT24gRnJpLCBNYXkgMjksIDIwMjYgYXQgODo1N+KAr0FNIEFybm91dCBWYW5k
ZWNhcHBlbGxlIDxhcm5vdXRAcm5vdXQuYmU+IHdyb3RlOgo+Cj4KPgo+IE9uIDI3LzA1LzIwMjYg
MjI6NDEsIEpvaG4gRXJuYmVyZyB3cm90ZToKPiA+IFRoaXMgaXMgdGhlIGZpbGUgdGhlIG9yaWdp
bmFsIGNvbW1pdCBkODg5ODM4MDk4NGYgKCJwYWNrYWdlL3BrZy1nZW5lcmljLm1rOgo+ID4gUmVt
b3ZlIEluZm8gZG9jdW1lbnRzIGRpciBlbnRyeSIpIHdhbnRlZCB0byBkZWxldGVkLgo+ID4KPiA+
IEhvd2V2ZXIsIHRoZXJlIGFyZSBlbm91Z2ggcGFja2FnZXMgdGhhdCBpbnN0YWxsIHRvIC9zaGFy
ZSByYXRoZXIgdGhhbgo+ID4gL3Vzci9zaGFyZSwgdGhhdCB0aGUgcGF0aCBjdXJyZW50bHkgbGlz
dGVkIGlzIHN0aWxsIG5lZWRlZC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKb2huIEVybmJlcmcg
PGpAai1lcm5iZXJnLnNlPgo+Cj4gICBBcHBsaWVkIHRvIG1hc3RlciAoaXQncyBhIGZpeCwgcmVh
bGx5LCBldmVuIHRob3VnaCB0aGUgaXNzdWUgYWxyZWFkeSBleGlzdGVkCj4gZm9yIDUgeWVhcnMp
LCB0aGFua3MuCj4KPiAgIEkgZGlkIHRyeSB0byBtYWtlIHRoZSBjb21taXQgbWVzc2FnZSBhIGJp
dCBjbGVhcmVyLgo+CgpUaGVyZSBhcmUgZGVmaW5pdGVseSB0YXJnZXQgcGFja2FnZXMgaW5zdGFs
bGluZyB0aGF0IGRpcmVjdG9yeSBpbmNvcnJlY3RseS4KSSBpZGVudGlmaWVkIHNvIGZhciB3aGVu
IGRpZ2dpbmc6Ci0gZ3J1YgotIGlvdG9wCi0gcmFuZ2VyCi0gdW5pZmRlZgphbmQgYSBoYW5kZnVs
IG9mIHB5dGhvbiBsaWJyYXJpZXMgKHdoaWNoIG1heSBvciBtYXkgbm90IHB1bGwgdGhlCi9zaGFy
ZSBkaXIgZnJvbSB0aGUgc2FtZSBkZXBlbmRlbmN5LApJIGhhdmVuJ3QgaGFkIHRpbWUgdG8gY2hl
Y2sgZnVsbHkgeWV0KQoKSSBoYXZlbid0IGF0dGVtcHRlZCB0byBmaXggYW55IG9mIHRoZW0geWV0
LgoKSSBkaWRuJ3QgZmluZCBhbnkgaG9zdCBwYWNrYWdlcyB5ZXQgdGhhdCBpbnN0YWxsZWQgL3No
YXJlCgpCZXN0IHJlZ2FyZHMgLy8gSm9obiBFcm5iZXJnCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
