Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E00C87FCA
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 17:17:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C670B40D4C;
	Sun, 10 Aug 2025 17:17:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UKQdLtRcehIy; Sun, 10 Aug 2025 17:17:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A9C640D77
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A9C640D77;
	Sun, 10 Aug 2025 17:17:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 117F531
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 17:17:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 03A384017B
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 17:17:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 95BKPpnj1CDm for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 17:17:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1A2F7400DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A2F7400DA
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1A2F7400DA
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 17:17:33 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-455b00339c8so22883205e9.3
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 10:17:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754846251; x=1755451051;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Jktm9pNNDttUfl4bqF3MWYm1buM6FiSZQQ7xrN13eIA=;
 b=N7JM3+69/Yd/n2gWWmuN9800zdyvDnzy6z437LuCDr4EobWv9Zy/h7fOzeku70oMtT
 ksBO4UMAtswe+pXuTgnS2Xcdtg4wgI13Hg9cvoQvuExgUWKbJcUGgiBLi89mZkb6xO5k
 Aj3z/uDXals6lW73Qo6KSWrRRZA3Uat4rLr61nW9SgcI9sGntSEqOqE3bvV8RANkK66d
 qcoeEfX3kYMD6imbPX8NB6qKR9ztBHMwwpXvd7NARgZ38fv8FczBAc2VjqNEc1ZHlo0+
 xBJZxIwu1fACwPjcOO/9ztjgUQAxnsPxIDheBMD0EgW+CmUwdGxV0C9wjrFfo/L3urrX
 w3pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXM8m2Ek73yFv3p0GevUyaeG8nHjU6o/gj6PXKeHxZz+i0jgJP9fa1CCq41Mwl8zRnilXxq1kDCCoY=@buildroot.org
X-Gm-Message-State: AOJu0YzlEhZv/aMl23bqgdvj5MGzx4XShAjtfotEyCgr0P79sCMkY0p6
 zMc/Ife7/1xE6PbdlTdM9A6X1REXH3w0dAn230B2IuDwZA3Dzpf6z4gFr7o7fmNg7qS0pYJ5qIy
 gSnfC
X-Gm-Gg: ASbGncuub8oWvzcIAMv9NWa7g6/NtQlb5A3lXbNejRaEQS+/ukgTXUXcMzuXLYVw+GD
 0rv6tAxI9D4ZrPhYc7Q/YFZkZdxJjUs1pqbIuFRKKaADQIW6cIFQHLDQZ7Mx54+DtgQHnucr3zj
 NNBOw00CKSRHQ0mxjodxpJl7sjiD7ldhrbkIZ0aJ3W6hCc3Kw9wMoQsFvqXX93UkUSS/XynNiE7
 mm65GKaw7RUAAvvuH0SdPFWlq9hSEBD/Q9Ur0RDKsmRlUMpufwiQUC4/jmAc71SCU0MnNPXGi6A
 7iFojqZ3YG97svtfGOt0Wauh3NVejiuDVS3RCQ7POQ7oA0Uu9w9iDmTIZVBTggkbplRVSzXdPah
 VZPLiF7/+HfEthYQMDzBOeyRJ6EbfKpOlcq1HF0eqnw9lvi67XIGoEizH7goRtMWuLlPXwxlsZ0
 hc4TqzqhNdY/9ohMfkRB/ZtCx8eJPyV/Ry/h8sAuG2gczFTCtUSdfe9V8IOnuK
X-Google-Smtp-Source: AGHT+IGZOngxFY4dJTsS+G/wV7ztgCXMYFGttXkIkyzs/xMC+Md/QUa2u3Ogx9mvLrSjL0J5Hxb/rw==
X-Received: by 2002:a05:600c:a09:b0:459:da89:b06 with SMTP id
 5b1f17b1804b1-459f4f97fe4mr92224405e9.16.1754846251017; 
 Sun, 10 Aug 2025 10:17:31 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c469319sm36967838f8f.54.2025.08.10.10.17.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Aug 2025 10:17:30 -0700 (PDT)
Message-ID: <cf4405a3-7bec-448f-a010-8e21eeac26b6@smile.fr>
Date: Sun, 10 Aug 2025 19:17:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Cc: Louis Aussedat <aussedat.louis@gmail.com>
References: <20250726232139.3052172-1-giulio.benetti@benettiengineering.com>
Content-Language: fr
In-Reply-To: <20250726232139.3052172-1-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1754846251; x=1755451051; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Jktm9pNNDttUfl4bqF3MWYm1buM6FiSZQQ7xrN13eIA=;
 b=azULGBLNxFA70Z3EV8EzCtrNze+/VvhKgkQ0155AGiE9TIMqgxSrKZkGB0OZQluy7I
 WpNtDuzS7+p7i+nS70Rt8YMaxncX0driE7DZRNbim2dj4lQ0Xtit7xwbLS3rYL3c7m4+
 IIY2Ze5fN14Am7d2qwTfOzuWXMFq0U2jh/FgQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=azULGBLN
Subject: Re: [Buildroot] [PATCH] package/rtl8189es: fix build failure due to
 missing Linux CONFIG_NET
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

SGVsbG8gR2l1bGlvLCBBbGwsCgpMZSAyNy8wNy8yMDI1IMOgIDAxOjIxLCBHaXVsaW8gQmVuZXR0
aSBhIMOpY3JpdMKgOgo+IFNpbmNlIG5vdCBldmVyeSBkZWZjb25maWcgcHJvdmlkZXMgaXQgbGV0
J3MgZW5hYmxlIENPTkZJR19ORVQgdGhhdCBpcwo+IHJlcXVpcmVkIHRvIGJ1aWxkIHJ0bDgxODll
cyBzdWNjZXNzZnVsbHkuCj4gCj4gRml4ZXM6Cj4gaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290
Lm9yZy9yZXN1bHRzLzgzNTk3M2Q1YjcxYmIwODVmNjJjNTMzODY3NzQ2ZmMzZDZiM2E4YzcKCkFw
cGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVy
aW5nLmNvbT4KPiAtLS0KPiAgcGFja2FnZS9ydGw4MTg5ZXMvcnRsODE4OWVzLm1rIHwgMSArCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L3J0bDgxODllcy9ydGw4MTg5ZXMubWsgYi9wYWNrYWdlL3J0bDgxODllcy9ydGw4MTg5ZXMubWsK
PiBpbmRleCBiNjBiMDhmZTM0Li45YTJjYTA5NjY4IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcnRs
ODE4OWVzL3J0bDgxODllcy5tawo+ICsrKyBiL3BhY2thZ2UvcnRsODE4OWVzL3J0bDgxODllcy5t
awo+IEBAIC0yMCw2ICsyMCw3IEBAIGVuZGlmCj4gIAo+ICBkZWZpbmUgUlRMODE4OUVTX0xJTlVY
X0NPTkZJR19GSVhVUFMKPiAgCSQoY2FsbCBLQ09ORklHX0VOQUJMRV9PUFQsQ09ORklHX05FVCkK
PiArCSQoY2FsbCBLQ09ORklHX0VOQUJMRV9PUFQsQ09ORklHX0lORVQpCj4gIAkkKGNhbGwgS0NP
TkZJR19FTkFCTEVfT1BULENPTkZJR19XSVJFTEVTUykKPiAgCSQoY2FsbCBLQ09ORklHX0VOQUJM
RV9PUFQsQ09ORklHX0NGRzgwMjExKQo+ICAJJChjYWxsIEtDT05GSUdfRU5BQkxFX09QVCxDT05G
SUdfTU1DKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
