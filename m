Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD6B2C433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:34:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C1DB610A0
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:34:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9C1DB610A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5508E403F9;
	Tue, 26 Oct 2021 19:34:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tHzp-1DplhPF; Tue, 26 Oct 2021 19:34:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8903A40130;
	Tue, 26 Oct 2021 19:34:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C55FF1BF3CD
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:34:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B44A54026B
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:34:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RSSW-5aFhHVA for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 19:34:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C68840209
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 19:34:38 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id y12so924971eda.4
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 12:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=wZfbE8QgOaShdkANoEF9iCC4vcmoKBPjGYuZ+Wveig4=;
 b=h9fxoQR5eUo0RJgist2ZzPZKQQuyvou51T6cjxKW05vA3wlyTVhFS9nHHnsnalBxL/
 cSR94E4oxeuyglr5lV3z0T+ScNmCygmqUO9XuHcRXCEf9EL8nLYkX5CGTvFIg9dD8CSl
 amK4oM0DudXME+40dHMeeS0ZAvQgXw1UAh6h/wVHcU1Dk+vhL8h7hDgG0I+xqlFrOxeb
 cLcr/tFEXNhsnnmn3vZ8CuFirJDhtDw2mGg+dp1FCboLunJ0r/GG+mwbFlYDZHfl1Ot4
 CIlntc5quhj+flHUOGXM0hdfz/BV3JESsF7Zv5qr9j6QasAZ6zfc3sdTINu7xDeu/1r7
 6ZWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=wZfbE8QgOaShdkANoEF9iCC4vcmoKBPjGYuZ+Wveig4=;
 b=545gJPSpRi4GF39va37AW6Qr7fmV/xmZ+l64kRC0mDPP/khjbb+zTtj/mdzO5OB0vc
 qQ7pVahJxSStLIWWyDayBm01/0cuWrBLswVX69yz73YzoeUUGGLRAxiPHgnONQU5gztm
 MZA5ZedwNdXADdyVTb1BaK02ytemPHJO0WL6Bcj0ViOsDcGAueF1C2fj7RonXb1U37UB
 FFsqGTOjTh3GCQusoV4GosnGySYuvyZGHy7xi2TLNfXhaad1JgJkYrTkJsYdJDjspXp2
 RIgbDYNpJ6mdsItZ1NN5TgYdONNuEghCqOYu4A0PRZH9BCB1FzZpcKvsHBpwx2n/cQFs
 Khig==
X-Gm-Message-State: AOAM530jShpAqGKo2CkvTdjVunmXCrbsw56wJoHfU6wLjcfvPHPuSLxH
 qQn+2R6BKjjPUmcRmwcbFZNHa9Fwi/eMTw==
X-Google-Smtp-Source: ABdhPJwii3tFTV8ITPTUlcd74/e5ihK7Fj+MRSq7xbiShWyXm1vzrZKBBRWtCP8LzYkjxYLYy+WafA==
X-Received: by 2002:a17:906:9b53:: with SMTP id
 ep19mr34032179ejc.66.1635276877286; 
 Tue, 26 Oct 2021 12:34:37 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id hp13sm7990678ejc.66.2021.10.26.12.34.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 12:34:36 -0700 (PDT)
Message-ID: <c81f3982-3a67-3d9e-fa06-8ea4baa5640c@mind.be>
Date: Tue, 26 Oct 2021 21:34:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 buildroot@buildroot.org
References: <20211024142838.1474013-1-raphael.melotte@mind.be>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211024142838.1474013-1-raphael.melotte@mind.be>
Subject: Re: [Buildroot] [PATCH 1/1] support: test_python_rsa: increase
 timeout
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyNC8xMC8yMDIxIDE2OjI4LCBSYXBoYcOrbCBNw6lsb3R0ZSB3cm90ZToKPiBPbiBzb21l
IGRldmVsb3BlcnMgbWFjaGluZXMsIHRoZSBkZWZhdWx0IHRpbWVvdXQgKDUgc2Vjb25kcykgaXMg
bm90Cj4gZW5vdWdoIGZvciB0aGUgdGVzdCB0byBzdWNjZWVkLgo+IAo+IEluY3JlYXNlIGl0IHRv
IDIwIHNlY29uZHMsIHRvIGxldCBtb3JlIHRpbWUgZm9yIHRoZSByc2Ega2V5cyB0byBiZQo+IGdl
bmVyYXRlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFwaGFlbC5t
ZWxvdHRlQG1pbmQuYmU+CgogIEFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgogIFJlZ2FyZHMs
CiAgQXJub3V0Cgo+IC0tLQo+ICAgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9w
eXRob25fcnNhLnB5IHwgMSArCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAK
PiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob25f
cnNhLnB5IGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob25fcnNhLnB5
Cj4gaW5kZXggZTYzZDYzZTFkZS4uNWRkZmI1MTMxNCAxMDA2NDQKPiAtLS0gYS9zdXBwb3J0L3Rl
c3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5dGhvbl9yc2EucHkKPiArKysgYi9zdXBwb3J0L3Rl
c3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5dGhvbl9yc2EucHkKPiBAQCAtOSwzICs5LDQgQEAg
Y2xhc3MgVGVzdFB5dGhvblB5M1JTQShUZXN0UHl0aG9uUGFja2FnZUJhc2UpOgo+ICAgICAgICAg
ICBCUjJfUEFDS0FHRV9QWVRIT05fUlNBPXkKPiAgICAgICAgICAgIiIiCj4gICAgICAgc2FtcGxl
X3NjcmlwdHMgPSBbInRlc3RzL3BhY2thZ2Uvc2FtcGxlX3B5dGhvbl9yc2EucHkiXQo+ICsgICAg
dGltZW91dCA9IDIwCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
