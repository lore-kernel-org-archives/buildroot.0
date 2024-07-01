Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 529B2C2BD09
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 20:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 157CC400F5;
	Mon,  1 Jul 2024 20:49:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CW6FWQW3s7Tl; Mon,  1 Jul 2024 20:49:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC7E041371
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC7E041371;
	Mon,  1 Jul 2024 20:49:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8C6A91BF361
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 20:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A4D2560ABF
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 20:49:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9RNCd_dmKbHf for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 20:49:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A20C160AA8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A20C160AA8
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A20C160AA8
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 20:49:43 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 86BD713F81D;
 Mon,  1 Jul 2024 22:49:33 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 01 Jul 2024 22:49:33 +0200
Date: Mon, 1 Jul 2024 22:49:33 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <ZoMWXfYLDtjGT8dy@landeda>
References: <20240630153126.259530-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240630153126.259530-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1719866979;
 bh=0YfofHSjLyGqElUfA4XZ+vz96mWgn9Ojsdco6urDtnQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Dm/qhxEDat8bigG5SGhHH3KplOwGi51kj3wc/UnCRWGaipZ5ELtu9jtHw8fY92Uh1
 bfR69cXCvIi5b9XhrvZ59FdyYY+DflqPeJdE3FlNyo8MswiJzNQQcr08Gu1cidWTW5
 +FHqYlIAQpbcMBa4gQOP19Lyi02fCKM9qCtzdro6r2VGs0Fgd8NCeZzFR/o9mtQRWT
 fdj16vH+BbMqmzHn9vWEAzMrn6KDgzQwR71J+uRSZSVWsmvQgD7/LvedV6VrGoWW1C
 sFZfVZjHpKDU5Jk/kdAo+dMaxem4VL9wQaQBvbyE3r6XJWDX2RfUpFzQkioUtUmxVJ
 pst+T0+g0/Rmw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Dm/qhxED
Subject: Re: [Buildroot] [PATCH 1/1] package/llvm-project/clang: update
 patch to be applied with fuzz 0
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, Daniel Lang <dalang@gmx.at>,
 Valentin Korenblit <valentinkorenblit@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2024-06-30 17:31 +0200, Bernd Kuhls spake thusly:
> Commit 8f88a644ed "support/scripts/apply-patches.sh: set the maximum
> fuzz factor to 0" reduced the fuzz factor.
> 
> Due to this change, host-clang fails to build with output:
> 
> Applying 0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch using patch:
> patching file lib/Driver/ToolChains/Gnu.cpp
> Hunk #1 FAILED at 1725.
> Hunk #2 succeeded at 2011 (offset 277 lines).
> 1 out of 2 hunks FAILED -- saving rejects to file lib/Driver/ToolChains/Gnu.cpp.rej
> 
> Rebase the patch to fix the problem.
> 
> Fixes:
> http://autobuild.buildroot.net/results/75b/75baa62275d64c699d9757f7c756fc03ea717877/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...1-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/llvm-project/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch b/package/llvm-project/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch
> index 08371154d5..ffdd5d187f 100644
> --- a/package/llvm-project/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch
> +++ b/package/llvm-project/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch
> @@ -44,7 +44,7 @@ index 2ad45097dc..90d6b5b748 100644
>  +++ b/lib/Driver/ToolChains/Gnu.cpp
>  @@ -1725,6 +1725,8 @@ void Generic_GCC::GCCInstallationDetector::init(
>   
> -     Prefixes.push_back(GCCToolchainDir);
> +     Prefixes.push_back(std::string(GCCToolchainDir));
>     } else {
>  +    StringRef GccIinstallPrefix = GCC_INSTALL_PREFIX;
>  +
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
