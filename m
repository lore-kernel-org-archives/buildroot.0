Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A76A8C433F5
	for <buildroot@archiver.kernel.org>; Wed,  4 May 2022 07:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AE8541820;
	Wed,  4 May 2022 07:39:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IpAePin3YhLI; Wed,  4 May 2022 07:39:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 077EB4157B;
	Wed,  4 May 2022 07:39:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F2C0E1BF42D
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 07:39:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E04E860D53
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 07:39:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rU-RwGO9RENY for <buildroot@lists.busybox.net>;
 Wed,  4 May 2022 07:39:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF10360BE2
 for <buildroot@buildroot.org>; Wed,  4 May 2022 07:39:32 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DD66F20011;
 Wed,  4 May 2022 07:39:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nm9ba-00DK13-Kw; Wed, 04 May 2022 09:39:26 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Michal Simek <michal.simek@xilinx.com>
References: <20220503152425.1069617-1-neal.frager@amd.com>
 <20220503152425.1069617-2-neal.frager@amd.com>
 <87h7653i8q.fsf@dell.be.48ers.dk>
 <edddb58b-dee7-21aa-05b8-3a94c3e2c4d1@xilinx.com>
 <878rrh3gvx.fsf@dell.be.48ers.dk>
 <86b8666c-4427-32c6-c015-f9b67e963195@xilinx.com>
Date: Wed, 04 May 2022 09:39:26 +0200
In-Reply-To: <86b8666c-4427-32c6-c015-f9b67e963195@xilinx.com> (Michal Simek's
 message of "Wed, 4 May 2022 09:24:05 +0200")
Message-ID: <874k253fwx.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 2/2] configs/zynqmp_zcu106_defconfig:
 transition to tarballs
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
 buildroot@buildroot.org, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Michal" == Michal Simek <michal.simek@xilinx.com> writes:

Hi,

 >> > This is caused by not proper psu_init which setup PLLs incorrectly.
 >> This is using the psu_init_gpl.c in U-Boot:
 >> https://github.com/Xilinx/u-boot-xlnx/blob/xlnx_rebase_v2022.01_2022.1/board/xilinx/zynqmp/zynqmp-zcu106-revA/psu_init_gpl.c
 >> And the pmu configuration object from Neal:
 >> https://git.buildroot.net/buildroot/tree/board/zynqmp/zcu106/pm_cfg_obj.c
 >> So what exactly needs to change?

 > I don't have this board here that's why likely taken from any old
 > design before this check was added to Linux.
 > U-Boot psu_init_gpl.c should be updated.

Ok, I also only have temporary access to a zcu106. Neal/Michal, will you
take care of it?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
