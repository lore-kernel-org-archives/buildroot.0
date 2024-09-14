Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7640C02195
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 12:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 373CF404FF;
	Sat, 14 Sep 2024 12:42:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1h-JwhPy4K_h; Sat, 14 Sep 2024 12:42:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A29264020B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A29264020B;
	Sat, 14 Sep 2024 12:42:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2785F1BF232
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 12:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 16BC860683
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 12:42:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tIS_l5r47z5E for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 12:42:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C22FF600B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C22FF600B8
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C22FF600B8
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 12:42:03 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [IPv6:2a02:61:a2::3f4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 7279F780331;
 Sat, 14 Sep 2024 14:41:54 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 14 Sep 2024 14:41:54 +0200
Date: Sat, 14 Sep 2024 14:41:54 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <ZuWEkowisJrRJa2O@landeda>
References: <20240908144815.3822467-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240908144815.3822467-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726317720;
 bh=hw/+j9Cwm9P5YMwzxoofCfa6z73Nvva9WhTSewj6n1I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JgV75RA3m+oUhB0pzxRJJhGF9D43IGXgAs/DM99GvSPlcFFNTVFJyo3GO8aOOA9k2
 lPTLiOJQ7H6Ouh3CEqRji5Ceb2j95O/05QU+J1PoFxli1z7jNaCWi7uURb+8ebzG7Z
 wO682DlHEdAM4auM17yxGsDxB3nsech9iDePN/YHYUuWkyhoooWgaxo99LEKOlKg9J
 MPB0bpxBsIwvHm1L76aGd3MFjKgjTiPX1r78UH81qKmDIzoVAQ0UmK1B5Kqq28SxVu
 Ypb+I7XeanBMZIwcMb7pXzYSRx0Kl10nTsJm92kyDEezi+USzbn8MTHbBakgSxr51v
 ApXB7WUfBLxSg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=JgV75RA3
Subject: Re: [Buildroot] [PATCH v4 1/2] package/iana-assignments: new package
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
Cc: Floris Bos <bos@je-eigen-domein.nl>, Heiko Thiery <heiko.thiery@gmail.com>,
 linux-amarula@amarulasolutions.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dario, All,

On 2024-09-08 16:48 +0200, Dario Binacchi spake thusly:
> The fixing of [1] and related code reviews [2] and [3] highlighted the
> need for a package providing a versioned PEN (Enterprise Numbers)
> registry file from IANA (Internet Assigned Numbers Authority).
> The GitHub repository from which this package originates is a mirror of
> the IANA registries periodically updated from https://www.iana.org/protocols.
> 
> [1] http://autobuild.buildroot.org/results/5ae5ee948d99679cd50d1115a7d46f4368347b4f
> [2] https://patchwork.ozlabs.org/project/buildroot/patch/20240902210055.239859-1-dario.binacchi@amarulasolutions.com
> [3] https://patchwork.ozlabs.org/project/buildroot/patch/20240904174021.2670289-1-dario.binacchi@amarulasolutions.com/
> Co-Developed-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Co-Developed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
[--SNIP--]
> diff --git a/package/iana-assignments/iana-assignments.mk b/package/iana-assignments/iana-assignments.mk
> new file mode 100644
> index 000000000000..824b26d4ecf6
> --- /dev/null
> +++ b/package/iana-assignments/iana-assignments.mk
> @@ -0,0 +1,18 @@
> +################################################################################
> +#
> +# iana-assignments
> +#
> +################################################################################
> +
> +IANA_ASSIGNMENTS_VERSION = bf358dc8d89b7939557220b8055699b42a4133e9
> +IANA_ASSIGNMENTS_SITE = $(call github,larseggert,iana-assignments,$(IANA_ASSIGNMENTS_VERSION))

The licensing information was missing, so I added the CC0-1.0 license,
as noticed by Thomas.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> +ifeq ($(BR2_PACKAGE_IANA_ASSIGNMENTS_PEN_REG),y)
> +define IANA_ASSIGNMENTS_INSTALL_PEN_REG
> +	$(INSTALL) -D -m 0644 $(@D)/enterprise-numbers/enterprise-numbers \
> +		$(TARGET_DIR)/usr/share/misc/iana/enterprise-numbers
> +endef
> +IANA_ASSIGNMENTS_POST_INSTALL_TARGET_HOOKS += IANA_ASSIGNMENTS_INSTALL_PEN_REG
> +endif
> +
> +$(eval $(generic-package))
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
