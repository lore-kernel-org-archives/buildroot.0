Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BAECC05027
	for <buildroot@archiver.kernel.org>; Sun, 19 Feb 2023 20:56:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DEC95405AC;
	Sun, 19 Feb 2023 20:56:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DEC95405AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TfwxPhYyG18n; Sun, 19 Feb 2023 20:56:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 131A240B48;
	Sun, 19 Feb 2023 20:56:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 131A240B48
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 60B211BF2B6
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 20:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3AB0260E90
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 20:56:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AB0260E90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rbRbkmd1B6T0 for <buildroot@lists.busybox.net>;
 Sun, 19 Feb 2023 20:56:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B682F60E57
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B682F60E57
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 20:56:37 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6CEF71C0005;
 Sun, 19 Feb 2023 20:56:34 +0000 (UTC)
Date: Sun, 19 Feb 2023 21:56:33 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230219215633.61ffccbe@windsurf>
In-Reply-To: <20230219150426.1509780-1-ju.o@free.fr>
References: <20230219150426.1509780-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676840194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PM2D6bIvIpCqOMXuFIXw/2bQYH4HVe1y590sTKv2XqI=;
 b=SC4hRBN1orQUE0/uQRU/T1ulNAITXsfBSyjGEUkg63u3OOwxSvtv2+F+ZYIC6q8CTcsZcA
 i3uD5OU87vop9DxjOuafS/0RBLKd20rIqbtV7jmeAIFXi8pO1TxY4Y3V9NbC/PT80nHdJC
 Ysgz117miXxUD9AH+dOCEhWAEGp0qeQTiPEvZp8o+A3xP9kiYhqwExYJi3XbA5s2kvmIZD
 ykArcNcv4DeYMfrEknFZPn/4yrJMWk3Luqo7omqQhn0X56RS7vYD8YOsZ33M17QaQiHCyD
 H5SnSJwqNhAvmfT0s6IhJmly442RTGO1IfRZMiR/mCn8Nm3+0OX12C2DIvLF8A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SC4hRBN1
Subject: Re: [Buildroot] [PATCH 1/1] package/gnupg2: fix build failure when
 host provides an old gpgrt-config
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
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 19 Feb 2023 16:04:26 +0100
Julien Olivain <ju.o@free.fr> wrote:

> gnupg2 uses the libgpg-error library. The libgpg-error library has a
> long plan to be renamed to "gpgrt" (see [1]). For the transition, it
> provides two configuration scripts "gpg-error-config" (the old,
> original one, kept for compatibility) and "gpgrt-config" (which is
> meant to be the replacement). When both are detected, "gpgrt-config"
> should be preferred.
> 
> gnupg2 configure script searches for "gpg-error-config" in the path
> provided to --with-libgpg-error-prefix=PFX (more specifically, in
> "PFX/bin").
> 
> The logic to find "gpgrt-config" is different: it is searched in
> paths "$prefix/bin:$PATH". See [2]. On Buildroot, autotools target
> packages are configured with "--prefix=/usr", which makes the
> configure script to search in the host "/usr/bin".
> 
> In some host environment providing such a "/usr/bin/gpgrt-config"
> script of an older version, host compilation flags are incorrectly
> added for the target, which leads to compilation failures.
> 
> The issue can be reproduced in a Buildroot Docker image from [3] in
> which the libgpg-error-dev package is added. When tested, the
> libgpg-error-dev package was at version 1.38.
> 
> In that configuration, gnupg2 configure will output the message:
> 
>     checking for gpgrt-config... /usr/bin/gpgrt-config
> 
> and the compilation fails with a message:
> 
>     aarch64-buildroot-linux-gnu-gcc: ERROR: unsafe header/library path used in cross-compilation: '-I/usr/include'
> 
> Note: it was observed that in some other configurations in which the
> host /usr/bin/gpgrt-config was from libgpg-error version 1.46, the
> host script was redirecting correctly in the buildroot sysroot.
> 
> Since gnupg2 searches for "gpgrt-config" with a
> "AC_PATH_PROG(GPGRT_CONFIG, ...)" macro, this patch fixes this
> issue by simply forcing the script path in the GPGRT_CONFIG
> environment variable.
> 
> See also [4] which discussed the "gpgrt-config" search logic.
> 
> Fixes:
> - http://autobuild.buildroot.net/results/423c3ce7317c181e9f2e4a49b76ee9d26167375c/
> (and many others)
> 
> [1] https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgpg-error.git;a=blob;f=README;h=e0b9f16445a96942af0839bcdb9a0b0f8cf31380;hb=885a287a57cf060b4c5b441822c09d23b8dee2bd#l29
> [2] https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gnupg.git;a=blob;f=m4/gpg-error.m4;h=a975e53d07d1b743f51d8aa1767cd8e0d71b4071;hb=c0556edb80518720b0d884251685fe008c8f0429#l68
> [3] https://git.buildroot.org/buildroot/tree/support/docker/Dockerfile?id=b6085c00d0feece6f3ba635e7847ea653bc5fac3
> [4] https://dev.gnupg.org/T5365
> 
> Reported-by: Bagas Sanjaya <bagasdotme@gmail.com>
> Tested-by: Bagas Sanjaya <bagasdotme@gmail.com>
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested on master branch at commit b6085c0 with commands:

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
