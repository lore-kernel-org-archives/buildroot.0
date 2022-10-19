Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3966DC4332F
	for <buildroot@archiver.kernel.org>; Wed, 19 Oct 2022 08:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A92BC83F1D;
	Wed, 19 Oct 2022 08:03:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A92BC83F1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CxW79Rhi6KMF; Wed, 19 Oct 2022 08:03:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3A0D83E87;
	Wed, 19 Oct 2022 08:03:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3A0D83E87
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9B23E1BF95D
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 08:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8421C83F29
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 08:03:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8421C83F29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pq0sf4CEKy-R for <buildroot@lists.busybox.net>;
 Wed, 19 Oct 2022 08:03:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5226E83E87
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5226E83E87
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 08:03:06 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 396AE24001C;
 Wed, 19 Oct 2022 08:03:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ol42W-0098Jo-79; Wed, 19 Oct 2022 10:03:00 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Damien Le Moal via buildroot <buildroot@buildroot.org>
References: <20221013075646.505807-1-damien.lemoal@opensource.wdc.com>
Date: Wed, 19 Oct 2022 10:03:00 +0200
In-Reply-To: <20221013075646.505807-1-damien.lemoal@opensource.wdc.com>
 (Damien Le Moal via buildroot's message of "Thu, 13 Oct 2022 16:56:46
 +0900")
Message-ID: <87o7u85jgr.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] configs/sipeed_*_sdcard: Add dependency
 on host-openssl
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
Cc: Niklas Cassel <Niklas.Cassel@wdc.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Damien" == Damien Le Moal via buildroot <buildroot@buildroot.org> writes:

 > Gitlab CI reported build failures for the sipeed RISC-V nommu boards
 > with the u-boot/sdcard enabled default configuration. The compilation
 > errors are related to the openssl/evp.h header file missing, e.g.:

 > In file included from tools/imagetool.h:24,
 >                  from tools/fit_common.c:20:
 > include/image.h:1166:12: fatal error: openssl/evp.h: No such file or
 > directory
 >  1166 | #  include <openssl/evp.h>
 >       |            ^~~~~~~~~~~~~~~

 > Fix this issue by adding BR2_TARGET_UBOOT_NEEDS_OPENSSL=y to the config
 > files so that host-openssl gets built as a dependency of U-Boot.

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229992
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229994
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229996
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/3134229998

 > Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

Committed to 2022.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
