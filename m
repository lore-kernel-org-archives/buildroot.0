Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 069A4CA0FFF
	for <buildroot@archiver.kernel.org>; Sat, 30 Aug 2025 06:12:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABA2360690;
	Sat, 30 Aug 2025 06:12:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MLwwuETFKeFa; Sat, 30 Aug 2025 06:12:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7A3760680
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7A3760680;
	Sat, 30 Aug 2025 06:12:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BEBCFFA
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 06:12:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC34D60680
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 06:12:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o05oFKVKRguG for <buildroot@buildroot.org>;
 Sat, 30 Aug 2025 06:12:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DED916067F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DED916067F
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DED916067F
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 06:12:07 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id A88C91A0D3F;
 Sat, 30 Aug 2025 06:12:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6C71E60620;
 Sat, 30 Aug 2025 06:12:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8699E1C22CC52; 
 Sat, 30 Aug 2025 08:11:52 +0200 (CEST)
Date: Sat, 30 Aug 2025 08:11:50 +0200
To: "buildroot@buildroot.org" <buildroot@buildroot.org>, Romain Naour
 <romain.naour@smile.fr>, Peter Korsgaard <peter@korsgaard.com>, Arnout
 Vandecappelle <arnout@rnout.be>, Julien Olivain <ju.o@free.fr>
Message-ID: <20250830081150.294e40e0@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1756534324; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding; bh=GaLwxrO8GB1V7/I+pGR6uvqsOe3fSUGl2V8Y2+z9INo=;
 b=c2XYgXcyg3Pr2PLQzm6lxVtBmw7/bmUqI/LAMeKeWkBA7Mvfd7tig9uPgqv8i5vIYfzzYF
 cm3AbcRfJh1jwRTtZkt5Q5lbHZ2LJWBaz5PMD1H1ChNiCxfxnoy/br6tZvjjWygMkoXReO
 wtAMXJxf52XEESXNcM/eKEiSqjpCVPxBa+0rRTBTly6PvgeysTbDbdTngviti1bHdjgOED
 QRYUP/mtLjYwOO7rSNaZhETi6Uw+E9PdYaQ77XfAn1k5e5E/MiDJIlRCoVtRsaFwpUu1JX
 cmlJfGER1kTXQW8b3hrNUBZp8bwe+8r4YBARHM1m2+93IKJV18YdNAM1SFDKWA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=c2XYgXcy
Subject: [Buildroot] Status of defconfigs
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

Hello,

I analyzed the results of the Gitlab CI pipeline for the last defconfig
build. The full details are below, but the summary is:

- 2 more patches sent to drop two additional at91/atmel defconfigs

- pine64_star64 has some patches on the mailing list from Thomas
  Bonnefille that fix the issues => to be reviewed/merged

- raspberrypi3_qt5we is always too long to build (it includes Webkit).
  Drop the defconfig? Exclude it from Gitlab CI testing?

- beagleboneai and roseapplepi are waiting for fixes from Peter

- snps_archs38_hsdk has only very recently started failing (a week ago)
  and I don't see what recent changes could have broken it. Ideas?

- ts4900 has a build failure in glibc due to the version of the kernel
  headers being used. But that seems like a real issue in glibc, not
  actually a defconfig issue as any other build using the same kernel
  headers version would fail in the same way

Thomas

at91sam9260eknf_defconfig			=> patch sent to drop
orangepi_lite2_defconfig			=> removed after pipeline was started
pcengines_apu2_defconfig			=> removed after pipeline was started
imx6ulz_bsh_smm_m2_defconfig			=> false positive, job restarted
at91sam9g45m10ek_defconfig			=> removed after pipeline was started
at91sam9rlek_defconfig				=> removed after pipeline was started
atmel_sama5d3xek_defconfig			=> patch sent to drop
beelink_gs1_defconfig				=> removed after pipeline was started
bananapro_defconfig				=> removed after pipeline was started
engicam_imx6qdl_icore_defconfig			=> removed after pipeline was started
engicam_imx6qdl_icore_rqs_defconfig		=> removed after pipeline was started
rock64_defconfig				=> removed after pipeline was started
pine64_star64_defconfig				=> patches from Thomas Bonnefille to review/merge
at91sam9g20dfc_defconfig			=> removed after pipeline was started
pine64_sopine_defconfig				=> removed after pipeline was started
raspberrypicm4io_64_defconfig			=> false positive, job restarted
raspberrypi3_qt5we_defconfig			=> this job is too long. Should we drop from CI testing?
engicam_imx6ul_geam_defconfig			=> removed after pipeline was started
chromebook_snow_defconfig			=> removed after pipeline was started
beagleboneai_defconfig				=> waiting for fixes from Peter Korsgaard
engicam_imx6ul_isiot_defconfig			=> removed after pipeline was started
engicam_imx6qdl_icore_qt5_defconfig		=> removed after pipeline was started
galileo_defconfig				=> removed after pipeline was started
odroidxu4_defconfig				=> removed after pipeline was started
orangepi_one_plus_defconfig			=> removed after pipeline was started
riotboard_defconfig				=> removed after pipeline was started
ts7680_defconfig				=> removed after pipeline was started
rock_pi_n8_defconfig				=> removed after pipeline was started
snps_archs38_hsdk_defconfig			=> this defconfig was building a week ago. Weird?!?
						   https://gitlab.com/buildroot.org/buildroot/-/jobs?name=T%3Dsnps_archs38_hsdk&kind=BUILD
sipeed_licheepi_zero_defconfig			=> fixed by Julien
toradex_apalis_imx6_defconfig			=> removed after pipeline was started
ts4900_defconfig				=> causing a glibc build failure, not due to the defconfig
roseapplepi_defconfig				=> waiting for fixes from Peter Korsgaard

-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
