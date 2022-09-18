Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0080CC32771
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 10:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9676C84406;
	Sun, 18 Sep 2022 10:10:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9676C84406
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KVNsNPfrimct; Sun, 18 Sep 2022 10:10:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49825843A6;
	Sun, 18 Sep 2022 10:10:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49825843A6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6731C1BF42D
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 10:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 428A5405A9
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 10:10:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 428A5405A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yW3bv9IQ6nTq for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 10:10:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B61F4011C
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5B61F4011C
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 10:10:50 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E5EF5E0002;
 Sun, 18 Sep 2022 10:10:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oZrG9-00BXIM-HZ; Sun, 18 Sep 2022 12:10:45 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Angelo Compagnucci <angelo@amarulasolutions.com>
References: <20220705073206.1442280-1-angelo@amarulasolutions.com>
 <20220705073206.1442280-6-angelo@amarulasolutions.com>
Date: Sun, 18 Sep 2022 12:10:45 +0200
In-Reply-To: <20220705073206.1442280-6-angelo@amarulasolutions.com> (Angelo
 Compagnucci's message of "Tue, 5 Jul 2022 09:32:06 +0200")
Message-ID: <87illlgfh6.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 5/5] package/initscripts: add service to
 load kernel modules at boot
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
Cc: br015@umbiko.net, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Angelo" == Angelo Compagnucci <angelo@amarulasolutions.com> writes:

 > In cases where no hotplug is available (by choice or by the lack of a
 > proper hotplug method for a device), this service can be used to load
 > kernel module drivers by reading the /etc/modules file.
 > The modules files matches the one used by systemd, which in turn has
 > a builtin mechanism to load a module at boot, therefore making systemv
 > init on par with systemd features.

 > Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
 > ---
 > Changes

 > v2:
 > * Moved script to initscripts (Arnout)
 > * Moved script to S11modules, after S10[mu]dev (Andreas)
 > * Use /etc/modules-load.d/ to share the same setup with systemd (me)

 >  package/initscripts/init.d/S11modules | 59 +++++++++++++++++++++++++++
 >  1 file changed, 59 insertions(+)
 >  create mode 100644 package/initscripts/init.d/S11modules

 > diff --git a/package/initscripts/init.d/S11modules b/package/initscripts/init.d/S11modules
 > new file mode 100644
 > index 0000000000..3937945596
 > --- /dev/null
 > +++ b/package/initscripts/init.d/S11modules
 > @@ -0,0 +1,59 @@
 > +#!/bin/sh
 > +
 > +MODULES="*.conf"
 > +MODULES_DIR="/etc/modules-load.d"
 > +
 > +[ -z "$(ls -A ${MODULES_DIR}/${MODULES} 2> /dev/null)" ] && exit 0

The commit message talks about /etc/modules, but you are reading from
/etc/modules-load.d/*.conf?

How about supporting both /etc/modules and this directory instead?


 > +
 > +load_unload() {
 > +	for module_file in $(ls -1 ${MODULES_DIR}); do

And here you take all files in /etc/modules-load.d, even if they don't
have a .conf extension?


> +			esac
 > +
 > +			if [ "$1" = "load" ]; then
 > +				modprobe -q ${module} ${args} >/dev/null && \
 > +					printf ' %s success,' "$module" ||
 > +					printf ' %s failed,' "$module"

success/failed are quite long strings, how about only printing the
module name on success and a big scary FAIL like we do elsewhere on
failures?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
