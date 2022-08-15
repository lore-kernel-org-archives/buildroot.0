Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D68F9C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 10:11:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E27241581;
	Mon, 15 Aug 2022 10:11:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E27241581
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5_R1YkBaAhYY; Mon, 15 Aug 2022 10:11:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16438410C8;
	Mon, 15 Aug 2022 10:11:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16438410C8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DB0A61BF3C4
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 10:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0954410C8
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 10:11:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0954410C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eedSwR6ImgnK for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 10:11:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BC11409DE
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9BC11409DE
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 10:11:09 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id j8so12721557ejx.9
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 03:11:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=lMKpXeddG1blkwtOZW0URXJLql1J++13iRNfZiG17Mo=;
 b=s5DeEGWj+K8jIJmh35ByLNYwXudv4Sb9hXbNVr9vFga8qaL7FymHPRhlwvHlwftDdA
 ThExOPjYNyhoOnj2Jh96D2O+kiG0QmYdx/bFRDuL8iMv6VPZWiMDtka92S3qXFm9Ydzs
 ZIT2HIGI3fMj6qoLAXlp1mD4saYTyYquCH1JT2D0AvlnQK/QpBvqqCKigUoQfiBs1JCx
 +q+nWfGcbGxqdqnl9cx00ofIxPky4zr0FplavcjwPwcJ2TlX0reBPNPoyiF2BVVe9D0r
 NSjJQhr5AcqdvhN/vwFdIgKCoxUc7zmCeooHl0YRfDdYfCNo4pphh4EsBStE6nU+66MP
 5G2g==
X-Gm-Message-State: ACgBeo2z+Yw3/rHf2CNmqHsGzsYdm3Fr4u09pWX2eB2+sy4Rz9AeobgR
 wMsJwfeNfXuNtELvtJY0ILs=
X-Google-Smtp-Source: AA6agR6jk45onrOM/58sXIDEGrad5nnGoQZ4v8XUKDNEPhoBKI/NZjpwOwiDR6pz8gUyXNWHomII2g==
X-Received: by 2002:a17:907:1690:b0:731:56b6:fded with SMTP id
 hc16-20020a170907169000b0073156b6fdedmr10300737ejc.119.1660558267869; 
 Mon, 15 Aug 2022 03:11:07 -0700 (PDT)
Received: from localhost (tmo-096-168.customers.d1-online.com. [80.187.96.168])
 by smtp.gmail.com with ESMTPSA id
 e13-20020a170906248d00b0072f1d8e7301sm3908282ejb.66.2022.08.15.03.11.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 03:11:07 -0700 (PDT)
Date: Mon, 15 Aug 2022 12:11:03 +0200
From: Thomas Huth <huth@tuxfamily.org>
To: Laurent Vivier <laurent@vivier.eu>
Message-ID: <20220815121103.43e4dfff@tuxfamily.org>
In-Reply-To: <20220814115115.2798469-3-laurent@vivier.eu>
References: <20220814115115.2798469-1-laurent@vivier.eu>
 <20220814115115.2798469-3-laurent@vivier.eu>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 2/2] board/qemu/m68k-virt: Add virt-m68k
 linux config
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Sun, 14 Aug 2022 13:51:15 +0200
schrieb Laurent Vivier <laurent@vivier.eu>:

> Build a 5.19 (first version with the m68k virt machine)
> build a bootable kernel for "qemu-system-m68k -M virt" machine.

Scratch the "build a bootable" ?

> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  board/qemu/m68k-virt/config.linux          | 89 ++++++++++++++++++++++
>  board/qemu/m68k-virt/readme.txt            |  5 ++
>  configs/qemu_m68k_virt_petitboot_defconfig | 28 +++++++
>  3 files changed, 122 insertions(+)
>  create mode 100644 board/qemu/m68k-virt/config.linux
>  create mode 100644 board/qemu/m68k-virt/readme.txt
>  create mode 100644 configs/qemu_m68k_virt_petitboot_defconfig

It would be good to have an entry for you and these files in DEVELOPERS so
that you get informed when the build breaks.

...
> diff --git a/board/qemu/m68k-virt/readme.txt b/board/qemu/m68k-virt/readme.txt
> new file mode 100644
> index 000000000000..475e36f7d9d5
> --- /dev/null
> +++ b/board/qemu/m68k-virt/readme.txt
> @@ -0,0 +1,5 @@
> +Run the emulation with:
> +
> + qemu-system-m68k -M virt -kernel output/images/vmlinux -initrd output/images/rootfs.cpio.xz -append "console=ttyGF0" --nographic # /qemu_m68k_virt_petitboot_defconfig
> +
> +The petiboot menu will appear in the terminal that started Qemu.

"... appear in the terminal where QEMU has been started" ?

 Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
