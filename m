Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF6F7C2BD09
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 08:36:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31AB26071A;
	Mon, 15 Jul 2024 08:36:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P6Bd64Mhdl2T; Mon, 15 Jul 2024 08:36:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1B0B607F8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1B0B607F8;
	Mon, 15 Jul 2024 08:27:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EECE31BF421
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 08:27:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBCAF403A7
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 08:27:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tbVpymyXiBiz for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 08:27:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EDC5540065
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDC5540065
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EDC5540065
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 08:27:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B8F1E60006;
 Mon, 15 Jul 2024 08:27:42 +0000 (UTC)
Date: Mon, 15 Jul 2024 10:27:40 +0200
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Message-ID: <20240715102740.07b6e0be@windsurf>
In-Reply-To: <20240605111347.1581931-2-fiona.klute@gmx.de>
References: <20240605111347.1581931-1-fiona.klute@gmx.de>
 <20240605111347.1581931-2-fiona.klute@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721032063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XdZXhN+pdGkoK6UngDE7v4fF1O5z5RYrkkAkr3GRPdI=;
 b=a6ukoooyYNmsIiSwV6M+WYeOl4IYbVw6DIZw0+j2nTRlQ/8M+N0qiOpYFN49Pf4Z91du06
 eEma7S7wxPoYCuZS/K9ADLKYQPBRRg3UTxBe2RgiPzM2DunpyW3C5qF4kVgsmhuHUK34BW
 CptLzurWw1zqsXHOgaz7pIZkathXBCKykPe6z8aGwr7gJlXA/IxXGu8Ffoxl1YYvLqY3FE
 BJGsn5VDRqzBZY0dEgBk24dz/kYLfSsKgluvuJDWHJufxb6XXVyr5GdUBMAZHLDG/RvpYQ
 ef/bQdkrJtDQdNjE4iTB+5XUADPjrf9Hlb7vGBCIUtXIDNUcG84RiknmnmgAmw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=a6ukoooy
Subject: Re: [Buildroot] [PATCH 2/2] package/busybox: Add ifplugd init script
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

On Wed,  5 Jun 2024 13:13:47 +0200
Fiona Klute via buildroot <buildroot@buildroot.org> wrote:

> The init script will be installed only if no other package provides
> ifplugd (currently that could be package/ifplugd). Users can configure
> the interface(s) which ifplugd should watch either using
> /etc/default/ifplugd (for one interface) or using per-interface
> symlinks to the script in /etc/init.d (for any number of
> interfaces). The action script that ifplugd runs when a link change is
> detected must be supplied separately.
> 
> Signed-off-by: Fiona Klute <fiona.klute+wiwa@gmx.de>

I applied your patch, with some changes. See below.

> ---
> make check-package complains about "Incorrect PIDFILE value" in the
> script. To support running multiple instances I need to support
> multiple (per-interface) PID files. Is there a better way to handle
> that, or explicitly silence the check?

Silence the check. See below :-)

> 
>  package/busybox/S41ifplugd | 84 ++++++++++++++++++++++++++++++++++++++
>  package/busybox/busybox.mk | 13 ++++++
>  2 files changed, 97 insertions(+)
>  create mode 100644 package/busybox/S41ifplugd
> 
> diff --git a/package/busybox/S41ifplugd b/package/busybox/S41ifplugd
> new file mode 100644
> index 0000000000..4d3b56ab6d
> --- /dev/null
> +++ b/package/busybox/S41ifplugd
> @@ -0,0 +1,84 @@
> +#!/bin/sh
> +
> +DAEMON="ifplugd"
> +
> +# Each ifplugd instance handles only one interface, so this script is
> +# designed to be symlinked per interface. For each interface create a
> +# symlink with .IFACE appended to the name. E.g. to launch ifplugd for
> +# eth1 create a symlink from /etc/init.d/S41ifplugd.eth1 to this
> +# script. DEFAULT_IFACE sets the interface the non-symlink script will
> +# use, set it to empty in /etc/default/ifplugd to disable the default
> +# instance and use symlinked instances only.
> +DEFAULT_IFACE="eth0"
> +# If your action script is not in the default location
> +# /etc/ifplugd/ifplugd.action, use the "-r" option to set the
> +# location.
> +IFPLUGD_ARGS="-M"
> +
> +# shellcheck source=/dev/null
> +[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
> +
> +NAME_IFACE="$(basename "$0" | cut -s -d. -f2)"
> +if [ -n "$NAME_IFACE" ]; then
> +	IFACE="${NAME_IFACE}"
> +elif [ -n "$DEFAULT_IFACE" ]; then
> +	IFACE="${DEFAULT_IFACE}"
> +else
> +	# no interface configured
> +	exit 0
> +fi
> +
> +PIDFILE="/var/run/${DAEMON}.${IFACE}.pid"

I've added:

+# check-package disable Variables

above this line to ignore the PIDFILE warning.

> +# BusyBox' ifplugd does not create a pidfile, so pass "-n" in the
> +# command line and use "-m" to instruct start-stop-daemon to create
> +# one.
> +start() {
> +	printf 'Starting %s for %s: ' "$DAEMON" "$IFACE"
> +	# shellcheck disable=SC2086 # we need the word splitting
> +	start-stop-daemon -b -m -S -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON" \
> +		-- -n $IFPLUGD_ARGS

And I fixed the script to use the long options.

> +	while true; do
> +		pid="$( cat "${PIDFILE}" 2>/dev/null || true )"
> +		{ [ -n "${pid}" ] && [ -d "/proc/${pid}" ]; } || break
> +		sleep 0.1
> +	done

And the start-stop-daemon loop.

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
