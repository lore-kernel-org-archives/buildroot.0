Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C1BC433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Dec 2021 22:10:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 13656409AC;
	Mon, 20 Dec 2021 22:10:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ThzYS7ph8teq; Mon, 20 Dec 2021 22:10:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29F61409A8;
	Mon, 20 Dec 2021 22:10:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 024881BF34B
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F347360BC7
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:10:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linatsea.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hhxf8RRxJOBa for <buildroot@lists.busybox.net>;
 Mon, 20 Dec 2021 22:10:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0077960ACE
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 22:10:50 +0000 (UTC)
Received: (Authenticated sender: thierry.bultel@linatsea.fr)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 9319F60006;
 Mon, 20 Dec 2021 22:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linatsea.fr; s=gm1;
 t=1640038248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AQqz5SvA3CdikiqUnp+I22aIhcrtYOokdXdfP0+Gg/k=;
 b=BlDnCdcBMnFrQEBUwaVIO1mr+yN7zDKLqrje8vfakYbM1Cvk1FSI4N5YxuuQhzcb6QMjIH
 dXX67kIdQm3IGuZP+RmJt7JMfcCG6sCuLsn0Mu++4SiNDXU/D47A7JSln2smuxTWO+8Fbl
 yLUlAuYTk92O1r91waA5LEhNYdDaLFd1/3luLZMAteRW1vFPuC0egPQ48RIcn95T/E+vh/
 mwzDc93G51Yu5c7NoCHIDsO2ktWX4McUCzFryRDec12atQF7dVwNHZD/cUAEznt79iJ6Ma
 o/RFkHT7SiCG2e44VE32lZbFglSJb60T8rIXJjS1YdVjx/AmdQ3LggVOttrmOg==
To: Arnout Vandecappelle <arnout@mind.be>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20211215180021.274991-1-thierry.bultel@linatsea.fr>
 <20211215180021.274991-3-thierry.bultel@linatsea.fr>
 <966fe55d-c5d7-7f5a-63ec-f68be64a38c6@mind.be>
 <f5028ffa-5461-ae87-ad4c-227605361ddf@linatsea.fr>
 <28def8c0-8d05-015e-e9b2-a25b31d9237b@mind.be>
 <7aa7dc74-284a-3c33-defa-aef4d6e11799@linatsea.fr>
 <20211219082325.GB2603@scaer> <3216f6d8-0388-0291-839c-bade251a1e20@mind.be>
From: Thierry Bultel <thierry.bultel@linatsea.fr>
Message-ID: <962e54e8-948e-d456-5b6f-e314b9f60391@linatsea.fr>
Date: Mon, 20 Dec 2021 23:10:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <3216f6d8-0388-0291-839c-bade251a1e20@mind.be>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH 3/3] fs/dracut: new fs type
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Cj4+IFNvLCBJIHRoaW5rIGZvciBub3cgaXQgd291bGQgYmUgb3Zlci1lbmdpbmVlcmluZyB0byB0
cnkgYW5kIGNhdHRlciBmb3IKPj4gdGhlIFNESzsgdGhpcyBjYW4gYmUgYWN0ZWQgdXBvbiBsYXRl
ci4uLgo+Cj4gwqAuLi4gdGhpcyBpcyB2ZXJ5IHRydWUuIFNvIGZvciB0aGUgdGltZSBiZWluZywg
bGV0J3Mgbm90IHdvcnJ5IGFib3V0IAo+IHN1Y2ggYSB3cmFwcGVyIHNjcmlwdCwgYW5kIGluc3Rl
YWQgZm9jdXMgb24gZnMvZHJhY3V0Lgo+Cj4gwqBSZWdhcmRzLAo+IMKgQXJub3V0CkFybm91bHQs
CkkgaGF2ZSBhZGRlZCB0aGUgd3JhcHBlciB0byBteSBsYXRlc3QgcGF0Y2ggc2VyaWVzLCBkbyB5
b3Ugd2FudCBpdCB0byBiZSAKcmVtb3ZlZCA/CgpSZWdhcmRzLApUaGllcnJ5Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
