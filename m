Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B2FAC04FFE
	for <buildroot@archiver.kernel.org>; Sat, 11 May 2024 18:30:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBAD9607C2;
	Sat, 11 May 2024 18:30:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NyD2OscTZ5V1; Sat, 11 May 2024 18:30:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3670607A0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3670607A0;
	Sat, 11 May 2024 18:30:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 12F6F1BF2F2
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 18:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0960284397
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 18:30:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tAbnHZ5QYZJT for <buildroot@lists.busybox.net>;
 Sat, 11 May 2024 18:30:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 685C184394
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 685C184394
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 685C184394
 for <buildroot@buildroot.org>; Sat, 11 May 2024 18:30:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 7EDF713F846;
 Sat, 11 May 2024 20:30:21 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 11 May 2024 20:30:21 +0200
Date: Sat, 11 May 2024 20:30:21 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <Zj-5PSfeoyinMtHy@landeda>
References: <20240407114445.683504-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240407114445.683504-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1715452233;
 bh=OmGyqV478TCXmWV6ksykRPgqTm2Hf69QTdSnmTLCbWI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=diUJ1k/8yTxPSzYgNmmygrqsIe3ep01C2Em+d0a8VQbuRaPrtKOmzlFvvjIGQFWsG
 21rDz0/tCWdulvLNEGEt5JdaxP66SrVZtZlkZ5nvFqrkTqPPZCS3Ln8d7gZlcRsWjI
 yckkZFJSurKu323vJv9cyEgocAyp8pyaTAuM6cfZJGNDndmdrhcJpoyZ5DTeqEsJMS
 53/tjuO8R1IpHT48Dqs4nek4EX+KoPy6TZsVC6JvHGAXda/4WpTHNTIqJpx9fhpOVz
 Ou7mkUmmlEM76UUQifbkw0y7j6gkl3NWa3pAwtqZBLZYnCNVuZE4W8ppLXpNBcPhjU
 qptRiSYKx0aZg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=diUJ1k/8
Subject: Re: [Buildroot] [PATCH v2 00/20] package/kodi: bump version to
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Julien Corjon <corjon.j@ecagroup.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2024-04-07 13:44 +0200, Bernd Kuhls spake thusly:
> this is v2 of the patch series to bump Kodi to its latest version.
[--SNIP--]

While testing the udfread fixup patch, I stumbled on another build
error:

    $ cat defconfig
    BR2_aarch64=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
    BR2_PER_PACKAGE_DIRECTORIES=y
    BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
    BR2_PACKAGE_KODI=y
    BR2_PACKAGE_MESA3D=y
    BR2_PACKAGE_MESA3D_OSMESA_GALLIUM=y
    BR2_PACKAGE_MESA3D_OPENGL_EGL=y
    BR2_PACKAGE_MESA3D_OPENGL_ES=y
    BR2_PACKAGE_PYTHON3=y
    BR2_PACKAGE_PYTHON3_PY_PYC=y

    $ make kodi
    [--SNIP--]
      CCLD     libdvdread.la
    libtool: warning: library '/home/ymorin/dev/buildroot/O/master/per-package/kodi/host/opt/ext-toolchain/aarch64-buildroot-linux-gnu/lib64/libatomic.la' was moved.
    /usr/bin/grep: /builds/buildroot.org/toolchains-builder/build/aarch64--glibc--bleeding-edge-2024.02-1/aarch64-buildroot-linux-gnu/lib/../lib64/libatomic.la: No such file or directory
    /usr/bin/sed: can't read /builds/buildroot.org/toolchains-builder/build/aarch64--glibc--bleeding-edge-2024.02-1/aarch64-buildroot-linux-gnu/lib/../lib64/libatomic.la: No such file or directory
    libtool:   error: '/builds/buildroot.org/toolchains-builder/build/aarch64--glibc--bleeding-edge-2024.02-1/aarch64-buildroot-linux-gnu/lib/../lib64/libatomic.la' is not a valid libtool archive
    make[6]: *** [Makefile:533: libdvdread.la] Error 1
    make[5]: *** [Makefile:422: all] Error 2
    make[4]: *** [CMakeFiles/libdvdread.dir/build.make:86: build/libdvdread/src/libdvdread-stamp/libdvdread-build] Error 2
    make[3]: *** [CMakeFiles/Makefile2:4641: CMakeFiles/libdvdread.dir/all] Error 2
    make[2]: *** [Makefile:136: all] Error 2
    make[1]: *** [package/pkg-generic.mk:283: /home/ymorin/dev/buildroot/O/master/build/kodi-21.0-Omega/.stamp_built] Error 2
    make: *** [Makefile:23: _all] Error 2

Could you also look at this, please?

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
