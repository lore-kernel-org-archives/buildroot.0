Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79CE1D0EE18
	for <buildroot@archiver.kernel.org>; Tue, 25 Nov 2025 22:17:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A715F4110F;
	Tue, 25 Nov 2025 22:17:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ywTBM_crW-2M; Tue, 25 Nov 2025 22:17:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F36941100
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F36941100;
	Tue, 25 Nov 2025 22:17:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 132532A9
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 22:17:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE1CD41100
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 22:17:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p49wZntd6FMp for <buildroot@buildroot.org>;
 Tue, 25 Nov 2025 22:17:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.bonnefille@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B79AA40B91
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B79AA40B91
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B79AA40B91
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 22:17:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id E6180C15D63
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 22:17:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 92C41606A1;
 Tue, 25 Nov 2025 22:17:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 02291102F088D; Tue, 25 Nov 2025 23:17:46 +0100 (CET)
Date: Tue, 25 Nov 2025 23:17:45 +0100
Message-Id: <DEI4H0M1QWOY.36P256HMM50FO@bootlin.com>
Cc: "Jagan Teki" <jagan@amarulasolutions.com>, "Thomas Bonnefille"
 <thomas.bonnefille@bootlin.com>
To: "Julien Olivain" <ju.o@free.fr>, <buildroot@buildroot.org>
Mime-Version: 1.0
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251104200833.4095436-1-ju.o@free.fr>
In-Reply-To: <20251104200833.4095436-1-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1764109068; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=wKYifrDUYanDdjksJSi7oq03L5G5oZb2EYnTOdZe+DA=;
 b=tSxaAKReG2RQWQPRx+0P5VfTMoWOqsOSMHmMVQCOtGs5oR1sjxL0lr+wIxPiqOBs822PH6
 LDTagAnV/0pIM0nMSC1rgFU/XDcGAyi+wGescjcmOAi1y+PJNN7cYspHzPcBCQsFgmoVVo
 Ka2xNfd9bHBsgUzwotuwWOJp9akPpkyd7YQf8I2KXswRcYSbT6uw0FfEl4mL79O8zTWNlE
 WFmCG7WzzjU7vbxocgNEafD3gw+OEPewswALZMWwIR7FGzXd3KxTQz59d824gxxSlVu6jQ
 C2c1r7JS4E0mdN3+V+4yru5KbQz3eeiKdpxcQqjf0VTkkIKlqB+QtnKCEH7weQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=tSxaAKRe
Subject: Re: [Buildroot] [PATCH 1/1] configs/pine64_star64: update to latest
 upstream uboot and LTS kernel
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
From: Thomas Bonnefille via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Julien,

> Since Buildroot commit [1] "package/gcc: switch to GCC 14.x as the
> default", pine64_star64_defconfig compilation is failing in
> u-boot with error:
>
>     drivers/video/dw_hdmi.c: In function 'dw_hdmi_write':
>     drivers/video/dw_hdmi.c:81:42: error: passing argument 2 of 'writeb' makes pointer from integer without a cast [-Wint-conversion]
>
> See build failure [2].
>
> Upstream U-Boot includes a support for this board since commit [3],
> first included in v2024.07.
> Upstream Kernel includes a support for this board since commit [4],
> first included in v6.11.
>
> This commit switches uboot and linux from the repository
> https://github.com/Fishwaldo
> to their respective upstream sources.
>
> U-Boot is updated from the fork from a v2021.10 base to v2025.10.
> The Linux Kernel is updated from the fork from a v5.15.131 base
> to v6.12.56.
>
> While at it, this commit updates the defconfig to the new convention:
> - It adds custom hashes and enables BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
> - It switches to a glibc stable bootlin external toolchain
>
> Note that the upstream uboot defconfig name for the pine64 star64
> board is starfive_visionfive2 (which is in fact another, but very
> similar board). The detection of the board is made inside the SPL.
> See [5].
>
> Finally, switching to upstream uboot and kernel required few
> adjustments:
> - The genimage.cfg is updated to use the "u-boot.itb" file produced by
>   U-Boot,
> - In genimage.cfg, the uboot partition-type-uuid is changed to
>   xbootldr (the genimage human readable name), to follow the
>   recommendation of the UUID to use from [5],
> - In extlinux.conf, rootwait is added in kernel arguments,
> - The post-build.sh script and the star64-uboot-fit-image.its file
>   are removed: they are no longer needed, since U-Boot and Binman
>   are managing everything,
> - BR2_TARGET_UBOOT_SPL_NAME is updated in the defconfig, to reflect
>   the file name generated by U-Boot,
> - BR2_PACKAGE_HOST_STARFIVE_SPLTOOL is removed from the defconfig,
>   it is no longer needed, since upstream U-Boot produces the file
>   at the correct format,
> - BR2_PACKAGE_HOST_UBOOT_TOOLS is also removed from the defconfig,
>   it is no longer needed since U-Boot uses Binman,
> - the defconfig is updated to include the new uboot requirements
>   (BR2_TARGET_UBOOT_{NEEDS,USE}_*),
> - the pine64_star64_defconfig entry is removed from .checkpackageignore
>   it is no longer needed.
>
> This patch was tested on a Pine64 Star64 board V1.1,
> PCB revision: 0xc1, BOM revision: A.
>
> Fixes:
> - [2]
>
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/1e1fafa1f0f5069418e92f702c2a66db6408a634
> [2] https://gitlab.com/buildroot.org/buildroot/-/jobs/11916952973
> [3] https://source.denx.de/u-boot/u-boot/-/commit/7ebf7e77c0616ef0d2f58cc1684c230f656bd3d6
> [4] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=2606bf583b9623694b864c220fd6b3d2ed13ba13
> [5] https://source.denx.de/u-boot/u-boot/-/blob/v2025.10/doc/board/starfive/pine64_star64.rst
>
> Signed-off-by: Julien Olivain <ju.o@free.fr>

I had a look at your patch, it looks good to me (and is cleaner than what I
sent !) :

Reviewed-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>

However my second patch [1] still apply as the only board which was using
the starfive spl tool in Buildroot was the Star64.

1: https://lore.kernel.org/buildroot/20250822-update_star64-v1-2-83fe87fbe8ea@bootlin.com/

Thank you very much,
Thomas Bonnefille
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
