Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77656D2447F
	for <buildroot@archiver.kernel.org>; Fri, 11 Oct 2024 06:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43A9E8203E;
	Fri, 11 Oct 2024 06:31:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sZE9C_mAnUns; Fri, 11 Oct 2024 06:31:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56C1382040
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56C1382040;
	Fri, 11 Oct 2024 06:31:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 626951BF385
 for <buildroot@lists.busybox.net>; Fri, 11 Oct 2024 06:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 51054418A1
 for <buildroot@lists.busybox.net>; Fri, 11 Oct 2024 06:31:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NeMT9_3EFxDE for <buildroot@lists.busybox.net>;
 Fri, 11 Oct 2024 06:31:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1ED78409D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1ED78409D7
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1ED78409D7
 for <buildroot@buildroot.org>; Fri, 11 Oct 2024 06:31:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0219B1BF203;
 Fri, 11 Oct 2024 06:31:13 +0000 (UTC)
Date: Fri, 11 Oct 2024 08:31:10 +0200
To: Geoff Levand <geoff@infradead.org>
Message-ID: <20241011083110.6352921c@windsurf>
In-Reply-To: <069f33b1-3f9d-41a4-b664-29b399d78f44@infradead.org>
References: <069f33b1-3f9d-41a4-b664-29b399d78f44@infradead.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1728628274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SoFgEkqLls6eWokw3jdbp8694eLqVF1JYCtgHXJI1Ps=;
 b=VeifrpwUL4wf7z17kxjW34pMMYHxIbkGmdkUcjJDTcRnEJ8JVLlNrmZ918N/M32vvgJkqf
 3X4ncKCqNkCWTdcOT1A5Xmr1CjksuYuCvioyfwmoKcB6EqPwdmDgU1Yxu9QsOi/k2GKL42
 z6oiEiavP3fc+aYiquk5ltXrRaZx2t44bcyshRJjAoQStoSXZdbvIZT2JGMrWqGfFw6zD0
 HV+SurQOQNzvtzhIIo7J3lk+fAXlT2fSD6dZVDqWVteP4goiQe7TeF4ylaoIGNQM7jEWVW
 xOMfVOOwn193t3rJPilgVEPAH/0+zOGrkSk3DvYQzbHFlzffPcHQurlxfj53zQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VeifrpwU
Subject: Re: [Buildroot] package/flannel: bump to version 0.25.7
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

On Fri, 11 Oct 2024 09:12:59 +0900
Geoff Levand <geoff@infradead.org> wrote:

> Signed-off-by: Geoff Levand <geoff@infradead.org>
> ---
>  package/flannel/flannel.hash | 2 +-
>  package/flannel/flannel.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
