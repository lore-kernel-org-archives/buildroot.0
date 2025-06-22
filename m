Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF56C7115C
	for <buildroot@archiver.kernel.org>; Sun, 22 Jun 2025 13:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3A1A8190B;
	Sun, 22 Jun 2025 13:27:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ivrFtfJsCY4Q; Sun, 22 Jun 2025 13:27:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE76F81747
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE76F81747;
	Sun, 22 Jun 2025 13:27:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A071154
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 13:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0FF4781353
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 13:27:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AojpuVDgYcnh for <buildroot@buildroot.org>;
 Sun, 22 Jun 2025 13:27:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E88D081747
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E88D081747
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E88D081747
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 13:27:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id A5193780507;
 Sun, 22 Jun 2025 15:27:18 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 22 Jun 2025 15:27:18 +0200
MIME-Version: 1.0
Date: Sun, 22 Jun 2025 15:27:18 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250622103642.1006429-1-bernd@kuhls.net>
References: <20250622103642.1006429-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <f3eacb486e1ac44dc529f7f65d15b353@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750598839;
 bh=ewV+bd6QX5UpFRbGeAH7sXXSA9VnY1hc1PiXJPZbZ0o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SVPreGWXxAI8mrS+/bzdw4cxg5sozFzR4AbtsPJZd2UE+iyVylwOyoAIT2USpAtZl
 AcCmehKTrePsUVhfak8VZDnKbu7RJITZVDxmNHN7oxkGyMzXC0u3CN4eWt0nGVqCx+
 3RIYZ8IXGanIXt1KSWsfqbo6NrjJY75X8lfebqJ/Qmxd26jlpBTD4jbKqe3rGUTJfL
 jDKK9ORDIopORGGN+rgfIDQZ8XNMccqtOjo37ziLu2hiTIAPf405qaiB0QRQq7rrbZ
 qA677HIog9/VxA6PBBtPDY657IZfXR1gXbaG1IyNLc5Ww4Twt2dukig6SbQPfR7/jj
 CxqMBUKXW1UsQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SVPreGWX
Subject: Re: [Buildroot] [PATCH 1/1] package/freeswitch: enable OpenCV4
 support only when dnn support was enabled
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

Thanks for the patch. Unfortunately, it is introducing a Kconfig error.
See below.

On 22/06/2025 12:36, Bernd Kuhls wrote:
> Fixes Kconfig warnings:
> 
>     WARNING: unmet direct dependencies detected for 
> BR2_PACKAGE_OPENCV4_LIB_OBJDETECT
>       Depends on [n]: BR2_PACKAGE_OPENCV4 [=y] && 
> !BR2_TOOLCHAIN_USES_UCLIBC [=n] && BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS 
> [=n] && BR2_TOOLCHAIN_GCC_AT_LEAST_8 [=y]
>       Selected by [y]:
>       - BR2_PACKAGE_FREESWITCH [=y] && BR2_INSTALL_LIBSTDCPP [=y] && 
> !BR2_STATIC_LIBS [=n] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_USE_MMU 
> [=y] && BR2_USE_WCHAR [=y] && BR2_PACKAGE_OPENCV4 [=y]

In the updated patch, could you add a reference to the commit which
introduced the issue, please? For example:

     Fixes:
     
https://gitlab.com/buildroot.org/buildroot/-/commit/962081259d91fea1e9a59c1af85d9a85ba45d0dd

> Reported-by: Julien Olivain <ju.o@free.fr>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/freeswitch/Config.in     | 6 +++---
>  package/freeswitch/freeswitch.mk | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/freeswitch/Config.in 
> b/package/freeswitch/Config.in
> index 4d700e549f..4282cff031 100644
> --- a/package/freeswitch/Config.in
> +++ b/package/freeswitch/Config.in
> @@ -14,9 +14,9 @@ config BR2_PACKAGE_FREESWITCH
>  	select BR2_PACKAGE_OPENCV3_LIB_HIGHGUI if BR2_PACKAGE_OPENCV3
>  	select BR2_PACKAGE_OPENCV3_LIB_IMGPROC if BR2_PACKAGE_OPENCV3
>  	select BR2_PACKAGE_OPENCV3_LIB_OBJDETECT if BR2_PACKAGE_OPENCV3
> -	select BR2_PACKAGE_OPENCV4_LIB_HIGHGUI if BR2_PACKAGE_OPENCV4
> -	select BR2_PACKAGE_OPENCV4_LIB_IMGPROC if BR2_PACKAGE_OPENCV4
> -	select BR2_PACKAGE_OPENCV4_LIB_OBJDETECT if BR2_PACKAGE_OPENCV4
> +	select BR2_PACKAGE_OPENCV4_LIB_HIGHGUI if BR2_PACKAGE_OPENCV4_LIB_DNN
> +	select BR2_PACKAGE_OPENCV4_LIB_IMGPROC if BR2_PACKAGE_OPENCV4_LIB_DNN
> +	select BR2_PACKAGE_OPENCV4_LIB_OBJDETECT if 
> BR2_PACKAGE_OPENCV4_LIB_DNN

This is introducing a recursive dependency. Generating any defconfig
produces an error:

     package/opencv4/Config.in:33:error: recursive dependency detected!
     package/opencv4/Config.in:33:	symbol BR2_PACKAGE_OPENCV4_LIB_DNN is 
selected by BR2_PACKAGE_OPENCV4_LIB_OBJDETECT
     package/opencv4/Config.in:156:	symbol 
BR2_PACKAGE_OPENCV4_LIB_OBJDETECT is selected by 
BR2_PACKAGE_OPENCV4_LIB_DNN
     For a resolution refer to Documentation/kbuild/kconfig-language.txt
     subsection "Kconfig recursive dependency limitations"

>  	select BR2_PACKAGE_OPENSSL
>  	select BR2_PACKAGE_PCRE
>  	select BR2_PACKAGE_SOFIA_SIP
> diff --git a/package/freeswitch/freeswitch.mk 
> b/package/freeswitch/freeswitch.mk
> index 02cbacab88..25b1bb452c 100644
> --- a/package/freeswitch/freeswitch.mk
> +++ b/package/freeswitch/freeswitch.mk
> @@ -283,7 +283,7 @@ FREESWITCH_DEPENDENCIES += opencv3
>  FREESWITCH_ENABLED_MODULES += applications/mod_cv
>  endif
> 
> -ifeq ($(BR2_PACKAGE_OPENCV4),y)
> +ifeq ($(BR2_PACKAGE_OPENCV4_LIB_DNN),y)
>  FREESWITCH_DEPENDENCIES += opencv4
>  FREESWITCH_ENABLED_MODULES += applications/mod_cv
>  endif
> --
> 2.39.5

Could you have a look, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
