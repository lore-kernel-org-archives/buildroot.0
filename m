Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99368C32771
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 09:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4772F405B6;
	Sun, 18 Sep 2022 09:57:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4772F405B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ysAzT50EpEV3; Sun, 18 Sep 2022 09:57:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 781F0405A9;
	Sun, 18 Sep 2022 09:57:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 781F0405A9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5C3AD1BF328
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 09:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 37FA58414A
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 09:57:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37FA58414A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o7MCbTfH2gx0 for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 09:57:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 116A383FB2
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 116A383FB2
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 09:57:18 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A8B88100002;
 Sun, 18 Sep 2022 09:57:15 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oZr34-00BWkl-Dk; Sun, 18 Sep 2022 11:57:14 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Angelo Compagnucci <angelo@amarulasolutions.com>
References: <20220705073206.1442280-1-angelo@amarulasolutions.com>
 <20220705073206.1442280-2-angelo@amarulasolutions.com>
Date: Sun, 18 Sep 2022 11:57:14 +0200
In-Reply-To: <20220705073206.1442280-2-angelo@amarulasolutions.com> (Angelo
 Compagnucci's message of "Tue, 5 Jul 2022 09:32:02 +0200")
Message-ID: <87v8plgg3p.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 1/5] system: adding options for
 configuring wifi
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

 > These options can be used by packages to configure a wifi card
 > to connect at boot.

 > Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
 > ---
 >  system/Config.in | 15 +++++++++++++++
 >  1 file changed, 15 insertions(+)

 > diff --git a/system/Config.in b/system/Config.in
 > index 888c24ce81..9a5bdb2932 100644
 > --- a/system/Config.in
 > +++ b/system/Config.in
 > @@ -418,6 +418,21 @@ comment "automatic network configuration via DHCP needs ifupdown or busybox or n
 >  	depends on !(BR2_PACKAGE_BUSYBOX || BR2_PACKAGE_IFUPDOWN || \
 >  		BR2_PACKAGE_SYSTEMD_NETWORKD || BR2_PACKAGE_NETIFRC)
 
 > +config BR2_SYSTEM_CONNECT_WIFI
 > +	bool "Connect to a default wifi access point"
 > +	default n

'n' is default, so drop that. This doesn't really do anything unless the
user also configures BR2_SYSTEM_DHCP="wlan0", right?

I must say I am not really convinced. This is only useful for quite
specific setups (E.G. a lot more specific than BR2_SYSTEM_DHCP which we
use in a number of defconfigs) and hard codes a number of things (like
WPA-PSK that may or may not make sense in the future).

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
