Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A3AC2BD09
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 20:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7F9A6068B;
	Mon, 24 Jun 2024 20:16:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I01RuIo2zFU8; Mon, 24 Jun 2024 20:16:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3D0F606FD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3D0F606FD;
	Mon, 24 Jun 2024 20:16:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D03DB1BF46A
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 20:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC46B81F1F
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 20:16:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MXMtnygckCph for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 20:16:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=michael@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 103AC81F0E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 103AC81F0E
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 103AC81F0E
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 20:16:09 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a724b3a32d2so198241966b.2
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 13:16:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719260168; x=1719864968;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XYTlHzGzyGSSdMH2QaEOyxm6Kx6KKSlnUGBhZz/PvrU=;
 b=FKHfQURpuHgW3xLMQzRc3hNelb/IHpTvnbk0SXLr7kFpDvGtROC8OIXyI38Ot9elsf
 pW2yI3c15/wJBdt/nTINo6gLcIPapXAEpyfHiQ31tTlya/8fw6XIM89J8kzbjoWo+xfp
 vxvSDnHNkc6U0uc1+XR44IoKCrGOPUYbnASVx6VhiqhVHBhOZMX8vma5Meua0cQ/4ha0
 nOMBkWlBW9HSSHAO6Jt6H+O79v2yGuF416m0gvMpbercsgmNKNbkyEDAqBo0T//zE45R
 GUGLDvjpizXySTRV4UNA8dwU8fU0gLI7c8tBLH+S1AOlP2t9UUTxyn7ggvrHqh4L5UWS
 ATOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuRJiaeTyYBsAfd2Xo2uBXaLkZ847qON4xL1h/jCI2TijkXSXjKmuY3tKso6gGDdDxEPdTiWg4X4R0XmN2Wr2mr3xNLXxgIQ==
X-Gm-Message-State: AOJu0YycBc1MpbD3Jh7E1+hUTze2hYlNCOxCHpyLcV3YCghLNx7QKv8U
 EFl2mI0ugzHHlIad/gbMqPSaxkq/7ihv/O9oiHP/QBCAAEiPtyWgJ242Mq26E5mIxzZca8WVbmo
 msyd7wjetPi5r5liD7C5XVvgLrs1lc5JDlHr/KKRKQxiyr/AjkTI=
X-Google-Smtp-Source: AGHT+IEbRcTEmmg35HkFnk6eX2xwj45FGOqHYy2fwFec7ehhKaQtS2zbi4WEsgsQTRGBbYZuZ2BIRlmfjGL2qUJQbZE=
X-Received: by 2002:a17:906:178c:b0:a6f:ddb4:ce46 with SMTP id
 a640c23a62f3a-a7245b889a8mr328634766b.46.1719260167827; Mon, 24 Jun 2024
 13:16:07 -0700 (PDT)
MIME-Version: 1.0
References: <VI1PR06MB89260012C046F7C3764905CFADD42@VI1PR06MB8926.eurprd06.prod.outlook.com>
 <395208d4-a447-434a-bf5e-57b3a74aff98@mind.be>
In-Reply-To: <395208d4-a447-434a-bf5e-57b3a74aff98@mind.be>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Mon, 24 Jun 2024 22:15:55 +0200
Message-ID: <CAOf5uw=kad8VMPjhx9AX6H7Jz4Myn8juWoCwGgyQ91XWv2iJsg@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1719260168; x=1719864968;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XYTlHzGzyGSSdMH2QaEOyxm6Kx6KKSlnUGBhZz/PvrU=;
 b=f7NU32nxVwwmFvjlZWRcmXOBPg8R9wZp5BOcwGQseeSTiNl02N/eVxDssSHjKCGVL0
 sbTD9vBe3XGGtLN3ZZpCdQo2882k2uI/yx2nvhcCwq1RwsWKeTGHwDLL04IadU2FpTui
 XFuJNQtltFodtkMByJ8wkHGk3fiYhQsE4Pldg=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=f7NU32nx
Subject: Re: [Buildroot] Question regarding IMX8M NANO processors
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
Cc: Ayrton Leyssens <aleyssens@idtech.be>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkKCk9uIE1vbiwgSnVuIDI0LCAyMDI0IGF0IDEwOjEx4oCvUE0gQXJub3V0IFZhbmRlY2FwcGVs
bGUgdmlhIGJ1aWxkcm9vdAo8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgo+Cj4KPgo+
IE9uIDI0LzA2LzIwMjQgMTc6MjksIEF5cnRvbiBMZXlzc2VucyB3cm90ZToKPiA+IEhpIGFsbAo+
ID4KPiA+IEl0IGlzIGEgbG9uZyBzaG90ICwgYnV0IG5vbmV0aGVsZXNz4oCmCj4gPgo+ID4gSGFz
IGFueW9uZSBleHBlcmllbmNlIG9yIChwYXJ0bHkpIGRvbmUgYSBwb3J0IGZvciB0aGUgU00yUy1J
TVg4TkFOTyBwbGF0Zm9ybSBvZgo+ID4gQVZORVQgKGh0dHBzOi8vZW1iZWRkZWQuYXZuZXQuY29t
L3Byb2R1Y3QvbXNjLXNtMnMtaW14OG5hbm8vCj4gPiA8aHR0cHM6Ly9lbWJlZGRlZC5hdm5ldC5j
b20vcHJvZHVjdC9tc2Mtc20ycy1pbXg4bmFuby8+KT8KPiA+Cj4gPiBUaGUgSU1YOC1kZHI0LWV2
ayBkZWZjb25maWcgc2VlbXMgbm8gaGVscCBvbiB0aGlzIHNpbmNlIHRoZSBkYW1uIHRoaW5nIGRv
ZXNu4oCZdAo+ID4gZXZlbiB3YW50IHRvIHN0YXJ0IHdpdGggdGhpcyB1LWJvb3QgYW5kIEFURi4K
Pgo+ICAgTm90IHN1cmUgd2hhdCB5b3UgbWVhbiB3aXRoIElNWDgtZGRyNC1ldmssIHdlIGRvbid0
IGhhdmUgYW55dGhpbmcgbGlrZSB0aGF0Li4uCj4KClBsZWFzZSBjb250YWN0IG1lIGlmIHlvdSBu
ZWVkIGhlbHAgcXVpY2tseS4gTWF5YmUgSSBjYW4gaGVscCB0byBzb3J0IGl0IG91dAoKTWljaGFl
bAoKPgo+ID4gSSBhcHByZWNpYXRlIGFueSBoZWxwIEkgY2FuIGdldCB3aXRoIHRoaXMgb25l4oCm
IHRoZSBhbHRlcm5hdGl2ZSBpcyBhIHF1aXRlCj4gPiBibG9hdGVkIGRlZmF1bHQgY29uZmlndXJh
dGlvbiBpbiB5b2N0byAobGlrZSArNGdiKS4KPgo+ICAgU3RhcnQgd2l0aCB0aGUgYnVpbGRyb290
IGNvbmZpZyBmb3Igb25lIG9mIHRoZSBvdGhlciBJTVg4TSBOYW5vIGJvYXJkczoKPiBmcmVlc2Nh
bGVfaW14OG1uZXZrX2RlZmNvbmZpZwo+IGlteDhtbl9ic2hfc21tX3MyX2RlZmNvbmZpZwo+IGlt
eDhtbl9ic2hfc21tX3MyX3Byb19kZWZjb25maWcKPiBuaXRyb2dlbjhtbl9kZWZjb25maWcKPgo+
ICAgVGhlIGJzaCBkZWZjb25maWdzIHdlcmUgYWRkZWQgbW9zdCByZWNlbnRseSBhbmQgdXNlIGEg
cmVjZW50ICh1cHN0cmVhbSByYXRoZXIKPiB0aGFuIE5YUCkga2VybmVsLCBVLUJvb3QgYW5kIEFU
Ri4gWW91IGp1c3QgbmVlZCB0byBjaG9vc2UgdGhlIHByb3BlciBpbi10cmVlIERUUwo+IG5hbWUg
Zm9yIGtlcm5lbCBhbmQgVS1Cb290LiBBbmQgaWYgdXBzdHJlYW0gZG9lc24ndCBoYXZlIGEgRFRT
IGZvciB0aGF0IGJvYXJkLAo+IHlvdSBjYW4gc2ltcGx5IGNvcHkgaXQgZnJvbSB5b2N0byBhbmQg
YWRkIGl0IHRvIHRoZSBib2FyZCBkaXJlY3RvcnkgKHNvIGEgY3VzdG9tCj4gRFRTIHJhdGhlciB0
aGFuIGFuIGluLXRyZWUgb25lKS4KPgoKCj4gICBSZWdhcmRzLAo+ICAgQXJub3V0Cj4KPgo+ID4K
PiA+IFRoYW5rcyBpbiBhZHZhbmNlCj4gPgo+ID4gQXlydG9uIExleXNzZW5zCj4gPgo+ID4KPiA+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBidWls
ZHJvb3QgbWFpbGluZyBsaXN0Cj4gPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+ID4gaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFp
bGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCgoKLS0gCk1pY2hhZWwgTmF6emFy
ZW5vIFRyaW1hcmNoaQpDby1Gb3VuZGVyICYgQ2hpZWYgRXhlY3V0aXZlIE9mZmljZXIKTS4gKzM5
IDM0NyA5MTMgMjE3MAptaWNoYWVsQGFtYXJ1bGFzb2x1dGlvbnMuY29tCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KCkFtYXJ1bGEgU29sdXRpb25zIEJWCkpvb3AgR2Vlc2lua3dl
ZyAxMjUsIDExMTQgQUIsIEFtc3RlcmRhbSwgTkwKVC4gKzMxICgwKTg1IDExMSA5MTcyCmluZm9A
YW1hcnVsYXNvbHV0aW9ucy5jb20Kd3d3LmFtYXJ1bGFzb2x1dGlvbnMuY29tCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
