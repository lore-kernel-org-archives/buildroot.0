Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6656CD5B840
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 22:17:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1842C402DD;
	Mon, 28 Oct 2024 22:17:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wHGxsjk8dc1I; Mon, 28 Oct 2024 22:17:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA7F340345
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA7F340345;
	Mon, 28 Oct 2024 22:17:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DD37AEE
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 22:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C88980DDD
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 22:17:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kZ9U_JYDYkvK for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 22:17:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::35; helo=mail-oa1-x35.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7CCD080B66
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CCD080B66
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7CCD080B66
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 22:17:31 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-288642376bcso2728622fac.1
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 15:17:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730153850; x=1730758650;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T3JyCIxtSF9tpFxSNbmW2R27d8aoXndIB5PUx2Hi8Ow=;
 b=hSMztTGGXMruyDCBa2LU0x0sKivlEn87W3FK9DXTohkH+yOnFZdCUbpqvZBpAJg55V
 k7zDW0H+FUkGfxSFCUzwaf0APLtTT9tQ+NPDmvVyAD10Trath4zlBHc2B/WUOhR8+eBB
 pIyLgNl0BVtkQxiAIg6DGTh0eeOyOiPcYcZw3LZKnNlYKJqw9mh8roOq20lqWJmUCcQS
 IP0cN6ALYkbMDjRAF/Sou62TXsfawrhPE1hpits+eBtEGDwQJAlxn/WvozcQLyZnZfY0
 aNkd9mydDXxO0t1m3C5vlLRQmWvMejGCkFd/5suoQafAs/kUkkOB+ZS911AWBVYrFTG6
 WIbA==
X-Gm-Message-State: AOJu0Ywv858AMp4X9UJO1y4yVaHOfbnfrLpYdLKfVmoAAGRtZ/40wwzV
 KCelw2ya/olq+09F3s02/zxedWOAj6nMspmhjnA4VZGWeSyRTW0/IUTO/tS8xy3/ssU3cial3Oq
 /
X-Google-Smtp-Source: AGHT+IG/a9nz8eu+DqWQmo6OFRhViThXaS5xM3BqMsAJdzUH3R8Q/7mPHJol/UhWEEqURCbeTvLYUg==
X-Received: by 2002:a05:6870:b50e:b0:25e:24a0:4c96 with SMTP id
 586e51a60fabf-29051b73021mr8522651fac.11.1730153850361; 
 Mon, 28 Oct 2024 15:17:30 -0700 (PDT)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com.
 [209.85.160.52]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-71861507132sm1803178a34.4.2024.10.28.15.17.30
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2024 15:17:30 -0700 (PDT)
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-27d0e994ae3so2112201fac.3
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 15:17:30 -0700 (PDT)
X-Received: by 2002:a05:6870:8288:b0:260:ebf7:d0e7 with SMTP id
 586e51a60fabf-29051b84703mr7372575fac.15.1730153849901; Mon, 28 Oct 2024
 15:17:29 -0700 (PDT)
MIME-Version: 1.0
References: <20241028162926.209397-1-james.hilliard1@gmail.com>
In-Reply-To: <20241028162926.209397-1-james.hilliard1@gmail.com>
Date: Mon, 28 Oct 2024 15:17:18 -0700
X-Gmail-Original-Message-ID: <CA+h8R2qsJMqrgdG2sMLQKqaJMVBajhwKsJy99==Fr9sHmA8Dgg@mail.gmail.com>
Message-ID: <CA+h8R2qsJMqrgdG2sMLQKqaJMVBajhwKsJy99==Fr9sHmA8Dgg@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Anisse Astier <anisse@astier.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1730153850; x=1730758650; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T3JyCIxtSF9tpFxSNbmW2R27d8aoXndIB5PUx2Hi8Ow=;
 b=Ljyj2idzC+f56oXsTl+lqdU1uX/3mIfGb3VXQFTuq4DFBHZ470lQrzDF+dQI0wcqLH
 vEd7FZ01APcFQvkgXGdi69OJG0PpSTJFiFTJFcvxn/OHdR0ZTJY3/k+UtYa233gUYrs9
 ZieMZ4glZTb3aJ0TALbXhSGljIglGha/hjl/wAhAOpQWGKlBX1DZShmHJnaMla2ABc0Y
 F0rnGlAyUG4xy9iDLOQU1qt5A2D0eaOf1IOiP4EX4kK0n6b4fMAoiV2zyQIVpTvbjQVn
 3ESMwzxCmleQp0YVb1wzUykW8dInkTq3XG3o+zv5YC8FMtwZSCZb/ziPPrfHolhbODPh
 RfPg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=Ljyj2idz
Subject: Re: [Buildroot] [PATCH v6 1/1] package/tailscale: new package
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

SGkgSmFtZXMsCgpPbiBNb24sIE9jdCAyOCwgMjAyNCBhdCA5OjI54oCvQU0gSmFtZXMgSGlsbGlh
cmQKPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gU2lnbmVkLW9mZi1ieTog
SmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Cj4gLS0tCj4gQ2hhbmdl
cyB2NSAtPiB2NjoKPiAgIC0gYnVtcCB0byB2ZXJzaW9uIDEuNzYuMQo+IENoYW5nZXMgdjQgLT4g
djU6Cj4gICAtIGJ1bXAgdG8gdmVyc2lvbiAxLjcyLjAKPiAgIC0gcmVtb3ZlIEdPUFJPWFkgb3Zl
cnJpZGUKPiBDaGFuZ2VzIHYzIC0+IHY0Ogo+ICAgLSByZXN0b3JlIEdPUFJPWFkgb3ZlcnJpZGUK
PiBDaGFuZ2VzIHYyIC0+IHYzOgo+ICAgLSBzZXQgcmVxdWlyZWQgQ09ORklHX1RVTiBrZXJuZWwg
Y29uZmlnIG9wdGlvbgo+IENoYW5nZXMgdjEgLT4gdjI6Cj4gICAtIGRvbid0IHNldCBHT1BST1hZ
Cj4gLS0tCj4gIERFVkVMT1BFUlMgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+ICBwYWNr
YWdlL0NvbmZpZy5pbiAgICAgICAgICAgICAgICB8ICAxICsKPiAgcGFja2FnZS90YWlsc2NhbGUv
Q29uZmlnLmluICAgICAgfCAgOCArKysrKysrKwo+ICBwYWNrYWdlL3RhaWxzY2FsZS90YWlsc2Nh
bGUuaGFzaCB8ICAzICsrKwo+ICBwYWNrYWdlL3RhaWxzY2FsZS90YWlsc2NhbGUubWsgICB8IDIy
ICsrKysrKysrKysrKysrKysrKysrKysKPiAgNSBmaWxlcyBjaGFuZ2VkLCAzNSBpbnNlcnRpb25z
KCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3RhaWxzY2FsZS9Db25maWcuaW4KPiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvdGFpbHNjYWxlL3RhaWxzY2FsZS5oYXNoCj4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3RhaWxzY2FsZS90YWlsc2NhbGUubWsKCkxvb2tzIGdy
ZWF0LCB0aGFua3MuCgpCZXN0IHJlZ2FyZHMsCkNocmlzdGlhbiBTdGV3YXJ0Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
