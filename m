Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2953E7314E
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 10:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B73C40A3C;
	Mon,  2 Feb 2026 10:14:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1OPJ5P-HNqt9; Mon,  2 Feb 2026 10:14:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B492F40A16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770027277;
	bh=9/PS1QPXMRsxtdurqAkVoMXU09Tbeu1W95A0PnEYvAE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EwH799LqeAiAng9575MiBHvrnUDXTUaQ7fbaMO0xtQy/z+dVHr9rKU5XQHqsdiFWL
	 hFh4ff7N4Y266ZY/iUyOzbVuHET6i5oK9z6C+5/sVNJgF7dGjRkMirKpgyLQ3m3gvY
	 RZ5jBLKkYK6b4RhS89p9/2SCAq4YEVYmy4Nfk1ZlAsFkvnbjPtJFAVkKe0CKIOGD4n
	 isbgc9Ia0EqVHpimc0pMBq6viOTCQLLoZmEuXem4wsDGLMt2eT7B43oEYxn5IJLbRU
	 BdC4L9On7SNYLo3VvRRvhk7vMNjg+67qwUkAvrjvWW0t8qp5/VeOrueEeEn14alQhU
	 DB6fgB74c78qg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B492F40A16;
	Mon,  2 Feb 2026 10:14:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F415149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:14:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E83740266
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:14:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6YWFO7x9aXEw for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 10:14:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 48979401FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48979401FE
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 48979401FE
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:14:35 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 5A3DD1A2BB7;
 Mon,  2 Feb 2026 10:14:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1A81B6076D;
 Mon,  2 Feb 2026 10:14:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 867FE119A8888; Mon,  2 Feb 2026 11:14:29 +0100 (CET)
Date: Mon, 2 Feb 2026 11:14:28 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Leon Anavi <leon.anavi@konsulko.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Fabrice Goucem <fabrice.goucem@oss.nxp.com>, 
 Jagan Teki <jagan@amarulasolutions.com>,
 Lothar Felten <lothar.felten@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>
Message-ID: <aYB4w0mYau-Yi4mQ@windsurf>
References: <20260114195451.3978704-1-giulio.benetti@benettiengineering.com>
 <20260114195451.3978704-3-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260114195451.3978704-3-giulio.benetti@benettiengineering.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770027270; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=XgLi4tSwTtclUl/KCgPMi3LJR3KXc21G/LktO57WaL8=;
 b=zWuC0pkSIgxc1Tg4FCntZhit6Wrz3RXBlI8sLsG4CMCHZKMqMy10BafJQWvKk4WIAQUO5a
 nwuBPc8uXy4R96SrKFfMu7Kq5XvOLvte78d3xu08UTTIdRogWTU3/sLobuEn4Cuof860qb
 d8VUsv1u9f0zH2YhMVOaPDGVQ4urLAFJ9nYpbN9lAJAixbtWFHlj2egg2/yN2kNv8HrSyL
 cDCdBl+yadTXsqDbaIUIlTZfFpXzcyiUyB8Ot5PciBpAfgzNmTHBnN9i0D3yGcpHgYbBqo
 VFaA7V5/5j61YRYTPBnsXuRaF+gCnzmnQbcsABLpQYghlGlK9cu3wkNcdZqdGg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=zWuC0pkS
Subject: Re: [Buildroot] [PATCH 02/17] configs/asus_tinker_rk3288: bump
 Linux to 6.18.5 and U-Boot to 2026.01
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

On Wed, Jan 14, 2026 at 08:54:35PM +0100, Giulio Benetti wrote:
> The patch:
> * bumps Linux kernel to version 6.18.5
> * bumps U-Boot to version 2026.01
> * forces check hashes
> * switches to extlinux

I don't see anything related to extlinux here.

Also, this commit causes:

WARNING: configs/asus_tinker_rk3288_defconfig:0: lib_defconfig.ForceCheckHash was expected to fail, did you fix the file and forget to update .checkpackageignore?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
