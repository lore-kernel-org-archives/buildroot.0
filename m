Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF1ABC4345F
	for <buildroot@archiver.kernel.org>; Fri, 12 Apr 2024 20:54:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D62C40196;
	Fri, 12 Apr 2024 20:54:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EYLin515Ks9g; Fri, 12 Apr 2024 20:54:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70A9C405FB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 70A9C405FB;
	Fri, 12 Apr 2024 20:54:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 81FC91BF3BA
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 20:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6DB1A41794
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 20:54:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WijkwRxhsRFh for <buildroot@lists.busybox.net>;
 Fri, 12 Apr 2024 20:54:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7364541767
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7364541767
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7364541767
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 20:54:43 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-343d2b20c4bso873271f8f.2
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 13:54:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712955281; x=1713560081;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Flqkg/DN6IgW7pc5z3NOiQczBNb2XXo6/XgVgpYVKXM=;
 b=JucMTDr+NtVUJgm6q7VZbdBuN55VoZzk+FImVazZAUMGzmmKWSGIo/uzYgl2MYuTQd
 mdYKmqH2hO4DxxJE0uWBonoNDCV3zPYVLJ3p40xesg5jZAl013rQmnxB7EcxWXOO5YLH
 3utjq/y+AKg+CLlhmekPtzp1c69/mbftq13VduhXef9onGgo+s5B80uRLKvGo7O3tSqA
 8S06rHIPPP5e5CvbutwrCDyEKdkJrViMx963b28rWXD140ROoPLE70xEyNTUO2xNW9OK
 aWD71jYaWic+dTGX7wmrLv5acF+l2l52D9fUKTdKHXaq7LP2FFhDCMEIpE/WAzoESkzK
 YiVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6NJYaQWXEXBoEoOpaZI/RtCdL/u4/VZ3d0Kc7JeWOK5K/ffNlpAfkLIA+M/xP90ybQxx+TSJcp20nuN6E26sDB7xsPVWEXw==
X-Gm-Message-State: AOJu0YysZ5T96wtzhgggsEKLDJ/3JbiP39Kzf+uVkcuBdXvhGpG3nWFS
 I/LoqHgpEuhGzCB4ahUUAsIM1IZ4jUjYF4JvWr1Ld2Sqkmgu+cN6wnre0OOwg04=
X-Google-Smtp-Source: AGHT+IGVsN7KFkp6uv9GT3lFF/Ykafc42EwE2qHhnAz8+D2T211JIMihWDzf6dJ/J0y26Rv3FwX/Mw==
X-Received: by 2002:a5d:4e0c:0:b0:346:f906:f6c1 with SMTP id
 p12-20020a5d4e0c000000b00346f906f6c1mr2359200wrt.0.1712955280972; 
 Fri, 12 Apr 2024 13:54:40 -0700 (PDT)
Received: from [192.168.1.45] (lfbn-nan-1-335-137.w82-120.abo.wanadoo.fr.
 [82.120.169.137]) by smtp.gmail.com with ESMTPSA id
 l26-20020adfa39a000000b00343e825d679sm5047845wrb.87.2024.04.12.13.54.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Apr 2024 13:54:40 -0700 (PDT)
Message-ID: <f3d41702-e1e6-464f-b282-c8f0309b566d@smile.fr>
Date: Fri, 12 Apr 2024 22:54:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Heiko Thiery <heiko.thiery@gmail.com>
References: <20240412055358.1354293-1-heiko.thiery@gmail.com>
 <ZhlWuOI9ZJzGMh6i@landeda> <ZhlYatOD6uL7X6Hr@landeda>
Content-Language: en-US
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <ZhlYatOD6uL7X6Hr@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712955281; x=1713560081;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Flqkg/DN6IgW7pc5z3NOiQczBNb2XXo6/XgVgpYVKXM=;
 b=VYahjmhgREi8WtBZIqElW34KC/yPTvgvExjvlkGoiBKx012gClDcR7H2vnsWLHuuTe
 mvYlqz8evIDQkM3zz1xRXVti5ZN9rDkQQBv4ERbXPHAeLuQ5aHHnav+kedC5pHRr6bTG
 A97BZZc/LcR8mpxxGcf/GNuRG/jnh1UaISrdR5aPr8PM47tHTiv7W11Bm8U9DEovynV/
 nMh4C4pVolr3hweSpa7Zuuao5TK/KIebJ44BFMf8ewtsLwd59/FCap2n3ABRmnLi4aAU
 vE3SwZxaG4VThjh2/UtzOsM6BMULRM0lUot4QwgzBGsdR2vS5rYNkxu9esHK/jCd1BIm
 2/NQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=VYahjmhg
Subject: Re: [Buildroot] [PATCH v3 1/3] package/python-yamllint: new package
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
Cc: Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSGVpa28sIFlhbm4sIEFsbCwKCkxlIDEyLzA0LzIwMjQgw6AgMTc6NTEsIFlhbm4gRS4g
TU9SSU4gYSDDqWNyaXTCoDoKPiBIZWlrbywgQWxsLAo+IAo+IE9uIDIwMjQtMDQtMTIgMTc6NDMg
KzAyMDAsIFlhbm4gRS4gTU9SSU4gc3Bha2UgdGh1c2x5Ogo+PiBIZWlrbywgQWxsLAo+Pgo+PiBP
biAyMDI0LTA0LTEyIDA3OjUzICswMjAwLCBIZWlrbyBUaGllcnkgc3Bha2UgdGh1c2x5Ogo+Pj4g
VGhpcyBob3N0IHBhY2thZ2UgaXMgbmVlZGVkIHNpbmNlIHUtYm9vdCAyMDI0LjA0IGZvciBidWls
ZGluZyB0aSBkZWZjb25maWdzLgo+Pj4KPj4+IFRoaXMgaXMgYW4gcmVxdWlyZW1lbnQgZm9yIHVz
aW5nIGJ1aWxkbWFuL2Jpbm1hbiBbMV0uCj4+Pgo+Pj4gWzFdIGh0dHBzOi8vc291cmNlLmRlbngu
ZGUvdS1ib290L3UtYm9vdC8tL2Jsb2IvdjIwMjQuMDQvdG9vbHMvYnVpbGRtYW4vcmVxdWlyZW1l
bnRzLnR4dD9yZWZfdHlwZT10YWdzI0wzCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogSGVpa28gVGhp
ZXJ5IDxoZWlrby50aGllcnlAZ21haWwuY29tPgo+Pj4gLS0tCj4+IFstLVNOSVAtLV0KPj4+IGRp
ZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi15YW1sbGludC9Db25maWcuaW4gYi9wYWNrYWdlL3B5
dGhvbi15YW1sbGludC9Db25maWcuaW4KPj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+PiBpbmRl
eCAwMDAwMDAwMDAwLi41YzA5NjJmMDlmCj4+PiAtLS0gL2Rldi9udWxsCj4+PiArKysgYi9wYWNr
YWdlL3B5dGhvbi15YW1sbGludC9Db25maWcuaW4KPj4+IEBAIC0wLDAgKzEsOCBAQAo+Pj4gK2Nv
bmZpZyBCUjJfUEFDS0FHRV9QWVRIT05fWUFNTExJTlQKPj4+ICsJYm9vbCAicHl0aG9uLXlhbWxs
aW50Igo+Pj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfUFlUSE9OX1BBVEhTUEVDICMgcnVudGltZQo+
Pgo+PiAgICAgJCAuL3V0aWxzL2RvY2tlci1ydW4gbWFrZSBjaGVjay1wYWNrYWdlCj4+ICAgICBw
YWNrYWdlL3B5dGhvbi15YW1sbGludC9Db25maWcuaW46MzogQlIyX1BBQ0tBR0VfUFlUSE9OX1BB
VEhTUEVDIHJlZmVyZW5jZWQgYnV0IG5vdCBkZWZpbmVkCj4+Cj4+IE9LLCBJJ2xsIGdvIGFuZCBh
cHBseSB0aGF0IG90aGVyIHBhdGNoIG9mIHlvdXJzIHRoYXQgaW50cm9kdWNlcyB0aGUKPj4gdGFy
Z2V0IHZhcmlhbnQgZm9yIHB5dGhvbi1wYXRoc3BlYywgYnV0IHdoaWNoIGlzIG5vdCBpbiB0aGlz
IHBhdGNoc2V0LgoKV2hhdCBpZiBweXRob24tcGF0aHNwZWMgaXMgbm90IGluc3RhbGxlZCBvbiB0
aGUgaG9zdD8KCm1ha2UgaG9zdC1weXRob24teWFtbGxpbnQKCi4vb3VwdXQvaG9zdC9iaW4vcHl0
aG9uIC4vc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uvc2FtcGxlX3B5dGhvbl95YW1sbGlu
dC5weQoKTW9kdWxlTm90Rm91bmRFcnJvcjogTm8gbW9kdWxlIG5hbWVkICdwYXRoc3BlYycKCldl
IG11c3QgYWRkIGhvc3QtcHl0aG9uLXBhdGhzcGVjIChhbmQgYWxsIG90aGVyIHJ1bnRpbWUgZGVw
ZW5kZW5jaWVzKSBpbiBidWlsZApkZXBlbmRlbmNpZXMgb2YgaG9zdC1weXRob24teWFtbGxpbnQK
CiAgIyBUaGlzIGlzIGEgcnVudGltZSBkZXBlbmRlbmN5LCBidXQgd2UgZG9uJ3QgaGF2ZSB0aGUg
Y29uY2VwdCBvZgogICMgcnVudGltZSBkZXBlbmRlbmNpZXMgZm9yIGhvc3QgcGFja2FnZXMuCiAg
SE9TVF9QWVRIT05fWUFNTExJTlRfREVQRU5ERU5DSUVTICs9IFwKICAgIGhvc3QtcHl0aG9uLXBh
dGhzcGVjIFwKICAgIGhvc3QtcHl0aG9uLXB5eWFtbAoKQWN0dWFsbHksIEknbSBub3Qgc3VyZSBp
ZiBldmVyeSBob3N0LXB5dGhvbiBwYWNrYWdlcyByZWFsbHkgZG8gdGhpcy4KCkJlc3QgcmVnYXJk
cywKUm9tYWluCgoKPiAKPiBBcHBsaWVkIHRvIG1hc3Rlciwgbm93LCB0aGFua3MuCj4gCj4gUmVn
YXJkcywKPiBZYW5uIEUuIE1PUklOLgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
