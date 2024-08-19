Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB7AC52D7C
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 20:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7263F80AC7;
	Mon, 19 Aug 2024 20:39:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V2B2vMFHVCUe; Mon, 19 Aug 2024 20:39:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6694980ACB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6694980ACB;
	Mon, 19 Aug 2024 20:39:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EF5B31BF3C9
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 20:39:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E943C4063F
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 20:39:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9K9DVLwRtSoR for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 20:39:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A919B40616
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A919B40616
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A919B40616
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 20:39:53 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A1D0F13F88F;
 Mon, 19 Aug 2024 22:39:48 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 19 Aug 2024 22:39:48 +0200
Date: Mon, 19 Aug 2024 22:39:48 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZsOtlAITfcNLnG5_@landeda>
References: <20240818215627.1055491-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240818215627.1055491-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1724099991;
 bh=e6qfdlsD9SVdYvQ6OEc6CdAhOqrXCZFUZv7KOswfpRg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X+x7yQ8mEYv4eGSNkq6qKCHXaEgtyOWVHW4f1fhLHS5AMjdghby1aHDGxF+4OrOKy
 b4b9QK+ldCloZsL2Uf5Bz5geGY1aJHdicLK3cHDeHQD6IahsPn72fHd0X8sop5Wtu4
 krWB85bEFO9WfQ8P2VcJykR+KHqMQTbZOpNY2+O40BqvMoGcNLrsQQemJhZ7P1l27U
 RrXuSq1OOdtyI+n0Mar2cRXh+mf83jHlos3/OE1Jz4aCp5wE9lfd889GNfK1ZekfL3
 gExfZIf0eFrTkGixW0cFOqZPfPx+tuEyj6+93HxMgn1kJe1YRpmVW8ck7WQTChed/9
 l80mqWewWywog==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=X+x7yQ8m
Subject: Re: [Buildroot] [PATCH 1/2] package/flashrom: bump to final 1.4.0
 release
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

Thomas, All,

On 2024-08-18 23:56 +0200, Thomas Petazzoni via buildroot spake thusly:
> This commit is suitable for master because:
> 
> $ git log --format=oneline v1.4.0-rc2..v1.4.0
> eace095b15eb034e42d97202cad70ce979d8ca38 VERSION: Update version to 1.4.0
> 30c85a62c1abe07d57d5a7b523ef62c2c5b825c9 doc: Release notes for version 1.4.0
> e4e0fd0d8232260af052fde52a9fb636181b2e2e meson: Fix project name as flashrom
> 
> And it looks nicer to have a final 1.4.0 release than a 1.4.0-rc2
> release candidate.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Both patches applied to master, but in the reverse order: first the
build fix, then the version bump.

Regards,
Yann E. MORIN.

> ---
>  package/flashrom/flashrom.hash | 2 +-
>  package/flashrom/flashrom.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/flashrom/flashrom.hash b/package/flashrom/flashrom.hash
> index cecec5273f..17ebdee3af 100644
> --- a/package/flashrom/flashrom.hash
> +++ b/package/flashrom/flashrom.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  318c54a4143a1a05b30cecd64fbff41a0f5cd35a020622864c11fb44f8ed04d4  flashrom-1.4.0-rc2.tar.gz
> +sha256  b77ce458b3b874387270a71805e899ac63f057d7553dc320da7e4c58e750577c  flashrom-1.4.0.tar.gz
>  sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
> diff --git a/package/flashrom/flashrom.mk b/package/flashrom/flashrom.mk
> index 1e7d332dae..46d42640e9 100644
> --- a/package/flashrom/flashrom.mk
> +++ b/package/flashrom/flashrom.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -FLASHROM_VERSION = 1.4.0-rc2
> +FLASHROM_VERSION = 1.4.0
>  FLASHROM_SITE = $(call github,flashrom,flashrom,v$(FLASHROM_VERSION))
>  FLASHROM_LICENSE = GPL-2.0+
>  FLASHROM_LICENSE_FILES = COPYING
> -- 
> 2.46.0
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
