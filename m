Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D338C433FE
	for <buildroot@archiver.kernel.org>; Fri,  4 Nov 2022 07:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A683081FD9;
	Fri,  4 Nov 2022 07:48:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A683081FD9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SjcwoeHYlxLA; Fri,  4 Nov 2022 07:48:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F267581FC8;
	Fri,  4 Nov 2022 07:48:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F267581FC8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8EB5E1BF399
 for <buildroot@lists.busybox.net>; Fri,  4 Nov 2022 07:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6168E81FC8
 for <buildroot@lists.busybox.net>; Fri,  4 Nov 2022 07:48:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6168E81FC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZDLdIkTdUOKU for <buildroot@lists.busybox.net>;
 Fri,  4 Nov 2022 07:48:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4940981FAF
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4940981FAF
 for <buildroot@buildroot.org>; Fri,  4 Nov 2022 07:48:38 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (unknown [217.70.183.200])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id B00E5C3B58
 for <buildroot@buildroot.org>; Fri,  4 Nov 2022 07:41:15 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 980B72000E;
 Fri,  4 Nov 2022 07:41:09 +0000 (UTC)
Date: Fri, 4 Nov 2022 08:41:05 +0100
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20221104084105.33684019@booty>
In-Reply-To: <20221103112339.42954-1-neal.frager@amd.com>
References: <20221103112339.42954-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667547670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9RhQyPEJbo8/VtcanZnYGvK33LDlCIXz8tRSaiXFKhs=;
 b=U/6Id4aNsPEuLAPH4CuGwluQ+ioLygwE1MYFm9FCEbRHWiDcTwA32dJmkLLSiK6L/oqpXW
 H+6FPZ7zAP2pu63DnzUxoo0STqy13+EcWTgAs84QyBI5DVawJcwGR/2SJ5D9BSA0AGbBsB
 SoVW3TdYTV5/+Rksw4hCd9YE7U6GdHYSKOVM5GL2mVItrw2roYmgd6pzkOmrRU9hmQ+mqK
 U72X59RDI+rIHqlfpyf2SXMgiqghlx7FvrcKaKeDk2WMbbpWQqA9EDxV9ZujXuF9/CwUpZ
 ms081HvvM56SqJa1lFHHUaCZd8JDCxh62n506Qilc/VFCXdzMKgy71aNzpywNw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=U/6Id4aN
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/zynqmp_zcu10x_defconfig: use
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS
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
Cc: michal.simek@amd.com, thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On Thu, 3 Nov 2022 05:23:39 -0600
Neal Frager <neal.frager@amd.com> wrote:

> This patch migrates the u-boot device tree definition
> from uboot.fragment files to use BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS
> instead for the zynqmp_zcu102 and zynqmp_zcu106 defconfigs.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Reviewev-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Thanks!

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
