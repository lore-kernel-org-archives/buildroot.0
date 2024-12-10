Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 800C4E7717F
	for <buildroot@archiver.kernel.org>; Tue, 10 Dec 2024 21:50:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F7BF403C8;
	Tue, 10 Dec 2024 21:50:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oVe99Gd-EBfi; Tue, 10 Dec 2024 21:50:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E149A40359
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E149A40359;
	Tue, 10 Dec 2024 21:50:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E38D16F
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 21:50:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1B7180D70
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 21:50:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lp01C6Gt_po4 for <buildroot@buildroot.org>;
 Tue, 10 Dec 2024 21:50:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D21D380D2F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D21D380D2F
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D21D380D2F
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 21:50:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 8318678034D;
 Tue, 10 Dec 2024 22:50:04 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:51564])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 10 Dec 2024 22:50:04 +0100
MIME-Version: 1.0
Date: Tue, 10 Dec 2024 22:50:04 +0100
From: Julien Olivain <ju.o@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241202230529.228304-1-giulio.benetti@benettiengineering.com>
References: <20241202230529.228304-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <5ae90b82fd4529347dddc59daf28b10d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1733867405;
 bh=PHHbaqEP0P1ihbm+SeJuU9s6ECExfqnvwHGYX4vQdno=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OQAy6/NHjA6A6tT8izbt0NFXGrofamOtF1grCXz+VqEcdR2TJDaK+tGZuovtMFRa0
 ApOS9zdITk8mtIZO+hEj4WGEi61MmchuYxrGhSYVRyGOSlBiBpPSezwTD6WUSo7eIZ
 IiK6W2Qeqlkuh4Q6b1s4qQSUWn2nRQSyA4HaR0FFTCpVvHAap1pYCnsCM2OnGKJMn4
 Yd29XvVLA8yqC5TFMip9N95W3chHU0QsmYtEQ38iRzgX7i3XGqcgtPtM1oNZrWBZ5C
 PFbaBQDTr1jYBo3MIDeB3EG/TXXCOJjhb7RnA9pRrS7yAIPy7BHpR4FO/4Np4LiAMD
 nCquz3Oxq1SWQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OQAy6/NH
Subject: Re: [Buildroot] [PATCH] package/swugenerator: bump to version 0.4
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

On 03/12/2024 00:05, Giulio Benetti wrote:
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.

> ---
>  package/swugenerator/swugenerator.hash | 2 +-
>  package/swugenerator/swugenerator.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/swugenerator/swugenerator.hash 
> b/package/swugenerator/swugenerator.hash
> index 301f168681..5c4878b400 100644
> --- a/package/swugenerator/swugenerator.hash
> +++ b/package/swugenerator/swugenerator.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated
> -sha256  
> 3f4885242bce9523d26567578793c828e2f07122c6b7e44cce8ede33e5618a01  
> swugenerator-0.3.tar.gz
> +sha256  
> 80351fc1c57a6162bc07c44765f2cfd76f3d984dbefca79c3d59844aacd2957f  
> swugenerator-0.4.tar.gz
>  # Locally computed sha256 checksums
>  sha256  
> 3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  
> LICENSE
> diff --git a/package/swugenerator/swugenerator.mk 
> b/package/swugenerator/swugenerator.mk
> index 22ed799e99..b5f7796ebe 100644
> --- a/package/swugenerator/swugenerator.mk
> +++ b/package/swugenerator/swugenerator.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -SWUGENERATOR_VERSION = 0.3
> +SWUGENERATOR_VERSION = 0.4
>  SWUGENERATOR_SITE = $(call 
> github,sbabic,swugenerator,$(SWUGENERATOR_VERSION))
>  SWUGENERATOR_LICENSE = GPL-3.0
>  SWUGENERATOR_LICENSE_FILES = LICENSE
> --
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
