Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 653CDC4332F
	for <buildroot@archiver.kernel.org>; Wed, 14 Dec 2022 19:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC1A740BDF;
	Wed, 14 Dec 2022 19:29:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC1A740BDF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kJm3Bw-h9MtO; Wed, 14 Dec 2022 19:29:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29E6440BDA;
	Wed, 14 Dec 2022 19:29:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29E6440BDA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 859FA1BF42C
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 19:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6152840BDA
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 19:29:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6152840BDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EIQXSlhVHY4C for <buildroot@lists.busybox.net>;
 Wed, 14 Dec 2022 19:29:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3418F40BD4
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3418F40BD4
 for <buildroot@buildroot.org>; Wed, 14 Dec 2022 19:29:26 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 43D6E1C0005;
 Wed, 14 Dec 2022 19:29:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p5XRU-000XTY-3G; Wed, 14 Dec 2022 20:29:24 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20221120204226.3565528-1-yann.morin.1998@free.fr>
Date: Wed, 14 Dec 2022 20:29:23 +0100
In-Reply-To: <20221120204226.3565528-1-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sun, 20 Nov 2022 21:42:26 +0100")
Message-ID: <87zgbpss18.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] fs/ext2: generate Y2K38-resilient
 filesystems
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

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > When creating a filesystem, mkfs.ext will chose the inode size depending
 > on the size of the filesystem. Small filesystem get 128-bytes inodes,
 > while bigger filesystems use 256-byte inodes (inode must be a power of 2
 > larger or equal to 128, and smaller or equal to the blocksize).

 > However, 128-byte inodes can't store timestamps past the dreaded
 > 2038-01-19 03:14:07Z deadline, while inodes larger than or equal to 256
 > do not have the issue.

 > It turns out that the tipping point to decide whether a filesystem is
 > small or big, is about around the size of the filesystems we generate
 > for our runtime tests. This causes the kernel to emit warning like:

 >     ext2 filesystem being remounted at / supports timestamps until 2038 (0x7fffffff)

 > We add a new option to our ext2 filesystem, so that user can specify the
 > size of the inode. That new option defaults to 256 to be resilient to
 > the Y2K38 problem.

 > Note: it was already possible for users to explicitly pass the -I
 > option, through BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS. We could have
 > chosen to extend the existing value with a -I 256, but that is not
 > satisfactory. Indeed, we do want to ensure that the default is now
 > Y2K38-OK, even for existing configurations that did not have explicit
 > setting.

 > We also pass that new option before the user-specified arbitrary ones,
 > so that BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS still wins (in case -I was
 > set there).

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > ---
 >  fs/ext2/Config.in | 13 +++++++++++++
 >  fs/ext2/ext2.mk   |  1 +
 >  2 files changed, 14 insertions(+)

 > diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
 > index 705446df57..3c68638fd8 100644
 > --- a/fs/ext2/Config.in
 > +++ b/fs/ext2/Config.in
 > @@ -60,6 +60,19 @@ config BR2_TARGET_ROOTFS_EXT2_INODES
 >  	int "exact number of inodes (leave at 0 for auto calculation)"
 >  	default 0
 
 > +config BR2_TARGET_ROOTFS_EXT2_INODE_SIZE
 > +	int "inode size"
 > +	default 256
 > +	help
 > +	  Set the size of inodes, in bytes, as a power of 2 larger or
 > +	  equal to 128.
 > +
 > +	  Set to 0 to let the filesystem generator decide. If unsure,

I added '.. based on the file system size' to make it clear that mkfs
doesn't just have a static default and committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
