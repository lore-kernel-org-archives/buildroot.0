Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799E7C61DBE
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 21:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3563E80B79;
	Wed, 26 Aug 2026 21:00:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BRa9rHMssgCp; Wed, 26 Aug 2026 21:00:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787778032;
	bh=mbzjhS3MnzUv0FIRWwM8ywLbgdqqBOorWpofBHm+vn0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DY3HFBcy4v2zvh5MvXZkuHJhb/uKul0xlRCczXLdcxZjTurf4eo4uJTL3n0Cjm18f
	 3R8AlKdkWdidTaAaXvW6kZzSmTNubvC2LeiW5PUp6zluFLtgOTyj7ckbu0+HmucCTM
	 frLoh5n7a/L97lNzW6yOYoBaxsDQBuN6Q9DcMQGyeQiWT723Jz2hVCrWxpsLFNRuMu
	 UyPSnkOMxs2VzAQQpgVMGe0D5U6wEjiJ3KU8qnBu31wqrUc+9a+WdxIApl/NZ33im3
	 zAs1rFwgjHy3ZnVD1ILykJA8ntRbS3TLq8o/+PV06KIykRXOW+zglO2SyEWTwFLQ0b
	 31AOdEhtmZhyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEF5180B63;
	Wed, 26 Aug 2026 21:00:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 42071323
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 21:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 33C7B80B63
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 21:00:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2NLs_iAmOFIO for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 21:00:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2CE4080780
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 21:00:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id AC24A5FFAF;
 Wed, 26 Aug 2026 23:00:25 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 26 Aug 2026 23:00:25 +0200
MIME-Version: 1.0
Date: Wed, 26 Aug 2026 23:00:25 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>
In-Reply-To: <20260825214649.3710109-1-thomas.petazzoni@bootlin.com>
References: <20260825214649.3710109-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.18
Message-ID: <584b41148a9bdb9756c21d84d9eaac48@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/bind: fix thread dependency
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

On 25/08/2026 23:46, Thomas Petazzoni via buildroot wrote:
> In commit 54f96add94901511862df18e527e456982005b8e ("package/bind:
> security bump version to 9.20.24") the depends on
> BR2_TOOLCHAIN_HAS_THREADS_NPTL was incorrectly downgraded to
> BR2_TOOLCHAIN_HAS_THREADS:
> 
> -       depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
> +       depends on BR2_TOOLCHAIN_HAS_THREADS # liburcu, libuv
> 
> This is wrong because libuv depends on
> BR2_TOOLCHAIN_HAS_THREADS_NPTL. This causes unmet dependencies:
> 
> WARNING: unmet direct dependencies detected for BR2_PACKAGE_LIBUV
>   Depends on [n]: BR2_TOOLCHAIN_HAS_THREADS_NPTL [=n] && BR2_USE_MMU 
> [=y] && !BR2_STATIC_LIBS [=n] && BR2_TOOLCHAIN_HAS_SYNC_4 [=y] && 
> BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 [=y]
>   Selected by [y]:
>   - BR2_PACKAGE_BIND [=y] && BR2_USE_MMU [=y] && 
> BR2_TOOLCHAIN_HAS_SYNC_4 [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && 
> BR2_INSTALL_LIBSTDCPP [=y] && !BR2_STATIC_LIBS [=n] && 
> BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 [=y] && 
> BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS [=y]
> 
> Fix that by switching back to the BR2_TOOLCHAIN_HAS_THREADS_NPTL
> dependency.
> 
> Fixes: 54f96add94901511862df18e527e456982005b8e ("package/bind: 
> security bump version to 9.20.24")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
