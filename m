Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDFB1C433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Jun 2022 14:49:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56B4C404E5;
	Tue, 21 Jun 2022 14:49:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56B4C404E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yctRy7gqfEwX; Tue, 21 Jun 2022 14:49:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C47E404E9;
	Tue, 21 Jun 2022 14:49:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C47E404E9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 66CB81BF5A5
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 14:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4176A827CE
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 14:49:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4176A827CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SHM4TueV7e3c for <buildroot@lists.busybox.net>;
 Tue, 21 Jun 2022 14:49:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C10381B17
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C10381B17
 for <buildroot@buildroot.org>; Tue, 21 Jun 2022 14:49:47 +0000 (UTC)
Received: from relay12.mail.gandi.net (unknown [217.70.178.232])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 00A37D1D89
 for <buildroot@buildroot.org>; Tue, 21 Jun 2022 14:45:26 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 146CC20000F;
 Tue, 21 Jun 2022 14:45:20 +0000 (UTC)
Date: Tue, 21 Jun 2022 16:45:19 +0200
To: Neal Frager <neal.frager@xilinx.com>
Message-ID: <20220621164519.3d81885b@booty>
In-Reply-To: <20220620110843.35930-1-neal.frager@xilinx.com>
References: <20220620110843.35930-1-neal.frager@xilinx.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1655822722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Fk9QBj5VdBJRUH2YVOEKxyTATbmXM9+BCnRFfQurpk=;
 b=fmC0KsD+va8SMwCyUyLAnViQv2NTC4nUiAReaogy6CyUXaAFSUu0zV3bDb7PsAsjg70BkQ
 /BtEWl8c4ozvfBubgvCV79xhKFCOlSCsBK/VKmRowl297z8ssuUSJP7tW8uLryWQzSxcG9
 nmQ3oPe8fKjvhZ3kPFTNwwxFplbKT72VH4Du4peI4IoW2DtuCFYhzszaa6jJ9TjjESVoNW
 tecwb4KDHu3jcx8GP9mMoW4CSXVL11rMXEQM/s3sU4jKGy3LZhV3837WbANCyeS4je8wro
 bbfp0AM3uvPRpUDV1nEo68jfl9BWRfms71to9bhQJXqsNVwXfHkNi9pnD3l0jg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fmC0KsD+
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/zynqmp_kria_kv260_defconfig:
 fix to u-boot.itb generation
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
Cc: buildroot@buildroot.org, wesley@sonifex.co.uk,
 giulio.benetti@benettiengineering.com, michal.simek@amd.com,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On Mon, 20 Jun 2022 05:08:43 -0600
Neal Frager <neal.frager@xilinx.com> wrote:

> This patch is a temporary fix for the kv260 u-boot.itb generation
> until a proper fix has been implemented within u-boot.
> 
> This patch will be removed from buildroot once u-boot can build a
> correct u-boot.itb for the kria kv260 starter kit.
> 
> Signed-off-by: Neal Frager <neal.frager@xilinx.com>

Can you provide a brief explanation of what the problem is and a link
to any page documenting what effort (if any) is ongoing to fix it at
its root?

Other than that, looks good.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
