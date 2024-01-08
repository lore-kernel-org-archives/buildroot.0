Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F377C3DA6E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 10:56:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CED5860F6B;
	Mon,  8 Jan 2024 10:56:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CED5860F6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0oEBlhp2nYVL; Mon,  8 Jan 2024 10:56:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E5E160F40;
	Mon,  8 Jan 2024 10:56:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E5E160F40
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E95FC1BF31D
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 10:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BED4460F6B
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 10:56:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BED4460F6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qlfm69kjTe8v for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 10:56:07 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B466960F40
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 10:56:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B466960F40
Received: by mail.gandi.net (Postfix) with ESMTPSA id 78B1560016;
 Mon,  8 Jan 2024 10:56:03 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rMnIY-0072ZA-2j;
 Mon, 08 Jan 2024 11:56:02 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20231223145109.DC63E87D3E@busybox.osuosl.org>
Date: Mon, 08 Jan 2024 11:56:02 +0100
In-Reply-To: <20231223145109.DC63E87D3E@busybox.osuosl.org> (Thomas Petazzoni
 via buildroot's message of "Sat, 23 Dec 2023 15:46:58 +0100")
Message-ID: <87plycxfel.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [git commit] package/wlroots: add hwdata and
 hwdata_pnp_ids as a dependency
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=50eed2060ae6a35be257a8773b8e217a623eb29e
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Since upstream commit
 > eec95e3d5e1a4f2e13b1f6b34cc287475ca57daf ("backend/drm: use pnp.ids to
 > fetch EDID data"), the pnp.ids file from hwdata is parsed at build
 > time to generate a C source file. As per backend/drm/meson.build:

 > hwdata = dependency('hwdata', required: false, native: true)
 > if hwdata.found()
 > 	hwdata_dir = hwdata.get_variable(pkgconfig: 'pkgdatadir')
 > 	pnp_ids = files(hwdata_dir / 'pnp.ids')
 > else
 > 	pnp_ids = files('/usr/share/hwdata/pnp.ids')
 > endif

 > This is only needed when the DRM backend of wlroots is enabled, but
 > currently, Buildroot enables this backend unconditionally.

 > This failure can be reproduced using the following defconfig:

 > BR2_x86_64=y
 > BR2_TOOLCHAIN_EXTERNAL=y
 > BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 > BR2_PACKAGE_MESA3D=y
 > BR2_PACKAGE_MESA3D_OSMESA_GALLIUM=y
 > BR2_PACKAGE_MESA3D_OPENGL_EGL=y
 > BR2_PACKAGE_MESA3D_OPENGL_ES=y
 > BR2_PACKAGE_WLROOTS=y

 > The issue was not caught in the autobuilders because the last
 > successful build of a configuration that includes wlroots dates back
 > from 2022-05-05, at which time Buildroot had wlroots 0.15.1.

 > This change in wlroots was introduced in wlroots 0.16.0, which means
 > that it's only since Buildroot bumped from 0.15.1 to 0.16.2 in
 > d6279bc82c02b43c9a2f28c36639e092b9e9e08b ("package/wlroots: bump to
 > version 0.16.2") that the issue occurs. This commit is not yet in any
 > tagged release, so there is no need to backport this fix.

Ehh, git describe --contains d6279bc82c02b43c9a2f28c36639e092b9e9e08b
2023.11-rc1~361

So I've backported it to 2023.11.x as well, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
