Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7023EC433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 08:23:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 021726108B
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 08:23:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 021726108B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4724400A8;
	Sat, 11 Sep 2021 08:23:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a0GLC5sDjDEH; Sat, 11 Sep 2021 08:23:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD84D401BC;
	Sat, 11 Sep 2021 08:23:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8B0111BF3C2
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 08:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 790A4401BC
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 08:23:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n05ylq9e6XX0 for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 08:23:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 50186400A8
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 08:23:39 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6c4a:f4f1:e14a:6e93])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 12672B0055E;
 Sat, 11 Sep 2021 10:23:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631348616;
 bh=PDZbZccRV/z3wI+Ktifkxp3lCrD+tVC9kQQ74lFTz1s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cOjrXypj6emQij44Mry/AchCU6FxfvsSgxq38vgoVzE6xjP/02xOgkW2zqtDPMUV8
 57b+UNvDu4kiJDC6P6VBxoAe/+9dG21c64DbSqSfttwTe6DKcwiP694+ZdSNZecX9K
 egELH5YeeayQmLA1uBfkhmUxpcFASDyg7sipFkmKCXaUMsZQSeZ5r0nXawc4e0SN2z
 JCWVT0WmvcC19el11DI/3UOIyUXD7C72jlOc8o04YQFYtZRaApP0wXn31UDuM9pQkE
 w72Jm7lk7x6ZGcRztmsmnliD+OJ3YwtrAJUZCSoVrKiYvPnIduTUCXTeI8Mz1hvqQh
 m2VfdWamm3ypQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 11 Sep 2021 10:23:31 +0200
Date: Sat, 11 Sep 2021 10:23:31 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210911082331.GH1053080@scaer>
References: <20210910210532.632503-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210910210532.632503-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/openssl: fix spurious spaces
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Fabrice, All,

On 2021-09-10 23:05 +0200, Fabrice Fontaine spake thusly:
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/openssl/Config.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/openssl/Config.in b/package/openssl/Config.in
> index f69e85978f..f79bac28fa 100644
> --- a/package/openssl/Config.in
> +++ b/package/openssl/Config.in
> @@ -55,8 +55,8 @@ config BR2_PACKAGE_HAS_OPENSSL
>  
>  config BR2_PACKAGE_PROVIDES_OPENSSL
>  	string
> -	default "libopenssl"  if BR2_PACKAGE_LIBOPENSSL
> -	default "libressl"  if BR2_PACKAGE_LIBRESSL
> +	default "libopenssl" if BR2_PACKAGE_LIBOPENSSL
> +	default "libressl" if BR2_PACKAGE_LIBRESSL

Applied to master, thanks.
Some easy flexing of the brain muscles in the morning. ;-)

Regards,
Yann E. MORIN.

>  endif
>  
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
