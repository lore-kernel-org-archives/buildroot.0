Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB2ACCA0ECD
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 15:24:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C9A261429;
	Mon, 11 Aug 2025 15:24:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LY_Kec1PAcBy; Mon, 11 Aug 2025 15:24:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A340161438
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A340161438;
	Mon, 11 Aug 2025 15:24:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B59ED1C5
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 15:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BC5882479
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 15:24:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 48LzFHVJLjkh for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 15:24:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5F05F82392
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F05F82392
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F05F82392
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 15:24:43 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-55b8a0f36fcso4809945e87.1
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 08:24:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754925880; x=1755530680;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M2EXB56fII40TUewsqTU43C5VLBZvHL6ATYDBSFS3AE=;
 b=rPQctsH7rAYp9WrUqXFNKcomInPJKs9mE8AFm7LwFcdT3rV/9Cx5aXc3sI37al3BGZ
 ybXAcbimzkMRY41m0AFVbhJjRMKGFxPPygSqTptrXFLJ8IFZK3exXWqteDxZfR/cjfm0
 LRdMjLxtKB6CDA1huTn8wUNuYDXhCoG4PXRsQVPkqqDdZ7rO3vh2HoiIibzRfcVhiFZ3
 2HyDozZA5yNAqP+IdPZflDcoD7rvtx7yQ+awvuOEGm9FpS3ERSGcLiJ2eugprMlZim7V
 /SaJbwvEnairvOBfGt5RhJHolKkMtqPIbiN8eBWfLGdPultU4CSgLPxrv1W9V69wXAka
 oI0Q==
X-Gm-Message-State: AOJu0YzcbP+SVHhWBdpL+7vnv7Z7yK9h5Wa8uoouZDMhKmZ7aFPrTG1Z
 8mVKaPusuS/4hs40AxrTSaeYO34SpjMlv17uF/exHLvR/fVuemIGPyFHesJ6tGcXTaUer2aeM5q
 EA6aQEbtyK0ayIGyL8YNgz9n6aFfCIcGb01PE
X-Gm-Gg: ASbGnctBjjVCkPCiqVgqJEKvY3icx/BDnTHqnuOA6pk3qf+1P6MspYUnoMiqA5pmbbP
 hPuMIQ1Sdr1kAtIR/mp+lzP4ZP3Y1fPi1GhK+ejTqNPdsW7O9bR23OdwMzPrVRgjon+1UmIJHFv
 PkTlsTRFqztBwfZhJ5UJYRavea9kQQUE0EwAH+UFkGk4z5qjUmTIub2Y6lBehjK7Qeb93Rs5VBi
 ojol7PN
X-Google-Smtp-Source: AGHT+IFQWYGUzNBtGL+bMiSMQqIrF7E0oYYQCcbQDRZzztPg2tD6yKhUAruE/lZCruL9FfKQzx/mAi1UKXXW0SoXsTY=
X-Received: by 2002:a05:6512:4021:b0:55b:8aff:9af3 with SMTP id
 2adb3069b0e04-55cd75b257dmr98885e87.7.1754925879693; Mon, 11 Aug 2025
 08:24:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250730145724.204468-1-yegorslists@googlemail.com>
In-Reply-To: <20250730145724.204468-1-yegorslists@googlemail.com>
Date: Mon, 11 Aug 2025 17:24:26 +0200
X-Gm-Features: Ac12FXzFYHd4qI8mZZZV8B9gLI6rvBr6Ptp5IbrNFrNFBjx8byiTT2XW6BZ3ljk
Message-ID: <CAGm1_ktDKcFJONe4iZ3kcyYwZGiuD503quwSOgNj=N=N5eVEPQ@mail.gmail.com>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1754925880; x=1755530680; darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M2EXB56fII40TUewsqTU43C5VLBZvHL6ATYDBSFS3AE=;
 b=QTUhrhqZl90cFCDa6Nw7CP23T/gZstDQrTd1+lBGTH2pl86vvDUGoeKQEXBzmYHjKf
 0UNvHATZzlbACvEpybMPkN/KWbHXFpysJBgVCnll4YG59KMBGZ3TPpaBOwYgiC9BEZgQ
 y7L8UgT7BeR6Qetd/LPw8ARgMb89XkxX8PiDiXILWIL4qiHyIOn6QDDoyaR9XuvLxnsO
 99ZAzn5VVQSsDPGv7jEpGWmCLuFEVEAQbRCF9H1CmBQDRVTu2W4w9FQBablI9yMk55c9
 x9VJNpA71Es5kBIuU0di7Gx4sKPUovfIkRTx4cXaEFPmQMlfa1a/K5wWXfLlgYc3fJCD
 9qlw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QTUhrhqZ
Subject: Re: [Buildroot] [PATCH] package/python-yarl: bump to version 1.20.1
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCBKdWwgMzAsIDIwMjUgYXQgNDo1N+KAr1BNIDx5ZWdvcnNsaXN0c0Bnb29nbGVtYWls
LmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBZZWdvciBZZWZyZW1vdiA8eWVnb3JzbGlzdHNAZ29vZ2xl
bWFpbC5jb20+Cj4KPiBGb3IgY2hhbmdlIGxvZywgc2VlOgo+Cj4gaHR0cHM6Ly9naXRodWIuY29t
L2Fpby1saWJzL3lhcmwvcmVsZWFzZXMvdGFnL3YxLjIxLjEKPgo+IFNpZ25lZC1vZmYtYnk6IFll
Z29yIFllZnJlbW92IDx5ZWdvcnNsaXN0c0Bnb29nbGVtYWlsLmNvbT4KPiAtLS0KPiAgcGFja2Fn
ZS9weXRob24teWFybC9weXRob24teWFybC5oYXNoIHwgNCArKy0tCj4gIHBhY2thZ2UvcHl0aG9u
LXlhcmwvcHl0aG9uLXlhcmwubWsgICB8IDQgKystLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhv
bi15YXJsL3B5dGhvbi15YXJsLmhhc2ggYi9wYWNrYWdlL3B5dGhvbi15YXJsL3B5dGhvbi15YXJs
Lmhhc2gKPiBpbmRleCBjYTJkNDJiZjU4Li40M2JhMzFmODFmIDEwMDY0NAo+IC0tLSBhL3BhY2th
Z2UvcHl0aG9uLXlhcmwvcHl0aG9uLXlhcmwuaGFzaAo+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLXlh
cmwvcHl0aG9uLXlhcmwuaGFzaAo+IEBAIC0xLDUgKzEsNSBAQAo+ICAjIG1kNSwgc2hhMjU2IGZy
b20gaHR0cHM6Ly9weXBpLm9yZy9weXBpL3lhcmwvanNvbgo+IC1tZDUgIDgwYjg5ZDJiMjhiZTcz
NDVhMzhmMDk5YjJmODM5ZDdkICB5YXJsLTEuMTguMy50YXIuZ3oKPiAtc2hhMjU2ICBhYzE4MDFj
NDVjYmY3N2I2Yzk5MjQyZWVmZjRmZmZiNWU0ZTczYTgwMGI1YzRhZDRmYzBiZTVkZWY2MzRkMmUx
ICB5YXJsLTEuMTguMy50YXIuZ3oKPiArbWQ1ICAyMzM1MmZiYzJiMTY1ODI1ZDRhMzM2ODJjOTE3
ODhiYyAgeWFybC0xLjIwLjEudGFyLmd6Cj4gK3NoYTI1NiAgZDAxN2E0OTk3ZWU1MGM5MWZkNTQ2
NmNlZjQxNjIzMWJiODIxNzdiOTNiMDI5OTA2Y2VmYzU0MmNlMTRjMzVhYyAgeWFybC0xLjIwLjEu
dGFyLmd6Cj4gICMgTG9jYWxseSBjb21wdXRlZCBzaGEyNTYgY2hlY2tzdW1zCj4gIHNoYTI1NiAg
Y2ZjNzc0OWI5NmY2M2JkMzFjM2M0MmI1YzQ3MWJmNzU2ODE0MDUzZTg0N2MxMGYzZWIwMDM0MTdi
YzUyM2QzMCAgTElDRU5TRQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi15YXJsL3B5dGhv
bi15YXJsLm1rIGIvcGFja2FnZS9weXRob24teWFybC9weXRob24teWFybC5tawo+IGluZGV4IDE2
MGRlYzhhMWIuLjRmMjUzOTRjOGIgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9weXRob24teWFybC9w
eXRob24teWFybC5tawo+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLXlhcmwvcHl0aG9uLXlhcmwubWsK
PiBAQCAtNCw5ICs0LDkgQEAKPiAgIwo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+Cj4gLVBZ
VEhPTl9ZQVJMX1ZFUlNJT04gPSAxLjE4LjMKPiArUFlUSE9OX1lBUkxfVkVSU0lPTiA9IDEuMjAu
MQo+ICBQWVRIT05fWUFSTF9TT1VSQ0UgPSB5YXJsLSQoUFlUSE9OX1lBUkxfVkVSU0lPTikudGFy
Lmd6Cj4gLVBZVEhPTl9ZQVJMX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcv
cGFja2FnZXMvYjcvOWQvNGI5NGE4ZTZkMmI1MWI1OTk1MTZhNWNiODhlNWJjOTliNGQ4ZDQ1ODNl
NDY4MDU3ZWFhMjlkNWYwOTE4Cj4gK1BZVEhPTl9ZQVJMX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5
dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvM2MvZmIvZWZhYTIzZmE0ZTQ1NTM3YjgyNzYyMGYwNGNm
OGYzY2Q2NThiNzY2NDIyMDUxNjJlMDcyNzAzYTViOTYzCj4gIFBZVEhPTl9ZQVJMX0xJQ0VOU0Ug
PSBBcGFjaGUtMi4wCj4gIFBZVEhPTl9ZQVJMX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCj4gIFBZ
VEhPTl9ZQVJMX1NFVFVQX1RZUEUgPSBzZXR1cHRvb2xzCj4gLS0KPiAyLjM0LjEKCkZ4ZXM6IGh0
dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy9lNjM2NWZkNGQzOGQyZjJiYzU0
YjU0ZTdlOWFiZDJhZTQ3ZGI1YjgzLwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
