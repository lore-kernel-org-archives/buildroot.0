Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 060EFC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 22:03:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 988EC84607;
	Fri, 12 Jul 2024 22:03:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fqKr5QnEgZWh; Fri, 12 Jul 2024 22:03:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7F5384568
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7F5384568;
	Fri, 12 Jul 2024 22:02:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 64EEB1BF3C4
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 22:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52001400DA
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 22:02:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YndZyY71Y76X for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 22:02:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EA760400AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA760400AC
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EA760400AC
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 22:02:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D36D460002;
 Fri, 12 Jul 2024 22:02:53 +0000 (UTC)
Date: Sat, 13 Jul 2024 00:02:52 +0200
To: Kadambini Nema <kadambini.nema@gmail.com>
Message-ID: <20240713000252.65ded40d@windsurf>
In-Reply-To: <20240215224614.3028380-1-kadambini.nema@gmail.com>
References: <20240215224614.3028380-1-kadambini.nema@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720821774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HNZXWahUruIQmcL8+N+3CJ9EVH1iwuE8849F+gRKiXY=;
 b=Qv91tDan2c7OZt0ELLalralC+rsWgopnBNB/PvKzxeKg3Tid7R6nxghLz8EBddUsYbiwLJ
 P/MY5ili9ldwDuYF/0fj66aNapJJiFZbdPVyiwbkmVag17FmpYw1GKE2MJJKtu/mTcGeO6
 RpbP/SPHMDwZsWnabcs8rG0v7Pu7mqKDSb7JgyHeKXR5RVY1bHu8AQsU5tcWM2rGrCSo2Q
 kc0/Lcea0e2AlXyYWlC3nABiGurqyXnfHgKGIBD1VAPgmLGPfnFXYytEze/9aZ+bis7qHp
 AY+1/O2vOSOSi2PeV/k67ITMWhWyvAZW/D7QVPX6R0axi4UNXMvmjjEHvc38vg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Qv91tDan
Subject: Re: [Buildroot] [PATCH 1/1] package/{libuv,
 uvw}: bump version to libuv 1.47.0 and uvw 3.3.0
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Asaf Kahlon <asafka7@gmail.com>,
 Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Kadambini,

On Thu, 15 Feb 2024 14:46:14 -0800
Kadambini Nema <kadambini.nema@gmail.com> wrote:

> Change Log : https://github.com/libuv/libuv/blob/v1.x/ChangeLog#L92
>              https://github.com/skypjack/uvw/releases/tag/v3.3.0_libuv_v1.47
> 
> Build test results:
>  libuv.config
>    BR2_PACKAGE_LIBUV=y
>    BR2_PACKAGE_UVW=y
> 
> $./utils/test-pkg -k -c libuv.uvw.config -p uvw -p libuv
>                     bootlin-armv5-uclibc [1/6]: OK
>                      bootlin-armv7-glibc [2/6]: OK
>                    bootlin-armv7m-uclibc [3/6]: SKIPPED
>                      bootlin-x86-64-musl [4/6]: OK
>                       br-arm-full-static [5/6]: SKIPPED
>                             sourcery-arm [6/6]: SKIPPED
> 6 builds, 3 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
> 
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
> ---
>  package/libuv/libuv.hash | 2 +-
>  package/libuv/libuv.mk   | 2 +-
>  package/uvw/uvw.hash     | 4 ++--
>  package/uvw/uvw.mk       | 2 +-
>  4 files changed, 5 insertions(+), 5 deletions(-)

Thanks for your patch, and sorry for the long delay in getting back to
you. As was already replied by Marcus, libuv has already been bumped to
1.48 in the mean time. So instead I pushed a version bump for just uvm
that updates it to version 3.4.0, which is aligned with libuv 1.48. See:

  https://gitlab.com/buildroot.org/buildroot/-/commit/c54134bf6914593caaa9ed4aa11cbe3a17c59eca

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
