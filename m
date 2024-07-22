Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63AD7C3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 20:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBB3180AF1;
	Mon, 22 Jul 2024 20:42:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 05QHitu_pCiS; Mon, 22 Jul 2024 20:42:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF22B80B1C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF22B80B1C;
	Mon, 22 Jul 2024 20:42:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EDB401BF296
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 20:42:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB1C540424
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 20:42:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H84Hm6x0crVn for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 20:42:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 68B75401AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68B75401AF
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 68B75401AF
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 20:42:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6F23D40004;
 Mon, 22 Jul 2024 20:42:27 +0000 (UTC)
Date: Mon, 22 Jul 2024 22:42:26 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240722224226.5c8a2235@windsurf>
In-Reply-To: <20240213210523.166319-1-fontaine.fabrice@gmail.com>
References: <20240213210523.166319-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721680947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uAaNuXUXHZB/Z5xAsl6wxc4u/NBPcZQ1NjZzgKBnx6U=;
 b=ZtJM2C4lapZD6WbsL5ttAmERlSbCSbOBDWF30SG1wXcZ/rJFqu3DjnDRhcyk2RuAfQ6K5j
 /85N4pXVfNYVxzVkVY1QoM/5MEv8rHYsCvPqQkUsC3dOFThu0rQEm1ieQp8pfe0p9dCE9X
 VxO2maTuEcmznKSiVtWS2wF8wy/GcSdFC2q0s0kF2QM58RSdQTZgE7ojgVEqry6YA2Na+E
 G4F/UfRSHedDuKGyrz+Y1oEobp8bYEb2qEdj0zVnwarovboY5iDtSU2489K9KiJYuQ00br
 NhpWOkGPFPSge7Lvsj5e9jm+z2QYzmNyUhUbe7uqY44ikn7Nce05p6I/8BOmUg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZtJM2C4l
Subject: Re: [Buildroot] [PATCH 1/1] Revert "package/crun: allow building
 with uClibc"
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
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

+Alexey for ARC specific topic/question.

On Tue, 13 Feb 2024 22:05:23 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> This reverts commit 223596c75d73a7eb29152235d3c5d9bf53bd58f5 indeed
> fexecve is only available since
> https://github.com/wbx-github/uclibc-ng/commit/858ffad217076227089cc17eb832db0bd1497792
> resulting in the following build failure with uclibc < 1.0.33:
> 
> /home/thomas/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arceb-snps-linux-uclibc/9.2.1/../../../../arceb-snps-linux-uclibc/bin/ld: libcrun_testing.a(libcrun_testing_a-cloned_binary.o): in function `ensure_cloned_binary':
> /home/thomas/autobuild/instance-3/output-1/build/crun-1.8.4/src/libcrun/cloned_binary.c:540: undefined reference to `fexecve'
> 
> Fixes: 223596c75d73a7eb29152235d3c5d9bf53bd58f5
>  - http://autobuild.buildroot.org/results/9c4488d5d26e575f39bcbaed8e0793ed1cdb8cd5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/crun/Config.in | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

I don't think this is the right fix. The issue is occurring here with
the rather old Synopsys ARC toolchain, of which we're using version
2019.09. Turns out
that https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/
has much much newer versions available, so the right fix really would be to
upgrade.

Alexey, do you think someone on your side could work on this? Unless
Fabrice you're interested in having a look?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
