Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A34AC433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 10:36:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9318831CB;
	Fri,  7 Jan 2022 10:36:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Ads1MRHI3wp; Fri,  7 Jan 2022 10:36:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA48F831C1;
	Fri,  7 Jan 2022 10:36:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5CF971BF2EC
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 10:36:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A56940157
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 10:36:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PMiHIzyzVia8 for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 10:36:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E735C400CC
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 10:36:00 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5148:b9c:d8ec:b3b5])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 44EB4780310;
 Fri,  7 Jan 2022 11:35:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641551757;
 bh=+mNzo6ZnIGm8yYGDJijO2b97XsTWFhoOKXFgvHGnLTk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VVkTn8MPDkB6LAmhBO1iLW0mD5Jl2S5EYucUNh2h876HhakyrZKPpkJvjcA7bQnyy
 NK3krkfe3tuejivq2iu9Fmo8fFo5w/LyKzTpDUWLtFyft3X3pGer/wazVa4pcXq4xK
 6CTD5br9Apk7PMzGw4vdGcXyUcsi7xhG7IPcailAUBOz3zkkVDdCpaAOoWLXo2nmq/
 tI4phCm2R2KMyw5qvNgg/O4kVpV+mUH89mxL7yZkufWeALNGZXpFYm0Rhp2mf3BfSq
 nJzGEuuuRktOQ6ASuNPOST6oBpSikpF4fo+F6i+kMub6051bxSjyqwkk2LxOVMxHCQ
 nxWy+4ZP7jzjQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 07 Jan 2022 11:35:51 +0100
Date: Fri, 7 Jan 2022 11:35:51 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220107103551.GB1268635@scaer>
References: <20220106210000.397694-1-thomas.petazzoni@bootlin.com>
 <20220106210000.397694-3-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220106210000.397694-3-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v3 02/11] package/pkg-download.mk: add
 <pkg>_DOWNLOAD_POST_PROCESS variable
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
Cc: Matt Weber <Matthew.Weber@rockwellcollins.com>,
 Patrick Havelange <patrick.havelange@essensium.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-01-06 21:59 +0100, Thomas Petazzoni spake thusly:
> This will allow packages to register than a download post-processing
> is needed. Note that this variable is intentionally not documented: it
> is an internal variable meant to be set by package infrastructures,
> not directly by packages.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/pkg-download.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index 2527ba5c60..66a415cce0 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -117,6 +117,7 @@ define DOWNLOAD
>  		-n '$($(2)_BASENAME_RAW)' \
>  		-N '$($(2)_RAWNAME)' \
>  		-o '$($(2)_DL_DIR)/$(notdir $(1))' \
> +		$(if $($(2)_DOWNLOAD_POST_PROCESS),-p '$($(2)_DOWNLOAD_POST_PROCESS)') \
>  		$(if $($(2)_GIT_SUBMODULES),-r) \
>  		$(foreach uri,$(call DOWNLOAD_URIS,$(1),$(2)),-u $(uri)) \
>  		$(QUIET) \
> -- 
> 2.33.1
> 

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
