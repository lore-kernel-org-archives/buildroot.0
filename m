Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B07B7C433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 11:30:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 712D861205
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 11:30:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 712D861205
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 382EC402B5;
	Sun, 19 Sep 2021 11:30:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SbUtCGwux_uz; Sun, 19 Sep 2021 11:30:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0211402BD;
	Sun, 19 Sep 2021 11:30:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D918C1BF2BF
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 11:29:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF4DC402AA
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 11:29:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fcVOrbXs8p52 for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 11:29:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 949EB40293
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 11:29:42 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:35ad:6fdd:a5c5:c816])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id CADD420039C;
 Sun, 19 Sep 2021 13:29:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1632050981;
 bh=rnFltCAzaz+L2TmI9P5Ju6np69fHSV4lMRbNwTuSXwM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dc290dPLKms436tYzua9tor7FMTA/weK3kdrwiUGDX7qq1Hiy8lPh9nQng6JSHolN
 JvOZTZ56jlmCDQQYQ6R1o7zJwwpPeBzlTxtncEh2ZVWxyYMr46LAqr9CNCoM6NGjwV
 dIIiQ0Bb/uDJUaCcIAqFBXfcNcGV7g2r1CIhT4iWfBZId5Y0g6I2UokMJiQCFY3jWJ
 JSzRutMEdbwjYKsTuoEZaOZYGNg5YUZvgXHrEdo9LkXKGgyrp1Ciud6YxE5HyllHvz
 1uiebIwzLqBE7+C4i8nSZ0J1RuMfbpDc/AOi0ywx+938cjxCsxqpH2bwi39JAAFsDD
 4VALLK8jGJuTA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 19 Sep 2021 13:29:34 +0200
Date: Sun, 19 Sep 2021 13:29:34 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210919112934.GR1053080@scaer>
References: <20210919100029.2063495-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210919100029.2063495-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/tclap: bump to version 1.2.4
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Fabrice, All,

On 2021-09-19 12:00 +0200, Fabrice Fontaine spake thusly:
> Update indentation in hash file (two spaces)
> 
> https://sourceforge.net/p/tclap/code/ci/v1.2.4/tree/ChangeLog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/tclap/tclap.hash | 4 ++--
>  package/tclap/tclap.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/tclap/tclap.hash b/package/tclap/tclap.hash
> index 2b2097be97..fdfd46a2e4 100644
> --- a/package/tclap/tclap.hash
> +++ b/package/tclap/tclap.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256	f5013be7fcaafc69ba0ce2d1710f693f61e9c336b6292ae4f57554f59fde5837  tclap-1.2.2.tar.gz
> -sha256	cd81a61d47aeb1ed63036ca260baee37719923bbd7ebd988ec4edae128f3b6eb  COPYING
> +sha256  634c5b59dbb1ccbc9d6a5f6de494a257e29a3f59dcb6fc30445ff39b45188574  tclap-1.2.4.tar.gz
> +sha256  cd81a61d47aeb1ed63036ca260baee37719923bbd7ebd988ec4edae128f3b6eb  COPYING
> diff --git a/package/tclap/tclap.mk b/package/tclap/tclap.mk
> index e1856420f3..d7f96bd034 100644
> --- a/package/tclap/tclap.mk
> +++ b/package/tclap/tclap.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TCLAP_VERSION = 1.2.2
> +TCLAP_VERSION = 1.2.4
>  TCLAP_SITE = http://downloads.sourceforge.net/project/tclap
>  TCLAP_LICENSE = MIT
>  TCLAP_LICENSE_FILES = COPYING
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
