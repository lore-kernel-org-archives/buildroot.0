Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4877BC433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 20:19:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B1B9611C3
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 20:19:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0B1B9611C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D87344156F;
	Fri, 10 Sep 2021 20:19:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eG2yQc0Qpy4M; Fri, 10 Sep 2021 20:19:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AB09407CA;
	Fri, 10 Sep 2021 20:19:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 33B0A1BF580
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 20:19:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2266640677
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 20:19:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D-3etUFhi2pX for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 20:19:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E854E4061D
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 20:19:14 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d014:579:30ce:61f5])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 2E60E2003C1;
 Fri, 10 Sep 2021 22:19:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631305153;
 bh=l3J0PxpPkdt2wjSmtA4KUI1IVlQniogjxm+zdidBdWI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XEAg55hK5M+AOQceJ6LhW0yJ5Nvm3TnzVLhwuUNEJxmK/gEL7/VM1T7c6KC8bUeTe
 x95swjHfp2NFCtbXXvjpozNtktLpXEYe5vSyxnLyn6YiFFgyjTdzz4cwyzq72V4zi3
 OpXzyymwItMBQIRGdlfP2cBHrAd3ZJZkBjOBS112Oxo4G9L5rzd1kAtJ7cDejIbEcO
 5sJ2XoYUYMG2u2Q1yKFQandLhoDv0e3i8NRKlweaI6AXXDHc4/seWzJdLcXnTySlKa
 cNdtaneC2MHWBsLq/sX+LNWmShp/ayQqb5AADmkaP+uRbueEWMDuTqV3wXrq/CwZAi
 Slqe/oKbh+5MA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 10 Sep 2021 22:19:06 +0200
Date: Fri, 10 Sep 2021 22:19:06 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210910201906.GD1053080@scaer>
References: <20210909060129.1120525-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210909060129.1120525-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/xscreensaver: needs xserver
 SELinux module
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
Cc: Simon Dawson <spdawson@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Fabrice, All,

On 2021-09-09 08:01 +0200, Fabrice Fontaine spake thusly:
> xserver is needed to fix the following build failure raised since commit
> 613827c5b0a2bf71320047954639dc9003524db0:
> 
> Compiling targeted policy.33
> env LD_LIBRARY_PATH="/data/buildroot-autobuilder/instance-0/output-1/host/lib:/data/buildroot-autobuilder/instance-0/output-1/host/usr/lib" /data/buildroot-autobuilder/instance-0/output-1/host/usr/bin/checkpolicy -c 33 -U deny -S -O -E policy.conf -o policy.33
> policy.conf:3071:ERROR 'attribute input_xevent_type is not declared' at token ';' on line 3071:
> type xscreensaver_helper_t;
> type xscreensaver_input_xevent_t, input_xevent_type, xevent_type;
> checkpolicy:  error(s) encountered while parsing configuration
> make[1]: *** [Rules.monolithic:79: policy.33] Error 1
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/2b5/2b546153ff8b9a11a5bb8475b918f220dd5b1787/build-end.log
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/xscreensaver/xscreensaver.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/xscreensaver/xscreensaver.mk b/package/xscreensaver/xscreensaver.mk
> index 4461413a5e..6c52bc1c02 100644
> --- a/package/xscreensaver/xscreensaver.mk
> +++ b/package/xscreensaver/xscreensaver.mk
> @@ -11,7 +11,7 @@ XSCREENSAVER_SITE = https://www.jwz.org/xscreensaver
>  XSCREENSAVER_LICENSE = MIT-like, GPL-2.0+
>  XSCREENSAVER_LICENSE_FILES = hacks/screenhack.h hacks/glx/chessmodels.h
>  XSCREENSAVER_CPE_ID_VENDOR = xscreensaver_project
> -XSCREENSAVER_SELINUX_MODULES = xscreensaver
> +XSCREENSAVER_SELINUX_MODULES = xscreensaver xserver
>  
>  XSCREENSAVER_DEPENDENCIES = \
>  	gdk-pixbuf \
> -- 
> 2.33.0
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
