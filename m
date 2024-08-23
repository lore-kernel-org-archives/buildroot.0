Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20DCDC531DC
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 17:28:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E428A840DE;
	Fri, 23 Aug 2024 17:28:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7c20Mj3zaDIP; Fri, 23 Aug 2024 17:28:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A75D3840DB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A75D3840DB;
	Fri, 23 Aug 2024 17:28:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BF5791BF314
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 17:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD19F6083F
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 17:28:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ndk5Gdvvf9lX for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 17:28:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A80F860661
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A80F860661
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A80F860661
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 17:28:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AA69840004;
 Fri, 23 Aug 2024 17:27:57 +0000 (UTC)
Date: Fri, 23 Aug 2024 19:27:56 +0200
To: Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Message-ID: <20240823192756.255ab11f@windsurf>
In-Reply-To: <20240822130220.4135741-4-alex.bennee@linaro.org>
References: <20240822130220.4135741-1-alex.bennee@linaro.org>
 <20240822130220.4135741-4-alex.bennee@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724434077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q5d31ROSv+t8JLMDdNbkVrrE0/gvU5ERYD5aRhemHcY=;
 b=TQcNX19IFhxEsDAMQAWeXzBzSyjxFZR84nTOr5XKZa7PYE3QdZGlmG8S2/XpMu6IOCpunv
 naATJ5PVnebRsp9K1rGYcKniTPSAJyIb7dCsYD94i4C82UXBVJANapmClEVeuOM8myLnEQ
 fq/CX8UNxFgnlANqcsAgcBZYtEfC0X/bv9fDJ/f755s8ys+U2tCEMBHT4hfI4Kw8XTC3zE
 ZzvDaX9CmIUCz5LPXu2UGZxZ6ZQCjxboQL+d2r3o8KYNXpphL2mjgLP2soppxvOfBL6Q35
 St8u0O2+Z+6eXyfhT/cxbWp6xKglRf1YREE1dkjoNiPf6osusRRcIltSR7VVUw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TQcNX19I
Subject: Re: [Buildroot] [PATCH 3/4] board/qemu: add post-build script to
 aarch64_virt_defconfig
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQWxleCwKCk9uIFRodSwgMjIgQXVnIDIwMjQgMTQ6MDI6MTkgKzAxMDAKQWxleCBCZW5u
w6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPiB3cm90ZToKCj4gVGhpcyBpcyBpbiBhaWQgb2Yg
c3VwcG9ydGluZyBnZXR0eSBvbiBmYmNvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbGV4IEJlbm7D
qWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+CgpMaWtlIFlhbm4sIEkgYWxzbyBkb24ndCB0aGlu
ayB0aGlzIHJlYWxseSBiZWxvbmdzIHRvIHRoZQpxZW11X2FhcmNoNjRfdmlydF9kZWZjb25maWcu
IFdoeSB0aGlzIGRlZmNvbmZpZyBpbiBwYXJ0aWN1bGFyLCBhbmQgbm90CmFueSBvdGhlcj8KCklm
IHlvdSB3YW50IGEgImRlbW8iIG9mIHZrbWFyayBhbmQgdGhlIFZlbnVzIHZ1bGthbiBkcml2ZXIs
IGEgcnVudGltZQp0ZXN0IGluIHN1cHBvcnQvdGVzdGluZy8gaXMgbXVjaCBtb3JlIHJlbGV2YW50
LCBhcyBZYW5uIHN1Z2dlc3RlZC4KClRoYW5rcyEKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9u
aSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVu
Z2luZWVyaW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
