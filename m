Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE1BC2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 18:36:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F086381E78;
	Tue,  9 Jul 2024 18:36:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qjowlVI-DSAu; Tue,  9 Jul 2024 18:36:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CCF181E79
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CCF181E79;
	Tue,  9 Jul 2024 18:36:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EB8BB1BF5E0
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 18:35:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E58356072C
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 18:35:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a8HYUTBzJaXS for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 18:35:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 722D460661
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 722D460661
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 722D460661
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 18:35:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5B6AC60006;
 Tue,  9 Jul 2024 18:35:54 +0000 (UTC)
Date: Tue, 9 Jul 2024 20:35:51 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Message-ID: <20240709203551.1e05568e@windsurf>
In-Reply-To: <f1ec17d8-b94a-4759-be4b-9eba46ae1b5a@gmx.de>
References: <20240704121352.1915154-1-fiona.klute@gmx.de>
 <20240704121352.1915154-4-fiona.klute@gmx.de>
 <20240708235639.7a9cc07c@windsurf>
 <1e0c66a5-b6d3-4117-aafb-68b4d00a5565@gmx.de>
 <20240709135538.4594978e@windsurf>
 <f1ec17d8-b94a-4759-be4b-9eba46ae1b5a@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720550154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=78tMNHNdEkKDAk/jCHOUED5p4p5JtPGHv0hnmbH2UlY=;
 b=GOg9q8yjd09vDE+NN8q8XAfF1zPBDCf/flDqSA0Q95/xG2g7WgK1LOzqDhaHD/O4TvJfMp
 Izrg+wCsy1gJGG2aK66IuefzPGutW1VzrpjDwEBpbEk5MQ4LsUl94jKr8lMZ/B+DmEZjmf
 TaBEIpgxhU1GCaWAqBvwLH9zCfXNVX7QbDhoJ3XcNjJl4P3ww5ZK/h90xOI575P3NGvgPd
 x01uTzUnANNQ968Lmi36NOl+F4JrZxbDNe9emww2+aUfs381UFp/Y9+NJA9IQjqDGCLWQX
 M9s9vffzxV7s1mSCWd74cmBf3C3LVrm5g3ezYfdmXrHZIIEzU5YnnoTz4Y5xKw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GOg9q8yj
Subject: Re: [Buildroot] [PATCH v2 3/4] package/fail2ban: bump version to
 1.1.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Fiona Klute via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 9 Jul 2024 18:25:02 +0200
Fiona Klute <fiona.klute@gmx.de> wrote:

> Thanks for the hint! That passes with the v3 of the patch series I sent
> earlier.
> 
> Is there a recommended way to run that with an out-of-tree build? I'm
> not seeing any option for that in utils/docker-run.

Hm, I'm not sure to see the problem with using docker-run and
out-of-tree build.

$ mkdir /tmp/foo
$ cd /tmp/foo
$ ~/buildroot/utils/docker-run make -C ~/buildroot O=$(pwd) qemu_arm_vexpress_defconfig
$ ~/buildroot/utils/docker-run make

and that's it?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
