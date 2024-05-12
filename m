Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EF5C25B4F
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 17:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 588CB60600;
	Sun, 12 May 2024 17:55:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 231TYj-q93p0; Sun, 12 May 2024 17:55:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DA0A60750
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DA0A60750;
	Sun, 12 May 2024 17:55:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 631721BF421
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 17:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 507E4403AC
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 17:55:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pzLHjWYnigVa for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 17:55:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1AA4E40382
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1AA4E40382
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1AA4E40382
 for <buildroot@buildroot.org>; Sun, 12 May 2024 17:55:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 0437513F8B3;
 Sun, 12 May 2024 19:54:59 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 12 May 2024 19:54:59 +0200
Date: Sun, 12 May 2024 19:54:59 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <ZkECc28IHqXbph99@landeda>
References: <20240512163159.999251-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240512163159.999251-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1715536502;
 bh=3wJi+kKyjIWZvDjmRP0c5ARV4L2gU8scjbvCgPBFUlE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Yh9fU3UicuXN3NniGyLlkng6s0gi/vaeVIVGswkt4uY2Zy00bA0in9TOqOe9nxuwg
 1DNXCYhRaSzzaD4zM+GHXjnhFUVhPSOCmKlKXA1VAOIQx3v0xuxXG+G/YU87onCe/S
 41ealH8Xwd75PpziHmQ2DbU7iQ5eHGcrmUx6AXwqtxvLnsqvTNgyrcpS7y1Xv8LzYo
 3tosbWsDoFDq8kSbi+43nMFmzIzqkjpfs/oRk5i0MtAGuz+Z0FbqNpYJw6mrdyu5g+
 lWY1QaBZLMFoSFSSQOGPTD4kRKFkmXJcHKS1hdXu2zBvMxx8S48agG+uhkiiDwi6dK
 L0tPfBCqsh3RQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Yh9fU3Ui
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi: remove libatomic from
 linker flags
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

Bernd, All,

On 2024-05-12 18:31 +0200, Bernd Kuhls spake thusly:
> Kodi added detection for atomic/libatomic with commit
> https://github.com/xbmc/xbmc/commit/1673f476b802da1da942cef256cae6272fdf9a4b
> so we can remove our own code to handle the dependency.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks for the quick fix!

Regards,
Yann E. MORIN.

> ---
>  package/kodi/kodi.mk | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
> index 62463b731e..94cab237dc 100644
> --- a/package/kodi/kodi.mk
> +++ b/package/kodi/kodi.mk
> @@ -217,11 +217,6 @@ else
>  KODI_CONF_OPTS += -D_AVX2_OK=OFF -D_AVX2_TRUE=OFF
>  endif
>  
> -# mips: uses __atomic_load_8
> -ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> -KODI_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
> -endif
> -
>  ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_5),)
>  KODI_C_FLAGS += -std=gnu99
>  endif
> -- 
> 2.39.2
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
