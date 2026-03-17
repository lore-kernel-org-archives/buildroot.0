Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D5AF3381A
	for <buildroot@archiver.kernel.org>; Tue, 17 Mar 2026 08:52:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F34661457;
	Tue, 17 Mar 2026 08:52:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id syQKWMlb1kK9; Tue, 17 Mar 2026 08:52:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5668F6148D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773737559;
	bh=76eiLfgmYlqNZwoFEYT7jTD8FgS9pro6DeLSWFNuDpw=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=meArklCcKcbouY+9npeNzcGUIVGK0m3h1UfK7w5jd0oikPYOExVcnh+bS7P3/tpCc
	 niyUbckdMixMMx5PmMAUjN8ABqpfC41/jTGpN3fOkN1nNZwbJC+wDfsxFcA+zPkp4e
	 rbs90cRsO1uBfwZ3qsTXBhNZs+2J+oVhFHm874v8UoUjyradeQdCza2IlNqR/NT44l
	 3FcwbxWzR0PQ8iplHEPsKxz4hLXsRGySbWubO3iGgW1AExJuT9Y973S+5GPwzmh3GC
	 SNA+jhmM0Uba546PKK3qLq9V87QtFC4Py3AkCDmO9QePZBlHNfFaiVFC+itf0mQod+
	 osHPel4WVII5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5668F6148D;
	Tue, 17 Mar 2026 08:52:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B0C41B6
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 08:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C37F6149E
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 08:52:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NSJELm2-tmTf for <buildroot@buildroot.org>;
 Tue, 17 Mar 2026 08:52:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 23FB5613B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23FB5613B5
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 23FB5613B5
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 08:52:35 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 730FD1A2E83;
 Tue, 17 Mar 2026 08:52:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 477535FC9A;
 Tue, 17 Mar 2026 08:52:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 32DCD104503AD; Tue, 17 Mar 2026 09:52:30 +0100 (CET)
Mime-Version: 1.0
Date: Tue, 17 Mar 2026 09:52:29 +0100
Message-Id: <DH4XHHBDH12D.1EWBIUX2NHFBJ@bootlin.com>
To: "Neal Frager" <neal.frager@amd.com>, <buildroot@buildroot.org>
X-Mailer: aerc 0.20.1
References: <20260315154343.3144013-1-neal.frager@amd.com>
 <20260315154343.3144013-3-neal.frager@amd.com>
In-Reply-To: <20260315154343.3144013-3-neal.frager@amd.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1773737551; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=6X1KBKfL9yHU39ra0uEl4Q+8iTyDzU+utF/E40k7NTs=;
 b=xKHmluMolBNMHlyE3SPo9+9vQ7rUDdLV40cDfHasScN3gcn6IX8A9htwaXhs74Ze+X5Jo4
 kjULAV22iwbI13C44+Ui6hcfBdoCjwKcbrI2HamWYu0oHbGnhVkZ1RpurIIUxBn3jmAF3J
 jox3mzkr+6Qh+zq7iCv35W6kKjyCEDPBAmrMV5cH9WgrllYLuJqayf/LU/uqy9KILzI5o4
 08rzcl/ZwWPU/ys9623n6slpESVvOgzBXotdpO6ZJg7cx2WKFlyQt54i72FGXpp1JlZz5H
 6KKPZK8U+SNx1+uy7ypXnOd5ZHMqfNv0Eqj+JKa6Jhv+NTO7fC25HRRGjQIVrQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=xKHmluMo
Subject: Re: [Buildroot] [PATCH v5 3/3] board/versal2/post-image.sh: add
 custom hardware support
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: ibai.erkiaga-elorza@amd.com, yann.morin@orange.com,
 brandon.maier@collins.com, fiona.klute@gmx.de, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun Mar 15, 2026 at 4:43 PM CET, Neal Frager wrote:
> Users will ultimately need the BR2_LINUX_KERNEL_CUSTOM_DTS_DIR config to
> import custom dts files for custom versal2 hardware. Improve the post-image.sh
> to support either the default device tree which comes from u-boot or a
> custom device tree for custom hardware.
>
> To keep the example post-image script as simple as possible, it assumes that
> the first DTB in the LINUX_DTBS list is the one for creating the system.dtb
> filename that u-boot will use for booting. Users are free to implement their
> own post-image scripts for use cases with multiple DTBs or overlays.
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> V1->V2:
> - new to patch series
> V2->V5:
> - fixed shellcheck issue
> - merged with zynqmp and versal patch set
> ---
>  board/versal2/post-image.sh | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/board/versal2/post-image.sh b/board/versal2/post-image.sh
> index af50909fb1..3037e0a5ab 100755
> --- a/board/versal2/post-image.sh
> +++ b/board/versal2/post-image.sh
> @@ -1,9 +1,17 @@
>  #!/bin/sh
>
> -# By default U-Boot loads DTB from a file named "system.dtb", and
> -# with versal2, the Linux DTB is the same as the U-Boot DTB, so
> -# let's use a symlink since the DTB is the same.
> -ln -fs "u-boot.dtb" "${BINARIES_DIR}/system.dtb"
> +# By default U-Boot loads DTB from a file named "system.dtb".
> +# With versal2, there is no default dts in the Linux kernel tree
> +# because the default is the same as the u-boot.dtb. This means
> +# it is necessary to cover two cases, a custom dts or the default.
> +# The BR2_LINUX_KERNEL_DTS_SUPPORT will only be set for custom dts
> +# files

Out of my ignorance, is this assumption always correct? What if the main
dtb comes from u-boot but the kernel package is used to build some overlays
(and no dtb)? This patch would break such configs, because is would link
system.dtb to some dtbo instead of u-boot.dtb.

Is this a valid use case in the first place?

> , so it can be used for checking which case is configured.
> +if grep -Eq "^BR2_LINUX_KERNEL_DTS_SUPPORT=y$" "${BR2_CONFIG}"; then
> +	LINUX_DTBS="$(make --no-print-directory VARS=LINUX_DTBS printvars)"
> +	ln -fs "$(basename "${LINUX_DTBS%% *}")" "${BINARIES_DIR}/system.dtb"
> +else
> +	ln -fs "u-boot.dtb" "${BINARIES_DIR}/system.dtb"
> +fi

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
