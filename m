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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0124DC433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 20:30:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F6C5610E9
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 20:30:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9F6C5610E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DF82415A7;
	Sat, 18 Sep 2021 20:30:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ANezTxwTzRKl; Sat, 18 Sep 2021 20:30:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B94F040825;
	Sat, 18 Sep 2021 20:30:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 347441BF27C
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 20:30:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2333040825
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 20:30:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kj9hFSfSv2Nk for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 20:30:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2E751406A0
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 20:30:16 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed4a:2560:2180:38b6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 05627B0053D;
 Sat, 18 Sep 2021 22:30:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631997015;
 bh=ykc0vAjRjSTFkmW7fWyJQTyrlC7abe8iaH7WGFnnPMI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uxifu+5gb0kZrsfGV9pFZmI3SKNE1vi+Q5zaXadtZj9orZ6itVwMILLLICrGAp34K
 sPLjwZpEY7jH2vBT5uinAvQ/ydhZEcrFRwqI6KhdRnq24cXQUfORw0wAeDJl4gM0hV
 tG7CCbJ4u1JnSqkqpkoeoMdVpiPb3GtHzrH2NRIiChfyXBxUx6Cv4Ahj5uvq7P2hXp
 2Ui7aqhA4xPz/mn0ZczUxzTK/7idtHtUXrvEMXPt1jjw3oUKkMRss7QxSpLPSERV/g
 1MOYUVcHU2iqtRndnPU6IHsJ7WwyBy6fB3ImSbweOGwJfUgGy91079M6lXtAU5o8+F
 yLp7NGhIvI/kA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Sep 2021 22:30:06 +0200
Date: Sat, 18 Sep 2021 22:30:06 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20210918203006.GR1053080@scaer>
References: <20210918185816.14928-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210918185816.14928-1-peter@korsgaard.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/libyang: security bump to version
 1.0.240
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
Cc: Jan Kundrat <jan.kundrat@cesnet.cz>, Heiko Thiery <heiko.thiery@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Peter, All,

On 2021-09-18 20:58 +0200, Peter Korsgaard spake thusly:
> Fixes the following security issues:
> 
> - CVE-2021-28902: In function read_yin_container() in libyang <= v1.0.225,
>   it doesn't check whether the value of retval->ext[r] is NULL.  In some
>   cases, it can be NULL, which leads to the operation of
>   retval->ext[r]->flags that results in a crash.
> 
> - CVE-2021-28903: A stack overflow in libyang <= v1.0.225 can cause a denial
>   of service through function lyxml_parse_mem().  lyxml_parse_elem()
>   function will be called recursively, which will consume stack space and
>   lead to crash.
> 
> - CVE-2021-28904: In function ext_get_plugin() in libyang <= v1.0.225, it
>   doesn't check whether the value of revision is NULL.  If revision is NULL,
>   the operation of strcmp(revision, ext_plugins[u].revision) will lead to a
>   crash.
> 
> - CVE-2021-28905: In function lys_node_free() in libyang <= v1.0.225, it
>   asserts that the value of node->module can't be NULL.  But in some cases,
>   node->module can be null, which triggers a reachable assertion (CWE-617).
> 
> - CVE-2021-28906: In function read_yin_leaf() in libyang <= v1.0.225, it
>   doesn't check whether the value of retval->ext[r] is NULL.  In some cases,
>   it can be NULL, which leads to the operation of retval->ext[r]->flags that
>   results in a crash.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libyang/libyang.hash | 2 +-
>  package/libyang/libyang.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libyang/libyang.hash b/package/libyang/libyang.hash
> index 94685cb4de..755ecf390a 100644
> --- a/package/libyang/libyang.hash
> +++ b/package/libyang/libyang.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  1b736443d2c69b5d7a71ac412655e6edab0647b18f35f7bf504b0a24e06cb046  libyang-1.0.225.tar.gz
> +sha256  8576cad398b451b1c622b0652a2030fcf83ee1d9a39e6cd93d17b0a5a43118d6  libyang-1.0.240.tar.gz
>  sha256  f942fe693e03e4e3ff67a351c00dc8f468a042e0d7273b0aa6bc53060b568112  LICENSE
> diff --git a/package/libyang/libyang.mk b/package/libyang/libyang.mk
> index ed61ec97d2..f784367ea3 100644
> --- a/package/libyang/libyang.mk
> +++ b/package/libyang/libyang.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBYANG_VERSION = 1.0.225
> +LIBYANG_VERSION = 1.0.240
>  LIBYANG_SITE = $(call github,CESNET,libyang,v$(LIBYANG_VERSION))
>  LIBYANG_LICENSE = BSD-3-Clause
>  LIBYANG_LICENSE_FILES = LICENSE
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
