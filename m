Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E3D5C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 13:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB9D46119D;
	Tue,  6 Feb 2024 13:58:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB9D46119D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fJCXhrz-RvyU; Tue,  6 Feb 2024 13:58:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0AFE61122;
	Tue,  6 Feb 2024 13:58:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0AFE61122
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0BD721BF5AD
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 13:58:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EDB0F82120
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 13:58:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BKwbucQCXPdN for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 13:58:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.130.47;
 helo=dd5108.kasserver.com; envelope-from=dev@andin.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4C83F8211E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C83F8211E
Received: from dd5108.kasserver.com (dd5108.kasserver.com [85.13.130.47])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4C83F8211E
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 13:58:23 +0000 (UTC)
Received: from [192.168.178.43] (ipb21bd56e.dynamic.kabel-deutschland.de
 [178.27.213.110])
 by dd5108.kasserver.com (Postfix) with ESMTPSA id CC0CA52444E0;
 Tue,  6 Feb 2024 14:58:20 +0100 (CET)
Message-ID: <d3a04074-1f6f-4e45-944d-006ec26ab9f3@andin.de>
Date: Tue, 6 Feb 2024 14:58:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, de-DE
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20240114174823.2732695-1-bernd@kuhls.net>
 <20240114174823.2732695-2-bernd@kuhls.net>
From: Andreas Naumann <dev@andin.de>
In-Reply-To: <20240114174823.2732695-2-bernd@kuhls.net>
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=andin.de; 
 s=kas202309151109; t=1707227900;
 bh=hK9jrVeF7edWKTVSJ2gy4wLVihqjDHVe9n6KYa3cMhE=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=KfkVeMfLQCgMheuzI/2yCvCWflBgO5iQudPQzyywW9mOfiVj6peHBySaXq9KbBP2/
 3A8ocNZufwCv1XdDAwcHQxbwmJgI3erOWOvzfWMxGCxHPS5XiKmjw8UCK/h8JsuraK
 mHgrIG8cXMNV4Xo7AJoxZdBP4n5LkTuXxavz8ACjy6yFGJ8KBBLk/btOoABq7lxALT
 C4eS08x3Xwwlw+7rG6P+n/5Iyd7HEo1y9kt+y6ZxH9D51cusa6i1U8fb7wxHCTrWds
 ywXCXfdZBVqpMu0Yqu0z895P4H1Y/S346/+ka8nV/P9GY7aFcWqzaaIYPPu88WGaBs
 KpEdJobKPXq6Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=andin.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=andin.de header.i=@andin.de header.a=rsa-sha256
 header.s=kas202309151109 header.b=KfkVeMfL
Subject: Re: [Buildroot] [PATCH 2/2] package/glm: bump version
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

Hi,

Am 14.01.24 um 18:48 schrieb Bernd Kuhls:
> Fixes build error with packages depending on glm, like kodi-screensaver*
> and kodi-visualisation*:
> 
> CMake Error at /home/buildroot/br2/output/per-package/kodi-screensaver-asteroids/host/share/cmake-3.28/Modules/FindPackageHandleStandardArgs.cmake:230 (message):
>    Could NOT find glm (missing: GLM_INCLUDE_DIR)
> 
> Since glm release 0.9.9.8 (bumped in buildroot with commit
> 01ad11343172ea698e4dcc1c64cb02ce26671e49) many fixes were added for its
> cmake support: https://github.com/g-truc/glm/pull/1054
> 
> Instead of backporting all of them we bump to latest git HEAD.
> Preparations for glm 1.0.0 are underway:
> https://github.com/g-truc/glm/pull/1180

I just now find this patch, after having sent one bumping glm to tag 
1.0.0 (which is only about 2 weeks old). However, since it's a tag, I 
suggest my patch supersedes this one.

regards,
Andreas

> 
> Fixes build error with this defconfig:
> 
> BR2_x86_64=y
> BR2_x86_x86_64_v4=y
> BR2_BINUTILS_VERSION_2_41_X=y
> BR2_GCC_VERSION_13_X=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PER_PACKAGE_DIRECTORIES=y
> BR2_INIT_NONE=y
> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> BR2_PACKAGE_KODI=y
> BR2_PACKAGE_KODI_SCREENSAVER_ASTEROIDS=y
> BR2_PACKAGE_MESA3D=y
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS=y
> BR2_PACKAGE_MESA3D_OPENGL_EGL=y
> BR2_PACKAGE_MESA3D_OPENGL_ES=y
> BR2_PACKAGE_PYTHON3=y
> BR2_PACKAGE_PYTHON3_PY_ONLY=y
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>   package/glm/glm.hash | 2 +-
>   package/glm/glm.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/glm/glm.hash b/package/glm/glm.hash
> index c4e2101604..6bc88739b3 100644
> --- a/package/glm/glm.hash
> +++ b/package/glm/glm.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  7d508ab72cb5d43227a3711420f06ff99b0a0cb63ee2f93631b162bfe1fe9592  glm-0.9.9.8.tar.gz
> +sha256  9dc8c27c2b00d44a0b9d4a619b13848f1092914e7ec60447ac3db528a8e9ba8a  glm-b06b775c1c80af51a1183c0e167f9de3b2351a79.tar.gz
>   sha256  62d2d642c7d054d4fb4c9b42faad617d6c88fcd91e317f8035aa9f277cc159c3  copying.txt
> diff --git a/package/glm/glm.mk b/package/glm/glm.mk
> index ef549931f6..92357b4fe2 100644
> --- a/package/glm/glm.mk
> +++ b/package/glm/glm.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -GLM_VERSION = 0.9.9.8
> +GLM_VERSION = b06b775c1c80af51a1183c0e167f9de3b2351a79
>   GLM_SITE = $(call github,g-truc,glm,$(GLM_VERSION))
>   GLM_LICENSE = MIT
>   GLM_LICENSE_FILES = copying.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
