Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4436E73153
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 10:26:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA5F680E89;
	Mon,  2 Feb 2026 10:26:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ihvo_IYGgnMR; Mon,  2 Feb 2026 10:26:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0BD380DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770027986;
	bh=VUxSxmKf/tBWofah0jVH7ywXRJGnMLeOgoivXCZcUq4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=A9fOk/1qkMG9AIKzO+xxKlXlkUmO+pplAYgymAfnZrpiUg3qVhRNAzFyG/MBl3tKF
	 culEHihczpNpaT+7QNqtuVl2oqX3kX/4sffX1ZyzYsyujsQi3uck6PiQAQzg87VtNB
	 ZuTSTK995LYFw+vup10FzKmqRtI3oA2PdkRoCViFGfe4IO6HeQNm2x9dH/qBs2Q9sE
	 bDe5s4/4Lrhrc0KcdUtPiPLj9hZ1WRi1pd1eE+Y9sbL9UgwGkLKiccOCSPSZSANkMB
	 wRVWv+7ka169F0U6/zJj2a+a42yJOvjehfoQTWW41mgcHOHVp2jgGVWe0k1rnET2jy
	 fFJOQiZOuOWFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0BD380DEC;
	Mon,  2 Feb 2026 10:26:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B5F4D149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99F5A80DEC
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:26:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JF0ojl3BgJdc for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 10:26:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8B42E80DC6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B42E80DC6
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B42E80DC6
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:26:24 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id AD7F84E423C2;
 Mon,  2 Feb 2026 10:26:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 83FA560767;
 Mon,  2 Feb 2026 10:26:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F1133119A8891; Mon,  2 Feb 2026 11:26:20 +0100 (CET)
Date: Mon, 2 Feb 2026 11:26:20 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Leon Anavi <leon.anavi@konsulko.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Fabrice Goucem <fabrice.goucem@oss.nxp.com>, 
 Jagan Teki <jagan@amarulasolutions.com>,
 Lothar Felten <lothar.felten@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>
Message-ID: <aYB7uK3Qtu0TWn1X@windsurf>
References: <20260114195554.3979278-1-giulio.benetti@benettiengineering.com>
 <20260114195554.3979278-4-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260114195554.3979278-4-giulio.benetti@benettiengineering.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770027982; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=w4PR/oremPPzlKvrO1XZpr/UJSSr9YtOdlA13herkQ0=;
 b=QEJIfWT5ZDjrciHz+fEhfRobQ6vJxiOjU8JyYuDDQcgtsflEoXGqpU9Tz6k2Zq8nQtbGYH
 8iSq34/TNRCei+uTsZQKAbPoGahNYC5YCFNU+1g/j0Dwuilo+AZ05awnHRK54YniO5Lsxp
 DzQRVEvfeBYVGhuPiFwVOwj0+CMubl4wpJODQsC3YXSSiK4b1TUdDeRgS0ZJtfYzqXroEw
 /kOx+Hvas8ch3PQ2S2U+yDV05WDt0sbRc8kShjqVSD+czUzhqDZHyFBunD+oiEF2vSRkYz
 C9Nk7t1zbw4j9Y2owUj3L+PpOAcXhjkgNRVTLNkeuYoxiJDxHFBVLGEfavDl7A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=QEJIfWT5
Subject: Re: [Buildroot] [PATCH 16/17] configs/olimex_a33_olinuxino: bump
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

On Wed, Jan 14, 2026 at 08:55:52PM +0100, Giulio Benetti wrote:
> The patch:
> * bumps Linux kernel to version 6.18.5
> * bumps U-Boot to version 2026.01
> * forces check hashes
> * switches to extlinux

Causes:

WARNING: configs/olimex_a33_olinuxino_defconfig:0: lib_defconfig.ForceCheckHash was expected to fail, did you fix the file and forget to update .checkpackageignore?
WARNING: .checkpackageignore:37: ignored file board/olimex/a33_olinuxino/post-build.sh is missing

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
