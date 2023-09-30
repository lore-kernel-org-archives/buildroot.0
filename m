Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1AF0E7735F
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 09:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B0CC6161A;
	Sat, 30 Sep 2023 09:55:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B0CC6161A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PF0grRmnLBbO; Sat, 30 Sep 2023 09:55:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFD7360FD3;
	Sat, 30 Sep 2023 09:55:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFD7360FD3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 053F31BF681
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 09:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D373B40643
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 09:55:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D373B40643
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MaFlfFyf_o3i for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 09:55:14 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C707400F9
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 09:55:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C707400F9
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2A224FF80A;
 Sat, 30 Sep 2023 09:55:11 +0000 (UTC)
Received: from peko by dell.home with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qmWgp-00ANXC-H0; Sat, 30 Sep 2023 11:55:11 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Jens Maus via buildroot <buildroot@buildroot.org>
References: <20230917200134.1251786-1-mail@jens-maus.de>
 <20230922184842.152406-1-mail@jens-maus.de>
Date: Sat, 30 Sep 2023 11:55:11 +0200
In-Reply-To: <20230922184842.152406-1-mail@jens-maus.de> (Jens Maus via
 buildroot's message of "Fri, 22 Sep 2023 20:48:42 +0200")
Message-ID: <87il7sasu8.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v2] boot/grub2: fix incompat e2fsprogs
 feature use
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jens Maus <mail@jens-maus.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Jens" == Jens Maus via buildroot <buildroot@buildroot.org> writes:

 > With bump of package/e2fsprogs to 1.47.0 [1] a freshly generated
 > ext4 fs has unfortunately different default features enabled
 > (e.g. metadata_csum_seed). This and some other newer fs features
 > (e.g. large_dir) are however not supported by our grub2.
 > Thus, newly generated ext-based rootfs won't be recognized by grub2
 > and are therefore not bootable/usable from grub2 anymore. This is
 > an issue already known to other Linux derivates [2],[3],[4].

 > This commit introduces two additional upstream patches to
 > package/grub2 which adds EXT4_FEATURE_INCOMPAT_CSUM_SEED and
 > EXT4_FEATURE_INCOMPAT_LARGEDIR to the EXT2_DRIVER_IGNORED_INCOMPAT
 > list of ignored incompatible ext features, allowing grub2 to
 > use ext filesystems with these newer default feature sets.

 > [1] https://git.buildroot.net/buildroot/commit/?id=6a21733f839478d902f3eab287a82b456e55f708
 > [2] https://bugs.launchpad.net/ubuntu/+source/grub2/+bug/1844012
 > [3] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1031325
 > [4] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1030939

 > Signed-off-by: Jens Maus <mail@jens-maus.de>

 > ---
 > Changes v1 -> v2:
 >   - added Signed-off-by and Upstream link in patches (Arnout)

Committed, thanks.

Hopefully other bootloaders will not have similar issues.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
