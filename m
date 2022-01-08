Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29340C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 23:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A440860AE7;
	Sat,  8 Jan 2022 23:03:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RgdJvJYdiT-P; Sat,  8 Jan 2022 23:03:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E17FB60AD6;
	Sat,  8 Jan 2022 23:03:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 560061BF3D2
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 23:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 439E3402D1
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 23:03:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G8mpEtDBIRn8 for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 23:03:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 013FD402CE
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 23:03:16 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 118AD40003;
 Sat,  8 Jan 2022 23:03:13 +0000 (UTC)
Date: Sun, 9 Jan 2022 00:03:12 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20220109000312.6b307c17@windsurf>
In-Reply-To: <20201023093641.619746-1-raj.khem@gmail.com>
References: <20201023093641.619746-1-raj.khem@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] external-toolchain: Detect linux/version.h
 via cross compiler
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Khem,

On Fri, 23 Oct 2020 02:36:41 -0700
Khem Raj <raj.khem@gmail.com> wrote:

> Using linux/version.h is assumed to be hardcoded inside sysroot but this
> does not consider the case where toolchains might be built with
> --with-native-system-header-dir which means the header directories will
> not be under <sysroot>/usr/include but customized, archlinux, debian
> built cross toolchains use these install settings ( due to multiarch )
> they have the headers installed like /usr/aarch64-linux-gnu/include and
> not /usr/aarch64-linux-gnu/usr/include
> 
> This patch adds logic to use cross compiler to compute the path to
> linux/version.h on the fly, it means we do not really need to assume the
> install structure
> 
> Fixes built when using external toolchains provided by archlinux e.g.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  support/scripts/check-kernel-headers.sh           | 15 ++++++++++++++-
>  toolchain/helpers.mk                              |  2 +-
>  .../toolchain-external/pkg-toolchain-external.mk  |  3 ++-
>  3 files changed, 17 insertions(+), 3 deletions(-)

We finally took some time to review and discuss this patch. As you can
probably imagine due to the delay, we are (at least in its current
form) not going to apply it.

While it would be nice to not hardcode /usr/include/linux/version.h, we
would need:

 - To account for CFLAGS, as they can affect which sysroot is used by
   the toolchain in case of multilib toolchains.

 - A solution that also uses the cross-compiler to detect where
   <linux/version.h> is in the case of the internal toolchain backend.

However, overall, the motivation of using distribution toolchains is
dubious. We still believe that it cannot work, because distribution
toolchains can contain any number of random libraries. The sysroot of
those toolchains (including the random set of libraries that have been
installed) will be copied to Buildroot STAGING_DIR, causing confusion
with the packages that Buildroot will build.

So overall, we feel that the benefit of the patch is not sufficient
compared to the extra effort to fix the remaining comments that we have
on it. If you're still interested in pursuing this, we would welcome a
new patch that addresses the above two issues.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
