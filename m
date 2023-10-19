Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50286CDB482
	for <buildroot@archiver.kernel.org>; Thu, 19 Oct 2023 17:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2B0183EA2;
	Thu, 19 Oct 2023 17:26:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2B0183EA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q0P7x4Z3bddm; Thu, 19 Oct 2023 17:26:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14D8783E9A;
	Thu, 19 Oct 2023 17:26:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14D8783E9A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EF63A1BF368
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 17:26:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5B0360BA8
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 17:26:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5B0360BA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OaOZnyXPBoSN for <buildroot@lists.busybox.net>;
 Thu, 19 Oct 2023 17:26:15 +0000 (UTC)
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DD31360AE8
 for <buildroot@uclibc.org>; Thu, 19 Oct 2023 17:26:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD31360AE8
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1qtWmh-0001EN-KP
 for buildroot@uclibc.org; Thu, 19 Oct 2023 19:26:11 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Thu, 19 Oct 2023 19:25:12 +0200
Message-ID: <pan$3c018$26562eb$5b2af76e$232b3d48@ID-313208.user.individual.net>
References: <20231019075440.2568312-1-andyshrk@163.com>
 <20231019075512.2568398-1-andyshrk__14620.458455623$1697702154$gmane$org@163.com>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
Subject: Re: [Buildroot] [PATCH v2 1/1] igt-gpu-tools: add igt-gpu-tools
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Andy,

while trying to build the package I found more things:

Am Thu, 19 Oct 2023 15:55:12 +0800 schrieb Andy Yan:

> diff --git a/package/Config.in b/package/Config.in
> index 83134fb52d..d798fe6850 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1605,6 +1605,7 @@ menu "Graphics"
>  	source "package/gtkmm3/Config.in"
>  	source "package/gtksourceview/Config.in"
>  	source "package/harfbuzz/Config.in"
> +	source "package/igt-gpu-tools/Config.in"

Please add the package to "Target packages" -> "Graphic libraries and 
applications", I did not expect to find it under "Libraries" -> "Graphics"

> +	depends on BR2_USE_MMU # procps-ng
> +	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS # libunwind
> +	depends on !BR2_STATIC_LIBS # kmod, libunwind
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm, libunwind
> +	depends on BR2_PACKAGE_HAS_UDEV

According to these dependencies the package does not depend on wchar...

> +comment "igt-gpu-tools needs udev /dev management and toolchain w/ 
threads, wchar, dynamic library"
> +	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS # libunwind
> +	depends on BR2_USE_MMU # procps-ng
> +        depends on !BR2_PACKAGE_HAS_UDEV || BR2_STATIC_LIBS || \
> +		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR

... but you mention BR2_USE_WCHAR in the Config.in comment.

> +IGT_GPU_TOOLS_DEPENDENCIES = host-pkgconf cairo kmod libdrm libglib2 
libpciaccess libunwind pixman procps-ng zlib

Since version 1.24 the package depends on libdw, a package currently not 
present in buildroot:
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/
e39e09910fc8e369e24f6a0cabaeb9356dbfae08

Building the package is broken atm due to this:

Run-time dependency libdw found: NO (tried pkgconfig and cmake)

output/build/igt-gpu-tools-v1.28/meson.build:141:8: ERROR: Dependency 
"libdw" not found, tried pkgconfig and cmake

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
