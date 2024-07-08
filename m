Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D71C4C3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 20:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A969B60804;
	Mon,  8 Jul 2024 20:24:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HV9Xxy6u7STl; Mon,  8 Jul 2024 20:24:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC3B760A8C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC3B760A8C;
	Mon,  8 Jul 2024 20:24:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9F71E1BF390
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8CEF340133
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:24:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MjRySN44_bs8 for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 20:24:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6C8314033A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C8314033A
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C8314033A
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 20:24:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 26E1FFF805;
 Mon,  8 Jul 2024 20:24:50 +0000 (UTC)
Date: Mon, 8 Jul 2024 22:24:50 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240708222450.0003b5ee@windsurf>
In-Reply-To: <20240706154005.3823542-1-dario.binacchi@amarulasolutions.com>
References: <20240706154005.3823542-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720470291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mD4PsNb4tb9+GL3azO9TUUSZam6r+maqfjMOiFWd6VY=;
 b=YVRD+8ezTGubYQ+b5cbrROCEZQ92Fv7FSMxVg4nZuAmhpEQ4y1ZSjbgYqZSWkRkEDNsb5A
 4e3wRT5N6AsstzJo6hL4iA+K4Mj6gcTv4htC2drC2GfozB2hz8joJsyNMZ9NLWMnsQCMi8
 nc1LrH8lr1IUFLKgNRdIXgwFXSiYvTN12VgAWqt6M6GckXTKWWnM2tP6eN4vBorLqY4c8y
 /m3hQCgiHF8PYwVfIHJ3iYXvj63KUe+GFjkxAmnHR7qOWrOll6RRrnYlm9ua5Lye/B4K2c
 MfSekeH/Cu2nc+5j8Sk5tdSRcdHHUwRAOUCmkCUSIRoSGI/5RiOY38ynnn/m+g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YVRD+8ez
Subject: Re: [Buildroot] [PATCH 1/1] package/freescale-imx/imx-vpu-hantro:
 fix patch fuzz
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
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>,
 Gary Bisson <bisson.gary@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  6 Jul 2024 17:40:05 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
> fuzz factor to 0") reduced the fuzz factor.
> 
> Due to this change, imx-vpu-hantro fails to build with output:
> 
>     Applying 0001-Fix-ion.h-header-inclusion-to-be-standard.patch using patch:
>     patching file Makefile_G1G2
>     patching file Makefile_H1
>     patching file decoder_sw/software/linux/dwl/dwl_linux.c
>     Hunk #1 FAILED at 50.
>     1 out of 1 hunk FAILED -- saving rejects to file decoder_sw/software/linux/dwl/dwl_linux.c.rej
>     patching file h1_encoder/software/linux_reference/ewl/ewl_x280_common.c
>     Hunk #1 FAILED at 52.
>     1 out of 1 hunk FAILED -- saving rejects to file h1_encoder/software/linux_reference/ewl/ewl_x280_common.c.rej
> 
> This commit refreshes the package patch on the current package version.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  ...001-Fix-ion.h-header-inclusion-to-be-standard.patch | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

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
