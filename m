Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A505C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 19:45:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BBA661152
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 19:45:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0BBA661152
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4E7B40446;
	Sat, 11 Sep 2021 19:45:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5_3Kc8UngxYv; Sat, 11 Sep 2021 19:45:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C5C240437;
	Sat, 11 Sep 2021 19:45:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D5F681BF285
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 19:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C539F60804
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 19:45:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pXYtYO1FrfSS for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 19:45:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E85E605E3
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 19:45:01 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6c4a:f4f1:e14a:6e93])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 4E472B00535;
 Sat, 11 Sep 2021 21:44:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631389498;
 bh=Vt/bYmq3NnVqugepcnl9G5XTfHkagOf/+iPXnx5mb+o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hB6l/bmdWSLorRur9qq+ijoNXbbhdfRQ3IojA0KeMvpF/h2VWM5Y/IBk9hS2tD1Xw
 IWE7f3FB4kDfuPg2irSDw8E555yNnA3wuZNo9kZJR7Vzqx55dp20fJ9cc7AArsiGnw
 3m5qBXWoijUrIqyXufJtUtCWPOpDVHk12OhedjPE9UMswQ5N97fxdsoykD5mQsSJce
 bDzKf0ZBTMpfEI229IJZfd8pucSnbfAm5TdwVdwNjFiREgLwIyv5/rP2jBWUfU5NU7
 +BwFfmnU4RjQoqQGTwndjU3hG+9sxWBijvGdwTa1xMLThVKdPVoK3yGk1hwzH26gkV
 fUrLn60JRraBQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 11 Sep 2021 21:44:54 +0200
Date: Sat, 11 Sep 2021 21:44:54 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dagg Stompler <daggs@gmx.com>
Message-ID: <20210911194453.GU1053080@scaer>
References: <20210911162515.29022-1-daggs@gmx.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210911162515.29022-1-daggs@gmx.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2 1/2] configs/odroidc2: increase rootfs
 size to 124M
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Dagg,

On 2021-09-11 19:25 +0300, Dagg Stompler spake thusly:
> as result of e2fsprogs version bump, the image size required was
> increased.
> so to fix it and make sure there is enough size, set BR2_TARGET_ROOTFS_EXT2_SIZE
> to 124M

So, I was wondering what the reason for the size increase was, so I
spawned a build in three conditions:

  - my server's Ubuntu 16.04
  - my laptop's Ubuntu 21.04
  - a docker Bullseye on my server (so, minus the kernel, a stock Debian
    Bullseye)

In all three cases, the build succeeded with current master. The sice
of the target/ directory is roughly 40MiB in all three cases, which is
still far enoiugh from 60MiB that it should not cause any issue.

So, I'm still not sure that the reason is "Debian Bullseye", or that the
solution is "increase the filesystem size".

Could you please try by aplying this patch to master, and rerun the
build, and share the error message, please:

    diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
    index 74c99bd7b1..83c967c9df 100644
    --- a/fs/ext2/ext2.mk
    +++ b/fs/ext2/ext2.mk
    @@ -16,7 +16,7 @@ EXT2_MKFS_OPTS = $(call qstrip,$(BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS))
     EXT2_LABEL = $(subst ",,$(BR2_TARGET_ROOTFS_EXT2_LABEL))
     #" Syntax highlighting... :-/ )
     
    -EXT2_OPTS = \
    +EXT2_OPTS = -v \
     	-d $(TARGET_DIR) \
     	-r $(BR2_TARGET_ROOTFS_EXT2_REV) \
     	-N $(BR2_TARGET_ROOTFS_EXT2_INODES) \

> Signed-off-by: Dagg Stompler <daggs@gmx.com>
> ---
> 
>  v1 -> v2:
>     reduce size from 256 to 124 (Yann E. MORIN)
> 
>  configs/odroidc2_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/configs/odroidc2_defconfig b/configs/odroidc2_defconfig
> index 5f97fc3dd8..70e539d6f9 100644
> --- a/configs/odroidc2_defconfig
> +++ b/configs/odroidc2_defconfig
> @@ -10,6 +10,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAML0"
>  BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
>  BR2_TARGET_ROOTFS_EXT2=y
>  BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="124M"

If only this patch is applied, then the build *will* fail, becasue the
size in genimage.cfg is still not fixed. Both sizes must be changed in
the same patch.

Regards,
Yann E. MORIN.

>  BR2_ROOTFS_OVERLAY="board/hardkernel/odroidc2/rootfs_overlay"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/hardkernel/odroidc2/post-image.sh"
> 
> --
> 2.33.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
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
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
