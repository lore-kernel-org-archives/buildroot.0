Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48014C433F5
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 20:14:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 100AE610A3
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 20:14:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 100AE610A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBD8260643;
	Sat, 18 Sep 2021 20:14:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GtiOBdyXkhjv; Sat, 18 Sep 2021 20:14:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37ED160662;
	Sat, 18 Sep 2021 20:14:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CD1F41BF27C
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 20:14:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BBADF40162
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 20:14:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c5-Akdh7ocQb for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 20:14:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 80C2640018
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 20:14:19 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed4a:2560:2180:38b6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id AF710B004E8;
 Sat, 18 Sep 2021 22:14:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631996057;
 bh=pyVLYDifMiIecZleNBibSEnz2PvZmqQzD6+AH8JHknE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=imO/JkRNcowhL0iD6Pw/inhxuYNDlScQOJ2JTTYvzl0DdmvOx7nwnQk2f01Tklyh+
 jAmr4SbsnmT3CMFFvKy0AogZ0j7F2JTX2ZCCh9TYIYTI+FvxbMvJtDStSeQvPa6Zb7
 ppE8orVpdxBXxi5dUc/IwhCbiaNS2n8mRbvWNKzpj6m0PplNq3fzN+YZruk5r462b+
 wT4RU3v+x6vejRReCPFPoknozvWni2VZoic0MuJweW7VSSCMVF4692M2+ajOqnadJ/
 jXkEW79y11C5yc2jSWQN3eNrtKeHnqNmSN70fu9cyOTBBDH5SWcq+qnil6zt6N+2u4
 hkEzZdLUjNzSg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Sep 2021 22:14:11 +0200
Date: Sat, 18 Sep 2021 22:14:11 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20210918201411.GN1053080@scaer>
References: <20210914210154.29441-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210914210154.29441-1-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v1] package/libxkbcommon: bump version to
 1.3.1
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Peter, All,

On 2021-09-14 23:01 +0200, Peter Seiderer spake thusly:
> For details (since 1.1.0) see [1]
> 
> [1] https://lists.freedesktop.org/archives/wayland-devel/2021-April/041762.html
> [2] https://lists.freedesktop.org/archives/wayland-devel/2021-May/041816.html
> [3] https://lists.freedesktop.org/archives/wayland-devel/2021-September/041976.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libxkbcommon/libxkbcommon.hash | 4 ++--
>  package/libxkbcommon/libxkbcommon.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libxkbcommon/libxkbcommon.hash b/package/libxkbcommon/libxkbcommon.hash
> index 40cad4d0b7..c00fffe706 100644
> --- a/package/libxkbcommon/libxkbcommon.hash
> +++ b/package/libxkbcommon/libxkbcommon.hash
> @@ -1,5 +1,5 @@
> -# From https://lists.freedesktop.org/archives/wayland-devel/2021-March/041747.html
> -sha256  412cfcca596f92914ea1a66ad244804d73a5ff20b6d86459951e7ad20576c246  libxkbcommon-1.1.0.tar.xz
> +# From https://lists.freedesktop.org/archives/wayland-devel/2021-September/041976.html
> +sha256  b3c710d27a2630054e1e1399c85b7f330ef03359b460f0c1b3b587fd01fe9234  libxkbcommon-1.3.1.tar.xz
>  
>  # License file:
>  sha256  086caee279449369d41c1157911ec7696e707b93feba7280de757d3c470b2dfb  LICENSE
> diff --git a/package/libxkbcommon/libxkbcommon.mk b/package/libxkbcommon/libxkbcommon.mk
> index 8780706c7e..790083614f 100644
> --- a/package/libxkbcommon/libxkbcommon.mk
> +++ b/package/libxkbcommon/libxkbcommon.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBXKBCOMMON_VERSION = 1.1.0
> +LIBXKBCOMMON_VERSION = 1.3.1
>  LIBXKBCOMMON_SITE = http://xkbcommon.org/download
>  LIBXKBCOMMON_SOURCE = libxkbcommon-$(LIBXKBCOMMON_VERSION).tar.xz
>  LIBXKBCOMMON_LICENSE = MIT/X11
> -- 
> 2.32.0
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
