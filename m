Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 312E2C433FE
	for <buildroot@archiver.kernel.org>; Fri, 30 Sep 2022 14:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE18F41D3D;
	Fri, 30 Sep 2022 14:03:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE18F41D3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5qdYO_9SqzvA; Fri, 30 Sep 2022 14:03:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8928041BD0;
	Fri, 30 Sep 2022 14:03:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8928041BD0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AE7121C2745
 for <buildroot@lists.busybox.net>; Fri, 30 Sep 2022 14:03:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6BBFA61127
 for <buildroot@lists.busybox.net>; Fri, 30 Sep 2022 14:03:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BBFA61127
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xbGq8UsEiXCZ for <buildroot@lists.busybox.net>;
 Fri, 30 Sep 2022 14:03:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A884661139
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A884661139
 for <buildroot@buildroot.org>; Fri, 30 Sep 2022 14:03:15 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 34FCC1BF205;
 Fri, 30 Sep 2022 14:03:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oeGbg-00AWR9-Bx; Fri, 30 Sep 2022 16:03:12 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20220920220904.98162-1-giulio.benetti@benettiengineering.com>
Date: Fri, 30 Sep 2022 16:03:12 +0200
In-Reply-To: <20220920220904.98162-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Wed, 21 Sep 2022 00:09:04 +0200")
Message-ID: <87bkqx559b.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/rtl8812au-aircrack-ng: fix build
 failure due to double defined endianness
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
Cc: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > By default package rtl8812au-aircrack-ng uses CONFIG_PLATFORM_I386_PC that
 > define -DCONFIG_LITTLE_ENDIAN and this can't be overridden since the
 > USER_EXTRA_CFLAGS are assigned to EXTRA_CFLAGS in the beginning of Makefile
 > while -DCONFIG_LITTLE_ENDIAN is assigned later.
 > Instead of using the default CONFIG_PLATFORM_I386_PC let's set it to 'n'
 > and let's use the same defines it uses:
 > -DCONFIG_IOCTL_CFG80211
 > -DRTW_USE_CFG80211_STA_EVENT
 > This way -DCONFIG_BIG_ENDIAN can be define without the conflict of being
 > defined with with the default -DCONFIG_LITTLE_ENDIAN.
 > Let's also add Linux config FIXUPS to build the module correctly.

 > Fixes:
 > http://autobuild.buildroot.net/results/2e4ee705d0e2b728f102aac4e6729f11ef22be36/

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Committed to 2022.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
