Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D63BBC4332F
	for <buildroot@archiver.kernel.org>; Sat, 26 Nov 2022 18:41:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 647C660E3E;
	Sat, 26 Nov 2022 18:41:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 647C660E3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E1yyyjTqlpcs; Sat, 26 Nov 2022 18:41:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B44DD60E3C;
	Sat, 26 Nov 2022 18:41:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B44DD60E3C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DE1D01BF372
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 18:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B91E081E0D
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 18:41:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B91E081E0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vwlp6zw2_WFu for <buildroot@lists.busybox.net>;
 Sat, 26 Nov 2022 18:40:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0859D81DE3
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0859D81DE3
 for <buildroot@buildroot.org>; Sat, 26 Nov 2022 18:40:58 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 851CA20008;
 Sat, 26 Nov 2022 18:40:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oz06g-0003Db-Cl; Sat, 26 Nov 2022 19:40:54 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Brandon Maier <brandon.maier@collins.com>
References: <20221122201701.65681-1-brandon.maier@collins.com>
 <87tu2q0yyk.fsf@dell.be.48ers.dk>
Date: Sat, 26 Nov 2022 19:40:54 +0100
In-Reply-To: <87tu2q0yyk.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Wed, 23 Nov 2022 11:03:47 +0100")
Message-ID: <87zgcdeeyx.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/1] boot/uboot/uboot.mk: fix zynqmp
 without pmufw
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
Cc: buildroot@buildroot.org, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Brandon" == Brandon Maier <brandon.maier@collins.com> writes:
 >> Commit d07e6b70 (boot/uboot/uboot.mk: add pmufw.elf support) broke
 >> configurations where the UBOOT_ZYNQMP_PMUFW was blank. Previously it
 >> would set the U-Boot CONFIG_PMUFW_INIT_FILE to the blank string, but now
 >> it will set it to ".bin" which causes U-Boot to fail to build.

 >> Signed-off-by: Brandon Maier <brandon.maier@collins.com>
 >> ---
 >> v2:
 >> - support pmufw with any extension

Committed to 2022.08.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
