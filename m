Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B12EECEFD15
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 22:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DCA160C2A;
	Tue,  6 Jan 2026 22:00:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zJM8s7PIkwbi; Tue,  6 Jan 2026 22:00:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5D3660C22
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767736828;
	bh=LXNNZTjrXtXLPstWZKOrQax5CoHajd6xUoXHMd1+nvc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=V3dRJJJ+BcYRPVPtFwePNIG/ePiKF5fTwQApaXQHhbopG0OqoMW9oc9nv1GrJbP71
	 eosFk+0F2pmi8xvtFnRZMbz3lffnAngelD555CqWZoEiz7ads0fIIeiCPPgsYzg4Pc
	 olxfCTfKpknxDVqkhCK6H9Ki7wgKBGcBBPXIe9gs/FwU0/Zr9URklQvBV0Qe1wwApN
	 WMCfDh3HS7SJuqqKWEZLUk4t52IQucvACje9W8BKCl2mC0LK3vHLNzm2W8CJ0ut1Tw
	 k2z2u6yMMTB6mbZiNmpHrbl/GmK7aMAhD+jUPFyYVv9rVqRohA+vIS080+5ZHpHLS+
	 UxOz/gEjMyQGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5D3660C22;
	Tue,  6 Jan 2026 22:00:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D237C70B
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 22:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C313881E3E
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 22:00:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WJA6x_jQ8u24 for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 22:00:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0230581E3A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0230581E3A
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0230581E3A
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 22:00:25 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id DBDBCC1D700;
 Tue,  6 Jan 2026 21:59:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CCEB660739;
 Tue,  6 Jan 2026 22:00:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6E238103C8621; Tue,  6 Jan 2026 23:00:20 +0100 (CET)
Date: Tue, 6 Jan 2026 23:00:19 +0100
To: Peter Seiderer via buildroot <buildroot@buildroot.org>
Cc: Peter Seiderer <ps.report@gmx.net>, Fiona Klute <fiona.klute@gmx.de>,
 Joachim Wiberg <troglobit@gmail.com>
Message-ID: <20260106230019.095c898b@windsurf>
In-Reply-To: <20250805171603.1296472-1-ps.report@gmx.net>
References: <20250805171603.1296472-1-ps.report@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767736821; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=+nyIewq2OM9WSYskC16kGEkzhrYUd+WL5SLc3N2ToZk=;
 b=LRSL4Fn7IVbTRS1HwJLTexzYYHBa+WjND238nK/vvXvFRp0aBqwMcvRqsQ3wHHj7qY2i/F
 2UUkAhqlrhZgyJzKtFKlronqJyCyHk4q6gp8kjeCGPPjODrB5kGSY7Io5LKVU6VqFPZ86N
 RrH4Ib9+tee5K62vX3WhkgsgEQJJl7tPh6i3RsFf836v942S1x+ZWDYTIYKDGn2urkWsIo
 ZesmmsUC2BX/LW22Ozm2FqxyYRbB7Nu+nuvG6sdYSnC4kJvG5dyyjse/XcRk9FD1q6v/In
 5p2E+N+HebkN9vYbpTESF2sxxz0ERyo8ID9tuoFoTpgIgCp64okjR2mn6FSf6w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=LRSL4Fn7
Subject: Re: [Buildroot] [PATCH v3 1/3] package/iwd: update S40iwd (use long
 options)
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

On Tue,  5 Aug 2025 19:16:01 +0200
Peter Seiderer via buildroot <buildroot@buildroot.org> wrote:

> - use long options (as suggested in [1] example)
> - drop '-q'/quiet option from startup
> 
> [1] https://nightly.buildroot.org/#adding-packages-start-script
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>   - no changes

Thanks, series applied. Sorry that it took so long to apply such a
trivial series!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
