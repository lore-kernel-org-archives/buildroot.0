Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27ACDC433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 20:30:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BACB0610CB
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 20:30:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BACB0610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89E194156D;
	Sat, 18 Sep 2021 20:30:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ig7ZFmCavBEf; Sat, 18 Sep 2021 20:30:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7E7840825;
	Sat, 18 Sep 2021 20:30:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 83EE51BF27C
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 20:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80B76605DC
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 20:30:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OVfBqm8mwvXv for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 20:29:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9B56E6059C
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 20:29:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed4a:2560:2180:38b6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 01146B004FF;
 Sat, 18 Sep 2021 22:29:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631996998;
 bh=AYHrbe0SkZofevOaLxvFAF8g6Rz15UeUCCseyivu9So=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RCOfhimu9U/9h4NCgk01WliCvoBc/d3/wpZ2VB9VJ57dsafYwpffbzc3FbwZc9sh0
 GIKTcdJFMu35ZbexKkvX+sp7ZBImjjyvPoDyuwl5Ge1coem8vx6kNEv5lKOcEHrUkk
 ibi1Nblbffqmv7/1hfu9b30kJO+5JKposXymyOHw619yw3qIPMpTrpnK+RZ2C2190J
 wu9jtKWmFJ/Vp4l1/qHjD2YEc0UDVorvrEGeEZcKAETOZtmOKHulVsQEL/gq9Nh97V
 7q7L/BwmQlzdAkeGSezT+Ow5XSsZMSg+Dv/o0QEoVlKNfd26cB0nuvgCFTatzYEnkz
 5C+2lttHSEdGg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Sep 2021 22:29:51 +0200
Date: Sat, 18 Sep 2021 22:29:51 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20210918202951.GQ1053080@scaer>
References: <20210918180137.1766-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210918180137.1766-1-peter@korsgaard.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/fetchmail: security bump to version
 6.4.22
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Peter, All,

On 2021-09-18 20:01 +0200, Peter Korsgaard spake thusly:
> Fixes the following security issues:
> 
> - CVE-2021-39272: Fetchmail before 6.4.22 fails to enforce STARTTLS session
>   encryption in some circumstances, such as a certain situation with IMAP
>   and PREAUTH.
>   https://www.fetchmail.info/fetchmail-SA-2021-02.txt
> 
> Update COPYING hash for a clarification of the license situation with
> openssl 3.x (which is Apache 2.0 licensed):
> 
> https://gitlab.com/fetchmail/fetchmail/-/commit/8eed56c21ca5bbdf3c00aaf74d807bcad8713ba9
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/fetchmail/fetchmail.hash | 8 +++-----
>  package/fetchmail/fetchmail.mk   | 2 +-
>  2 files changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/package/fetchmail/fetchmail.hash b/package/fetchmail/fetchmail.hash
> index 30df3eb834..88deb343c4 100644
> --- a/package/fetchmail/fetchmail.hash
> +++ b/package/fetchmail/fetchmail.hash
> @@ -1,6 +1,4 @@
> -# From https://sourceforge.net/p/fetchmail/mailman/message/37327392/
> -sha256  6a459c1cafd7a1daa5cd137140da60c18c84b5699cd8e7249a79c33342c99d1d  fetchmail-6.4.21.tar.xz
> -# From https://sourceforge.net/projects/fetchmail/files/branch_6.4/
> -sha1  a264c50256c2b42d2c7893f9efae7c9a29350786  fetchmail-6.4.21.tar.xz
> +# From https://sourceforge.net/p/fetchmail/mailman/message/37350119/
> +sha256  cc6818bd59435602169fa292d6d163d56b21c7f53112829470a3aceabe612c84  fetchmail-6.4.22.tar.xz
>  # Locally computed:
> -sha256  6346b5aa04e258fa4326272ea92372d796b4382aa963535ae98a3bb5f8cd5aeb  COPYING
> +sha256  001d1b8d111a83e3bab8b4d511ea4767d37d3bd0583560fccece630df1ba8f3c  COPYING
> diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
> index 0b4cf39cbd..77d9733296 100644
> --- a/package/fetchmail/fetchmail.mk
> +++ b/package/fetchmail/fetchmail.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  FETCHMAIL_VERSION_MAJOR = 6.4
> -FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).21
> +FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).22
>  FETCHMAIL_SOURCE = fetchmail-$(FETCHMAIL_VERSION).tar.xz
>  FETCHMAIL_SITE = http://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)
>  FETCHMAIL_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
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
