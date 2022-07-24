Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68FB1C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 13:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01143840FE;
	Sun, 24 Jul 2022 13:21:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01143840FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xqLQcOFTjLj6; Sun, 24 Jul 2022 13:21:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26F248405E;
	Sun, 24 Jul 2022 13:21:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26F248405E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D3CC81BF488
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 13:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC9308400D
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 13:21:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC9308400D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lf1jDNVNCg52 for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 13:21:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 467828333E
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 467828333E
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 13:21:54 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 w8-20020a05600c014800b003a32e89bc4eso4884880wmm.5
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 06:21:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=g/6SvRIJM+G/II3hxrKdHtskcJPKR8v0/5B8QrvX5tc=;
 b=a98V3PUSCDdET5ek8Wirlb8RMrtHjQQpEfY6DgZCYf+dAInPvtvGy93hfxPNukqmne
 RlK4Abc2FxQUvouZolDmEzouIa9OO7scxzhMULRMb5KV3NbLrrkqu7Cu/y8bovmiPomz
 pANdcZH5jHwqjImLh/u8whnqRRk2OU2q7B/nIxf35T1jem/WTgUbE1rW3u6o/FIaT8NT
 bLKY9PdOQovzna0SoRirWihbljT5TpiyQAxFPBykxQI3vNIox3y5A87qC0Uf5SXw7S0c
 6/UqxI1eGtuLSI6rp3tR4dgi5dm5zW5jP1fsJZ4ho6rzN5ONNngkPtPbQaYTjFFJGcow
 wl9Q==
X-Gm-Message-State: AJIora9nmTk+vPJ9MuFRqRFYvvohSi2Wptaftac8Pn6nvGwzNVBPJu6M
 Tkin0jhFvqJfBbURH3Ul+xabMQ==
X-Google-Smtp-Source: AGRyM1sZyk6fS6OCqAStS9VybsQNVYuKIq5QS6HykXb243nIlDm2dS+JEdQNRSCqcGq7rKJq+cP9cw==
X-Received: by 2002:a05:600c:3d93:b0:3a3:3a93:fb16 with SMTP id
 bi19-20020a05600c3d9300b003a33a93fb16mr9881247wmb.190.1658668912179; 
 Sun, 24 Jul 2022 06:21:52 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c358c00b0039c96b97359sm11600969wmq.37.2022.07.24.06.21.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 06:21:51 -0700 (PDT)
Message-ID: <80d8189d-4981-0481-6088-12a9eefd7702@smile.fr>
Date: Sun, 24 Jul 2022 15:21:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Peter Seiderer <ps.report@gmx.net>
References: <20210510195352.13205-1-ps.report@gmx.net>
 <20210806000750.0bc826da@windsurf>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20210806000750.0bc826da@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=g/6SvRIJM+G/II3hxrKdHtskcJPKR8v0/5B8QrvX5tc=;
 b=4J47YQGUh2zJGJ36ekGgJE58kMVhprWG6lY81iXI0IhJHTC/6JMHLLyNhokJqZZT3w
 8gDjvsorn2JrgphjNElMiMbWSG4k8ePqYx7dLNzYD8U5Kia6bA0OWe4cwoHorn2Sm++3
 pnFtiPbkI1RX+YK+mXWOMEX0MFb1Ufp3wGxEVTXc7vjUqqmGtOIbvfVSsWfjU5myX5Y9
 e+XqcFjrdkFP0pa3Mj2SFr9Adrr9SDhAS1YONlH/lrVKCtaYctWqhWOkHzyFhJC9yvb6
 zlSpNiyThhduH2g0Zpr+/D7SmKap6jP0ykcPmUh0kWZCkPlfqU9BM57wXVm1XKFQYBjW
 F1Zg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=4J47YQGU
Subject: Re: [Buildroot] [RFC v1] package/rpi-userland: add GLint64,
 GLuint64 and GLsync typedefs to GLES2/gl2ext.h
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
Cc: buildroot@buildroot.org, Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpMZSAwNi8wOC8yMDIxIMOgIDAwOjA3LCBUaG9tYXMgUGV0YXp6b25pIGEgw6ljcml0
wqA6Cj4gSGVsbG8sCj4gCj4gT24gTW9uLCAxMCBNYXkgMjAyMSAyMTo1Mzo1MiArMDIwMAo+IFBl
dGVyIFNlaWRlcmVyIDxwcy5yZXBvcnRAZ214Lm5ldD4gd3JvdGU6Cj4gCj4+ICsgaW50ZXJmYWNl
L2tocm9ub3MvaW5jbHVkZS9HTEVTMi9nbDJleHQuaCB8IDEzICsrKysrKysrKysrKysKPj4gKyAx
IGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQo+IAoKVGhpcyBpc3N1ZSBjYW4gc3RpbGwg
YmUgcmVwcm9kdWNlZCBmcm9tIEJ1aWxkcm9vdCBtYXN0ZXIgYnJhbmNoLgoKPiBBcmUgeW91IHN1
cmUgZ2wyZXh0LmggaXMgdGhlIHJpZ2h0IHBsYWNlIHRvIGFkZCB0aG9zZSB0eXBlZGVmcyA/IElu
IHRoZQo+IG1lc2EzZC1oZWFkZXJzIHBhY2thZ2UgKHdoaWNoIGtpbmQgb2YgaXMgb3VyIHJlZmVy
ZW5jZSBmb3IgT3BlbkdMCj4gS2hyb25vcyBoZWFkZXJzKSwgdGhlc2UgdHlwZWRlZnMgYXJlIGlu
IEdMRVMyL2dsMi5oLgo+IAo+IEFub3RoZXIgcXVlc3Rpb24gaXM6IHdoeSBpcyBHU3RyZWFtZXIg
ZGVmaW5pbmc6Cj4gCj4gIDM5ICNpZiAhR1NUX0dMX0hBVkVfR0xTWU5DCj4gIDQwIHR5cGVkZWYg
Z3BvaW50ZXIgR0xzeW5jOwo+ICA0MSAjZW5kaWYKPiAKPiBJc24ndCB0aGF0IGEgbWlzdGFrZSBm
cm9tIHRoZSBHU3RyZWFtZXIgY29kZSBiYXNlID8KPiAKPiBEaWQgeW91IHJlcG9ydCB0aGlzIGlz
c3VlIHRvIHJwaS11c2VybGFuZCB1cHN0cmVhbSB0byBzZWUgd2hhdCB0aGV5IHRoaW5rID8KCkto
cm9ub3MgaGVhZGVycyBhcmUgdGhlIHNhbWUgc2luY2UgMTAgeWVhcnM6CgpodHRwczovL2dpdGh1
Yi5jb20vcmFzcGJlcnJ5cGkvdXNlcmxhbmQvdHJlZS9tYXN0ZXIvaW50ZXJmYWNlL2tocm9ub3Mv
aW5jbHVkZS9HTEVTMgoKSW4gMjAxNCwgbWVzYTNkIHVwZGF0ZWQgS2hyb25vcyBoZWFkZXJzIHRv
IHJldmlzaW9uIDI0NjE0IHdoZXJlIEdMc3luYyBtb3ZlZApmcm9tIGdsMmV4dC5oIHRvIGdsMi5o
LgoKaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvbWVzYS8tL2NvbW1pdC8xMTdk
OGNlMjdiNzkyOWM0MmY0NmY4MThhYzAzODU4MDg3N2IzMDg2CgpodHRwczovL2dpdGxhYi5mcmVl
ZGVza3RvcC5vcmcvbWVzYS9tZXNhLy0vY29tbWl0L2Q1MTllYmIzNGNkMjFjZmMxMzk4N2YyMDM4
ZDdhMmVjMzUzYTVjZmQKCkkgZ3Vlc3MgaXQncyBub3Qgb25seSBhIEdMc3luYyBpc3N1ZSBidXQg
YSB0b28gb2xkIGtocm9ub3MgaGVhZGVycy4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiBC
ZXN0IHJlZ2FyZHMsCj4gCj4gVGhvbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
