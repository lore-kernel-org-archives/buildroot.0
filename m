Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C29CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 09:29:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3CC3813F6;
	Sun,  7 Apr 2024 09:29:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6MuHa--aSu4f; Sun,  7 Apr 2024 09:29:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E01CD8141B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E01CD8141B;
	Sun,  7 Apr 2024 09:29:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E86DF1BF296
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 09:29:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4AEB409C6
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 09:29:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TgMoar84vZeb for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 09:29:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 845A2407CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 845A2407CA
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 845A2407CA
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 09:29:07 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id B190B13F86E;
 Sun,  7 Apr 2024 11:29:00 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 Apr 2024 11:29:00 +0200
Date: Sun, 7 Apr 2024 11:29:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <ZhJnXDUGI80K38Np@landeda>
References: <20240406073216.1054073-1-bernd@kuhls.net>
 <20240406073216.1054073-3-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240406073216.1054073-3-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712482145;
 bh=zUrEV4+eSFUtyBurQ+Qhv1LIKlsSsf4mAPJqwzHfwTM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y80B4nUf+0987FRrW7rf9BuRAsu/QiOfm78ZWmRBxvFOLF+Cq3rblmhCXOiQexi2b
 +p/7Y6AO0R1r8uZmGpkDXo7FTnYMok4YhIwRX4AdN5awtJ1qGjwbDn46zCdOXhqzZW
 oHbkYNHubLdUqcg8Z7ZjOxImjEHlRDBap3DsE/C9C81QdmF2NaK4azqwRM9hMiZq2b
 kQFF2cgPJ2J/cFtCE0XMVD763MMhtpKCBEG7G9L+TtKx0zFNhawhh/QSWCR5FtgOor
 M5UywKTIpg5CvDzbqP802zLwJOLGrbRm6ozcvGqKE9/tCPJRvyosCe4ajspEjKSUDL
 zdcyUbzE7ANvA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Y80B4nUf
Subject: Re: [Buildroot] [PATCH 03/18] package/ffmpeg: add optional support
 for libvpl
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
Cc: Julien Corjon <corjon.j@ecagroup.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2024-04-06 09:32 +0200, Bernd Kuhls spake thusly:
> Added with commit
> http://git.videolan.org/?p=ffmpeg.git;a=commit;h=7158f1e64d9b76afea78537a35c465447df0cff8
> 
> "It will fail to run configure script if both libmfx and libvpl are
> enabled.
> 
> It is recommended to use oneVPL for new work, even for currently
> available hardwares"

I like those little quotes and references that explain the reasoning
behind the change, thanks!

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/ffmpeg/ffmpeg.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
> index acd5a7d8b2..e7fc1854e5 100644
> --- a/package/ffmpeg/ffmpeg.mk
> +++ b/package/ffmpeg/ffmpeg.mk
> @@ -321,12 +321,18 @@ else
>  FFMPEG_CONF_OPTS += --disable-libbluray
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBVPL),y)
> +FFMPEG_CONF_OPTS += --enable-libvpl --disable-libmfx
> +FFMPEG_DEPENDENCIES += libvpl
> +else
>  ifeq ($(BR2_PACKAGE_INTEL_MEDIASDK),y)
>  FFMPEG_CONF_OPTS += --enable-libmfx
>  FFMPEG_DEPENDENCIES += intel-mediasdk
>  else
>  FFMPEG_CONF_OPTS += --disable-libmfx
>  endif
> +FFMPEG_CONF_OPTS += --disable-libvpl
> +endif

I think we can simplify this a little bit:

    ifeq ($(BR2_PACKAGE_LIBVPL),y)
    FFMPEG_CONF_OPTS += --enable-libvpl --disable-libmfx
    FFMPEG_DEPENDENCIES += libvpl
    else ifeq ($(BR2_PACKAGE_INTEL_MEDIASDK),y)
    FFMPEG_CONF_OPTS += --disable-libvpl --enable-libmfx
    FFMPEG_DEPENDENCIES += intel-mediasdk
    else
    FFMPEG_CONF_OPTS += --disable-libvpl --disable-libmfx
    endif

Regards,
Yann E. MORIN.

>  ifeq ($(BR2_PACKAGE_RTMPDUMP),y)
>  FFMPEG_CONF_OPTS += --enable-librtmp
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
