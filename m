Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302EFE73156
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 10:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7605440A7B;
	Mon,  2 Feb 2026 10:22:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MHfpQLEDtL0d; Mon,  2 Feb 2026 10:22:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F0D840A16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770027762;
	bh=c6tL8nvRSRq4jm70hWT3krZgLalSjMcQM148ISbqIMA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AYEuAVMehB4QtEs874PcNc7CTCOAgGmfbV8gis87eSKcgx8gDldHXvCAD9X8IFCEo
	 i0A2GdjhKs0+bNmGxWGbCbA9i4D5wVEH5V+bOuUp+V9looBsUTpInFmTLSlAatdTCw
	 JUkL+7nmch2uhUiOPEGNrRE6RNo8tZImX7SlyfakXrNuHfr2CoAGEOW/S94G9GBPOx
	 EORHtTtNBEuXqBWVD9MdMNPFXQjETxozSwY8Q/AomeH2WPGQrdW2+qecvwskNRtSQE
	 /YQbq+bUDUnM3JLfyf+7sfrCQAxwV8Y0MOmvoewdfH8ytVoSZFZMGASL58GtjcZmSg
	 juF8Fpp8YySdQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F0D840A16;
	Mon,  2 Feb 2026 10:22:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DFE7A149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C58DE60714
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:22:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NDACh41IlcXx for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 10:22:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BD3CE60618
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD3CE60618
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BD3CE60618
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:22:39 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 15C094E42367
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:22:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DFDFE60767;
 Mon,  2 Feb 2026 10:22:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 43EAD119A8888; Mon,  2 Feb 2026 11:22:36 +0100 (CET)
Date: Mon, 2 Feb 2026 11:22:35 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Leon Anavi <leon.anavi@konsulko.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Fabrice Goucem <fabrice.goucem@oss.nxp.com>, 
 Jagan Teki <jagan@amarulasolutions.com>,
 Lothar Felten <lothar.felten@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>
Message-ID: <aYB6cGiRy50rk5i6@windsurf>
References: <20260114195451.3978704-1-giulio.benetti@benettiengineering.com>
 <20260114195451.3978704-10-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260114195451.3978704-10-giulio.benetti@benettiengineering.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770027757; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=pgIPQ7WJXvql+kX03Ivj1tkAIhFVQI4XovFwOtsVC4M=;
 b=hO19C1z6rk41yreRMvuenQ9kEBK+yVgSp0GiqMF0UmBfWqK/uGcs4sJPcWt+/wYQ6GnP9v
 eOCOKv4sAv4hDADRcmt07lik5DKc47We3OF6bwuojiyqf+e/k7Bx5ZdV+dw5e493VP9J35
 x1vE6R9Seh99HHL1qbSUrI+WHqdEqYSlVvCZ/K8WXp/w3XJHPPFkQ3YdWhp9Fxoyca3fLO
 zwbjgcyAWELMqaxPi8XDCO68iir3Q8FhdXC+wMZTZzzcjde9nNQZwG81uR3qBj6D3iRNgt
 DsHHyWLPopo0Hbk0ZicApLpCcap4SglKJolHdH79tMzu3+cKf7K1lZ8J88kQBQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=hO19C1z6
Subject: Re: [Buildroot] [PATCH 09/17] board/olimex/axx-common: introduce
 folder to avoid files redundancy
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

On Wed, Jan 14, 2026 at 08:54:42PM +0100, Giulio Benetti wrote:
> All sunxi boards can be handled by the same exact fileset so let's
> introduce axx-common folder with hash patches, overlay, genimage and a
> linux local patch to be switched to by subsequent patches.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

If there's a common folder, I guess it should be named
allwinner-common or something like that, because it's hard to realize
from the name that axx-common refers to "Allwinner boards".

However, I am not sure I am a fan of sharing the hash files. Indeed,
it will only work if all those boards are always bumped all together,
which may not be the case in the future: one contributor may only have
access to just one board, or a subset of boards, and would therefore
only be able to provide a defconfig bump for the subset of the boards
he has access to.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
