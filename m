Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CECBEC3DA7F
	for <buildroot@archiver.kernel.org>; Fri,  2 Aug 2024 21:08:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F12760697;
	Fri,  2 Aug 2024 21:08:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JoaUuRXW-Ag6; Fri,  2 Aug 2024 21:08:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55D57605C5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55D57605C5;
	Fri,  2 Aug 2024 21:08:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 686681BF3FF
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 21:08:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F99E82064
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 21:08:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wpaU5ajVXzp6 for <buildroot@lists.busybox.net>;
 Fri,  2 Aug 2024 21:08:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0A9588204E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A9588204E
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0A9588204E
 for <buildroot@buildroot.org>; Fri,  2 Aug 2024 21:08:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DB3FE1BF204;
 Fri,  2 Aug 2024 21:08:32 +0000 (UTC)
Date: Fri, 2 Aug 2024 23:08:32 +0200
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20240802230832.27edaf28@windsurf>
In-Reply-To: <20240627193335.4069574-4-aperez@igalia.com>
References: <20240208095531.99049-1-aperez@igalia.com>
 <20240627193335.4069574-4-aperez@igalia.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722632914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cpk9hs0GdYKjfFPESaat6A3ONd0rqQ45MxuAnKLkcWk=;
 b=AkrzaHRj1633LmbbeZoIDqQSDbczQm1x8gsRQWqMDpbe09R2hbNDBaL5dETcI4SEEHyuep
 9zS0X2xefE89tn1GR6FVhH9B0RxqaJGURhoaXWOLU8Ei5hAo9yaG+GmuhAmhOl8FGDtEA1
 n+cfwaR3i4xpZiD7Un0BlJ1IbQERFT8Q3d/1zHqWLHA6gwBSQi1u+d+OaRLB9x5PngiAOn
 7HThW4csAebvcyN1z3d8cQkvBM95gu896ejk7h+/rC0kBy+GMRwcYui/nabXR0WzSVUUEM
 m7SksY3KHEAH9eN2fPZrA7IU6SO1XZuRG+xtWt3knpQ8shgix3BOmemG4bZGSA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AkrzaHRj
Subject: Re: [Buildroot] [PATCH v2 3/4] package/wpewebkit: do not depend on
 wpebackend-fdo
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Thu, 27 Jun 2024 22:33:31 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> Remove the wpewebkit package dependency on wpebackend-fdo, as it is not
> needed at all during the build. What is needed is a WPE backend at run
> time, which may be provided by wpebackend-fdo or wpebackend-rdk. To
> reflect this, we make wpewebkit depend on either being selected.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  package/wpewebkit/Config.in    | 9 ++++-----
>  package/wpewebkit/wpewebkit.mk | 2 +-
>  2 files changed, 5 insertions(+), 6 deletions(-)
> 
> ---
> v1 -> v2:
> - Remove openjpeg dependency, which has been dropped in 2.44.x
> 
> diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
> index e4b0320e1da..c55b827e2b8 100644
> --- a/package/wpewebkit/Config.in
> +++ b/package/wpewebkit/Config.in
> @@ -24,11 +24,11 @@ comment "wpewebkit needs a toolchain w/ C++, wchar, threads, dynamic library, gc
>  		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_10 \
>  		|| !BR2_HOST_GCC_AT_LEAST_4_9
>  
> -comment "wpewebkit needs an OpenGL ES w/ EGL-capable Wayland backend"
> +comment "wpewebkit needs an OpenGL ES w/ EGL-capable implementation and an WPE backend"
>  	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
>  	depends on !BR2_BINFMT_FLAT
> -	depends on !BR2_PACKAGE_HAS_LIBGLES || !BR2_PACKAGE_HAS_LIBEGL \
> -		|| !BR2_PACKAGE_HAS_LIBEGL_WAYLAND
> +	depends on !BR2_PACKAGE_HAS_LIBGLES || !BR2_PACKAGE_HAS_LIBEGL
> +	depends on !BR2_PACKAGE_WPEBACKEND_FDO && !BR2_PACKAGE_WPEBACKEND_RDK

I think we will want to select one, see below.

>  
>  config BR2_PACKAGE_WPEWEBKIT
>  	bool "wpewebkit"
> @@ -41,8 +41,8 @@ config BR2_PACKAGE_WPEWEBKIT
>  	depends on BR2_USE_WCHAR # icu, libsoup3
>  	depends on BR2_PACKAGE_HAS_LIBGLES # libepoxy
>  	depends on BR2_PACKAGE_HAS_LIBEGL # libepoxy
> -	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND # wpebackend-fdo
>  	depends on BR2_PACKAGE_WPEWEBKIT_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_WPEBACKEND_FDO || BR2_PACKAGE_WPEBACKEND_RDK

Please use instead:

	select BR2_PACKAGE_WPEBACKEND_FDO if !BR2_PACKAGE_WPEBACKEND_RDK # runtime

this will ensure that at least one is selected, taking by default
wpebackend-fdo, but allowing the user to enable wpebackend-rdk (and
disable wpebackend-fdo).

Also the "# runtime" comment is important, because it explains why an
option is selected, but not added to the build dependencies of the
package.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
