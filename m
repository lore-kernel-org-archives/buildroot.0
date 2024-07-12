Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83DF2C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 11:07:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2719417FC;
	Fri, 12 Jul 2024 11:07:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lRzItlGynN_X; Fri, 12 Jul 2024 11:07:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A94BA41811
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A94BA41811;
	Fri, 12 Jul 2024 11:07:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 002151BF3F4
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 11:07:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE4F640114
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 11:07:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hi5rrs2dOgrH for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 11:07:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A140F400C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A140F400C6
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A140F400C6
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 11:07:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A928D1BF204;
 Fri, 12 Jul 2024 11:07:17 +0000 (UTC)
Date: Fri, 12 Jul 2024 13:07:16 +0200
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Message-ID: <20240712130716.600a075e@windsurf>
In-Reply-To: <20240712094717.2539892-3-fiona.klute@gmx.de>
References: <20240712094717.2539892-1-fiona.klute@gmx.de>
 <20240712094717.2539892-3-fiona.klute@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720782437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=edpod8Y1pZ6HpkdsUfkGpUopk/0CDNBOJeNdT3IChXM=;
 b=cAWVS7BGA7brS4crcsvjqk6yLXVe5xCa8bTPwxsrcOFRN0DLCXD4iSvjSdVoZEVaK7+tCA
 e5wbVCAdQvRywnXzMLqiLKAZibAcBNrUHfUZ8283m0gtOkZjziCwYcN7DAH09po/A5UQoZ
 efDuXSa6ZoO1qxaQAOgLyBXh2Cey4KpWoFpEQTuzP29gvVc/N/GlZZ981UfXuCZck5VViO
 yk4XRILizGhm4+XkTJg8mjBfKgI4gSjbrjGoXguk/PWCwEcFbjj4/rhd9iv1LCj1LHyd4K
 g37faN1ReO3eyInAqSAK6EixfPBzy+86LGZRsgt+gYvSW84R9iwI8HsNrZ2N+w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cAWVS7BG
Subject: Re: [Buildroot] [PATCH 2/6] package/busybox: tidy up S01syslogd
 init script
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fiona,

Thanks for your work on this, much appreciated!

On Fri, 12 Jul 2024 11:47:13 +0200
Fiona Klute via buildroot <buildroot@buildroot.org> wrote:

> +	# Wait for process to be gone, because Busybox'
> +	# start-stop-daemon does not support --retry (as of 1.36.1).
> +	while true; do
> +		pid="$( cat "${PIDFILE}" 2>/dev/null || true )"
> +		{ [ -n "${pid}" ] && [ -d "/proc/${pid}" ]; } || break
> +		sleep 0.1

I am not a big fan of this, and Arnout pointed out that Busybox
start-stop-daemon has the --status option:

        -T,--status             Check for the existence of a process, return exitcode (since version 1.16.1)
                                0 - program is running
                                1 - program is not running and the pid file exists
                                3 - program is not running
                                4 - can't determine program status

Could we use this instead of poking into /proc manually?

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
