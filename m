Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 754FCC636D4
	for <buildroot@archiver.kernel.org>; Wed,  1 Feb 2023 21:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7FEC41964;
	Wed,  1 Feb 2023 21:59:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7FEC41964
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jQw3DDlJoqSe; Wed,  1 Feb 2023 21:59:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE61B416BC;
	Wed,  1 Feb 2023 21:59:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE61B416BC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0F2FF1BF215
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 21:59:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D66E760BEE
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 21:59:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D66E760BEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ITx2HzXZzrBx for <buildroot@lists.busybox.net>;
 Wed,  1 Feb 2023 21:59:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3592060BE2
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3592060BE2
 for <buildroot@buildroot.org>; Wed,  1 Feb 2023 21:59:02 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::222])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 37B01C91EA
 for <buildroot@buildroot.org>; Wed,  1 Feb 2023 21:52:45 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2A3CB40004;
 Wed,  1 Feb 2023 21:52:38 +0000 (UTC)
Date: Wed, 1 Feb 2023 22:52:37 +0100
To: Graeme Smecher <gsmecher@threespeedlogic.com>
Message-ID: <20230201225237.0fb5dacb@booty>
In-Reply-To: <20230201195956.1758827-1-gsmecher@threespeedlogic.com>
References: <20230201195956.1758827-1-gsmecher@threespeedlogic.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675288359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RCTVa3MwSVMGJH+czvUFpv8uiK12L3X/iV/bVG4KWl8=;
 b=aupcWMi4NlbQ1fVoyhSLUadCQpmEg1YAjDZrYdqaKuppxIFTYpcPEl2y7XfXWYCS1Heu99
 R1+SYnXBfgV9k+tqcmGJyDhZ4PnHSbV485WbjvUXcZng/lTBS+r1gg3ZqOGNguTbQf094q
 mcArdhYZtVSqkE4Av9r3SNCcueYy3AZIwk3i5fgLiE3Lbef+CSbfJhE8g34U52/U9Im6j9
 etZAeRF5JHx9V/kXttbmJiSwmFPtVMKpwioJiweptkactkopqLX5xh8pw6Tx/3smCtRl+D
 jAwpkSSblFIrylTMTNlI4tGuGb0uocQARs4XJqJaq0ntjXGp1OUOXmoXpLXEyg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aupcWMi4
Subject: Re: [Buildroot] [PATCH 1/1] board/zynqmp/post-image.sh: Don't
 insist on a xilinx/ prefix for .dts files.
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Neal Frager <neal.frager@amd.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Graeme,

On Wed,  1 Feb 2023 11:59:56 -0800
Graeme Smecher <gsmecher@threespeedlogic.com> wrote:

> If using BR2_LINUX_KERNEL_CUSTOM_DTS_PATH to copy .dts files from
> buildroot into the linux tree, these .dts files are copied to
> arch/arm64/boot. Unfortunately, the post-image.sh script expects to find
> them in arch/arm64/boot/xilinx.
> 
> This patch does not require the xilinx/ prefix to be present when
> symlinking the device-tree to system.dtb where u-boot expects to find
> it.
> 
> Signed-off-by: Graeme Smecher <gsmecher@threespeedlogic.com>
> ---
>  board/zynqmp/post-image.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/board/zynqmp/post-image.sh b/board/zynqmp/post-image.sh
> index ed6dbe188c..c5de2db820 100755
> --- a/board/zynqmp/post-image.sh
> +++ b/board/zynqmp/post-image.sh
> @@ -5,7 +5,7 @@
>  # devicetree listed in the config.
>  
>  FIRST_DT=$(sed -nr \
> -               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/([-_/[:alnum:]\\.]*).*"$|\1|p' \
> +               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="(xilinx/)?([-_/[:alnum:]\\.]*).*"$|\2|p' \

I think the following simpler change would also work. Can you check
that please?

-               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/([-_/[:alnum:]\\.]*).*"$|\1|p' \
+               -e 's|^BR2_LINUX_KERNEL_INTREE_DTS_NAME="([-_/[:alnum:]\\.]*).*"$|\2|p' \



-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
