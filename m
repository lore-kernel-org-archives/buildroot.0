Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F02CC55171
	for <buildroot@archiver.kernel.org>; Sun,  2 Aug 2026 13:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD0A0605DF;
	Sun,  2 Aug 2026 13:38:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eVOSUKGYIAxa; Sun,  2 Aug 2026 13:38:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0A97605E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785677892;
	bh=XLXf2tYzoKWIeCaiEifNXT+MPhUX98VycVwabiKp7ro=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KXqElTiR5lq9FhNfFg1KHuTamYPbCjJw+YJjplR44Pka4ZmabTPhZO5yQIw18udki
	 glPYvHYRsWSmYCQZpILHkgkn7gt7aIPscH7aO4qwOemHlSb986vcLiMahx/vLqI/M1
	 0DoG7CsIwL33RfnyGLUiUo855G6iweEuAalfYusohYKL7an4PBs/G/lkmvOWPuwvMm
	 2DSCJEBxS1tyhw1f9B9YzX06w02HjgqvVh9jnDbRPHwi0cHdrxMDMHPai53mee0WcT
	 dplmE6c23wWVvTxzZVSBROYkoacrri4Q/q2rwtUMWwx+ucOyj7qt8aTqv/D6FD0CWn
	 kZYzMDwgWh/2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0A97605E0;
	Sun,  2 Aug 2026 13:38:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C682126C
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 13:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8D504061B
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 13:38:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oefZie5BNUrF for <buildroot@buildroot.org>;
 Sun,  2 Aug 2026 13:38:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F0C4140445
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0C4140445
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F0C4140445
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 13:38:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 4AEE1780368;
 Sun,  2 Aug 2026 15:38:06 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 02 Aug 2026 15:38:06 +0200
MIME-Version: 1.0
Date: Sun, 02 Aug 2026 15:38:06 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org
In-Reply-To: <20260712151755.599427-1-fiona.klute@gmx.de>
References: <20260712151755.599427-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.17
Message-ID: <8553c8ecd56b953f697e767deedfa7c7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785677887;
 bh=UsKf+XkNTuUevhPMtqfVy8gagQghyhiV++iTKnSQ9nI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=awivMQFPhU5EAVcBHRqNXiKq/GiwUXmAMq5a3tJy1eEUNMXLotvodhR0Vs7acGT9f
 06g9BmlQjyYV+jYmWybhwkdZiWOHrlEXPOA4gMS2Vxb3s0Ntp108QCCjcchqSJO0ew
 IwfymnmNCwKmgAITYK+LL77CuwdgPvznqMGkBotQ+Yp5uOgBIv3dD4F8MNda/PnWcR
 t4d0HkX4zeCjT78YtGviwqnrB9THaNJGYM3eLNTyZmLDyHAxxEOTiCGP9MUQRsgwiZ
 Ks0IHIz7HI9S5q4rLD4l0u3V4Go8fzblVTF+qp1temCvUj3H4I2iL+bsGWn54pAu9N
 +Him814Bk4bSA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=awivMQFP
Subject: Re: [Buildroot] [PATCH v2 1/2] package/fakeroot: bump to version
 2.1.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fiona,

On 12/07/2026 17:17, Fiona Klute via buildroot wrote:
> The source archive does not contain a pre-build configure script any
> more, so enable autoreconf. Fakeroot also contains an experimental
> Meson build definition since 2.1, but Buildroot should keep using
> autotools until the Meson build is stable.
> 
> Since v6.10.1 btrfs-progs uses nftw() [1], which package/fakeroot did
> not support before v2.0 [2]. This update allows updating btrfs-progs
> past v6.10 without breaking build of btrfs rootfs images.
> 
> Upstream changes:
> https://salsa.debian.org/clint/fakeroot/-/compare/upstream%2F1.37.2...upstream%2F2.1.4
> 
> [1] 
> https://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git/commit?id=c6464d3f99ed1dabceff1168eabb207492c37624
> [2] 
> https://salsa.debian.org/clint/fakeroot/-/commit/3502c515c73ee02e7f557e6a3bfc1af675dd3d34
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
> ---
> Changes v1 -> v2:
> * commit message: explicitly state why Buildroot should keep using
>   autotools for now
> * add comment explaining why autoreconf is needed
> 
>  package/fakeroot/fakeroot.hash | 6 +++---
>  package/fakeroot/fakeroot.mk   | 9 ++++++---
>  2 files changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/package/fakeroot/fakeroot.hash 
> b/package/fakeroot/fakeroot.hash
> index 82a6214380..0c330b7792 100644
> --- a/package/fakeroot/fakeroot.hash
> +++ b/package/fakeroot/fakeroot.hash
> @@ -1,5 +1,5 @@
> -# From 
> https://deb.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.37.2-1.dsc
> -sha1  1a721c2b4093a4e83dc091dc41a028f19340c1b3  
> fakeroot_1.37.2.orig.tar.gz
> -sha256  
> 0eea60fbe89771b88fcf415c8f2f0a6ccfe9edebbcf3ba5dc0212718d98884db  
> fakeroot_1.37.2.orig.tar.gz
> +# From 
> https://snapshot.debian.org/archive/debian/20260711T202405Z/pool/main/f/fakeroot/fakeroot_2.1.4-1.dsc
> +sha1  9d55e62a34612316058166f7c528d9fc2f30c719  
> fakeroot_2.1.4.orig.tar.xz
> +sha256  
> 0822bd5a9f0cf19d2ba0546b88b0432d4d3d9917db62c57b74044ccadba06e49  
> fakeroot_2.1.4.orig.tar.xz
>  # License files, locally calculated
>  sha256  
> fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  
> COPYING
> diff --git a/package/fakeroot/fakeroot.mk 
> b/package/fakeroot/fakeroot.mk
> index 12d7f1c4a1..8354f994ee 100644
> --- a/package/fakeroot/fakeroot.mk
> +++ b/package/fakeroot/fakeroot.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -FAKEROOT_VERSION = 1.37.2
> -FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.gz
> -FAKEROOT_SITE = 
> https://snapshot.debian.org/archive/debian/20260401T000000Z/pool/main/f/fakeroot
> +FAKEROOT_VERSION = 2.1.4

While testing this new fakeroot version, I found an issue on hosts
with SELinux enabled.

For info, it is working well in the Buildroot Docker image,
in the Gitlab infra:
https://gitlab.com/jolivain/buildroot/-/jobs/15663849325

When running on my Fedora 44 host (with selinux enabled),
mkfs.btrfs is failing with this error:

ERROR: zoned: unable to stat 
/buildroot/output_folder/TestBtrfs/images/rootfs.btrfs
ERROR: getting a xattr value failed for 
/buildroot/output_folder/TestBtrfs/build/buildroot-fs/btrfs/target attr 
security.selinux: No data available
ERROR: failed to add xattr item for the top level inode: Operation not 
permitted
ERROR: unable to traverse directory 
/buildroot/output_folder/TestBtrfs/build/buildroot-fs/btrfs/target: -1
ERROR: error while filling filesystem: Operation not permitted

I was able to workaround the issue with the following patch I proposed 
in:
https://salsa.debian.org/clint/fakeroot/-/merge_requests/38

Could you check on your side this fakeroot patch is working for you?

If it does, could you send a v3 including my patch?

There is also a new btrfs-progs v7.1:
https://github.com/kdave/btrfs-progs/releases/tag/v7.1
So while at it, maybe you could update to it to.

> +FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.xz
> +FAKEROOT_SITE = 
> https://snapshot.debian.org/archive/debian/20260711T202405Z/pool/main/f/fakeroot
> 
>  HOST_FAKEROOT_DEPENDENCIES = host-acl
>  # Force capabilities detection off
> @@ -18,4 +18,7 @@ HOST_FAKEROOT_CONF_ENV = \
>  FAKEROOT_LICENSE = GPL-3.0+
>  FAKEROOT_LICENSE_FILES = COPYING
> 
> +# source archive does not contain pre-generated configure script
> +FAKEROOT_AUTORECONF = YES
> +
>  $(eval $(host-autotools-package))
> --
> 2.53.0

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
