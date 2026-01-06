Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 858B8CEFD18
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 22:22:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5283560C29;
	Tue,  6 Jan 2026 22:22:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Xg2aWGpqReX; Tue,  6 Jan 2026 22:22:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9977A60C1E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767738163;
	bh=qzP3MGKLAkN7KhGiYWV/dIJDy/Bj97tUZSBpLi5xDm4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jvg9rFCqykIEZVbeKtjYjBziLrb7R7wedKj4n+3CHmYNig/CukMQFPpI2FH5RfX3l
	 Qsb8JgTWWZhLyK89bKUp4GqrmFS7s/7lAP/8kZuNKbGyJHGJYjo8h50+apNYi8Fh+m
	 EJHRaN1+82viVHDDk+IjpkBHw9bcDA3iCGWmfJFz2M6VpkzT5EzFysROPo3PuguK1d
	 t+fp2MYaNd/Pez7ZRitWObbRlSRusvlsY3j1wzF1P7RQu6+krXjYUiEOUD7NULDJE1
	 WrTJlR4Ho539Yl7+XNouH4AXrDsUdTN7OD1UYXdLi+iOmtCDQCUECtb+qdhPNlJcLJ
	 jcxHJ3oj5l7rA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9977A60C1E;
	Tue,  6 Jan 2026 22:22:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E1DC770B
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 22:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D47C740763
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 22:22:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KFkXSEttRXcZ for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 22:22:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C25FD40368
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C25FD40368
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C25FD40368
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 22:22:40 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id E224BC1C388;
 Tue,  6 Jan 2026 22:22:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0230F60739;
 Tue,  6 Jan 2026 22:22:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E2C02103C807E; Tue,  6 Jan 2026 23:22:37 +0100 (CET)
Date: Tue, 6 Jan 2026 23:22:37 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>, Jarkko Sakkinen
 <jarkko@kernel.org>, Petr Vorel <petr.vorel@gmail.com>
Message-ID: <20260106232237.70e33687@windsurf>
In-Reply-To: <20260103132552.3979708-6-bernd@kuhls.net>
References: <20260103132552.3979708-1-bernd@kuhls.net>
 <20260103132552.3979708-6-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767738158; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=WzQUDp4xbK9b7etjXtRRaceS0SNX4Dr587Wxp0n3P3E=;
 b=o442K5XNzWJgUpQ02oQFzyDrMi+Iq55P3iYMjLH/sztaCU7hMuJHw9wTlwaTz5lNkelr7S
 JBxf3NP0QhQ/zHAWz+TX4l7Q1smsJ7C2Mi57PoKN2Zvw8s6oyq3y5z3vZUm0Un47/HYnF/
 AdisO/ZSokBVBwc2MGqoc8VPra8+5QB4n45x3DalBK9SJXt2rtO3EVnMmG58dwezblwDBH
 +6kUrbH3h2rWNuNDELVSYUeaONX1+PJjMrgIWaORxN5xIM6sgLs0gmrNARxEGvycFDzJin
 Ise6xGFo/LvhIcUuTJfXHn1a/2vdfjQgcSd7SJCq4s3zos1UHjPjL2bgHGIWHg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=o442K5XN
Subject: Re: [Buildroot] [PATCH v4 5/5] package/snort3: fix build failure
 due to missing BR2_PACKAGE_LIBTIRPC_RPCDB
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

On Sat,  3 Jan 2026 14:25:52 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Package snort3 requires libtirpc rpcdb option enabled with non-glibc
> toolchains since the bump of libtirpc to version 1.3.7 with buildroot
> commit 3f3d6e43de9b4aac7df8545fd811171256f878d3 which includes upstream
> commit:
> https://git.linux-nfs.org/?p=steved/libtirpc.git;a=commit;h=7cea8ad66aecc21e6caae330b5d31075af399193
> 
> These build errors, caused by the forementioned upstream commit, only
> occur with non-glibc toolchains:
> https://patchwork.yoctoproject.org/comment/30091/
> "but I believe it breaks the build with musl".
> 
> The build error during configure stage:
> 
> -- Looking for getrpcent - not found
> CMake Error at cmake/sanity_checks.cmake:51 (message):
>   Couldn't find an RPC program number database implementation!
> Call Stack (most recent call first):
>   CMakeLists.txt:31 (include)
> 
> was not yet found by the autobuilders but can be reproduced by this
> defconfig:
> 
>  BR2_x86_64=y
>  BR2_x86_corei7=y
>  BR2_TOOLCHAIN_EXTERNAL=y
>  BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_BLEEDING_EDGE=y
>  BR2_PER_PACKAGE_DIRECTORIES=y
>  BR2_INIT_NONE=y
>  # BR2_PACKAGE_BUSYBOX is not set
>  BR2_PACKAGE_SNORT3=y
>  # BR2_TARGET_ROOTFS_TAR is not set
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/snort3/Config.in | 1 +
>  1 file changed, 1 insertion(+)

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
