Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 390D2C4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 20:40:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2CEC60E78
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 20:40:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F2CEC60E78
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5C308274F;
	Sat, 24 Jul 2021 20:40:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i1uGf3Mvbj8t; Sat, 24 Jul 2021 20:40:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 227AF82660;
	Sat, 24 Jul 2021 20:40:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 63EE21BF27E
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 20:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 600CF60636
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 20:40:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SuUMsSk9hSsk for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 20:40:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E4375605F7
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 20:40:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4802:7ee4:40b0:1519])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 4E87178031A;
 Sat, 24 Jul 2021 22:40:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1627159227;
 bh=GY3nkPtZiB3/FHe8CViVehuMetSf1ykT4f+76hPkoZ4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mzGQzYRSTFLLjHjU0CEoLuZOnhVqP/2QYo3KI3Sbjc0ap3C3ZxV9dyAAcgWB2gNnL
 17Rer4XN476NoJvL1tFN8frxkcCDj7INewiWkywgZVhO+sibsJYervUgYP2JahwnQZ
 LgSlBYxkOO89WQ2yHvg5Y68F28jwqObCfRvb1QkzThq3hYTz/PeM6VdmjYWSIZvE+/
 OrB/9JVNYJoiM6GBGAA4ceoDieqnPZz+8ga7JNkk+hQB/0e8Cq3/XKtHkmwTdonEMY
 ZNKs4Wx2UMHfI81vbAwsSzvO+24dmGCQNLBhTo5MSc9DAIC7jviTgYt6g5N/f/lDrM
 iAxCuk4QAnFCw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 24 Jul 2021 22:40:21 +0200
Date: Sat, 24 Jul 2021 22:40:21 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Joseph Burt <caseorum@gmail.com>
Message-ID: <20210724204021.GH2382418@scaer>
References: <20210624140043.60902-1-caseorum@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210624140043.60902-1-caseorum@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/qemu: replace old configure
 param with new equivalent
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Joseph, All,

On 2021-06-24 14:00 +0000, Joseph Burt spake thusly:
> QEMU 6.0.0 replaces in [1] --(enable|disable)-git-update with
> --with-git-submodules=(update|validate|ignore). "Disable" is now "ignore".
> 
> [1] https://lore.kernel.org/qemu-devel/20201016203857.62572-1-ddstreet@canonical.com/
> 
> Signed-off-by: Joseph Burt <caseorum@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/qemu/qemu.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> index e0f722cf42..470c285f16 100644
> --- a/package/qemu/qemu.mk
> +++ b/package/qemu/qemu.mk
> @@ -198,7 +198,7 @@ define QEMU_CONFIGURE_CMDS
>  			--disable-vhost-crypto \
>  			--disable-libxml2 \
>  			--disable-capstone \
> -			--disable-git-update \
> +			--with-git-submodules=ignore \
>  			--disable-opengl \
>  			--disable-vhost-user-blk-server \
>  			--disable-virtiofsd \
> -- 
> 2.32.0
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
