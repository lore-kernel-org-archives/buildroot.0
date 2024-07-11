Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A4EAC3DA45
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 18:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8610A40543;
	Thu, 11 Jul 2024 18:01:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yRonDAB6xIIF; Thu, 11 Jul 2024 18:01:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CB0041101
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3CB0041101;
	Thu, 11 Jul 2024 18:01:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8F26C1BF47D
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 18:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C6CE410FB
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 18:01:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Em4Ia8dB7Tf4 for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 18:01:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CC82840543
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC82840543
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CC82840543
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 18:01:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DC5BF40006;
 Thu, 11 Jul 2024 18:01:35 +0000 (UTC)
Date: Thu, 11 Jul 2024 20:01:34 +0200
To: Julien BOIBESSOT <julien.boibessot@armadeus.com>
Message-ID: <20240711200134.59b302d9@windsurf>
In-Reply-To: <20240711144810.2291029-1-julien.boibessot@armadeus.com>
References: <20240711144810.2291029-1-julien.boibessot@armadeus.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720720896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OqELMTXrYmX2m5BGY7tUVD8iLg5SAjg8EPVEAKHa82s=;
 b=fwfeaaQvcU3wQ1qbUEnclUptEStM2hP5z1DLRrgZ3sqn7JaWZCAMUL6IFdlG+4bZPgyJu2
 Ke0Ai7pKvAwRe8Jpbiqq0WyXf4QJVj1hpBzc7rvKZnxSbGFIN7H5HIJ707J2ycuLmnQI/3
 xESX3QMqpP00cnF+9I+ksBnWYVURClPsUJvZFFdjZEgUebqEvQ+yAStDf9gWUh3RNtfdD0
 Rmgh195AivD3C2UIv6SwiaAzCYXka9pDa/XGZ44YgxIvAxbt0T2nVaPUBVmx3oNKK3F4kJ
 FMq2K1Tynnh8wN5luABKuIfms6UWxEn5VGZad8xJrLS1rxO7O+31c0wEWzTc3A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fwfeaaQv
Subject: Re: [Buildroot] [PATCH 1/1] package/ltris: bump version to 1.3.2
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

On Thu, 11 Jul 2024 16:48:10 +0200
Julien BOIBESSOT <julien.boibessot@armadeus.com> wrote:

> As requested by Buildroot's autobuilder tracking outdated packages.
> 
> Build tested with:
> 
> $ ./utils/test-pkg -c ltris.config -p ltris -a
>                              arm-aarch64 [ 1/41]: OK
>                    bootlin-aarch64-glibc [ 2/41]: OK
>                bootlin-arcle-hs38-uclibc [ 3/41]: OK
>                     bootlin-armv5-uclibc [ 4/41]: OK
>                      bootlin-armv7-glibc [ 5/41]: OK
>                    bootlin-armv7m-uclibc [ 6/41]: SKIPPED
>                       bootlin-armv7-musl [ 7/41]: OK
>                 bootlin-m68k-5208-uclibc [ 8/41]: SKIPPED
>                bootlin-m68k-68040-uclibc [ 9/41]: OK
>              bootlin-microblazeel-uclibc [10/41]: OK
>                 bootlin-mipsel32r6-glibc [11/41]: OK
>                    bootlin-mipsel-uclibc [12/41]: OK
>                      bootlin-nios2-glibc [13/41]: OK
>                  bootlin-openrisc-uclibc [14/41]: OK
>         bootlin-powerpc64le-power8-glibc [15/41]: OK
>            bootlin-powerpc-e500mc-uclibc [16/41]: OK
>                    bootlin-riscv32-glibc [17/41]: OK
>                    bootlin-riscv64-glibc [18/41]: OK
>                     bootlin-riscv64-musl [19/41]: OK
>                  bootlin-s390x-z13-glibc [20/41]: OK
>                       bootlin-sh4-uclibc [21/41]: OK
>                    bootlin-sparc64-glibc [22/41]: OK
>                     bootlin-sparc-uclibc [23/41]: OK
>                     bootlin-x86-64-glibc [24/41]: OK
>                      bootlin-x86-64-musl [25/41]: OK
>                    bootlin-x86-64-uclibc [26/41]: OK
>                    bootlin-x86-i686-musl [27/41]: OK
>                    bootlin-xtensa-uclibc [28/41]: OK
>                             br-arm-basic [29/41]: OK
>                     br-arm-full-nothread [30/41]: OK
>                       br-arm-full-static [31/41]: OK
>                    br-i386-pentium4-full [32/41]: OK
>                       br-mips64-n64-full [33/41]: OK
>                  br-mips64r6-el-hf-glibc [34/41]: OK
>                br-powerpc-603e-basic-cpp [35/41]: OK
>                br-powerpc64-power7-glibc [36/41]: OK
>                        linaro-aarch64-be [37/41]: OK
>                           linaro-aarch64 [38/41]: OK
>                               linaro-arm [39/41]: OK
>                          sourcery-mips64 [40/41]: OK
>                            sourcery-mips [41/41]: OK
> 41 builds, 2 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
> 
> $ cat ltris.config
> BR2_PACKAGE_LTRIS=y
> BR2_PACKAGE_LTRIS_AUDIO=y
> 
> Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
> ---
>  package/ltris/ltris.hash | 2 +-
>  package/ltris/ltris.mk   | 2 +-
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
