Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D9BD59F6B
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 19:21:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4424D6068B;
	Wed,  6 Nov 2024 19:21:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nmWclOqYeRDh; Wed,  6 Nov 2024 19:21:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9717A606E8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9717A606E8;
	Wed,  6 Nov 2024 19:21:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BE5D53B
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 19:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC6D440633
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 19:21:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5AtSbDA0rUMZ for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 19:21:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.75.193.91;
 helo=nyc.source.kernel.org; envelope-from=jarkko@kernel.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D525C403A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D525C403A1
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D525C403A1
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 19:21:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 67B31A442B5;
 Wed,  6 Nov 2024 19:19:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86884C4CEC6;
 Wed,  6 Nov 2024 19:20:58 +0000 (UTC)
Mime-Version: 1.0
Date: Wed, 06 Nov 2024 21:20:54 +0200
Message-Id: <D5FC8F4N1HDQ.2JX7HPE33GN7L@kernel.org>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 <buildroot@buildroot.org>
Cc: "Andy Yan" <andyshrk@gmail.com>, "Andy Yan" <andyshrk@163.com>, "Aaron
 Sierra" <aaron@bubbl-tek.com>
X-Mailer: aerc 0.18.2
References: <20241106184841.1053511-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20241106184841.1053511-1-andriy.shevchenko@linux.intel.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1730920859;
 bh=O3zzRfHUukDU2Kx5OeCBd5XnB758PyC0uKprLkf0Hq0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bDrpZXgRfPhjMuQw5a1OB89+izvfQ0Fk0gpCEI5xIUnpt5z3lsTjNy4gV/QCnPP/w
 grOqVmoCe6ykGrXFz+uUE8an31X1iqoEPsONCGtiONY3NkpH6beHv3rLK/IA7JqE2p
 BfiALs36PQC7puxzr9YlO5k+Y7mR37W+wfw4lqfDCdyhR+nCS/RXfqzK39oRqiVXP5
 15UU1wfa2OwNFBPuOM0rKLr3jvU2BvVh3WhIY4OdtyFYvoM1fZDAXN34u2thoONcNO
 a23Bnq7Vfl0GQDy8WSYgCO+5hPPVKq7k/CgxBc9II20Q4hul1J2+4fW6j8CmMHT4Ee
 PIROVyBxD6RAQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=bDrpZXgR
Subject: Re: [Buildroot] [PATCH v1 1/1] package/iotools: Update to v1.8
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
From: Jarkko Sakkinen via buildroot <buildroot@buildroot.org>
Reply-To: Jarkko Sakkinen <jarkko@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed Nov 6, 2024 at 8:48 PM EET, Andy Shevchenko wrote:
> This is minor update to iotools to fix some issues Aaron noticed and
> addressed. The bigger change will come later with better integration
> with the regular build systems (CMake).
>
> Cc: Aaron Sierra <aaron@bubbl-tek.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  package/iotools/iotools.hash | 2 +-
>  package/iotools/iotools.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/iotools/iotools.hash b/package/iotools/iotools.hash
> index 11d7ffb73e39..48d347bb3c11 100644
> --- a/package/iotools/iotools.hash
> +++ b/package/iotools/iotools.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  13b8b87c7d1f22b8d8f50c499af09f9414a0879d69c22393f1051ed4bf28f378  iotools-v1.7.tar.gz
> +sha256  9cb6184030b2e5c2e6a7c7a2d016d29d42d4075a77e1ba982bdc3cd919491faf  iotools-v1.8.tar.gz
>  sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
> diff --git a/package/iotools/iotools.mk b/package/iotools/iotools.mk
> index 03b87c89e9d0..f5e322eab818 100644
> --- a/package/iotools/iotools.mk
> +++ b/package/iotools/iotools.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -IOTOOLS_VERSION = v1.7
> +IOTOOLS_VERSION = v1.8
>  IOTOOLS_SITE = $(call github,andy-shev,iotools,$(IOTOOLS_VERSION))
>  IOTOOLS_LICENSE = GPL-2.0+
>  IOTOOLS_LICENSE_FILES = COPYING


Tested-by: Jarkko Sakkinen <jarkko@kernel.org>

I use this is my BR builds occasionally, thus tested the patch :-)

BR, Jarkko
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
