Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE8F7C19F29
	for <buildroot@archiver.kernel.org>; Sat, 30 Jul 2022 16:23:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69A8761033;
	Sat, 30 Jul 2022 16:23:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69A8761033
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6_fmfr1JQsPd; Sat, 30 Jul 2022 16:23:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E91A660784;
	Sat, 30 Jul 2022 16:23:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E91A660784
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F17D71BF84C
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 16:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CCA5460784
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 16:23:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCA5460784
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QtfKTd16QFXd for <buildroot@lists.busybox.net>;
 Sat, 30 Jul 2022 16:23:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9BB7605D5
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A9BB7605D5
 for <buildroot@uclibc.org>; Sat, 30 Jul 2022 16:23:41 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1oHpFa-00080h-GZ
 for buildroot@uclibc.org; Sat, 30 Jul 2022 18:23:38 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 30 Jul 2022 18:23:20 +0200
Message-ID: <pan$781e4$7f830434$f8b8178c$4f096736@ID-313208.user.individual.net>
References: <20210810120134.3972324-1-fontaine.fabrice@gmail.com>
 <20210812234247.3618da82__12747.8516822279$1628804602$gmane$org@windsurf>
Mime-Version: 1.0
User-Agent: Pan/0.148 (Chamechaude; a70bd74)
Subject: Re: [Buildroot] [PATCH 1/1] package/flatbuffers: fix locale
 independent on musl
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

Am Thu, 12 Aug 2021 23:42:47 +0200 schrieb Thomas Petazzoni:

> I have seen the feedback from upstream that this workaround potentially
> breaks bionic and BSD systems, but as we don't care about these in
> Buildroot, I applied your patch to master as a work-around. Hopefully
> upstream will implement a better/long-term solution.

Hi Thomas,

unfortunately upstream rejected the patch without an alternative 
solution. Now I stumbled across the bug while building kodi with a non-
local uClibc toolchain and being unable to fix the flatbuffers headers.

This is the defconfig:

BR2_x86_64=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_KODI=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_PYTHON3_PY_ONLY=y

Would it be acceptable to include this fix in the kodi package
https://github.com/bkuhls/buildroot/commit/
fa6d0d742d970836ef81b8ecbf5c1885d4be94dc

although the problem really exists in the flatbuffer package which does 
not store the result of its configure checks for strtoll_l and strtoull_l?

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
