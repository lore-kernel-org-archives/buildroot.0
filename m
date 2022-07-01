Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FA6C43334
	for <buildroot@archiver.kernel.org>; Fri,  1 Jul 2022 15:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74DC981A9C;
	Fri,  1 Jul 2022 15:03:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74DC981A9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XnwgAHp0LIkF; Fri,  1 Jul 2022 15:03:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85B9C81A46;
	Fri,  1 Jul 2022 15:03:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85B9C81A46
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 310661BF59E
 for <buildroot@lists.busybox.net>; Fri,  1 Jul 2022 15:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 196CE402DD
 for <buildroot@lists.busybox.net>; Fri,  1 Jul 2022 15:03:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 196CE402DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZblnYKJpHKrP for <buildroot@lists.busybox.net>;
 Fri,  1 Jul 2022 15:03:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F4AF402A8
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6F4AF402A8
 for <buildroot@buildroot.org>; Fri,  1 Jul 2022 15:03:05 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 11B9DC0011;
 Fri,  1 Jul 2022 15:03:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1o7IAe-00FsB6-6M; Fri, 01 Jul 2022 17:03:00 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Neal Frager <neal.frager@amd.com>
References: <20220523053921.4076488-1-neal.frager@amd.com>
Date: Fri, 01 Jul 2022 17:03:00 +0200
In-Reply-To: <20220523053921.4076488-1-neal.frager@amd.com> (Neal Frager's
 message of "Sun, 22 May 2022 23:39:21 -0600")
Message-ID: <87edz47u57.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/zynqmp_kria_xxx_defconfig:
 uboot dp pll patch
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
Cc: luca@lucaceresoli.net, giulio.benetti@benettiengineering.com,
 wesley@sonifex.co.uk, michal.simek@amd.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Neal" == Neal Frager <neal.frager@amd.com> writes:

 > This patch fixes the DP audio and video PLL configurations for the zynqmp-sm-k26-revA som.
 > It needs to be applied for both the kv260 and kr260 starter kits.

 > The Linux DP driver expects the DP to be using the following PLL config:
 >   - DP video PLL should use the VPLL (0x0)
 >   - DP audio PLL should use the RPLL (0x3)
 >   - DP system time clock PLL should use RPLL (0x3)

 > Register 0xFD1A0070 configures the DP video PLL.
 > Register 0xFD1A0074 configures the DP audio PLL.
 > Register 0xFD1A007C configures the DP system time clock PLL.

 > This patch was build and run tested on a zynqmp-kria-kv260 target board.

 > Upstream-Status: submitted (https://lore.kernel.org/all/fa7e9abc419c9d7648405d1c62367dbe701d09b8.1652709736.git.michal.simek@amd.com/)
 > This patch will be removed from buildroot in a future release when no longer necessary.

 > Signed-off-by: Neal Frager <neal.frager@amd.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
