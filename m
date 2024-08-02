Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0814EC3DA7F
	for <buildroot@archiver.kernel.org>; Fri,  2 Aug 2024 21:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4347612F9;
	Fri,  2 Aug 2024 21:42:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id onqG1WfbmSdW; Fri,  2 Aug 2024 21:42:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A42DC61310
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A42DC61310;
	Fri,  2 Aug 2024 21:42:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 946471BF3FF
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 21:42:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82168820AA
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 21:42:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FnSmvB-7WCYk for <buildroot@lists.busybox.net>;
 Fri,  2 Aug 2024 21:42:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5C96E81C19
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C96E81C19
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C96E81C19
 for <buildroot@buildroot.org>; Fri,  2 Aug 2024 21:42:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 506D340003;
 Fri,  2 Aug 2024 21:42:42 +0000 (UTC)
Date: Fri, 2 Aug 2024 23:42:41 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240802234241.05441cd1@windsurf>
In-Reply-To: <20240724141911.2693092-1-dario.binacchi@amarulasolutions.com>
References: <20240724141911.2693092-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722634962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=74GPX3jWJvcIQM+TiNI5I2gaJNrGEWwg2buuXKnP/tc=;
 b=WyCAI0bQo4Y++Qe1r6Fhe1rpKWpzoM8f4J/NchOLcDJDikNX++ddjaF4jlIiJhTFRGLMJn
 UT/jAuU1dxzCfA9o8fHXHlZmlsfBsf1wBK/BJJpJMXTh6NHYt8fTHazwFgyVnjJNCg6COV
 5v4aLGyOv2Ti84k5/siFwAtgEhU5Xa/fR5DYyFI3njIccqAtMzZg4MJwSlglu0SB1EpPru
 4HilArlyacwTf52bdzuJzFyNp+WUc7dnIvjfUAfPpjP4rfmI0a5pg0WXiEP0QX/GJYsfSL
 qQD18T+OHRj1QUzThPgd/etyUCdyFdfWU0HTqzD4/JzyG80jPp1kAirtL/IBOQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WyCAI0bQ
Subject: Re: [Buildroot] [PATCH 1/1] configs/imx8mn_bsh_smm_s2[_pro]: bump
 TF-A, U-Boot and Linux versions
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
Cc: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 24 Jul 2024 16:19:11 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> This patch bumps:
> 
>   - TF-A to version v2.10
>   - U-Boot to versione v2024.07
>   - Linux kernel to version 6.10
> 
> The TF-A bump required applying a patch, sent upstream, to fix a
> regression in the domain access permissions configuration for the boot
> console UART.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  ...rop-UARTs-domain-permissions-setting.patch | 65 +++++++++++++++++++
>  .../arm-trusted-firmware.hash                 |  2 +-
>  .../patches/linux/linux.hash                  |  2 +-
>  .../patches/uboot/uboot.hash                  |  2 +-
>  configs/imx8mn_bsh_smm_s2_defconfig           |  8 +--
>  configs/imx8mn_bsh_smm_s2_pro_defconfig       |  8 +--
>  6 files changed, 76 insertions(+), 11 deletions(-)
>  create mode 100644 board/bsh/common/imx8mn-bsh-smm-s2/patches/arm-trusted-firmware/0001-fix-imx8m-drop-UARTs-domain-permissions-setting.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
