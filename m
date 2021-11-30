Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD22C433F5
	for <buildroot@archiver.kernel.org>; Tue, 30 Nov 2021 07:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1ACCE81BB2;
	Tue, 30 Nov 2021 07:36:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kMq5yqqL_YwN; Tue, 30 Nov 2021 07:36:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 767AB81B53;
	Tue, 30 Nov 2021 07:36:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EBAE61BF289
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 07:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D75EB40105
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 07:36:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=arachnodroid.de
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 59kTW2ZYX70P for <buildroot@lists.busybox.net>;
 Tue, 30 Nov 2021 07:36:47 +0000 (UTC)
X-Greylist: delayed 00:06:38 by SQLgrey-1.8.0
Received: from v220200749773122244.hotsrv.de (unknown
 [IPv6:2a03:4000:47:39d:747f:15ff:fe4f:d530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D76D9400BA
 for <buildroot@buildroot.org>; Tue, 30 Nov 2021 07:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arachnodroid.de;
 s=dkim; t=1638257402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=13onQ3IA5EQY88J6Vaca1eQEjXb4qIMFUBBLczovtW4=;
 b=GMJhxqEyrcxyS0YYxfsuL/ENre5PkpNdKvQohKuQPwQXba0Nfq1u5uaRJU2CyK891/P6HB
 GyYJsQFPikJ8GT4ymeq6MDFXbfH6qhE5gJtKaeL+k79Awm2OkMiFETdBoz1d/vE8v6x8FO
 A88KiXnwKITe2LggVA0rfv0dB4T1AlA=
Received: from [192.168.1.5] (ip4d16315a.dynamic.kabel-deutschland.de
 [77.22.49.90])
 by v220200749773122244.hotsrv.de (OpenSMTPD) with ESMTPSA id 61bef4ef
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <buildroot@buildroot.org>; Tue, 30 Nov 2021 07:30:02 +0000 (UTC)
To: buildroot@buildroot.org
From: Michael Taubert <info@arachnodroid.de>
Message-ID: <f3e486d3-af27-1c7c-7022-c2a733216a7f@arachnodroid.de>
Date: Tue, 30 Nov 2021 08:30:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Buildroot] Mesa3D / RPi4 - Failed to open bo 1: Permission denied
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi list!

I've switched from branch 2021.02.x to 2021.08.x and got a problem with 
Mesa3D. Mesa3D does not build with DRI3 support by default, which leads 
into the error message 'Failed to open bo 1: Permission denied' when 
running glxgears -info.

Earlier this year I already got caught by this problem, but could work 
around by enabling DRI SWRAST driver for Mesa3D. But this driver is not 
available anymore. The meson-log says, it's not built with DRI3:

buildroot-rpi4/output/host/lib/pkgconfig -Dgallium-omx=disabled 
-Dpower8=disabled -Dllvm=disabled -Dgallium-opencl=disabled -Dglx=dri 
-Dgallium-xa=disabled -Dgallium-vc4-neon=auto -Dshared-glapi=enabled 
-Dgallium-drivers=v3d,vc4 -Dgallium-extra-hud=true -Ddri-drivers= 
-Ddri3=disabled ...

This is the output of glxgears:

root@buildroot:~# glxgears -info
Failed to open bo 1: Permission denied
Running synchronized to the vertical refresh.  The framerate should be
approximately the same as the monitor refresh rate.
GL_RENDERER   = V3D 4.2
GL_VERSION    = 2.1 Mesa 21.1.6
GL_VENDOR     = Broadcom

It runs, but the screen stays black.

When I change mesa3d.mk to this:

ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
MESA3D_CONF_OPTS += \
         -Ddri-drivers= -Ddri3=enabled
else
...

It works again and the error disappears. How am I supposed to enable 
DRI3 support for my RPI4 now?

Thanks in advance.

Best regards,
Michael
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
