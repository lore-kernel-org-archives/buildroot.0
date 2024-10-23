Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0052BCFA462
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 20:10:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD3CA812E5;
	Wed, 23 Oct 2024 20:10:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Kc6TE7mPfXW; Wed, 23 Oct 2024 20:10:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1121812E8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1121812E8;
	Wed, 23 Oct 2024 20:10:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 93CEE4960
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 20:10:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74A1840A7C
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 20:10:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h9jgo_snpVSP for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 20:10:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 40AE440A78
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40AE440A78
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 40AE440A78
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 20:10:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2947340005;
 Wed, 23 Oct 2024 20:10:10 +0000 (UTC)
Date: Wed, 23 Oct 2024 22:10:09 +0200
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Message-ID: <20241023221009.31cd52da@windsurf>
In-Reply-To: <20241023122234.478798-1-arnout@mind.be>
References: <20241023122234.478798-1-arnout@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729714210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pKx4UqD2vLRK6F5DG/tkto+ppNskNGJgZDGCGsll8QE=;
 b=dFSaro+0ZbZiCiF4t6u0bkr1Rmd0gjlyKQNOFlwe/OPdlw63dWgZIzig6y85RH4HbCZpSc
 DYLCox5W4ATTKcKOleGQQRZ9afyKTC3FkHYJ/V8BhyWXQIspte9uY7lIhHRK3wmOta8HGn
 jE2zGhacbbHwapSoYmBaPX53lBwSJog79N4tKUShu704+txFER0JJqRZZ5Gcc6RAtMKnD0
 yh1v2/xcvMNUvyoh1S0IbGLIDhkMLXU+tJTLsiKOD18axwBv5G/zwtJHFYuLByJZF9OnVL
 IXZWwrkGQEOVf2xVuBGdG5/DVnxAtHVJSpxswa2j/LFX9ttE8qKVHglRyk2dwQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dFSaro+0
Subject: Re: [Buildroot] [PATCH] utils/brmake: add option to run in docker
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

On Wed, 23 Oct 2024 14:22:34 +0200
Arnout Vandecappelle via buildroot <buildroot@buildroot.org> wrote:

> At the moment, it is difficult to combine brmake with docker-run.
> `docker-run brmake ...` doesn't work because our docker image doesn't
> have unbuffer. In addition, inside the container the timezone is UTC,
> but you probably want the timestamps added by brmake to be in local
> time. Therefore, it's better to have the call to docker-run nested
> inside brmake.
> 
> Currently, brmake doesn't have any way to pass parameters, all of "$@"
> is passed unchanged to the `make` invocation. Thus, there is no
> established way to pass in the option whether or not to use docker. We
> choose to use an environment variable to pass in the option. The
> convention is that such a buildroot-specific environment variable should
> start with BR2_, so we choose BR2_DOCKER.
> 
> Run make inside docker-run if the BR2_DOCKER environment variable is
> set. Update utils/readme.txt (the only existing documentation of brmake)
> with this information.
> 
> Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
> ---
>  utils/brmake     | 8 +++++++-
>  utils/readme.txt | 3 +++
>  2 files changed, 10 insertions(+), 1 deletion(-)

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
