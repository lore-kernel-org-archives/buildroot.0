Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C12EDCD128A
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 08:19:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72D3C4059A;
	Mon,  1 Apr 2024 08:19:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uEPZsqlv9Jeq; Mon,  1 Apr 2024 08:19:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF0BC405D5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF0BC405D5;
	Mon,  1 Apr 2024 08:19:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 30CC21BF3AD
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 08:19:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D7D1405D5
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 08:19:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LR67_0RHqbtM for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 08:19:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6BAC84059A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BAC84059A
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6BAC84059A
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 08:19:19 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id E9E5813F8C0;
 Mon,  1 Apr 2024 10:19:14 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 01 Apr 2024 10:19:14 +0200
Date: Mon, 1 Apr 2024 10:19:14 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZgpuAjc6gM-3-hT3@landeda>
References: <20240330083207.227006-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240330083207.227006-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1711959557;
 bh=T/eTzyNPRi1Nqfqt5it7mOLpA6uJ6qSl9M64YkF3Hj4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G0Gt17s+xpBRWQENl7sCEaEqYyRbF6frXoY+aPTORN8VGfrm8EUWvCxHma/9++Los
 o8nM0noB7k003lFHWDuoc4NhzArmAbTnJlvlEss02iqRjik2Mg7YqelYcseDEwtqXq
 8OjuZYej0rsf0Jzzf1vS+2YMt+ekhDkFd5iDyPX+dIOkILElUZ2JS/+V9mBcLcLHmG
 rVEG1v3TE8fak4DT9q9pghqxn66uOOrNa4WC/rNGVUjyVfe9C6cAL32oJ6Lt9+hMEu
 GJQDA9xguOzyz591wDoyQMt+KsF+Ly98f3bhzuprVMRZs/2CbgqhMR75j4RFNxJYCo
 Oubqp4rohXbCw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=G0Gt17s+
Subject: Re: [Buildroot] [PATCH 1/1] package/davfs2: fix build with neon 0.33
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

Fabrice, All,

On 2024-03-30 09:32 +0100, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since bump of neon to version
> 0.33 in commit 00f7bd06d66b05ec694f8a3e90d56e5c4f532e6b:
> 
> configure: incompatible neon library version 0.33.0: wanted 0.27 28 29 30 31 32
> configure: error: could not find neon
> 
> Fixes: 00f7bd06d66b05ec694f8a3e90d56e5c4f532e6b
>  - http://autobuild.buildroot.org/results/3386c44447b09e434c60837ddd7eb08b5ef3d9a3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...2-configure.ac-add-neon-version-0.33.patch | 27 +++++++++++++++++++
>  package/davfs2/davfs2.mk                      |  2 ++
>  2 files changed, 29 insertions(+)
>  create mode 100644 package/davfs2/0002-configure.ac-add-neon-version-0.33.patch
> 
> diff --git a/package/davfs2/0002-configure.ac-add-neon-version-0.33.patch b/package/davfs2/0002-configure.ac-add-neon-version-0.33.patch
> new file mode 100644
> index 0000000000..93eff48cd5
> --- /dev/null
> +++ b/package/davfs2/0002-configure.ac-add-neon-version-0.33.patch
> @@ -0,0 +1,27 @@
> +From 1c539d158ae73e867d0d30b8c3d27f48d742ed06 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sat, 30 Mar 2024 09:18:15 +0100
> +Subject: [PATCH] configure.ac: add neon version 0.33
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Upstream: https://savannah.nongnu.org/bugs/?65247
> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 4f86cde..ede9b1e 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -36,7 +36,7 @@ AC_PROG_LN_S
> + # Checks for libraries.
> + AM_GNU_GETTEXT_VERSION(0.19.8)
> + AM_GNU_GETTEXT([external])
> +-NE_REQUIRE_VERSIONS([0], [27 28 29 30 31 32])
> ++NE_REQUIRE_VERSIONS([0], [27 28 29 30 31 32 33])
> + DAV_CHECK_NEON
> + 
> + # Checks for header files.
> +-- 
> +2.43.0
> +
> diff --git a/package/davfs2/davfs2.mk b/package/davfs2/davfs2.mk
> index a67c506250..9f9e4a7073 100644
> --- a/package/davfs2/davfs2.mk
> +++ b/package/davfs2/davfs2.mk
> @@ -9,6 +9,8 @@ DAVFS2_SITE = http://download.savannah.nongnu.org/releases/davfs2
>  DAVFS2_LICENSE = GPL-3.0+
>  DAVFS2_LICENSE_FILES = COPYING
>  DAVFS2_CPE_ID_VENDOR = werner_baumann
> +# 0002-configure.ac-add-neon-version-0.33.patch
> +DAVFS2_AUTORECONF = YES
>  
>  DAVFS2_DEPENDENCIES = \
>  	neon \
> -- 
> 2.43.0
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
