Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A3F6C7EE29
	for <buildroot@archiver.kernel.org>; Thu, 25 May 2023 21:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0673342A1A;
	Thu, 25 May 2023 21:44:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0673342A1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N9x7ZwdOkJV4; Thu, 25 May 2023 21:44:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C4DD400DD;
	Thu, 25 May 2023 21:44:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C4DD400DD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5C0111BF360
 for <buildroot@lists.busybox.net>; Thu, 25 May 2023 21:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33C9E400DD
 for <buildroot@lists.busybox.net>; Thu, 25 May 2023 21:44:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33C9E400DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Wdz0UzDKibC for <buildroot@lists.busybox.net>;
 Thu, 25 May 2023 21:44:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20A2940017
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 20A2940017
 for <buildroot@buildroot.org>; Thu, 25 May 2023 21:44:45 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-309438004a6so1750472f8f.2
 for <buildroot@buildroot.org>; Thu, 25 May 2023 14:44:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685051083; x=1687643083;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=93WdXQMeFKfFlXxnUThrrVqIXXjak8SQvZa0nOF/mQQ=;
 b=CAvxao486gIYZDCWy2n/GDvXW11HCT/iiFmGMaikoljk1e686VjXpx7fyNMQ7Ld4mv
 tkZAt3ZWA2cvVGuQpctTOfLomT9vKT+SMDVCVklKzzFnV4dHilDaUQVUGfP3UdFFPVMd
 NcCCoQf3GmtGfS/FF0lMG2EysmN6CKLdExAAueynehDlNeWCvbyvGEpivqPgzFUEyc70
 iVSnFPrIkolz9gVNz8BpKL6yFoNjO5+4jommrPA573mvOnQ2firApe6Xn7rLIIrPRiBK
 OZOMAnevDf0bVNi1NrABRC7/KhGAZf+euZtEUcw60SKwV+cRcwjNUZJsm4ovOsyFjur0
 69gg==
X-Gm-Message-State: AC+VfDyxBRbD5/T0MWZ+RyI+zHCBx6kFOSM/iHk5ibPfxYYUH51PkccJ
 aKIIfGAN2buBDp2cIHGF0eopeA==
X-Google-Smtp-Source: ACHHUZ4ZEyympscKr0PGZsph8hos/r2uR31XErklo1ZfspLY1bnvetPIP2tdZUcMp1m9tbsYZz+Qjw==
X-Received: by 2002:adf:f80f:0:b0:30a:8fcb:ec24 with SMTP id
 s15-20020adff80f000000b0030a8fcbec24mr2740194wrp.1.1685051083192; 
 Thu, 25 May 2023 14:44:43 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 u18-20020adfed52000000b003079986fd71sm2940145wro.88.2023.05.25.14.44.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 May 2023 14:44:42 -0700 (PDT)
Message-ID: <e7edff90-429c-06fb-8127-263f62e53ede@smile.fr>
Date: Thu, 25 May 2023 23:44:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20230109042648.2342444-1-james.hilliard1@gmail.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20230109042648.2342444-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1685051083; x=1687643083;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=93WdXQMeFKfFlXxnUThrrVqIXXjak8SQvZa0nOF/mQQ=;
 b=x1v6rHdNVy7Jjmnen4uwAj1F4vCjJmvr32xmgpV9PRGLzMO+5iCjC1QcSoQCsYhs98
 6BMF48brGlhwL69wLFIqdWLYtqIHt0rLNjlv+KLWS+5bFhD9q2qCJd4TFEn82Yv4beyi
 FDkb3UJ4SLil0WOrPIcLi6wIv32adckKOHiinMbBN2YQlIrixUV9xqMihmeVBbrI/jPN
 i/XPBNyH1ZmvIfbiuwootS+8GIyCgZlquJKwOHQ2q7LHr+UX3Zya1GIV18R+8kq9aBPq
 d4nYo0+vD6ywo+4g5KBBwnNL/cqvzXKN2y8FrOgWkKH1iwTNTnqwkJpbHQZilRN9V5fR
 GlOw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=x1v6rHdN
Subject: Re: [Buildroot] [PATCH 1/1] package/python-ipython: bump to version
 8.8.0
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
Cc: Philippe Proulx <eeppeliteloop@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSmFtZXMsCgpMZSAwOS8wMS8yMDIzIMOgIDA1OjI2LCBKYW1lcyBIaWxsaWFyZCBhIMOp
Y3JpdMKgOgo+IFNpZ25lZC1vZmYtYnk6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFA
Z21haWwuY29tPgo+IC0tLQo+ICBwYWNrYWdlL3B5dGhvbi1pcHl0aG9uL3B5dGhvbi1pcHl0aG9u
Lmhhc2ggfCA0ICsrLS0KPiAgcGFja2FnZS9weXRob24taXB5dGhvbi9weXRob24taXB5dGhvbi5t
ayAgIHwgNCArKy0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1pcHl0aG9uL3B5dGhvbi1p
cHl0aG9uLmhhc2ggYi9wYWNrYWdlL3B5dGhvbi1pcHl0aG9uL3B5dGhvbi1pcHl0aG9uLmhhc2gK
PiBpbmRleCBhYWUzNGY2ZjliLi5mMTFhZDFlMThjIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcHl0
aG9uLWlweXRob24vcHl0aG9uLWlweXRob24uaGFzaAo+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLWlw
eXRob24vcHl0aG9uLWlweXRob24uaGFzaAo+IEBAIC0xLDYgKzEsNiBAQAo+ICAjIG1kNSwgc2hh
MjU2IGZyb20gaHR0cHM6Ly9weXBpLm9yZy9weXBpL2lweXRob24vanNvbgo+IC1tZDUgIDNhZGY5
ZmNhMzE3NTEyZTViMzUxNmE5YWMyNWIzNDQyICBpcHl0aG9uLTguNy4wLnRhci5nego+IC1zaGEy
NTYgIDg4Mjg5OWZlNzhkNTQxN2EwYWEwN2Y5OTVkYjI5OGZhMjhiNThmYWViYTIxMTJkMmUzYTRj
OTVmZTE0YmI3MzggIGlweXRob24tOC43LjAudGFyLmd6Cj4gK21kNSAgYTFlYTliNmU0M2M1NTY4
ZTUwMzE5NzRlYjNhNmFjYjAgIGlweXRob24tOC44LjAudGFyLmd6Cj4gK3NoYTI1NiAgZjNiZjJj
MDg1MDVhZDJjM2Y0ZWQ1YzQ2YWUwMzMxYTg1NDdkMzZiZjRiMjFhNDUxZThhZTgwYzA3OTFkYjk1
YiAgaXB5dGhvbi04LjguMC50YXIuZ3oKPiAgIyBMb2NhbGx5IGNvbXB1dGVkIHNoYTI1NiBjaGVj
a3N1bXMKPiAgc2hhMjU2ICAzNDFhZmNiZDcyOTg4N2I3MDQ2ZmU3Yjk4ZmM0ZjRlZGZmM2FlZDhk
MzhmMDZlZWZkOWIzMDY3MGYwNDNkZjE3ICBDT1BZSU5HLnJzdAo+ICBzaGEyNTYgIGUwZTM5MDc0
OGVkNDQwYWI4OTNjYTFmMTM1YTg4YTkyMGFhZjU0MDlkYmI5MGE1YjQyN2M3NWM1ZTUxMjY4ZmIg
IExJQ0VOU0UKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24taXB5dGhvbi9weXRob24taXB5
dGhvbi5tayBiL3BhY2thZ2UvcHl0aG9uLWlweXRob24vcHl0aG9uLWlweXRob24ubWsKPiBpbmRl
eCAxYWYxMDgxNzQxLi5mNWExMTRjMmYzIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLWlw
eXRob24vcHl0aG9uLWlweXRob24ubWsKPiArKysgYi9wYWNrYWdlL3B5dGhvbi1pcHl0aG9uL3B5
dGhvbi1pcHl0aG9uLm1rCj4gQEAgLTQsOSArNCw5IEBACj4gICMKPiAgIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMKPiAgCj4gLVBZVEhPTl9JUFlUSE9OX1ZFUlNJT04gPSA4LjcuMAo+ICtQWVRIT05f
SVBZVEhPTl9WRVJTSU9OID0gOC44LjAKClRoZSB0ZXN0IFRlc3RJUHl0aG9uUHkzIGZhaWwgWzFd
IHNpbmNlIGl0IHdhcyB1cGRhdGVkIHRvIDguNi4wIHJlbGVhc2UganVzdAphZnRlciAyMDIyLjEx
LgoKICBNb2R1bGVOb3RGb3VuZEVycm9yOiBObyBtb2R1bGUgbmFtZWQgJ3N0YWNrX2RhdGEnCgpJ
bmRlZWQgdGhlcmUgaXMgbm8gc3VjaCBweXRob24zLXN0YWNrLWRhdGEgaW4gQnVpbGRyb290LgpG
b3IgZXhhbXBsZSwgRmVkb3JhIHBhY2thZ2luZyBhZGRlZCBweXRob24zLXN0YWNrLWRhdGEgd2hp
bGUgdXBkYXRpbmcgdG8gaXB5dGhvbgo4LjAuMS4KCkNhbiB5b3UgaGF2ZSBhIGxvb2sgcGxlYXNl
PwoKWzFdIGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMv
NDMyMjgxOTA4OQpbMl0KaHR0cHM6Ly9zcmMuZmVkb3JhcHJvamVjdC5vcmcvcnBtcy9pcHl0aG9u
L2MvZjdjODVmYmYyNDFhOWRmY2YyODY4MmY4YzFmZmUxMWYyZDI2ZTAxYQoKQmVzdCByZWdhcmRz
LApSb21haW4KCgo+ICBQWVRIT05fSVBZVEhPTl9TT1VSQ0UgPSBpcHl0aG9uLSQoUFlUSE9OX0lQ
WVRIT05fVkVSU0lPTikudGFyLmd6Cj4gLVBZVEhPTl9JUFlUSE9OX1NJVEUgPSBodHRwczovL2Zp
bGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvODIvMmIvMDI2YWY0N2RhMDk5OTg0MDRmNTEw
NjRkMzI4ZjVmMWY2OGM3ODgyOTA4MmQyOTQ1YmU0ODkzNDNmZGU2Cj4gK1BZVEhPTl9JUFlUSE9O
X1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvZjUvMzkvODk2
NjRkOGMzZTRkZmIwYTczODYyY2JiZmY4ZWI0MDI4YTFlM2Q0MzA1ZGE4MGFiMGE0OTM4NDhlZDli
Cj4gIFBZVEhPTl9JUFlUSE9OX0xJQ0VOU0UgPSBCU0QtMy1DbGF1c2UKPiAgUFlUSE9OX0lQWVRI
T05fTElDRU5TRV9GSUxFUyA9IENPUFlJTkcucnN0IExJQ0VOU0UKPiAgUFlUSE9OX0lQWVRIT05f
Q1BFX0lEX1ZFTkRPUiA9IGlweXRob24KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
