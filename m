Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E36C433F5
	for <buildroot@archiver.kernel.org>; Sun, 22 May 2022 10:07:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1047041710;
	Sun, 22 May 2022 10:07:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5txdAtQlED2q; Sun, 22 May 2022 10:07:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D62ED4170B;
	Sun, 22 May 2022 10:07:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5ED911BF47E
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 10:07:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4DA49607A1
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 10:07:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gkhWZwvdw5et for <buildroot@lists.busybox.net>;
 Sun, 22 May 2022 10:07:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2702460692
 for <buildroot@buildroot.org>; Sun, 22 May 2022 10:07:50 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 61182240005;
 Sun, 22 May 2022 10:07:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nsiV0-00Bfuk-61; Sun, 22 May 2022 12:07:46 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220411221248.609465-1-fontaine.fabrice@gmail.com>
Date: Sun, 22 May 2022 12:07:46 +0200
In-Reply-To: <20220411221248.609465-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 12 Apr 2022 00:12:48 +0200")
Message-ID: <87leut283x.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/avrdude: spi needs headers >=
 4.8
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
Cc: "Wojciech M . Zabolotny" <wzab01@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > SPI unconditionally uses GPIOHANDLE_SET_LINE_VALUES_IOCTL which is only
 > available since kernel 4.8 and
 > https://github.com/torvalds/linux/commit/d7c51b47ac11e66f547b55640405c1c474642d72
 > resulting in the following build failure since switch to upstream in
 > commit 03fa36df7e6aca0f4a1c8ae2fe691c0cda6ddc7a:

 > linuxspi.c: In function 'linuxspi_reset_mcu':
 > linuxspi.c:102:28: error: storage size of 'data' isn't known
 >      struct gpiohandle_data data;
 >                             ^~~~
 > linuxspi.c:110:32: error: 'GPIOHANDLE_SET_LINE_VALUES_IOCTL' undeclared (first use in this function)
 >      ret = ioctl(fd_linehandle, GPIOHANDLE_SET_LINE_VALUES_IOCTL, &data);
 >                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/769021040e5e9293584734e4f461baeaa6dd91cd

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
