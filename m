Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D32E8FDA2
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 14:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBEBD60D50;
	Fri, 26 Dec 2025 14:35:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cgw8QWDA8jm2; Fri, 26 Dec 2025 14:35:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26BB7606F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766759700;
	bh=4CGjrJ4O3CfDxNecMTC0neyqkwwiKDZLb7M1xE4R7M0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=reRVpDx7p41ndN572Q3HFWjfYzmTigUsRPIppMhPg9fnbYVqnNwoEU4sJdyE853da
	 SCgYkTYG7ZbNVUru7Fi8mOQ13bS2IWC6ZDdU7TLJT1vr9uaP8v3EXtZEfek5A6Ryqz
	 aR0qz6FYoJdCGsgVNUwhoJPzsReo5ordIfTWKu9IgTwVlELgUe+cPVxuSjG10Y27gC
	 yjKrBWnkeXjf2PfTAaDlBP2dpNkh9sl6FduH983mfL8q9WhK+Bu5TneXUH+hGrS9LH
	 SgGsckLURWEb1noJR2ss2PWLBNsGSaRxH7+CBm33jYyESj2EeiXC9SL6BWD8CHMx8B
	 rc8yCiNTnGLRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26BB7606F6;
	Fri, 26 Dec 2025 14:35:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 16FF7B9
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 14:34:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 14940407C2
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 14:34:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P11uXFUy827h for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 14:34:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D5CA140763
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5CA140763
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D5CA140763
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 14:34:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 52C515FFBA;
 Fri, 26 Dec 2025 15:34:40 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 26 Dec 2025 15:34:40 +0100
MIME-Version: 1.0
Date: Fri, 26 Dec 2025 15:34:40 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Alexander Clouter
 <alex+buildroot@digriz.org.uk>, Jean Burgat <jeanburgat33@gmail.com>,
 Alessandro Partesotti <a.partesotti@gmail.com>, Prabhu Sannachi
 <prabhu.sannachi@collins.com>, Denis Bodor <lefinnois@lefinnois.net>, James
 Hilliard <james.hilliard1@gmail.com>, Jianhui Zhao <zhaojh329@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, James Knight
 <james.knight@collins.com>, Simon Dawson <spdawson@gmail.com>, Romain Naour
 <romain.naour@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Michael
 Vetter <jubalh@iodoru.org>
In-Reply-To: <20251207144243.3696572-9-bernd@kuhls.net>
References: <20251207144243.3696572-1-bernd@kuhls.net>
 <20251207144243.3696572-9-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <7e1872327287e8f538a1edd5f4632b08@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766759695;
 bh=hiYCeLniJbRiRSiRlMRIynyAR3ayo/C/9AekGGsQN5o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fbdCK3MCHrfZs5zyHDo16kEGAtTu3GaRbKb+lhbNM36wveWTU+bUCiadZe5OQzj59
 7RsA1L3yP05XvR/UD59Y5H0u7QBpIX84pTtHvFYYjL9qLy2JlVAgWSpYk6GHO65iql
 gpDX/8r1O2w2l2GLRcGYv/pjsMYdU2rFrH8UWZJXib2V43O//xXZN7H6PLCUn50OnF
 m7858YE1xdO4EdRNNIY9Zs41SZuOltiV9USYpsO9MhH/spk9dEAouSQeLGx8AIftH3
 /smqa/4XtgGAKM3B0YPNMyTMyg78e6mRw0JPmyh+7U5xAbcsHG+E3ahi3gXMa9dvTK
 BgWNF8pDtrkXg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fbdCK3MC
Subject: Re: [Buildroot] [PATCH/next 09/33] package/piglit: bump version
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

Thanks for the patch.

On 07/12/2025 15:42, Bernd Kuhls wrote:
> Disabled vulkan tests added by upstream commit:
> https://gitlab.freedesktop.org/mesa/piglit/-/commit/2519c330fba55ce6efd0dbee07aa67c703124d4f
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/piglit/piglit.hash | 2 +-
>  package/piglit/piglit.mk   | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/piglit/piglit.hash b/package/piglit/piglit.hash
> index 2c0b6aa52a..b6d3e46908 100644
> --- a/package/piglit/piglit.hash
> +++ b/package/piglit/piglit.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated
> -sha256  
> ba4d1839038905f3833e9ab23b385913e08d552533dd222cc203c79c10e09918  
> piglit-2affee53f3ad7a96f5b397a2b6d6408af8a374b0-git4.tar.gz
> +sha256  
> b55f4b7747433bffb64a1782d35a081e96224d38e111f9c13d0e69ace67b9464  
> piglit-3a2ac019d7d4e7cc6a95aafb033c79bec9405d12-git4.tar.gz
>  sha256  
> dcc398730859aee7cc1d6aa57f526f8d181b47bb3a49830e85b5723d5bc2c3bc  
> COPYING
>  sha256  
> 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  
> licences/GPL-2
>  sha256  
> 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  
> licences/GPL-3
> diff --git a/package/piglit/piglit.mk b/package/piglit/piglit.mk
> index 4d17405d10..b6270ab471 100644
> --- a/package/piglit/piglit.mk
> +++ b/package/piglit/piglit.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -PIGLIT_VERSION = 2affee53f3ad7a96f5b397a2b6d6408af8a374b0
> +PIGLIT_VERSION = 3a2ac019d7d4e7cc6a95aafb033c79bec9405d12

While testing this new version, I found the same issue
I reported in:
https://patchwork.ozlabs.org/project/buildroot/patch/20251022-piglit-v1-1-9c1a52af5650@gmail.com/

I've seen that piglit enable X11 by default
on Linux. Piglit introduced PIGLIT_USE_X11 in:
https://gitlab.freedesktop.org/mesa/piglit/-/commit/d958b70d1fc5c2ee039363d862b14ca498a50e82

So it might be needed to add -DPIGLIT_USE_X11=ON/OFF in
the "ifeq ($(BR2_PACKAGE_XORG7),y)" block.

You can reproduce with:

cat >.config <<EOF
BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_PIGLIT=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_WESTON=y
BR2_PACKAGE_PYTHON3=y
EOF
make olddefconfig
make piglit

Could you have a look, please?

>  PIGLIT_SITE = https://gitlab.freedesktop.org/mesa/piglit.git
>  PIGLIT_SITE_METHOD = git
>  PIGLIT_LICENSE = MIT (code), \
> @@ -29,6 +29,7 @@ PIGLIT_DEPENDENCIES = host-pkgconf \
>  PIGLIT_CONF_OPTS += \
>  	-DPIGLIT_USE_WAFFLE=ON \
>  	-DPIGLIT_BUILD_CL_TESTS=OFF \
> +	-DPIGLIT_BUILD_VK_TESTS=OFF \
>  	-DPIGLIT_BUILD_WGL_TESTS=OFF \
>  	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python3
> 
> --
> 2.47.3

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
