Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 431D2C433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 21:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAA5360B25;
	Tue, 28 Dec 2021 21:58:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RAyDrCI5gcSd; Tue, 28 Dec 2021 21:58:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 299D360B5B;
	Tue, 28 Dec 2021 21:58:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6D6D81BF39D
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 21:58:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DA4F40881
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 21:58:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HSp7qKCYtsBU for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 21:58:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 80A8340886
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 21:58:10 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:25ef:2aa8:94fa:832d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8C1AF13F80A;
 Tue, 28 Dec 2021 22:58:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1640728687;
 bh=j1xzzD+mS1x/RKqikvuEF+aEFSHAsR2oyWOe9IoT3PI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NPueO1xN6O0degj1xdBgdAM94JtYmnrWYzI+vh7sfMirsLwlR8Tk+SULdgA3KUXZm
 VOrDaTNQ4gYcxu3fxGQF3KlALP/iA+dkrLM1HyYNZAYU3Gi4Jq8VR6aA6y17x8iETr
 tPM7vOAgHzUJd5MXBmQMySNZlUqihE9d2hhZaS3/EyXVTyUKVakTX/YyWP8btdfOEn
 V4imuQZnOWSZ1EtryVkR0+ddsu7a3kUhJ/WljqdI9HFr5eeY5D2RwaMcZvYcLcnnZ7
 Hp7P/I2dZL9FA4E9YqdQV6jfcEwG0QyafRJdmloE5M3iv3yATmsSyxLzRMVSaa7sh3
 mwSAVUFPfYnIg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 28 Dec 2021 22:58:03 +0100
Date: Tue, 28 Dec 2021 22:58:03 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20211228215803.GD3390456@scaer>
References: <20211228091218.1154072-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211228091218.1154072-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/squashfs: add upstream patch to fix
 symlinks
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

Thomas, All,

On 2021-12-28 10:12 +0100, Thomas Petazzoni spake thusly:
> Since version 4.5, squashfs-tools provides two additional utilities:
> sqfstar and sqfscat. But their functionality is bundled within
> mksquashfs and unsquashfs respectively, so that sqfstar is a symlink
> to sqfstar, and sqfscat a symlink to unsquashfs.
> 
> Unfortunately, due to how the symlinks were created, they had a bogus
> target when INSTALL_DIR was not empty, leading to things like this:
> 
>  ./usr/bin/sqfscat -> /home/peko/autobuild/instance-1/output-2/target/usr/bin/unsquashfs
>  ./usr/bin/sqfstar -> /home/peko/autobuild/instance-1/output-2/target/usr/bin/mksquashfs
> 
> Not only they are wrong, but they also cause reproducible build
> issues (this is how they were detected).
> 
> This commit backports an upstream patch that fixes this problem.
> 
> This is also fixing the squashfs-tools part of the reproducible build
> issues at:
> 
>   http://autobuild.buildroot.net/results/00af5dca8c30b243af1e8cde3b02e264f7603442/diffoscope-results.txt
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

400. Neat.

Regards,
Yann E. MORIN.

> ---
>  ...e-of-INSTALL_DIR-for-symlink-targets.patch | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 package/squashfs/0001-Avoid-use-of-INSTALL_DIR-for-symlink-targets.patch
> 
> diff --git a/package/squashfs/0001-Avoid-use-of-INSTALL_DIR-for-symlink-targets.patch b/package/squashfs/0001-Avoid-use-of-INSTALL_DIR-for-symlink-targets.patch
> new file mode 100644
> index 0000000000..997719e63a
> --- /dev/null
> +++ b/package/squashfs/0001-Avoid-use-of-INSTALL_DIR-for-symlink-targets.patch
> @@ -0,0 +1,37 @@
> +From f5c908e92d4c055859be2fddbda266d9e3bfd415 Mon Sep 17 00:00:00 2001
> +From: Patrick McCarty <patrick.mccarty@intel.com>
> +Date: Mon, 26 Jul 2021 11:38:43 -0700
> +Subject: [PATCH] Avoid use of INSTALL_DIR for symlink targets
> +
> +In case INSTALL_DIR is overridden with a staged install location, using
> +INSTALL_DIR for the symlink target path prefix will yield an incorrect location
> +for the final installation.
> +
> +Because the symlink itself is already installed to INSTALL_DIR, simply removing
> +the INSTALL_DIR prefix suffices as a fix.
> +
> +Note that using $DESTDIR/$INSTALL_DIR where appropriate can avoid this type of
> +issue, but that can be considered a future enhancement.
> +
> +Signed-off-by: Patrick McCarty <patrick.mccarty@intel.com>
> +Upstream: f5c908e92d4c055859be2fddbda266d9e3bfd415
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + squashfs-tools/Makefile | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/squashfs-tools/Makefile b/squashfs-tools/Makefile
> +index f5a55f1..7262a2e 100755
> +--- a/squashfs-tools/Makefile
> ++++ b/squashfs-tools/Makefile
> +@@ -406,5 +406,5 @@ install: mksquashfs unsquashfs
> + 	mkdir -p $(INSTALL_DIR)
> + 	cp mksquashfs $(INSTALL_DIR)
> + 	cp unsquashfs $(INSTALL_DIR)
> +-	ln -fs $(INSTALL_DIR)/unsquashfs $(INSTALL_DIR)/sqfscat
> +-	ln -fs $(INSTALL_DIR)/mksquashfs $(INSTALL_DIR)/sqfstar
> ++	ln -fs unsquashfs $(INSTALL_DIR)/sqfscat
> ++	ln -fs mksquashfs $(INSTALL_DIR)/sqfstar
> +-- 
> +2.31.1
> +
> -- 
> 2.31.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
