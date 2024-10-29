Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF85D74941
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 21:33:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49B838146C;
	Tue, 29 Oct 2024 21:33:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t7xPEBp7YhaU; Tue, 29 Oct 2024 21:33:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 583C58146F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 583C58146F;
	Tue, 29 Oct 2024 21:33:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9296E494E
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 21:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72FDD405F4
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 21:32:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id itUhRe9HLqzT for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 21:32:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2194E4055E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2194E4055E
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2194E4055E
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 21:32:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 67DBB20002;
 Tue, 29 Oct 2024 21:32:56 +0000 (UTC)
Date: Tue, 29 Oct 2024 22:32:55 +0100
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Cc: buildroot@buildroot.org, Biagio Montaruli <biagio.hkr@gmail.com>
Message-ID: <20241029223255.40274d67@windsurf>
In-Reply-To: <b5c97a2a-49da-40a8-b546-059ee0bee52e@grenoble.cnrs.fr>
References: <b5c97a2a-49da-40a8-b546-059ee0bee52e@grenoble.cnrs.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730237576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rZZlgCv2nhVbXWJKeon3GqbPkJHMbZfOc/Dpw9em/g8=;
 b=Ug7gOy4JOlmdYkYi0FMn+yS9Ic96quIRSdDiQayWG+inpM2oPZi3z4QMnY5KHLjm5MpOVb
 TQdiY8LXeXlNkdrLL832bOsMlaji0WfC+q2dI0A+0y8C6n0MMXWlSD4GiBfdE/K02et2cc
 F+giSaEZMswIqvrPwZ1EtdBlXPzQQ+uFkxw07/6XCiT0G4hrN+BwRp2PMdL13j37f/XQ6A
 yXSL4wNU3OmxgijoUkuORpopQlln6tCJTvGvL+RJQR+Hul7N55nQxqwERAu2+tWhRzELY1
 o//PkiQR3+4omSE4saRFx4FRSoXY/JewxVqzSVGdIeXvVT60Skr0d3IntIRgUg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ug7gOy4J
Subject: Re: [Buildroot] [PATCH 1/1] board/acmesystems/acqua-a5: update
 device tree for newer kernels
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

On Mon, 23 Sep 2024 12:28:51 +0200
Edgar Bonet <bonet@grenoble.cnrs.fr> wrote:

> The Ethernet MAC address of the Acqua board is stored in an onboard
> EEPROM. Its location is described in the device tree as:
> 
>         eeprom@58 {  // NVMEM node
>                 // EEPROM parameters...
> 
>                 eth0_addr: eth-mac-addr@9A {  // NVMEM cells
>                         reg = <0x0 0x06>;
>                 };
>         };
> 
> Since Linux 6.5, defining NVMEM cells this way, as direct children of
> the NVMEM node, is deprecated. It is instead recommended to wrap the
> cells inside a "fixed-layout" node.
> 
> The older, deprecated syntax is still supported on Linux 6.6. Since
> Linux 6.7 (commit 2cc3b37f5b6d: "nvmem: add explicit config option to
> read old syntax fixed OF cells") however, it is only supported by
> selected NVMEM drivers. It is not supported by the at24 driver used to
> access the Acqua's onboard EEPROM.
> 
> Update the device tree to the new, recommended, syntax. This makes it
> work with newer kernels, while preserving compatibility with the
> currently used 6.6.30.
> 
> Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
> ---
>  board/acmesystems/acqua-a5/at91-sama5d3_acqua.dts | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)

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
