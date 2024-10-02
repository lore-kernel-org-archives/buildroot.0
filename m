Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF5EACF8540
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 21:03:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 828F041C1C;
	Wed,  2 Oct 2024 21:03:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L_l_NnTpkdg6; Wed,  2 Oct 2024 21:03:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8139F41C90
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8139F41C90;
	Wed,  2 Oct 2024 21:03:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 550FC1BF30E
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 41B9541C5D
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:03:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A1Im2PiODp4K for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 21:03:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DDA7641425
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DDA7641425
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DDA7641425
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 21:03:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F1C171C0002;
 Wed,  2 Oct 2024 21:03:08 +0000 (UTC)
Date: Wed, 2 Oct 2024 23:03:08 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20241002230308.13a23975@windsurf>
In-Reply-To: <20240926214942.201199-1-james.hilliard1@gmail.com>
References: <20240926214942.201199-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1727902989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RtIU67+m0TR8nwsSbUp4AIbtmhXtPH7otYGf6IZYzTA=;
 b=i/tU0MUB9msD+167eL7xkm2SymT89v6y+yDOWWHKQcB1mTcZPsvaoVoQx2ttXzOWvs8r6I
 iE94b8SNcFJIrMaUQ5xey16Jg1CVfHeoPVr+ft8BQ7ZdWHWcJgsP4fPkLRQeJNuoR2NGxq
 xQnLtqgA8vftkEYVFymIuku9nCqkYbluSjmG2xewd8P8E85oRhx5ZseX8dL/Y05A3YP3h2
 FDqxSW+z4m0pG+uvQ8UBaNp4+uTMmdg/yguDEgOvI/op8qSCSXK0RPc4vLwG4WYFwlnFsA
 G8M1+xh7vsj6hBJuXceirnhCNpTl86xOTpmhAsy3lG+QIRhxX4Qxf1eVPWbifA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=i/tU0MUB
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pdm-backend: bump to
 version 2.4.1
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 26 Sep 2024 15:49:42 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-pdm-backend/python-pdm-backend.hash | 4 ++--
>  package/python-pdm-backend/python-pdm-backend.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
