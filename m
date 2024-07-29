Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FFE0C3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 20:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B47F3810CF;
	Mon, 29 Jul 2024 20:50:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bL9NIOzrlWMG; Mon, 29 Jul 2024 20:50:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D066F810D2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D066F810D2;
	Mon, 29 Jul 2024 20:50:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 025CF1BF427
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 20:50:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F069840363
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 20:50:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mbB1L9tRM_Mt for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 20:50:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A9B414029E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9B414029E
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A9B414029E
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 20:50:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 09D0BC0005;
 Mon, 29 Jul 2024 20:50:40 +0000 (UTC)
Date: Mon, 29 Jul 2024 22:50:40 +0200
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Message-ID: <20240729225040.6431a398@windsurf>
In-Reply-To: <20240729122011.1112914-1-fiona.klute@gmx.de>
References: <20240729122011.1112914-1-fiona.klute@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722286241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nXpenpCIHjHKfy0XN/HrrmtgxTyEkA+USHjiLGXmazk=;
 b=MRbTPp5n4bUauumUy7BibHz4MZrFokbQLOVbTVZ/U+tjebABiPT4679OGCh+C/EgFqTrLO
 49/TtN1qK+mejGTtcDvzpcM+fz0GEAiOgrybUg06BbaT+dLVBZNyYIe6//LiTcKHIVT/EP
 RcBML5IJ5viRcbQhn5Mfsiu9h7PFoqHFAi4PCnSaLRxSKErXoyJXY6qTzbkIoEFuNIa/4o
 t0CEY6/jHJXZ1e5jTLa+aYHT4/027xtiSBekOalhsFYrRXYMq6PQFbygBsibGWq1DgDDj1
 YryUyBtYeIC9sgLo22PLgHfvOdXy12cKfa11SYcXal0HNIZiKMHa0dKm1TV6vQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MRbTPp5n
Subject: Re: [Buildroot] [PATCH 1/2] package/docker-engine: rewrite dockerd
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
Cc: Fiona Klute <fiona.klute@gmx.de>, Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fiona,

Thanks for working on this. One question below.

On Mon, 29 Jul 2024 14:20:10 +0200
Fiona Klute via buildroot <buildroot@buildroot.org> wrote:

> +start() {
> +	printf 'Starting %s: ' "$DAEMON"
> +	# shellcheck disable=SC2086 # we need word splitting for DOCKERD_ARGS
> +	start-stop-daemon --start --background --pidfile "$PIDFILE" \
> +		--exec "/usr/bin/$DAEMON" \
> +		-- --pidfile "$PIDFILE" $DOCKERD_ARGS
> +	# We have to use --background because dockerd doesn't
> +	# daemonize on its own. Unfortunately that means
> +	# start-stop-daemon cannot check the return status, so at
> +	# least check the process is actually running.

How is this different than the other init scripts for which we use
--background?

package/at/S99at
package/busybox/S01syslogd (which was recently reworked)
package/busybox/S41ifplugd (same)
package/busybox/S50crond (same)

While would need the while loop waiting for the daemon to actually be
started in the docker-engine init script and not the other services?

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
