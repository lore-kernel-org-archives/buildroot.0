Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC70CC52D7C
	for <buildroot@archiver.kernel.org>; Wed, 21 Aug 2024 12:04:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FA2680A8C;
	Wed, 21 Aug 2024 12:04:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FzcCxxpn-dJi; Wed, 21 Aug 2024 12:04:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C720E80A69
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C720E80A69;
	Wed, 21 Aug 2024 12:04:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3B1021BF418
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 12:04:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35CDE60A63
 for <buildroot@lists.busybox.net>; Wed, 21 Aug 2024 12:04:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oW07Q10rIe5G for <buildroot@lists.busybox.net>;
 Wed, 21 Aug 2024 12:04:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DE40C608FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE40C608FC
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DE40C608FC
 for <buildroot@buildroot.org>; Wed, 21 Aug 2024 12:04:52 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 0286813F8AE;
 Wed, 21 Aug 2024 14:04:46 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 21 Aug 2024 14:04:46 +0200
Date: Wed, 21 Aug 2024 14:04:46 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZsXX3v8dN0g8vZzh@landeda>
References: <20240821110335.2018199-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240821110335.2018199-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1724241890;
 bh=GprXImL4ngppUku+nbKJTi3RN7PiXt5f16zwq0ocmIU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kueF+CG6Ab3OZzyjaNyqug3WBgEfkOPoD+PBll/qpbuKDTEv/Rdf3RFkI/cj3XUV7
 IrENOVU1rDwhEAEavPcsTUO2BaaIx4Kh5EBNAMJrHqazXyBWmMrcv2OpcwIvvuu8pu
 52z5HqLXdhDu3WsrmpwPD2MrCl7Zl7kUOmxd3eawpr+ThxfvA7nnZBPejqbA8oB3eW
 /vBd0Ormx6/WIrNX5dhfVdTxSaDBAKH96OE2JmHKgk5+AkJM0jpZouH6pQ441yj6SI
 c7VWSgZyyXtEtiWAEQwtnZM6a6CNn634IxsqtQ70xq3YlhJet0EBhbD6HUrBVM0Js5
 JEOBQ+E6lK22Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kueF+CG6
Subject: Re: [Buildroot] [PATCH] package/ledmon: add patch fixing SSP
 detection
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
Cc: Maksim Kiselev <bigunclemax@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2024-08-21 13:03 +0200, Thomas Petazzoni via buildroot spake thusly:
> Fixes:
> 
> /home/buildroot/autobuild/instance-0/output-1/host/lib/gcc/m68k-buildroot-linux-uclibc/13.3.0/../../../../m68k-buildroot-linux-uclibc/bin/ld: cannot find -lssp_nonshared: No such file or directory
> /home/buildroot/autobuild/instance-0/output-1/host/lib/gcc/m68k-buildroot-linux-uclibc/13.3.0/../../../../m68k-buildroot-linux-uclibc/bin/ld: cannot find -lssp: No such file or directory
> collect2: error: ld returned 1 exit status
> make[4]: *** [Makefile:425: ledctl] Error 1
> 
> http://autobuild.buildroot.net/results/969b62c89bc37326260fb23c5652e21c0662cba2/
> 
> This issue exists since upstream commit
> 940149a9b53627ceabe67b01aac2859fb7c6fde0 ("Add compiler defenses
> flags (#145)"), which has added -fstack-protector-strong to the flags
> tested and used if supported. This commit first appeared in v1.0.0,
> which is used by Buildroot since commit
> b3819b761f4a06bc75fe33b785e5ff2cecc5d211 (which first appeared in
> 2024.05).
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Barring a rebase, upstream seemed OK with the change.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...-AX_CHECK_LINK_FLAG-to-test-gcc-flag.patch | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 package/ledmon/0002-configure.ac-use-AX_CHECK_LINK_FLAG-to-test-gcc-flag.patch
> 
> diff --git a/package/ledmon/0002-configure.ac-use-AX_CHECK_LINK_FLAG-to-test-gcc-flag.patch b/package/ledmon/0002-configure.ac-use-AX_CHECK_LINK_FLAG-to-test-gcc-flag.patch
> new file mode 100644
> index 0000000000..730eb29595
> --- /dev/null
> +++ b/package/ledmon/0002-configure.ac-use-AX_CHECK_LINK_FLAG-to-test-gcc-flag.patch
> @@ -0,0 +1,49 @@
> +From 0d391dbcb808755a65fcc9a8a0ceaf3aa53d153f Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +Date: Mon, 19 Aug 2024 00:08:40 +0200
> +Subject: [PATCH] configure.ac: use AX_CHECK_LINK_FLAG() to test gcc flags
> +
> +ledmon's configure.ac defines an AX_AM_CFLAGS_ADD() macro that allows
> +to test if a flag is supported by gcc, and if so add it to
> +AM_CFLAGS. In order to test if the flag works, it uses
> +AX_CHECK_COMPILE_FLAG(), which only does a *compile* test, but not
> +a *link* test. However, some flags such as -fstack-protector might
> +appear to work at compile time, but not link time. Therefore
> +-fstack-protector is considered functional:
> +
> +checking whether C compiler accepts -fstack-protector-strong... yes
> +
> +but the build later fails:
> +
> +/home/buildroot/autobuild/instance-0/output-1/host/lib/gcc/m68k-buildroot-linux-uclibc/13.3.0/../../../../m68k-buildroot-linux-uclibc/bin/ld: cannot find -lssp_nonshared: No such file or directory
> +/home/buildroot/autobuild/instance-0/output-1/host/lib/gcc/m68k-buildroot-linux-uclibc/13.3.0/../../../../m68k-buildroot-linux-uclibc/bin/ld: cannot find -lssp: No such file or directory
> +collect2: error: ld returned 1 exit status
> +
> +In order to fix this, we test all flags with AX_CHECK_LINK_FLAG()
> +which does a full *link* of the test program. This allows to make sure
> +that the flag is fully functional. In our test case,
> +-fstack-protector-strong will be determined as being non-functional,
> +and therefore won't be used.
> +
> +Upstream: https://github.com/intel/ledmon/pull/244
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index d3fada5..747b168 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -52,7 +52,7 @@ AC_CONFIG_HEADERS([config_ac.h])
> + AM_CFLAGS='-Wall -I../config'
> + AM_CPPFLAGS='-D_DEBUG -D_GNU_SOURCE -D_DEFAULT_SOURCE -DDMALLOC_DISABLE -DBUILD_LABEL=\""$(BUILD_LABEL)"\"'
> + 
> +-AC_DEFUN([AX_AM_CFLAGS_ADD],[AX_CHECK_COMPILE_FLAG($1, AM_CFLAGS="$AM_CFLAGS $1")])
> ++AC_DEFUN([AX_AM_CFLAGS_ADD],[AX_CHECK_LINK_FLAG($1, AM_CFLAGS="$AM_CFLAGS $1")])
> + AX_AM_CFLAGS_ADD([-Wformat -Wformat-security])
> + AX_AM_CFLAGS_ADD([-Wformat-overflow=2])
> + AX_AM_CFLAGS_ADD([-Wno-strict-overflow])
> +-- 
> +2.46.0
> +
> -- 
> 2.46.0
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
