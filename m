Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61554E9539B
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 13:24:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 275E340C91;
	Wed,  4 Feb 2026 13:24:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5WT1ai1MizNY; Wed,  4 Feb 2026 13:24:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A9A240CA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770211444;
	bh=DbLcDUEP51p76W8pILj5n8+U7D1MAmnNvmPFyq2HKDw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fMprPQuEB3d22Dh0av7SXGZKHfOG7QGoDrqRg3Kd56lD0oYr9j44YUMva5hgRuv4Q
	 QxtJjkdu0CmtuxcAlhJ0ZP/n+f7oYxcwrve342D/yPklKXG67aQ++j11GvkkZ96u53
	 2YKTNqF4qU8mfgJggde4/Yk7jrT515LYXhju2Q8tc8xPuEGpv/HggrqVdKuwzuYNxH
	 4h1Jc06igU+I5gASxgkjxsuarW8s1J6CGy4dJIjNuqc9gtCabLvc/tQTfcTqvR9k5h
	 MqY2H8zYZv0Ri53PIcVqc9C+KoWGJH08L/JncuFL5Egf6xai2IrYQFzQ7ZaEOHNTXR
	 Niq58mMa+abhA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A9A240CA5;
	Wed,  4 Feb 2026 13:24:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 55776F5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41CC6828B5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:24:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id if9pfGK_At-u for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 13:24:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5DAE782779
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DAE782779
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5DAE782779
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:24:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 1E9701A2BE5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:23:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E73F360745;
 Wed,  4 Feb 2026 13:23:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 06EF6119A865B; Wed,  4 Feb 2026 14:23:57 +0100 (CET)
Date: Wed, 4 Feb 2026 14:23:57 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <aYNIX-2fBRSvr6Zh@windsurf>
References: <20260104110220.352547-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260104110220.352547-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770211438; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=73aT1w1aqguynNHCA0rPMOl2s9kn69YWkLjxpRZPGsU=;
 b=GyZFOeT8rUXoZYuyLDQ//+/jV9U5BHaZ5ag1yNg4/4thUSJEUBWEfJefyA1SknOXSEuFHI
 vSVyAs712Wc7CNXI9gCxdaaVe/0v9/D1lGXPTi0Dax/J1JcG0aDIWaCQznI7Io4eNoCzFU
 Xrz4JN8fHQyyyGY+OZ7PxdU1qa6R1GtjQY5IxdcU+8orQ3eQ/o51XcQ8iRs9fcsEdmJI0H
 dSQ7A1cfP2p6424+IvMtEQvOqcIiiTRL3giGDNmVjguklYuc+20QI4Lrj+p0Rn7s5BZDJY
 hEwU3YVVegQ/ZzyeWlOD8zzfXnjwa1kqY6H9uBx8yWFIjhkeTxmxA7ztQfOTJQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=GyZFOeT8
Subject: Re: [Buildroot] [PATCH v2 1/1] package/brotli: fix LoongArch64 build
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

On Sun, Jan 04, 2026 at 12:02:20PM +0100, Bernd Kuhls wrote:
> Buildroot commit 473c9400a0c7be14e7eb8ba617697a76286915b3 bumped brotli
> to version 1.2.0 causing build errors on loongarch64. The build error
> does not occur with brotli 1.1.0.
> 
> Fixes:
> https://autobuild.buildroot.net/results/57f/57f61a5fd17432bba05e4f1865f82cc2f4626d3c/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
