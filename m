Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55082CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 14:32:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28FA76F577;
	Sat, 30 May 2026 14:32:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8o_Qhq83lyHL; Sat, 30 May 2026 14:32:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BAC161C13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780151531;
	bh=Vp5rSrSV905NvPiktDX+szhfhWEHyBJGIl379zxXf+Y=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=N26sgJCH4Vu9b020rU3yd4faIM0HXRu26JBlhXqJAuDxOsa/OhPvj7OJgcSHGVkY3
	 DC6UVuD9in3KglKTrtQ+gQTYasi7Kvb69fW+LAkEFi1JWU/kPdNqTjt+QV2jsxzQ1L
	 IMAUF81EDysm4TAcmJeZV9Gc/W2NhabKXtvUWRIybQISFQ0Wgk9tg2xDzW2ZVR3QZT
	 dk+fy7IK3EM+gDsFxEmswGyvV4smtuIpK24Ubb8eS1kr8IjFCWqtJy2eDx4F/n5Ahk
	 IBbJjZxx98frW8tzatIgQbmLIhoVwqLBvXqOV6XSmg7y5yT60phJ7c2rcZ0RTH3gQo
	 uhL7MzaKm8X6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BAC161C13;
	Sat, 30 May 2026 14:32:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D7D16F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 14:32:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D514C85128
 for <buildroot@buildroot.org>; Sat, 30 May 2026 14:32:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hqgSlr8vXWQZ for <buildroot@buildroot.org>;
 Sat, 30 May 2026 14:32:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F1670848BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1670848BC
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F1670848BC
 for <buildroot@buildroot.org>; Sat, 30 May 2026 14:32:09 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id BC7574E42D9D;
 Sat, 30 May 2026 14:32:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 751976073B;
 Sat, 30 May 2026 14:32:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C204910888CCC; 
 Sat, 30 May 2026 16:32:03 +0200 (CEST)
Date: Sat, 30 May 2026 16:32:02 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, 
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>, 
 Julien Olivain <ju.o@free.fr>, guenther.harrasser@mobileye.com
Message-ID: <ahr0yTuMUlfUWvvn@windsurf>
References: <20260306215539.510232-1-fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260306215539.510232-1-fiona.klute@gmx.de>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780151525; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=Tl90ZSSeCnuWGABOPJrYIP1jE2z51X/xHrR8hzhv5bw=;
 b=2n8pLDPquPqxHciu6GhcOH+h0G07TelWg3TCFw46m2OE5biMARE7yY89nro89fp2amX9Q1
 WtN9/pTXTPkLXTWT7+YNv70xoo+9J1+aEXewYdNQkFt00HU88RRkJGIza7DyivGKp9YBS+
 Uf7EnH9F04dTE9aJhNnGkxWChXmmIKi1vl1cvossfMZMfvRoDhXYF9jSlOTrR4P0gci6lI
 BKN5hAyhI8ejdAEiNxm8MSem9EuTqxdmSsXdhufO0pdWXcSBcvNuryfwSLZTYGHYf0y2zJ
 V/lHXljrpqQzNsCaa955KZ7QZOuy6jVkmOykuhXBGsAffPuAiD5gpEdDgqTEMg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=2n8pLDPq
Subject: Re: [Buildroot] [PATCH v2 1/1] support/testing: transfer config in
 environment instead of class variables
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

On Fri, Mar 06, 2026 at 10:55:39PM +0100, Fiona Klute via buildroot wrote:
> Passing runtime configuration to tests in BRConfigTest class variables
> requires the "fork" start method for multiprocessing. With
> "forkserver" (default for POSIX platforms since Python 3.14) class
> variables modified in the parent process are lost, because the child
> process does not inherit the full Python state. This broke the way
> support/testing/run-tests sets configuration for BRConfigTest, so a
> start method override was added in commit
> 3d2141bceefda32bef06ddda594eaf8665913276.
> 
> Instead this patch adds a settings dataclass (requires Python >= 3.7)
> which is serialized into an environment variable from run-tests and
> read during BRConfigTest.__init__(). Reading is skipped if the
> environment variable is not set so test discovery (not execution)
> works without configuration (e.g. utils/get-developers uses this).
> 
> With that, run-tests no longer relies on a specific multiprocessing
> start method.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Thanks a lot for having cleaned up my terrible code! Applied to next.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
