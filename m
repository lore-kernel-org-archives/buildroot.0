Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D4A7C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 20:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E696340202;
	Fri, 12 Jul 2024 20:44:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 53AXeV74hV50; Fri, 12 Jul 2024 20:44:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C14EF405F5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C14EF405F5;
	Fri, 12 Jul 2024 20:44:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C9A981BF420
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C47C78203B
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:44:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YvoILEaRZfVj for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 20:44:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9C4A882038
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C4A882038
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9C4A882038
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 20:44:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E597FE0002;
 Fri, 12 Jul 2024 20:44:40 +0000 (UTC)
Date: Fri, 12 Jul 2024 22:44:40 +0200
To: Petr Vorel <petr.vorel@gmail.com>
Message-ID: <20240712224440.1118f3ed@windsurf>
In-Reply-To: <20240712184241.256166-1-petr.vorel@gmail.com>
References: <20240712184241.256166-1-petr.vorel@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720817081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WhuY9ejdQ8vOoXH7OwhwOwP+L9S1QjGxRWyZ0WQB1kY=;
 b=Qo0PeyBtL7wKI/Jm8RYzMFZFG6zZbOyUmZKOrQR4r/cLiGNZqOjqgIy3d/oJz8W++sz8PR
 9QqryfSfV0AswfVENTc+Fj6s/8Mfmx9fTUPbN4mJDfc88JRKCl2zJERXoOxPsoyRUGYPUC
 0o5lGwP79HrNkCnKLITn1t1y1cIyunIm/jSaK/nNFw1V8uzthlTNr/OBtWMT55K6GHOR7q
 aUetAOuJnIfOQ59HVs1qTGYThH+qt1N08BBgaudLaDw5a/t0UpoAQ/lHew21es6zrSAow7
 Ouib+IImA/RIOJRNXK5czFSjxr/K+HYJi/1I9e10NR+W9PkuLXN2U8EmKTOO3Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Qo0PeyBt
Subject: Re: [Buildroot] [PATCH 1/1] package/ima-evm-utils: bump version to
 1.6
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 12 Jul 2024 20:42:41 +0200
Petr Vorel <petr.vorel@gmail.com> wrote:

> Upstream moved git repository.
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

Thanks for the update, one important comment below.

> -IMA_EVM_UTILS_VERSION = 1.5
> -IMA_EVM_UTILS_SITE = https://github.com/mimizohar/ima-evm-utils/releases/download/v$(IMA_EVM_UTILS_VERSION)
> +IMA_EVM_UTILS_VERSION = 1.6
> +IMA_EVM_UTILS_SITE = https://github.com/linux-integrity/ima-evm-utils/releases/download/v$(IMA_EVM_UTILS_VERSION)
>  IMA_EVM_UTILS_LICENSE = GPL-2.0
> -IMA_EVM_UTILS_LICENSE_FILES = COPYING
> +IMA_EVM_UTILS_LICENSE_FILES = LICENSES.txt

This change should have called for a review of what changed... and
there has actually been some change. If you look at the LICENSES.txt
file, it clarifies the licensing, and our statement GPL-2.0 is no
longer correct. It should now be:

+IMA_EVM_UTILS_LICENSE = LGPL-2.0+ (libimaevm), GPL-2.0+ (evmctl)

I fixed that up and applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
