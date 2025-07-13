Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F33C83F17
	for <buildroot@archiver.kernel.org>; Sun, 13 Jul 2025 09:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7591540557;
	Sun, 13 Jul 2025 09:40:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EkIS4R_xduMy; Sun, 13 Jul 2025 09:40:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B305406BE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B305406BE;
	Sun, 13 Jul 2025 09:40:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AD385106
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 09:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93E40400E3
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 09:40:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LKHqHA78Yiv6 for <buildroot@buildroot.org>;
 Sun, 13 Jul 2025 09:40:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 740A54009B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 740A54009B
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 740A54009B
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 09:40:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 0008713F861;
 Sun, 13 Jul 2025 11:40:10 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 13 Jul 2025 11:40:10 +0200
MIME-Version: 1.0
Date: Sun, 13 Jul 2025 11:40:10 +0200
To: Scott Fan <fancp2007@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250713040046.105851-1-fancp2007@gmail.com>
References: <20250713040046.105851-1-fancp2007@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <5b83e70659b9312b93bde3b1610620fe@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752399612;
 bh=8BKPIwOhXyPuzba9ydWEqCvmWK9FRpGQpSIiUuA38RQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HLlL21fXSDBZxy2roUEej7M2TofXZEr078CEGHBzvpCugjiEGUrT8oMcWIMye68Ql
 YH6hBTXAycq0b91dAJ/jVHZdcsyf5hLyK4/qQcl1CRCnHo81Y6jEMtW5e2g9y2KHAM
 zwHNU5frSRpVAaM1jKRf9A1nxX9uEyTiE6VtGxJQ7Rr3BrPtgykp+NfHevQl5YEeGL
 dQ3TgTEa+LnylQ7N0dKP2r6WPP2GDm686OcJL8PBJ1GExKRNdwBMXzN7d1PvDweiUe
 IkvQ6SNseKBLfcwbOrOcPCEZqYASl+PHQrFPxDzc20/W3OQBxQNNax1m/NgUmPRzl0
 yZhQH7hEmEV7g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=HLlL21fX
Subject: Re: [Buildroot] [PATCH] package/chrony: bump to version 4.7
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Scott,

Thanks for the patch.

On 13/07/2025 06:00, Scott Fan wrote:
> Release notes: https://chrony-project.org/news.html

We can read in this release note:
"Drop support for building without POSIX threads".

Indeed, pthread was made a hard requirement in upstream commit:
https://gitlab.com/chrony/chrony/-/commit/75bbccf518c617150ffaee30c7f229172b28353f
included in this new version.

For that reason, this bump fail to build with toolchains without
threads. See:
https://gitlab.com/jolivain/buildroot/-/pipelines/1923986229

Could you send an updated version of this patch taking into
account this new dependency please?

> Signed-off-by: Scott Fan <fancp2007@gmail.com>
> ---
>  package/chrony/chrony.hash | 4 ++--
>  package/chrony/chrony.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/chrony/chrony.hash b/package/chrony/chrony.hash
> index 25535e723e..75555fed9e 100644
> --- a/package/chrony/chrony.hash
> +++ b/package/chrony/chrony.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after checking pgp signature
> -# https://chrony-project.org/releases/chrony-4.6.1-tar-gz-asc.txt
> -sha256  
> 571ff73fbf0ae3097f0604eca2e00b1d8bb2e91affe1a3494785ff21d6199c5c  
> chrony-4.6.1.tar.gz
> +# https://chrony-project.org/releases/chrony-4.7-tar-gz-asc.txt
> +sha256  
> c0de41a8c051e5d32b101b5f7014b98ca978b18e592f30ce6840b6d4602d947b  
> chrony-4.7.tar.gz
>  # Locally calculated
>  sha256  
> ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  
> COPYING
> diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
> index 642e1d8fd6..f2aca81d60 100644
> --- a/package/chrony/chrony.mk
> +++ b/package/chrony/chrony.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -CHRONY_VERSION = 4.6.1
> +CHRONY_VERSION = 4.7
>  CHRONY_SITE = https://chrony-project.org/releases
>  CHRONY_LICENSE = GPL-2.0
>  CHRONY_LICENSE_FILES = COPYING
> --
> 2.43.0

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
