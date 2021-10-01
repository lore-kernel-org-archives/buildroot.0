Return-Path: <SRS0=lBh3=OV=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C6C9C433EF
	for <buildroot@archiver.kernel.org>; Fri,  1 Oct 2021 14:19:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20BE961A6F
	for <buildroot@archiver.kernel.org>; Fri,  1 Oct 2021 14:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 20BE961A6F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0C2584437;
	Fri,  1 Oct 2021 14:18:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jztEv7lAgs9m; Fri,  1 Oct 2021 14:18:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27F6A84438;
	Fri,  1 Oct 2021 14:18:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 019361BF424
 for <buildroot@lists.busybox.net>; Fri,  1 Oct 2021 14:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5A206061B
 for <buildroot@lists.busybox.net>; Fri,  1 Oct 2021 14:18:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vip_wvc6MfoN for <buildroot@lists.busybox.net>;
 Fri,  1 Oct 2021 14:18:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CB96B605E8
 for <buildroot@buildroot.org>; Fri,  1 Oct 2021 14:18:55 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 53D5C24000E;
 Fri,  1 Oct 2021 14:18:53 +0000 (UTC)
Date: Fri, 1 Oct 2021 16:18:52 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Kamel Bouhara <kamel.bouhara@bootlin.com>
Message-ID: <20211001161852.5e0e5a7e@windsurf>
In-Reply-To: <20210928223754.3398867-6-kamel.bouhara@bootlin.com>
References: <20210928223754.3398867-1-kamel.bouhara@bootlin.com>
 <20210928223754.3398867-6-kamel.bouhara@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 6/7] package/kmscube: use libgbm virtual
 package
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 29 Sep 2021 00:37:53 +0200
Kamel Bouhara <kamel.bouhara@bootlin.com> wrote:

> diff --git a/package/kmscube/Config.in b/package/kmscube/Config.in
> index b6ad305bfb..3876f93491 100644
> --- a/package/kmscube/Config.in
> +++ b/package/kmscube/Config.in
> @@ -1,9 +1,19 @@
>  config BR2_PACKAGE_KMSCUBE
>  	bool "kmscube"
> -	# requires libgbm from mesa3d
> -	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL
> -	depends on BR2_PACKAGE_MESA3D_OPENGL_ES
> +	depends on BR2_PACKAGE_HAS_LIBEGL
> +	depends on BR2_PACKAGE_HAS_LIBGBM
> +	depends on BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT
> +	depends on BR2_PACKAGE_HAS_LIBGLES
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
> +	select BR2_PACKAGE_LIBDRM
>  	help
>  	  kmscube is an application to test kms/drm drivers.
>  
> -	  https://gitlab.freedesktop.org/mesa/kmscube
> +	  https://cgit.freedesktop.org/mesa/kmscube/
> +
> +comment "kmscube needs EGL, GBM and OpenGL ES, and a toolchain w/ thread support"
> +	depends on BR2_PACKAGE_HAS_LIBEGL
> +	depends on BR2_PACKAGE_HAS_LIBGBM
> +	depends on BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT
> +	depends on BR2_PACKAGE_HAS_LIBGLES
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS

This should be:

	depends on !BR2_PACKAGE_HAS_LIBEGL || !BR2_PACKAGE_HAS_LIBGBM || !BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT || !depends on BR2_PACKAGE_HAS_LIBGLES || !BR2_TOOLCHAIN_HAS_THREADS

Indeed, in your current implementation, the comment will only show up
if we have EGL, gbm, OpenGLES available but threads are not available.
This makes a comment suggesting to enable EGL, GBM and OpenGL ES a bit
useless.

Instead what we want is to show the comment if EGL is missing, or if
GBM is missing, or if OpenGL ES is missing, or if threads are missing.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
