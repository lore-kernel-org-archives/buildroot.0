Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A92A0C5478A
	for <buildroot@archiver.kernel.org>; Wed, 21 Feb 2024 18:05:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B55560EF1;
	Wed, 21 Feb 2024 18:05:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4NdQLqWqWYWU; Wed, 21 Feb 2024 18:05:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6736660F2C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6736660F2C;
	Wed, 21 Feb 2024 18:05:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7BD781BF3EB
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 18:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 76E7860F2C
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 18:05:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S5Ek1IQ1fJpW for <buildroot@lists.busybox.net>;
 Wed, 21 Feb 2024 18:05:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 54C9F60EF1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54C9F60EF1
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 54C9F60EF1
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 18:05:41 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 498B613F8CF;
 Wed, 21 Feb 2024 19:05:38 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 21 Feb 2024 19:05:38 +0100
Date: Wed, 21 Feb 2024 19:05:38 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <ZdY7chqMYU3zxnWa@landeda>
References: <20240219192724.3776282-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240219192724.3776282-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1708538740;
 bh=jkObsEcHlthXJ9UDtMOV6QgBnvj83nt+KqfpY6ghFIA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BwcyHqQafRg6lCzr8psF1poKQxfmG+00sgK5EC8L9l0B/8a3++Q/q0+te+nS2kAbP
 6RANkdh+XtSfxC2fc8SRMNdEN2hD6Tl/UM+eLO5z/TJVP04rkpN74sM9mtZ66tYJqk
 Zo8knNhuZthRWGNqFwSvDowqtvNArVlxCyfi8jlMG0LWLsUDCuhUaBYmru8gbMqgnm
 OHpV5gwqs7UmSE9UndTTm8xantrlKsLRr743yvyRqZPAV0knMQ8vVnDnuQIRFn+QMV
 CvtPurMjjhcrwDtlrLlmAFd8Xuz4fFPFqJhEh8hQrd7WEcxUv8EQPg1IbSI8vqlJvP
 V0H2lWoyGvBTA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BwcyHqQa
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi-pvr-mythtv: bump version
 to 20.6.4-Nexus
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

On 2024-02-19 20:27 +0100, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash | 2 +-
>  package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
> index 286cff5cc4..b4e6f30685 100644
> --- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
> +++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  4c742a31ec6f4d2a427d05f70950cfd4e347cf1c0acdb1747c39eb68124be30a  kodi-pvr-mythtv-20.6.1-Nexus.tar.gz
> +sha256  da7cdc514ce48992e7c2575735c4bd9d22891ba3c12169ae42163b159517b8c9  kodi-pvr-mythtv-20.6.4-Nexus.tar.gz
>  sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
> diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
> index 312c8619be..57ddf3af10 100644
> --- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
> +++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -KODI_PVR_MYTHTV_VERSION = 20.6.1-Nexus

AFAICS, we only have 20.5.10-Nexus in master...

Regards,
Yann E. MORIN.

> +KODI_PVR_MYTHTV_VERSION = 20.6.4-Nexus
>  KODI_PVR_MYTHTV_SITE = $(call github,janbar,pvr.mythtv,$(KODI_PVR_MYTHTV_VERSION))
>  KODI_PVR_MYTHTV_LICENSE = GPL-2.0+
>  KODI_PVR_MYTHTV_LICENSE_FILES = LICENSE.md
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
