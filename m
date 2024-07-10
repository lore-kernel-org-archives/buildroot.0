Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB89C3DA41
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 19:58:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06FAC81E84;
	Wed, 10 Jul 2024 19:58:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gwv5ZPjaMkSK; Wed, 10 Jul 2024 19:58:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0647781E96
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0647781E96;
	Wed, 10 Jul 2024 19:58:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 23C801BF2A2
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 19:58:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 10E1060F12
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 19:58:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XEz-ZNMKtawq for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 19:58:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E080E605C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E080E605C9
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E080E605C9
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 19:58:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D5BE220007;
 Wed, 10 Jul 2024 19:58:04 +0000 (UTC)
Date: Wed, 10 Jul 2024 21:58:03 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Message-ID: <20240710215803.0c5339b2@windsurf>
In-Reply-To: <83847513-35ce-449d-a90c-ba18e80c892b@gmx.de>
References: <20240704121352.1915154-1-fiona.klute@gmx.de>
 <20240704121352.1915154-4-fiona.klute@gmx.de>
 <20240708235639.7a9cc07c@windsurf>
 <1e0c66a5-b6d3-4117-aafb-68b4d00a5565@gmx.de>
 <20240709135538.4594978e@windsurf>
 <f1ec17d8-b94a-4759-be4b-9eba46ae1b5a@gmx.de>
 <20240709203551.1e05568e@windsurf>
 <e3604bce-6189-4cef-a0f2-19257f66ebf1@gmx.de>
 <20240710134719.5b84b352@windsurf>
 <83847513-35ce-449d-a90c-ba18e80c892b@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720641485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l92fqvvN8CWe/NDwEBMnklAlm5/m79nmMywV9P96C0I=;
 b=XE/AF7owQaks+HR+QmZzi0WWQB9hfaQXWObQshqIishCxH2R/gT5w/vH4JLDZ/IRn5HOHF
 i6zBi9WtTtm+XKGkdCaoCBB+3tswq5TeB0TdfwMH7mlkpKg+jJxxLwozneiNUON4PnWFPU
 BEM3aHYFhQct4zHZK8901EKROkIthw+TOFYZpF6w0vU9fDsXan+2Zhet4vDcJkz9YjYzKT
 VNaxFzNoKIJ4RtK7Gp9mTtlk31SMh1X422n0Wn/ijoWclZL1fhTIBZT1mLs1MRS52U5EVj
 YCd6DyVkgB9lcb8SvJ2xQuguW42yUWpVka95/iwaId5afrsb7GxL3bgf0E5Kog==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XE/AF7ow
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

Hello,

On Wed, 10 Jul 2024 20:41:17 +0200
Fiona Klute <fiona.klute@gmx.de> wrote:

> > $ mkdir /tmp/foo
> > $ cp ~/buildroot/support/config-fragments/autobuild/bootlin-armv7-glibc.config .config
> > $ ~/buildroot/utils/docker-run make -C ~/buildroot O=$(pwd) menuconfig
> >
> > enable BR2_PACKAGE_PYTHON3=y and BR2_PACKAGE_FAIL2BAN=y in menuconfig, exit  
> 
> Having to manually edit the config is exactly what I was trying to
> avoid, whether by using an existing .config or a defconfig that enables
> the options I need. Minimizing friction. ;-)

Well, then:

$ mkdir /tmp/foo
$ cd /tmp/foo
$ cp ~/buildroot/support/config-fragments/autobuild/bootlin-armv7-glibc.config .config
$ cat > .config<<EOF
BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_FAIL2BAN=y
EOF
$ ~/buildroot/utils/docker-run make olddefconfig
$ ~/buildroot/utils/docker-run make

done.

> > However, it would indeed perhaps make sense for docker-run to mount
> > BR2_EXTERNAL trees inside the container.  
> 
> I've just sent a patch. :-)

Seen. I'll probably wait for the review from Yann E. Morin on this
change though.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
