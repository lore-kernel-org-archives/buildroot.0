Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1850E7718B
	for <buildroot@archiver.kernel.org>; Fri, 27 Dec 2024 10:57:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BE9780D23;
	Fri, 27 Dec 2024 10:57:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id llg1Z_1_OV2q; Fri, 27 Dec 2024 10:57:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7497480D1A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7497480D1A;
	Fri, 27 Dec 2024 10:57:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C5C2C757
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 10:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6B2760858
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 10:57:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aX_gyC-EqCFm for <buildroot@buildroot.org>;
 Fri, 27 Dec 2024 10:57:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5D34860836
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D34860836
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D34860836
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 10:57:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 8BA0D780375;
 Fri, 27 Dec 2024 11:57:08 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:49822])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 27 Dec 2024 11:57:08 +0100
MIME-Version: 1.0
Date: Fri, 27 Dec 2024 11:57:08 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241226211143.2507882-1-thomas.petazzoni@bootlin.com>
References: <20241226211143.2507882-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <1ee7be949530cd3488b2dacc5678f245@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735297029;
 bh=ay48OSE9gxdTNGZGhNfWNKopONfTYwRrAt9BHB3xUu8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pNQgEPlV/4C4kfoclxTulLptD17npUos+sYxjNOl30vkM/RO38fNJMMA+7/ztlikN
 BGOSdsvQrtROetRn6oAE4Eo++UdWxtoERFphBrpk+yUQTnSgSUZMfzUFmMFsgjRv9B
 n0E1oWJGxVTV8NORVtFA13J84XLurTnBPZBxDYHUUhC7Dt/HmXHaKmF6GYJs+qzStu
 JaPEvB8JeZbXOz9SoMBPiDCNjxQQ1D4DpBAJYtdZg0ygjBQhyP65jasfKDno4RNJFY
 moIVo4iqw9sRD5OV3/tV4SjwQjsf0d2Enq9796UXSAgFAIKrRjJPaEceF3pq3kx8Jf
 y86lNeD7vq3CA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=pNQgEPlV
Subject: Re: [Buildroot] [PATCH] package/cloop: bump to 3.14.1.3+nmu1
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 26/12/2024 22:11, Thomas Petazzoni via buildroot wrote:
> This is the latest version available in Debian (which is our upstream
> for this package). The changelog is:
> 
>    [ Ben Hutchings ]
>    * Fix FTBFS with gcc 11 (Closes: #1005413):
>      - Remove exception specifications
>    * Fix module build for recent kernel versions (Closes: #1005414):
>      - Stop generating module vermagic in cloop.c. This has always been 
> handled
>        by modpost and doing it here now results in build failure.
>      - Avoid using inode::i_bdev, which was removed in Linux 5.11.
>      - Use set_disk_ro() instead of set_device_ro(). The latter was not 
> meant to
>        be used by device drivers and was removed in Linux 5.11.
>      - Use blk_{mq_alloc,cleanup}_disk() instead of separate queue and 
> disk
>        allocation and cleanup on Linux 5.15+, since alloc_disk() was 
> removed.
>      - Handle potential failure of add_disk() on Linux 5.15+.
>      - Use kernel_read() instead of vfs_read() and set_fs(). set_fs() 
> is no
>        longer defined on some architectures, and kernel_read() has had 
> large
>        file support since Linux 2.6.31.
>  .
>    [ Vagrant Cascadian ]
>    * debian/rules: Build tarball reproducibly, using consistent time, 
> uid,
>      gid and sort order. Thanks to Dhole for the initial patch.
> 
> The "Fix FTBFS with gcc 11" allows us to remove the -std=c++14
> workaround added in commit
> 7e147e778fc3397cd2a069c8127fa4d2cc6c0355 ("package/cloop: fix build
> with gcc >= 9").
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/cloop/cloop.hash | 4 ++--
>  package/cloop/cloop.mk   | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/cloop/cloop.hash b/package/cloop/cloop.hash
> index eb922764bb..a4f7056049 100644
> --- a/package/cloop/cloop.hash
> +++ b/package/cloop/cloop.hash
> @@ -1,5 +1,5 @@
> -# From 
> http://snapshot.debian.org/archive/debian/20200419T152225Z/pool/main/c/cloop/cloop_3.14.1.3.dsc
> -sha256  
> e3079e70f9edae8ed1ac64694af08f6c7dc710ca65a56e4770dcb1325a293193  
> cloop_3.14.1.3.tar.xz
> +# From 
> http://snapshot.debian.org/archive/debian-debug/20221223T030115Z/pool/main/c/cloop/cloop_3.14.1.3%2Bnmu1.dsc

Is there any specific reason for switching to the "-debug" archive?
The same file seems to be present in the main debian archive:
https://snapshot.debian.org/archive/debian/20221223T031011Z/pool/main/c/cloop/cloop_3.14.1.3%2Bnmu1.dsc

> +sha256  
> 04060d88231208b0db8ae8c3b54b0a46ee12139b617ebfc80b03d2ddd2cdb6ba  
> cloop_3.14.1.3+nmu1.tar.xz
> 
>  # Hash for license files
>  sha256  
> 91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  
> advancecomp-1.15/COPYING
> diff --git a/package/cloop/cloop.mk b/package/cloop/cloop.mk
> index 6f6d5fe6a8..f42edee28b 100644
> --- a/package/cloop/cloop.mk
> +++ b/package/cloop/cloop.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -CLOOP_VERSION = 3.14.1.3
> +CLOOP_VERSION = 3.14.1.3+nmu1
>  CLOOP_SOURCE = cloop_$(CLOOP_VERSION).tar.xz
> -CLOOP_SITE = 
> http://snapshot.debian.org/archive/debian/20200419T152225Z/pool/main/c/cloop
> +CLOOP_SITE = 
> http://snapshot.debian.org/archive/debian-debug/20221223T030115Z/pool/main/c/cloop

Same question here. Should we use:
https://snapshot.debian.org/archive/debian/20221223T031011Z/pool/main/c/cloop
instead?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
