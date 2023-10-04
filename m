Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 545C6E7C4EC
	for <buildroot@archiver.kernel.org>; Wed,  4 Oct 2023 19:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3BD041ED9;
	Wed,  4 Oct 2023 19:17:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3BD041ED9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vj33-lfRLC9K; Wed,  4 Oct 2023 19:17:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA03641F39;
	Wed,  4 Oct 2023 19:17:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA03641F39
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E80D51BF41F
 for <buildroot@lists.busybox.net>; Wed,  4 Oct 2023 19:17:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C19AD61493
 for <buildroot@lists.busybox.net>; Wed,  4 Oct 2023 19:17:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C19AD61493
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GA0ECjJysk1a for <buildroot@lists.busybox.net>;
 Wed,  4 Oct 2023 19:17:19 +0000 (UTC)
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1796C61492
 for <buildroot@uclibc.org>; Wed,  4 Oct 2023 19:17:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1796C61492
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1qo7Mw-0000xd-IN
 for buildroot@uclibc.org; Wed, 04 Oct 2023 21:17:14 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Wed, 04 Oct 2023 21:16:48 +0200
Message-ID: <pan$5491d$c81839cd$9be354ce$80faa444@ID-313208.user.individual.net>
References: <20230729180250.1494674-1-bernd@kuhls.net>
 <b15fa589-68d1-5c5c-0389-2bad2c05b2de__40810.1815659151$1696153825$gmane$org@smile.fr>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
Subject: Re: [Buildroot] [PATCH 1/1] package/mesa3d: rework dri3 handling
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Romain,

Am Sun, 1 Oct 2023 11:49:54 +0200 schrieb Romain Naour:

> I'm able to reproduce this build issue.
> But I can't find any autobuilder link.

I do not know the reason for this, maybe the combination is too seldom?

> Have you tested on other driver than the Intel drivers ?

Yes, the current situation looks like this:

config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_CROCUS
- broken without "-Ddri3=enabled"

config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV
- has "select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_XORG7"

config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO
- has "select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_XORG7"

config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915
- broken without "-Ddri3=enabled"

config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS
- broken without "-Ddri3=enabled"

config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA
- has "select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_XORG7"

config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST
- has "select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_XORG7"

config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D
- has "select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_XORG7"

config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4
- has "select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_XORG7"

config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM
- has "select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_XORG7"

config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
- has "select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_XORG7"

Yes, I tested all drivers based on the defconfig

BR2_x86_64=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_OPENGL_GLX=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_XORG7=y

with only the tested driver additionally enabled and also found more 
broken drivers:

config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
- also broken, fixed by this patch
config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R300
- also broken, fixed by this patch
config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600
- also broken, fixed by this patch
config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI
- also broken, fixed by this patch
config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA
- also broken, fixed by this patch
config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST
- also broken, fixed by this patch
config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_TEGRA
- also broken, fixed by this patch
config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL
- also broken, fixed by this patch
config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_SWRAST
- also broken, fixed by this patch

The result is: All drivers are broken without "-Ddri3=enabled".

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
