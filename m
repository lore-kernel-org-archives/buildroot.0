Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC354C19F28
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 17:07:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 586C7610B3;
	Wed,  3 Aug 2022 17:07:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 586C7610B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vSal3Gp0rvR4; Wed,  3 Aug 2022 17:07:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 796FF60D64;
	Wed,  3 Aug 2022 17:07:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 796FF60D64
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F3CB51BF281
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 17:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CDCCD4091F
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 17:07:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDCCD4091F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9xlNv9RqVdAK for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 17:07:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECC07408ED
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ECC07408ED
 for <buildroot@buildroot.org>; Wed,  3 Aug 2022 17:07:49 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c944:63a3:5f2a:bb6f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 6F6607804FF;
 Wed,  3 Aug 2022 19:07:43 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 03 Aug 2022 19:07:43 +0200
Date: Wed, 3 Aug 2022 19:07:43 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Quentin Schulz <foss+buildroot@0leil.net>
Message-ID: <20220803170743.GA3274256@scaer>
References: <20220802123559.2514433-1-foss+buildroot@0leil.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220802123559.2514433-1-foss+buildroot@0leil.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1659546466;
 bh=DhMhmFiIRIB2ERMsUnDxbfYF8oP/UrnDN59/dk6fvyk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S+jKZqmZcbkZIHHy7JXqdO8WwmIySrji0ocKgVyD19LfT3yVsSsdgtUx1I5CDHik3
 sqSazpDlAL2T3G0btbZ+E/Wa17Dn87ue9b2LX/PkPoiNdU2kSC7qVjftiIK71PAI06
 P0t4Muvyb53dy+EuoYJcgpFoNS5W8ZEqmCMluzGxoDHCtYGgmJ5p+h91Xon6BWhX0h
 nYDyCR6VII9SUSgIejdZnDJRaJA8hpz0gwhomxOjAhpkTzLLx6BB0/OnJ1c+6WRHz4
 Y61F4rp64Ai/aHvHS2fBVEAoN/HO3MH6qYUSYzYguRxghzzcX8c0Jia2KvV93TFyYE
 yBhV83U7tr2Eg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=S+jKZqmZ
Subject: Re: [Buildroot] [PATCH] Makefile: error out printvars target when
 VARS is empty or unset
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
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Quentin, All,

On 2022-08-02 14:35 +0200, Quentin Schulz spake thusly:
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> 
> printvars returns nothing when VARS is not passed or empty. This is done
> on purpose, see commit fd5bd12379dc ("Makefile: printvars: don't print
> anything when VARS is not set").
> 
> An error message making explicit what is required from the user in order
> to use printvars is however better than silently doing nothing.
> 
> This adds a check for a non-empty VARS variable.
> 
> Cc: Quentin Schulz <foss+buildroot@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  Makefile | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index a743e42f91..3cbcfa9196 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1058,6 +1058,10 @@ endif
>  # to workaround a bug in make 4.3; see https://savannah.gnu.org/bugs/?59093
>  .PHONY: printvars
>  printvars:
> +ifndef VARS
> +	@echo "Please pass a non-empty VARS to 'make printvars'"
> +	@exit 1
> +endif
>  	@:
>  	$(foreach V, \
>  		$(sort $(foreach X, $(.VARIABLES), $(filter $(VARS),$(X)))), \
> -- 
> 2.37.1
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
