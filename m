Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AEE0C61DCB
	for <buildroot@archiver.kernel.org>; Sat, 29 Aug 2026 21:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D2416060E;
	Sat, 29 Aug 2026 21:09:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pLD653Ad-NOE; Sat, 29 Aug 2026 21:09:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788037796;
	bh=4ZSO32CA53pq1AJEgSovOdVGa2hlnh95lR27QItnI7Y=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VjFkJPVMr58wL9OEzmY1CfrG9rqLkTrg5WFJOBc1bmu6Ub+z3UdgRk1Uf376GuDFh
	 CsfhA3arj8SBtwd6x+L/TxYdiXvvYzSk5zT5Ly83KcedkT5fUcORoHi4PweFEOW/2S
	 VJs6egIOEiSykHNEf93hytZele9sGmzRx1Cuq5nkBct3fSw8tlXdmEsBoTPtHod8R7
	 0MhiXAPR/aAFiIF7mkB0d+3QTLQrGj56V8j9ajn2nyrksnUOFzYtRPigJCDho+6QNl
	 dJtdAaihYhM2QewipOtzIDJfvTyOKp4sN+r63GkKoMP37UxuVYuu+vw4nkZedydiEO
	 Z6lEdTcLCUelg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6DC7605EE;
	Sat, 29 Aug 2026 21:09:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 03D7C9D4
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 21:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E94FB405D6
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 21:09:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gPoFeu3fosB0 for <buildroot@buildroot.org>;
 Sat, 29 Aug 2026 21:09:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E500B405CE
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 21:09:53 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 94C881A1868
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 21:09:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5AE656053C;
 Sat, 29 Aug 2026 21:09:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 189D011C781D9; 
 Sat, 29 Aug 2026 23:09:46 +0200 (CEST)
Date: Sat, 29 Aug 2026 23:09:45 +0200
To: Alexis =?utf-8?Q?Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: buildroot@buildroot.org, Will Newton <will.newton@gmail.com>
Message-ID: <apNKif-4jB4g8g0l@windsurf>
References: <20260823-fix-host-erlang-v1-1-4886b00d10f0@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260823-fix-host-erlang-v1-1-4886b00d10f0@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/erlang: fix link failure on
 odbcserver
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Aug 23, 2026 at 11:49:38PM +0200, Alexis Lothor=E9 via buildroot wr=
ote:
> host-erlang build can fail with the following error:
> =

>   make[5]: Nothing to be done for 'opt'.
>    MAKE	opt
>    CC	../priv/bin/x86_64-pc-linux-gnu/odbcserver
>   /usr/bin/ld: ../priv/obj/x86_64-pc-linux-gnu/odbcserver.o: in function =
`encode_column_dyn':
>   odbcserver.c:(.text+0x6b4): undefined reference to `ei_x_encode_tuple_h=
eader'
>   /usr/bin/ld: odbcserver.c:(.text+0x6c2): undefined reference to `ei_x_e=
ncode_tuple_header'
>   /usr/bin/ld: odbcserver.c:(.text+0x6d4): undefined reference to `ei_x_e=
ncode_ulong'
>   /usr/bin/ld: odbcserver.c:(.text+0x6e7): undefined reference to `ei_x_e=
ncode_ulong'
>   /usr/bin/ld: odbcserver.c:(.text+0x6fa): undefined reference to `ei_x_e=
ncode_ulong'
>   /usr/bin/ld: odbcserver.c:(.text+0x708): undefined reference to `ei_x_e=
ncode_tuple_header'
>   /usr/bin/ld: odbcserver.c:(.text+0x71b): undefined reference to `ei_x_e=
ncode_ulong'
>   /usr/bin/ld: odbcserver.c:(.text+0x72e): undefined reference to `ei_x_e=
ncode_ulong'
>   [...]
> =

> This can be reproduced with the following minimal defconfig (and
> libei.so present on host, see details below):
> =

>   BR2_x86_64=3Dy
>   BR2_TOOLCHAIN_EXTERNAL=3Dy
>   BR2_PACKAGE_ERLANG=3Dy
> =

> Those missing symbols are part of the erl_interface, exposed by libei.a.
> host-erlang builds correctly libei.a _before_ odbcserver.c (it can be
> found in lib/erl_interface/obj/x86_64-pc-linux-gnu/libei.a), but the
> failure is actually due to the build command generated and used for
> odbcserver.c, especially the link arguments:
> =

>   /usr/bin/gcc \
>   [...]
>   -o ../priv/bin/x86_64-pc-linux-gnu/odbcserver \
>   ../priv/obj/x86_64-pc-linux-gnu/odbcserver.o \
>   -L/usr/lib64 \
>   -lodbc \
>   -L/home/alexis/src/buildroot/erlang-master/build/host-erlang-custom/lib=
/erl_interface/obj/x86_64-pc-linux-gnu \
>   -lpthread -lei
> =

> /usr/lib64 is searched before the path where libei.a has been built, so
> if whether a valid libei.a or libei.so is found there, it shadows the
> expected libei.a. In the build from which the logs above come, the
> notable point is that the host system indeed have a valid libei.so, but
> is completely unrelated to erl_interface; it rather exposes the Emulated
> Input protocol aimed at Wayland stack; and so it obviously contains none
> of the expected ei_* symbols.
> =

> Upstream has already identified and fixed the issue, the fix is already
> released in versions >=3D 27.x.y. Erlang 26 (the version currently
> packaged in buildroot), isn't supported anymore (only the three latest
> releases are supported, see
> https://github.com/erlang/otp/blob/master/SECURITY.md), so there won't
> be any new minor update that will release this fix.
> =

> Pick and backport the fixing patch so that the current version packaged
> in buildroot can still build.
> =

> Signed-off-by: Alexis Lothor=E9 <alexis.lothore@bootlin.com>

Applied to next, thanks!

Thomas
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
