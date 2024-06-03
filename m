Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B4DDC25B76
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 16:19:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D03EA40575;
	Mon,  3 Jun 2024 16:19:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hOF0cxSNH0aH; Mon,  3 Jun 2024 16:19:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8367340582
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8367340582;
	Mon,  3 Jun 2024 16:19:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9F6421BF397
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 16:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 87AAE40582
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 16:19:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oFiupxcZM68e for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 16:19:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 429D440575
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 429D440575
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 429D440575
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 16:19:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7FDC420004;
 Mon,  3 Jun 2024 16:19:11 +0000 (UTC)
Date: Mon, 3 Jun 2024 18:19:09 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20240603181909.50291720@booty>
In-Reply-To: <20240603115212.184529-1-neal.frager@amd.com>
References: <20240603115212.184529-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1717431553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=//PFZoHrty5qPOAuCnyznyKybOtXKyedZXKuMdRz7Iw=;
 b=DQ4+4igyiaUocQ3wzM5+uleYKN32nfM01GMiLk5BnHe5rAFa1u6wljG0ScZS+50CnhdHhW
 qXUhHWkrzB9mYEzxIMoue9Ll0P6lASUCRETEthP7mjL+OQvl4tLATLGvsE/I98mKRcPbv6
 ZvgAhmijAWeEbP+VUQ5+yeDo+tWPHN6SXodkZ+HH4uuYcKopdawsm4iDIAqEOJdJ2fwPE9
 jSmXGchl6K+1DCZCv9YoFCWG8OlKkW7SgGwjB4CYahTYm3VZFMlZzrS7oYIhb159r5depn
 TPLje+Ac4f6y3LF78mhvaNoKDMxtOnm3fWyE6Kojx/C28bYQd1IgJGYxchDLgg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DQ4+4igy
Subject: Re: [Buildroot] [PATCH v1 1/3] configs/zynqmp_zcu102_defconfig:
 bump to xilinx-v2024.1
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
Cc: ibai.erkiaga-elorza@amd.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Neal,

On Mon, 3 Jun 2024 12:52:10 +0100
Neal Frager <neal.frager@amd.com> wrote:

> This patch bumps the zynqmp_zcu102_defconfig to xilinx-v2024.1 which includes
> the following updates:
> 
> - Linux v6.6.10
> - U-Boot v2024.01
> - ATF v2.10
> - PMUFW xilinx-v2024.1
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

> -BR2_GLOBAL_PATCH_DIR="board/zynqmp/patches"

Along with the Kria KV260 + KR260 series you sent in the same day
today, this patch dir will become used only by KD260. Do you have such
an upgrade for KD260 in your pipeline?

If you do, then it's fine, we can keep this directory until then.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
