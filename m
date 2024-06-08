Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18CECC25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 16:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C112B404D5;
	Sat,  8 Jun 2024 16:59:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ahOn9EkrJ6JO; Sat,  8 Jun 2024 16:59:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C6CE404D6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C6CE404D6;
	Sat,  8 Jun 2024 16:59:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2DEC11BF20D
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 16:59:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2721B60692
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 16:59:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zVajwFY18USR for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 16:59:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 456786066F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 456786066F
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 456786066F
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 16:59:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EA7D6E0003;
 Sat,  8 Jun 2024 16:59:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sFzPA-0027gf-08;
 Sat, 08 Jun 2024 18:59:00 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fiona Klute via buildroot <buildroot@buildroot.org>
References: <20240531185328.2586537-1-fiona.klute@gmx.de>
Date: Sat, 08 Jun 2024 18:59:00 +0200
In-Reply-To: <20240531185328.2586537-1-fiona.klute@gmx.de> (Fiona Klute via
 buildroot's message of "Fri, 31 May 2024 20:53:28 +0200")
Message-ID: <87cyorxtez.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 1/1] package/dnsmasq: Fix init script
 restart command
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Fiona Klute <fiona.klute@gmx.de>, "Yann
 E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fiona" == Fiona Klute via buildroot <buildroot@buildroot.org> writes:

 > I have had constant issues restarting dnsmasq. Stop works, start fails
 > because the new instance can't bind the socket. Another restart
 > immediately after works just fine:

 > # /etc/init.d/S80dnsmasq restart
 > Stopping dnsmasq: OK
 > Starting dnsmasq:
 > dnsmasq: failed to create listening socket for 192.168.128.1: Address in use
 > FAIL
 > # /etc/init.d/S80dnsmasq restart
 > Stopping dnsmasq: FAIL
 > Starting dnsmasq: OK

 > Solve this by waiting for process to actually stop before returning
 > from the stop command. Clean up the PID file after to avoid potential
 > issues with the PID being reused after stop. The wait could also be
 > placed inside the restart block, but putting it into the stop block
 > has the advantage that it also avoids similar issues for any other
 > callers.

 > Signed-off-by: Fiona Klute <fiona.klute+wiwa@gmx.de>
 > ---
 > Changes v1 -> v2:
 > Read $PIDFILE only once per iteration, to avoid errors if it
 > disappears between checks. Suggested by Yann E. MORIN.

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
