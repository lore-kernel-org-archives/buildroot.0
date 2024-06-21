Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B507C2BB85
	for <buildroot@archiver.kernel.org>; Fri, 21 Jun 2024 20:13:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B717040298;
	Fri, 21 Jun 2024 20:13:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MzvNKyHEHNmx; Fri, 21 Jun 2024 20:13:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A5BB402A6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A5BB402A6;
	Fri, 21 Jun 2024 20:13:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9BC1A1BF344
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 20:13:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8978E40121
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 20:13:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PcyTMETsyr78 for <buildroot@lists.busybox.net>;
 Fri, 21 Jun 2024 20:13:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1A53540055
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A53540055
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1A53540055
 for <buildroot@buildroot.org>; Fri, 21 Jun 2024 20:13:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id EA4D613F8D7;
 Fri, 21 Jun 2024 22:13:23 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 21 Jun 2024 22:13:23 +0200
Date: Fri, 21 Jun 2024 22:13:23 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: a.wellbrock@mailbox.org
Message-ID: <ZnXe4zvx1Dm_Yk34@landeda>
References: <20240617180157.3771298-1-a.wellbrock@mailbox.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240617180157.3771298-1-a.wellbrock@mailbox.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1719000807;
 bh=OT2+GknWKhgt3T0BwqbIlMRBU5a9gz7jLmBT6y5nKS0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FIy0lsXQ//U70kmefGemagLh3FC1f4vfs5fxP3izrc8KEm/oONgPqS/MSPXaUCB1H
 8DzsQebCPjsPX+bhswaCP1heb30lrJb+tCXBLZAt/oxb68rExmDxUewoj7QCQBIfzH
 BQQHs8imWUilO2g7kbZgdO2Bw8ZHzeFW1G4Me89docMlh71fFBw3/STSeNoXUyfWS2
 UgfZnJJWdh2r/Tonhld9Ep/FjK4azxdHX52JDc+xJkLsXSY3bAWFiMzbXru0H/fCq4
 WCE0rQi4i1ZlXhaR5RzzzLSewXtFHOp7J6Taj+qt5Z/gdFvc3cs57y2MpLxs5HGwBM
 GRxGgWoJ1Ku5w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FIy0lsXQ
Subject: Re: [Buildroot] [PATCH 1/1] package/c-ares: update site url
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
Cc: alex <alexander.wellbrock@othermo.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2024-06-17 20:01 +0200, Alexander Wellbrock via buildroot spake thusly:
> From: alex <alexander.wellbrock@othermo.de>

This, the authorship... [0]

> Download URLs changed after hosting of the c-ares website changed
> ownership:
> https://daniel.haxx.se/blog/2024/06/06/bye-bye-hosting-c-ares-web/
> 
> This cannot be fixed upstream as github pages does not support .htaccess
> files according to:
> https://github.com/c-ares/c-ares.github.io/issues/2
> 
> Signed-off-by: Alexander Wellbrock <a.wellbrock@mailbox.org>

[0]... does not match your sign-off tag, neither in real name nor in
email.

Can you just reply to clarify this, please?

Regards,
Yann E. MORIN.

> ---
>  package/c-ares/c-ares.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
> index c4441255a2..a75a40da70 100644
> --- a/package/c-ares/c-ares.mk
> +++ b/package/c-ares/c-ares.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  C_ARES_VERSION = 1.27.0
> -C_ARES_SITE = http://c-ares.haxx.se/download
> +C_ARES_SITE = https://github.com/c-ares/c-ares/releases/download/cares-1_27_0
>  C_ARES_INSTALL_STAGING = YES
>  C_ARES_CONF_OPTS = --with-random=/dev/urandom
>  C_ARES_LICENSE = MIT
> -- 
> 2.42.2
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
