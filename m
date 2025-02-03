Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 342E6C02192
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 15:50:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE87D605E5;
	Mon,  3 Feb 2025 15:50:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 66ZCIjuSsY13; Mon,  3 Feb 2025 15:50:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4B2460631
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4B2460631;
	Mon,  3 Feb 2025 15:50:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9056612A
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 15:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E81F40B6E
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 15:50:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NdFOMT0cL25B for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 15:50:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3989F40A93
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3989F40A93
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3989F40A93
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 15:50:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 39DA319F576;
 Mon,  3 Feb 2025 16:50:44 +0100 (CET)
Received: from host-109-89-232-55.dynamic.voo.be ([109.89.232.55:37528])
 via host-109-89-232-55.dynamic.voo.be ([109.89.232.55])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 03 Feb 2025 16:50:44 +0100
MIME-Version: 1.0
Date: Mon, 03 Feb 2025 16:50:44 +0100
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <87pljzrsi9.fsf@dell.be.48ers.dk>
References: <20250113200224.64363-1-ju.o@free.fr>
 <87pljzrsi9.fsf@dell.be.48ers.dk>
User-Agent: Webmail Free/1.6.9
Message-ID: <761b0f340072edc7cfbc7b049276b808@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1738597845;
 bh=FBN1OntGTvkbg5S/7x8dphTVIwQs4x0czkEQSFdbr50=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Po7EKUCSAZVzqNiejV48eWadVFtltnYnSSOiTy3lIKtR7nHYnuC+7N2E4Fj0aWiIF
 JdhaYOo7Oh5i7LDeYCpyT1NkbO8VZZu238oyoFGPyWW+0lf1ItkOqA3H24sMz/Nv00
 MEWmIBWDORbuxBRw/e+D4AmJMnzb9JVKNAAhKtohoXBAjRZRMhUJnYc8C05VtOZvyo
 k/e5YdignCRk9eNlp8UQiguLX+p3jNDrh3EkDu6LygGOQ18dDkS5MQH9DWr7x4OPaz
 lFrhsK2e7gNa8H8CNbhINyvX61wIHpGxAuCeL4p+kEUSonVolhuSTSGS/PoABLLVdy
 w01AfQiYsyTOQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Po7EKUCS
Subject: Re: [Buildroot] [PATCH 1/1] fs/ext2: fixes for ext2r0 with
 host-e2fsprogs >= 1.47.2
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

Hi Peter,

On 03/02/2025 15:51, Peter Korsgaard wrote:
>>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:
> 
>  > Since Buildroot commit [1] "package/e2fsprogs: bump version to
>  > 1.47.2", running the runtime test tests.fs.test_ext.TestExt2 with 
> the
>  > command:
> 
>  >     utils/docker-run support/testing/run-tests \
>  >         -d dl -o output_folder \
>  >         tests.fs.test_ext.TestExt2
>  >     tail output_folder/TestExt2-build.log
> 
>  > Fails with error in the log:
> 
>  >     mkfs.ext2: the -r option has been removed.
> 
>  >     If you really need compatibility with pre-1995 Linux systems, 
> use the
>  >     command-line option "-E revision=0".
> 
>  > Upstream commit [2] "tune2fs: replace the -r option with -E
>  > revision=<fs-rev>" removed this option.
> 
>  > This commit fixes the issue by using the new form with -E. Also,
>  > BR2_TARGET_ROOTFS_EXT2_MKFS_OPTIONS has a default value to "-O
>  > ^64bit". Passing a "-O ..." option now generates an error when a
>  > ext2r0 filesystem is created (because this revision does not support
>  > ext2 filesystem feature options). This commit sets this default 
> value
>  > only if BR2_TARGET_ROOTFS_EXT2_2r0 is not set.
> 
>  > Fixes: [3]
> 
>  > [1] 
> https://gitlab.com/buildroot.org/buildroot/-/commit/db459859fa3c8fb7a2c0c8b8616637644d9c12bf
>  > [2] 
> https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/commit/?id=3fffe9dd6be5a5ed77755cf23c267b4afd1e7651
>  > [3] https://gitlab.com/buildroot.org/buildroot/-/jobs/8830670170
> 
>  > Signed-off-by: Julien Olivain <ju.o@free.fr>
> 
> Committed, thanks.
> 
> Maybe we should consider dropping r0 support?

I agree, this very old option could be removed.

> Bye, Peter Korsgaard

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
