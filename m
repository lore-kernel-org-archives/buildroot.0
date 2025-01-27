Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A24CC02188
	for <buildroot@archiver.kernel.org>; Mon, 27 Jan 2025 19:49:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B032C40549;
	Mon, 27 Jan 2025 19:49:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7e26fxiFzQ0Y; Mon, 27 Jan 2025 19:49:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8369A4054B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8369A4054B;
	Mon, 27 Jan 2025 19:49:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BC1BA976
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 19:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9CD5360693
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 19:49:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cxGEv-Te1gwA for <buildroot@buildroot.org>;
 Mon, 27 Jan 2025 19:49:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 60CE760619
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60CE760619
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 60CE760619
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 19:49:54 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5d3bbb0f09dso9097213a12.2
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 11:49:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738007392; x=1738612192;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G77roJ/wVyX+noYupBQ62ouw43lsZz7BZjkYNJ0wDfM=;
 b=P1eVb9Ui5exDmHUqG65yjEKKg0RRgzCV+bIzVt+M/xOqU8z6yaNBy61IZvlz6daGpb
 hCbTpNeOnUizuQWdwVo7azMxCopbTOhLrpLNaUDb3mTmKwtPvPP/tfPtBN3rn1wfO0Nw
 BgwCcg7WjN365Wa9AhPJcMNXZumuR6fN0V9KIo7TycY2BtcacsbxDMabK8dsAgLE5l98
 O8brU3fvRpfCIcEXB/73R+QuN1m2NjgCH46KKX/khow0E7NduaszrfcQ8ot/cISi3XmP
 Dt+MidGP6tMaXNA6Mps8hs+DQNqEzwwvidM/MATME0yFihaBct84+NY40dQC0WGauP1f
 JGwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWk6qBTEL+/cal02//Xe2NqxSeHwbMHw6olvxqdrrjwkwBFuplGLXQc1d1D6QNKfOlFsGsvTLNDPRE=@buildroot.org
X-Gm-Message-State: AOJu0YwNWztG9aCrJ8PdHFvt0iaa3lu1SPmuvP8zKWCASde7cfj3DBuu
 5GvkZB8iG1PVHAr64kZCYvs82NbMQXs+LliyCvgNqXBlc9+4k1JsIl1qw9Vap3gShgdAP4X4uGF
 tFWzIy+KKxirBJEv/llxuLtbFKdx1SLRK6is=
X-Gm-Gg: ASbGnctN11kCOA29UP6R8JLv4BWItfW2URrdCYhgxDo7V8jozvmDzUm4ZY302j3DouA
 1+boRc4ieXAvPmYgZ66qCeddei5TytCcgMG7YlhVFSCr2iAu+LTgxvPVtvEKQ0w==
X-Google-Smtp-Source: AGHT+IGCWjie0uyegsfo9j4ku6fwiAZCce4IpP0Gsde62YEXKZ0ZWU5VTb7IQjkO/heJtLsEs1v1anHF8w/+7b+rQmk=
X-Received: by 2002:aa7:d5d1:0:b0:5db:fc7c:be69 with SMTP id
 4fb4d7f45d1cf-5dbfc7cbef2mr15366757a12.1.1738007391965; Mon, 27 Jan 2025
 11:49:51 -0800 (PST)
MIME-Version: 1.0
References: <20241211191630.1414970-1-bernd@kuhls.net>
 <20241211191630.1414970-2-bernd@kuhls.net>
 <20241229221255.2138fc09@windsurf>
 <e327553b-93a3-44cc-9b70-48bab7497067@gmx.de>
In-Reply-To: <e327553b-93a3-44cc-9b70-48bab7497067@gmx.de>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 27 Jan 2025 21:49:38 +0200
X-Gm-Features: AWEUYZkYT9YXu5d6dk4Vlt3Y9R9Fku1oyHECXP99sEjJ6GB4mP-fNueFKZjVMV0
Message-ID: <CADvTj4psKDjXCC3691x-eboKJ=aLVXKw9g7pRASOvpRq_xYz4w@mail.gmail.com>
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738007392; x=1738612192; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G77roJ/wVyX+noYupBQ62ouw43lsZz7BZjkYNJ0wDfM=;
 b=aU+U1+sRw8mzEiaB8s69atzmTK24WhwdGqb8dJ4ejHFGNjqi7wnoB+1PQo4ov5ycuJ
 Lm/xzf3oyuB5kcikkBiAHMHBqRX6z6fI1NhhG8tU3Og13jkzAXqeDVcZ3ZhiJzAK9bnv
 YgIhygAJoqJs19o9yO+Wr5ne30sq/87MjpGMLPS6nemQFZRxF6W/tBxgUCNdZnjqc+35
 1FBVfQZk7Nr4NonkJLdPqZGYPm8hJ8//Wf4iviZQUFLn4cVPywZIIgsVG5SL/gDnD6z+
 RZTmSYyUcC0QrM5pRQrITc1kNYqoVm+eElHQHM7ItuPnXhe5RvK8s+a7VlxDvlnuIGFG
 pArQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=aU+U1+sR
Subject: Re: [Buildroot] [PATCH v2 2/2] package/python-emailproxy: new
 package
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

T24gTW9uLCBKYW4gMTMsIDIwMjUgYXQgODoxN+KAr1BNIEZpb25hIEtsdXRlIDxmaW9uYS5rbHV0
ZUBnbXguZGU+IHdyb3RlOgo+Cj4gQW0gMjkuMTIuMjQgdW0gMjI6MTIgc2NocmllYiBUaG9tYXMg
UGV0YXp6b25pIHZpYSBidWlsZHJvb3Q6Cj4gPiBIZWxsbyBCZXJuZCwKPiA+Cj4gPiBPbiBXZWQs
IDExIERlYyAyMDI0IDIwOjE2OjMwICswMTAwCj4gPiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMu
bmV0PiB3cm90ZToKPiA+Cj4gPj4gK1BZVEhPTl9FTUFJTFBST1hZX1ZFUlNJT04gPSAyMDI0LjEx
LjExCj4gPj4gK1BZVEhPTl9FTUFJTFBST1hZX1NPVVJDRSA9IGVtYWlscHJveHktJChQWVRIT05f
RU1BSUxQUk9YWV9WRVJTSU9OKS50YXIuZ3oKPiA+PiArUFlUSE9OX0VNQUlMUFJPWFlfU0lURSA9
IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy8yYi80OS8zODZlNjc1ZjJi
MDcwNjA4M2ZkZjAyYWQzNjY2Yjk4ZDA4NzVhMmUxY2RjYWJmZjhkZjlmZTY0MWQyZTMKPiA+PiAr
UFlUSE9OX0VNQUlMUFJPWFlfREVQRU5ERU5DSUVTID0gaG9zdC1weXRob24tY3J5cHRvZ3JhcGh5
IGhvc3QtcHl0aG9uLXB5YXN5bmNvcmUKPiA+Cj4gPiBJIGFtIHN0aWxsIG5vdCBoYXBweSB3aXRo
IGhvc3QtcHl0aG9uLWNyeXB0b2dyYXBoeQo+ID4gaG9zdC1weXRob24tcHlhc3luY29yZSBiZWlu
ZyBkZXBlbmRlbmNpZXMsIHdoaWxlIHRoZXkgZGVmaW5pdGVseQo+ID4gc2hvdWxkbid0IGJlIG5l
ZWRlZC4gSSBrbm93IEphbWVzIGFza2VkIHlvdSB0byB1c2UKPiA+IC0tc2tpcC1kZXBlbmRlbmN5
LWNoZWNrLCBhbmQgaXQgYXBwYXJlbnRseSB3YXNuJ3Qgd29ya2luZyB3aXRoOgo+ID4KPiA+ICAg
IEZpbGUgIi9ob21lL2Jlcm5kL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvcHl0aG9uLWVtYWlscHJv
eHktMjAyNC45LjEyLwo+ID4gZW1haWxwcm94eS5weSIsIGxpbmUgNTIsIGluIDxtb2R1bGU+Cj4g
PiAgICAgIGltcG9ydCBhc3luY29yZQo+ID4gTW9kdWxlTm90Rm91bmRFcnJvcjogTm8gbW9kdWxl
IG5hbWVkICdhc3luY29yZScKPiA+Cj4gPiBEbyB3ZSBoYXZlIGFuIGV4cGxhbmF0aW9uIHdoeT8K
PiA+Cj4gPiBBZGRpbmcgdGhvc2UgZGVwZW5kZW5jaWVzIHJlYWxseSBmZWVscyBsaWtlIGEgaGFj
ay4KPiBMb29rcyBsaWtlIHRoZSB1cHN0cmVhbSBweXByb2plY3QudG9tbCByZXF1aXJlcyBpbXBv
cnRpbmcgdGhlIG1vZHVsZSB0bwo+IHJlYWQgdGhlIHZlcnNpb246Cj4gaHR0cHM6Ly9naXRodWIu
Y29tL3NpbW9ucm9iL2VtYWlsLW9hdXRoMi1wcm94eS9ibG9iLzNlZDdkZmRjZDFkN2E5ZGMyYTM5
MmFlY2FhZTdiYjVkOTEzYWNlYzAvcHlwcm9qZWN0LnRvbWwjTDQ1Cj4KPiBNeSBndWVzcyBpcyB0
aGF0IGNyb3NzLWJ1aWxkIHdhc24ndCBhIGNvbnNpZGVyYXRpb24gdGhlcmUuIE1pZ2h0IGJlCj4g
d29ydGggdHJ5aW5nIHRvIGNvbnZpbmNlIHVwc3RyZWFtIHRvIGNoYW5nZSB0aGF0LCBvdGhlcndp
c2UgdGhlIHF1ZXN0aW9uCj4gaXMgd2hldGhlciBpdCdzIHByZWZlcmFibGUgZm9yIEJ1aWxkcm9v
dCB0byBoYXZlIGhhY2tpc2ggaG9zdAo+IGRlcGVuZGVuY2llcywgb3IgYSBwYXRjaCB0byBtYWtl
IHRoZSB2ZXJzaW9uIHN0YXRpYy4KCkkgaGFja2VkIHRvZ2V0aGVyIGEgcXVpY2sgUFIgdGhhdCBz
aG91bGQgZml4IHRoaXM6Cmh0dHBzOi8vZ2l0aHViLmNvbS9zaW1vbnJvYi9lbWFpbC1vYXV0aDIt
cHJveHkvcHVsbC8zMjIKCj4KPiBCZXN0IHJlZ2FyZHMsCj4gRmlvbmEKPgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
