Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637DEC3DA7F
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 19:50:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3173F60727;
	Thu, 15 Aug 2024 19:50:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3UHlcfF0Isyy; Thu, 15 Aug 2024 19:50:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3175E608FB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3175E608FB;
	Thu, 15 Aug 2024 19:50:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 073D41BF599
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 19:50:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8656400B5
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 19:50:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h3mU6v2YmshH for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 19:50:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 500E0408C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 500E0408C9
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 500E0408C9
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 19:49:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 56BE113F86A;
 Thu, 15 Aug 2024 21:49:54 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 15 Aug 2024 21:49:53 +0200
Date: Thu, 15 Aug 2024 21:49:53 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <Zr5b4dcGEt0qwvVW@landeda>
References: <Zr3cWSzM+spo0TNf@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zr3cWSzM+spo0TNf@waldemar-brodkorb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1723751396;
 bh=vWoYvvVzrDsvGhAYNn3cUesIGpgHmaLtdt0KH5GmrbY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b3AvyuAfOwhtyLIKSHtRfBnY1juYklo00F6fb/ZbNrEvpnMmQdUi5+LBwaye7u98N
 hpqmukGrCWR5U9v65o9675CUsgZrOD39SSgvqOCejoK++4CjXAuiShcBQpYpgXbT4v
 t7v7RVbfPoPASO7pStpz+KkT3knSmKZyUxxDAinjimzm1jkj5Zb4TLtcGPBfnicWEP
 3FMcE3T/Fq8lhgUGywGPvceo8oD+zLFnjb/4IzQmBpE45qJKz7vtTCpQ4eu0DxTSGF
 vmCM7ghW2V/oQKMoPaBrfYz+pQ7NzyAqRm9NOmKMTn3R0zIbXHZlXOz7DnpZAsCIYd
 ProyRm5zcAg2A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=b3AvyuAf
Subject: Re: [Buildroot] [PATCH] package/ffmpeg: fix microblaze compile issue
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

Waldemar, All,

On 2024-08-15 12:45 +0200, Waldemar Brodkorb spake thusly:
> Since the update of ffmpeg to 6.1.1 in commit
> fa36a6375dbeae131c596070570cec66c7bd2456 there are
> a lot of microblaze build failures.
> 
> The compilation failure is triggered by GCC Bug 68485.

I added a little blurb with your explanations why --disable-optimizations
was also needed.

> Fixes:
>  - http://autobuild.buildroot.net/results/524/524cef193aec30471e55eb0eecfa39f0d6011a91
> 
> And many more.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/ffmpeg/ffmpeg.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
> index 19c270a14b..a010c0168c 100644
> --- a/package/ffmpeg/ffmpeg.mk
> +++ b/package/ffmpeg/ffmpeg.mk
> @@ -557,6 +557,11 @@ FFMPEG_CONF_OPTS += --disable-optimizations
>  FFMPEG_CFLAGS += -O0
>  endif
>  
> +ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
> +FFMPEG_CONF_OPTS += --disable-optimizations
> +FFMPEG_CFLAGS += -O0
> +endif
> +
>  ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
>  FFMPEG_CFLAGS += -marm
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
