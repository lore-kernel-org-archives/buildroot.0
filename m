Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E26BD5C0F4
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 09:04:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D520760EE0;
	Tue, 16 Dec 2025 09:04:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DfSUywHgYRtd; Tue, 16 Dec 2025 09:04:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5745D60C29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765875850;
	bh=Gf2hGLxmdxQI2rNdWRybXevyw0lIKBYK6hRvJYDYT28=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iBzbnovOKZseuxOOcf20US475jnodelElvP9coJf9u0Mp3Ll5aYT4cMK7eLIW1ysh
	 ebIe3YLhBSiql6D5B6cIRwF469l+0dxLpCuCIQRXx7OIHr5+7p53BE9v3fgZLAUm2U
	 FtOxiV3UzD8kNhZIAMSrBmhrnvEkPPP9U+IeY8WsmcZF9j8V4BVNXExOD/2RqITce6
	 4jwyI0jjd86/XCDBQd1f7ARjOS9DgateVXlDOi+n25sdgL+z35YKPh3D9AoBkxuuZL
	 bWR8hzZTi9+FP3GXnvJh/uJ9TN8rImjvyJpcpZl35dYIN2bS6SnFhruTNEkxsv634o
	 A6Emk7ektuWDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5745D60C29;
	Tue, 16 Dec 2025 09:04:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F817370
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 09:04:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0185340248
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 09:04:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P5XsqmuEuvEk for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 09:04:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E2ADE40448
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2ADE40448
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E2ADE40448
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 09:04:07 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-37b99da107cso42524431fa.1
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 01:04:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765875845; x=1766480645;
 h=user-agent:mime-version:date:content-transfer-encoding:organization
 :references:in-reply-to:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3iyb8q2VNqbp6c2jrlGmurLhBM6bAYIdvWIsBzW3ig8=;
 b=DS0SFh0kVwAWgJuTxsAy5Q9RGVUy10CpK0X1z8qQDHyjm0XJWHR6Jxn4Yvo5J++/gv
 Ij1MXkmKTU+fF9/4gZd97dNpa8QpJCHF5dlzxvUirfgx9q3W4WeAIcxviIZ5nNkvQ1gC
 U/VBU/PsH97/ITPYAexZ87BPhm4bbDy1eWBdD3fXRuNUrO/ng8KC53W7amfqmtTiuB+D
 VJ2OPDEPLz62kN8CEryrMYU4fzT9xOmKXbbNJ0Wbw4qq0vrCUNizARDWV6295hXDfD28
 EGn1bhSCKO2vllCfMbH4v7HG5dKo0ciSx5julKFrgQhlYPxd/nK4V0N4tUZ4eW3x+LTK
 2Psw==
X-Gm-Message-State: AOJu0Yy0xBocngTXiLTVcOMzzt4hGXt5Hhcf8oCGiY2dCxhYDxv5s55q
 uW0V8tDBK9y5r2vuTtlccR4X3DqwHZtaAcOp3SzcSTPHn+18pkB58VE5jviGgQ==
X-Gm-Gg: AY/fxX7FSJD/t5NNyp5qW7bnKoOSkE9AmSFB44BkoIr8EVd+A1xlFD4EXEJfj4eBXD2
 LimDR7KmQgq5wF1GwK+XAADIsT0XnOjMPylipSyj/mdu3WFk7jZRxfMHwtXVAh150GhuVzxRKIL
 apfKzfkqLX52cNjtkX7MsQ1xjM5p5bwM1oyO6E9LXtNuoRbCij4C0JZ0BZ0LHwGVc83PAyGq3Nf
 QoSGE1k2rUT2vlYuvVa/wGjrOlbn6vC9u6HvLHD1vjET7bb9O0AKhoN8iHuJNF/jgGZVAV/jmAT
 CYKtuzZAwSS2GH2CYKTMhvIrAFZ9xgmmVYEn3Oogv350YaB3dFGsntATF/IMOb6szPfo50oShRL
 GyJBvfmIpWHdEemKpil/FlqN6CUohhwbw7F3pxlCGo60Drp8Jq6CtcSwblGUL3tj8aRCvx+2Hs9
 WR5momGYGAp8KTwwikcGIjVDfFMPp+PVCIz1kr8kLmKwADCdsi
X-Google-Smtp-Source: AGHT+IEuE4qPHJiA0XSleFII8/UeyeGoDhbeqtvzQ13luWQh6JOgodUmJ0AGPDgI2/pXoiQDy5vcbw==
X-Received: by 2002:a05:651c:1596:b0:37a:2dfa:c77e with SMTP id
 38308e7fff4ca-37fd088616emr40564761fa.24.1765875845199; 
 Tue, 16 Dec 2025 01:04:05 -0800 (PST)
Received: from [172.31.21.208] (h-79-136-22-50.NA.cust.bahnhof.se.
 [79.136.22.50]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37fdebe61e2sm37236941fa.7.2025.12.16.01.04.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Dec 2025 01:04:03 -0800 (PST)
Message-ID: <d262cfa36721ca631b4c5ff0cb875a8c8c295ab7.camel@gmail.com>
From: Joachim Wiberg <troglobit@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251216084256.1652f63f@windsurf>
References: <20251215223050.2231782-1-troglobit@gmail.com>
 <20251215223050.2231782-2-troglobit@gmail.com>
 <20251216084256.1652f63f@windsurf>
Organization: wires.se
Date: Tue, 16 Dec 2025 10:04:02 +0100
MIME-Version: 1.0
User-Agent: Evolution 3.52.3-0ubuntu1.1 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765875845; x=1766480645; darn=buildroot.org;
 h=user-agent:mime-version:date:content-transfer-encoding:organization
 :references:in-reply-to:cc:to:from:subject:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3iyb8q2VNqbp6c2jrlGmurLhBM6bAYIdvWIsBzW3ig8=;
 b=BKkQPapT8wawAp1rABHnApqco8Py+H1oEK05v3Ionx16SVUaG7yCJpPXc6x6CtHRSw
 AhPV2Lu2IdO9THUdj30Mgjd5Lrwc+7Tl5plPMWI5nxVI6ndyQaF73IevIrOFq36zUBmm
 Tlzn1HcKVHwFxvp1GgdtVNdjrst5sH6FObGu07Fa7c0cXdpKTtwjxEfp+ss6ZZjUr/Kk
 4vwGiTvwBctBU2S6VtzKotwG+e4maomJjlv/iHN0dtIAALCbK/gH/vt3tW+ZsAeL6ncp
 P2GN3h1K5ggm0i8Ftz+ISuQkb4nowxkXQQlhOIQq5m661Jo5d2K/rmxeKiEXJ7J8b7eE
 LwHA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BKkQPapT
Subject: Re: [Buildroot] [PATCH 2/2] package/libite: update deps,
 requires fork()
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

SGkgVGhvbWFzIQoKT24gVHVlLCAyMDI1LTEyLTE2IGF0IDA4OjQyICswMTAwLCBUaG9tYXMgUGV0
YXp6b25pIHdyb3RlOgo+IE9uIE1vbiwgMTUgRGVjIDIwMjUgSm9hY2hpbSBXaWJlcmcgPHRyb2ds
b2JpdEBnbWFpbC5jb20+IHdyb3RlOgo+ID4gVW5mb3J0dW5hdGVseSwgcGFydHMgb2YgdGhlIGxp
YnJhcnkgaXMgbm90IHZlcnkgbm8tTU1VIGZyaWVuZGx5IGF0bS4KPiA+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBib290bGluLWFybXY3bS11Y2xpYmMgWzMvNl06IEZBSUxF
RAo+IFRoYW5rcyBmb3IgdGhlIHBhdGNoLiBNeSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgdGhpcyBp
cyBhIGZpeCwKPiB1bnJlbGF0ZWQgdG8gdGhlIGJ1bXAgdG8gMi42LjIuIEluZGVlZCB0aGUgY3Vy
cmVudCB2ZXJzaW9uIDIuNi4xIGlzCj4gc2ltaWxhcmx5IGFmZmVjdGVkLgoKQ29ycmVjdCwgd2Fz
IHVuc3VyZSBpZiBJIHNob3VsZCBzZW5kIGl0IGFzIGEgc2VwYXJhdGUgcGF0Y2ggYWx0b2dldGhl
ci4KCj4gVGhlcmVmb3JlOgo+IC0gVGhpcyBwYXRjaCBzaG91bGQgYmUgUEFUQ0ggMS8yIGluIHRo
ZSBzZXJpZXMsIGFzIGl0J3MgYSBmaXgsIG5lZWRlZAo+IMKgIHJlZ2FyZGxlc3Mgb2YgdGhlIGJ1
bXAKPiAtIFlvdSBzaG91bGQgaW5kaWNhdGUgc2luY2Ugd2hlbiB0aGlzIGlzc3VlIGV4aXN0cyBz
byB0aGF0IHdlIGNhbgo+IMKgIHVuZGVyc3RhbmQgd2hldGhlciB0aGlzIGZpeCBzaG91bGQgYmUg
YmFja3BvcnRlZCB0byBvdXIgTFRTIGJyYW5jaCAKPiBvciBub3QKCkdvdCBpdCEgIEl0IGlzLCBz
byBJJ2xsIHNlbmQgYSB2MiB0byBmaXggdGhpcyBhbmQgY2xhcmlmeS4KCj4gLSBZb3Ugc2hvdWxk
IGFkZCBhIHJlZmVyZW5jZSB0byBhbiBhdXRvYnVpbGRlciBmYWlsdXJlIHRoYXQgdGhpcwo+IGNv
bW1pdCB3aWxsIGZpeCwgbGlrZSB0aGlzOgo+IMKgIEZpeGVzOgo+IGh0dHBzOi8vYXV0b2J1aWxk
LmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy82YzZmZDJhZTQxMGE4MmM0NGRhNTRlZTEzYTA5YTM4YTdh
YjIyMGMxLwoKQWhhLCBkaWRuJ3QgZXZlbiByZWFsaXplIHRoZXJlIHdlcmUgZmFpbHVyZXMgYWxy
ZWFkeSByZXBvcnRlZCBmb3IgdGhpcy4KSSBqdXN0IHN0dW1ibGVkIHVwb24gaXQgYmFzaWNhbGx5
IPCfmYIKCkJlc3QgcmVnYXJkcwogL0pvYWNoaW0KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
