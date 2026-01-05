Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E01C79F9E
	for <buildroot@archiver.kernel.org>; Mon,  5 Jan 2026 15:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA46D60BAA;
	Mon,  5 Jan 2026 15:33:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g1f0w6-miv40; Mon,  5 Jan 2026 15:33:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 474EA60B69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767627209;
	bh=EU74BQuO+CHyiYiErmcLMPT2cMEWEXb5CDatpvQznsQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QeLBxTsE9/dbJjodHIU2XwqBZtOLMui/dXW1UQ1yHz5a7/fmnC5RUJlQdIbKOK2ob
	 sLfIKl9Ryeu24nyxjhZ5X+b1rG/+NE1sOt4uyR4Z81eAs7UuiilZy2Mc6lhGv//j7e
	 E97EKUBioz3psaVCLd6kELZqRpeIU3wpbVstdxg0is5/wpyNlUUKPlQ694dm6NPrk9
	 DVn5lgs2z6hwlQI22lCrzYL5xe3Idq8s0ukDXoVMVieHHIyzUtg/t8nuqQk6fNyu6n
	 Zq0rkgly35t0rGgK76ZcSzqjXvrdXgducaqFd87kuVAD7+JViRAmZQNByHHsxBtdI2
	 hWoQL+qcffSeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 474EA60B69;
	Mon,  5 Jan 2026 15:33:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 140D8E7
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 15:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0686F80837
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 15:33:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7L8Mg6hSbOtK for <buildroot@buildroot.org>;
 Mon,  5 Jan 2026 15:33:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EAAAD80A93
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAAAD80A93
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EAAAD80A93
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 15:33:26 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id AC9B34E41F7F;
 Mon,  5 Jan 2026 15:33:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8167C60726;
 Mon,  5 Jan 2026 15:33:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B7BCB103C8524; Mon,  5 Jan 2026 16:33:19 +0100 (CET)
Date: Mon, 5 Jan 2026 16:33:18 +0100
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: buildroot@buildroot.org, Dario Binacchi
 <dario.binacchi@amarulasolutions.com>, Thomas Perale
 <thomas.perale@mind.be>, Titouan Christophe <titouan.christophe@mind.be>
Message-ID: <20260105163318.7dd83262@windsurf>
In-Reply-To: <20260105-uboot-2025-10-fix-build-on-lts-v1-1-51997f7758a4@bootlin.com>
References: <20260105-uboot-2025-10-fix-build-on-lts-v1-1-51997f7758a4@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767627202; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=r7SfUfF1xAW1OcPPx75xwmt/eEt1CGv2YCTApQLmHN0=;
 b=P+jMfn351cZy/LbSbJKasRCbCbn2J2wtucQfDkltnbEPKRODruG3U1qhcOTTXkzKSE0rBW
 vwZUS7e+Ng0Kh7C7ELxkWRKKGFZS/b2SY78xdqXHCPnzeleiBF7u/2s5icPIWtJxIRR9UK
 1LVepigMy4+JyvasHJLDY5sbkqloVgQHg8kSdQIamkNfdnEN9iZj63xZyKzdG07VexuwvM
 WzqRK3f3UBY9ofQO6BMCtzAYIpMl6heCb3bcbNMl/zSRuG2qFd7vtw9hmHoULJIEhVAHGy
 ebPrF7Qobx1ZF2RJP98VQxkGhKgfmsgnIH1NNLVuG41+1C10wBcKAYroyqN8tw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=P+jMfn35
Subject: Re: [Buildroot] [PATCH 2025.02.x] uboot: allow building versions >=
 2025.10
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

Hello,

Adding Thomas Perale and Titouan Christophe in Cc, as LTS maintainers.

On Mon, 05 Jan 2026 15:28:40 +0100
Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:

> With upstream commit a239b0b0b6db ("Add symlink from gpl-2.0.txt to
> a COPYING file"), COPYING is now a symlink to Licenses/gpl-2.0.txt,
> causing the install command in UBOOT_COPY_OLD_LICENSE_FILE to fail
> because the source and destination refer to the same file. To avoid
> this, copy the license file only if Licenses/gpl-2.0.txt does not
> already exist.
> 
> Link: https://gitlab.com/buildroot.org/buildroot/-/commit/128c26f2875dd60ed5fafe25f63b3da11bb79f60
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

> This change was applied on master as part of commit 128c26f2875d
> ("boot/uboot: bump to version 2025.10"). This commit is only taking the
> line to allow to building a recent U-Boot on stable branches.
> 
> To maintainers: I'm not sure whether I should set the original patch author
> as the author of this patch, or add a Co-developed-by, or something
> else. I'm fine with resending with such changes if they apply.

I think what you did is good enough, as it's not a backport of Dario's
patch, but really extracting a tiny bit of it.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
