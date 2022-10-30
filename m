Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB67C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 08:30:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38C4B60644;
	Sun, 30 Oct 2022 08:30:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38C4B60644
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7MSdjqnw9bSI; Sun, 30 Oct 2022 08:30:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9E9060A74;
	Sun, 30 Oct 2022 08:30:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9E9060A74
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A72BB1BF576
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 08:30:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8239360A74
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 08:30:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8239360A74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ghZaGpSeK7oY for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 08:30:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9AB060644
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A9AB060644
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 08:30:42 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6ffe:83e9:a65c:45ae])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 4D66A13F8AF;
 Sun, 30 Oct 2022 09:30:34 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 30 Oct 2022 09:30:33 +0100
Date: Sun, 30 Oct 2022 09:30:33 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221030083033.GC1058960@scaer>
References: <20221028223844.1180418-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221028223844.1180418-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667118639;
 bh=mG4JOeC+v4CNsBlpM40XPNTbZlRtLk0IYM1vl9LDBEk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rzQOBkluipDfEwpTduWLAnlefuPqThN0zvb6Ksy4YPF2fAOiHaQ1D0rR59nKvc4Fe
 GaxGJHcVThogkh0p1MLsolob2sVSuuLBGS0F42jK4QBtSOKk4w9O0/bXxsDruYRL5H
 Dvl9jYoSvMPCeKDJOu/ydudqrwb4qxm+DshIEIWX4X1bmgMAs9PlXr/zNcdEe9l09b
 IJtfjZPUflIPvi14/QVTqsc0fLa8+sbIl5dY7fyS6f5sOLegpd4ppMFobUBuG0+7Sq
 wuFjgAiJqf8MO1AZpMI6NAXSIpjwJRAiroz/LpxJ4MjzPJms1ZuR5rBQ6H2AN6j40a
 DL78rOm9BRgOg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rzQOBklu
Subject: Re: [Buildroot] [PATCH 1/1] package/gcc: ensure __register_frame is
 optimized out for glibc
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2022-10-28 16:38 -0600, James Hilliard spake thusly:
> On some architectures when building with -O0 the __register_frame
> symbol fails to get optimized out which can cause linking failures
> when building glibc.
> 
> To fix this set -O1 for GCC target libs when building with glibc
> and BR2_OPTIMIZE_0 on the problematic target architectures.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/89b/89b6c6924240b7cf82035a844f3573673e91b364
>  - http://autobuild.buildroot.net/results/46f/46f4ec99d2b23d354a4bb5e92123d64f0da6ed27
>  - http://autobuild.buildroot.net/results/839/839f929f700cf181ebdf34389c7806a96f55813e
>  - http://autobuild.buildroot.net/results/0e2/0e202bf53a683930f3cad6edef2a4dea629eaecb
>  - http://autobuild.buildroot.net/results/8a8/8a8c917f597fdcca744e696e19e9300b64004335
>  - http://autobuild.buildroot.net/results/c05/c058b27ed2834dfa633b63ec6c3639ab1e8bf412
>  - http://autobuild.buildroot.net/results/8ba/8ba8882a861cf7df359c23969c09b2be0725b2e5
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/gcc/gcc.mk | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
> index ec6f3b550a..a339f77970 100644
> --- a/package/gcc/gcc.mk
> +++ b/package/gcc/gcc.mk
> @@ -103,6 +103,15 @@ GCC_COMMON_TARGET_CFLAGS += -matomic
>  GCC_COMMON_TARGET_CXXFLAGS += -matomic
>  endif
>  
> +# Enable GCC target libs optimizations to optimize out __register_frame
> +# when needed for some architectures when building with glibc.
> +ifeq ($(BR2_TOOLCHAIN_USES_GLIBC)$(BR2_OPTIMIZE_0),yy)
> +ifeq ($(BR2_microblazebe)$(BR2_microblazeel)$(BR2_mips)$(BR2_mipsel)$(BR2_nios2)$(BR2_or1k)$(BR2_sh),y)
> +GCC_COMMON_TARGET_CFLAGS += -O1
> +GCC_COMMON_TARGET_CXXFLAGS += -O1
> +endif
> +endif

Should this not be limitied to the intial compiler only? Otherwise, why
would we need it for the final compiler?

Regards,
Yann E. MORIN.

>  # Propagate options used for target software building to GCC target libs
>  HOST_GCC_COMMON_CONF_ENV += CFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CFLAGS)"
>  HOST_GCC_COMMON_CONF_ENV += CXXFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CXXFLAGS)"
> -- 
> 2.34.1
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
