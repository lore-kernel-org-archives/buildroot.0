Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D50C4C25B75
	for <buildroot@archiver.kernel.org>; Sun, 19 May 2024 15:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7869D81EB5;
	Sun, 19 May 2024 15:06:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VB4QX7qFHrGK; Sun, 19 May 2024 15:06:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72D5E81EBA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72D5E81EBA;
	Sun, 19 May 2024 15:06:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 21F901BF578
 for <buildroot@lists.busybox.net>; Sun, 19 May 2024 15:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1BB4D81EB5
 for <buildroot@lists.busybox.net>; Sun, 19 May 2024 15:06:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qujI7WahFYX5 for <buildroot@lists.busybox.net>;
 Sun, 19 May 2024 15:06:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 362B081E1B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 362B081E1B
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 362B081E1B
 for <buildroot@busybox.net>; Sun, 19 May 2024 15:06:11 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 21E9613F899;
 Sun, 19 May 2024 17:06:05 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 19 May 2024 17:06:04 +0200
Date: Sun, 19 May 2024 17:06:04 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <ZkoVXDlT35QpsaZA@landeda>
References: <20240519133536.21349-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240519133536.21349-1-ps.report@gmx.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1716131168;
 bh=mq0b3eF1SzMvcTnC5SzTN4V2elka0bqmcu8UJ1lT0aU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r40wouk67EkvBpFSWXfMNHyNmMthxARs6UDlJf70lZG1MR0Z2Cvb0dpZ7GcGEl2mG
 0bLBovq28oiRw+q9vnDO/MUIUNsGhH0qjwavIC/+hYgGXc236nZv2ecSxiYqip44OD
 o596ABaf4pjmzE0wfaX+zNog9a5rPiG4n1RpiBHFpFcUz03k0byoipyb/t5id3uhKL
 g1Pl+EC4YLp1QgErC8WiQWrbD8TS9yCOyj1hShJyyxGw1SQeOewzanXSCRdH7Oktj4
 +dZ+2Ceo6k0v4txZe3UdixAYJF0Lx4KC226wXpMHOWBmVhtGYtO55M+bOr7lflb5FY
 pjIsLUS2O9aqQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=r40wouk6
Subject: Re: [Buildroot] [PATCH v1] package/git: security bump version to
 2.45.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@busybox.net, Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2024-05-19 15:35 +0200, Peter Seiderer via buildroot spake thusly:
> Fixes CVE-2024-32002, CVE-2024-32004, CVE-2024-32020 and CVE-2024-32021
> (for details see [1]).
> 
> [1] https://lore.kernel.org/lkml/xmqqv83g4937.fsf@gitster.g/
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/git/git.hash | 2 +-
>  package/git/git.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/git/git.hash b/package/git/git.hash
> index 2e54945a40..7dbeec714b 100644
> --- a/package/git/git.hash
> +++ b/package/git/git.hash
> @@ -1,5 +1,5 @@
>  # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
> -sha256  0aac200bd06476e7df1ff026eb123c6827bc10fe69d2823b4bf2ebebe5953429  git-2.45.0.tar.xz
> +sha256  e64d340a8e627ae22cfb8bcc651cca0b497cf1e9fdf523735544ff4a732f12bf  git-2.45.1.tar.xz
>  # Locally calculated
>  sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
>  sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
> diff --git a/package/git/git.mk b/package/git/git.mk
> index b6a7ec0cbb..04f489e038 100644
> --- a/package/git/git.mk
> +++ b/package/git/git.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GIT_VERSION = 2.45.0
> +GIT_VERSION = 2.45.1
>  GIT_SOURCE = git-$(GIT_VERSION).tar.xz
>  GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
>  GIT_LICENSE = GPL-2.0, LGPL-2.1+
> -- 
> 2.45.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
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
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
