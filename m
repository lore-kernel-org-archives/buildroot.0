Return-Path: <SRS0=sHoS=NS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92BCCC432BE
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 22:09:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 311BE60ED5
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 22:09:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 311BE60ED5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDEF8427AC;
	Fri, 27 Aug 2021 22:09:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kvSNh5M-7oW9; Fri, 27 Aug 2021 22:09:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06FD2406D3;
	Fri, 27 Aug 2021 22:09:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AB5731BF3D4
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 22:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9AF1A406D1
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 22:09:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9E4ODrKv7vdG for <buildroot@lists.busybox.net>;
 Fri, 27 Aug 2021 22:08:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E2D02404DA
 for <buildroot@buildroot.org>; Fri, 27 Aug 2021 22:08:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a574:2179:f8:908b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 85669B0052C;
 Sat, 28 Aug 2021 00:08:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1630102132;
 bh=jSBwf6gzkajKaSYu8gV75VogXfa+JGak4tVlLbpyjDA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FmpanUO7EJAuRzakh/pKyvepwpIn2Lihq4z+20K5zjleYElEibcDzhVFucNl/8NJ4
 1SAzQj8b4mtXOEde3If7Eg9JR3jKqPcADvtmmCxJh57hj0TNl626KQVoJSxgKOC2lb
 v6J0DUtrqeuSQYxnqDa04il+GD5KezmAh/7s4dazh9g+CTomFYgObIyllkDCjxbSd8
 p/HdG0+HAPjDpT1HMVo3IqU3lYBU8Bf1P1mqQcRJkwGpx+8GgoK/4JWgQNYa3iMeKw
 1WrtVHaqHcrGDEFHWTVmHzJidDsUWtqRF69gHlxc/s3IkK2Dmqi12x+mvEU6UmWbk/
 OgGQ2hw5qwBVg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 28 Aug 2021 00:08:46 +0200
Date: Sat, 28 Aug 2021 00:08:46 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210827220846.GH2661@scaer>
References: <20210827214738.49557-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210827214738.49557-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/mtd: add ubihealthd missing
 comment
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fabrice, All,

On 2021-08-27 23:47 +0200, Fabrice Fontaine spake thusly:
> Commit 42a3fee35e67d8d946f52a82bfa88ee6fd9f04b6 forgot to add comment on
> headers 3.17+

Good catch!

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mtd/Config.in | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/mtd/Config.in b/package/mtd/Config.in
> index d0ca3ba663..c45dd1e2b7 100644
> --- a/package/mtd/Config.in
> +++ b/package/mtd/Config.in
> @@ -148,6 +148,9 @@ config BR2_PACKAGE_MTD_UBIHEALTHD
>  	default y
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # getrandom()
>  
> +comment "ubihealthd needs a toolchain w/ headers >= 3.17"
> +	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
> +
>  config BR2_PACKAGE_MTD_UBIMKVOL
>  	bool "ubimkvol"
>  	default y
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
