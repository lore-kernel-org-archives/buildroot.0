Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A2D7C3DA42
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 21:13:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B4D161045;
	Wed, 10 Jul 2024 21:13:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G1HrPAER-9bw; Wed, 10 Jul 2024 21:13:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A500860EDF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A500860EDF;
	Wed, 10 Jul 2024 21:13:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 256011BF292
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12C75408EC
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:13:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b3ciFzZ5etkW for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 21:13:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AD80340903
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD80340903
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AD80340903
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 21:13:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D93931BF203;
 Wed, 10 Jul 2024 21:13:04 +0000 (UTC)
Date: Wed, 10 Jul 2024 23:13:03 +0200
To: Josua Mayer <josua@solid-run.com>
Message-ID: <20240710231303.118c44c9@windsurf>
In-Reply-To: <20240710144257.27528-1-josua@solid-run.com>
References: <20240710144257.27528-1-josua@solid-run.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720645985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VOrNV26aWDBKoFAV+oyjWTxU7s/IHn2H6o/GSNUdIdU=;
 b=Yrwl0qvSh/hyYGVDRIZ8YuXvzB20R/Fu4KcJXvtrCZD8RhZYKNpA1WzIJ/Mnj3yZovkYJ+
 OFbBNqAi2fCrDOpkGqByDSFI1lN10vGJNN3F3R0+mj78fBg8qUSa/ThumTL3qSHCQyXd0X
 o2MttEtpwan3Mql/HcvBoOltkNqjkDc5z/tnnu0HNvgOeQRXTsEKqM6k1Texq5UWeupMiO
 VoxQ8cdCYQn/fgJIvexKCkYoO6WUiNCi8WVH+Wv65XuiyZwjRFbSLyl5ndiYgfzDbW8TTz
 2n1Jcm1WLecW+XRGukgL11jbAnHUC++VWcBKiTY/phnRFnhlHBtrFlG1rFlQcw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Yrwl0qvS
Subject: Re: [Buildroot] [PATCH 1/1] package/openocd: add config variable
 for imx_gpio driver
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

On Wed, 10 Jul 2024 16:42:57 +0200
Josua Mayer <josua@solid-run.com> wrote:

> +config BR2_PACKAGE_OPENOCD_IMXGPIO
> +	bool "Enable support for bitbanging on NXP i.MX family"

Simplified to:

	bool "bitbanging on NXP i.MX family"

to be like the other options in OpenOCD, and applied your patch. Thanks
a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
