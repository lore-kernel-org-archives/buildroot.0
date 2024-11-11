Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D65D3ABF5
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 20:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 129DC402A2;
	Mon, 11 Nov 2024 20:19:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LWBzzxxO-vWV; Mon, 11 Nov 2024 20:19:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD5E8402A3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD5E8402A3;
	Mon, 11 Nov 2024 20:19:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B84CDB1
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 20:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C356808A4
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 20:19:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eL_YVKz5G-Da for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 20:19:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5F2D58089C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F2D58089C
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F2D58089C
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 20:19:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6EE65E0003;
 Mon, 11 Nov 2024 20:19:50 +0000 (UTC)
Date: Mon, 11 Nov 2024 21:19:49 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Antoine Tenart <atenart@kernel.org>, Marcus
 Folkesson <marcus.folkesson@gmail.com>
Message-ID: <20241111211949.6f844f31@windsurf>
In-Reply-To: <20241110193734.1463141-2-james.hilliard1@gmail.com>
References: <20241110193734.1463141-1-james.hilliard1@gmail.com>
 <20241110193734.1463141-2-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1731356390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bfEYJELI1Fhnfy3rFchYzXE4vSWQhYYeKKFk4wkyQQA=;
 b=mzCekJ5NvWlbP2tpRB2s3huZUfXTZaA4S1gpQMrDomNbe5P9JhfUR7o4dYDKK6ggKG/B9m
 9arGbBvTPGHxhGGy2b0N49I2n8vOnvld519O2VGrcPQ4sFDBeg5oehFCRGDFwQx5FIhmKv
 BWTNnBMYPgNSs/4SvJQtC7xF+rcsiXWSD8ouFJW75mOvsP9uTcd5kDMFWqC5UJZRiqzzyc
 uz0Rbvg0EnjJtHtLjUxZRVekv5D98AHgVVx36mSmnOfHQf/UF2m8j8VxJKzKbbTNvrhlNV
 TtJqfTdtubRaqwEYHZy/yJFxlijw/6i3qH3sqG6icRndq3hGiVQljYdI+ADYKg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mzCekJ5N
Subject: Re: [Buildroot] [PATCH v2 2/2] package/swig: bump to version 4.3.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Sun, 10 Nov 2024 12:37:34 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/swig/swig.hash | 2 +-
>  package/swig/swig.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Thanks for this patch. Could you provide some details on how well you
tested the reverse dependencies of host-swig?

Based on your PATCH 1/2, you tested libselinux, but what about the
other packages? I certainly don't require testing *all* of them, but
since this bump has caused some breakage for libselinux, we can
potentially expect some breakage for other packages. Could you build a
defconfig with a good number of reverse dependencies enabled, and
verify it builds OK, and report this in the commit log?

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
