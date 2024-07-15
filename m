Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C353C3DA4B
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 19:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2245405F2;
	Mon, 15 Jul 2024 19:45:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kyJyZS15qN2w; Mon, 15 Jul 2024 19:45:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9ED8A40622
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9ED8A40622;
	Mon, 15 Jul 2024 19:45:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BE65F1BF3D4
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 19:45:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AACE840622
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 19:45:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BwOLJPg6v69Q for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 19:45:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4FF3D405F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FF3D405F2
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4FF3D405F2
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 19:45:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5F23120004;
 Mon, 15 Jul 2024 19:45:31 +0000 (UTC)
Date: Mon, 15 Jul 2024 21:45:30 +0200
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Message-ID: <20240715214530.18b1ce0f@windsurf>
In-Reply-To: <20240228202414.719244-2-buildroot@bubu1.eu>
References: <20240228202414.719244-1-buildroot@bubu1.eu>
 <20240228202414.719244-2-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721072731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hX3p6h2Sy3IKRVh+40uH+YUzMssTxtbcwnxX/mGuj0M=;
 b=XiAJ8n6eh5eEpnDDhmrfMaXgNixzMU5ry6d3CEARDzW5SOkded9mHJWcAEV//Zt/g4viEI
 0WX+cDp8H6tEqR2Hnw1BRIvIA1JuJNXDSmVDVGSJYFxHCZER3GHUVwdv2AcRZqNyDGvtyy
 LJw9dynfhFoNKG3/438aIeh6R8Hb6FIHijwGvxn1Ac/UWJz5G0mGBUTx5tEn/3S/e31I1E
 TweeoEwEtZ8OiMn6wbyHOkbTtOyub8s7+OBKAg4rnk9I5FX3e74jCr00ehQxrwrFMaWDHE
 TCmXrCy14yKC9HgIuOgmj3JruTkSsmM3y5KpCNLHFLyW7ZuBYswHpkmZAYUOew==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XiAJ8n6e
Subject: Re: [Buildroot] [PATCH v2 2/2] package/picotool: new package
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
Cc: Samuel Martin <s.martin49@gmail.com>, Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Marcus,

On Wed, 28 Feb 2024 21:24:13 +0100
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

>  package/Config.in              |  1 +
>  package/picotool/Config.in     | 16 ++++++++++++++++
>  package/picotool/picotool.hash |  3 +++
>  package/picotool/picotool.mk   | 15 +++++++++++++++
>  4 files changed, 35 insertions(+)
>  create mode 100644 package/picotool/Config.in
>  create mode 100644 package/picotool/picotool.hash
>  create mode 100644 package/picotool/picotool.mk

Entry in the DEVELOPERS file was missing, so I added one.

> diff --git a/package/picotool/picotool.mk b/package/picotool/picotool.mk
> new file mode 100644
> index 0000000000..c98284c491
> --- /dev/null
> +++ b/package/picotool/picotool.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# picotool
> +#
> +################################################################################
> +
> +PICOTOOL_VERSION = 1.1.2
> +PICOTOOL_SITE = https://github.com/raspberrypi/picotool/archive/refs/tags

This should have used the $(call github,...) macro since they don't
provide specific tarballs other than the auto-generated ones.

> +PICOTOOL_SOURCE = $(PICOTOOL_VERSION).tar.gz

This can therefore go.

> +PICOTOOL_CONF_OPTS = -DPICO_SDK_PATH=$(STAGING_DIR)/usr/include/pico-sdk

And this had to be adjusted to usr/share/pico-sdk.

Applied with those minor fixes. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
