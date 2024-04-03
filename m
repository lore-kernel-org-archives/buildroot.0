Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A060CCD128A
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 21:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62FC2417C2;
	Wed,  3 Apr 2024 21:08:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g4wrtUMmJh7f; Wed,  3 Apr 2024 21:08:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 333FA4188E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 333FA4188E;
	Wed,  3 Apr 2024 21:08:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A77261BF3D4
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 21:08:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 951E960D53
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 21:08:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kYLL4OnOJ5xC for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 21:08:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1D6DF60750
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D6DF60750
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1D6DF60750
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 21:08:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6F0B2E0003;
 Wed,  3 Apr 2024 21:08:11 +0000 (UTC)
Date: Wed, 3 Apr 2024 23:08:10 +0200
To: Wojciech Nizinski <wojciech.nizinski@grinn-global.com>
Message-ID: <20240403230810.5e8b9e21@windsurf>
In-Reply-To: <20230914165046.3687491-1-wojciech.nizinski@grinn-global.com>
References: <20230914165046.3687491-1-wojciech.nizinski@grinn-global.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712178491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vP3hUkeUbzAp/zsAtYhGV2ouDo4r8O3RpIEGc/ppyrU=;
 b=fLE6MknfXFYLjvre3Jqyfoh8a01Ogz0OkkRk0qazkYypQifXR9BDN8vuRwhig+wAOqLUIN
 K5bGbBhvQEgn3NN2acBDJb95de3pHvcj3XvJJn34hDIj0QgFPRyepNE5SpOyUDpMEkzE7h
 wxJj/BOZ24zIE5KRUgx9x9lXSHNSX00+mrbnOfevY2bQnETJpZHQKCY4g3OYHKsmb0V3Aw
 vfAH8qhx+LAZRrTYzNxsi3IOs/BtyNeanCt0liZJRhL9TZxIrbXLiNc6mc3CaFEXeDi18c
 7E6WKyygV59QTwpDI1dAW00dpzp4oMl5+nufZ9knXdT0A6BleRgthPV9iN1pAQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fLE6Mknf
Subject: Re: [Buildroot] [PATCH 1/1] board/freescale/common/imx:
 imx8-bootloader-prepare: enable error checking
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 14 Sep 2023 18:50:46 +0200
Wojciech Nizinski <wojciech.nizinski@grinn-global.com> wrote:

> Run script with 'errexit' bash option to detect any errors from
> subcommands.
> 
> It will fix situation where 'ddr_fw.bin' was missing but successfull
> build created broken boot image. Post image script report this by:
> 
> cat: /home/user/buildroot/output/images/ddr_fw.bin: No such file or
> directory
> 
> and build finish with success.
> 
> Signed-off-by: Wojciech Nizinski <wojciech.nizinski@grinn-global.com>
> ---
>  board/freescale/common/imx/imx8-bootloader-prepare.sh | 1 +
>  1 file changed, 1 insertion(+)

Applied to master after changing to use set -e. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
