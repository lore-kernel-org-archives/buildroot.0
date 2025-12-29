Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF66D3B7E5
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 00:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1417681432;
	Mon, 29 Dec 2025 00:32:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bkHKDI4xnTcX; Mon, 29 Dec 2025 00:32:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C0A7813AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766968330;
	bh=gcbZCDCHf8YW2LRaqwg4rPS3Vj5Xq70zNe0JD/ilaJI=;
	h=References:In-Reply-To:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KfI082w0MEBMILW3aUnNUF3Acqtxe+j6l9SF4WeYp3DAJs99SMafIxoFDOCY3f7JZ
	 Vh57K0XnCfO1H953HagJ+hTw8l8S1zZnLsDqlVTFDXYGNpbh32LTcxXClOu+9khjou
	 P+uGnrVwoRfJMWY/1o4G61GZYj25g3thTfYGR0KaPV3Pjldb/9Nct2GsoAcgzvm74D
	 Mx6282I8srSU7sZ9ZE2XoeYGR2byo2AeRkuoN9Uu27sVnDtA18xTRFA0evlN0em/sj
	 MzMP5O/lcsKLNWAz/p2pSHb9M40Gx/T8NQu6WBV4OLByGQ0Czvjc75H+K1t6tnwtNZ
	 7/o34emNIWTcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C0A7813AB;
	Mon, 29 Dec 2025 00:32:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 34108B9
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 00:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2666B403D2
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 00:32:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2f-J8VCaHR2e for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 00:32:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EDEA4400DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDEA4400DA
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EDEA4400DA
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 00:32:07 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-59b30275e69so3531818e87.1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 16:32:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766968325; x=1767573125;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WDM9Tmu4NJkhpYlNSY5O1Sj+4biYAK2aSc8QC1uSU78=;
 b=eMe5D+9LADM3hP7yFPYdUeV77O+T+vwdD/Dr5YOW/du957AUySHfXHH0l4SIBajd4L
 v7kPoBRzUHk60iNo0BYj4yu98MDad+rs1p5ceRZe/h5p+raUbI2UkQYc82kLJTs7ctdV
 gBKh52S4DjATVsoo762b7O9Cw5cTOhX20e9w+clqpORJ9H8vKGXI97Z7tgeunPyKIP+U
 MGfUM5DaJxwcCpihYxTO06NVpbETR8dwv95+AEre28V376eCzzXIOvywS2lYUB+4txgo
 nD4folSQEvLPgQwYD6Qkrc9fS5wNlU4B5asdeYO/YOItLuLLPmoOCZTQbJWCWrigTE3Z
 +0xQ==
X-Gm-Message-State: AOJu0Yy/OtE7v7lS7m6GAoL5/JMqEdLgEZDNkB0KOpcGJgI+RsnVbhlJ
 I0h0+teqPmP0k/dYwEUieQrFLsOr87I3uQTA/Tt8g/aXqEPGftleGxKP/YTzf1FJDd74UyFMFq5
 pp/2A0cUQWA==
X-Gm-Gg: AY/fxX55lW6PHfxsCpfQ5o4zHwXtCjCKoZpio68lPpQYjHJT8X3u0sodB5Bb+M09awl
 RVurd8aszmk96RfvIdUKTNiiy4DbeWpc3BvsxyuzvLhOwAGEPN0+olNp1eHzfcAYU8Wx7PP4iWD
 sPq5XNxM1hQT5rEDONYeVaE0LqhPEv6yJsuB/0lSyjr659b0p1+VINtFxxrM6OQms/zF1mhS0VY
 z8+x9f18S+0ntnQkK2ojagaeg2SzE9cK1swPpWx2K7Yobcjo9c/3lp9h8Zix/Mn7j+OeIL/DDs9
 qes8a6Q0pW3QN1WCz3P086MRxSXZORfBbm5TtwaEKCgc2k5XhTR3ki4kq5CZUttmWCl9NMkyEWv
 3ksuIP/b0cZbj9oDYHASKnDt3kmiJrvdiMFbjAi0sC8TSubBwm+Dwqmx3HMVX3lvRIfbS/UqE/8
 +ar4SDdetf/GDA2i8jtIUdOVvlo/hsAr/+OTSvDDf4tvCYyGY3uOL1tBCR7XQ8
X-Google-Smtp-Source: AGHT+IHsshaXgRj11EjUyz6982TUGHgwqP+iC2E1eLpemRHf7qqNML4/fbR46zSvYrSO4IJx2O+u3Q==
X-Received: by 2002:a05:6512:3c8b:b0:595:81e1:2d00 with SMTP id
 2adb3069b0e04-59a17d1c2d7mr10955673e87.0.1766968324849; 
 Sun, 28 Dec 2025 16:32:04 -0800 (PST)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com.
 [209.85.167.45]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a185ddc12sm8644442e87.37.2025.12.28.16.32.02
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Dec 2025 16:32:03 -0800 (PST)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5943d20f352so9301295e87.0
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 16:32:02 -0800 (PST)
X-Received: by 2002:a05:6512:31ce:b0:592:f27d:75d4 with SMTP id
 2adb3069b0e04-59a17df1dfcmr10201076e87.45.1766968321873; Sun, 28 Dec 2025
 16:32:01 -0800 (PST)
MIME-Version: 1.0
References: <20251228213710.2591716-1-james.hilliard1@gmail.com>
 <20251228213710.2591716-2-james.hilliard1@gmail.com>
In-Reply-To: <20251228213710.2591716-2-james.hilliard1@gmail.com>
Date: Sun, 28 Dec 2025 16:31:50 -0800
X-Gmail-Original-Message-ID: <CA+h8R2rJFvtnP4DD7qwGx0smh7sgkDeptMUibqhJgSUuUO3Lyw@mail.gmail.com>
X-Gm-Features: AQt7F2o6F-y2Pa_-1yR8r6tLyP3u3P7GpX62FDoY3uQeXqshk9tYTDVUzdPtaLY
Message-ID: <CA+h8R2rJFvtnP4DD7qwGx0smh7sgkDeptMUibqhJgSUuUO3Lyw@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1766968325; x=1767573125; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WDM9Tmu4NJkhpYlNSY5O1Sj+4biYAK2aSc8QC1uSU78=;
 b=cYDv44HsHN/BhcLg62o2kojzhqGMMbHiFzGKJslnfZtT7rFr3aGyu1Os+bUuwVUEuV
 qhTr6hzrU60THlPBnAtf5tc6WmXoH7DircJmCZ67z0J28dFserLgRDrL4pWSFYYwdm2A
 swz682YAy9aQoR1DhUd0/rR5Cueq/axievM9+Hh4H9GQnAfY+/3izSn0oee5uP7STUcl
 4uh0F2r5vmY70TC+UTSr8LfRNirnJ9sqhQS6sCK2PWVsjU4WPL0ySKRp5/ZClbjzgYRp
 OFBWZ5T3nV5KkreQTvOU00DLAKksqo7CO18Ocpft5GI7tIniEZpFZOAP11kplFKJbIq7
 ex6g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=cYDv44Hs
Subject: Re: [Buildroot] [PATCH v6 2/3] package/pkg-golang.mk: make GOPROXY
 configurable
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgYWxsLAoKCk9uIFN1biwgRGVjIDI4LCAyMDI1IGF0IDE6MzfigK9QTSBKYW1lcyBIaWxsaWFy
ZAo8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBCUjJfR09QUk9YWSBub3cg
Y29uZmlndXJlcyB0aGUgR28gbW9kdWxlIHByb3h5IFVSTCB1c2VkIHRvIGRvd25sb2FkIEdvIG1v
ZHVsZXMKPiBzcGVjaWZpZWQgaW4gcHJvamVjdCBnby5tb2QgYW5kIGdvLnN1bSBmaWxlcy4gQnkg
ZGVmYXVsdCwgaXQgdXNlcyBHb29nbGUncwo+IG9mZmljaWFsIEdvIG1vZHVsZSBtaXJyb3IgYXQg
cHJveHkuZ29sYW5nLm9yZywgZmFsbGluZyBiYWNrIHRvIGRpcmVjdCBkb3dubG9hZHMKPiBpZiB0
aGUgbW9kdWxlIGlzIG5vdCBmb3VuZCBpbiB0aGUgbWlycm9yLgo+Cj4gVGhlIGRlZmF1bHQgdmFs
dWUgZnJvbSB0aGUgdG9vbGNoYWluIGNhbiBiZSByZWFkIHdpdGggImdvIGVudiBHT1BST1hZIgo+
Cj4gV2UgcmVseSBvbiBwYWNrYWdlIGRldmVsb3BlcnMgdG8gYXVkaXQgdGhlaXIgZGVwZW5kZW5j
aWVzIGluIGdvLm1vZCBhbmQgZ28uc3VtLgo+Cj4gVGhlIHZhbHVlIGNhbiBiZSBjb25maWd1cmVk
IHRvOgo+IC0gQSBjb21tYS1zZXBhcmF0ZWQgbGlzdCBvZiBwcm94eSBVUkxzCj4gLSAib2ZmIiB0
byBkaXNhYmxlIGFsbCBkb3dubG9hZHMKPiAtICJkaXJlY3QiIHRvIGRvd25sb2FkIGRpcmVjdGx5
IGZyb20gc291cmNlIHJlcG9zaXRvcmllcwo+Cj4gRm9yIG1vcmUgZGV0YWlscyBvbiBHbyBtb2R1
bGUgcHJveGllczoKPiBodHRwczovL2dvLmRldi9yZWYvbW9kI21vZHVsZS1wcm94eQo+Cj4gRGlz
Y3Vzc2lvbjoKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvQ0FEdlRqNHBYTzJyd0o4b0N6
ekdOWStPeEx1bzN1Sm5EVDJQQXhieXF1dzBMNmRoZmlBQG1haWwuZ21haWwuY29tL1QvI3QKPgo+
IFNpZ25lZC1vZmYtYnk6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29t
Pgo+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBTdGV3YXJ0IDxjaHJpc3RpYW5AYXBlcnR1cmUu
dXM+Cj4gLS0tCj4gdjEgLT4gdjI6Cj4KPiAgLSBhZGRlZCBtb3JlIGNvbnRleHQgYW5kIGxpbmtz
Cj4gIC0gcmVuYW1lZCB0byBHT1BST1hZIGluc3RlYWQgb2YgR09QUk9YWV9MSVNUCj4gIC0gbW92
ZWQgaW50byB0aGUgIUJSMl9QUklNQVJZX1NJVEVfT05MWSBzZWN0aW9uCj4KPiB2MiAtPiB2MzoK
PiAgLSBzcGxpdCBvdXQgR09QUk9YWSBkZWZhdWx0IGNoYW5nZQo+Cj4gU2lnbmVkLW9mZi1ieTog
Q2hyaXN0aWFuIFN0ZXdhcnQgPGNocmlzdGlhbkBhcGVydHVyZS51cz4KPiAtLS0KPiAgQ29uZmln
LmluICAgICAgICAgICAgIHwgMTYgKysrKysrKysrKysrKysrKwo+ICBwYWNrYWdlL3BrZy1nb2xh
bmcubWsgfCAgMiArLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9Db25maWcuaW4gYi9Db25maWcuaW4KPiBpbmRleCBk
NzMwZjIwMzRiLi4yMzcxN2YzZjk3IDEwMDY0NAo+IC0tLSBhL0NvbmZpZy5pbgo+ICsrKyBiL0Nv
bmZpZy5pbgo+IEBAIC0zMzUsNiArMzM1LDIyIEBAIGNvbmZpZyBCUjJfTFVBUk9DS1NfTUlSUk9S
Cj4KPiAgICAgICAgICAgU2VlIGh0dHA6Ly9sdWFyb2Nrcy5vcmcKPgo+ICtjb25maWcgQlIyX0dP
UFJPWFkKPiArICAgICAgIHN0cmluZyAiR28gbW9kdWxlIHByb3h5Igo+ICsgICAgICAgZGVmYXVs
dCAiaHR0cHM6Ly9wcm94eS5nb2xhbmcub3JnLGRpcmVjdCIKPiArICAgICAgIGRlcGVuZHMgb24g
QlIyX1BBQ0tBR0VfSE9TVF9HT19UQVJHRVRfQVJDSF9TVVBQT1JUUwo+ICsgICAgICAgaGVscAo+
ICsgICAgICAgICBUaGUgR28gbW9kdWxlIHByb3h5IFVSTCB1c2VkIHRvIGRvd25sb2FkIEdvIG1v
ZHVsZXMuIEJ5Cj4gKyAgICAgICAgIGRlZmF1bHQsIGl0IHVzZXMgdGhlIG9mZmljaWFsIEdvIG1v
ZHVsZSBtaXJyb3IsIGZhbGxpbmcgYmFjawo+ICsgICAgICAgICB0byBkaXJlY3QgZG93bmxvYWRz
IGlmIHRoZSBtb2R1bGUgaXMgbm90IGZvdW5kIGluIHRoZSBtaXJyb3IuCj4gKwo+ICsgICAgICAg
ICBUaGUgdmFsdWUgY2FuIGJlIG9uZSBvZjoKPiArICAgICAgICAgICAtIENvbW1hLXNlcGFyYXRl
ZCBsaXN0IG9mIHByb3h5IFVSTHMKPiArICAgICAgICAgICAtICJvZmYiIHRvIGRpc2FibGUgYWxs
IGRvd25sb2Fkcwo+ICsgICAgICAgICAgIC0gImRpcmVjdCIgdG8gZG93bmxvYWQgZGlyZWN0bHkg
ZnJvbSBzb3VyY2UgcmVwb3NpdG9yaWVzCj4gKwo+ICsgICAgICAgICBTZWUgaHR0cHM6Ly9nby5k
ZXYvcmVmL21vZCNtb2R1bGUtcHJveHkKPiArCj4gIGNvbmZpZyBCUjJfQ1BBTl9NSVJST1IKPiAg
ICAgICAgIHN0cmluZyAiQ1BBTiBtaXJyb3IgKFBlcmwgcGFja2FnZXMpIgo+ICAgICAgICAgZGVm
YXVsdCAiaHR0cHM6Ly9jcGFuLm1ldGFjcGFuLm9yZyIKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9w
a2ctZ29sYW5nLm1rIGIvcGFja2FnZS9wa2ctZ29sYW5nLm1rCj4gaW5kZXggMjZkYTdiZTcxYi4u
M2UzODhjYjI1NyAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3BrZy1nb2xhbmcubWsKPiArKysgYi9w
YWNrYWdlL3BrZy1nb2xhbmcubWsKPiBAQCAtMTAxLDcgKzEwMSw3IEBAICQoMilfUE9TVF9QQVRD
SF9IT09LUyArPSAkKDIpX0dFTl9HT01PRAo+ICAkKDIpX0RPV05MT0FEX1BPU1RfUFJPQ0VTUyA9
IGdvCj4gICQoMilfRExfRU5WICs9IFwKPiAgICAgICAgICQkKEhPU1RfR09fQ09NTU9OX0VOVikg
XAo+IC0gICAgICAgR09QUk9YWT0iaHR0cHM6Ly9wcm94eS5nb2xhbmcub3JnLGRpcmVjdCIgXAo+
ICsgICAgICAgR09QUk9YWT0kJChjYWxsIHFzdHJpcCwkJChCUjJfR09QUk9YWSkpIFwKPiAgICAg
ICAgICQkKCQoMilfR09fRU5WKQo+Cj4gICMgSWYgYnVpbGRpbmcgaW4gYSBzdWIgZGlyZWN0b3J5
LCBkbyB0aGUgdmVuZG9yaW5nIGluIHRoZXJlCj4gLS0KPiAyLjQzLjAKPgoKVGhpcyBQUiBoYXMg
YmVlbiBoYW5naW5nIGZvciBhIHdoaWxlIC0gSSByZWNvbW1lbmQgbWVyZ2luZyBpdC4KClNpZ25l
ZC1vZmYtYnk6IENocmlzdGlhbiBTdGV3YXJ0IDxjaHJpc3RpYW5AYXBlcnR1cmUudXM+CgpCZXN0
IHJlZ2FyZHMsIGhhcHB5IGhvbGlkYXlzLCBoYXBweSBuZXcgeWVhciwgZXRjIDopCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
