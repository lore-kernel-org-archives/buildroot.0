Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDCAC2BD09
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 07:57:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACB2880FDD;
	Mon, 15 Jul 2024 07:57:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hngF9DdZsuii; Mon, 15 Jul 2024 07:57:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0025810AF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0025810AF;
	Mon, 15 Jul 2024 07:57:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0AA821BF2B9
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 07:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E9340404FF
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 07:57:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g0cphNgqW9bq for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 07:57:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4BB97403A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BB97403A7
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4BB97403A7
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 07:57:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1CF0740004;
 Mon, 15 Jul 2024 07:57:47 +0000 (UTC)
Date: Mon, 15 Jul 2024 09:57:45 +0200
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Message-ID: <20240715095745.2b194a9b@windsurf>
In-Reply-To: <20240605111347.1581931-1-fiona.klute@gmx.de>
References: <20240605111347.1581931-1-fiona.klute@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721030267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QACJiBrH2tKpI6EJLUi9/H3dAlxAuf9NwBIsv14xzKk=;
 b=pzE9FP4rNEtgqIfbbzwJ90MGgT1du/FpY8QQ7gjhbCLJdzvfinnfo9IaCfPj/g0oC9FpEY
 c30innRQkw2QMBsx0RollToKZ6rFvUnb2lFitGw3bnlk6WBETek9DTBTJLhoE+Vxfi5jtq
 6TP/uPhM/CaownczpPv6UZ9wIsy5+8k50bVUwvXquSCgZ+4/Z8ICY6CZCG7XBFldJby+We
 Wi2U9FrP+7wB8T5hJssLtffRrszuMZzjBWIS5NGwL/esedbhQifTQDnHX2Z2Uv0N2bTNYj
 Ujoayg6eTJRo7j1vmEsDUSfYo2Tz5TBsaxa25yGpkEY1j+jJPjIxDaSTe4nqTQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pzE9FP4r
Subject: Re: [Buildroot] [PATCH 1/2] package/busybox: Add crond init script
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
Cc: Fiona Klute <fiona.klute@gmx.de>, "Alvaro G . M" <alvaro.gamez@hazent.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fiona,

On Wed,  5 Jun 2024 13:13:46 +0200
Fiona Klute via buildroot <buildroot@buildroot.org> wrote:

> The init script will be installed only if no other package provides
> cron (currently that could be package/dcron). Users will need to
> select a suitable location for their crontabs, using either runtime
> configuration in /etc/default/crond or Busybox build
> configuration. Note that crond fails to start if the crontabs
> directory doesn't exist.
> 
> Signed-off-by: Fiona Klute <fiona.klute+wiwa@gmx.de>

Thanks, I applied your patch after making a few changes.

> +# Note that the Busybox default location for crontabs
> +# /var/spool/cron/crontabs is on a tmpfs in the default Buildroot
> +# filesystem layout. If you want persistent crontabs, override that
> +# either using either the "-c" runtime option of crond in CROND_ARGS,
> +# or the CONFIG_FEATURE_CROND_DIR Busybox build configuration option.

After discussion with Arnout, we decided that our default of
/var/spool/cron didn't make sense. Indeed the crontab generally needs
to be persistent, so having it in a tmpfs as the out-of-the-box
experience didn't seem very appropriate. So we changed the default
Busybox configuration to set CONFIG_FEATURE_CROND_DIR="/etc/cron". So
of course, I dropped your comment above.

> +	printf 'Starting %s: ' "$DAEMON"
> +	# shellcheck disable=SC2086 # we need the word splitting
> +	start-stop-daemon -b -m -S -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON" \

Adjusted to use long options.

> +		-- -f $CROND_ARGS
> +	status=$?
> +	if [ "$status" -eq 0 ]; then
> +		echo "OK"
> +	else
> +		echo "FAIL"
> +	fi
> +	return "$status"
> +}
> +
> +stop() {
> +	printf 'Stopping %s: ' "$DAEMON"
> +	start-stop-daemon -K -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON"

Ditto.

> +	status=$?
> +	# wait for process to be gone
> +	while true; do
> +		pid="$( cat "${PIDFILE}" 2>/dev/null || true )"
> +		{ [ -n "${pid}" ] && [ -d "/proc/${pid}" ]; } || break
> +		sleep 0.1
> +	done

And adjusted to use the loop of start-stop-daemon.


> +# Only install our crond script if no other package does it.
> +ifeq ($(BR2_PACKAGE_DCRON),)
> +define BUSYBOX_INSTALL_CROND_SCRIPT
> +	if grep -q CONFIG_CROND=y $(@D)/.config; \
> +	then \

And here we create $(TARGET_DIR)/etc/cron/crontabs/ to make sure it
exists, otherwise crond doesn't start.

> +		$(INSTALL) -m 0755 -D package/busybox/S50crond \
> +			$(TARGET_DIR)/etc/init.d/S50crond; \
> +	fi;
> +endef
> +endif

Thanks for this work!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
