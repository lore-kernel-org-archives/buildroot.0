Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F081FC433EF
	for <buildroot@archiver.kernel.org>; Thu, 26 May 2022 09:50:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9021342589;
	Thu, 26 May 2022 09:50:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id luaZ2Kz8F2Hx; Thu, 26 May 2022 09:50:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 666F3424ED;
	Thu, 26 May 2022 09:50:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A486A1BF487
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 09:49:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92C714118E
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 09:49:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nWsQm-R_pY0Q for <buildroot@lists.busybox.net>;
 Thu, 26 May 2022 09:49:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CF9D141188
 for <buildroot@buildroot.org>; Thu, 26 May 2022 09:49:57 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7713E100006;
 Thu, 26 May 2022 09:49:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nuA7u-00HNiJ-Jr; Thu, 26 May 2022 11:49:54 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20220419213450.887728-1-thomas.petazzoni@bootlin.com>
 <20220419213450.887728-3-thomas.petazzoni@bootlin.com>
 <22e590f7-80a4-0e7f-9b36-33f6d0e6ddae@gmail.com>
 <20220518233502.5237d35d@windsurf>
Date: Thu, 26 May 2022 11:49:54 +0200
In-Reply-To: <20220518233502.5237d35d@windsurf> (Thomas Petazzoni via
 buildroot's message of "Wed, 18 May 2022 23:35:02 +0200")
Message-ID: <87y1yopqrh.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/5] arch/Config.in.arm: re-organize MMU
 selection
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
Cc: Romain Naour <romain.naour@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Wed, 18 May 2022 22:24:28 +0200
 > Romain Naour <romain.naour@gmail.com> wrote:

 >> > In practice, MMU-capable ARM cores are always used with their MMU
 >> > enabled, so it doesn't make sense to support the use case of not using
 >> > the MMU on such cores.  
 >> 
 >> So, it means that we can remove qemu_arm_versatile_nommu_defconfig since
 >> BR2_arm926t -> BR2_ARM_CPU_ARMV5 -> BR2_ARCH_HAS_MMU_MANDATORY

 > Yes. I don't think supporting ARMv5 noMMU makes much sense, as
 > explained in the commit log. Supporting ARMv7-M definitely makes sense,
 > but not ARMv5 noMMU.

So what do we about the test coverage from
qemu_arm_versatile_nommu_defconfig? Does QEMU emulate any ARMv7-M
platforms we could use instead?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
