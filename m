Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BDBCC4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 08:02:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E61FD60F13
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 08:02:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E61FD60F13
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B57F2830AB;
	Sun, 25 Jul 2021 08:02:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cXvzovsj08YW; Sun, 25 Jul 2021 08:02:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B85382EF1;
	Sun, 25 Jul 2021 08:02:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 53C7E1BF37B
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 08:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43AF382EF1
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 08:02:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PoCcWVxKX9xD for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 08:02:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 63AAF82EB6
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 08:02:52 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4802:7ee4:40b0:1519])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 638BD78035D;
 Sun, 25 Jul 2021 10:02:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1627200170;
 bh=vSd1zrA+/J3w6TnlN5/R5l7b6SDoHiKa3Wj7dpwNNQE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nAuPGYsGh5e8nn/oz2BxmHh2W7KuTDtIiHEFe7Wms07bMaEUe3kgs7yz4kGnB2oZ7
 OuQ6S3oC/CMl3z0txt5rHUhIRnSJfgPkBQGAlMNCpGTb8Ngg7xItyxW9TlvuoPHuMI
 0WYeuuQ06XPybp3sFuVs0OoZ2Z33TOAnbsWPTX3mXcMRca/74oQ3mIrB0s7BFWHXIe
 LGw0BvKkHE+N1R7pTEET8UzCgu0olZO2wDNGffx0e2Fm6hnb0hG8y3ITY+A2K92ESl
 P+gdREL7kLO/sKdgUSjxAkzHhwm9lKkFBkrZBZWUSXu4LxKO+3PP8RyI9wRno7Cc2x
 hKnYcDcxSWV2w==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 25 Jul 2021 10:02:42 +0200
Date: Sun, 25 Jul 2021 10:02:42 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210725080242.GQ2382418@scaer>
References: <20210725072437.851215-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210725072437.851215-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/gtest: fix legal info
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Michael Nosthoff <buildroot@heine.tech>, Stephan Hoffmann <sho@relinux.de>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fabrice, All,

On 2021-07-25 09:24 +0200, Fabrice Fontaine spake thusly:
> Commit 9dfbbbb4105c47602da048c9bb9499fb8862e768 forgot to removed
> googletest from GTEST_LICENSE_FILES
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/848238f9f99bee6919b1b71acd078835e94a8501
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/gtest/gtest.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
> index 3e8220cddf..29c85e698f 100644
> --- a/package/gtest/gtest.mk
> +++ b/package/gtest/gtest.mk
> @@ -9,7 +9,7 @@ GTEST_SITE = $(call github,google,googletest,release-$(GTEST_VERSION))
>  GTEST_INSTALL_STAGING = YES
>  GTEST_INSTALL_TARGET = NO
>  GTEST_LICENSE = BSD-3-Clause
> -GTEST_LICENSE_FILES = googletest/LICENSE
> +GTEST_LICENSE_FILES = LICENSE
>  GTEST_CPE_ID_VENDOR = google
>  GTEST_CPE_ID_PRODUCT = google_test
>  
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
