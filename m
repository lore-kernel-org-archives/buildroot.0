Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD82DC433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 17:44:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D5D5610E9
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 17:44:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7D5D5610E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F360401B5;
	Sat, 18 Sep 2021 17:44:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tmF4xrBvHyHU; Sat, 18 Sep 2021 17:44:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5C1940018;
	Sat, 18 Sep 2021 17:44:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 394971BF2F8
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 17:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 287DD60661
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 17:44:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cjFLTXIzNfeP for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 17:44:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0C5F1605FB
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 17:44:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed4a:2560:2180:38b6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 9E88AB0051E;
 Sat, 18 Sep 2021 19:44:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631987074;
 bh=tYLZg6PJJ7ahktMA4u42O3NkwSQ8fF+UD3Xw3vQTblE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GR6SDRy8/qBxkCsysLUwmeUWTVYnd8UbrUsYRNeruYupVE3zAIwWKkxceN+h0QFwc
 kKGy+MqDeD5yJcJYTaJ14FUR6VsBrI6y53tlRuqmlxryucRhVN7L9P0tfYFtX0Qqip
 27eatCfVAy7C2HWU079JwXziaYdu7AKlzMvXZZbVRXqtcNd+oyaQwWTvPSv2SJfNsq
 ZBG2admou6FCwv0QLNDmFfmYEHks0AVxL4wkmabbm0AZo0u5YjjF3iz2I4p0z7bqQ4
 7IrTgL+9+Qwgd55WIluC1V9G/bbPPWkxPYVLvRsrGh2FYD2QQh4i3k61OV+OXFtZPa
 e2MMMn6H/7e5Q==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Sep 2021 19:44:25 +0200
Date: Sat, 18 Sep 2021 19:44:25 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20210918174425.GF1053080@scaer>
References: <20210918161131.10276-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210918161131.10276-1-peter@korsgaard.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/nodejs: security bump to version
 12.22.6
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Daniel Price <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Peter, All,

On 2021-09-18 18:11 +0200, Peter Korsgaard spake thusly:
> Fixes the following security issues:
> 
> - CVE-2021-37701: Arbitrary File Creation/Overwrite via insufficient symlink
>   protection due to directory cache poisoning using symbolic links
> 
> - CVE-2021-37712: Arbitrary File Creation/Overwrite via insufficient symlink
>   protection due to directory cache poisoning using symbolic links
> 
> - CVE-2021-37713: Arbitrary File Creation/Overwrite on Windows via
>   insufficient relative path sanitization
> 
> - CVE-2021-39134: UNIX Symbolic Link (Symlink) Following in @npmcli/arborist
> 
> - CVE-2021-39135: UNIX Symbolic Link (Symlink) Following in @npmcli/arborist
> 
> For more details, see the advisory:
> https://nodejs.org/en/blog/vulnerability/aug-2021-security-releases2/
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/nodejs/nodejs.hash | 4 ++--
>  package/nodejs/nodejs.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
> index 1552e937b7..8d39ef489d 100644
> --- a/package/nodejs/nodejs.hash
> +++ b/package/nodejs/nodejs.hash
> @@ -1,5 +1,5 @@
> -# From https://nodejs.org/dist/v12.22.5/SHASUMS256.txt
> -sha256  f927ff6c2ac5a7234596031b18ba03febbcadd2650d375f1a3fd02426687fd14  node-v12.22.5.tar.xz
> +# From https://nodejs.org/dist/v12.22.6/SHASUMS256.txt
> +sha256  c2022f16b8f689620c3472c2b5261fdabbd0ab976bf9ac3b7db6747a2e9b0f7a  node-v12.22.6.tar.xz
>  
>  # Hash for license file
>  sha256  221417a7ca275112a5ac54639b36ee3c5184e74631ea1e1b01b701293b655190  LICENSE
> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> index 39099b53dc..38e8936986 100644
> --- a/package/nodejs/nodejs.mk
> +++ b/package/nodejs/nodejs.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -NODEJS_VERSION = 12.22.5
> +NODEJS_VERSION = 12.22.6
>  NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
>  NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
>  NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
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
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
