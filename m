Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6311ECFD2F6
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 23:28:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADD9261B8A;
	Thu, 27 Nov 2025 23:28:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6sUczatRPQTp; Thu, 27 Nov 2025 23:28:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9373961B39
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9373961B39;
	Thu, 27 Nov 2025 23:28:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A7A8E708
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 23:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8792C40DB7
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 23:28:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bzXu-PxG9N5P for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 23:28:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 54D3040DAE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54D3040DAE
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 54D3040DAE
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 23:28:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id CDA7B78034E;
 Fri, 28 Nov 2025 00:28:35 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 28 Nov 2025 00:28:35 +0100
MIME-Version: 1.0
Date: Fri, 28 Nov 2025 00:28:35 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20251123171401.933757-2-bernd@kuhls.net>
References: <20251123171401.933757-1-bernd@kuhls.net>
 <20251123171401.933757-2-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <c44f170a5d71552c9d5e682264291aa6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764286118;
 bh=GlzDPFz9mlELkGK9Rr6wvbEzd1M3HXjQ+rZQvvYlLD4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WuAJmiGpjx5CHtIVhZPi+/0LJ5TWKRQYQEcMkg36ulDiNh6RmdyJhX5u1XLDW9Bca
 YCaPEagkdvLLBntC173TjxKurnWx4XXxnJ3/3HyV/rUbOtkEFYWNkOE5NAxnYQDkTh
 XkIdBKhILrah8HuIfljEaGfAKXAVIJq0brqICxcN8zgDSyQxDlJ4FHhhGz5CvAJKD9
 FVEuAQ5rL2k7Ed26At5cMOnfOeULw79pRUleXua6KREA2JIaLziSaYyM7KisDowOxj
 vwhvZU2gKjOgJlRQ66dvbBIQlcocoQvh9vYxsX7zgWg5BmeA14/I7kEnoyyJ9Mx8+B
 dFqr+yi43sGKA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WuAJmiGp
Subject: Re: [Buildroot] [PATCH/next 2/3] package/xfsprogs: bump version to
 6.17.0
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

Hi Bernd,

Thanks for the patch.

On 23/11/2025 18:14, Bernd Kuhls wrote:
> Changelog:
> https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/tree/doc/CHANGES?h=v6.17.0
> 
> Upstream commit
> https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/commit/?id=0b3e7284c7fa20dd27f8a584f8db417d1d6fa27b
> which is included in version 6.14.0 fixes a build error with icu >= 76.
> 
> Fixes:
> https://autobuild.buildroot.net/results/a30/a30bf79be2102f3a77e4a78a488fb3b6a5b63bbb/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/xfsprogs/xfsprogs.hash | 2 +-
>  package/xfsprogs/xfsprogs.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
[...]
> diff --git a/package/xfsprogs/xfsprogs.mk 
> b/package/xfsprogs/xfsprogs.mk
> index 0234b91d09..05fc053ffc 100644
> --- a/package/xfsprogs/xfsprogs.mk
> +++ b/package/xfsprogs/xfsprogs.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -XFSPROGS_VERSION = 6.11.0
> +XFSPROGS_VERSION = 6.17.0

This new version introduces buildfailures. See:
https://gitlab.com/jolivain/buildroot/-/pipelines/2183893705

For reference, previous version 6.11.0:
https://gitlab.com/jolivain/buildroot/-/pipelines/2183909751

Could you have a look, please?

>  XFSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/fs/xfs/xfsprogs
>  XFSPROGS_SOURCE = xfsprogs-$(XFSPROGS_VERSION).tar.xz
>  XFSPROGS_LICENSE = GPL-2.0, GPL-2.0+, LGPL-2.1 (libhandle, few 
> headers)
> --
> 2.47.3

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
