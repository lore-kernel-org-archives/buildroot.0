Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 953B9C54E41
	for <buildroot@archiver.kernel.org>; Sat, 24 Feb 2024 10:31:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 483B2820AB;
	Sat, 24 Feb 2024 10:31:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3CRVDfzZiykD; Sat, 24 Feb 2024 10:31:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6606B820AE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6606B820AE;
	Sat, 24 Feb 2024 10:31:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 269081BF283
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 10:31:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F4AA4011A
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 10:31:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U3C34fx_W4tz for <buildroot@lists.busybox.net>;
 Sat, 24 Feb 2024 10:31:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EDC2940108
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDC2940108
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EDC2940108
 for <buildroot@buildroot.org>; Sat, 24 Feb 2024 10:31:55 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2d275e63590so13573271fa.2
 for <buildroot@buildroot.org>; Sat, 24 Feb 2024 02:31:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708770714; x=1709375514;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YCj/xPjEKLViRK2vFTU2Lo2huwGeylTb+2NBzjZh37g=;
 b=FSLwC9JsR6s9IOe3DKLj0L2aWFPTMPwdVe4opYP9jTRYyecVID5ilI3PKipBIrym35
 hthUzz4oghKkrNVNVe10QNE6gsuUfKKS7bXNvNpJHAsiywgHDEmZSPRaFFfAPRZkw4QU
 YwT3kVbjOvgB+nQYa54VtjqRoE1qY2HR18dxeo4jB3anCgjAFJICJhRQGrvAFRyXDOGs
 UehW/66UyIRtP9qS6tDdiq6jS8R9lAuvlBSGsW2PVBFeo0xC1W3+VxLN9RlSi3bsaCMx
 ojK+LOY1szru8EyoWA5Gx03GKby8IwOTi1SA7D6L0MeXdxNTk5xIrFa7Z1825Vwk7MPU
 NzPQ==
X-Gm-Message-State: AOJu0YyjRJnnDeNMhAdFTS9Ebcxgg1e/DrTWu254dEMDDLkB8EeY6JHs
 73nE4tc6z0L4/afCsty4FyagjftBgaG0h+Kc2IqeT+StQM4bjrGjMwQA4LdF+ePnLjCx5jZuHIJ
 VQ0wY/7DphBHaNDjaVbAw8ZA8CowGCtPbi875Og==
X-Google-Smtp-Source: AGHT+IFRZnZ0bgVpSdb2L1Oy/k2KjBxw+HUiNcPr6CsWTPZsEGejtIW2ExH5NfSYWT9UkFZmAP/WTEteaf5u+mtsY00=
X-Received: by 2002:a05:6512:1325:b0:512:f512:f850 with SMTP id
 x37-20020a056512132500b00512f512f850mr303757lfu.23.1708770713459; Sat, 24 Feb
 2024 02:31:53 -0800 (PST)
MIME-Version: 1.0
References: <20240222130716.1311432-1-fancp2007@gmail.com>
 <20240223131603.2313178-1-fancp2007@gmail.com>
 <197750aa-c25f-44d9-89ac-872053953422@benettiengineering.com>
In-Reply-To: <197750aa-c25f-44d9-89ac-872053953422@benettiengineering.com>
From: Scott Fan <fancp2007@gmail.com>
Date: Sat, 24 Feb 2024 18:31:41 +0800
Message-ID: <CAFkzVZakp7V77zob-AnBXFg3oRtDGnL=L81Gp+mNw8dbUHO4GQ@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708770714; x=1709375514; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YCj/xPjEKLViRK2vFTU2Lo2huwGeylTb+2NBzjZh37g=;
 b=DoOMpgTSCZFHpL+LeUpJ4ax2FVbxlYO+9f4jM10x7kPyfau/uRiP8M5R/aq8MiAttP
 /FpJQr2lJzB9jBujTvqjgAPO0AOFod0SId3jtNWnl+bzXH6/iYn1ZGw0ozAhdmhiH2N7
 2EUYUsdSeN/aSRlGBeoZhvafnHZRg9a+2aTJIMIb1qfbREzz9NAOKRbCPf4JxMH85PCA
 kPeUySnH4ASq9cdypMFkD91SR5QYVezjmZslXlv4QtSxcIxZysBXOUasmYabRqNP+GGL
 IKyO5bjUkXhhg2p3NXwx//YRMbHx7RJk+EwEE74XguYNtahO/VYwvelvL8nJ2I0NfAxv
 zUYw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DoOMpgTS
Subject: Re: [Buildroot] [PATCH v7]
 configs/friendlyarm_nanopi_neo2_defconfig: new board
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgR2l1bGlvLAoKVGhlIEJSMl9ST09URlNfREVWSUNFX0NSRUFUSU9OX0RZTkFNSUNfTURFViBp
cyBmb3IgdGhlIGV0aGVybmV0IHBvcnQKb24gdGhlIGJvYXJkLgpXaXRob3V0IHRoZSBjb25maWcs
IHRoZSBldGgwIGludGVyZmFjZSB3aWxsIGJlIG5vdCBhY2Nlc3NpYmxlLgpUaGUgYGlmY29uZmln
IGV0aDBgIGNvbW1hbmQgd2lsbCByZXBvcnQgZXJyb3I6IERldmljZSBub3QgZm91bmQKClNjb3R0
IEZhbgoKT24gU2F0LCBGZWIgMjQsIDIwMjQgYXQgMTI6MjTigK9BTSBHaXVsaW8gQmVuZXR0aQo8
Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4gd3JvdGU6Cj4KPiBIaSBTY290
dCwKPgo+IE9uIDIzLzAyLzI0IDE0OjE1LCBTY290dCBGYW4gd3JvdGU6Cj4KPiBbIFNOSVAgXQo+
Cj4gPiArCj4gPiArIyBTeXN0ZW0KPiA+ICtCUjJfVEFSR0VUX0dFTkVSSUNfSVNTVUU9IldlbGNv
bWUgdG8gRnJpZW5kbHlBUk0gTmFub1BpIE5FTzIiCj4gPiArQlIyX1JPT1RGU19ERVZJQ0VfQ1JF
QVRJT05fRFlOQU1JQ19NREVWPXkKPgo+IFdoYXQgZG8geW91IG5lZWQgTURFViBieSBkZWZhdWx0
IGZvcj8gSXMgdGhlcmUgc29tZSBwZXJpcGhlcmFsIHRoYXQKPiBuZWVkcyB0byBzaG93IHVwIGF1
dG9tYXRpY2FsbHkgb3RoZXJ3aXNlIHRoZSBiYXNpYyBmdW5jdGlvbmFsaXR5IGlzCj4gY29tcHJv
bWlzZWQ/Cj4KPiBCZXN0IHJlZ2FyZHMKPiAtLQo+IEdpdWxpbyBCZW5ldHRpCj4gQ0VPJkNUT0BC
ZW5ldHRpIEVuZ2luZWVyaW5nIHNhcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
