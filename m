Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B116BC48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 23:00:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80BC840872;
	Tue,  6 Feb 2024 23:00:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PdyjjLJ8-Ah2; Tue,  6 Feb 2024 23:00:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A093940880
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A093940880;
	Tue,  6 Feb 2024 23:00:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 288E21BF2C4
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 23:00:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1FF174031D
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 23:00:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BQhGVe_HIbcD for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 23:00:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 011314031E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 011314031E
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 011314031E
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 23:00:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 90AB61C0003;
 Tue,  6 Feb 2024 23:00:34 +0000 (UTC)
Date: Wed, 7 Feb 2024 00:00:33 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20240207000033.55001acb@windsurf>
In-Reply-To: <20230810221020.12181-1-giulio.benetti@benettiengineering.com>
References: <cc3dd6f5-9a38-70bb-7df5-ecebf9ca4bb6@benettiengineering.com>
 <20230810221020.12181-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707260434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SiL6wjT9wQDJasf54d8HGRljo2nDrEd+or8gAF6wR0o=;
 b=R1P8IuouuCZkQMOc1VI/GHeW7BcyjBT0rRyaF2PS71k6zmhYZo2sCl8XXkbyoceR6qPGDd
 XhrQlNE2Jqju4ztKeEZKSoHy+WkRVnJWInbb6opdO9Bo9Y4ltsB+gtAZFeg6hDCl5i/L2i
 6e3ndNapFlhjodVcsAUBscr4H3IMXl1/TtwDWaFbvVEaN2Z0ykPZ1P1Xt8snkNa5knd41A
 XUIdAI0KejqAk1exfJgZJavgXwJ6LUva9bFPSodj+SBeZhHiuyZ8uLL2Vw01djcDXgdL3Q
 ZHzB++UJk2ov4cgw3WhdFsoVPiI/eXnvHyyaTjr6+TqGN2zrgSV6pmBFi+0nrQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=R1P8Iuou
Subject: Re: [Buildroot] [PATCH v2] configs/asus_tinker_rk3288_defconfig:
 switch to zImage and bump Linux to 6.1.44, U-Boot to 2023.07
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
Cc: Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 11 Aug 2023 00:10:20 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> uImage is almost deprecated so let's switch to zImage. Let's also bump
> Linux version to 6.1.44, U-Boot to 2023.07 and remove
> BR2_TARGET_UBOOT_NEEDS_PYTHON3 since it's selected by
> BR2_TARGET_UBOOT_NEEDS_PYLIBFDT.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> V1->V2:
> * changed uImage to zImage in extlinux.conf
> ---
>  board/asus/tinker/extlinux.conf      | 2 +-
>  configs/asus_tinker_rk3288_defconfig | 7 ++-----
>  2 files changed, 3 insertions(+), 6 deletions(-)

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
