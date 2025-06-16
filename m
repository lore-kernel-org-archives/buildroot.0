Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D11FC71136
	for <buildroot@archiver.kernel.org>; Mon, 16 Jun 2025 10:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5604180ACB;
	Mon, 16 Jun 2025 10:10:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yBFQHm4C-U7f; Mon, 16 Jun 2025 10:10:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C2BB80AD4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C2BB80AD4;
	Mon, 16 Jun 2025 10:10:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9836B274
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 10:10:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E35740499
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 10:10:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id snZyjBg4HEKZ for <buildroot@buildroot.org>;
 Mon, 16 Jun 2025 10:10:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7DFC24048F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DFC24048F
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7DFC24048F
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 10:10:43 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-adb2e9fd208so870829766b.3
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 03:10:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750068641; x=1750673441;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PaoARBTs8HTlfbVObW0IZBY8eXyJFWF+3ldkNLBzfTk=;
 b=Wy7z4JcwcHjq4Sv2a6AAVX9iuSIUTzleXYa0lEMjby/5Ac6vW6cj3mklsgBPCnnJui
 tr62xoML1fIQNIOkclsXKzB/3R1TtM4GHVVfcozFviAHL3X0Zgwag/zeTqk7xrAJG5RI
 Vqg5Ft0HbdEYd2uUfiEdDWrf85RB7LXCLGKARGhtWQK2mYz0el31q/ykinbOkD+x6YaA
 2cU4S605qSu4TiNFkPFXgppiwW18qS5ummVmU8DJduIuFfGMcMXef5yWDEVsBHJKwxyH
 R6bx4qAcfAWXJeMW0di57HAWgsUlZk4Mk/DjvnxcQNVJHMi6+Sg2NIL4MW5/MxxZaX3e
 ysmw==
X-Gm-Message-State: AOJu0Yy4f3Vj2CBRIHuKHCfWVmXX+qIIBnGRgLCu04YxIVwxrB4NUAqX
 wEAcUtFh50+q5sVzkcJpXjvfrfFz5az4N7CsDxfZl1jqcK1apzP6jJbe6PTLVWXihbpW1R1jfdp
 /h0td
X-Gm-Gg: ASbGncvasVOztFgYUCfYFaY4Q+PnRZxV/E7KR1yNIDNEXzKJ0jgBNuTinML7Li7bKLJ
 EE6XaBNMo0LOwtc+AMP5NAX37jluxoJbFhR+muJqOEM7s8VofLvxO6HGNunbKs3FxQAhrCwO/VV
 H3AimoN5yP3XnRbJ+30tMp8eqxJ/wAGgTOMYIqTrvIFfZnEF7ZAtaiVLaXaKh5vbBp6kqZn41WP
 1hb2XvjpVgGANhYjL2ebSnBqbiVWTcBUrK+cq15pQPbnhiAWaZv7EEOEE+3mHH1eT4bsrUWCb2N
 NfDnBdEv7oX+ZMuYwc/PVdO4DA4ftHMmBSgH5DTyjiCtazmMBuWVugzIvFTOf4k=
X-Google-Smtp-Source: AGHT+IFqG9w7pu3hAeBLSWSemj7iRNiUgxVMDs7VeUgmkJ4K/nVB7983dPNX9/RmJ0WUxHuF3Sp6OQ==
X-Received: by 2002:a17:907:961f:b0:ad5:6928:1492 with SMTP id
 a640c23a62f3a-adfad5991bbmr736373066b.45.1750068641094; 
 Mon, 16 Jun 2025 03:10:41 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-adfb891c4eesm392923066b.85.2025.06.16.03.10.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jun 2025 03:10:40 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id B04135F814;
 Mon, 16 Jun 2025 11:10:39 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Titouan Christophe via buildroot <buildroot@buildroot.org>
Cc: Titouan Christophe <titouan.christophe@mind.be>
In-Reply-To: <20250508142356.91867-1-titouan.christophe@mind.be> (Titouan
 Christophe via buildroot's message of "Thu, 8 May 2025 16:23:56
 +0200")
References: <20250508142356.91867-1-titouan.christophe@mind.be>
User-Agent: mu4e 1.12.11; emacs 30.1
Date: Mon, 16 Jun 2025 11:10:39 +0100
Message-ID: <87cyb4vvxc.fsf@draig.linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750068641; x=1750673441; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PaoARBTs8HTlfbVObW0IZBY8eXyJFWF+3ldkNLBzfTk=;
 b=vFSKbRn2sBOJ/3CCh0anAymaT29sQGfI9fbq96Uj5GuzIVUhwFjUiMIdK9cImzDpHZ
 jVc240zHqnFrZaqD4hpOELXVktCfaFXcPoT8HpIWRG8LEaax6kmipSv+1Fp4h3U5A9nj
 Vo7EyFGWZHP137WBDcqbjQ8c+3Svp+5S6C0DinCBOTK1SpjKCtvvPQU+BUSyyyPBlL9n
 MuvMZoLTgi0YCvoGvwl/MH1372qfNMDIhIPeGwI50udKOifHYiCxa/7+VQcA4qMfN3I2
 OEyagK/7wvpAvLljRCvPz/h38804uNS+Jusm+EYM5EiS2GamVgMFHJoLf1Wy/PyXa+Tf
 Gosg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=vFSKbRn2
Subject: Re: [Buildroot] [PATCH] utils/test-pkg: add new option
 -T/--toolchain-name
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

VGl0b3VhbiBDaHJpc3RvcGhlIHZpYSBidWlsZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
PiB3cml0ZXM6Cgo+IFJlY2VudGx5IHdoZW4gdHJ5aW5nIHRvIHJlcHJvZHVjZSBhIGJ1aWxkIGVy
cm9yIHdpdGggdGVzdC1wa2cgb24gdGhlIHRvb2xjaGFpbgo+IGJyLWFybS1iYXNpYywgSSBoYWQg
dG8gY3JlYXRlIGEgbmV3IENTViBmaWxlIHdpdGggdGhhdCB0b29sY2hhaW4gb25seSB0byBiZQo+
IGFibGUgdG8gcnVuIHRoZSB0ZXN0IGluIHRoYXQgc2luZ2xlIGNhc2UuCj4KPiBJIGJlbGlldmUg
aGF2aW5nIGEgY29tbWFuZC1saW5lIG9wdGlvbiByaWdodCBhd2F5IGluIHRlc3QtcGtnIHdvdWxk
IG1ha2UgdGhpcwo+IG11Y2ggZWFzaWVyLCBhcyBJIGNhbiBub3cgcnVuOiBgLi91dGlscy90ZXN0
LXBrZyAtVCBici1hcm0tYmFzaWMgLXAgcmVkaXNgCj4KPiBTaWduZWQtb2ZmLWJ5OiBUaXRvdWFu
IENocmlzdG9waGUgPHRpdG91YW4uY2hyaXN0b3BoZUBtaW5kLmJlPgoKVGltZWx5IGFuZCBoZWxw
ZnVsIHBhdGNoOgoKUmV2aWV3ZWQtYnk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJv
Lm9yZz4KVGVzdGVkLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+Cgot
LSAKQWxleCBCZW5uw6llClZpcnR1YWxpc2F0aW9uIFRlY2ggTGVhZCBAIExpbmFybwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
