Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2805AC433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 12:30:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89121409A2;
	Sat,  8 Jan 2022 12:30:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HhSJjHbODTkw; Sat,  8 Jan 2022 12:30:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC0A14094D;
	Sat,  8 Jan 2022 12:30:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2FB061BF957
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 12:30:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E69F4094D
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 12:30:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fthx1o71esTM for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 12:30:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D9B3140933
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 12:30:40 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id D69A41BF205;
 Sat,  8 Jan 2022 12:30:37 +0000 (UTC)
Received: from peko by dell.home with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1n6Arl-00009w-6R; Sat, 08 Jan 2022 13:30:37 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Lothar Felten <lothar.felten@gmail.com>
References: <20211216124048.5968-1-lothar.felten@gmail.com>
Date: Sat, 08 Jan 2022 13:30:37 +0100
In-Reply-To: <20211216124048.5968-1-lothar.felten@gmail.com> (Lothar Felten's
 message of "Thu, 16 Dec 2021 13:40:48 +0100")
Message-ID: <87mtk6h0k2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] busybox: background udhcpc by default if no
 lease is obtained
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Lothar" == Lothar Felten <lothar.felten@gmail.com> writes:

 > The current behavior for busybox' udhcpc is to terminate if no lease is
 > obtained at start up. Therefore no address is acquired if the link is
 > established afterwards.

 > By setting the -b flag udhcpc will background allowing the link to be
 > established at any time.

 > Signed-off-by: Lothar Felten <lothar.felten@gmail.com>

I was afraid that this would break the avahi-autoipd fallback logic, but
looking at the udhcpc logic it still triggers the leasefail action on
timeout, so that should be fine.

 > ---
 >  package/busybox/busybox.config | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/package/busybox/busybox.config b/package/busybox/busybox.config
 > index 1ea810e5be..a854747286 100644
 > --- a/package/busybox/busybox.config
 > +++ b/package/busybox/busybox.config
 > @@ -970,7 +970,7 @@ CONFIG_UDHCP_DEBUG=0
 >  CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=80
 >  CONFIG_FEATURE_UDHCP_RFC3397=y
 >  CONFIG_FEATURE_UDHCP_8021Q=y
 > -CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-R -n -O search"
 > +CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-b -R -n -O search"

Using -b (background on lease fail) and -n (exit on lease fail) together
doesn't make much sense, so I've dropped -n. We also have
busybox-minimal.config, so I've added it there as well and applied,
thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
