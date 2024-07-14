Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90109C3DA49
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 20:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 501A9403CB;
	Sun, 14 Jul 2024 20:37:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TIgHocAak2gW; Sun, 14 Jul 2024 20:37:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D87C14059D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D87C14059D;
	Sun, 14 Jul 2024 20:36:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 385C81BF592
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 20:36:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 30E4B81145
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 20:36:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xh_-VrX-nzUQ for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 20:36:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EA1B381143
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA1B381143
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA1B381143
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 20:36:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D2787E0002;
 Sun, 14 Jul 2024 20:36:52 +0000 (UTC)
Date: Sun, 14 Jul 2024 22:36:45 +0200
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Message-ID: <20240714223645.39adf8c6@windsurf>
In-Reply-To: <20240712124956.3925574-1-fiona.klute@gmx.de>
References: <20240712124956.3925574-1-fiona.klute@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720989415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TV5HjgPqEE6eUhojPEksGCDjsjAD7ahKIyx7JTkv8F0=;
 b=KJR/xFnjVoroIUSYz7HYGY1hQGAujVgLo886anNp/nKiDHsJS2Ub0352PaEx/6Uz9781Qf
 ddT+wYeOTiKzl6Hrd7UC9zlUtlNlakMHZkON5Xs4PU6QRwHFe8cRQGiPAa1FOVy/q+x76m
 TLmsvJpaZTuwLc4EIMhfC+G5P8hCdpYQb2SdzS6rOyZxXQkmvg38JnaqJN0WBWe6wQXu49
 z05lx29uM97EK7FttbvUHZOvuw5FvUG6VqxsSBk7aW08HjSqLwhE9EWvXeBFkNRxiNkG6l
 vm98Uh1G4n6nO45O4cs9xvliaw6RyZ1NLxC4SlOOTtnFeYyzmczK5dpe90boug==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KJR/xFnj
Subject: Re: [Buildroot] [PATCH v2 0/6] Update init script style
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

On Fri, 12 Jul 2024 14:49:50 +0200
Fiona Klute via buildroot <buildroot@buildroot.org> wrote:

> Fiona Klute (WIWA) (6):
>   docs/manual: describe relying on default options
>   package/busybox: tidy up S01syslogd init script
>   docs/manual: include S01syslogd from source
>   package/openssh: tidy up init script
>   package/dnsmasq: tidy up init script
>   package/network-manager: rewrite init script

Thanks a lot for this, all are applied.

Now, when reviewing this and discussing with Arnout, we thought it
would be nice to have a little bit more documentation. Indeed, while
looking at the different init scripts in this series, we can identify 3
different cases:

- The S01syslogd case, where the daemon doesn't create a PID file, so
  we use --make-pidfile + --background so that start-stop-daemon
  creates the PID file and is in charge of daemonizing the daemon

  We use a loop with start-stop-daemon to check if the service has
  stopped

- The S80dnsmasq case, where the daemon creates its PID file, so we
  don't pass --make-pidfile + --background.

  But dnsmasq doesn't remove its PID file on stop, so we also use a
  start-stop-daemon loop to check if the service has stopped

- The S50sshd or S45NetworkManager cases, where the daemon creates its
  PID file, so we don't pass --make-pidfile + --background (same as
  S80dnsmasq)

  However, those daemons remove their PID file on stop, so we cannot
  use a start-stop-daemon loop, but instead loop until the PID file
  goes away

So essentially, the manual should have guidelines like this:

- If your service doesn't create its own PID file: invoke the daemon in
  foreground mode, and use start-stop-daemon --make-pidfile --background

  snippet of code

- If your service creates its own PID file: pass the --pidfile option
  to both start-stop-daemon *and the daemon itself so they agree on
  where the PID file is

  snippet of code

- If your service removes its PID file on shutdown, use a loop testing
  that the PID file has disappeared on stop, see S50sshd or
  S45NetworkManager for example:
 
  snippet of code

- If your service doesn't remove its PID file on shutdown, use a loop
  of start-stop-daemon, see S01syslogd for example:

  snippet of code

That would be *tremendously* useful to have in the documentation.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
