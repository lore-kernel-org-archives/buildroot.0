Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7658BC54798
	for <buildroot@archiver.kernel.org>; Sat,  2 Mar 2024 20:37:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2501A83051;
	Sat,  2 Mar 2024 20:37:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RLpX_8m4GCnF; Sat,  2 Mar 2024 20:37:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 442C5830DE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 442C5830DE;
	Sat,  2 Mar 2024 20:37:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 554411BF834
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 20:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4FEAD830DE
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 20:37:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7MO2SlghiJil for <buildroot@lists.busybox.net>;
 Sat,  2 Mar 2024 20:37:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2C74A83051
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C74A83051
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C74A83051
 for <buildroot@busybox.net>; Sat,  2 Mar 2024 20:37:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7FCC360004;
 Sat,  2 Mar 2024 20:37:36 +0000 (UTC)
Date: Sat, 2 Mar 2024 21:37:35 +0100
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20240302213735.468fecfb@windsurf>
In-Reply-To: <20240302111655.126267-1-francois.perrad@gadz.org>
References: <20240302111655.126267-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1709411856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uCm1oluElaMlBmGr1tIpzj2p5DkaV4VQKrd3tt0p39M=;
 b=IDM59BTvRkSR727jUb5JEHyDas68i9KUNh5E+hHnT9+DYgnVq9yBixVmboN2h/hwWkBDSP
 4QhXbKLOM7G9BxHlDwpLYiF15BhGV1+PoS6BzaFs1+NcgaLDD9tp649EmKuHgfrBCn0RBN
 v16izY/Hhbes3XsE3L1DBk3LcJHXcdA08O6DuMc9v4VRBYD9gpRKza0wFdXyZGzyWxJojr
 993BsSQHaX2b7NgoLwOajWyhRPWVZJb87/8ZIlByVgVgv/i59RLvPM2EnhwJiFL/juf1uc
 V9nuTL5Dt4XrWF6pe1bB14ZKdV+PsPD12i3r51aD9p4AhahKBVB41/wjifM1tA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IDM59BTv
Subject: Re: [Buildroot] [PATCH] package/quickjs: bump to version 2024-01-13
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  2 Mar 2024 12:16:55 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/quickjs/quickjs.hash | 2 +-
>  package/quickjs/quickjs.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
