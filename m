Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5915F3381A
	for <buildroot@archiver.kernel.org>; Tue, 17 Mar 2026 08:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A881083E11;
	Tue, 17 Mar 2026 08:52:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6B8gxxmnIHSj; Tue, 17 Mar 2026 08:52:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3885183DDA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773737554;
	bh=gpB4v+HaX+ilZVzPZ2XEqqNUY2JjJZMXNt5ejz4Vfvc=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=gwKin9Eta4kCs0TQdYu5REUcR7sPzErSZzeZ9670aeL2mS3XdNS5rOHrnjyjtrD99
	 DS0i4NVSKrfcMZHDKf802U4tpmK4o2CTaqUJXZklkfnurg2nuDqQNhDZaaLikWUR/W
	 Z8Joy95FGqwokXHeem9W5r795vgMxkQIit7HLjsyf6rumXNeNKTZ9rmbGc6F/i7bQX
	 /rxf45/OJLShMIxAgf5zax76DqPojSbDaRz3vMl2YFDna1euJ51mQ48tsVkYHE3Lr8
	 XyUxnjFfbkxi8OTEy0dR7jPssacgDW135pNQtvqpeU/+krrO9xAkS1I779LDdXln4Z
	 JDSsFAtlr3LtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3885183DDA;
	Tue, 17 Mar 2026 08:52:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D4176D3
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 08:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C5F236149E
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 08:52:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P8IhC8WA849m for <buildroot@buildroot.org>;
 Tue, 17 Mar 2026 08:52:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D0CFA613B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0CFA613B5
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D0CFA613B5
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 08:52:31 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 263B31A2E82;
 Tue, 17 Mar 2026 08:52:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EA94C5FC9A;
 Tue, 17 Mar 2026 08:52:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2768F10450425; Tue, 17 Mar 2026 09:52:23 +0100 (CET)
Mime-Version: 1.0
Date: Tue, 17 Mar 2026 09:52:23 +0100
Message-Id: <DH4XHEHRCJ94.3FDI5C07SO2TD@bootlin.com>
To: "Neal Frager" <neal.frager@amd.com>, <buildroot@buildroot.org>
X-Mailer: aerc 0.20.1
References: <20260315154343.3144013-1-neal.frager@amd.com>
In-Reply-To: <20260315154343.3144013-1-neal.frager@amd.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1773737546; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=3AUKhUOl21NMJgZ4EN04hMaH5lrDMxlHkahuBwCu4DA=;
 b=1gBzTTWTXfF6BkesylrNlJlKvtBgXpQLQ43GQDMJL8Z2kC9isPzs7bXI675WdCEWhay37T
 dUnXg8pLJQDA3o46VSYfOfsE5Q544V6ZPAbLQmbASiZV4auR5vWU1dZsdcIB+NS5SxCEQ1
 f+UPShZBmUNb6YhKjTptocoYQEQqqZ8UJ2XhA7HAquWX1nNxQyqYkt3JVkGVu5gdqBXS8p
 SbKFXBV07ABHM8LQOSpF+e/F4gzUXwbap+pTVYHO1WPgEVwRIyoDkLmktPJp/9Qf+VYkxZ
 rbiKhVdguZjaYi+t0Uyznv1y/8jBPeVWR9xt2A5AQvZhyRMuOCI8/2IxTncPOw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=1gBzTTWT
Subject: Re: [Buildroot] [PATCH v5 1/3] board/zynqmp/post-image.sh: add
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
> By switching to the LINUX_DTBS variable, the post-image.sh script can now
> work regardless of whether a user is using BR2_LINUX_KERNEL_INTREE_DTS_NAME
> or the BR2_LINUX_KERNEL_CUSTOM_DTS_DIR for custom hardware. This simplifies
> the transition users will make when migrating from a zynqmp evaluation board
> to a zynqmp custom platform.
>
> To keep the example post-image script as simple as possible, it assumes that
> the first DTB in the LINUX_DTBS list is the one for creating the system.dtb
> filename that u-boot will use for booting. Users are free to implement their
> own post-image scripts for use cases with multiple DTBs.
>
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
> V1->V2:
> - removed unnecessary $BINARIES_DIR from symlink source
> V2->V3:
> - ignore anything after the first space char of LINUX_DTBS
> V3->V4:
> - use make print-vars to get LINUX_DTBS variable
> V4->V5:
> - fixed shellcheck issue
> ---
>  board/zynqmp/post-image.sh | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/board/zynqmp/post-image.sh b/board/zynqmp/post-image.sh
> index f44b66342d..67b0be65b7 100755
> --- a/board/zynqmp/post-image.sh
> +++ b/board/zynqmp/post-image.sh
> @@ -2,13 +2,9 @@
>
>  # By default U-Boot loads DTB from a file named "system.dtb", so
>  # let's use a symlink with that name that points to the *first*
> -# devicetree listed in the config.
> -
> -FIRST_DT=$(sed -nr \
> -               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="(xilinx/)?([-_/[:alnum:]\\.]*).*"$|\2|p' \
> -               "${BR2_CONFIG}")
> -
> -[ -z "${FIRST_DT}" ] || ln -fs "${FIRST_DT}.dtb" "${BINARIES_DIR}/system.dtb"
> +# devicetree in the LINUX_DTBS list.
> +LINUX_DTBS="$(make --no-print-directory VARS=LINUX_DTBS printvars)"
> +ln -fs "$(basename "${LINUX_DTBS%% *}")" "${BINARIES_DIR}/system.dtb"

The whitespace-based string mangling still feels a bit fragile to me, but
it should be OK in the practice as I don't think we support paths with
spaces.

Also there was a concern about what happens in case the first file is a
dtbo, but the old code does not support it either so this patch is not
breaking anything. dtbo-first-in-the-list support can be added later with
more sophisticated scripting if needed.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
