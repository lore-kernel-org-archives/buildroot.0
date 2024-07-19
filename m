Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA045C3DA59
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 16:34:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61CC082052;
	Fri, 19 Jul 2024 16:34:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ND553QtjjZh8; Fri, 19 Jul 2024 16:34:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 565BE8205E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 565BE8205E;
	Fri, 19 Jul 2024 16:34:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 07BB31BF313
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 16:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7BEB40163
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 16:33:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UWib-mzFIkd2 for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 16:33:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 804B940096
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 804B940096
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 804B940096
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 16:33:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9B7E3FF803;
 Fri, 19 Jul 2024 16:33:54 +0000 (UTC)
Date: Fri, 19 Jul 2024 18:33:51 +0200
To: Brandon Maier <brandon.maier@collins.com>
Message-ID: <20240719183351.47713dd7@booty>
In-Reply-To: <20240719-boot-uboot-env-select-v2-1-6abcd50db794@collins.com>
References: <20240719-boot-uboot-env-select-v2-1-6abcd50db794@collins.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721406835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+JfntKBqkKvcbiE+24Kr7tiy6hwY1jRul4+7PD3rS7w=;
 b=E+Sg6hbtVtrxuzQQR+5ytPWd2/GUbyAw/XhbGuMWxEMozqhiGmsYt346r0Mr+q3Bx5XOWm
 9K7kyRvfWiCrhEnGACyDell+NobZM24HPbc85pyqkTuqBFnBH831NXwA2LcT64APkRMEXw
 p6V4ONUaPC0oCzSPRT5YnDUurAQj6tLvlO41Ubeh6/YKZJPW4vfz7X7T6X0ANENK7ohRIW
 05y4Rkz3lfM50rfPFiEmUAjbhOQUKhK4ox13tkMwtQX8c9vaVvvrkTqKwJu/gB9CWMwrVV
 NFRW2I78T4uIRWVIi2Lbj4RKuCalowdunkpqD/IYoBjAgSx2fmZs7qHYPLrf+A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=E+Sg6hbt
Subject: Re: [Buildroot] [PATCH v2] boot/uboot: fix Kconfig warning for
 DEFAULT_ENV_FILE
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Brandon,

On Fri, 19 Jul 2024 14:50:26 +0000
Brandon Maier <brandon.maier@collins.com> wrote:

> The following warning occurs from commit "boot/uboot: allow taking the
> entire default environment from a text file".
> 
>   boot/uboot/Config.in:141:warning: config symbol
>   'BR2_TARGET_UBOOT_DEFAULT_ENV_FILE' uses select, but is not bool or
>   tristate
> 
> Add a hidden 'bool' config so we can enable dependencies.
> 
> In addition, the DEFAULT_ENV_FILE works by setting Kconfig options,
> therefore we also need to depend on
> BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG.
> 
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>

Thanks for addressing this so quickly!

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
