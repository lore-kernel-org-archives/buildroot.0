Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23857C433EF
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 21:00:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD89261156
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 21:00:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BD89261156
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C548404B7;
	Wed,  3 Nov 2021 21:00:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ESmRlzqWxbuJ; Wed,  3 Nov 2021 21:00:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 021BC404EF;
	Wed,  3 Nov 2021 21:00:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3A0801BF3D6
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 20:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 36971404EF
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 20:56:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VEVfyF_t5mvC for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 20:56:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 556B3403C3
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 20:56:57 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id y196so2985391wmc.3
 for <buildroot@buildroot.org>; Wed, 03 Nov 2021 13:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=eJgSQ2sABunyFXeR2n7rMQ4IktYlzEOC82XYumWP6Ww=;
 b=irPUoxSky2QPm9P8AjrkMxpSoEdvykrGuhRsPkBGp3SOEq0JFZyXolPG6Nxsf9Ccn9
 79mtLXtahRmCacTPJ42vmpaP+oMoHbuaypUqVCkxSawpW9FdTm6CUIhmQLQPNR197527
 0/4iIp8TABn+1Yc0J8D5krKgkv2dVeDFNkbpYdEWBgihMJndRrdR3ZXcvNbZlr5VV/xF
 8dvuNqSAJ1Cfb3CMHtlH34J0iXDd5ybgiaMkGKOjVaDOTxkbu4yLHVzpZxUCbW/UtRVt
 QvYaz0DQ68Cwl0OOBvkYOHIhBPNLe4n9f80auvGYcXbfzVc27iSSUnJV/7x81/dT+ZLQ
 a7LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eJgSQ2sABunyFXeR2n7rMQ4IktYlzEOC82XYumWP6Ww=;
 b=qwwbBc5/S2Qar+RvPsEd6iZ6FrcfSuN57Ic0zzUUhfq2p064oC1RpVosx7kcCvA2qu
 f7k9MukO4Y7vAQnpa0RS1MnLFqFY34hNo+amZhCF1gm1ezc6YfCDE+3OfdEEA9pAqJYZ
 tx9CJ/VURoukCQ86PT1hn6Fnz3ZFWF1QYjL+63qa6Msws1c2yFuG1EPsbPNU1g0uYlzy
 Lau6g6QJd7zSxSV7E4PbFNg6HTnsLRLCJPRpE0bUCAmRUqJadiFyVJ08LDtwTE36pkPV
 SZgpCdLtcEjqY2drikItZzfEmvIAfY+RbEh+NgqbHAuIO3TaYXUF2rbdb0WsaU66k5F9
 vxgQ==
X-Gm-Message-State: AOAM530VIHZsVQZeVUHxY14OvNHXWnL2Rak+WAfZ29+C67g5K99IvJpk
 ogclh/FxrFIjYxT5ZKjgX3lI5FoVJMc=
X-Google-Smtp-Source: ABdhPJzIV/uR4TIL9q4zeVi+WJk5a7WuxPMyyqvLaCOEKZqFlmAs6cLZLLQ08INwH2F3k69yg4YCQw==
X-Received: by 2002:a1c:7201:: with SMTP id n1mr18247624wmc.176.1635973015591; 
 Wed, 03 Nov 2021 13:56:55 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id u2sm2856004wrr.35.2021.11.03.13.56.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Nov 2021 13:56:54 -0700 (PDT)
Message-ID: <bb8d99ec-8544-388d-41bd-16a032ae9e46@gmail.com>
Date: Wed, 3 Nov 2021 21:56:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Joel Stanley <joel@jms.id.au>
References: <20211103045627.1281356-1-joel@jms.id.au>
 <20211103184432.77423564@windsurf>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20211103184432.77423564@windsurf>
Subject: Re: [Buildroot] [PATCH 0/2] configs: Update ppc machines to v5.15
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
Cc: Michael Ellerman <mpe@ellerman.id.au>,
 Gerome Burlats <gerome.burlats@smile.fr>,
 Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpMZSAwMy8xMS8yMDIxIMOgIDE4OjQ0LCBUaG9tYXMgUGV0YXp6b25pIGEgw6ljcml0
wqA6Cj4gT24gV2VkLCAgMyBOb3YgMjAyMSAxNToyNjoyNSArMTAzMAo+IEpvZWwgU3RhbmxleSA8
am9lbEBqbXMuaWQuYXU+IHdyb3RlOgo+IAo+PiAgIGJvYXJkOiBnM2JlaWdlOiBVcGRhdGUgdG8g
TGludXggNS4xNQo+PiAgIGNvbmZpZ3MvcHBjOiBNb3ZlIGFsbCBwb3dlcnBjIG1hY2hpbmVzIHRv
IDUuMTUKPiAKPiBCb3RoIGFwcGxpZWQsIHRoYW5rcyEKClRoaXMgc2VyaWVzIGNhbid0IHdvcmsg
d2l0aG91dCBhZGRpbmcga2VybmVsIDUuMTUgc3VwcG9ydCA6KQpodHRwOi8vcGF0Y2h3b3JrLm96
bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyMTExMDExODU0MjAuMjMzODYwMS0x
LW1pY2hhZWxAd2FsbGUuY2MvCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKPiAKPiBUaG9tYXMKPiAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
