Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D2CBC433FE
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 15:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF36460BC8;
	Sat, 15 Oct 2022 15:42:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF36460BC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EBuqJh9ARHd7; Sat, 15 Oct 2022 15:42:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D87360BB2;
	Sat, 15 Oct 2022 15:42:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D87360BB2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 96A5B1BF5DE
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 15:42:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F3C960BB2
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 15:42:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F3C960BB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6mmGTNC8JT77 for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 15:42:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6079E60B01
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6079E60B01
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 15:42:54 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6A8B1C0004;
 Sat, 15 Oct 2022 15:42:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ojjJK-00H0bv-GC; Sat, 15 Oct 2022 17:42:50 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Damien Le Moal via buildroot <buildroot@buildroot.org>
References: <20221013075646.505807-1-damien.lemoal@opensource.wdc.com>
Date: Sat, 15 Oct 2022 17:42:50 +0200
In-Reply-To: <20221013075646.505807-1-damien.lemoal@opensource.wdc.com>
 (Damien Le Moal via buildroot's message of "Thu, 13 Oct 2022 16:56:46
 +0900")
Message-ID: <87pmetf5z9.fsf@dell.be.48ers.dk>
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

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
