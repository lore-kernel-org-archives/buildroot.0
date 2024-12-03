Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0442E74AD6
	for <buildroot@archiver.kernel.org>; Tue,  3 Dec 2024 21:07:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70FC861129;
	Tue,  3 Dec 2024 21:07:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kbSoWkgvqiex; Tue,  3 Dec 2024 21:07:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AD486113D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8AD486113D;
	Tue,  3 Dec 2024 21:07:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8164B2073
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 21:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 619A86113D
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 21:07:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xc7V6nKNJNsi for <buildroot@buildroot.org>;
 Tue,  3 Dec 2024 21:07:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6B36861129
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B36861129
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6B36861129
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 21:07:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 1A1D719F5C6;
 Tue,  3 Dec 2024 22:06:59 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:51546])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 03 Dec 2024 22:06:59 +0100
MIME-Version: 1.0
Date: Tue, 03 Dec 2024 22:06:59 +0100
From: Julien Olivain <ju.o@free.fr>
To: Sabeeh Khan <sabeeh-khan@ti.com>
Cc: buildroot@buildroot.org, Dimitrios Siganos <dimitris@siganos.org>, Bernd
 Kuhls <bernd@kuhls.net>
In-Reply-To: <20241203155920.2147390-1-sabeeh-khan@ti.com>
References: <20241203155920.2147390-1-sabeeh-khan@ti.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <6cf89e23fb2fdf2de7a1867dbf1f6153@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1733260023;
 bh=4TsFZWFwRkptjYBmLxQlTU0fZoFezfqsc/vlvIvXlsA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mrd28UvKZKm/1j9NjaMC2GTrQlQh5TStUZlqxaVMNWW9PXVKR3+hJDXw62SHX8zDG
 pNB7DNj5xlX2WRs6NjyYIrz691zh1bd9IZXB1fLT+rzeR4EfOHk1mEoR3uTGRMahOr
 42uFIt0Ei9vSBirn8FowdDnL2yldTgqKaKJ3vTbnD9Hlow+yggNH1bGcO69horTzsh
 fs+3cQ2c7iCv0LBF1/dI81Ob+LMStv2pYOp+OjNyMIo4g5QYH5vSJ2mV59Ae+eEgrs
 2tBHpQUpUHsjK5+LKVMRyyExt6Zyt6toDTq3CpBUXaF/TIddZFDwOtIY5E/pPGXc2c
 6vHi1bCrpZ/cw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mrd28UvK
Subject: Re: [Buildroot] [PATCH] package/wireless-regdb: bump version to
 2024.10.07
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

On 03/12/2024 16:59, Sabeeh Khan via buildroot wrote:
> Signed-off-by: Sabeeh Khan <sabeeh-khan@ti.com>

Applied to next, thanks.

> ---
>  package/wireless-regdb/wireless-regdb.hash | 2 +-
>  package/wireless-regdb/wireless-regdb.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/wireless-regdb/wireless-regdb.hash 
> b/package/wireless-regdb/wireless-regdb.hash
> index ca11551579..a3b5973bad 100644
> --- a/package/wireless-regdb/wireless-regdb.hash
> +++ b/package/wireless-regdb/wireless-regdb.hash
> @@ -1,4 +1,4 @@
>  # From 
> https://www.kernel.org/pub/software/network/wireless-regdb/sha256sums.asc
> -sha256  
> 9832a14e1be24abff7be30dee3c9a1afb5fdfcf475a0d91aafef039f8d85f5eb  
> wireless-regdb-2024.07.04.tar.xz
> +sha256  
> f76f2bd79a653e9f9dd50548d99d03a4a4eb157da056dfd5892f403ec28fb3d5  
> wireless-regdb-2024.10.07.tar.xz
>  # Locally computed
>  sha256  
> 678b0df753c86198fc496d1f1033429bbd57f101472132ee7eaaf9f5e0a7fae1  
> LICENSE
> diff --git a/package/wireless-regdb/wireless-regdb.mk 
> b/package/wireless-regdb/wireless-regdb.mk
> index fae21687de..2aec19c507 100644
> --- a/package/wireless-regdb/wireless-regdb.mk
> +++ b/package/wireless-regdb/wireless-regdb.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -WIRELESS_REGDB_VERSION = 2024.07.04
> +WIRELESS_REGDB_VERSION = 2024.10.07
>  WIRELESS_REGDB_SOURCE = 
> wireless-regdb-$(WIRELESS_REGDB_VERSION).tar.xz
>  WIRELESS_REGDB_SITE = 
> $(BR2_KERNEL_MIRROR)/software/network/wireless-regdb
>  WIRELESS_REGDB_LICENSE = ISC
> --
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
