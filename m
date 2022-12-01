Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE90C43217
	for <buildroot@archiver.kernel.org>; Thu,  1 Dec 2022 08:49:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABDA860E02;
	Thu,  1 Dec 2022 08:49:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABDA860E02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LWLS1iC41mUu; Thu,  1 Dec 2022 08:49:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB51060C04;
	Thu,  1 Dec 2022 08:49:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB51060C04
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C3EF81BF3BB
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 08:49:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D2D741571
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 08:49:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D2D741571
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N0dtdWSxQ3qx for <buildroot@lists.busybox.net>;
 Thu,  1 Dec 2022 08:49:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67B89408DB
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 67B89408DB
 for <buildroot@buildroot.org>; Thu,  1 Dec 2022 08:49:19 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::227])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id EAB70D1674
 for <buildroot@buildroot.org>; Thu,  1 Dec 2022 08:39:14 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D8BA920008;
 Thu,  1 Dec 2022 08:39:08 +0000 (UTC)
Date: Thu, 1 Dec 2022 09:39:07 +0100
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20221201093907.3638b51e@booty>
In-Reply-To: <20221126105350.14687-3-neal.frager@amd.com>
References: <20221126105350.14687-1-neal.frager@amd.com>
 <20221126105350.14687-3-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669883949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0HLp4GrpPTZc14puLE4hpo+jhLCjGdt2tQW1c6vbfOk=;
 b=kAI6iizKRij0mt52WMw8RiFJZ1+47Z0KQHv9nZdsoI51Mt0A0iLsWdMS4X375l4q6YSy6o
 3l1zFBoVMJ3WilaF6zDFfYdiuLic2P4YiYBDLeQQ4Ng1CfvGoAlJ/lmbtMxFb/m/AnCQGT
 iVxrrL7NcaI4SRrWJpsH3s1wRF/xdui13YS87nFfXAH9Bg82lL3ay9KKFZmcsbADQfQBsX
 YXaUAh+KR1OQjNmBRNcGIIEN/lv792LASlRqF4nYvgLFYof98eqcPX+HmT6AQdfuPs+YVy
 6IOsfm/dUmPiHtwimw/z4w5fEymR2vBDSCcFHeVo6tcuWNaakFCTE8jVtUr8yQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kAI6iizK
Subject: Re: [Buildroot] [PATCH v1 3/3] configs/zynqmp_kria_kv260_defconfig:
 bump to Xilinx 2022.2
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

On Sat, 26 Nov 2022 03:53:50 -0700
Neal Frager <neal.frager@amd.com> wrote:

> This patch bumps the zynqmp_kria_kv260_defconfig to Xilinx release 2022.2.
> 
> Xilinx 2022.2 includes:
> - U-Boot 2022.01 bug fixes
> - Linux bump to Linux 5.15.36 with bug fixes
> - TF-A 2.6 bug fixes
> - PMUFW bug fixes
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
