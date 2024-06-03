Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB186C25B75
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 16:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0A4060B1E;
	Mon,  3 Jun 2024 16:26:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OiS2MycW95gH; Mon,  3 Jun 2024 16:26:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56FC460A91
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56FC460A91;
	Mon,  3 Jun 2024 16:26:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D048A1BF397
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 16:25:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C908840505
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 16:25:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EWDFP4rDTnoQ for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 16:25:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7AEF2404D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AEF2404D7
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7AEF2404D7
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 16:25:48 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id A3ACDC1D01
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 16:22:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E0B06FF803;
 Mon,  3 Jun 2024 16:22:15 +0000 (UTC)
Date: Mon, 3 Jun 2024 18:22:14 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20240603182214.658d55f5@booty>
In-Reply-To: <20240603120020.189821-1-neal.frager@amd.com>
References: <20240603120020.189821-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1717431736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U6ckLsvTzAACfnx9eqnQ/1b0eVtlpXuRzNER+TRXZd0=;
 b=nd5c0xQZXQe/iNDRAyAt0A3AkwKyOmFLT0I1aBaJBBTt9uSwilGzBiHki+SGis0iq3mwAo
 Ewp/jSQLM0oV+u89F38bCwWk6XwkK+wu16jCsPw2FR3cXaiP1c1jMlLGNO/QwyRs52kVYs
 9TKg36m+3XWTPBjItUTLKsir/qJHz2/FCAs5LIS6vtTm3x0lBNOXkxEhuCTKpA/JMACSB7
 T4QlbJO6PAikbHIW/H1Gk3CcZfYWuOfnD3Uu/fi/MX5P2TQP+/Y+2EgEQoCGYIxBONV7re
 4grAtaWHc243veXKSDPwYIlm79k6rgkpeTa6dw/RfbbUhCc0jwmXgfU6qCtssw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nd5c0xQZ
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/versal_vck190_defconfig:
 bump to xilinx-v2024.1
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: ibai.erkiaga-elorza@amd.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 3 Jun 2024 13:00:20 +0100
Neal Frager <neal.frager@amd.com> wrote:

> This patch bumps the versal_vck190_defconfig to xilinx-v2024.1 which includes
> the following updates:
> 
> - Linux v6.6.10
> - U-Boot v2024.01
> - ATF v2.10
> - PLM xilinx-v2024.1
> - PSMFW xilinx-v2024.1
> 
> Removed ATF patches that were needed for ATF v2.8.

Cool!

> Signed-off-by: Neal Frager <neal.frager@amd.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
