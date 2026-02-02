Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBB80E73152
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 10:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3617607A5;
	Mon,  2 Feb 2026 10:18:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hrtO2Xhwa40m; Mon,  2 Feb 2026 10:18:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 563B260667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770027499;
	bh=P98Gs9JUet4wN2FD5Aa1wWNkcPcQPVtiSyxjFEtKZ5w=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=c/rmY75O1RghTTblvz1LFbl7qBsvGMn6fLYs8jWZ+2/1ItLtv1idH2D6BBckSDKGW
	 L5QrXUrN6Pnpfk/VS+mO9NJO7qx9gYT+rt7RSLMWuvQxIPIxn8FfHAO67XdqP6Qy+z
	 mvwDk2vHQD3CMiPXdce6Cddhv31zK9JL30gfjKZ8oK7oOgfdJBhjA0N7oQIZNUoYCm
	 2kHFAkq1qZv3AY21zqiXoWpuGp4HAep6B04voAvcgW/wmvRX0o48mG/K55asAN5AvZ
	 gWKPzLi8UPVAkx+4Glihb94G4ZfiG6xt9fK0j94guvIIswV5EoJfvBNknpk57LX/wS
	 pwGXm/7gjeYfw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 563B260667;
	Mon,  2 Feb 2026 10:18:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E766B149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D62AB40A40
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:18:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vx5CmAAJu6nL for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 10:18:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BB8BF40A27
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB8BF40A27
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BB8BF40A27
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:18:16 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 93377C237FE;
 Mon,  2 Feb 2026 10:18:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DAE5460767;
 Mon,  2 Feb 2026 10:18:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2343D119A8888; Mon,  2 Feb 2026 11:18:12 +0100 (CET)
Date: Mon, 2 Feb 2026 11:18:12 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Leon Anavi <leon.anavi@konsulko.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Fabrice Goucem <fabrice.goucem@oss.nxp.com>, 
 Jagan Teki <jagan@amarulasolutions.com>,
 Lothar Felten <lothar.felten@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>
Message-ID: <aYB5yc5S4Gz9tYih@windsurf>
References: <20260114195451.3978704-1-giulio.benetti@benettiengineering.com>
 <20260114195451.3978704-5-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260114195451.3978704-5-giulio.benetti@benettiengineering.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770027494; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=dPwJg1ukvJsSUCgDGOtdJS6m/n4kM92UZsNx5JQ1o74=;
 b=S425T64kIukXUv8L4YOPm6BVQfa9kDLL3/tVWKIRtPxve9bLDW216R98Lj7a8O4DeIy9Hy
 hpdfexzAzRxms/yPmw1cFx3mAONbUupnEbVCq406EyZ02n3EL8B8i/ps1X/+pJ/lJih4w6
 TB0pCLq0qhTib9IgIEf8NL03J+4N/+MAafOVmBS3BaYqqQfypjITRtzCJEcqJMWum7mmH0
 PadUhDqfMDJ50O+L7m0LUaOQq+tjEHl/NxDB92BwrdufqiN7czCOV5jp3eFO/KKILKQNPP
 l3TxomicJsTff9GCmm4hnwEDvcn7whIbh/fwjkrikAb1nRquZfjAxEdCeZBfRw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=S425T64k
Subject: Re: [Buildroot] [PATCH 04/17] configs/bananapi_m2_berry: bump Linux
 to 6.18.5 and U-Boot to 2026.01
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

On Wed, Jan 14, 2026 at 08:54:37PM +0100, Giulio Benetti wrote:
> The patch:
> * bumps Linux kernel to version 6.18.5
> * bumps U-Boot to version 2026.01
> * forces check hashes
> * switches to extlinux

Causes:

WARNING: configs/bananapi_m2_berry_defconfig:0: lib_defconfig.ForceCheckHash was expected to fail, did you fix the file and forget to update .checkpackageignore?

> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> 
> bananapi berry sq

Probably result from a messed up rebase?

> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
