Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F0EECD6E4A
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 08:24:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D2B0851EA;
	Sat, 30 May 2026 08:24:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6jLMbl3i-J24; Sat, 30 May 2026 08:24:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C371284D84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780129448;
	bh=87qPeP/gLgC8Gnv3lt3Ow9Na3E8U404C5yzaZ+ZdD6I=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ba2gPs5ywhNnsRSnKwQOauHAmBShM2qhlTnWUu303Cq6k5Yd742Wulk9nJlxTKBnr
	 M/hWLpfjt0JFOXl2y6YG6zbAQgoPZ1UBB+XDSgkCcO2ZzaVIHwvm79r6h4UO02JlHi
	 96jaQgaYuNUAx8u/gn4fEj072hJTBkEq2p3EaPpD5ny6HgI+AI9/ckAiy7WOwPIN5f
	 xNPBq7UlooQccnk9kGj5x9/R5QivbtO/rz9vUHUM6OWqr2mLE9MDmmcNvaQfA3ysGW
	 OhPfsDK2vi+nnXVl3TT3ptYVABU0ktmTuGzf8GPq7GiVp4laqZ45YoFpT4ZgxCk2yX
	 qt+TT9X5is/EQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C371284D84;
	Sat, 30 May 2026 08:24:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D9A41F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:24:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BAC6342A63
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:24:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E2SqlL0V7QLU for <buildroot@buildroot.org>;
 Sat, 30 May 2026 08:24:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E3ED242A51
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3ED242A51
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E3ED242A51
 for <buildroot@uclibc.org>; Sat, 30 May 2026 08:24:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id A2DCC1A374D
 for <buildroot@uclibc.org>; Sat, 30 May 2026 08:24:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 688FD6073B;
 Sat, 30 May 2026 08:24:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2F43710888CC3; 
 Sat, 30 May 2026 10:24:01 +0200 (CEST)
Date: Sat, 30 May 2026 10:24:01 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@uclibc.org
Message-ID: <ahqebFe9fS6cqYXe@windsurf>
References: <20260501183421.2459291-1-bernd@kuhls.net>
 <20260501183421.2459291-3-bernd@kuhls.net>
 <ahoCoXu7k68axiSL__21429.6951702394$1780089650$gmane$org@windsurf>
 <pan$16178$56b44c08$a21319fd$f79b1379@ID-313208.user.individual.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <pan$16178$56b44c08$a21319fd$f79b1379@ID-313208.user.individual.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780129442; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=+MrGCPcLtNaM9y2ixZVyrFheFePuoPMB/f4rdNv8se8=;
 b=JjJsuStR+TVMc0SY29xuGb1GZUtj2CzGnOnXH4BuJddrBSbavh5i/ZDT4Q9Q7//XnACXaB
 0rya/mhTH7hFd6rXA9EZMWJzIigl0hgbxJLbsTrq+uKNXyKMzYY8A2AfZpbAm1iqNbgiO1
 ja8QZoPlAh+ECuejCG5lRO8j2NJx49RksHT/1B2jdp9aZMqFGbnzyE3L141gOM6uPRHZeX
 g2MY3SpEOr30e27SrWqyeKHz/2K6KVYp3+1tTVndvyFk1Std+t/4pEVNLa1AoQb7L4/aqZ
 5h/MX264O3Oif4c8tR/pp/PHXo4nY27CYMNiN8wgQ9HU8tF/KBFUb601klcOwg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=JjJsuStR
Subject: Re: [Buildroot] [PATCH 3/5] package/stellarium: add extra downloads
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

On Sat, May 30, 2026 at 08:27:04AM +0200, Bernd Kuhls wrote:
> using this defconfig
> 
> BR2_x86_64=y
> BR2_x86_corei7=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE=y
> BR2_FORCE_HOST_BUILD=y
> BR2_PACKAGE_STELLARIUM=y
> BR2_PACKAGE_MESA3D=y
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
> BR2_PACKAGE_MESA3D_OPENGL_GLX=y
> BR2_PACKAGE_QT5=y
> BR2_PACKAGE_XORG7=y
> 
> I will send v2 to clarify that this is an existing error and not caused by 
> the version bump.

Thanks! I confirm I can reproduce with this defconfig. Looking forward
to the v2.

Make sure to always put bug fixes *before* version bumps, if the bug
fix is required for the currently packaged version, otherwise it is
very confusing.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
