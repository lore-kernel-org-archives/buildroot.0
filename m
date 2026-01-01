Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F505EEB57E
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 09:31:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC014814BD;
	Thu,  1 Jan 2026 09:31:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8yuSRyrI8dkG; Thu,  1 Jan 2026 09:31:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C7C681172
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767259907;
	bh=DLmEoCcYHTTIFCK6mFMJaSBNFBCxydPoqKLu21CvSWI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=P2lvSo6L0vcdWlMrjFwX4Kp8G5SRdEIduGTWQWcYXNx37RcpiefX+jIbjSENt5/i5
	 qD1WDsVujR9aYQ+YrC+toTPhSvj/zIqFQ5SetBmo0J9KQBGep7EOmshJfUj0CifIJE
	 D88qEVJPad9wUCSzmYZJSD/qBK5legJUu+jm7rrWEv1U41z0yy5eI9WsQaqnF1MF04
	 m/JI59GoGl4FgO01qaamwtOcAd8B21vlcBl1Tj0QfcWi1d2QzJDc/8htkYCHNFutLa
	 yZqCF64QiZHulDMBmXQ3trc/rMpz6FSqgXFYR85IfwtQ21DAfhhi0/QLQnIky4FCKj
	 6LOKqPTJ3VeBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C7C681172;
	Thu,  1 Jan 2026 09:31:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 56510351
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:31:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D6C440168
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:31:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zdVBl-YUV8z3 for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 09:31:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 04865400A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04865400A5
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 04865400A5
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:31:43 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id A91EB1A258F
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:31:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6A6B2606B6;
 Thu,  1 Jan 2026 09:31:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 393D9113B071F; Thu,  1 Jan 2026 10:31:39 +0100 (CET)
Date: Thu, 1 Jan 2026 10:31:38 +0100
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Cc: Fiona Klute <fiona.klute@gmx.de>
Message-ID: <20260101103138.7d03390b@windsurf>
In-Reply-To: <20251230145117.3375118-1-fiona.klute@gmx.de>
References: <20251230145117.3375118-1-fiona.klute@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767259899; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=jp//yRPAf0h817uNhe7wifdnPWuIMkYue3uMoPnDGbs=;
 b=nUhlpfw4MFJgz+X6LRT2/1LaIluULSU41f50E0vMtlE5HlqTdRF/BJZPnMTnDNm443gQUi
 KqIZMPouHM80oXj7XJEZbqDAgY+akEycEHHVxFgp3WQqKSNPjHu1PMPFTxCtihQhu7nDrB
 vJR6GCbeU4E3Jc6XKk8SojO+z4CgR77AfNvfrcWyga6eFleZbmw2DY/xmgbNJEF6AHtVOv
 vPqlkFKOfVXvADjascl0XLs6OW00NCrYfLuWnEfaKvVoRUu2mkhB/gapeXONCMWWaC5UlH
 9eq7MLXdvt77r0P7cUXZpaju4nxx852y28qaCoC1Ek0DuA7g3fMFQ10rh2QATw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=nUhlpfw4
Subject: Re: [Buildroot] [PATCH 1/1] package/busybox: tidy up klogd init
 script
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

On Tue, 30 Dec 2025 15:51:17 +0100
Fiona Klute via buildroot <buildroot@buildroot.org> wrote:

> * Wait for process to stop before deleting PID file, instead of fixed
>   wait during restart
> 
> * Use long form options
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
> ---
> Restarting klogd is probably not common, but it's nicer this way. :-)

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
