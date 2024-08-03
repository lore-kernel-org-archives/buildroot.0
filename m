Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD11C3DA4A
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 18:23:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 044084035A;
	Sat,  3 Aug 2024 18:23:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gYiTpgNqNhAT; Sat,  3 Aug 2024 18:23:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE45140382
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE45140382;
	Sat,  3 Aug 2024 18:23:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A5B171BF364
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 18:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 927E64015F
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 18:23:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XVuJTSDPlwUQ for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 18:23:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2925A400DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2925A400DA
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2925A400DA
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 18:23:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C4C3C60003;
 Sat,  3 Aug 2024 18:23:47 +0000 (UTC)
Date: Sat, 3 Aug 2024 20:23:46 +0200
To: Chris Dimich <cdimich2188@gmail.com>
Message-ID: <20240803202346.31a0626d@windsurf>
In-Reply-To: <20240611180207.2138847-8-cdimich2188@gmail.com>
References: <20240611180207.2138847-1-cdimich2188@gmail.com>
 <20240611180207.2138847-8-cdimich2188@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722709428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lFyxXmTFncU/TbgHlK2uWtYc+Qy+8W6wHDfm5zZASqs=;
 b=eaub7frtLO/BZt5HWeTXR2p5mC8OXnxbI/4WWoCKfebkVZdEFX+SvvLWy2qFYT9CPS4V3I
 /Zm7W1bv0BRiFJ6wIHR9aNJdozVkNB0OFwsneo3a3MRo+89F6ja4eE+xV3AfD0odeKvSCi
 58wBLPBf4lUxqkirNwYuSgo64BevXqDYFovW4Mil5TWHvo9JF0ycexjzTeveHQJC9EgTDD
 Ol4JYZyi7Atjky4/LFxSKD+sVFYPyCM4/Umx0oP+txwklctxm33t/n6ys5zh26syEHw/Tn
 7qY+SFjd3/dveuiW3QlLOgcFjdgXS5NlrsStZSwRbnZsZqeBPPxJAjaHU7e+3g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eaub7frt
Subject: Re: [Buildroot] [PATCH 7/8] configs/nitrogen8ulp: new defconfig
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Chris,

On Tue, 11 Jun 2024 11:02:06 -0700
Chris Dimich <cdimich2188@gmail.com> wrote:

> More details on the platform here:
> 
> https://www.ezurio.com/system-on-module/nxp-imx8/nitrogen8ulp-som
> 
> Signed-off-by: Chris Dimich <cdimich2188@gmail.com>
> ---
>  configs/nitrogen8ulp_defconfig | 63 ++++++++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)

Thanks for the patch! A new defconfig can never be standalone, it at
very least needs:

 - An entry in the DEVELOPERS file

 - A readme.txt (either for the board, or a common one, like
   board/boundarydevices/common/readme.txt)

> diff --git a/configs/nitrogen8ulp_defconfig b/configs/nitrogen8ulp_defconfig
> new file mode 100644
> index 0000000000..4ce6c29387
> --- /dev/null
> +++ b/configs/nitrogen8ulp_defconfig
> @@ -0,0 +1,63 @@
> +# Architecture
> +BR2_aarch64=y
> +BR2_cortex_a35=y
> +
> +# System
> +BR2_SSP_NONE=y

Please do not disable SSP, there's I believe no reason to do so.

Also, for new defconfigs, we require BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
to be enabled. ./utils/add-custom-hashes can help you to generate those
hashes.


> +# ARM Trusted Firmware
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
> +# Latest revision of branch boundary-lf-6.1.55-2.0.0
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/imx-atf/archive/d18357b7.tar.gz"

Maybe we could do instead:

$(call github,boundarydevices,imx-atf,d18357b7)/imx-atf-d18357b7.tar.gz ?

and ditto for others? (This is not a strong requirement, but we do this
in other defconfigs).

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
