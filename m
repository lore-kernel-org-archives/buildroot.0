Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F3DBC48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 16:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1742E61292;
	Tue,  6 Feb 2024 16:38:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1742E61292
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lbwWwMIB5mYj; Tue,  6 Feb 2024 16:38:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BE2D612CB;
	Tue,  6 Feb 2024 16:38:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BE2D612CB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9B7DB1BF311
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:38:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8910C82C2E
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:38:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ouzpWSsYPWvb for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 16:38:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8379582BFD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8379582BFD
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8379582BFD
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 16:38:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B4DFF1C000E;
 Tue,  6 Feb 2024 16:38:17 +0000 (UTC)
Date: Tue, 6 Feb 2024 17:38:17 +0100
To: Marleen Vos via buildroot <buildroot@buildroot.org>
Message-ID: <20240206173817.35dea315@windsurf>
In-Reply-To: <20231219121508.1695768-6-marleen.vos@mind.be>
References: <20231219121508.1695768-1-marleen.vos@mind.be>
 <20231219121508.1695768-6-marleen.vos@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707237497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kaYIdPof37495UpKx8tAAbGVfoCwS7RLtEukxW7pR7E=;
 b=RGifjugUrQINJvMnnkfK5FgaT2INtgq1/O8LTlUrZ68V8SQ1HGiUZPOzFHwcMfdKdLu50t
 6VRh87yLYT7DVDA/Vw/buMq1+NMTwmkE/+n9He2qO9vRI3dUC3VlK7UvQt9UGabnqVzFzt
 OaLPZqYPNCDVMiS5q2uBw5T8lBKnA+fM/1VuykD6ZlLEt3VTrDOmk5bWLeDzEcaQGkUkwG
 WqdrbZHxsL6mWgJeSDalecd6hmhT2YhvWTyMZ3HBKE6HPYRxBSpQFTfOkHHlKyh+VPbqYh
 OYMZxPVfPrlwPT9GOdIU2miNwVTEeEN3absLQF0B3XM9c2hWappOkjniTBo0QQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RGifjugU
Subject: Re: [Buildroot] [PATCH 5/7] configs/stm32mp157a_dk1_defconfig:
 update arm-trusted-firmware to lts-v2.8.13
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
Cc: Marleen Vos <marleen.vos@mind.be>, marleen.vos@essensium.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 19 Dec 2023 13:15:06 +0100
Marleen Vos via buildroot <buildroot@buildroot.org> wrote:

> From: Marleen Vos <marleen.vos@mind.be>
> 
> The assumption is that updates to the stable branch should not break anything,
> so we use the latest LTS rather than a specific version.
> 
> Signed-off-by: Marleen Vos <marleen.vos@mind.be>
> ---
>  configs/stm32mp157a_dk1_defconfig | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Applied to master after adjusting the changes in the defconfig file to
the changes we made to the option name, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
