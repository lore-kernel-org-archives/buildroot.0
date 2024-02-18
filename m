Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F03C48BF6
	for <buildroot@archiver.kernel.org>; Sun, 18 Feb 2024 21:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5AE27403EA;
	Sun, 18 Feb 2024 21:27:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 64NYdg3j__kK; Sun, 18 Feb 2024 21:27:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 706DF40125
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 706DF40125;
	Sun, 18 Feb 2024 21:27:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 90A791BF3BB
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 21:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8AA2F60639
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 21:27:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kXqrxuYTmaiT for <buildroot@lists.busybox.net>;
 Sun, 18 Feb 2024 21:27:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5376360623
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5376360623
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5376360623
 for <buildroot@buildroot.org>; Sun, 18 Feb 2024 21:27:09 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 9FB4513F88D;
 Sun, 18 Feb 2024 22:27:04 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 18 Feb 2024 22:27:04 +0100
Date: Sun, 18 Feb 2024 22:27:04 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Kadambini Nema <kadambini.nema@gmail.com>
Message-ID: <ZdJ2KOazjyVO-_tM@landeda>
References: <20240218013353.798627-1-kadambini.nema@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240218013353.798627-1-kadambini.nema@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1708291626;
 bh=AoDTYkEFIA/y51swgVD/tpneLX5w+knj1Unm1on893c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lzuZUVns5uk6rPbEk9lOSoRQpZvX+ydfCjADlIL5bVJV3BA+B4x4AaJNoZZj0wYjZ
 uWDGuQmuKgudTic5RlKzHsy/InS2KEMZj/+7QWTCUoblF8mE6082HBblu7f3HD2fJy
 AEoPtv4hB/+yyvvuxeTBjtq/4w4TTNOhigX4zJGwGHRPTTfJveKCJnEdBazvMcwjEG
 4D1xO/4WF5/bHf3hjN51b9PrPZADqJouQWOArRz0i+bVvl55W+htMT0vUFKi6GbRnO
 Dvrm2tqnUWJ9A7H/VrtHtA7Plled7UI6sLuMAym4n2/p1dYYMiLMZS+3Am+DSBYaXV
 EDiWHrNuhQvjg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lzuZUVns
Subject: Re: [Buildroot] [PATCH 1/1] package dhcpdump: bump to version 1.9
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

Kadambini, All,

On 2024-02-17 17:33 -0800, Kadambini Nema spake thusly:
> - Change the site to a well maintained - https://github.com/bbonev/dhcpdump

At least Fedora 39 is using that fork, so I guess it is OK to switch ot
it. Maybe then we should also update the homepage in the Config.in?

> - Fix some of the reported build failures - autobuild.buildroot.org/?reason=dhcpdump-1.8

The last build failiure was in 2022-06-18, almost two years ago now...

Also, we need pointers to actual failures, like:
    http://autobuild.buildroot.org/results/a34/a347363cbc611080d2a0f7f4882802d15f587250/

> - Build test results
>   ./utils/test-pkg -d br_test -k -c dhcpdump.config  -p dhcpdump
>                     bootlin-armv5-uclibc [1/6]: OK
>                      bootlin-armv7-glibc [2/6]: OK
>                    bootlin-armv7m-uclibc [3/6]: OK
>                      bootlin-x86-64-musl [4/6]: OK
>                       br-arm-full-static [5/6]: OK
>                             sourcery-arm [6/6]: OK
> 6 builds, 0 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
> 
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
> ---
>  ...Fix-build-with-gcc4.8-use-br-fortify.patch | 10 ++++++++
>  .../0001-use-non-bsd-structures.patch         | 23 -------------------
>  package/dhcpdump/Config.in                    |  2 +-
>  package/dhcpdump/dhcpdump.hash                |  2 +-
>  package/dhcpdump/dhcpdump.mk                  |  5 ++--
>  5 files changed, 15 insertions(+), 27 deletions(-)
>  create mode 100644 package/dhcpdump/0001-Fix-build-with-gcc4.8-use-br-fortify.patch
>  delete mode 100644 package/dhcpdump/0001-use-non-bsd-structures.patch
> 
> diff --git a/package/dhcpdump/0001-Fix-build-with-gcc4.8-use-br-fortify.patch b/package/dhcpdump/0001-Fix-build-with-gcc4.8-use-br-fortify.patch
> new file mode 100644
> index 0000000000..a5c1218c99

This new patch needs to be git-formatted, with an actual commit log,
your SoB line, and an upstream status. If you got that from somewhere
else, then we also need that to be recorded in the patch too.

Regards,
Yann E. MORIN.

> --- /dev/null
> +++ b/package/dhcpdump/0001-Fix-build-with-gcc4.8-use-br-fortify.patch
> @@ -0,0 +1,10 @@
> +diff -Naur a/Makefile b/Makefile
> +--- a/Makefile	2024-02-17 13:57:08.166161973 -0800
> ++++ b/Makefile	2024-02-17 13:57:45.055153969 -0800
> +@@ -1,5 +1,5 @@
> + CFLAGS+=${CPPFLAGS}
> +-CFLAGS+=-Wall -Wextra -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -O3 -fPIE
> ++CFLAGS+=-Wall -Wextra -Wformat -Werror=format-security -g -O3 -fPIE
> + LDFLAGS+=-g -Wl,-z,relro -Wl,-z,now -fPIE -pie
> + LIBS+=-lpcap
> + 
> diff --git a/package/dhcpdump/0001-use-non-bsd-structures.patch b/package/dhcpdump/0001-use-non-bsd-structures.patch
> deleted file mode 100644
> index 40115fb640..0000000000
> --- a/package/dhcpdump/0001-use-non-bsd-structures.patch
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -The udphdr structure has uh_* fields when _FAVOR_BSD is
> -defined. Otherwise, the fields are just named source, dest, len and
> -check. See <netinet/udp.h>.
> -
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> -
> -Index: dhcpdump-1.8/dhcpdump.c
> -===================================================================
> ---- dhcpdump-1.8.orig/dhcpdump.c	2011-05-17 20:20:46.506980003 +0200
> -+++ dhcpdump-1.8/dhcpdump.c	2011-05-17 20:20:59.338979999 +0200
> -@@ -163,10 +163,10 @@
> - 	strcpy(ip_origin, (u_char *)inet_ntoa(ip->ip_src));
> - 	strcpy(ip_destination, (u_char *)inet_ntoa(ip->ip_dst));
> - 
> --	if (hmask && check_ch((u_char *)(sp + offset), ntohs(udp->uh_ulen)))
> -+	if (hmask && check_ch((u_char *)(sp + offset), ntohs(udp->len)))
> - 		return;
> - 
> --	printdata((u_char *)(sp + offset), ntohs(udp->uh_ulen));
> -+	printdata((u_char *)(sp + offset), ntohs(udp->len));
> - }
> - 
> - // check for matching CHADDR (Peter Apian-Bennewitz <apian@ise.fhg.de>)
> diff --git a/package/dhcpdump/Config.in b/package/dhcpdump/Config.in
> index e0abe040fc..30e42928e4 100644
> --- a/package/dhcpdump/Config.in
> +++ b/package/dhcpdump/Config.in
> @@ -4,4 +4,4 @@ config BR2_PACKAGE_DHCPDUMP
>  	help
>  	  A tool for monitoring dhcp requests using tcpdump.
>  
> -	  http://www.mavetju.org/unix/general.php
> +	  https://github.com/bbonev/dhcpdump
> diff --git a/package/dhcpdump/dhcpdump.hash b/package/dhcpdump/dhcpdump.hash
> index a24db5b275..fdf3243ad1 100644
> --- a/package/dhcpdump/dhcpdump.hash
> +++ b/package/dhcpdump/dhcpdump.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  6d5eb9418162fb738bc56e4c1682ce7f7392dd96e568cc996e44c28de7f77190  dhcpdump-1.8.tar.gz
> +sha256  3658ac21cc33e79e72bed070454e49c543017991cb6c37f4253c85e9176869d1  dhcpdump-1.9.tar.xz
>  sha256  bab6ca76b7e93885396513689b1248dfb0e8fd662695b8bd1b26784ef71a0192  LICENSE
> diff --git a/package/dhcpdump/dhcpdump.mk b/package/dhcpdump/dhcpdump.mk
> index ec9571c0af..4ce5047b2e 100644
> --- a/package/dhcpdump/dhcpdump.mk
> +++ b/package/dhcpdump/dhcpdump.mk
> @@ -4,8 +4,9 @@
>  #
>  ################################################################################
>  
> -DHCPDUMP_VERSION = 1.8
> -DHCPDUMP_SITE = http://www.mavetju.org/download
> +DHCPDUMP_VERSION = 1.9
> +DHCPDUMP_SITE = https://github.com/bbonev/dhcpdump/releases/download/v$(DHCPDUMP_VERSION)
> +DHCPDUMP_SOURCE = dhcpdump-$(DHCPDUMP_VERSION).tar.xz
>  DHCPDUMP_DEPENDENCIES = libpcap
>  DHCPDUMP_LICENSE = BSD-2-Clause
>  DHCPDUMP_LICENSE_FILES = LICENSE
> -- 
> 2.25.1
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
