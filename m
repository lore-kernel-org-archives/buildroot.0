Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 487E3C4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 07:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1989F41549;
	Thu,  2 May 2024 07:49:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2U6BGSMw1ozv; Thu,  2 May 2024 07:49:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79D4341551
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79D4341551;
	Thu,  2 May 2024 07:49:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 54D7D1BF83C
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 07:49:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EBB94419EC
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 07:49:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2XNyA4wUGo5t for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 07:49:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9A2A5419E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A2A5419E9
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9A2A5419E9
 for <buildroot@buildroot.org>; Thu,  2 May 2024 07:49:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DFE90E0010;
 Thu,  2 May 2024 07:49:15 +0000 (UTC)
Date: Thu, 2 May 2024 09:49:15 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240502094915.36bc9096@windsurf>
In-Reply-To: <20240411210045.2127843-1-bernd@kuhls.net>
References: <20240411210045.2127843-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1714636156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NzGdw4Qvi1fl8MB5GEnJSJQGDeOVpX4JJTD0WDdVVJM=;
 b=dlRWIiR74Hoq7GjyO1Nh6s0vthXvAOFc+E7EPDp+MX/qdelUUN8Mq9cL1QY5+fV4lnZ/J3
 qZlfW36ek1N84FH0dsTfk4QQ9d/VwkcJO1juSIr+AYb6Nn2D6S82xfmhMNDICqsIm/y5IH
 ct1P7KO1NYbzAxQH+UGVxLyu2MU/VEcqyiPNyBNHc7KH7OiYVXE+wISG8iplmzu2F1ogOH
 Gp7j4w3STqh8D0EKI4yfyUKQsosNNi+sT8F8KcQ4/jA4kCZU/BHpo/EROuHXPvp7/vLwSB
 GmGmcq/x3mDnE9/v80syIgBJTMczgfEFW2Bmr/SJSUQ99oXBjZOjcW7FhFtXpg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dlRWIiR7
Subject: Re: [Buildroot] [PATCH] package/libdeflate: bump version to 1.20
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 11 Apr 2024 23:00:45 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> ttps://github.com/ebiggers/libdeflate/blob/master/NEWS.md
> 
> Build-tested using this defconfig
> 
> BR2_PACKAGE_LIBDEFLATE=y
> 
>                              arm-aarch64 [ 1/42]: OK
>                    bootlin-aarch64-glibc [ 2/42]: OK
>                bootlin-arcle-hs38-uclibc [ 3/42]: OK
>                     bootlin-armv5-uclibc [ 4/42]: OK
>                      bootlin-armv7-glibc [ 5/42]: OK
>                    bootlin-armv7m-uclibc [ 6/42]: OK
>                       bootlin-armv7-musl [ 7/42]: OK
>                 bootlin-m68k-5208-uclibc [ 8/42]: OK
>                bootlin-m68k-68040-uclibc [ 9/42]: OK
>              bootlin-microblazeel-uclibc [10/42]: OK
>                 bootlin-mipsel32r6-glibc [11/42]: OK
>                    bootlin-mipsel-uclibc [12/42]: OK
>                      bootlin-nios2-glibc [13/42]: OK
>                  bootlin-openrisc-uclibc [14/42]: OK
>         bootlin-powerpc64le-power8-glibc [15/42]: OK
>            bootlin-powerpc-e500mc-uclibc [16/42]: OK
>                    bootlin-riscv32-glibc [17/42]: OK
>                    bootlin-riscv64-glibc [18/42]: OK
>                     bootlin-riscv64-musl [19/42]: OK
>                  bootlin-s390x-z13-glibc [20/42]: OK
>                       bootlin-sh4-uclibc [21/42]: OK
>                    bootlin-sparc64-glibc [22/42]: OK
>                     bootlin-sparc-uclibc [23/42]: OK
>                     bootlin-x86-64-glibc [24/42]: OK
>                      bootlin-x86-64-musl [25/42]: OK
>                    bootlin-x86-64-uclibc [26/42]: OK
>                    bootlin-xtensa-uclibc [27/42]: OK
>                             br-arm-basic [28/42]: OK
>                     br-arm-full-nothread [29/42]: OK
>                       br-arm-full-static [30/42]: OK
>                    br-i386-pentium4-full [31/42]: OK
>                 br-i386-pentium-mmx-musl [32/42]: OK
>                       br-mips64-n64-full [33/42]: OK
>                  br-mips64r6-el-hf-glibc [34/42]: OK
>                br-powerpc-603e-basic-cpp [35/42]: OK
>                br-powerpc64-power7-glibc [36/42]: OK
>                        linaro-aarch64-be [37/42]: OK
>                           linaro-aarch64 [38/42]: OK
>                               linaro-arm [39/42]: OK
>                          sourcery-mips64 [40/42]: OK
>                            sourcery-mips [41/42]: OK
>                           sourcery-nios2 [42/42]: OK
> 42 builds, 0 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libdeflate/libdeflate.hash | 2 +-
>  package/libdeflate/libdeflate.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
