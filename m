Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C707FC433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 08:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 30D4740364;
	Sun,  9 Jan 2022 08:57:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vGoCl50TN16u; Sun,  9 Jan 2022 08:57:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2475440173;
	Sun,  9 Jan 2022 08:57:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9C16C1BF3AD
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 08:57:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8AFA7401CC
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 08:57:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NhDZjuTmS_HA for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 08:57:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6EC88401A3
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 08:57:16 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id D8CB51BF205;
 Sun,  9 Jan 2022 08:57:12 +0000 (UTC)
Received: from peko by dell.home with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1n6U0m-0000Tl-6S; Sun, 09 Jan 2022 09:57:12 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Joachim Wiberg <troglobit@gmail.com>
References: <20211205102907.2836980-1-troglobit@gmail.com>
 <20211205102907.2836980-3-troglobit@gmail.com>
Date: Sun, 09 Jan 2022 09:57:12 +0100
In-Reply-To: <20211205102907.2836980-3-troglobit@gmail.com> (Joachim Wiberg's
 message of "Sun, 5 Dec 2021 11:29:05 +0100")
Message-ID: <87zgo5cmmv.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH next 2/3] package/inadyn: refactor start
 script
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
Cc: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Joachim" == Joachim Wiberg <troglobit@gmail.com> writes:

 > This patch is a complete rewrite of the Inadyn start script, based on
 > the BusyBox S01syslogd template.  Additional features, compared to the
 > template, are limited to the ability to:

 >  - Check if enabled, using an ENABLED="yes" from /etc/default/inadyn,
 >    this for compatibility with the previous version of the script
 >  - Override INADYN_ARGS from /etc/default/inadyn
 >  - A reload command that sends SIGHUP, since that works and is both
 >    quicker and a less resource intensive operation

 > Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
 > ---
 >  package/inadyn/S70inadyn | 100 +++++++++++++++++++++++++--------------
 >  1 file changed, 65 insertions(+), 35 deletions(-)
 >  mode change 100644 => 100755 package/inadyn/S70inadyn

 > diff --git a/package/inadyn/S70inadyn b/package/inadyn/S70inadyn
 > old mode 100644
 > new mode 100755
 > index ca7b414678..d44acacec3
 > --- a/package/inadyn/S70inadyn
 > +++ b/package/inadyn/S70inadyn
 > @@ -1,44 +1,74 @@
 >  #!/bin/sh
 > +# Customizations are sourced from /etc/default/inadyn.  For example,
 > +# override INADYN_ARGS to adjust log level, add a startup delay, etc.
 >  #
 > -# Start & stop the inadyn client
 > -#
 > +# NOTE: to start, add a line ENABLED="yes" to /etc/default/inadyn
 > +
 > +DAEMON="inadyn"
 > +PIDFILE="/var/run/$DAEMON.pid"
 > +
 > +INADYN_ARGS=""
 
 > -CONFIG=/etc/inadyn.conf
 > +# shellcheck source=/dev/null
 > +[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
 
 > -# check if CONFIG exists, print message & exit if it doesn't
 > -[ ! -f $CONFIG ] && ( echo "The config file "$CONFIG" is missing...exiting now." && exit 2 )
 > +start()
 > +{

Our other init scripts have the { on the same line as the function, so
changed that and committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
