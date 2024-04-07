Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC4FCD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 09:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69FC081EF2;
	Sun,  7 Apr 2024 09:53:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yZot6xeOLW7A; Sun,  7 Apr 2024 09:53:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F5BD81F17
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F5BD81F17;
	Sun,  7 Apr 2024 09:53:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 80B0D1BF296
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 09:53:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E033606C7
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 09:53:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uEluqkaMAnDr for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 09:53:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3D33D6069A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D33D6069A
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3D33D6069A
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 09:52:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6191313F899;
 Sun,  7 Apr 2024 11:52:48 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 Apr 2024 11:52:48 +0200
Date: Sun, 7 Apr 2024 11:52:48 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <ZhJs8G5Uyf0Rs4ai@landeda>
References: <20240406073216.1054073-1-bernd@kuhls.net>
 <20240406073216.1054073-5-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240406073216.1054073-5-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712483577;
 bh=oTqi1cBTqrQMzFqgL3H/4kjOiFuuCNXG0JxXjLkyzF4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mjHHoNEccr924+wvl6cNAThu0j37NL1zItt+Ih3QnB8voCPvGifQECBMnic6J+12d
 CP3KKJH8csMompEQqUS9TkFMsvXjv9xIFoM7wrL2y0oLX3kT0F9YDu7KIkblJp3I3Y
 L4BDn2IVKFW166n3v8uExM8YiAfsSkU5CjWWVyps8jJKSNo9t4sMhcggC6FpFaOc6f
 /dITrSm10N15p1gMKSKoUkpoNC8+LoGiQqouGycvoNcx14u72SNvjnqdYxGchfN0QZ
 DTFvUywLcN81nMmE1Xq00qJLFRidoFXCdmvslrYy0V9Wp9H/gESmGSpDS5hVkIRwf9
 WwFTIc1FHY9qg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mjHHoNEc
Subject: Re: [Buildroot] [PATCH 05/18] package/kodi: bump version to
 21.0-Omega
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
Cc: Julien Corjon <corjon.j@ecagroup.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Berdn, All,

On 2024-04-06 09:32 +0200, Bernd Kuhls spake thusly:
> Added new dependency to libdisplay-info for gbm support:
> https://github.com/xbmc/xbmc/commit/ce9626479c1792210c7b7cc02c7dc4f819ace509
> 
> Added new required dependency to tinyxml2:
> https://github.com/xbmc/xbmc/commit/9e983ed0449aaf3007d8bfa3261056b120d84188

So, is the dependency to tinyxml still needed?

> Added new required dependency to libudfread: Since upstream commit
> https://github.com/xbmc/xbmc/commit/5f9b9cfa26f274e381e92d73cfa33fb55582436e
> kodi does not build anymore without libudfread.
> 
> Upstream removed the bundled groovy/apache commons binaries:
> https://github.com/xbmc/xbmc/commit/d6bc920e056baad7782f47b86cba85d1336bb134

Any reason why we can't make those additional host packages, e.g. like
add host-groovy, and then use the new -D options listed int hat commit,
to point kodi where they are installed in?

Also, I see you use sha256 hashes for those, but kodi uses sha512
hashes, so I think it would be better to use the same hashes as kodi, so
that we can check that indeed what we get is what kodi expects.

> - JsonSchemaBuilder fixes:
> 
> Upstream moved CMakeLists.txt to src/ subfolder:
> https://github.com/xbmc/xbmc/commit/7e87d98ca55c72fcbc9b8dadf2cb979a85732606
> 
> - TexturePacker fixes:
> 
> texturepacker now depends on c++17:
> https://github.com/xbmc/xbmc/commit/54bd6d7ab552a4ddc04d2595826457d8bfa864d5
> 
> Upstream moved CMakeLists.txt to src/ subfolder
> https://github.com/xbmc/xbmc/commit/e336a75f42d9c4efd3433f3fa6edd05309689deb
> 
> Due to this update we can remove all of our patches for texturepacker.
> 
> Set KODI_SOURCE_DIR variable to root directory of the source tarball,
> LibreELEC added something similar:
> https://github.com/LibreELEC/LibreELEC.tv/commit/70abdd27a22b22547060fcb00a2c70ea61721465

Stating "others do that as well" is not really a justification, although
it can hints that's the way to go.

In fact, the reason is simple: when building natively, outside of a meta
buildsystem like Buildroot, kodi builds its own tools as part of its
build process. TexturePacker needs cmake modules available from the top
of the Kopdi source tree, a source file in a sub-directory at the
top-level source tree, which itself needs includes from the same
sub-dir. The Kodi build process sets KODI_SOURCE_DIR so that
TexturePacker can fidn those files.

In Buildroot, as we cross-build, we build the tools explicitly, without
using the Kodi build process, and thus we must set that variable.

[--SNIP--]
> diff --git a/package/kodi/Config.in b/package/kodi/Config.in
> index 8ad9fdae78..885550a542 100644
> --- a/package/kodi/Config.in
> +++ b/package/kodi/Config.in
[--SNIP--]
> @@ -56,6 +57,7 @@ menuconfig BR2_PACKAGE_KODI
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libass -> harfbuzz
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9 # C++17
> +	depends on BR2_HOST_GCC_AT_LEAST_9 # C++17

It's not Kodi itself that needs host C++17, it's host-kodi-texturepacker
so the dependency needs to reflect that:

    depends on BR2_HOST_GCC_AT_LEAST_9  # host-kodi-texturepacker

(unless kodi itself needs it during its own build, of course, at which
point you'll need to expalin so in the commit log as well.)

Regards,
Yann E. MORIN.

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
