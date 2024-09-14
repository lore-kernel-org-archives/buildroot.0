Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADCA2C0219B
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 14:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 244F5406EC;
	Sat, 14 Sep 2024 14:36:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ZamSrEjF-zP; Sat, 14 Sep 2024 14:36:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D43634196F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D43634196F;
	Sat, 14 Sep 2024 14:36:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 44BFF1BF28C
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 14:36:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3443684373
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 14:36:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6WkmQZl6F_dh for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 14:36:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 17E8C8436E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17E8C8436E
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 17E8C8436E
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 14:36:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0AE6AE0005;
 Sat, 14 Sep 2024 14:36:03 +0000 (UTC)
Date: Sat, 14 Sep 2024 16:36:02 +0200
To: "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>
Message-ID: <20240914163602.7c27c66d@windsurf>
In-Reply-To: <20240911135234.2928130-1-guillaume.chaye@zeetim.com>
References: <20240911135234.2928130-1-guillaume.chaye@zeetim.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726324564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QuGnyqAndEr+JFW7eZlD3hZpiWvun9bFMQ1nEASTYsM=;
 b=d9pN1OZPVx9k+qH8zuSeMbDv+dmMofFYlCvIlSVSsPRpSBJRSCGgm85haxd3XEKjc5UDpv
 BYF7bly5PVn+qJJmlS2kDynr2lcD0IWorl89wOBD/qNvLIRLIv1cDHjIuBWpZt5Ro+Z3V3
 Kf4MEfU9OcIdqw5xVvGlE+b9+ZitIdqO+fX9g2khLldYrPuTg3DHz8coG/3wdppHkESUQC
 IsBZvgQKQrzYBnNz6kVdtAQaXBrBemuRgnT6dxPd5oLZf8GWDG08UbjrYhh2KdcRVU0yN7
 RtYcRp0zf60308JNOhCKJjQRCkOBG3ibQBKEQU/DYTNGf4RhE2H8nUVjNIqy8A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=d9pN1OZP
Subject: Re: [Buildroot] [PATCHv2 1/1] package/wpa_supplicant: add
 configuration for WPA3-Entreprise
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Thanks for the new patch. Question/comment below.

On Wed, 11 Sep 2024 15:52:34 +0200
"Guillaume GC. Chaye" <guillaume.chaye@zeetim.com> wrote:

> Signed-off-by: Guillaume GC. Chaye <guillaume.chaye@zeetim.com>
> ---
>  package/wpa_supplicant/wpa_supplicant.mk | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
> index 984959f679..dbd8eea690 100644
> --- a/package/wpa_supplicant/wpa_supplicant.mk
> +++ b/package/wpa_supplicant/wpa_supplicant.mk
> @@ -126,18 +126,28 @@ ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_WPS),)
>  WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_WPS
>  endif
>  
> +# WPA3 configurations:
> +# - CONFIG_OWE: Opportunistic Wireless Encryption (OWE)
> +# - CONFIG_DPP,CONFIG_DPP2: Easy Connect (Device Provisioning Protocol - DPP R1 & R2)
> +# - CONFIG_SAE: WPA3-Personal (SAE)
> +# - CONFIG_PASN: PASN

You're mentioning CONFIG_PASN here.

> +# - CONFIG_SUITEB, CONFIG_SUITEB192: WPA3-Enterprise (SuiteB-192)
>  ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_WPA3),y)
>  WPA_SUPPLICANT_CONFIG_ENABLE += \
>  	CONFIG_DPP \
>  	CONFIG_SAE \
>  	CONFIG_SAE_PK \
> -	CONFIG_OWE
> +	CONFIG_OWE \
> +	CONFIG_SUITEB \
> +	CONFIG_SUITEB192

... but it isn't anywhere here.

And symmetrically, CONFIG_SAE_PK is in the list, but not in your
comment.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
