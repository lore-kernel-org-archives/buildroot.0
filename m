Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F5EFC25B4F
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 18:08:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 352E960665;
	Sun, 12 May 2024 18:08:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dMijhUEblp95; Sun, 12 May 2024 18:08:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A9E260750
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A9E260750;
	Sun, 12 May 2024 18:08:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8393F1BF2F3
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 18:08:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7068A410A6
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 18:08:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sj7AGg41JcZR for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 18:08:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 00E1740801
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00E1740801
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 00E1740801
 for <buildroot@buildroot.org>; Sun, 12 May 2024 18:07:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id CDDC813F88D;
 Sun, 12 May 2024 20:07:55 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 12 May 2024 20:07:55 +0200
Date: Sun, 12 May 2024 20:07:55 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <ZkEFe-dn3GSQ2bdK@landeda>
References: <20240512175117.2096550-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240512175117.2096550-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1715537277;
 bh=jhUE/Atv/yUlIjHxirRHfFi3gn1R2dZ6Uqma3fL8wN0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jxMQU6xjYfta5o+9tHAJsiBpB6+pIz61Uv6tdQkoFE/1E23mSlKiQ42XcQSf3ZSST
 8xJKUAXU6Wh/9Lxpo5b4UwKRvC6XkkQMn4vP4JCC70DOWpAML3RG+mU7qnEdDyOIIt
 cmE7XyhsN7Lfas5eIy0iMD+AS+hLhcL1iPcAvgAkS8Pv0C/OiK4KdL7w7+vmRMb4kG
 T0YaySi5U4LLO41HbnV/U+fI396CN39eTmyUwGVhksmpvOGWyBlvPv2891DDHRgGWc
 tVZoolqVEaXyJ1hS8aqyDXheyld1OYR1Cf4x4pFl2HcLIx3YcJ4FIG/WTju3vRN+3w
 5u+2bHgFt9HxA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=jxMQU6xj
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi: Link to libiconv when
 needed
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2024-05-12 19:51 +0200, Bernd Kuhls spake thusly:
> Fixes build error
> 
> /home/wbx/buildroot/output/host/lib/gcc/aarch64-buildroot-linux-uclibc/12.3.0/../../../../aarch64-buildroot-linux-uclibc/bin/ld:
> build/utils/utils.a(CharsetConverter.cpp.o): undefined reference to symbol 'libiconv_open'
> /home/wbx/buildroot/output/host/lib/gcc/aarch64-buildroot-linux-uclibc/12.3.0/../../../../aarch64-buildroot-linux-uclibc/bin/ld:
> /home/wbx/buildroot/output/host/aarch64-buildroot-linux-uclibc/sysroot/usr/lib64/libiconv.so.2:
> error adding symbols: DSO missing from command line
> 
> reported by Waldemar:
> http://lists.busybox.net/pipermail/buildroot/2024-May/690952.html
> 
> Reproduced and fixed the build error using this defconfig:
> 
> BR2_x86_64=y
> BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
> BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PER_PACKAGE_DIRECTORIES=y
> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> BR2_PACKAGE_KODI=y
> BR2_PACKAGE_MESA3D=y
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS=y
> BR2_PACKAGE_MESA3D_OPENGL_EGL=y
> BR2_PACKAGE_MESA3D_OPENGL_ES=y
> BR2_PACKAGE_PYTHON3=y
> BR2_PACKAGE_PYTHON3_PY_ONLY=y
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/kodi/kodi.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
> index 94cab237dc..301330a574 100644
> --- a/package/kodi/kodi.mk
> +++ b/package/kodi/kodi.mk
> @@ -138,6 +138,7 @@ endif
>  KODI_CONF_OPTS += -DCORE_PLATFORM_NAME="$(KODI_CORE_PLATFORM_NAME)"
>  
>  ifeq ($(BR2_ENABLE_LOCALE),)
> +KODI_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-liconv

I don't understand how this is related: the defconfig you provide in the
commit log does _not_ have BR2_ENABLE_LOCALE=y, so it can't exercise
this code-path...

Regards,
Yann E. MORIN.

>  KODI_DEPENDENCIES += libiconv
>  endif
>  
> -- 
> 2.39.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
