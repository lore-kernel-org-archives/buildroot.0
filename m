Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C286C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 14:16:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5C1660C40
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 14:16:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D5C1660C40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 894B14013D;
	Sun,  1 Aug 2021 14:16:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DX-cgbQEtkh1; Sun,  1 Aug 2021 14:16:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A148402F5;
	Sun,  1 Aug 2021 14:16:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C751E1BF31A
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 14:11:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B711A6066E
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 14:11:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BTF4Kt-WlPVt for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 14:11:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DF31660666
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 14:11:43 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:89a2:641e:9d1f:2c0d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 52F225FF27;
 Sun,  1 Aug 2021 16:11:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1627827100;
 bh=lnjTAm0Sp3f6dZ+YjKu8fU19On9JQJar2bggw9mOpjE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Fuaxf7AIGw+Oiut4/s9pLqbgifRsMosK0VjWsJfsFEpqyNbJCHSlzAS5BM+UTcQVx
 M5Lo0rS4Gz6p0czT+iP2TXyRvAqbrUjTBET3eskpI6pS6vzKZjM4zANaGyotFttJM/
 NH9Iimfw0wS9TZDqQEdgwVHk7RPBl1knh2DYYD7BRXYn7ai5P5I1Z0/JJr6QDtLMma
 tz/dKlk7/CwQG1bj2ZbBQ5xwi6JHoyhY5BBUGWUwiyU9LIafat7WOueNmYaaPew+cK
 R0wGjQ67t1ql3WFgeasrWOPChLmXAUZK1K+PyIvtWUxS3MGAEr+wNe5PiVptYbzVDM
 kctWcqUQAitrw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 01 Aug 2021 16:11:36 +0200
Date: Sun, 1 Aug 2021 16:11:36 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210801141136.GD3189549@scaer>
References: <20210801134608.3730251-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210801134608.3730251-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/libxmlrpc: cli tool needs
 dynamic library
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fabrice, All,

On 2021-08-01 15:46 +0200, Fabrice Fontaine spake thusly:
> cli tool, added in commit bc3dc2b44ba1d80ed93f43a8d43c3d80ff548077,
> needs dynamic library
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/18a1a45a0fda7fc95e9d865b4b8a90a99494717e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libxmlrpc/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/libxmlrpc/Config.in b/package/libxmlrpc/Config.in
> index f8b8c411e1..33d512328e 100644
> --- a/package/libxmlrpc/Config.in
> +++ b/package/libxmlrpc/Config.in
> @@ -14,9 +14,13 @@ if BR2_PACKAGE_LIBXMLRPC
>  
>  config BR2_PACKAGE_LIBXMLRPC_TOOLS_XMLRPC
>  	bool "install cli tool"
> +	depends on !BR2_STATIC_LIBS
>  	help
>  	  Command line tool xmlrpc.
>  
> +comment "cli tool needs a toolchain w/ dynamic library"
> +	depends on BR2_STATIC_LIBS
> +
>  endif # BR2_PACKAGE_LIBXMLRPC
>  
>  comment "libxmlrpc needs a toolchain w/ threads"
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
