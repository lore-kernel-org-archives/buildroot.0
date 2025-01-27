Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE00C02188
	for <buildroot@archiver.kernel.org>; Mon, 27 Jan 2025 20:51:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6FC3606D7;
	Mon, 27 Jan 2025 20:51:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q1IFL9F6x0aB; Mon, 27 Jan 2025 20:51:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCB67606E9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCB67606E9;
	Mon, 27 Jan 2025 20:51:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CD7394A
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 20:51:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7945D606D7
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 20:51:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GABtu6U93evF for <buildroot@buildroot.org>;
 Mon, 27 Jan 2025 20:51:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B5CAA60600
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5CAA60600
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B5CAA60600
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 20:51:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 20E4213F86E;
 Mon, 27 Jan 2025 21:50:52 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:51268])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 27 Jan 2025 21:50:52 +0100
MIME-Version: 1.0
Date: Mon, 27 Jan 2025 21:50:52 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Adam Duskett
 <adam.duskett@amarulasolutions.com>, Daniel Lang <dalang@gmx.at>, Eric Le
 Bihan <eric.le.bihan.dev@free.fr>, Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
In-Reply-To: <20250118083837.2883279-5-bernd@kuhls.net>
References: <20250118083837.2883279-1-bernd@kuhls.net>
 <20250118083837.2883279-5-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.9
Message-ID: <b91859d9482544da56b21180e00a3d19@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1738011058;
 bh=hCenml9niqIi6KjuaQOOtKoYHaIbYdhR4uzblpf/BoI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jZmFvh/4tEcM7W04aEhQ0SKHbIUmu2TYmxoD7gTkVCquGJgp6DWASL6kOXhJHd1g6
 qNygatai/OP8r9PmV9zvys6NDAabUeGNn1zC9rCiOu6S77kHRtZGBQGdYIKR6pET2X
 ZiX3OXJq8PDRgcaEIIYwCoProi1Atl8EkNqFwrkuWIz11kIMgxwhkXlgYXKEKWmmMM
 8sUoL+WhUgRmfteNikhS7gpc6T+Ugr1N2skHYDEPpDeiZe3+8D3WaNIXCqMAQEv0oA
 REfO+nWSeoeSnU7e1zIazwBAk1wIL1tQ9Qo0ZPyBuYjI8WHamVeQ7Lf+HcWcPVZGy/
 ieYfWboSLQKSA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jZmFvh/4
Subject: Re: [Buildroot] [PATCH v4 5/6] package/{mesa3d,
 mesa3d-headers}: bump version to 24.3.3
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

Thank you for the patch.

On 18/01/2025 09:38, Bernd Kuhls wrote:
[...]
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index ce460c4475..bd46d4b893 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
[...]
> @@ -251,12 +261,32 @@ endif
>  ifeq ($(BR2_PACKAGE_LIBGLVND),y)
>  ifneq 
> ($(BR2_PACKAGE_MESA3D_OPENGL_GLX)$(BR2_PACKAGE_MESA3D_OPENGL_EGL),)
>  MESA3D_DEPENDENCIES += libglvnd
> -MESA3D_CONF_OPTS += -Dglvnd=true
> +MESA3D_CONF_OPTS += -Dglvnd=enabled
>  else
> -MESA3D_CONF_OPTS += -Dglvnd=false
> +MESA3D_CONF_OPTS += -Dglvnd=disabled
>  endif
>  else
> -MESA3D_CONF_OPTS += -Dglvnd=false
> +MESA3D_CONF_OPTS += -Dglvnd=disabled
>  endif
> 

Could you add a comment here, that host-mesa3d is needed by mesa3d
only when the Iris Gallium driver is enabled, please?
This will give a more info on the choice of config options here.

> +HOST_MESA3D_CONF_OPTS = \
> +	-Dglvnd=disabled \
> +	-Dgallium-drivers=iris \
> +	-Dgallium-vdpau=disabled \
> +	-Dplatforms= \
> +	-Dglx=disabled \
> +	-Dvulkan-drivers=""
> +
> +HOST_MESA3D_DEPENDENCIES = \
> +	host-libclc \
> +	host-libdrm \
> +	host-python-mako \
> +	host-python-pyyaml \
> +	host-spirv-tools

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
