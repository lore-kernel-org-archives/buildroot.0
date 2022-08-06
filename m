Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84DF0C19F2D
	for <buildroot@archiver.kernel.org>; Sat,  6 Aug 2022 20:43:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C8586405B4;
	Sat,  6 Aug 2022 20:43:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8586405B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sxhzvspA658E; Sat,  6 Aug 2022 20:43:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A41C24016A;
	Sat,  6 Aug 2022 20:43:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A41C24016A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DA9971BF47A
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 20:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C070F41732
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 20:43:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C070F41732
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nnXIE5_-Rpbn for <buildroot@lists.busybox.net>;
 Sat,  6 Aug 2022 20:43:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46E9D41553
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 46E9D41553
 for <buildroot@buildroot.org>; Sat,  6 Aug 2022 20:43:42 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2A6E61BF204;
 Sat,  6 Aug 2022 20:43:39 +0000 (UTC)
Date: Sat, 6 Aug 2022 22:43:38 +0200
To: Davide Viti <zinosat@gmail.com>, Filip Skoneczny <fskoneczny@gmail.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>, Heiko Thiery
 <heiko.thiery@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>, Louis
 Aussedat <aussedat.louis@gmail.com>, Marek Belisko
 <marek.belisko@open-nandra.com>, Mike Harmony <mike.harmony@snapav.com>,
 Peter Seiderer <ps.report@gmx.net>, Romain Naour <romain.naour@gmail.com>,
 Suniel Mahesh <sunil@amarulasolutions.com>, Thomas Huth
 <huth@tuxfamily.org>, "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220806224338.0159e15c@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659818621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ynID2kD7rhJT+EJwuZHCEmc6E+Yjb6ECLScTGOPsS2s=;
 b=BOpudjY6WmQXzHvPA3TqRcu1PmPcuhuGGXb4N/XNC8axgB3J8IJ9zNNcFKYQf1kPOXgY8h
 hKeEJ5TqdbyDYIsYFHCKvuZgU0ezNI+fUPGXmdB7u2PuAyo/31gnH7XojeulDmoKXP2noM
 46rbf4l6O8zoQiq/0SHhnohl+rAr0jzHTdMkTrAuB+fMYWAVAlWYvc+w1XnTBriJ6Rv0cD
 9Su+hxuDK/T7f93qQEqHVt75wgoqzxx/RN//EVP7nmlfDze0V6AaYcDLeiB6VrU7yd6Hzt
 xgSFy/0MhklXTS+I3C8Y2DVAONHAPphBtODZpMmHcHZeS0WOXC644q0fSnkP+A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BOpudjY6
Subject: [Buildroot] Buildroot defconfigs about to be removed
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

This is another reminder about the below defconfigs, which are failing
to build in Buildroot. If they are not fixed soon, they will be removed
before the 2022.08 release, expected to be released at the end of
August.

Please let us know if you are no longer interested in maintaining some
of those defconfigs.

Thanks for your contribution!

Thomas

rockpro64_defconfig -> arm-trusted-firmware fails to build
https://gitlab.com/buildroot.org/buildroot/-/jobs/2812054016

rock_pi_ni10_defconfig -> arm-trusted-firmware fails to build
https://gitlab.com/buildroot.org/buildroot/-/jobs/2812054009

rock_pi_4_defconfig -> arm-trusted-firmware fails to build
https://gitlab.com/buildroot.org/buildroot/-/jobs/2812054006

roc_pc_rk3399_defconfig -> arm-trusted-firmware fails to build
https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053999

raspberrypi3_qt5we_defconfig -> build failure in qt5webengine
https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053961

qemu_xtensa_lx60_nommu_defconfig -> elf2flt segfaults
https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053940

qemu_m68k_mcf5208_defconfig -> elf2flt segfaults
https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053827

pine64_sopine_defconfig -> arm-trusted-firmware fails to build
https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053812

pine64_defconfig -> arm-trusted-firmware fails to build
https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053810

orangepi_win_defconfig -> arm-trusted-firmware fails to build
https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053792

orangepi_rk3399_defconfig -> arm-trusted-firmware fails to build
https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053790

orangepi_prime_defconfig -> arm-trusted-firmware fails to build
https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053786

orangepi_plus_defconfig -> U-Boot needs Python 2.x
https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053784

orangepi_pc2_defconfig -> arm-trusted-firmware fails to build
https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053776

orangepi_one_plus_defconfig -> Device Tree syntax error
https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053771

kontron_bl_imx8mm_defconfig -> -lgnutls -luuid missing when building
U-Boot. Strange thing is that host-gnutls is definitely built before
U-Boot, but it doesn't find it. for libuuid,
BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y is missing
https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053608

friendlyarm_nanopi_r1_defconfig -> U-Boot needs Python 2.x
https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053547

friendlyarm_nanopi_neo_plus2_defconfig -> arm-trusted-firmware fails to build
https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053545

friendlyarm_nanopi_neo_defconfig -> U-Boot needs Python 2.x
https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053540

friendlyarm_nanopi_neo4_defconfig -> arm-trusted-firmware fails to build
https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053537

friendlyarm_nanopi_neo2_defconfig -> arm-trusted-firmware fails to build
https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053533

friendlyarm_nanopi_m4_defconfig -> arm-trusted-firmware fails to build
https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053529

friendlyarm_nanopi_m1_plus_defconfig -> U-Boot needs Python 2.x
https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053526

friendlyarm_nanopi_m1_defconfig -> U-Boot needs Python 2.x
https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053522

friendlyarm_nanopi_a64_defconfig -> arm-trusted-firmware fails to build
https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053520

friendlyarm_nanopc_t4_defconfig -> arm-trusted-firmware fails to build
https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053518

bananapi_m64_defconfig -> arm-trusted-firmware fails to build
https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053420

bananapi_m2_plus_defconfig -> U-Boot needs Python 2.x
https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053415

bananapi_m1_plus_defconfig -> U-Boot needs Python 2.x
https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053412

bananapi_m1_defconfig -> Device Tree syntax error
https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053409

arm_juno_defconfig -> arm-trusted-firmware fails to build
https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053341

amarula_a64_relic_defconfig -> arm-trusted-firmware fails to build
https://gitlab.com/buildroot.org/buildroot/-/jobs/2812053333


-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
