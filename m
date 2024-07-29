Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8FFAC3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 17:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B64F6085A;
	Mon, 29 Jul 2024 17:43:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E2GllF35SLTZ; Mon, 29 Jul 2024 17:43:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5B4C6086B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5B4C6086B;
	Mon, 29 Jul 2024 17:43:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3C7401BF424
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 17:43:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 295DF403DA
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 17:43:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cpy3gzyLUW86 for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 17:43:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A3A4C403B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3A4C403B7
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A3A4C403B7
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 17:43:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C3D5FE0004;
 Mon, 29 Jul 2024 17:43:49 +0000 (UTC)
Date: Mon, 29 Jul 2024 19:43:48 +0200
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <20240729194348.340dcb60@windsurf>
In-Reply-To: <20240729115700.2355352-1-neal.frager@amd.com>
References: <20240729115700.2355352-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722275030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JuSP8cm+yb/2UOKnHWgitOqKmGWNTVnZvTkIN4GsPaE=;
 b=SAGty8QP/92KvJVdBzXVfzhHMNheNbibCJjDySkvdgecg2s4aa1AkfgRlng5kbIHTqXQgv
 69U6INfbmJY5qaejD3t3SQQh0o/hCukruF9s4hUoZU8P+rva92HrOf5rAH2/p5n4g529c1
 5qFJMhU6L07cXuPliv+zNMlhR9kzK5nDeo3cLC1+3R78bwhpcqM2w1oHo3qlJZRF5SgGNf
 jrnMz8IcVC0yL4lbdiAeSz7If9w9K+oRZXP5KL9GNdqsb8/hkntqcb83zKWe9ZJzwVL2yU
 BKeWFBVabUwLg/nhLzy2HlJ05FsRo3/2WXB+YetxB2moPbdXPO6tXru9mWrs3g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SAGty8QP
Subject: Re: [Buildroot] [PATCH v1 1/1] boot/xilinx-prebuilt: support future
 AMD Vivado versions
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
Cc: andy.a.kennedy@collins.com, ibai.erkiaga-elorza@amd.com,
 michal.simek@amd.com, brandon.maier@collins.com,
 Neal Frager <neal.frager@amd.com>, romain.naour@smile.fr,
 luca.ceresoli@bootlin.com, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 29 Jul 2024 12:57:00 +0100
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

> When creating a hardware platform for AMD Versal devices with the AMD Vivado
> Design Suite, the resulting XSA file has a file named "psm_fw.elf" included.
> This does not match the "psmfw.elf" filename that users will get when building
> the boot firmware from the Xilinx GIT repository.
> 
> A change request has been submitted to resolve this issue, so that future
> AMD Vivado Design Suite versions will generate XSA files including the boot
> firmware file named "psmfw.elf" to match the filename that is generated when
> building the firmware.
> 
> In order to support both current and future versions of AMD Vivado Design
> Suite, this patch changes the xilinx-prebuilt package to use the filename
> "psm*fw.elf" when obtaining the Versal boot firmware images from a user
> generated XSA file.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---
>  boot/xilinx-prebuilt/xilinx-prebuilt.mk | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

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
