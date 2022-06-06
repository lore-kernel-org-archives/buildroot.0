Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC85C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 13:17:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF97684031;
	Mon,  6 Jun 2022 13:17:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RF2YDZWO_sMw; Mon,  6 Jun 2022 13:17:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64EB983FF5;
	Mon,  6 Jun 2022 13:17:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6638C1BF2BC
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 13:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 54FC040992
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 13:17:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iyvkS9XPlJ0P for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 13:17:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0BBDE40931
 for <buildroot@uclibc.org>; Mon,  6 Jun 2022 13:17:12 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1nyCbW-0002bT-Rh
 for buildroot@uclibc.org; Mon, 06 Jun 2022 15:17:10 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 06 Jun 2022 15:16:02 +0200
Message-ID: <pan$80153$73641583$cd092896$e5be1ffe@ID-313208.user.individual.net>
References: <20220514175612.2510884-1-bernd.kuhls@t-online.de>
 <20220514175612.2510884-4-bernd.kuhls@t-online.de>
 <20220606000120.052ee137__6105.38827474869$1654466507$gmane$org@windsurf>
Mime-Version: 1.0
User-Agent: Pan/0.148 (Chamechaude; a70bd74)
Subject: Re: [Buildroot] [PATCH 04/19]
 package/x11r7/xdriver_xf86-video-amdgpu: needs libgbm
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

Hi Thomas,

Am Mon, 6 Jun 2022 00:01:20 +0200 schrieb Thomas Petazzoni via buildroot:

> Could you clarify if this is a fix, or an improvement?

before answering your question I would like to say that the dependency 
situation in package/x11r7/ is a bit messy imho. Fixing autobuilder bugs, 
and there were lots of them in the mesa/x11 area, made sure that we have 
all necessary dependencies in place but, as in this case, we added 
sometimes too many dependencies, did not notice when bumping a package 
that its dependencies were loosened, are, as in this case, did not use 
the new libgbm virtual package in all places needed.

> If I understand correctly the discussion at
> http://lists.busybox.net/pipermail/buildroot/2022-April/641451.html,
> this driver used to require mesa3d+dri+egl (which guaranteed to provide
> libgbm), but now only requires libgbm.

Here we have such a current example for too many dependencies due to the 
addition of the virtual libgbm package which was added to buildroot long 
after this package was added.
Depending on mesa3d+dri+egl did the trick in earlier days ;) Upstream did 
not change its configure script: https://cgit.freedesktop.org/xorg/driver/
xf86-video-amdgpu/log/configure.ac

So this patch series can be considered as a follow-up to the addition of 
libgbm

>>  XDRIVER_XF86_VIDEO_AMDGPU_DEPENDENCIES = \
>>  	libdrm \
>> +	libgbm \
>>  	xlib_libXcomposite \
>>  	xorgproto \ xserver_xorg-server
> 
> Interesting, we had a Config.in dependency on mesa, but it was not a
> build dependency, but libgbm is?

Mesa3d, and therefore libgbm, is pulled in by the xserver_xorg-server 
package, but to make clear this package depends on libgbm I added that 
dependency:
https://gitlab.freedesktop.org/xorg/driver/xf86-video-amdgpu/-/blob/
master/configure.ac#L75

Regards, Bernd


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
