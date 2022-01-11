Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B814C433F5
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 22:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 280F482977;
	Tue, 11 Jan 2022 22:08:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BmdFhkY1qZfZ; Tue, 11 Jan 2022 22:08:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A044823C0;
	Tue, 11 Jan 2022 22:08:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 55FD61BF32E
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 22:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 424E64090A
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 22:08:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W-fueOYto24a for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 22:08:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DBF2740132
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 22:08:12 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id CBA86100006;
 Tue, 11 Jan 2022 22:08:09 +0000 (UTC)
Date: Tue, 11 Jan 2022 23:08:08 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20220111230808.5c9f298e@windsurf>
In-Reply-To: <20220109164756.1312023-1-ju.o@free.fr>
References: <20220109164756.1312023-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/riscv-isa-sim: new package
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

On Sun,  9 Jan 2022 17:47:55 +0100
Julien Olivain <ju.o@free.fr> wrote:

> Spike, the RISC-V ISA Simulator, implements a functional model of one
> or more RISC-V harts.
> 
> The host package provides an alternative solution to qemu.
> 
> https://github.com/riscv-software-src/riscv-isa-sim
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Thanks for your patch!

> diff --git a/package/Config.in b/package/Config.in
> index 85193f7802..b20cf45698 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2126,6 +2126,7 @@ menu "Miscellaneous"
>  	source "package/proj/Config.in"
>  	source "package/qemu/Config.in"
>  	source "package/qpdf/Config.in"
> +	source "package/riscv-isa-sim/Config.in"
>  	source "package/rtl_433/Config.in"
>  	source "package/shared-mime-info/Config.in"
>  	source "package/sunwait/Config.in"

It wasn't clear to me what was the use-case/reasoning for having a
target variant of this package, so I've dropped the target variant and
kept only the host variant.

> diff --git a/package/riscv-isa-sim/0001-riscv-disable-precompiled-headers.patch b/package/riscv-isa-sim/0001-riscv-disable-precompiled-headers.patch
> new file mode 100644
> index 0000000000..461f34e3a1
> --- /dev/null
> +++ b/package/riscv-isa-sim/0001-riscv-disable-precompiled-headers.patch
> @@ -0,0 +1,34 @@
> +From 980d5143089bf32ef8a6dfdf1bb9e9fe92fa7bf5 Mon Sep 17 00:00:00 2001
> +From: Julien Olivain <ju.o@free.fr>
> +Date: Sun, 9 Jan 2022 13:38:48 +0100
> +Subject: [PATCH] riscv: disable precompiled headers
> +
> +While precompiling header, some toolchains fail with the message:
> +
> +    /path/to/toolchain/bin/ld: /path/to/sysroot/usr/lib/Scrt1.o: in function `_start':
> +    (.text+0x54): undefined reference to `main'

Has this been reported upstream? Will it be fixed upstream?

Anyway: patch applied to master, with the target variant dropped.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
