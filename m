Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 663C7C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 30 Jul 2024 19:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F27CA81320;
	Tue, 30 Jul 2024 19:42:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IvBHxD3FdynA; Tue, 30 Jul 2024 19:42:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3B3D810B3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3B3D810B3;
	Tue, 30 Jul 2024 19:41:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DF6001BF2FA
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 19:41:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64855810B3
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 19:41:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yOIv1Gwz0zF5 for <buildroot@lists.busybox.net>;
 Tue, 30 Jul 2024 19:41:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 12D4680D63
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12D4680D63
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 12D4680D63
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 19:41:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 94931FF805;
 Tue, 30 Jul 2024 19:41:52 +0000 (UTC)
Date: Tue, 30 Jul 2024 21:41:51 +0200
To: Alexander Egorenkov <egorenar@linux.ibm.com>
Message-ID: <20240730214151.1384e9c9@windsurf>
In-Reply-To: <20240730134030.422533-1-egorenar@linux.ibm.com>
References: <20240730134030.422533-1-egorenar@linux.ibm.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722368512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KoEUORFk0UNiBrUtC8uULSzU1LVxeE6muXmXwF53Sqc=;
 b=mooJqXHumSx9b42bwMjInxEwEOdyU8BvCLysxErlGqAWvwJYoAd4vZ7ghznxB/oQ0p3AWb
 XqSbiSX+PnWcCYQh3mlmnDdSmLibE26neKo/NE0zhJDZOsaftbB+qunfXgwatO/7SGrDEt
 fch+iRfl6VwRBCrUWgba1KqGT5Q3aGBUoi2y/mZEi8pMC6N5cxY6Tl+P1p6ATxpgr1ZuJh
 Erf0FTVh9Zfst2xy0hFz5Y9LajDiKP30ptXAHiplOw+UcBD5GyxIKPpYQL+o5guD30ONgQ
 ufq7qiBzk8qNl1tUmIeQ50/C0TXRvqayx1c53Uip7tpC3I1iqNZhu9Xz+pIDSg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mooJqXHu
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/qemu: update defconfigs to
 Linux 6.10.2
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

On Tue, 30 Jul 2024 15:40:30 +0200
Alexander Egorenkov <egorenar@linux.ibm.com> wrote:

> Linux version is changed to 6.10.2 (LTS) for all qemu defconfigs.
> 
> Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>

Have you been able to test these? To test, you can push a branch on a
Gitlab repo named <whateveryouwant>-defconfigs-qemu, it will do a build
+ boot test of all Qemu defconfigs.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
