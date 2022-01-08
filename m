Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B20C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 09:45:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 919A9817BD;
	Sat,  8 Jan 2022 09:45:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IvuGM8yj0l0V; Sat,  8 Jan 2022 09:45:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E690181775;
	Sat,  8 Jan 2022 09:45:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2DCB41BF343
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 09:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1BF5C81775
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 09:45:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XQ5O-4FiRmxp for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 09:45:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4232F81444
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 09:45:13 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 38C1D40004;
 Sat,  8 Jan 2022 09:45:09 +0000 (UTC)
Received: from peko by dell.home with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1n68Hc-00050F-Hh; Sat, 08 Jan 2022 10:45:08 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20220108075930.213063-1-bernd.kuhls@t-online.de>
Date: Sat, 08 Jan 2022 10:45:08 +0100
In-Reply-To: <20220108075930.213063-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sat, 8 Jan 2022 08:59:30 +0100")
Message-ID: <877dbak1cr.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/{bluez5_utils,
 bluez5_utils-headers}: bump to version 5.63
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
Cc: Grzegorz Blach <grzegorz@blach.pl>, Marcin Bis <marcin@bis.org.pl>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Release notes: http://www.bluez.org/release-of-bluez-5-63/

The release notes mentions new build options for sanitizers, and it
looks to be enabled by default:

checking whether /home/peko/source/buildroot/output-bluez/host/bin/aarch64-linux-gnu-gcc accepts -fPIE... yes
checking whether /home/peko/source/buildroot/output-bluez/host/bin/aarch64-linux-gnu-gcc accepts -fsanitize=address... yes
checking whether /home/peko/source/buildroot/output-bluez/host/bin/aarch64-linux-gnu-gcc accepts -fsanitize=leak... yes
checking whether /home/peko/source/buildroot/output-bluez/host/bin/aarch64-linux-gnu-gcc accepts -fsanitize=undefined... yes

So I've added explicit --disable-* options for those. I also see that we
are not explicitly disabling the -fpie logic (where we want the
Buildroot option to decide if it should be used or not), so I've also
added --disable-pie.

Committed with these fixes, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
